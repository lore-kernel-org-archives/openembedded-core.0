Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 74F4F75A60
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Aug 2015 22:02:38 +0000 (UTC)
Received: by iggf3 with SMTP id f3so42346009igg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Aug 2015 15:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Dvkg//BaohldpcIpQA8w/eClMW+jXqGDJxYhETZ2LMw=;
	b=LzuFdKijzq8kQ3dmXy4wq2mauzFvvnTmQCUc3Vafc+TWCvhBZT/rpdhRV04WKeskob
	wIh3/vFwcoyhpech+XJdeMJubp1Z7lOkIhZFZIE1Fc7vcjxGA46zO6oy7Y2lx5+cRrq1
	4+xKUXhMTyvsRPf91clIkCkkX0rnGHr2tgRUgiHCiB8Er9HpGIEmg3sdBK3El1bInj4H
	r2fGqNdTLZGDIc233uEfa/mBC0JIFX1qM3lMN89682/hnY8biUo87V5Leaaw/LA5xnBm
	24zjL0E4P7j6lzlwRsEikc3Gq8zpGRhI40dDO1UUtTEyHHzJU6dqS+/vsrdZ/SxNe7/I
	o/fw==
X-Received: by 10.50.73.165 with SMTP id m5mr203136igv.60.1438812157464;
	Wed, 05 Aug 2015 15:02:37 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79]) by smtp.gmail.com with ESMTPSA id
	j83sm3061052iod.25.2015.08.05.15.02.36
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 05 Aug 2015 15:02:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Aug 2015 15:02:28 -0700
Message-Id: <a55617e9e7b172b8d2fbb77ea6d37f97fb35be00.1438811921.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1438811921.git.raj.khem@gmail.com>
References: <cover.1438811921.git.raj.khem@gmail.com>
Subject: [PATCH 1/2] glibc: Upgrade 2.21 -> 2.22
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
X-List-Received-Date: Wed, 05 Aug 2015 22:02:40 -0000

- git'ify the OE patches
- add_resource_h_to_wait_h.patch - dropped, we do not support that old
  perf anymore
- mips-rld-map-check.patch - Dropped because binutils is fixed for it
  see https://sourceware.org/ml/binutils/2011-12/msg00112.html
- initgroups_keys.patch - Folded into
  0026-eglibc-Forward-port-eglibc-options-groups-support.patch

Change-Id: Ib8e731b212f52b8ff12e2180babbc19970fb1ef1
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc        |    2 +-
 ...tive_2.21.bb => cross-localedef-native_2.22.bb} |   35 +-
 ...glibc-initial_2.21.bb => glibc-initial_2.22.bb} |    0
 .../{glibc-locale_2.21.bb => glibc-locale_2.22.bb} |    0
 .../{glibc-mtrace_2.21.bb => glibc-mtrace_2.22.bb} |    0
 ...glibc-scripts_2.21.bb => glibc-scripts_2.22.bb} |    0
 ...ibc-Look-for-host-system-ld.so.cache-as-.patch} |   36 +-
 ...ibc-Fix-buffer-overrun-with-a-relocated-.patch} |   21 +-
 ...ibc-Raise-the-size-of-arrays-containing-.patch} |  126 +-
 ...tps-sourceware.org-ml-libc-ports-2007-12-.patch |   34 +
 ...00-e5500-e6500-603e-fsqrt-implementation.patch} |  222 +-
 ...-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch |   33 +
 ...Fix-undefined-reference-to-__sqrt_finite.patch} |  192 +-
 ...rt-f-are-now-inline-functions-and-call-o.patch} |  270 +-
 ...ug-1443-which-explains-what-the-patch-do.patch} |   34 +-
 ...-libm-err-tab.pl-with-specific-dirs-in-S.patch} |   19 +-
 ...rt-f-are-now-inline-functions-and-call-o.patch} |   36 +-
 ...rsion-output-matching-grok-gold-s-output.patch} |   34 +-
 ...-configure.ac-handle-correctly-libc_cv_ro.patch |   42 +
 ...ibute.patch => 0014-Add-unused-attribute.patch} |   14 +-
 ...ng-SSE-also-make-sure-that-fpmath-is-not.patch} |    6 +-
 ...hin-the-path-sets-wrong-config-variables.patch} |   30 +-
 ...timezone-re-written-tzselect-as-posix-sh.patch} |   31 +-
 ...-Cross-building-and-testing-instructions.patch} |  143 +-
 ...-Eglibc-option-group-infrastructure-to-g.patch} |  607 ++-
 ...20-eglibc-Help-bootstrap-cross-toolchain.patch} |   67 +-
 ...y-picked-from-http-www.eglibc.org-archiv.patch} |   30 +-
 ... 0022-eglibc-Clear-cache-lines-on-ppc8xx.patch} |   33 +-
 ...023-eglibc-Resolve-__fpscr_values-on-SH4.patch} |   48 +-
 ...rward-port-eglibc-options-groups-support.patch} | 5521 ++++++++++----------
 ...atch => 0025-eglibc-Install-PIC-archives.patch} |   44 +-
 ...bug_mask-is-controlled-by-__OPTION_EGLIB.patch} |  647 +--
 ...option-groups-Conditionally-exclude-c-tes.patch |  144 +
 ...81-resolv-nss_dns-dns-host.c-buffer-overf.patch |   43 -
 .../glibc/Fix-__memcpy_chk-on-non-SSE2-CPUs.patch  |   36 -
 .../glibc/glibc/IO-acquire-lock-fix.patch          |   17 -
 .../glibc/glibc/add_resource_h_to_wait_h.patch     |   20 -
 .../glibc/glibc/elf-Makefile-fix-a-typo.patch      |   36 -
 .../glibc/glibc/fix-tibetian-locales.patch         |   38 -
 .../glibc/glibc/fix_am_rootsbindir.patch           |   29 -
 .../recipes-core/glibc/glibc/initgroups_keys.patch |   20 -
 meta/recipes-core/glibc/glibc/makesyscall.patch    |   51 -
 .../glibc/glibc/mips-rld-map-check.patch           |   27 -
 .../glibc/glibc/multilib_readlib.patch             |   19 -
 .../glibc/{glibc_2.21.bb => glibc_2.22.bb}         |   93 +-
 45 files changed, 4660 insertions(+), 4270 deletions(-)
 rename meta/recipes-core/glibc/{cross-localedef-native_2.21.bb => cross-localedef-native_2.22.bb} (50%)
 rename meta/recipes-core/glibc/{glibc-initial_2.21.bb => glibc-initial_2.22.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-locale_2.21.bb => glibc-locale_2.22.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-mtrace_2.21.bb => glibc-mtrace_2.22.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-scripts_2.21.bb => glibc-scripts_2.22.bb} (100%)
 rename meta/recipes-core/glibc/glibc/{ld-search-order.patch => 0001-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch} (70%)
 rename meta/recipes-core/glibc/glibc/{relocatable_sdk_fix_openpath.patch => 0002-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch} (64%)
 rename meta/recipes-core/glibc/glibc/{relocatable_sdk.patch => 0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch} (63%)
 create mode 100644 meta/recipes-core/glibc/glibc/0004-Backport-https-sourceware.org-ml-libc-ports-2007-12-.patch
 rename meta/recipes-core/glibc/glibc/{glibc.fix_sqrt2.patch => 0005-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch} (86%)
 create mode 100644 meta/recipes-core/glibc/glibc/0006-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
 rename meta/recipes-core/glibc/glibc/{ppc-sqrt_finite.patch => 0007-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch} (40%)
 rename meta/recipes-core/glibc/glibc/{ppc_slow_ieee754_sqrt.patch => 0008-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch} (53%)
 rename meta/recipes-core/glibc/glibc/{0001-R_ARM_TLS_DTPOFF32.patch => 0009-Quote-from-bug-1443-which-explains-what-the-patch-do.patch} (78%)
 rename meta/recipes-core/glibc/glibc/{0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch => 0010-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch} (69%)
 rename meta/recipes-core/glibc/glibc/{ppce6500-32b_slow_ieee754_sqrt.patch => 0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch} (46%)
 rename meta/recipes-core/glibc/glibc/{grok_gold.patch => 0012-Make-ld-version-output-matching-grok-gold-s-output.patch} (62%)
 create mode 100644 meta/recipes-core/glibc/glibc/0013-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
 rename meta/recipes-core/glibc/glibc/{0001-Add-unused-attribute.patch => 0014-Add-unused-attribute.patch} (78%)
 rename meta/recipes-core/glibc/glibc/{0001-When-disabling-SSE-also-make-sure-that-fpmath-is-not.patch => 0015-When-disabling-SSE-also-make-sure-that-fpmath-is-not.patch} (83%)
 rename meta/recipes-core/glibc/glibc/{0001-yes-within-the-path-sets-wrong-config-variables.patch => 0016-yes-within-the-path-sets-wrong-config-variables.patch} (87%)
 rename meta/recipes-core/glibc/glibc/{timezone-re-written-tzselect-as-posix-sh.patch => 0017-timezone-re-written-tzselect-as-posix-sh.patch} (53%)
 rename meta/recipes-core/glibc/glibc/{eglibc.patch => 0018-eglibc-Cross-building-and-testing-instructions.patch} (83%)
 rename meta/recipes-core/glibc/glibc/{option-groups.patch => 0019-eglibc-Bring-Eglibc-option-group-infrastructure-to-g.patch} (94%)
 rename meta/recipes-core/glibc/glibc/{eglibc-header-bootstrap.patch => 0020-eglibc-Help-bootstrap-cross-toolchain.patch} (52%)
 rename meta/recipes-core/glibc/glibc/{eglibc-resolv-dynamic.patch => 0021-eglibc-cherry-picked-from-http-www.eglibc.org-archiv.patch} (65%)
 rename meta/recipes-core/glibc/glibc/{eglibc-ppc8xx-cache-line-workaround.patch => 0022-eglibc-Clear-cache-lines-on-ppc8xx.patch} (68%)
 rename meta/recipes-core/glibc/glibc/{eglibc-sh4-fpscr_values.patch => 0023-eglibc-Resolve-__fpscr_values-on-SH4.patch} (50%)
 rename meta/recipes-core/glibc/glibc/{eglibc-use-option-groups.patch => 0024-eglibc-Forward-port-eglibc-options-groups-support.patch} (90%)
 rename meta/recipes-core/glibc/glibc/{eglibc-install-pic-archives.patch => 0025-eglibc-Install-PIC-archives.patch} (80%)
 rename meta/recipes-core/glibc/glibc/{GLRO_dl_debug_mask.patch => 0026-eglibc-dl_debug_mask-is-controlled-by-__OPTION_EGLIB.patch} (68%)
 create mode 100644 meta/recipes-core/glibc/glibc/0027-eglibc-use-option-groups-Conditionally-exclude-c-tes.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-1781-resolv-nss_dns-dns-host.c-buffer-overf.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/Fix-__memcpy_chk-on-non-SSE2-CPUs.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/IO-acquire-lock-fix.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/add_resource_h_to_wait_h.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/elf-Makefile-fix-a-typo.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/fix-tibetian-locales.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/fix_am_rootsbindir.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/initgroups_keys.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/makesyscall.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/mips-rld-map-check.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/multilib_readlib.patch
 rename meta/recipes-core/glibc/{glibc_2.21.bb => glibc_2.22.bb} (58%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 0abf803..7f942b6 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -26,7 +26,7 @@ GCCVERSION ?= "4.9%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.25"
 GDBVERSION ?= "7.9%"
-GLIBCVERSION ?= "2.21"
+GLIBCVERSION ?= "2.22"
 UCLIBCVERSION ?= "0.9.33+git%"
 LINUXLIBCVERSION ?= "4.1"
 
diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.21.bb b/meta/recipes-core/glibc/cross-localedef-native_2.22.bb
similarity index 50%
rename from meta/recipes-core/glibc/cross-localedef-native_2.21.bb
rename to meta/recipes-core/glibc/cross-localedef-native_2.22.bb
index 4e15f02..69e3ac2 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.21.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.22.bb
@@ -14,27 +14,30 @@ inherit autotools
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/${PN}:${FILE_DIRNAME}/glibc:"
 
-BRANCH = "release/${PV}/master"
+BRANCH ?= "release/${PV}/master"
+GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
 
-SRC_URI = "git://sourceware.org/git/glibc.git;branch=${BRANCH};name=glibc \
+SRC_URI = "${GLIBC_GIT_URI};branch=${BRANCH};name=glibc \
            git://github.com/kraj/localedef;branch=master;name=localedef;destsuffix=git/localedef \
            file://fix_for_centos_5.8.patch \
            ${EGLIBCPATCHES} \
-          "
+"
 EGLIBCPATCHES = "\
-           file://timezone-re-written-tzselect-as-posix-sh.patch \
-           file://eglibc.patch \
-           file://option-groups.patch \
-           file://GLRO_dl_debug_mask.patch \
-           file://eglibc-header-bootstrap.patch \
-           file://eglibc-resolv-dynamic.patch \
-           file://eglibc-ppc8xx-cache-line-workaround.patch \
-           file://eglibc-sh4-fpscr_values.patch \
-           file://eglibc-use-option-groups.patch \
-          "
-
-SRCREV_glibc = "4e42b5b8f89f0e288e68be7ad70f9525aebc2cff"
-SRCREV_localedef = "c833367348d39dad7ba018990bfdaffaec8e9ed3"
+           file://0017-timezone-re-written-tzselect-as-posix-sh.patch \
+           file://0018-eglibc-Cross-building-and-testing-instructions.patch \
+           file://0019-eglibc-Bring-Eglibc-option-group-infrastructure-to-g.patch \
+           file://0020-eglibc-Help-bootstrap-cross-toolchain.patch \
+           file://0021-eglibc-cherry-picked-from-http-www.eglibc.org-archiv.patch \
+           file://0022-eglibc-Clear-cache-lines-on-ppc8xx.patch \
+           file://0023-eglibc-Resolve-__fpscr_values-on-SH4.patch \
+           file://0024-eglibc-Forward-port-eglibc-options-groups-support.patch \
+           file://0025-eglibc-Install-PIC-archives.patch \
+           file://0026-eglibc-dl_debug_mask-is-controlled-by-__OPTION_EGLIB.patch \
+           file://0027-eglibc-use-option-groups-Conditionally-exclude-c-tes.patch \
+"
+
+SRCREV_glibc ?= "${AUTOREV}"
+SRCREV_localedef ?= "c833367348d39dad7ba018990bfdaffaec8e9ed3"
 
 # Makes for a rather long rev (22 characters), but...
 #
diff --git a/meta/recipes-core/glibc/glibc-initial_2.21.bb b/meta/recipes-core/glibc/glibc-initial_2.22.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-initial_2.21.bb
rename to meta/recipes-core/glibc/glibc-initial_2.22.bb
diff --git a/meta/recipes-core/glibc/glibc-locale_2.21.bb b/meta/recipes-core/glibc/glibc-locale_2.22.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-locale_2.21.bb
rename to meta/recipes-core/glibc/glibc-locale_2.22.bb
diff --git a/meta/recipes-core/glibc/glibc-mtrace_2.21.bb b/meta/recipes-core/glibc/glibc-mtrace_2.22.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-mtrace_2.21.bb
rename to meta/recipes-core/glibc/glibc-mtrace_2.22.bb
diff --git a/meta/recipes-core/glibc/glibc-scripts_2.21.bb b/meta/recipes-core/glibc/glibc-scripts_2.22.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-scripts_2.21.bb
rename to meta/recipes-core/glibc/glibc-scripts_2.22.bb
diff --git a/meta/recipes-core/glibc/glibc/ld-search-order.patch b/meta/recipes-core/glibc/glibc/0001-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
similarity index 70%
rename from meta/recipes-core/glibc/glibc/ld-search-order.patch
rename to meta/recipes-core/glibc/glibc/0001-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
index f518bc7..472f0f3 100644
--- a/meta/recipes-core/glibc/glibc/ld-search-order.patch
+++ b/meta/recipes-core/glibc/glibc/0001-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
@@ -1,3 +1,9 @@
+From 8dfee8990cf282d1a54d67061af103e6cf0f5cb7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 18 Mar 2015 01:48:24 +0000
+Subject: [PATCH 01/27] nativesdk-glibc: Look for host system ld.so.cache as
+ well
+
 Upstream-Status: Inappropriate [embedded specific]
 
 The default lib search path order is:
@@ -7,23 +13,28 @@ The default lib search path order is:
   3) ld.so.cache
   4) default search paths embedded in the linker
 
-For nativesdk binaries which are being used alongside binaries on a host system, we 
+For nativesdk binaries which are being used alongside binaries on a host system, we
 need the search paths to firstly search the shipped nativesdk libs but then also
 cover the host system. For example we want the host system's libGL and this may be
-in a non-standard location like /usr/lib/mesa. The only place the location is know 
+in a non-standard location like /usr/lib/mesa. The only place the location is know
 about is in the ld.so.cache of the host system.
 
-Since nativesdk has a simple structure and doesn't need to use a cache itself, we 
-repurpose the cache for use as a last resort in finding host system binaries. This 
+Since nativesdk has a simple structure and doesn't need to use a cache itself, we
+repurpose the cache for use as a last resort in finding host system binaries. This
 means we need to switch the order of 3 and 4 above to make this work effectively.
 
 RP 14/10/2010
 
-Index: git/elf/dl-load.c
-===================================================================
---- git.orig/elf/dl-load.c	2014-08-28 17:32:46.292070587 -0700
-+++ git/elf/dl-load.c	2014-08-28 17:33:56.048070587 -0700
-@@ -2050,7 +2050,14 @@
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ elf/dl-load.c | 17 ++++++++---------
+ 1 file changed, 8 insertions(+), 9 deletions(-)
+
+diff --git a/elf/dl-load.c b/elf/dl-load.c
+index 0c052e4..f45085a 100644
+--- a/elf/dl-load.c
++++ b/elf/dl-load.c
+@@ -2040,7 +2040,14 @@ _dl_map_object (struct link_map *loader, const char *name,
  	fd = open_path (name, namelen, mode,
  			&loader->l_runpath_dirs, &realname, &fb, loader,
  			LA_SER_RUNPATH, &found_other_class);
@@ -39,7 +50,7 @@ Index: git/elf/dl-load.c
  #ifdef USE_LDCONFIG
        if (fd == -1
  	  && (__glibc_likely ((mode & __RTLD_SECURE) == 0)
-@@ -2113,14 +2120,6 @@
+@@ -2099,14 +2106,6 @@ _dl_map_object (struct link_map *loader, const char *name,
  	}
  #endif
  
@@ -52,5 +63,8 @@ Index: git/elf/dl-load.c
 -			&realname, &fb, l, LA_SER_DEFAULT, &found_other_class);
 -
        /* Add another newline when we are tracing the library loading.  */
-       if (__glibc_unlikely (GLRO_dl_debug_mask & DL_DEBUG_LIBS))
+       if (__glibc_unlikely (GLRO(dl_debug_mask) & DL_DEBUG_LIBS))
  	_dl_debug_printf ("\n");
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/glibc/glibc/relocatable_sdk_fix_openpath.patch b/meta/recipes-core/glibc/glibc/0002-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
similarity index 64%
rename from meta/recipes-core/glibc/glibc/relocatable_sdk_fix_openpath.patch
rename to meta/recipes-core/glibc/glibc/0002-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
index f164f8f..cac7d96 100644
--- a/meta/recipes-core/glibc/glibc/relocatable_sdk_fix_openpath.patch
+++ b/meta/recipes-core/glibc/glibc/0002-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
@@ -1,6 +1,8 @@
-Upstream-Status: Inappropriate [SDK specific]
-
-eglibc-nativesdk: Fix buffer overrun with a relocated SDK
+From bca27423c6a0644aed6f0b629c75361af079036d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 18 Mar 2015 01:50:00 +0000
+Subject: [PATCH 02/27] nativesdk-glibc: Fix buffer overrun with a relocated
+ SDK
 
 When ld-linux-*.so.2 is relocated to a path that is longer than the
 original fixed location, the dynamic loader will crash in open_path
@@ -11,15 +13,19 @@ The allocated buffer will not be large enough to contain the directory
 path string which is larger than the fixed location provided at build
 time.
 
-Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
+Upstream-Status: Inappropriate [OE SDK specific]
 
+Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- elf/dl-load.c |   12 ++++++++++++
+ elf/dl-load.c | 12 ++++++++++++
  1 file changed, 12 insertions(+)
 
+diff --git a/elf/dl-load.c b/elf/dl-load.c
+index f45085a..f1eb5ed 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
-@@ -1919,7 +1919,19 @@ open_path (const char *name, size_t name
+@@ -1765,7 +1765,19 @@ open_path (const char *name, size_t namelen, int mode,
         given on the command line when rtld is run directly.  */
      return -1;
  
@@ -39,3 +45,6 @@ Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
    do
      {
        struct r_search_path_elem *this_dir = *dirs;
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/glibc/glibc/relocatable_sdk.patch b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
similarity index 63%
rename from meta/recipes-core/glibc/glibc/relocatable_sdk.patch
rename to meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
index ca5f17b..f970bd2 100644
--- a/meta/recipes-core/glibc/glibc/relocatable_sdk.patch
+++ b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
@@ -1,4 +1,8 @@
-Upstream-Status: Inappropriate [SDK specific]
+From 9d8557629d5c215b4733bf17cd21dd598abadbb1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 18 Mar 2015 01:51:38 +0000
+Subject: [PATCH 03/27] nativesdk-glibc: Raise the size of arrays containing dl
+ paths
 
 This patch puts the dynamic loader path in the binaries, SYSTEM_DIRS strings
 and lengths as well as ld.so.cache path in the dynamic loader to specific
@@ -7,24 +11,39 @@ byte section, which is the maximum path length in linux. This will allow the
 relocating script to parse the ELF binary, detect the section and easily replace
 the strings in a certain path.
 
+Upstream-Status: Inappropriate [SDK specific]
+
 Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ elf/dl-cache.c             | 4 ++++
+ elf/dl-load.c              | 4 ++--
+ elf/interp.c               | 2 +-
+ elf/ldconfig.c             | 3 +++
+ elf/rtld.c                 | 5 +++--
+ sysdeps/generic/dl-cache.h | 4 ----
+ 6 files changed, 13 insertions(+), 9 deletions(-)
 
-Index: libc/elf/interp.c
-===================================================================
---- libc.orig/elf/interp.c
-+++ libc/elf/interp.c
-@@ -16,5 +16,5 @@
-    License along with the GNU C Library; if not, see
-    <http://www.gnu.org/licenses/>.  */
+diff --git a/elf/dl-cache.c b/elf/dl-cache.c
+index dec49bc..862f1d8 100644
+--- a/elf/dl-cache.c
++++ b/elf/dl-cache.c
+@@ -132,6 +132,10 @@ do									      \
+ while (0)
  
--const char __invoke_dynamic_linker__[] __attribute__ ((section (".interp")))
-+const char __invoke_dynamic_linker__[4096] __attribute__ ((section (".interp")))
-   = RUNTIME_LINKER;
-Index: libc/elf/dl-load.c
-===================================================================
---- libc.orig/elf/dl-load.c
-+++ libc/elf/dl-load.c
-@@ -144,8 +144,8 @@ static size_t max_capstrlen attribute_re
+ 
++const char LD_SO_CACHE[4096] __attribute__ ((section (".ldsocache"))) =
++		SYSCONFDIR "/ld.so.cache";
++
++
+ int
+ internal_function
+ _dl_cache_libcmp (const char *p1, const char *p2)
+diff --git a/elf/dl-load.c b/elf/dl-load.c
+index f1eb5ed..f664f50 100644
+--- a/elf/dl-load.c
++++ b/elf/dl-load.c
+@@ -104,8 +104,8 @@ static size_t max_capstrlen attribute_relro;
  /* Get the generated information about the trusted directories.  */
  #include "trusted-dirs.h"
  
@@ -35,26 +54,22 @@ Index: libc/elf/dl-load.c
  {
    SYSTEM_DIRS_LEN
  };
-Index: libc/elf/dl-cache.c
-===================================================================
---- libc.orig/elf/dl-cache.c
-+++ libc/elf/dl-cache.c
-@@ -133,6 +133,10 @@ do									      \
- while (0)
+diff --git a/elf/interp.c b/elf/interp.c
+index 422ea95e..6d61a36 100644
+--- a/elf/interp.c
++++ b/elf/interp.c
+@@ -18,5 +18,5 @@
  
+ #include <runtime-linker.h>
  
-+const char LD_SO_CACHE[4096] __attribute__ ((section (".ldsocache"))) =
-+		SYSCONFDIR "/ld.so.cache";
-+
-+
- int
- internal_function
- _dl_cache_libcmp (const char *p1, const char *p2)
-Index: libc/elf/ldconfig.c
-===================================================================
---- libc.orig/elf/ldconfig.c
-+++ libc/elf/ldconfig.c
-@@ -166,6 +166,9 @@ static struct argp argp =
+-const char __invoke_dynamic_linker__[] __attribute__ ((section (".interp")))
++const char __invoke_dynamic_linker__[4096] __attribute__ ((section (".interp")))
+   = RUNTIME_LINKER;
+diff --git a/elf/ldconfig.c b/elf/ldconfig.c
+index f54ec22..0e78a83 100644
+--- a/elf/ldconfig.c
++++ b/elf/ldconfig.c
+@@ -167,6 +167,9 @@ static struct argp argp =
    options, parse_opt, NULL, doc, NULL, more_help, NULL
  };
  
@@ -64,25 +79,10 @@ Index: libc/elf/ldconfig.c
  /* Check if string corresponds to an important hardware capability or
     a platform.  */
  static int
-Index: libc/sysdeps/generic/dl-cache.h
-===================================================================
---- libc.orig/sysdeps/generic/dl-cache.h
-+++ libc/sysdeps/generic/dl-cache.h
-@@ -27,10 +27,6 @@
-   ((flags) == 1 || (flags) == _DL_CACHE_DEFAULT_ID)
- #endif
- 
--#ifndef LD_SO_CACHE
--# define LD_SO_CACHE SYSCONFDIR "/ld.so.cache"
--#endif
--
- #ifndef add_system_dir
- # define add_system_dir(dir) add_dir (dir)
- #endif
-Index: libc/elf/rtld.c
-===================================================================
---- libc.orig/elf/rtld.c
-+++ libc/elf/rtld.c
+diff --git a/elf/rtld.c b/elf/rtld.c
+index 69873c2..6d3add7 100644
+--- a/elf/rtld.c
++++ b/elf/rtld.c
 @@ -99,6 +99,7 @@ uintptr_t __pointer_chk_guard_local
  strong_alias (__pointer_chk_guard_local, __pointer_chk_guard)
  #endif
@@ -91,7 +91,7 @@ Index: libc/elf/rtld.c
  
  /* List of auditing DSOs.  */
  static struct audit_list
-@@ -1031,12 +1032,12 @@ of this helper program; chances are you
+@@ -877,12 +878,12 @@ of this helper program; chances are you did not intend to run this program.\n\
    --list                list all dependencies and how they are resolved\n\
    --verify              verify that given object really is a dynamically linked\n\
  			object we can handle\n\
@@ -106,3 +106,21 @@ Index: libc/elf/rtld.c
  
        ++_dl_skip_args;
        --_dl_argc;
+diff --git a/sysdeps/generic/dl-cache.h b/sysdeps/generic/dl-cache.h
+index 4b49869..1800d03 100644
+--- a/sysdeps/generic/dl-cache.h
++++ b/sysdeps/generic/dl-cache.h
+@@ -27,10 +27,6 @@
+   ((flags) == 1 || (flags) == _DL_CACHE_DEFAULT_ID)
+ #endif
+ 
+-#ifndef LD_SO_CACHE
+-# define LD_SO_CACHE SYSCONFDIR "/ld.so.cache"
+-#endif
+-
+ #ifndef add_system_dir
+ # define add_system_dir(dir) add_dir (dir)
+ #endif
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/glibc/glibc/0004-Backport-https-sourceware.org-ml-libc-ports-2007-12-.patch b/meta/recipes-core/glibc/glibc/0004-Backport-https-sourceware.org-ml-libc-ports-2007-12-.patch
new file mode 100644
index 0000000..01e21dc
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0004-Backport-https-sourceware.org-ml-libc-ports-2007-12-.patch
@@ -0,0 +1,34 @@
+From 86738f8127f815d437c20f79385652e68867f31e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 8 Mar 2015 04:01:01 +0000
+Subject: [PATCH 04/27] Backport
+ https://sourceware.org/ml/libc-ports/2007-12/msg00000.html
+
+Upstream-Status: Pending
+
+2007-12-03  Kristian Van Der Vliet  <vanders@liqwyd.com>
+
+        * bits/stdio-lock.h (_IO_acquire_lock_clear_flags2): Define
+
+Signed-off-by: Kristian Van Der Vliet <vanders@liqwyd.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ bits/stdio-lock.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/bits/stdio-lock.h b/bits/stdio-lock.h
+index 0c5bb65..66304a6 100644
+--- a/bits/stdio-lock.h
++++ b/bits/stdio-lock.h
+@@ -49,6 +49,8 @@ __libc_lock_define_recursive (typedef, _IO_lock_t)
+   _IO_cleanup_region_start ((void (*) (void *)) _IO_funlockfile, (_fp));      \
+   _IO_flockfile (_fp)
+ 
++# define _IO_acquire_lock_clear_flags2(_fp) _IO_acquire_lock (_fp)
++
+ # define _IO_release_lock(_fp) \
+   _IO_funlockfile (_fp);						      \
+   _IO_cleanup_region_end (0)
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/glibc/glibc/glibc.fix_sqrt2.patch b/meta/recipes-core/glibc/glibc/0005-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch
similarity index 86%
rename from meta/recipes-core/glibc/glibc/glibc.fix_sqrt2.patch
rename to meta/recipes-core/glibc/glibc/0005-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch
index f5ed1bf..1ba95a5 100644
--- a/meta/recipes-core/glibc/glibc/glibc.fix_sqrt2.patch
+++ b/meta/recipes-core/glibc/glibc/0005-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch
@@ -1,10 +1,57 @@
-Signed-of-by: Edmar Wienskoski <edmar@freescale.com>
+From eb527613ff9c2a4817dde03d3cb6718f5e04b8c8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 18 Mar 2015 00:01:50 +0000
+Subject: [PATCH 05/27] fsl e500/e5500/e6500/603e fsqrt implementation
+
 Upstream-Status: Pending
+Signed-off-by: Edmar Wienskoski <edmar@freescale.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c        | 134 +++++++++++++++++++++
+ sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c       | 101 ++++++++++++++++
+ sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c      | 134 +++++++++++++++++++++
+ sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c     | 101 ++++++++++++++++
+ sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c       | 134 +++++++++++++++++++++
+ sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c      | 101 ++++++++++++++++
+ sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c       | 134 +++++++++++++++++++++
+ sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c      | 101 ++++++++++++++++
+ sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c       | 134 +++++++++++++++++++++
+ sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c      | 101 ++++++++++++++++
+ sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c       | 134 +++++++++++++++++++++
+ sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c      | 101 ++++++++++++++++
+ .../sysv/linux/powerpc/powerpc32/603e/fpu/Implies  |   1 +
+ .../linux/powerpc/powerpc32/e300c3/fpu/Implies     |   2 +
+ .../linux/powerpc/powerpc32/e500mc/fpu/Implies     |   1 +
+ .../sysv/linux/powerpc/powerpc32/e5500/fpu/Implies |   1 +
+ .../sysv/linux/powerpc/powerpc32/e6500/fpu/Implies |   1 +
+ .../sysv/linux/powerpc/powerpc64/e5500/fpu/Implies |   1 +
+ .../sysv/linux/powerpc/powerpc64/e6500/fpu/Implies |   1 +
+ 19 files changed, 1418 insertions(+)
+ create mode 100644 sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
+ create mode 100644 sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
+ create mode 100644 sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c
+ create mode 100644 sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c
+ create mode 100644 sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c
+ create mode 100644 sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c
+ create mode 100644 sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c
+ create mode 100644 sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c
+ create mode 100644 sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
+ create mode 100644 sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
+ create mode 100644 sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c
+ create mode 100644 sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c
+ create mode 100644 sysdeps/unix/sysv/linux/powerpc/powerpc32/603e/fpu/Implies
+ create mode 100644 sysdeps/unix/sysv/linux/powerpc/powerpc32/e300c3/fpu/Implies
+ create mode 100644 sysdeps/unix/sysv/linux/powerpc/powerpc32/e500mc/fpu/Implies
+ create mode 100644 sysdeps/unix/sysv/linux/powerpc/powerpc32/e5500/fpu/Implies
+ create mode 100644 sysdeps/unix/sysv/linux/powerpc/powerpc32/e6500/fpu/Implies
+ create mode 100644 sysdeps/unix/sysv/linux/powerpc/powerpc64/e5500/fpu/Implies
+ create mode 100644 sysdeps/unix/sysv/linux/powerpc/powerpc64/e6500/fpu/Implies
 
-Index: git/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c	2014-08-29 10:34:07.768070587 -0700
+diff --git a/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c b/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
+new file mode 100644
+index 0000000..71e516d
+--- /dev/null
++++ b/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
 @@ -0,0 +1,134 @@
 +/* Double-precision floating point square root.
 +   Copyright (C) 2010 Free Software Foundation, Inc.
@@ -140,10 +187,11 @@ Index: git/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
 +    }
 +  return f_wash (b);
 +}
-Index: git/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c	2014-08-29 10:34:07.768070587 -0700
+diff --git a/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c b/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
+new file mode 100644
+index 0000000..26fa067
+--- /dev/null
++++ b/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
 @@ -0,0 +1,101 @@
 +/* Single-precision floating point square root.
 +   Copyright (C) 2010 Free Software Foundation, Inc.
@@ -246,10 +294,11 @@ Index: git/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
 +    }
 +  return f_washf (b);
 +}
-Index: git/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c	2014-08-29 10:34:07.768070587 -0700
+diff --git a/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c b/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c
+new file mode 100644
+index 0000000..71e516d
+--- /dev/null
++++ b/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c
 @@ -0,0 +1,134 @@
 +/* Double-precision floating point square root.
 +   Copyright (C) 2010 Free Software Foundation, Inc.
@@ -385,10 +434,11 @@ Index: git/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c
 +    }
 +  return f_wash (b);
 +}
-Index: git/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c	2014-08-29 10:34:07.772070587 -0700
+diff --git a/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c b/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c
+new file mode 100644
+index 0000000..26fa067
+--- /dev/null
++++ b/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c
 @@ -0,0 +1,101 @@
 +/* Single-precision floating point square root.
 +   Copyright (C) 2010 Free Software Foundation, Inc.
@@ -491,10 +541,11 @@ Index: git/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c
 +    }
 +  return f_washf (b);
 +}
-Index: git/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c	2014-08-29 10:34:07.772070587 -0700
+diff --git a/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c b/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c
+new file mode 100644
+index 0000000..71e516d
+--- /dev/null
++++ b/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c
 @@ -0,0 +1,134 @@
 +/* Double-precision floating point square root.
 +   Copyright (C) 2010 Free Software Foundation, Inc.
@@ -630,10 +681,11 @@ Index: git/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c
 +    }
 +  return f_wash (b);
 +}
-Index: git/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c	2014-08-29 10:34:07.772070587 -0700
+diff --git a/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c b/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c
+new file mode 100644
+index 0000000..26fa067
+--- /dev/null
++++ b/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c
 @@ -0,0 +1,101 @@
 +/* Single-precision floating point square root.
 +   Copyright (C) 2010 Free Software Foundation, Inc.
@@ -736,10 +788,11 @@ Index: git/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c
 +    }
 +  return f_washf (b);
 +}
-Index: git/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c	2014-08-29 10:34:07.772070587 -0700
+diff --git a/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c b/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c
+new file mode 100644
+index 0000000..71e516d
+--- /dev/null
++++ b/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c
 @@ -0,0 +1,134 @@
 +/* Double-precision floating point square root.
 +   Copyright (C) 2010 Free Software Foundation, Inc.
@@ -875,10 +928,11 @@ Index: git/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c
 +    }
 +  return f_wash (b);
 +}
-Index: git/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c	2014-08-29 10:34:07.772070587 -0700
+diff --git a/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c b/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c
+new file mode 100644
+index 0000000..26fa067
+--- /dev/null
++++ b/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c
 @@ -0,0 +1,101 @@
 +/* Single-precision floating point square root.
 +   Copyright (C) 2010 Free Software Foundation, Inc.
@@ -981,10 +1035,11 @@ Index: git/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c
 +    }
 +  return f_washf (b);
 +}
-Index: git/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c	2014-08-29 10:34:07.772070587 -0700
+diff --git a/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c b/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
+new file mode 100644
+index 0000000..71e516d
+--- /dev/null
++++ b/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
 @@ -0,0 +1,134 @@
 +/* Double-precision floating point square root.
 +   Copyright (C) 2010 Free Software Foundation, Inc.
@@ -1120,10 +1175,11 @@ Index: git/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
 +    }
 +  return f_wash (b);
 +}
-Index: git/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c	2014-08-29 10:34:07.772070587 -0700
+diff --git a/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c b/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
+new file mode 100644
+index 0000000..26fa067
+--- /dev/null
++++ b/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
 @@ -0,0 +1,101 @@
 +/* Single-precision floating point square root.
 +   Copyright (C) 2010 Free Software Foundation, Inc.
@@ -1226,10 +1282,11 @@ Index: git/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
 +    }
 +  return f_washf (b);
 +}
-Index: git/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c	2014-08-29 10:34:07.772070587 -0700
+diff --git a/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c b/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c
+new file mode 100644
+index 0000000..71e516d
+--- /dev/null
++++ b/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c
 @@ -0,0 +1,134 @@
 +/* Double-precision floating point square root.
 +   Copyright (C) 2010 Free Software Foundation, Inc.
@@ -1365,10 +1422,11 @@ Index: git/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c
 +    }
 +  return f_wash (b);
 +}
-Index: git/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c	2014-08-29 10:34:07.776070587 -0700
+diff --git a/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c b/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c
+new file mode 100644
+index 0000000..26fa067
+--- /dev/null
++++ b/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c
 @@ -0,0 +1,101 @@
 +/* Single-precision floating point square root.
 +   Copyright (C) 2010 Free Software Foundation, Inc.
@@ -1471,46 +1529,56 @@ Index: git/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c
 +    }
 +  return f_washf (b);
 +}
-Index: git/sysdeps/unix/sysv/linux/powerpc/powerpc32/603e/fpu/Implies
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/sysdeps/unix/sysv/linux/powerpc/powerpc32/603e/fpu/Implies	2014-08-29 10:34:07.776070587 -0700
+diff --git a/sysdeps/unix/sysv/linux/powerpc/powerpc32/603e/fpu/Implies b/sysdeps/unix/sysv/linux/powerpc/powerpc32/603e/fpu/Implies
+new file mode 100644
+index 0000000..b103b4d
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/powerpc/powerpc32/603e/fpu/Implies
 @@ -0,0 +1 @@
 +powerpc/powerpc32/603e/fpu
-Index: git/sysdeps/unix/sysv/linux/powerpc/powerpc32/e300c3/fpu/Implies
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/sysdeps/unix/sysv/linux/powerpc/powerpc32/e300c3/fpu/Implies	2014-08-29 10:34:07.776070587 -0700
+diff --git a/sysdeps/unix/sysv/linux/powerpc/powerpc32/e300c3/fpu/Implies b/sysdeps/unix/sysv/linux/powerpc/powerpc32/e300c3/fpu/Implies
+new file mode 100644
+index 0000000..64db17f
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/powerpc/powerpc32/e300c3/fpu/Implies
 @@ -0,0 +1,2 @@
 +# e300c3 is a variant of 603e so use the same optimizations for sqrt
 +powerpc/powerpc32/603e/fpu
-Index: git/sysdeps/unix/sysv/linux/powerpc/powerpc32/e500mc/fpu/Implies
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/sysdeps/unix/sysv/linux/powerpc/powerpc32/e500mc/fpu/Implies	2014-08-29 10:34:07.776070587 -0700
+diff --git a/sysdeps/unix/sysv/linux/powerpc/powerpc32/e500mc/fpu/Implies b/sysdeps/unix/sysv/linux/powerpc/powerpc32/e500mc/fpu/Implies
+new file mode 100644
+index 0000000..7eac5fc
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/powerpc/powerpc32/e500mc/fpu/Implies
 @@ -0,0 +1 @@
 +powerpc/powerpc32/e500mc/fpu
-Index: git/sysdeps/unix/sysv/linux/powerpc/powerpc32/e5500/fpu/Implies
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/sysdeps/unix/sysv/linux/powerpc/powerpc32/e5500/fpu/Implies	2014-08-29 10:34:07.776070587 -0700
+diff --git a/sysdeps/unix/sysv/linux/powerpc/powerpc32/e5500/fpu/Implies b/sysdeps/unix/sysv/linux/powerpc/powerpc32/e5500/fpu/Implies
+new file mode 100644
+index 0000000..264b2a7
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/powerpc/powerpc32/e5500/fpu/Implies
 @@ -0,0 +1 @@
 +powerpc/powerpc32/e5500/fpu
-Index: git/sysdeps/unix/sysv/linux/powerpc/powerpc32/e6500/fpu/Implies
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/sysdeps/unix/sysv/linux/powerpc/powerpc32/e6500/fpu/Implies	2014-08-29 10:34:07.776070587 -0700
+diff --git a/sysdeps/unix/sysv/linux/powerpc/powerpc32/e6500/fpu/Implies b/sysdeps/unix/sysv/linux/powerpc/powerpc32/e6500/fpu/Implies
+new file mode 100644
+index 0000000..a259344
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/powerpc/powerpc32/e6500/fpu/Implies
 @@ -0,0 +1 @@
 +powerpc/powerpc32/e6500/fpu
-Index: git/sysdeps/unix/sysv/linux/powerpc/powerpc64/e5500/fpu/Implies
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/sysdeps/unix/sysv/linux/powerpc/powerpc64/e5500/fpu/Implies	2014-08-29 10:34:07.780070587 -0700
+diff --git a/sysdeps/unix/sysv/linux/powerpc/powerpc64/e5500/fpu/Implies b/sysdeps/unix/sysv/linux/powerpc/powerpc64/e5500/fpu/Implies
+new file mode 100644
+index 0000000..a7bc854
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/powerpc/powerpc64/e5500/fpu/Implies
 @@ -0,0 +1 @@
 +powerpc/powerpc64/e5500/fpu
-Index: git/sysdeps/unix/sysv/linux/powerpc/powerpc64/e6500/fpu/Implies
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/sysdeps/unix/sysv/linux/powerpc/powerpc64/e6500/fpu/Implies	2014-08-29 10:34:07.780070587 -0700
+diff --git a/sysdeps/unix/sysv/linux/powerpc/powerpc64/e6500/fpu/Implies b/sysdeps/unix/sysv/linux/powerpc/powerpc64/e6500/fpu/Implies
+new file mode 100644
+index 0000000..04ff8cc
+--- /dev/null
++++ b/sysdeps/unix/sysv/linux/powerpc/powerpc64/e6500/fpu/Implies
 @@ -0,0 +1 @@
 +powerpc/powerpc64/e6500/fpu
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/glibc/glibc/0006-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch b/meta/recipes-core/glibc/glibc/0006-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
new file mode 100644
index 0000000..4879a23
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0006-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
@@ -0,0 +1,33 @@
+From 894f03f0a164af390e6dbdfb8db5a1a22be1553a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 18 Mar 2015 00:11:22 +0000
+Subject: [PATCH 06/27] readlib: Add OECORE_KNOWN_INTERPRETER_NAMES to known
+ names
+
+This bolts in a hook for OE to pass its own version of interpreter
+names into glibc especially for multilib case, where it differs from any
+other distros
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ elf/readlib.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/elf/readlib.c b/elf/readlib.c
+index 7fd5b8a..2f5da9f 100644
+--- a/elf/readlib.c
++++ b/elf/readlib.c
+@@ -51,6 +51,7 @@ static struct known_names interpreters[] =
+ #ifdef SYSDEP_KNOWN_INTERPRETER_NAMES
+   SYSDEP_KNOWN_INTERPRETER_NAMES
+ #endif
++  OECORE_KNOWN_INTERPRETER_NAMES
+ };
+ 
+ static struct known_names known_libs[] =
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/glibc/glibc/ppc-sqrt_finite.patch b/meta/recipes-core/glibc/glibc/0007-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch
similarity index 40%
rename from meta/recipes-core/glibc/glibc/ppc-sqrt_finite.patch
rename to meta/recipes-core/glibc/glibc/0007-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch
index 6ea666b..58e3b1a 100644
--- a/meta/recipes-core/glibc/glibc/ppc-sqrt_finite.patch
+++ b/meta/recipes-core/glibc/glibc/0007-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch
@@ -1,3 +1,8 @@
+From 52af62113f089ea5230802931956fe167c01f948 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 18 Mar 2015 00:15:07 +0000
+Subject: [PATCH 07/27] ppc/sqrt: Fix undefined reference to `__sqrt_finite'
+
 on ppc fixes the errors like below
 | ./.libs/libpulsecore-1.1.so: undefined reference to `__sqrt_finite'
 | collect2: ld returned 1 exit status
@@ -8,16 +13,32 @@ ChangeLog
 
 2012-01-06  Khem Raj  <raj.khem@gmail.com>
 
-	* sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c: Add __*_finite alias.
-	Remove cruft.
-	* sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c: Ditto.
-	* sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c: Ditto.
-	* sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c: Ditto.
- 
-Index: libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
-===================================================================
---- libc.orig/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
-+++ libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
+        * sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c: Add __*_finite alias.
+        Remove cruft.
+        * sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c: Ditto.
+        * sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c: Ditto.
+        * sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c: Ditto.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c    | 7 +------
+ sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c   | 7 +------
+ sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c  | 1 +
+ sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c | 1 +
+ sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c   | 1 +
+ sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c  | 1 +
+ sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c   | 1 +
+ sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c  | 1 +
+ sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c   | 7 +------
+ sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c  | 7 +------
+ sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c   | 1 +
+ sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c  | 1 +
+ 12 files changed, 12 insertions(+), 24 deletions(-)
+
+diff --git a/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c b/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
+index 71e516d..1795fd6 100644
+--- a/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
++++ b/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
 @@ -39,14 +39,8 @@ static const float half = 0.5;
     We find the actual square root and half of its reciprocal
     simultaneously.  */
@@ -38,10 +59,10 @@ Index: libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
    return f_wash (b);
  }
 +strong_alias (__ieee754_sqrt, __sqrt_finite)
-Index: libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
-===================================================================
---- libc.orig/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
-+++ libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
+diff --git a/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c b/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
+index 26fa067..a917f31 100644
+--- a/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
++++ b/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
 @@ -37,14 +37,8 @@ static const float threehalf = 1.5;
     We find the reciprocal square root and use that to compute the actual
     square root.  */
@@ -62,10 +83,64 @@ Index: libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
    return f_washf (b);
  }
 +strong_alias (__ieee754_sqrtf, __sqrtf_finite)
-Index: libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
-===================================================================
---- libc.orig/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
-+++ libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
+diff --git a/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c b/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c
+index 71e516d..fc4a749 100644
+--- a/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c
++++ b/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c
+@@ -132,3 +132,4 @@ __ieee754_sqrt (b)
+     }
+   return f_wash (b);
+ }
++strong_alias (__ieee754_sqrt, __sqrt_finite)
+diff --git a/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c b/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c
+index 26fa067..9d17512 100644
+--- a/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c
++++ b/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c
+@@ -99,3 +99,4 @@ __ieee754_sqrtf (b)
+     }
+   return f_washf (b);
+ }
++strong_alias (__ieee754_sqrtf, __sqrtf_finite)
+diff --git a/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c b/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c
+index 71e516d..fc4a749 100644
+--- a/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c
++++ b/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c
+@@ -132,3 +132,4 @@ __ieee754_sqrt (b)
+     }
+   return f_wash (b);
+ }
++strong_alias (__ieee754_sqrt, __sqrt_finite)
+diff --git a/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c b/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c
+index 26fa067..9d17512 100644
+--- a/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c
++++ b/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c
+@@ -99,3 +99,4 @@ __ieee754_sqrtf (b)
+     }
+   return f_washf (b);
+ }
++strong_alias (__ieee754_sqrtf, __sqrtf_finite)
+diff --git a/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c b/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c
+index 71e516d..fc4a749 100644
+--- a/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c
++++ b/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c
+@@ -132,3 +132,4 @@ __ieee754_sqrt (b)
+     }
+   return f_wash (b);
+ }
++strong_alias (__ieee754_sqrt, __sqrt_finite)
+diff --git a/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c b/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c
+index 26fa067..9d17512 100644
+--- a/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c
++++ b/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c
+@@ -99,3 +99,4 @@ __ieee754_sqrtf (b)
+     }
+   return f_washf (b);
+ }
++strong_alias (__ieee754_sqrtf, __sqrtf_finite)
+diff --git a/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c b/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
+index 71e516d..1795fd6 100644
+--- a/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
++++ b/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
 @@ -39,14 +39,8 @@ static const float half = 0.5;
     We find the actual square root and half of its reciprocal
     simultaneously.  */
@@ -86,10 +161,10 @@ Index: libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
    return f_wash (b);
  }
 +strong_alias (__ieee754_sqrt, __sqrt_finite)
-Index: libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
-===================================================================
---- libc.orig/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
-+++ libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
+diff --git a/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c b/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
+index 26fa067..a917f31 100644
+--- a/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
++++ b/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
 @@ -37,14 +37,8 @@ static const float threehalf = 1.5;
     We find the reciprocal square root and use that to compute the actual
     square root.  */
@@ -110,75 +185,24 @@ Index: libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
    return f_washf (b);
  }
 +strong_alias (__ieee754_sqrtf, __sqrtf_finite)
-Index: libc/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c
-===================================================================
---- libc.orig/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c
-+++ libc/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c
-@@ -132,3 +132,4 @@ __ieee754_sqrt (b)
-     }
-   return f_wash (b);
- }
-+strong_alias (__ieee754_sqrt, __sqrt_finite)
-Index: libc/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c
-===================================================================
---- libc.orig/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c
-+++ libc/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c
-@@ -99,3 +99,4 @@ __ieee754_sqrtf (b)
-     }
-   return f_washf (b);
- }
-+strong_alias (__ieee754_sqrtf, __sqrtf_finite)
-Index: libc/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c
-===================================================================
---- libc.orig/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c
-+++ libc/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c
-@@ -132,3 +132,4 @@ __ieee754_sqrt (b)
-     }
-   return f_wash (b);
- }
-+strong_alias (__ieee754_sqrt, __sqrt_finite)
-Index: libc/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c
-===================================================================
---- libc.orig/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c
-+++ libc/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c
-@@ -99,3 +99,4 @@ __ieee754_sqrtf (b)
-     }
-   return f_washf (b);
- }
-+strong_alias (__ieee754_sqrtf, __sqrtf_finite)
-Index: libc/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c
-===================================================================
---- libc.orig/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c
-+++ libc/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c
-@@ -132,3 +132,4 @@ __ieee754_sqrt (b)
-     }
-   return f_wash (b);
- }
-+strong_alias (__ieee754_sqrt, __sqrt_finite)
-Index: libc/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c
-===================================================================
---- libc.orig/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c
-+++ libc/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c
-@@ -99,3 +99,4 @@ __ieee754_sqrtf (b)
-     }
-   return f_washf (b);
- }
-+strong_alias (__ieee754_sqrtf, __sqrtf_finite)
-Index: libc/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c
-===================================================================
---- libc.orig/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c
-+++ libc/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c
+diff --git a/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c b/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c
+index 71e516d..fc4a749 100644
+--- a/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c
++++ b/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c
 @@ -132,3 +132,4 @@ __ieee754_sqrt (b)
      }
    return f_wash (b);
  }
 +strong_alias (__ieee754_sqrt, __sqrt_finite)
-Index: libc/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c
-===================================================================
---- libc.orig/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c
-+++ libc/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c
+diff --git a/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c b/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c
+index 26fa067..9d17512 100644
+--- a/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c
++++ b/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c
 @@ -99,3 +99,4 @@ __ieee754_sqrtf (b)
      }
    return f_washf (b);
  }
 +strong_alias (__ieee754_sqrtf, __sqrtf_finite)
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/glibc/glibc/ppc_slow_ieee754_sqrt.patch b/meta/recipes-core/glibc/glibc/0008-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
similarity index 53%
rename from meta/recipes-core/glibc/glibc/ppc_slow_ieee754_sqrt.patch
rename to meta/recipes-core/glibc/glibc/0008-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
index 5b819bc..3750e49 100644
--- a/meta/recipes-core/glibc/glibc/ppc_slow_ieee754_sqrt.patch
+++ b/meta/recipes-core/glibc/glibc/0008-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
@@ -1,13 +1,32 @@
- __ieee754_sqrt{,f} are now inline functions and call out __slow versions
+From 635ce017a59327a7a0fc9926a669bcdf9e6535f9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 18 Mar 2015 00:16:38 +0000
+Subject: [PATCH 08/27] __ieee754_sqrt{,f} are now inline functions and call
+ out __slow versions
 
+Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-Index: git/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
-===================================================================
---- git.orig/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c	2014-08-29 10:35:02.616070587 -0700
-+++ git/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c	2014-08-29 10:35:02.604070587 -0700
-@@ -40,7 +40,7 @@
+---
+ sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c    | 12 ++++++++++--
+ sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c   |  8 +++++++-
+ sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c  | 14 +++++++++++---
+ sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c | 12 ++++++++++--
+ sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c   | 14 +++++++++++---
+ sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c  | 12 ++++++++++--
+ sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c   |  8 ++++++++
+ sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c  |  8 ++++++++
+ sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c   | 12 ++++++++++--
+ sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c  |  9 ++++++++-
+ sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c   | 14 +++++++++++---
+ sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c  | 12 ++++++++++--
+ 12 files changed, 114 insertions(+), 21 deletions(-)
+
+diff --git a/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c b/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
+index 1795fd6..daa83f3 100644
+--- a/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
++++ b/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
+@@ -40,7 +40,7 @@ static const float half = 0.5;
     simultaneously.  */
  
  double
@@ -16,7 +35,7 @@ Index: git/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
  {
    if (__builtin_expect (b > 0, 1))
      {
-@@ -77,7 +77,7 @@
+@@ -77,7 +77,7 @@ __ieee754_sqrt (double b)
  
            /* Handle small numbers by scaling.  */
            if (__builtin_expect ((u.parts.msw & 0x7ff00000) <= 0x02000000, 0))
@@ -25,7 +44,7 @@ Index: git/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
  
  #define FMADD(a_, c_, b_)                                               \
            ({ double __r;                                                \
-@@ -126,4 +126,12 @@
+@@ -126,4 +126,12 @@ __ieee754_sqrt (double b)
      }
    return f_wash (b);
  }
@@ -38,11 +57,11 @@ Index: git/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
 +}
 +
  strong_alias (__ieee754_sqrt, __sqrt_finite)
-Index: git/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
-===================================================================
---- git.orig/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c	2014-08-29 10:35:02.616070587 -0700
-+++ git/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c	2014-08-29 10:35:02.604070587 -0700
-@@ -38,7 +38,7 @@
+diff --git a/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c b/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
+index a917f31..b812cf1 100644
+--- a/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
++++ b/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
+@@ -38,7 +38,7 @@ static const float threehalf = 1.5;
     square root.  */
  
  float
@@ -51,7 +70,7 @@ Index: git/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
  {
    if (__builtin_expect (b > 0, 1))
      {
-@@ -93,4 +93,10 @@
+@@ -93,4 +93,10 @@ __ieee754_sqrtf (float b)
      }
    return f_washf (b);
  }
@@ -62,20 +81,24 @@ Index: git/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
 +  return __slow_ieee754_sqrtf (x);
 +}
  strong_alias (__ieee754_sqrtf, __sqrtf_finite)
-Index: git/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
-===================================================================
---- git.orig/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c	2014-08-29 10:35:02.616070587 -0700
-+++ git/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c	2014-08-29 10:35:02.604070587 -0700
-@@ -40,7 +40,7 @@
-    simultaneously.  */
+diff --git a/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c b/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c
+index fc4a749..7038a70 100644
+--- a/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c
++++ b/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c
+@@ -41,10 +41,10 @@ static const float half = 0.5;
  
+ #ifdef __STDC__
  double
 -__ieee754_sqrt (double b)
 +__slow_ieee754_sqrt (double b)
+ #else
+ double
+-__ieee754_sqrt (b)
++__slow_ieee754_sqrt (b)
+      double b;
+ #endif
  {
-   if (__builtin_expect (b > 0, 1))
-     {
-@@ -77,7 +77,7 @@
+@@ -83,7 +83,7 @@ __ieee754_sqrt (b)
  
            /* Handle small numbers by scaling.  */
            if (__builtin_expect ((u.parts.msw & 0x7ff00000) <= 0x02000000, 0))
@@ -84,7 +107,7 @@ Index: git/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
  
  #define FMADD(a_, c_, b_)                                               \
            ({ double __r;                                                \
-@@ -126,4 +126,12 @@
+@@ -132,4 +132,12 @@ __ieee754_sqrt (b)
      }
    return f_wash (b);
  }
@@ -93,27 +116,32 @@ Index: git/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
 +double
 +__ieee754_sqrt (double x)
 +{
-+  return __slow_ieee754_sqrt (x);
++   return __slow_ieee754_sqrt (x);
 +}
 +
  strong_alias (__ieee754_sqrt, __sqrt_finite)
-Index: git/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
-===================================================================
---- git.orig/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c	2014-08-29 10:35:02.616070587 -0700
-+++ git/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c	2014-08-29 10:35:02.604070587 -0700
-@@ -38,7 +38,7 @@
-    square root.  */
+diff --git a/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c b/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c
+index 9d17512..10de1f0 100644
+--- a/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c
++++ b/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c
+@@ -39,10 +39,10 @@ static const float threehalf = 1.5;
  
+ #ifdef __STDC__
  float
 -__ieee754_sqrtf (float b)
 +__slow_ieee754_sqrtf (float b)
+ #else
+ float
+-__ieee754_sqrtf (b)
++__slow_ieee754_sqrtf (b)
+      float b;
+ #endif
  {
-   if (__builtin_expect (b > 0, 1))
-     {
-@@ -93,4 +93,11 @@
+@@ -99,4 +99,12 @@ __ieee754_sqrtf (b)
      }
    return f_washf (b);
  }
++
 +#undef __ieee754_sqrtf
 +float
 +__ieee754_sqrtf (float x)
@@ -122,11 +150,11 @@ Index: git/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
 +}
 +
  strong_alias (__ieee754_sqrtf, __sqrtf_finite)
-Index: git/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c
-===================================================================
---- git.orig/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c	2014-08-29 10:35:02.616070587 -0700
-+++ git/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c	2014-08-29 10:35:02.604070587 -0700
-@@ -41,10 +41,10 @@
+diff --git a/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c b/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c
+index fc4a749..7038a70 100644
+--- a/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c
++++ b/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c
+@@ -41,10 +41,10 @@ static const float half = 0.5;
  
  #ifdef __STDC__
  double
@@ -139,7 +167,7 @@ Index: git/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c
       double b;
  #endif
  {
-@@ -83,7 +83,7 @@
+@@ -83,7 +83,7 @@ __ieee754_sqrt (b)
  
            /* Handle small numbers by scaling.  */
            if (__builtin_expect ((u.parts.msw & 0x7ff00000) <= 0x02000000, 0))
@@ -148,7 +176,7 @@ Index: git/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c
  
  #define FMADD(a_, c_, b_)                                               \
            ({ double __r;                                                \
-@@ -132,4 +132,12 @@
+@@ -132,4 +132,12 @@ __ieee754_sqrt (b)
      }
    return f_wash (b);
  }
@@ -161,11 +189,11 @@ Index: git/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c
 +}
 +
  strong_alias (__ieee754_sqrt, __sqrt_finite)
-Index: git/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c
-===================================================================
---- git.orig/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c	2014-08-29 10:35:02.616070587 -0700
-+++ git/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c	2014-08-29 10:35:02.604070587 -0700
-@@ -39,10 +39,10 @@
+diff --git a/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c b/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c
+index 9d17512..10de1f0 100644
+--- a/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c
++++ b/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c
+@@ -39,10 +39,10 @@ static const float threehalf = 1.5;
  
  #ifdef __STDC__
  float
@@ -178,7 +206,41 @@ Index: git/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c
       float b;
  #endif
  {
-@@ -99,4 +99,12 @@
+@@ -99,4 +99,12 @@ __ieee754_sqrtf (b)
+     }
+   return f_washf (b);
+ }
++
++#undef __ieee754_sqrtf
++float
++__ieee754_sqrtf (float x)
++{
++  return __slow_ieee754_sqrtf (x);
++}
++
+ strong_alias (__ieee754_sqrtf, __sqrtf_finite)
+diff --git a/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c b/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c
+index fc4a749..1c34244 100644
+--- a/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c
++++ b/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c
+@@ -132,4 +132,12 @@ __ieee754_sqrt (b)
+     }
+   return f_wash (b);
+ }
++
++#undef __ieee754_sqrt
++double
++__ieee754_sqrt (double x)
++{
++   return __slow_ieee754_sqrt (x);
++}
++
+ strong_alias (__ieee754_sqrt, __sqrt_finite)
+diff --git a/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c b/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c
+index 9d17512..8126535 100644
+--- a/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c
++++ b/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c
+@@ -99,4 +99,12 @@ __ieee754_sqrtf (b)
      }
    return f_washf (b);
  }
@@ -191,24 +253,20 @@ Index: git/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c
 +}
 +
  strong_alias (__ieee754_sqrtf, __sqrtf_finite)
-Index: git/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c
-===================================================================
---- git.orig/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c	2014-08-29 10:35:02.616070587 -0700
-+++ git/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c	2014-08-29 10:35:02.608070587 -0700
-@@ -41,10 +41,10 @@
+diff --git a/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c b/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
+index 1795fd6..13a8197 100644
+--- a/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
++++ b/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
+@@ -40,7 +40,7 @@ static const float half = 0.5;
+    simultaneously.  */
  
- #ifdef __STDC__
  double
 -__ieee754_sqrt (double b)
 +__slow_ieee754_sqrt (double b)
- #else
- double
--__ieee754_sqrt (b)
-+__slow_ieee754_sqrt (b)
-      double b;
- #endif
  {
-@@ -83,7 +83,7 @@
+   if (__builtin_expect (b > 0, 1))
+     {
+@@ -77,7 +77,7 @@ __ieee754_sqrt (double b)
  
            /* Handle small numbers by scaling.  */
            if (__builtin_expect ((u.parts.msw & 0x7ff00000) <= 0x02000000, 0))
@@ -217,7 +275,7 @@ Index: git/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c
  
  #define FMADD(a_, c_, b_)                                               \
            ({ double __r;                                                \
-@@ -132,4 +132,12 @@
+@@ -126,4 +126,12 @@ __ieee754_sqrt (double b)
      }
    return f_wash (b);
  }
@@ -226,32 +284,27 @@ Index: git/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c
 +double
 +__ieee754_sqrt (double x)
 +{
-+   return __slow_ieee754_sqrt (x);
++  return __slow_ieee754_sqrt (x);
 +}
 +
  strong_alias (__ieee754_sqrt, __sqrt_finite)
-Index: git/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c
-===================================================================
---- git.orig/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c	2014-08-29 10:35:02.616070587 -0700
-+++ git/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c	2014-08-29 10:35:02.608070587 -0700
-@@ -39,10 +39,10 @@
+diff --git a/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c b/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
+index a917f31..fae2d81 100644
+--- a/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
++++ b/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
+@@ -38,7 +38,7 @@ static const float threehalf = 1.5;
+    square root.  */
  
- #ifdef __STDC__
  float
 -__ieee754_sqrtf (float b)
 +__slow_ieee754_sqrtf (float b)
- #else
- float
--__ieee754_sqrtf (b)
-+__slow_ieee754_sqrtf (b)
-      float b;
- #endif
  {
-@@ -99,4 +99,12 @@
+   if (__builtin_expect (b > 0, 1))
+     {
+@@ -93,4 +93,11 @@ __ieee754_sqrtf (float b)
      }
    return f_washf (b);
  }
-+
 +#undef __ieee754_sqrtf
 +float
 +__ieee754_sqrtf (float x)
@@ -260,11 +313,11 @@ Index: git/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c
 +}
 +
  strong_alias (__ieee754_sqrtf, __sqrtf_finite)
-Index: git/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c
-===================================================================
---- git.orig/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c	2014-08-29 10:35:02.616070587 -0700
-+++ git/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c	2014-08-29 10:35:02.608070587 -0700
-@@ -41,10 +41,10 @@
+diff --git a/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c b/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c
+index fc4a749..7038a70 100644
+--- a/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c
++++ b/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c
+@@ -41,10 +41,10 @@ static const float half = 0.5;
  
  #ifdef __STDC__
  double
@@ -277,7 +330,7 @@ Index: git/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c
       double b;
  #endif
  {
-@@ -83,7 +83,7 @@
+@@ -83,7 +83,7 @@ __ieee754_sqrt (b)
  
            /* Handle small numbers by scaling.  */
            if (__builtin_expect ((u.parts.msw & 0x7ff00000) <= 0x02000000, 0))
@@ -286,7 +339,7 @@ Index: git/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c
  
  #define FMADD(a_, c_, b_)                                               \
            ({ double __r;                                                \
-@@ -132,4 +132,12 @@
+@@ -132,4 +132,12 @@ __ieee754_sqrt (b)
      }
    return f_wash (b);
  }
@@ -299,11 +352,11 @@ Index: git/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c
 +}
 +
  strong_alias (__ieee754_sqrt, __sqrt_finite)
-Index: git/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c
-===================================================================
---- git.orig/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c	2014-08-29 10:35:02.616070587 -0700
-+++ git/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c	2014-08-29 10:35:02.608070587 -0700
-@@ -39,10 +39,10 @@
+diff --git a/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c b/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c
+index 9d17512..10de1f0 100644
+--- a/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c
++++ b/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c
+@@ -39,10 +39,10 @@ static const float threehalf = 1.5;
  
  #ifdef __STDC__
  float
@@ -316,41 +369,7 @@ Index: git/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c
       float b;
  #endif
  {
-@@ -99,4 +99,12 @@
-     }
-   return f_washf (b);
- }
-+
-+#undef __ieee754_sqrtf
-+float
-+__ieee754_sqrtf (float x)
-+{
-+  return __slow_ieee754_sqrtf (x);
-+}
-+
- strong_alias (__ieee754_sqrtf, __sqrtf_finite)
-Index: git/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c
-===================================================================
---- git.orig/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c	2014-08-29 10:35:02.616070587 -0700
-+++ git/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c	2014-08-29 10:35:02.608070587 -0700
-@@ -132,4 +132,12 @@
-     }
-   return f_wash (b);
- }
-+
-+#undef __ieee754_sqrt
-+double
-+__ieee754_sqrt (double x)
-+{
-+   return __slow_ieee754_sqrt (x);
-+}
-+
- strong_alias (__ieee754_sqrt, __sqrt_finite)
-Index: git/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c
-===================================================================
---- git.orig/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c	2014-08-29 10:35:02.616070587 -0700
-+++ git/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c	2014-08-29 10:35:02.608070587 -0700
-@@ -99,4 +99,12 @@
+@@ -99,4 +99,12 @@ __ieee754_sqrtf (b)
      }
    return f_washf (b);
  }
@@ -363,3 +382,6 @@ Index: git/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c
 +}
 +
  strong_alias (__ieee754_sqrtf, __sqrtf_finite)
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/glibc/glibc/0001-R_ARM_TLS_DTPOFF32.patch b/meta/recipes-core/glibc/glibc/0009-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
similarity index 78%
rename from meta/recipes-core/glibc/glibc/0001-R_ARM_TLS_DTPOFF32.patch
rename to meta/recipes-core/glibc/glibc/0009-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
index 3922cb8..ea2f88f 100644
--- a/meta/recipes-core/glibc/glibc/0001-R_ARM_TLS_DTPOFF32.patch
+++ b/meta/recipes-core/glibc/glibc/0009-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
@@ -1,21 +1,24 @@
-
-Quote from bug 1443 which explains what the patch does : 
+From 3735f8f652d76a677a715ac6dc6cf8662f683ca9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 18 Mar 2015 00:20:09 +0000
+Subject: [PATCH 09/27] Quote from bug 1443 which explains what the patch does
+ :
 
   We build some random program and link it with -lust.  When we run it,
   it dies with a SIGSEGV before reaching main().
-  
+
   Libust.so depends on liburcu-bp.so from the usermode-rcu package.
   Although libust.so is not prelinked, liburcu-bp.so IS prelinked; this
   is critical.
-  
+
   Libust.so uses a TLS / __thread variable that is defined in liburcu-
   bp.so.  There are special ARM-specific relocation types that allow two
   shared libraries to share thread-specific data.  This is critical too.
-  
+
   One more critical issue: although liburcu-bp.so is prelinked, we can't
   load it at its prelinked address, because we also link against
   librt.so, and librt.so uses that address.
-  
+
   The dynamic linker is forced to relink liburcu-bp.so at a different
   address.  In the course of relinking, it processes the special ARM
   relocation record mentioned above.  The prelinker has already filled
@@ -24,7 +27,7 @@ Quote from bug 1443 which explains what the patch does :
   TLS.  Because the normal behavior of a relocation is to add the symbol
   value to an addend stored at the address being relocated, we end up
   adding the short offset to itself, doubling it.
-  
+
   Now we have an awkward situation.  The libust.so library doesn't know
   about the addend, so its TLS data for this element is correct.  The
   liburcu-bp.so library has a different offset for the element.  When we
@@ -36,16 +39,16 @@ Quote from bug 1443 which explains what the patch does :
 Upstream-Status: Pending
 
 Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- .../libc/ports/sysdeps/arm/dl-machine.h            |    2 +-
+ sysdeps/arm/dl-machine.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-ndex 8d905e8..dcfa71e 100644
-Index: git/sysdeps/arm/dl-machine.h
-===================================================================
---- git.orig/sysdeps/arm/dl-machine.h	2014-08-27 05:30:47.748070587 +0000
-+++ git/sysdeps/arm/dl-machine.h	2014-08-27 05:30:47.740070587 +0000
-@@ -495,7 +495,7 @@
+diff --git a/sysdeps/arm/dl-machine.h b/sysdeps/arm/dl-machine.h
+index f901538..8f83e87 100644
+--- a/sysdeps/arm/dl-machine.h
++++ b/sysdeps/arm/dl-machine.h
+@@ -495,7 +495,7 @@ elf_machine_rel (struct link_map *map, const Elf32_Rel *reloc,
  
  	case R_ARM_TLS_DTPOFF32:
  	  if (sym != NULL)
@@ -54,3 +57,6 @@ Index: git/sysdeps/arm/dl-machine.h
  	  break;
  
  	case R_ARM_TLS_TPOFF32:
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/glibc/glibc/0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch b/meta/recipes-core/glibc/glibc/0010-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
similarity index 69%
rename from meta/recipes-core/glibc/glibc/0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
rename to meta/recipes-core/glibc/glibc/0010-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
index f341282..532361d 100644
--- a/meta/recipes-core/glibc/glibc/0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
+++ b/meta/recipes-core/glibc/glibc/0010-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
@@ -1,7 +1,7 @@
-From 713d822908d1b2ae8403af7f9375c7054ed3dd49 Mon Sep 17 00:00:00 2001
+From 5ab218aed60c6d35c4e562a200189dd499b22beb Mon Sep 17 00:00:00 2001
 From: Ting Liu <b28495@freescale.com>
 Date: Wed, 19 Dec 2012 04:39:57 -0600
-Subject: [PATCH] eglibc: run libm-err-tab.pl with specific dirs in ${S}
+Subject: [PATCH 10/27] eglibc: run libm-err-tab.pl with specific dirs in ${S}
 
 libm-err-tab.pl will parse all the files named "libm-test-ulps"
 in the given dir recursively. To avoid parsing the one in
@@ -14,14 +14,14 @@ Upstream-Status: inappropriate [OE specific]
 
 Signed-off-by: Ting Liu <b28495@freescale.com>
 ---
- manual/Makefile |    3 ++-
+ manual/Makefile | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
-Index: git/manual/Makefile
-===================================================================
---- git.orig/manual/Makefile	2014-08-29 10:35:18.728070587 -0700
-+++ git/manual/Makefile	2014-08-29 10:35:18.720070587 -0700
-@@ -105,7 +105,8 @@
+diff --git a/manual/Makefile b/manual/Makefile
+index 5382208..6b701b0 100644
+--- a/manual/Makefile
++++ b/manual/Makefile
+@@ -105,7 +105,8 @@ $(objpfx)libm-err.texi: $(objpfx)stamp-libm-err
  $(objpfx)stamp-libm-err: libm-err-tab.pl $(wildcard $(foreach dir,$(sysdirs),\
  						     $(dir)/libm-test-ulps))
  	pwd=`pwd`; \
@@ -31,3 +31,6 @@ Index: git/manual/Makefile
  	$(move-if-change) $(objpfx)libm-err-tmp $(objpfx)libm-err.texi
  	touch $@
  
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/glibc/glibc/ppce6500-32b_slow_ieee754_sqrt.patch b/meta/recipes-core/glibc/glibc/0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
similarity index 46%
rename from meta/recipes-core/glibc/glibc/ppce6500-32b_slow_ieee754_sqrt.patch
rename to meta/recipes-core/glibc/glibc/0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
index 4c6c107..34a96bd 100644
--- a/meta/recipes-core/glibc/glibc/ppce6500-32b_slow_ieee754_sqrt.patch
+++ b/meta/recipes-core/glibc/glibc/0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
@@ -1,13 +1,23 @@
- __ieee754_sqrt{,f} are now inline functions and call out __slow versions
+From 046ae0c3f442fe19bbd49672a93e4f8d8bbbe03b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 18 Mar 2015 00:24:46 +0000
+Subject: [PATCH 11/27] __ieee754_sqrt{,f} are now inline functions and call
+ out __slow versions
 
+Upstream-Status: Pending
 
 Signed-off-by: chunrong guo <B40290@freescale.com>
-Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c  | 6 +++---
+ sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c | 4 ++--
+ 2 files changed, 5 insertions(+), 5 deletions(-)
 
-diff -rNu libc-orig/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c libc/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c
---- libc-orig/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c	2014-04-08 04:39:58.487229887 -0500
-+++ libc/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c	2014-04-08 04:40:52.643069198 -0500
-@@ -41,10 +41,10 @@
+diff --git a/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c b/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c
+index 1c34244..7038a70 100644
+--- a/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c
++++ b/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c
+@@ -41,10 +41,10 @@ static const float half = 0.5;
  
  #ifdef __STDC__
  double
@@ -20,7 +30,7 @@ diff -rNu libc-orig/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c libc/sysdeps/po
       double b;
  #endif
  {
-@@ -83,7 +83,7 @@
+@@ -83,7 +83,7 @@ __ieee754_sqrt (b)
  
            /* Handle small numbers by scaling.  */
            if (__builtin_expect ((u.parts.msw & 0x7ff00000) <= 0x02000000, 0))
@@ -29,10 +39,11 @@ diff -rNu libc-orig/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c libc/sysdeps/po
  
  #define FMADD(a_, c_, b_)                                               \
            ({ double __r;                                                \
-diff -rNu libc-orig/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c libc/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c
---- libc-orig/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c	2014-04-08 04:39:58.487229887 -0500
-+++ libc/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c	2014-04-08 04:41:26.017067682 -0500
-@@ -39,10 +39,10 @@
+diff --git a/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c b/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c
+index 8126535..10de1f0 100644
+--- a/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c
++++ b/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c
+@@ -39,10 +39,10 @@ static const float threehalf = 1.5;
  
  #ifdef __STDC__
  float
@@ -45,3 +56,6 @@ diff -rNu libc-orig/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c libc/sysdeps/p
       float b;
  #endif
  {
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/glibc/glibc/grok_gold.patch b/meta/recipes-core/glibc/glibc/0012-Make-ld-version-output-matching-grok-gold-s-output.patch
similarity index 62%
rename from meta/recipes-core/glibc/glibc/grok_gold.patch
rename to meta/recipes-core/glibc/glibc/0012-Make-ld-version-output-matching-grok-gold-s-output.patch
index 5151802..2e266c3 100644
--- a/meta/recipes-core/glibc/glibc/grok_gold.patch
+++ b/meta/recipes-core/glibc/glibc/0012-Make-ld-version-output-matching-grok-gold-s-output.patch
@@ -1,16 +1,23 @@
-Make ld --version output matching grok gold's output
+From fdb93bd5db0d3aec3c9da49897654299c72a64b9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 18 Mar 2015 00:25:45 +0000
+Subject: [PATCH 12/27] Make ld --version output matching grok gold's output
 
 adapted from from upstream branch roland/gold-vs-libc
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Backport
 
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure    | 2 +-
+ configure.ac | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
 
-Index: git/configure
-===================================================================
---- git.orig/configure
-+++ git/configure
-@@ -4593,7 +4593,7 @@ else
+diff --git a/configure b/configure
+index 45cc7cb..7d7299a 100755
+--- a/configure
++++ b/configure
+@@ -4709,7 +4709,7 @@ else
    # Found it, now check the version.
    { $as_echo "$as_me:${as_lineno-$LINENO}: checking version of $LD" >&5
  $as_echo_n "checking version of $LD... " >&6; }
@@ -19,11 +26,11 @@ Index: git/configure
    case $ac_prog_version in
      '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
      2.1[0-9][0-9]*|2.2[2-9]*|2.[3-9][0-9]*|[3-9].*|[1-9][0-9]*)
-Index: git/configure.ac
-===================================================================
---- git.orig/configure.ac
-+++ git/configure.ac
-@@ -913,7 +913,7 @@ AC_CHECK_PROG_VER(AS, $AS, --version,
+diff --git a/configure.ac b/configure.ac
+index 7e9383a..a467a69 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -941,7 +941,7 @@ AC_CHECK_PROG_VER(AS, $AS, --version,
  		  [2.1[0-9][0-9]*|2.2[2-9]*|2.[3-9][0-9]*|[3-9].*|[1-9][0-9]*],
  		  AS=: critic_missing="$critic_missing as")
  AC_CHECK_PROG_VER(LD, $LD, --version,
@@ -32,3 +39,6 @@ Index: git/configure.ac
  		  [2.1[0-9][0-9]*|2.2[2-9]*|2.[3-9][0-9]*|[3-9].*|[1-9][0-9]*],
  		  LD=: critic_missing="$critic_missing ld")
  
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/glibc/glibc/0013-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch b/meta/recipes-core/glibc/glibc/0013-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
new file mode 100644
index 0000000..c74cee6
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0013-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
@@ -0,0 +1,42 @@
+From d8bc18625a67f5c704f40d9dae9e4f731bd45cd0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 18 Mar 2015 00:27:10 +0000
+Subject: [PATCH 13/27] sysdeps/gnu/configure.ac: handle correctly
+ $libc_cv_rootsbindir
+
+Upstream-Status:Pending
+
+Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ sysdeps/gnu/configure    | 2 +-
+ sysdeps/gnu/configure.ac | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/sysdeps/gnu/configure b/sysdeps/gnu/configure
+index 9239297..c5ed3ca 100644
+--- a/sysdeps/gnu/configure
++++ b/sysdeps/gnu/configure
+@@ -32,6 +32,6 @@ case "$prefix" in
+   else
+     libc_cv_localstatedir=$localstatedir
+    fi
+-  libc_cv_rootsbindir=/sbin
++  test -n "$libc_cv_rootsbindir" || libc_cv_rootsbindir=/sbin
+   ;;
+ esac
+diff --git a/sysdeps/gnu/configure.ac b/sysdeps/gnu/configure.ac
+index 634fe4d..3db1697 100644
+--- a/sysdeps/gnu/configure.ac
++++ b/sysdeps/gnu/configure.ac
+@@ -21,6 +21,6 @@ case "$prefix" in
+   else
+     libc_cv_localstatedir=$localstatedir
+    fi
+-  libc_cv_rootsbindir=/sbin
++  test -n "$libc_cv_rootsbindir" || libc_cv_rootsbindir=/sbin
+   ;;
+ esac
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/glibc/glibc/0001-Add-unused-attribute.patch b/meta/recipes-core/glibc/glibc/0014-Add-unused-attribute.patch
similarity index 78%
rename from meta/recipes-core/glibc/glibc/0001-Add-unused-attribute.patch
rename to meta/recipes-core/glibc/glibc/0014-Add-unused-attribute.patch
index f51a0cc..78cd38a 100644
--- a/meta/recipes-core/glibc/glibc/0001-Add-unused-attribute.patch
+++ b/meta/recipes-core/glibc/glibc/0014-Add-unused-attribute.patch
@@ -1,16 +1,14 @@
-2015-02-18  Khem Raj  <raj.khem@gmail.com>>
-
-        * iconv/gconv_charset.h (strip):
-        Add unused attribute.
-
-From 9c4a91cb331ff1e8cde2314dadee74559d8cb0dd Mon Sep 17 00:00:00 2001
+From 5a955b9c21c372509b930fc2ce28416baa1994d0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 18 Feb 2015 19:45:31 +0000
-Subject: [PATCH] Add unused attribute
+Date: Wed, 18 Mar 2015 00:28:41 +0000
+Subject: [PATCH 14/27] Add unused attribute
 
 Helps in avoiding gcc warning when header is is included in
 a source file which does not use both functions
 
+        * iconv/gconv_charset.h (strip):
+        Add unused attribute.
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Upstream-Status: Pending
diff --git a/meta/recipes-core/glibc/glibc/0001-When-disabling-SSE-also-make-sure-that-fpmath-is-not.patch b/meta/recipes-core/glibc/glibc/0015-When-disabling-SSE-also-make-sure-that-fpmath-is-not.patch
similarity index 83%
rename from meta/recipes-core/glibc/glibc/0001-When-disabling-SSE-also-make-sure-that-fpmath-is-not.patch
rename to meta/recipes-core/glibc/glibc/0015-When-disabling-SSE-also-make-sure-that-fpmath-is-not.patch
index a6395b7..0f40cc9 100644
--- a/meta/recipes-core/glibc/glibc/0001-When-disabling-SSE-also-make-sure-that-fpmath-is-not.patch
+++ b/meta/recipes-core/glibc/glibc/0015-When-disabling-SSE-also-make-sure-that-fpmath-is-not.patch
@@ -1,8 +1,8 @@
-From 6f5639f6405ff9a42e4f71e7b0f18bddb68d992a Mon Sep 17 00:00:00 2001
+From 6fb920fb3fdf6f35d9db1717dddceb7fa91fee40 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 19 Feb 2015 03:23:45 +0000
-Subject: [PATCH] When disabling SSE also make sure that fpmath is not set to
- use SSE as well
+Subject: [PATCH 15/27] When disabling SSE also make sure that fpmath is not
+ set to use SSE as well
 
 This fixes errors when we inject sse options through CFLAGS and now
 that we have -Werror turned on by default this warning turns to become
diff --git a/meta/recipes-core/glibc/glibc/0001-yes-within-the-path-sets-wrong-config-variables.patch b/meta/recipes-core/glibc/glibc/0016-yes-within-the-path-sets-wrong-config-variables.patch
similarity index 87%
rename from meta/recipes-core/glibc/glibc/0001-yes-within-the-path-sets-wrong-config-variables.patch
rename to meta/recipes-core/glibc/glibc/0016-yes-within-the-path-sets-wrong-config-variables.patch
index 827e980..0a245e7 100644
--- a/meta/recipes-core/glibc/glibc/0001-yes-within-the-path-sets-wrong-config-variables.patch
+++ b/meta/recipes-core/glibc/glibc/0016-yes-within-the-path-sets-wrong-config-variables.patch
@@ -1,4 +1,7 @@
-'yes' within the path sets wrong config variables
+From 2c3d1096954700f80bfdd966b4e40051dc2fba56 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 18 Mar 2015 00:31:06 +0000
+Subject: [PATCH 16/27] 'yes' within the path sets wrong config variables
 
 It seems that the 'AC_EGREP_CPP(yes...' example is quite popular
 but being such a short word to grep it is likely to produce
@@ -9,7 +12,22 @@ The change is to use a more elaborated string to grep for.
 Upstream-Status: Submitted [libc-alpha@sourceware.org]
 
 Signed-off-by: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+ sysdeps/aarch64/configure                              | 4 ++--
+ sysdeps/aarch64/configure.ac                           | 4 ++--
+ sysdeps/arm/configure                                  | 4 ++--
+ sysdeps/arm/configure.ac                               | 4 ++--
+ sysdeps/mips/configure                                 | 4 ++--
+ sysdeps/mips/configure.ac                              | 4 ++--
+ sysdeps/nios2/configure                                | 4 ++--
+ sysdeps/nios2/configure.ac                             | 4 ++--
+ sysdeps/unix/sysv/linux/mips/configure                 | 4 ++--
+ sysdeps/unix/sysv/linux/mips/configure.ac              | 4 ++--
+ sysdeps/unix/sysv/linux/powerpc/powerpc64/configure    | 8 ++++----
+ sysdeps/unix/sysv/linux/powerpc/powerpc64/configure.ac | 8 ++++----
+ 12 files changed, 28 insertions(+), 28 deletions(-)
+
 diff --git a/sysdeps/aarch64/configure b/sysdeps/aarch64/configure
 index 5bd355a..3bc5537 100644
 --- a/sysdeps/aarch64/configure
@@ -45,10 +63,10 @@ index 7851dd4..6e92381 100644
    ], libc_cv_aarch64_be=yes, libc_cv_aarch64_be=no)])
  if test $libc_cv_aarch64_be = yes; then
 diff --git a/sysdeps/arm/configure b/sysdeps/arm/configure
-index 45667cc..0b2ef11 100644
+index 158116b..5eaf54e 100644
 --- a/sysdeps/arm/configure
 +++ b/sysdeps/arm/configure
-@@ -150,12 +150,12 @@ else
+@@ -151,12 +151,12 @@ else
    cat confdefs.h - <<_ACEOF >conftest.$ac_ext
  /* end confdefs.h.  */
  #ifdef __ARM_PCS_VFP
@@ -64,10 +82,10 @@ index 45667cc..0b2ef11 100644
  else
    libc_cv_arm_pcs_vfp=no
 diff --git a/sysdeps/arm/configure.ac b/sysdeps/arm/configure.ac
-index 002b8ef..e1746a7 100644
+index 859c92a..2f4a6e2 100644
 --- a/sysdeps/arm/configure.ac
 +++ b/sysdeps/arm/configure.ac
-@@ -16,8 +16,8 @@ dnl it.  Until we do, don't define it.
+@@ -15,8 +15,8 @@ AC_DEFINE(PI_STATIC_AND_HIDDEN)
  # the dynamic linker via %ifdef.
  AC_CACHE_CHECK([whether the compiler is using the ARM hard-float ABI],
    [libc_cv_arm_pcs_vfp],
@@ -241,5 +259,5 @@ index 0822915..9a32fdd 100644
      ], libc_cv_ppc64_def_call_elf=yes, libc_cv_ppc64_def_call_elf=no)])
    if test $libc_cv_ppc64_def_call_elf = no; then
 -- 
-1.8.4.5
+2.1.4
 
diff --git a/meta/recipes-core/glibc/glibc/timezone-re-written-tzselect-as-posix-sh.patch b/meta/recipes-core/glibc/glibc/0017-timezone-re-written-tzselect-as-posix-sh.patch
similarity index 53%
rename from meta/recipes-core/glibc/glibc/timezone-re-written-tzselect-as-posix-sh.patch
rename to meta/recipes-core/glibc/glibc/0017-timezone-re-written-tzselect-as-posix-sh.patch
index 55547de..0fb5735 100644
--- a/meta/recipes-core/glibc/glibc/timezone-re-written-tzselect-as-posix-sh.patch
+++ b/meta/recipes-core/glibc/glibc/0017-timezone-re-written-tzselect-as-posix-sh.patch
@@ -1,21 +1,25 @@
-timezone: re-written tzselect as posix sh
+From 9f4cc3e97a7384b3df5a3fe7e5e45d4a6316a99d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 18 Mar 2015 00:33:03 +0000
+Subject: [PATCH 17/27] timezone: re-written tzselect as posix sh
 
 To avoid the bash dependency.
 
 Upstream-Status: Pending
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  timezone/Makefile     | 2 +-
  timezone/tzselect.ksh | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
-Index: git/timezone/Makefile
-===================================================================
---- git.orig/timezone/Makefile	2014-08-27 05:35:58.008070587 +0000
-+++ git/timezone/Makefile	2014-08-27 05:36:37.908070587 +0000
-@@ -114,7 +114,7 @@
- 
+diff --git a/timezone/Makefile b/timezone/Makefile
+index 24c93c6..886b06e 100644
+--- a/timezone/Makefile
++++ b/timezone/Makefile
+@@ -126,7 +126,7 @@ $(testdata)/XT%: testdata/XT%
+ 	cp $< $@
  
  $(objpfx)tzselect: tzselect.ksh $(common-objpfx)config.make
 -	sed -e 's|/bin/bash|$(BASH)|' \
@@ -23,11 +27,11 @@ Index: git/timezone/Makefile
  	    -e 's|TZDIR=[^}]*|TZDIR=$(zonedir)|' \
  	    -e '/TZVERSION=/s|see_Makefile|"$(version)"|' \
  	    -e '/PKGVERSION=/s|=.*|="$(PKGVERSION)"|' \
-Index: git/timezone/tzselect.ksh
-===================================================================
---- git.orig/timezone/tzselect.ksh	2014-08-27 05:35:58.008070587 +0000
-+++ git/timezone/tzselect.ksh	2014-08-27 05:35:58.000070587 +0000
-@@ -35,7 +35,7 @@
+diff --git a/timezone/tzselect.ksh b/timezone/tzselect.ksh
+index 9d70691..25f45a8 100755
+--- a/timezone/tzselect.ksh
++++ b/timezone/tzselect.ksh
+@@ -35,7 +35,7 @@ REPORT_BUGS_TO=tz@iana.org
  
  # Specify default values for environment variables if they are unset.
  : ${AWK=awk}
@@ -36,3 +40,6 @@ Index: git/timezone/tzselect.ksh
  
  # Check for awk Posix compliance.
  ($AWK -v x=y 'BEGIN { exit 123 }') </dev/null >/dev/null 2>&1
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/glibc/glibc/eglibc.patch b/meta/recipes-core/glibc/glibc/0018-eglibc-Cross-building-and-testing-instructions.patch
similarity index 83%
rename from meta/recipes-core/glibc/glibc/eglibc.patch
rename to meta/recipes-core/glibc/glibc/0018-eglibc-Cross-building-and-testing-instructions.patch
index fdfabc3..63a6eb1 100644
--- a/meta/recipes-core/glibc/glibc/eglibc.patch
+++ b/meta/recipes-core/glibc/glibc/0018-eglibc-Cross-building-and-testing-instructions.patch
@@ -1,15 +1,28 @@
-Instruction documents from eglibc
+From 00c0766e67c7ce7e2e4b51c62e98a64e04cd58a0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 18 Mar 2015 00:42:58 +0000
+Subject: [PATCH 18/27] eglibc: Cross building and testing instructions
 
+Ported from eglibc
 Upstream-Status: Pending
 
-Index: git/EGLIBC.cross-building
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/EGLIBC.cross-building	2014-08-27 07:27:25.580070587 +0000
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ GLIBC.cross-building | 383 +++++++++++++++++++++++++++++++++++++++++++++++++++
+ GLIBC.cross-testing  | 205 +++++++++++++++++++++++++++
+ 2 files changed, 588 insertions(+)
+ create mode 100644 GLIBC.cross-building
+ create mode 100644 GLIBC.cross-testing
+
+diff --git a/GLIBC.cross-building b/GLIBC.cross-building
+new file mode 100644
+index 0000000..e6e0da1
+--- /dev/null
++++ b/GLIBC.cross-building
 @@ -0,0 +1,383 @@
 +                                                        -*- mode: text -*-
 +
-+                        Cross-Compiling EGLIBC
++                        Cross-Compiling GLIBC
 +                  Jim Blandy <jimb@codesourcery.com>
 +
 +
@@ -39,11 +52,11 @@ Index: git/EGLIBC.cross-building
 +library are distributed separately, they are not actually independent
 +of each other: GCC requires the C library's headers and some object
 +files to compile its own libraries, while the C library depends on
-+GCC's libraries.  EGLIBC includes features and bug fixes to the stock
++GCC's libraries.  GLIBC includes features and bug fixes to the stock
 +GNU C library that simplify this process, but the fundamental
 +interdependency stands.
 +
-+In this document, we explain how to cross-compile an EGLIBC/GCC pair
++In this document, we explain how to cross-compile an GLIBC/GCC pair
 +from source.  Our intended audience is developers who are already
 +familiar with the GNU toolchain and comfortable working with
 +cross-development tools.  While we do present a worked example to
@@ -53,7 +66,7 @@ Index: git/EGLIBC.cross-building
 +
 +Preparation
 +
-+EGLIBC requires recent versions of the GNU binutils, GCC, and the
++GLIBC requires recent versions of the GNU binutils, GCC, and the
 +Linux kernel.  The web page <http://www.eglibc.org/prerequisites>
 +documents the current requirements, and lists patches needed for
 +certain target architectures.  As of this writing, these build
@@ -61,7 +74,7 @@ Index: git/EGLIBC.cross-building
 +and Linux 3.1.
 +
 +First, let's set some variables, to simplify later commands.  We'll
-+build EGLIBC and GCC for an ARM target, known to the Linux kernel
++build GLIBC and GCC for an ARM target, known to the Linux kernel
 +as 'arm', and we'll do the build on an Intel x86_64 Linux box:
 +
 +    $ build=x86_64-pc-linux-gnu
@@ -77,13 +90,13 @@ Index: git/EGLIBC.cross-building
 +
 +We're carrying out the entire process under '~/cross-build', which
 +contains unpacked source trees for binutils, gcc, and linux kernel,
-+along with EGLIBC svn trunk (which can be checked-out with
++along with GLIBC svn trunk (which can be checked-out with
 +'svn co http://www.eglibc.org/svn/trunk eglibc'):
 +
 +    $ top=$HOME/cross-build/$target
 +    $ src=$HOME/cross-build/src
 +    $ ls $src
-+    binutils-2.22.51  eglibc  gcc-4.6.2  linux-3.1
++    binutils-2.22.51  glibc  gcc-4.6.2  linux-3.1
 +
 +We're going to place our build directories in a subdirectory 'obj',
 +we'll install the cross-development toolchain in 'tools', and we'll
@@ -113,7 +126,7 @@ Index: git/EGLIBC.cross-building
 +
 +For our work, we need a cross-compiler targeting an ARM Linux
 +system.  However, that configuration includes the shared library
-+'libgcc_s.so', which is compiled against the EGLIBC headers (which we
++'libgcc_s.so', which is compiled against the GLIBC headers (which we
 +haven't installed yet) and linked against 'libc.so' (which we haven't
 +built yet).
 +
@@ -146,7 +159,7 @@ Index: git/EGLIBC.cross-building
 +
 +Linux Kernel Headers
 +
-+To configure EGLIBC, we also need Linux kernel headers in place.
++To configure GLIBC, we also need Linux kernel headers in place.
 +Fortunately, the Linux makefiles have a target that installs them for
 +us.  Since the process does modify the source tree a bit, we make a
 +copy first:
@@ -162,20 +175,20 @@ Index: git/EGLIBC.cross-building
 +    >      INSTALL_HDR_PATH=$sysroot/usr
 +
 +
-+EGLIBC Headers and Preliminary Objects
++GLIBC Headers and Preliminary Objects
 +
-+Using the cross-compiler we've just built, we can now configure EGLIBC
++Using the cross-compiler we've just built, we can now configure GLIBC
 +well enough to install the headers and build the object files that the
 +full cross-compiler will need:
 +
-+    $ mkdir -p $obj/eglibc-headers
-+    $ cd $obj/eglibc-headers
++    $ mkdir -p $obj/glibc-headers
++    $ cd $obj/glibc-headers
 +    $ BUILD_CC=gcc \
 +    > CC=$tools/bin/$target-gcc \
 +    > CXX=$tools/bin/$target-g++ \
 +    > AR=$tools/bin/$target-ar \
 +    > RANLIB=$tools/bin/$target-ranlib \
-+    > $src/eglibc/libc/configure \
++    > $src/glibc/libc/configure \
 +    >     --prefix=/usr \
 +    >     --with-headers=$sysroot/usr/include \
 +    >     --build=$build \
@@ -184,20 +197,20 @@ Index: git/EGLIBC.cross-building
 +    >     --enable-add-ons=nptl,libidn,../ports
 +
 +The option '--prefix=/usr' may look strange, but you should never
-+configure EGLIBC with a prefix other than '/usr': in various places,
-+EGLIBC's build system checks whether the prefix is '/usr', and does
++configure GLIBC with a prefix other than '/usr': in various places,
++GLIBC's build system checks whether the prefix is '/usr', and does
 +special handling only if that is the case.  Unless you use this
 +prefix, you will get a sysroot that does not use the standard Linux
 +directory layouts and cannot be used as a basis for the root
 +filesystem on your target system compatibly with normal GLIBC
 +installations.
 +
-+The '--with-headers' option tells EGLIBC where the Linux headers have
++The '--with-headers' option tells GLIBC where the Linux headers have
 +been installed.
 +
-+The '--enable-add-ons=nptl,libidn,../ports' option tells EGLIBC to look
++The '--enable-add-ons=nptl,libidn,../ports' option tells GLIBC to look
 +for the listed glibc add-ons. Most notably the ports add-on (located
-+just above the libc sources in the EGLIBC svn tree) is required to
++just above the libc sources in the GLIBC svn tree) is required to
 +support ARM targets.
 +
 +We can now use the 'install-headers' makefile target to install the
@@ -230,8 +243,8 @@ Index: git/EGLIBC.cross-building
 +
 +The Second GCC
 +
-+With the EGLIBC headers and selected object files installed, we can
-+now build a GCC that is capable of compiling EGLIBC.  We configure,
++With the GLIBC headers and selected object files installed, we can
++now build a GCC that is capable of compiling GLIBC.  We configure,
 +build, and install the second GCC, again building only the C compiler,
 +and avoiding libraries we won't use:
 +
@@ -248,19 +261,19 @@ Index: git/EGLIBC.cross-building
 +    $ PATH=$tools/bin:$PATH make install
 +
 +
-+EGLIBC, Complete
++GLIBC, Complete
 +
 +With the second compiler built and installed, we're now ready for the
-+full EGLIBC build:
++full GLIBC build:
 +
-+    $ mkdir -p $obj/eglibc
-+    $ cd $obj/eglibc
++    $ mkdir -p $obj/glibc
++    $ cd $obj/glibc
 +    $ BUILD_CC=gcc \
 +    > CC=$tools/bin/$target-gcc \
 +    > CXX=$tools/bin/$target-g++ \
 +    > AR=$tools/bin/$target-ar \
 +    > RANLIB=$tools/bin/$target-ranlib \
-+    > $src/eglibc/libc/configure \
++    > $src/glibc/libc/configure \
 +    >     --prefix=/usr \
 +    >     --with-headers=$sysroot/usr/include \
 +    >     --with-kconfig=$obj/linux/scripts/kconfig \
@@ -269,9 +282,9 @@ Index: git/EGLIBC.cross-building
 +    >     --disable-profile --without-gd --without-cvs \
 +    >     --enable-add-ons=nptl,libidn,../ports
 +
-+Note the additional '--with-kconfig' option. This tells EGLIBC where to
++Note the additional '--with-kconfig' option. This tells GLIBC where to
 +find the host config tools used by the kernel 'make config' and 'make
-+menuconfig'.  These tools can be re-used by EGLIBC for its own 'make
++menuconfig'.  These tools can be re-used by GLIBC for its own 'make
 +*config' support, which will create 'option-groups.config' for you.
 +But first make sure those tools have been built by running some
 +dummy 'make *config' calls in the kernel directory:
@@ -282,15 +295,15 @@ Index: git/EGLIBC.cross-building
 +    $ PATH=$tools/bin:$PATH make menuconfig \
 +    >      ARCH=$linux_arch CROSS_COMPILE=$target- \
 +
-+Now we can configure and build the full EGLIBC:
++Now we can configure and build the full GLIBC:
 +
-+    $ cd $obj/eglibc
++    $ cd $obj/glibc
 +    $ PATH=$tools/bin:$PATH make defconfig
 +    $ PATH=$tools/bin:$PATH make menuconfig
 +    $ PATH=$tools/bin:$PATH make
 +    $ PATH=$tools/bin:$PATH make install install_root=$sysroot
 +
-+At this point, we have a complete EGLIBC installation in '$sysroot',
++At this point, we have a complete GLIBC installation in '$sysroot',
 +with header files, library files, and most of the C runtime startup
 +files in place.
 +
@@ -314,7 +327,7 @@ Index: git/EGLIBC.cross-building
 +
 +The '--enable-__cxa_atexit' option tells GCC what sort of C++
 +destructor support to expect from the C library; it's required with
-+EGLIBC.
++GLIBC.
 +
 +And since GCC's installation process isn't designed to help construct
 +sysroot trees, we must manually copy certain libraries into place in
@@ -327,7 +340,7 @@ Index: git/EGLIBC.cross-building
 +Trying Things Out
 +
 +At this point, '$tools' contains a cross toolchain ready to use
-+the EGLIBC installation in '$sysroot':
++the GLIBC installation in '$sysroot':
 +
 +    $ cat > hello.c <<EOF
 +    > #include <stdio.h>
@@ -371,7 +384,7 @@ Index: git/EGLIBC.cross-building
 +
 +Looking at the dynamic section of the installed 'libgcc_s.so', we see
 +that the 'NEEDED' entry for the C library does include the '.6'
-+suffix, indicating that was linked against our fully build EGLIBC, and
++suffix, indicating that was linked against our fully build GLIBC, and
 +not our dummy 'libc.so':
 +
 +    $ $tools/bin/$target-readelf -d $sysroot/lib/libgcc_s.so.1
@@ -390,14 +403,15 @@ Index: git/EGLIBC.cross-building
 +    $ $sysroot/lib/ld.so.1 --library-path $sysroot/lib:$sysroot/usr/lib \
 +    > ./c++-hello
 +    Hello, C++ world!
-Index: git/EGLIBC.cross-testing
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/EGLIBC.cross-testing	2014-08-27 07:24:41.532070587 +0000
+diff --git a/GLIBC.cross-testing b/GLIBC.cross-testing
+new file mode 100644
+index 0000000..b67b468
+--- /dev/null
++++ b/GLIBC.cross-testing
 @@ -0,0 +1,205 @@
 +                                                        -*- mode: text -*-
 +
-+                      Cross-Testing With EGLIBC
++                      Cross-Testing With GLIBC
 +                  Jim Blandy <jimb@codesourcery.com>
 +
 +
@@ -408,7 +422,7 @@ Index: git/EGLIBC.cross-testing
 +tests on the embedded system, or perhaps on a simulator.  When
 +configured for cross-compilation, the stock GNU C library simply
 +disables running tests altogether: the command 'make tests' builds
-+test programs, but does not run them.  EGLIBC, however, provides
++test programs, but does not run them.  GLIBC, however, provides
 +facilities for compiling tests and generating data files on the build
 +system, but running the test programs themselves on a remote system or
 +simulator.
@@ -416,12 +430,12 @@ Index: git/EGLIBC.cross-testing
 +
 +Test environment requirements
 +
-+The test environment must meet certain conditions for EGLIBC's
++The test environment must meet certain conditions for GLIBC's
 +cross-testing facilities to work:
 +
 +- Shared filesystems.  The 'build' system, on which you configure and
-+  compile EGLIBC, and the 'host' system, on which you intend to run
-+  EGLIBC, must share a filesystem containing the EGLIBC build and
++  compile GLIBC, and the 'host' system, on which you intend to run
++  GLIBC, must share a filesystem containing the GLIBC build and
 +  source trees.  Files must appear at the same paths on both systems.
 +
 +- Remote-shell like invocation.  There must be a way to run a program
@@ -432,7 +446,7 @@ Index: git/EGLIBC.cross-testing
 +
 +Usage
 +
-+To use EGLIBC's cross-testing support, provide values for the
++To use GLIBC's cross-testing support, provide values for the
 +following Make variables when you invoke 'make':
 +
 +- cross-test-wrapper
@@ -443,7 +457,7 @@ Index: git/EGLIBC.cross-testing
 +- cross-localedef
 +
 +  This should be the name of a cross-capable localedef program, like
-+  that included in the EGLIBC 'localedef' module, along with any
++  that included in the GLIBC 'localedef' module, along with any
 +  arguments needed.
 +
 +These are each explained in detail below.
@@ -475,11 +489,11 @@ Index: git/EGLIBC.cross-testing
 +program, having loaded shared libraries from the appropriate
 +directories.
 +
-+To support cross-testing, EGLIBC allows the developer to optionally
++To support cross-testing, GLIBC allows the developer to optionally
 +set the 'cross-test-wrapper' Make variable to another wrapper command,
 +to which it passes the entire dynamic linker invocation shown above as
 +arguments.  For example, if the developer supplies a wrapper of
-+'my-wrapper hostname', then EGLIBC would run the test above as
++'my-wrapper hostname', then GLIBC would run the test above as
 +follows:
 +
 +    $ my-wrapper hostname \
@@ -501,7 +515,7 @@ Index: git/EGLIBC.cross-testing
 +  current directory it inherits is also inherited by the dynamic
 +  linker (and thus the test program itself).
 +
-+- It must preserve environment variables' values.  Many EGLIBC tests
++- It must preserve environment variables' values.  Many GLIBC tests
 +  set environment variables for test runs; in native testing, it
 +  invokes programs like this:
 +
@@ -529,7 +543,7 @@ Index: git/EGLIBC.cross-testing
 +- It must pass the command's arguments, unmodified.  The arguments
 +  seen by the test program should be exactly those seen by the wrapper
 +  (after whatever arguments are given to the wrapper itself).  The
-+  EGLIBC test framework performs all needed shell word splitting and
++  GLIBC test framework performs all needed shell word splitting and
 +  expansion (wildcard expansion, parameter substitution, and so on)
 +  before invoking the wrapper; further expansion may break the tests.
 +
@@ -537,7 +551,7 @@ Index: git/EGLIBC.cross-testing
 +The 'cross-test-ssh.sh' script
 +
 +If you want to use 'ssh' (or something sufficiently similar) to run
-+test programs on your host system, EGLIBC includes a shell script,
++test programs on your host system, GLIBC includes a shell script,
 +'scripts/cross-test-ssh.sh', which you can use as your wrapper
 +command.  This script takes care of setting the test command's current
 +directory, propagating environment variable values, and carrying
@@ -549,28 +563,28 @@ Index: git/EGLIBC.cross-testing
 +
 +The Cross-Compiling Locale Definition Command
 +
-+Some EGLIBC tests rely on locales generated especially for the test
++Some GLIBC tests rely on locales generated especially for the test
 +process.  In a native configuration, these tests simply run the
-+'localedef' command built by the normal EGLIBC build process,
++'localedef' command built by the normal GLIBC build process,
 +'locale/localedef', to process and install their locales.  However, in
 +a cross-compiling configuration, this 'localedef' is built for the
 +host system, not the build system, and since it requires quite a bit
 +of memory to run (we have seen it fail on systems with 64MiB of
 +memory), it may not be practical to run it on the host system.
 +
-+If set, EGLIBC uses the 'cross-localedef' Make variable as the command
++If set, GLIBC uses the 'cross-localedef' Make variable as the command
 +to run on the build system to process and install locales.  The
-+localedef program built from the EGLIBC 'localedef' module is
++localedef program built from the GLIBC 'localedef' module is
 +suitable.
 +
 +The value of 'cross-localedef' may also include command-line arguments
-+to be passed to the program; if you are using EGLIBC's 'localedef',
++to be passed to the program; if you are using GLIBC's 'localedef',
 +you may include endianness and 'uint32_t' alignment arguments here.
 +
 +
 +Example
 +
-+In developing EGLIBC's cross-testing facility, we invoked 'make' with
++In developing GLIBC's cross-testing facility, we invoked 'make' with
 +the following script:
 +
 +    #!/bin/sh
@@ -592,11 +606,14 @@ Index: git/EGLIBC.cross-testing
 +Other Cross-Testing Concerns
 +
 +Here are notes on some other issues which you may encounter in running
-+the EGLIBC tests in a cross-compiling environment:
++the GLIBC tests in a cross-compiling environment:
 +
 +- Some tests require a C++ cross-compiler; you should set the 'CXX'
 +  Make variable to the name of an appropriate cross-compiler.
 +
 +- Some tests require access to libstdc++.so.6 and libgcc_s.so.1; we
-+  simply place copies of these libraries in the top EGLIBC build
++  simply place copies of these libraries in the top GLIBC build
 +  directory.
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/glibc/glibc/option-groups.patch b/meta/recipes-core/glibc/glibc/0019-eglibc-Bring-Eglibc-option-group-infrastructure-to-g.patch
similarity index 94%
rename from meta/recipes-core/glibc/glibc/option-groups.patch
rename to meta/recipes-core/glibc/glibc/0019-eglibc-Bring-Eglibc-option-group-infrastructure-to-g.patch
index 198be73..ae0009f 100644
--- a/meta/recipes-core/glibc/glibc/option-groups.patch
+++ b/meta/recipes-core/glibc/glibc/0019-eglibc-Bring-Eglibc-option-group-infrastructure-to-g.patch
@@ -1,11 +1,259 @@
-Eglibc option group infrastructure
+From 8ee5d746b945ff660a9723390fbfca98ed89be62 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 18 Mar 2015 00:45:18 +0000
+Subject: [PATCH 19/27] eglibc: Bring Eglibc option group infrastructure to
+ glibc
 
 Upstream-Status: Pending
 
-Index: git/option-groups.def
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/option-groups.def	2014-08-27 07:26:51.652070587 +0000
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ EGLIBC.option-groups              | 122 ++++++
+ Makefile                          |   1 +
+ config.make.in                    |   2 +
+ configure                         |  13 +
+ configure.ac                      |  10 +
+ option-groups.def                 | 868 ++++++++++++++++++++++++++++++++++++++
+ option-groups.defaults            |  47 +++
+ option-groups.mak                 |  41 ++
+ options-config/Makefile           |  55 +++
+ options-config/config-postproc.pl |  58 +++
+ options-config/config-preproc.pl  |   8 +
+ scripts/option-groups.awk         |  63 +++
+ 12 files changed, 1288 insertions(+)
+ create mode 100644 EGLIBC.option-groups
+ create mode 100644 option-groups.def
+ create mode 100644 option-groups.defaults
+ create mode 100644 option-groups.mak
+ create mode 100644 options-config/Makefile
+ create mode 100644 options-config/config-postproc.pl
+ create mode 100644 options-config/config-preproc.pl
+ create mode 100644 scripts/option-groups.awk
+
+diff --git a/EGLIBC.option-groups b/EGLIBC.option-groups
+new file mode 100644
+index 0000000..6a50b8d
+--- /dev/null
++++ b/EGLIBC.option-groups
+@@ -0,0 +1,122 @@
++                                                        -*- mode: text -*-
++
++              The EGLIBC Component Configuration System
++                  Jim Blandy <jimb@codesourcery.com>
++
++Introduction
++
++The GNU C library (GLIBC) provides a broad range of functionality,
++ranging from internationalization support to transcendental
++mathematical functions.  Its website boasts that "nearly all known and
++useful functions from any other C library are available."  This
++exhaustive approach has been one of GLIBC's strengths on desktop and
++server systems, but it has also given GLIBC a large footprint, both in
++memory and on disk, making it a challenge to use in embedded systems
++with limited resources.
++
++The Embedded GNU C library (EGLIBC) is a variant of the GNU C library
++designed to work well on embedded systems.  In particular, EGLIBC's
++component configuration system allows embedded developers to build
++customized versions of the library that include only the features
++their application uses, reducing its space requirements.
++
++EGLIBC's component configuration system categorizes the library's
++functions into "option groups", and allows you to include or exclude
++option groups individually.  Some option groups depend on others;
++EGLIBC tracks these relationships, and ensures that the selected
++configuration yields a functioning library.
++
++
++Consistent and Predictable Behavior
++
++A flexible configuration system is a mixed blessing: if the options
++offered are poorly designed, it can be hard to see which choices will
++have the desired effects, and choices with obscure consequences can
++make debugging difficult.  EGLIBC's configuration follows some general
++principles to reduce these risks:
++
++- EGLIBC has a single default configuration for each target
++  architecture.
++
++- In the default configuration, all option groups are enabled, and
++  EGLIBC is upwardly API- and ABI-compatible with GLIBC.
++
++- As much as possible, configurations only affect what functions are
++  present, not how they behave.  If the system works with an option
++  group disabled, it will still work with it enabled.
++
++- As much as possible, configurations only select option groups ---
++  they do not describe characteristics of the target architecture.
++
++These rules mean that you have a simple debugging strategy available
++if you suspect that your EGLIBC configuration might be the source of a
++problem: fall back to the default configuration, re-test, and then
++disable option groups one by one, until the problem reappears.
++
++
++The Option Groups
++
++To see the current full list of implemented option groups, refer to the
++file 'option-groups.def' at the top of the source tree, or run
++'make menuconfig' from the top-level build directory.
++
++The POSIX.1-2001 specification includes a suggested partition of all
++the functions in the POSIX C API into option groups: math functions
++like 'sin' and 'cos'; networking functions like 'socket' and
++'connect'; and so on.  EGLIBC could use this partitioning as the basis
++for future option groups.
++
++
++Implementation
++
++The EGLIBC component configuration system resembles the approach used
++by the Linux kernel to select device drivers, network protocols, and
++other features.  A file named 'option-groups.config' in the top-level
++build directory contains assignments to Make variables, each of which
++enables or disables a particular option group.  If the variable's
++value is set to 'y', then the option group is enabled; if it set to
++anything else, the option group is omitted.  The file
++'option-groups.defaults', at the top of the source tree, establishes
++default values for all variables; all option groups are enabled by
++default.
++
++For example, the following 'option-groups.config' would omit locale
++data, but include mathematical functions, and everything else:
++
++   OPTION_EGLIBC_LOCALES = n
++   OPTION_EGLIBC_LIBM = y
++
++Like the Linux kernel, EGLIBC supports a similar set of '*config' make
++targets to make it easier to create 'option-groups.config', with all
++dependencies between option groups automatically satisfied.  Run
++'make help' to see the list of supported make config targets.  For
++example, 'make menuconfig' will update the current config utilising a
++menu based program.
++
++The option group names and their type (boolean, int, hex, string), help
++description, and dependencies with other option groups, are described by
++'option-groups.def' at the top of the source tree, analogous to the
++'Kconfig' files in the Linux kernel.
++
++In general, each option group variable controls whether a given set of
++object files in EGLIBC is compiled and included in the final
++libraries, or omitted from the build.
++
++Each subdirectory's Makefile categorizes its routines, libraries, and
++executables by option group.  For example, EGLIBC's 'math/Makefile'
++places the 'libm' library in the OPTION_EGLIBC_LIBM group as follows:
++
++   extra-libs-$(OPTION_EGLIBC_LIBM) := libm
++
++Finally, common code in 'Makerules' cites the value of the variable
++'extra-libs-y', selecting only those libraries that belong to enabled
++option groups to be built.
++
++
++Current Status and Future Directions
++
++The EGLIBC component configuration system described here is still
++under development.
++
++We have used the system to subset some portions of EGLIBC's
++Index: libc/configure.ac
+diff --git a/Makefile b/Makefile
+index 658ccfa..f906391 100644
+--- a/Makefile
++++ b/Makefile
+@@ -24,6 +24,7 @@ endif
+ 
+ include Makeconfig
+ 
++include options-config/Makefile
+ 
+ # This is the default target; it makes everything except the tests.
+ .PHONY: all
+diff --git a/config.make.in b/config.make.in
+index a9f5696..294f8d1 100644
+--- a/config.make.in
++++ b/config.make.in
+@@ -47,6 +47,8 @@ c++-sysincludes = @CXX_SYSINCLUDES@
+ all-warnings = @all_warnings@
+ enable-werror = @enable_werror@
+ 
++kconfig_tools = @KCONFIG_TOOLS@
++
+ have-z-combreloc = @libc_cv_z_combreloc@
+ have-z-execstack = @libc_cv_z_execstack@
+ have-Bgroup = @libc_cv_Bgroup@
+diff --git a/configure b/configure
+index 7d7299a..4116404 100755
+--- a/configure
++++ b/configure
+@@ -641,6 +641,7 @@ INSTALL_INFO
+ PERL
+ BASH_SHELL
+ libc_cv_gcc_static_libgcc
++KCONFIG_TOOLS
+ CXX_SYSINCLUDES
+ SYSINCLUDES
+ AUTOCONF
+@@ -755,6 +756,7 @@ with_fp
+ with_binutils
+ with_selinux
+ with_headers
++with_kconfig
+ with_default_link
+ enable_sanity_checks
+ enable_shared
+@@ -1459,6 +1461,9 @@ Optional Packages:
+   --with-selinux          if building with SELinux support
+   --with-headers=PATH     location of system headers to use (for example
+                           /usr/src/linux/include) [default=compiler default]
++  --with-kconfig=PATH     location of kconfig tools to use (from Linux kernel
++                          builds) to re-use for configuring EGLIBC option
++                          groups
+   --with-default-link     do not use explicit linker scripts
+   --with-cpu=CPU          select code for CPU variant
+ 
+@@ -3517,6 +3522,14 @@ fi
+ 
+ 
+ 
++# Check whether --with-kconfig was given.
++if test "${with_kconfig+set}" = set; then
++  withval=$with_kconfig; KCONFIG_TOOLS=$withval
++else
++  KCONFIG_TOOLS=''
++fi
++
++
+ 
+ # Check whether --with-default-link was given.
+ if test "${with_default_link+set}" = set; then :
+diff --git a/configure.ac b/configure.ac
+index a467a69..fc0ed4d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -136,6 +136,16 @@ AC_ARG_WITH([headers],
+ 	    [sysheaders=''])
+ AC_SUBST(sysheaders)
+ 
++AC_ARG_WITH([kconfig],
++	    AC_HELP_STRING([--with-kconfig=PATH],
++			   [location of kconfig tools to use (from Linux
++			    kernel builds) to re-use for configuring EGLIBC
++			    option groups]),
++	    [KCONFIG_TOOLS=$withval],
++	    [KCONFIG_TOOLS=''])
++AC_SUBST(KCONFIG_TOOLS)
++
++
+ AC_SUBST(use_default_link)
+ AC_ARG_WITH([default-link],
+ 	    AC_HELP_STRING([--with-default-link],
+diff --git a/option-groups.def b/option-groups.def
+new file mode 100644
+index 0000000..6aebd94
+--- /dev/null
++++ b/option-groups.def
 @@ -0,0 +1,868 @@
 +# This file documents the option groups EGLIBC currently supports, in
 +# a format akin to the Linux Kconfig system's.  The syntax may change
@@ -875,56 +1123,11 @@ Index: git/option-groups.def
 +# Local Variables:
 +# page-delimiter: "^config\\s-"
 +# End:
-Index: git/option-groups.mak
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/option-groups.mak	2014-08-27 07:26:51.652070587 +0000
-@@ -0,0 +1,41 @@
-+# Setup file for subdirectory Makefiles that define EGLIBC option groups.
-+
-+# EGLIBC shouldn't need to override this.  However, the
-+# cross-build-friendly localedef includes this makefile to get option
-+# group variable definitions; it uses a single build tree for all the
-+# multilibs, and needs to be able to specify a different option group
-+# configuration file for each multilib.
-+option_group_config_file ?= $(objdir)/option-groups.config
-+
-+# Read the default settings for all options.
-+# We're included before ../Rules, so we can't assume $(..) is set.
-+include $(firstword $(..) ../)option-groups.defaults
-+
-+# Read the developer's option group selections, overriding the
-+# defaults from option-groups.defaults.
-+-include $(option_group_config_file)
-+
-+# $(call option-disabled, VAR) is 'y' if VAR is not 'y', or 'n' otherwise.
-+# VAR should be a variable name, not a variable reference; this is
-+# less general, but more terse for the intended use.
-+# You can use it to add a file to a list if an option group is
-+# disabled, like this:
-+#   routines-$(call option-disabled, OPTION_POSIX_C_LANG_WIDE_CHAR) += ...
-+define option-disabled
-+$(firstword $(subst y,n,$(filter y,$($(strip $(1))))) y)
-+endef
-+
-+# Establish 'routines-y', etc. as simply-expanded variables.
-+aux-y	       	    :=
-+extra-libs-others-y :=
-+extra-libs-y   	    :=
-+extra-objs-y   	    :=
-+install-bin-y  	    :=
-+install-others-y    :=
-+install-sbin-y 	    :=
-+others-y       	    :=
-+others-pie-y   	    :=
-+routines-y     	    :=
-+test-srcs-y    	    :=
-+tests-y        	    :=
-+xtests-y       	    :=
-Index: git/option-groups.defaults
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/option-groups.defaults	2014-08-27 07:24:41.652070587 +0000
+diff --git a/option-groups.defaults b/option-groups.defaults
+new file mode 100644
+index 0000000..8141201
+--- /dev/null
++++ b/option-groups.defaults
 @@ -0,0 +1,47 @@
 +# This file sets default values for all option group variables
 +# mentioned in option-groups.def; see that file for a description of
@@ -973,228 +1176,58 @@ Index: git/option-groups.defaults
 +OPTION_POSIX_REGEXP = y
 +OPTION_POSIX_REGEXP_GLIBC = y
 +OPTION_POSIX_WIDE_CHAR_DEVICE_IO = y
-Index: git/Makefile
-===================================================================
---- git.orig/Makefile	2014-08-27 07:24:37.540070587 +0000
-+++ git/Makefile	2014-08-27 07:24:41.656070587 +0000
-@@ -24,6 +24,7 @@
- 
- include Makeconfig
- 
-+include options-config/Makefile
- 
- # This is the default target; it makes everything except the tests.
- .PHONY: all
-Index: git/EGLIBC.option-groups
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/EGLIBC.option-groups	2014-08-27 07:24:41.656070587 +0000
-@@ -0,0 +1,122 @@
-+                                                        -*- mode: text -*-
-+
-+              The EGLIBC Component Configuration System
-+                  Jim Blandy <jimb@codesourcery.com>
-+
-+Introduction
-+
-+The GNU C library (GLIBC) provides a broad range of functionality,
-+ranging from internationalization support to transcendental
-+mathematical functions.  Its website boasts that "nearly all known and
-+useful functions from any other C library are available."  This
-+exhaustive approach has been one of GLIBC's strengths on desktop and
-+server systems, but it has also given GLIBC a large footprint, both in
-+memory and on disk, making it a challenge to use in embedded systems
-+with limited resources.
-+
-+The Embedded GNU C library (EGLIBC) is a variant of the GNU C library
-+designed to work well on embedded systems.  In particular, EGLIBC's
-+component configuration system allows embedded developers to build
-+customized versions of the library that include only the features
-+their application uses, reducing its space requirements.
-+
-+EGLIBC's component configuration system categorizes the library's
-+functions into "option groups", and allows you to include or exclude
-+option groups individually.  Some option groups depend on others;
-+EGLIBC tracks these relationships, and ensures that the selected
-+configuration yields a functioning library.
-+
-+
-+Consistent and Predictable Behavior
-+
-+A flexible configuration system is a mixed blessing: if the options
-+offered are poorly designed, it can be hard to see which choices will
-+have the desired effects, and choices with obscure consequences can
-+make debugging difficult.  EGLIBC's configuration follows some general
-+principles to reduce these risks:
-+
-+- EGLIBC has a single default configuration for each target
-+  architecture.
-+
-+- In the default configuration, all option groups are enabled, and
-+  EGLIBC is upwardly API- and ABI-compatible with GLIBC.
-+
-+- As much as possible, configurations only affect what functions are
-+  present, not how they behave.  If the system works with an option
-+  group disabled, it will still work with it enabled.
-+
-+- As much as possible, configurations only select option groups ---
-+  they do not describe characteristics of the target architecture.
-+
-+These rules mean that you have a simple debugging strategy available
-+if you suspect that your EGLIBC configuration might be the source of a
-+problem: fall back to the default configuration, re-test, and then
-+disable option groups one by one, until the problem reappears.
-+
-+
-+The Option Groups
-+
-+To see the current full list of implemented option groups, refer to the
-+file 'option-groups.def' at the top of the source tree, or run
-+'make menuconfig' from the top-level build directory.
-+
-+The POSIX.1-2001 specification includes a suggested partition of all
-+the functions in the POSIX C API into option groups: math functions
-+like 'sin' and 'cos'; networking functions like 'socket' and
-+'connect'; and so on.  EGLIBC could use this partitioning as the basis
-+for future option groups.
-+
-+
-+Implementation
-+
-+The EGLIBC component configuration system resembles the approach used
-+by the Linux kernel to select device drivers, network protocols, and
-+other features.  A file named 'option-groups.config' in the top-level
-+build directory contains assignments to Make variables, each of which
-+enables or disables a particular option group.  If the variable's
-+value is set to 'y', then the option group is enabled; if it set to
-+anything else, the option group is omitted.  The file
-+'option-groups.defaults', at the top of the source tree, establishes
-+default values for all variables; all option groups are enabled by
-+default.
-+
-+For example, the following 'option-groups.config' would omit locale
-+data, but include mathematical functions, and everything else:
-+
-+   OPTION_EGLIBC_LOCALES = n
-+   OPTION_EGLIBC_LIBM = y
-+
-+Like the Linux kernel, EGLIBC supports a similar set of '*config' make
-+targets to make it easier to create 'option-groups.config', with all
-+dependencies between option groups automatically satisfied.  Run
-+'make help' to see the list of supported make config targets.  For
-+example, 'make menuconfig' will update the current config utilising a
-+menu based program.
-+
-+The option group names and their type (boolean, int, hex, string), help
-+description, and dependencies with other option groups, are described by
-+'option-groups.def' at the top of the source tree, analogous to the
-+'Kconfig' files in the Linux kernel.
-+
-+In general, each option group variable controls whether a given set of
-+object files in EGLIBC is compiled and included in the final
-+libraries, or omitted from the build.
-+
-+Each subdirectory's Makefile categorizes its routines, libraries, and
-+executables by option group.  For example, EGLIBC's 'math/Makefile'
-+places the 'libm' library in the OPTION_EGLIBC_LIBM group as follows:
-+
-+   extra-libs-$(OPTION_EGLIBC_LIBM) := libm
-+
-+Finally, common code in 'Makerules' cites the value of the variable
-+'extra-libs-y', selecting only those libraries that belong to enabled
-+option groups to be built.
-+
-+
-+Current Status and Future Directions
-+
-+The EGLIBC component configuration system described here is still
-+under development.
-+
-+We have used the system to subset some portions of EGLIBC's
-+Index: libc/configure.ac
-Index: git/configure.ac
-===================================================================
---- git.orig/configure.ac	2014-08-27 07:24:41.196070587 +0000
-+++ git/configure.ac	2014-08-27 07:24:41.656070587 +0000
-@@ -127,6 +127,16 @@
- 	    [sysheaders=''])
- AC_SUBST(sysheaders)
- 
-+AC_ARG_WITH([kconfig],
-+	    AC_HELP_STRING([--with-kconfig=PATH],
-+			   [location of kconfig tools to use (from Linux
-+			    kernel builds) to re-use for configuring EGLIBC
-+			    option groups]),
-+	    [KCONFIG_TOOLS=$withval],
-+	    [KCONFIG_TOOLS=''])
-+AC_SUBST(KCONFIG_TOOLS)
+diff --git a/option-groups.mak b/option-groups.mak
+new file mode 100644
+index 0000000..f83e0c1
+--- /dev/null
++++ b/option-groups.mak
+@@ -0,0 +1,41 @@
++# Setup file for subdirectory Makefiles that define EGLIBC option groups.
 +
++# EGLIBC shouldn't need to override this.  However, the
++# cross-build-friendly localedef includes this makefile to get option
++# group variable definitions; it uses a single build tree for all the
++# multilibs, and needs to be able to specify a different option group
++# configuration file for each multilib.
++option_group_config_file ?= $(objdir)/option-groups.config
 +
- AC_SUBST(use_default_link)
- AC_ARG_WITH([default-link],
- 	    AC_HELP_STRING([--with-default-link],
-Index: git/config.make.in
-===================================================================
---- git.orig/config.make.in	2014-08-27 07:24:37.560070587 +0000
-+++ git/config.make.in	2014-08-27 07:24:41.656070587 +0000
-@@ -46,6 +46,8 @@
- c++-sysincludes = @CXX_SYSINCLUDES@
- all-warnings = @all_warnings@
- 
-+kconfig_tools = @KCONFIG_TOOLS@
++# Read the default settings for all options.
++# We're included before ../Rules, so we can't assume $(..) is set.
++include $(firstword $(..) ../)option-groups.defaults
 +
- have-z-combreloc = @libc_cv_z_combreloc@
- have-z-execstack = @libc_cv_z_execstack@
- have-Bgroup = @libc_cv_Bgroup@
-Index: git/configure
-===================================================================
---- git.orig/configure	2014-08-27 07:24:41.192070587 +0000
-+++ git/configure	2014-08-27 07:24:41.660070587 +0000
-@@ -619,6 +619,7 @@
- PERL
- BASH_SHELL
- libc_cv_gcc_static_libgcc
-+KCONFIG_TOOLS
- CXX_SYSINCLUDES
- SYSINCLUDES
- AUTOCONF
-@@ -733,6 +734,7 @@
- with_binutils
- with_selinux
- with_headers
-+with_kconfig
- with_default_link
- enable_sanity_checks
- enable_shared
-@@ -1437,6 +1439,9 @@
-   --with-selinux          if building with SELinux support
-   --with-headers=PATH     location of system headers to use (for example
-                           /usr/src/linux/include) [default=compiler default]
-+  --with-kconfig=PATH     location of kconfig tools to use (from Linux kernel
-+                          builds) to re-use for configuring EGLIBC option
-+                          groups
-   --with-default-link     do not use explicit linker scripts
-   --with-cpu=CPU          select code for CPU variant
- 
-@@ -3400,6 +3405,14 @@
- 
- 
- 
-+# Check whether --with-kconfig was given.
-+if test "${with_kconfig+set}" = set; then
-+  withval=$with_kconfig; KCONFIG_TOOLS=$withval
-+else
-+  KCONFIG_TOOLS=''
-+fi
++# Read the developer's option group selections, overriding the
++# defaults from option-groups.defaults.
++-include $(option_group_config_file)
 +
++# $(call option-disabled, VAR) is 'y' if VAR is not 'y', or 'n' otherwise.
++# VAR should be a variable name, not a variable reference; this is
++# less general, but more terse for the intended use.
++# You can use it to add a file to a list if an option group is
++# disabled, like this:
++#   routines-$(call option-disabled, OPTION_POSIX_C_LANG_WIDE_CHAR) += ...
++define option-disabled
++$(firstword $(subst y,n,$(filter y,$($(strip $(1))))) y)
++endef
 +
- 
- # Check whether --with-default-link was given.
- if test "${with_default_link+set}" = set; then :
-Index: git/options-config/Makefile
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/options-config/Makefile	2014-08-27 07:24:41.652070587 +0000
++# Establish 'routines-y', etc. as simply-expanded variables.
++aux-y	       	    :=
++extra-libs-others-y :=
++extra-libs-y   	    :=
++extra-objs-y   	    :=
++install-bin-y  	    :=
++install-others-y    :=
++install-sbin-y 	    :=
++others-y       	    :=
++others-pie-y   	    :=
++routines-y     	    :=
++test-srcs-y    	    :=
++tests-y        	    :=
++xtests-y       	    :=
+diff --git a/options-config/Makefile b/options-config/Makefile
+new file mode 100644
+index 0000000..db00708
+--- /dev/null
++++ b/options-config/Makefile
 @@ -0,0 +1,55 @@
 +# ===========================================================================
 +# EGLIBC option-groups configuration targets
@@ -1251,10 +1284,11 @@ Index: git/options-config/Makefile
 +
 +endif
 +endif
-Index: git/options-config/config-postproc.pl
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/options-config/config-postproc.pl	2014-08-27 07:24:41.652070587 +0000
+diff --git a/options-config/config-postproc.pl b/options-config/config-postproc.pl
+new file mode 100644
+index 0000000..4dd1c63
+--- /dev/null
++++ b/options-config/config-postproc.pl
 @@ -0,0 +1,58 @@
 +#!/usr/bin/perl
 +
@@ -1314,10 +1348,11 @@ Index: git/options-config/config-postproc.pl
 +	print "OPTION_$opt\n";
 +    }
 +}
-Index: git/options-config/config-preproc.pl
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/options-config/config-preproc.pl	2014-08-27 07:24:41.652070587 +0000
+diff --git a/options-config/config-preproc.pl b/options-config/config-preproc.pl
+new file mode 100644
+index 0000000..b83bb85
+--- /dev/null
++++ b/options-config/config-preproc.pl
 @@ -0,0 +1,8 @@
 +#!/usr/bin/perl
 +
@@ -1327,10 +1362,11 @@ Index: git/options-config/config-preproc.pl
 +	print;
 +    }
 +}
-Index: git/scripts/option-groups.awk
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/scripts/option-groups.awk	2014-08-27 07:26:51.652070587 +0000
+diff --git a/scripts/option-groups.awk b/scripts/option-groups.awk
+new file mode 100644
+index 0000000..533af0c
+--- /dev/null
++++ b/scripts/option-groups.awk
 @@ -0,0 +1,63 @@
 +# option-groups.awk --- generate option group header file
 +# Given input files containing makefile-style assignments to variables,
@@ -1395,3 +1431,6 @@ Index: git/scripts/option-groups.awk
 +    print ""
 +    print "#endif /* __GNU_OPTION_GROUPS_H */"
 +}
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/glibc/glibc/eglibc-header-bootstrap.patch b/meta/recipes-core/glibc/glibc/0020-eglibc-Help-bootstrap-cross-toolchain.patch
similarity index 52%
rename from meta/recipes-core/glibc/glibc/eglibc-header-bootstrap.patch
rename to meta/recipes-core/glibc/glibc/0020-eglibc-Help-bootstrap-cross-toolchain.patch
index e1aa139..b34805f 100644
--- a/meta/recipes-core/glibc/glibc/eglibc-header-bootstrap.patch
+++ b/meta/recipes-core/glibc/glibc/0020-eglibc-Help-bootstrap-cross-toolchain.patch
@@ -1,27 +1,38 @@
+From 632a64f9fa3cc6ebc8c53fbbc1542ba759855377 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 18 Mar 2015 00:49:28 +0000
+Subject: [PATCH 20/27] eglibc: Help bootstrap cross toolchain
+
 Taken from EGLIBC, r1484 + r1525
-	
-	2007-02-20  Jim Blandy  <jimb@codesourcery.com>
-	
-	        * Makefile (install-headers): Preserve old behavior: depend on
-	        $(inst_includedir)/gnu/stubs.h only if install-bootstrap-headers
-	        is set; otherwise, place gnu/stubs.h on the 'install-others' list.
-	
-	2007-02-16  Jim Blandy  <jimb@codesourcery.com>
-	
-	        * Makefile: Amend make install-headers to install everything
-	        necessary for building a cross-compiler.  Install gnu/stubs.h as
-	        part of 'install-headers', not 'install-others'.
-	        If install-bootstrap-headers is 'yes', install a dummy copy of
-	        gnu/stubs.h, instead of computing the real thing.
-	        * include/stubs-bootstrap.h: New file.
+
+        2007-02-20  Jim Blandy  <jimb@codesourcery.com>
+
+                * Makefile (install-headers): Preserve old behavior: depend on
+                $(inst_includedir)/gnu/stubs.h only if install-bootstrap-headers
+                is set; otherwise, place gnu/stubs.h on the 'install-others' list.
+
+        2007-02-16  Jim Blandy  <jimb@codesourcery.com>
+
+                * Makefile: Amend make install-headers to install everything
+                necessary for building a cross-compiler.  Install gnu/stubs.h as
+                part of 'install-headers', not 'install-others'.
+                If install-bootstrap-headers is 'yes', install a dummy copy of
+                gnu/stubs.h, instead of computing the real thing.
+                * include/stubs-bootstrap.h: New file.
 
 Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile                  | 22 +++++++++++++++++++++-
+ include/stubs-bootstrap.h | 12 ++++++++++++
+ 2 files changed, 33 insertions(+), 1 deletion(-)
+ create mode 100644 include/stubs-bootstrap.h
 
-Index: git/Makefile
-===================================================================
---- git.orig/Makefile	2014-08-27 18:35:18.908070587 +0000
-+++ git/Makefile	2014-08-27 18:35:19.340070587 +0000
-@@ -69,9 +69,18 @@
+diff --git a/Makefile b/Makefile
+index f906391..e4e149e 100644
+--- a/Makefile
++++ b/Makefile
+@@ -69,9 +69,18 @@ subdir-dirs = include
  vpath %.h $(subdir-dirs)
  
  # What to install.
@@ -41,7 +52,7 @@ Index: git/Makefile
  ifeq (yes,$(build-shared))
  headers += gnu/lib-names.h
  endif
-@@ -151,6 +160,16 @@
+@@ -151,6 +160,16 @@ others: $(common-objpfx)testrun.sh
  
  subdir-stubs := $(foreach dir,$(subdirs),$(common-objpfx)$(dir)/stubs)
  
@@ -58,7 +69,7 @@ Index: git/Makefile
  ifndef abi-variants
  installed-stubs = $(inst_includedir)/gnu/stubs.h
  else
-@@ -177,6 +196,7 @@
+@@ -177,6 +196,7 @@ $(inst_includedir)/gnu/stubs.h: $(+force)
  
  install-others-nosubdir: $(installed-stubs)
  endif
@@ -66,10 +77,11 @@ Index: git/Makefile
  
  
  # Since stubs.h is never needed when building the library, we simplify the
-Index: git/include/stubs-bootstrap.h
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/include/stubs-bootstrap.h	2014-08-27 18:35:19.340070587 +0000
+diff --git a/include/stubs-bootstrap.h b/include/stubs-bootstrap.h
+new file mode 100644
+index 0000000..1d2b669
+--- /dev/null
++++ b/include/stubs-bootstrap.h
 @@ -0,0 +1,12 @@
 +/* Placeholder stubs.h file for bootstrapping.
 +
@@ -83,3 +95,6 @@ Index: git/include/stubs-bootstrap.h
 +   difficult headers.  The <gnu/stubs.h> header depends, via the
 +   EGLIBC subdir 'stubs' make targets, on every .o file in EGLIBC, but
 +   an empty stubs.h like this will do fine for GCC.  */
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/glibc/glibc/eglibc-resolv-dynamic.patch b/meta/recipes-core/glibc/glibc/0021-eglibc-cherry-picked-from-http-www.eglibc.org-archiv.patch
similarity index 65%
rename from meta/recipes-core/glibc/glibc/eglibc-resolv-dynamic.patch
rename to meta/recipes-core/glibc/glibc/0021-eglibc-cherry-picked-from-http-www.eglibc.org-archiv.patch
index a73bceb..d34fe78 100644
--- a/meta/recipes-core/glibc/glibc/eglibc-resolv-dynamic.patch
+++ b/meta/recipes-core/glibc/glibc/0021-eglibc-cherry-picked-from-http-www.eglibc.org-archiv.patch
@@ -1,15 +1,22 @@
-cherry-picked from http://www.eglibc.org/archives/patches/msg00772.html
+From c517048d224dc0ebf0080979024ef523d1094787 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 18 Mar 2015 00:51:16 +0000
+Subject: [PATCH 21/27] eglibc: cherry-picked from
+ http://www.eglibc.org/archives/patches/msg00772.html
 
-It hasnt yet been merged into glibc
-
-Signed-off-by: Khem Raj
+It hasn't yet been merged into glibc
 
 Upstream-Status: Pending
 
-Index: git/resolv/res_libc.c
-===================================================================
---- git.orig/resolv/res_libc.c	2014-08-27 18:35:15.492070587 +0000
-+++ git/resolv/res_libc.c	2014-08-27 18:35:19.204070587 +0000
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ resolv/res_libc.c | 15 +++++++++++++--
+ 1 file changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/resolv/res_libc.c b/resolv/res_libc.c
+index ee3fa21..29e2340 100644
+--- a/resolv/res_libc.c
++++ b/resolv/res_libc.c
 @@ -22,12 +22,13 @@
  #include <arpa/nameser.h>
  #include <resolv.h>
@@ -25,7 +32,7 @@ Index: git/resolv/res_libc.c
  extern unsigned long long int __res_initstamp attribute_hidden;
  /* We have atomic increment operations on 64-bit platforms.  */
  #if __WORDSIZE == 64
-@@ -35,7 +36,6 @@
+@@ -35,7 +36,6 @@ extern unsigned long long int __res_initstamp attribute_hidden;
  # define atomicincunlock(lock) (void) 0
  # define atomicinc(var) catomic_increment (&(var))
  #else
@@ -33,7 +40,7 @@ Index: git/resolv/res_libc.c
  # define atomicinclock(lock) __libc_lock_lock (lock)
  # define atomicincunlock(lock) __libc_lock_unlock (lock)
  # define atomicinc(var) ++var
-@@ -94,7 +94,18 @@
+@@ -94,7 +94,18 @@ res_init(void) {
  int
  __res_maybe_init (res_state resp, int preinit)
  {
@@ -52,3 +59,6 @@ Index: git/resolv/res_libc.c
  		if (__res_initstamp != resp->_u._ext.initstamp) {
  			if (resp->nscount > 0)
  				__res_iclose (resp, true);
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/glibc/glibc/eglibc-ppc8xx-cache-line-workaround.patch b/meta/recipes-core/glibc/glibc/0022-eglibc-Clear-cache-lines-on-ppc8xx.patch
similarity index 68%
rename from meta/recipes-core/glibc/glibc/eglibc-ppc8xx-cache-line-workaround.patch
rename to meta/recipes-core/glibc/glibc/0022-eglibc-Clear-cache-lines-on-ppc8xx.patch
index bb83d6d..495982a 100644
--- a/meta/recipes-core/glibc/glibc/eglibc-ppc8xx-cache-line-workaround.patch
+++ b/meta/recipes-core/glibc/glibc/0022-eglibc-Clear-cache-lines-on-ppc8xx.patch
@@ -1,3 +1,8 @@
+From f9c39f03638492e670d82964470cd39347c82f4f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 18 Mar 2015 00:53:47 +0000
+Subject: [PATCH 22/27] eglibc: Clear cache lines on ppc8xx
+
 2007-06-13  Nathan Sidwell  <nathan@codesourcery.com>
             Mark Shinwell  <shinwell@codesourcery.com>
 
@@ -8,12 +13,17 @@
         (DL_PLATFORM_AUXV): Likewise.
 
 Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ sysdeps/unix/sysv/linux/powerpc/dl-sysdep.c  | 14 +++++++++++++-
+ sysdeps/unix/sysv/linux/powerpc/libc-start.c | 15 ++++++++++++++-
+ 2 files changed, 27 insertions(+), 2 deletions(-)
 
-Index: git/sysdeps/unix/sysv/linux/powerpc/dl-sysdep.c
-===================================================================
---- git.orig/sysdeps/unix/sysv/linux/powerpc/dl-sysdep.c	2014-08-27 18:49:23.996070587 +0000
-+++ git/sysdeps/unix/sysv/linux/powerpc/dl-sysdep.c	2014-08-27 18:49:27.332070587 +0000
-@@ -24,9 +24,21 @@
+diff --git a/sysdeps/unix/sysv/linux/powerpc/dl-sysdep.c b/sysdeps/unix/sysv/linux/powerpc/dl-sysdep.c
+index c2504ff..d50f1cb 100644
+--- a/sysdeps/unix/sysv/linux/powerpc/dl-sysdep.c
++++ b/sysdeps/unix/sysv/linux/powerpc/dl-sysdep.c
+@@ -24,9 +24,21 @@ int __cache_line_size attribute_hidden;
  /* Scan the Aux Vector for the "Data Cache Block Size" entry.  If found
     verify that the static extern __cache_line_size is defined by checking
     for not NULL.  If it is defined then assign the cache block size
@@ -36,11 +46,11 @@ Index: git/sysdeps/unix/sysv/linux/powerpc/dl-sysdep.c
  	__cache_line_size = av->a_un.a_val;				      \
  	break;
  
-Index: git/sysdeps/unix/sysv/linux/powerpc/libc-start.c
-===================================================================
---- git.orig/sysdeps/unix/sysv/linux/powerpc/libc-start.c	2014-08-27 18:49:23.996070587 +0000
-+++ git/sysdeps/unix/sysv/linux/powerpc/libc-start.c	2014-08-27 18:49:27.332070587 +0000
-@@ -68,11 +68,24 @@
+diff --git a/sysdeps/unix/sysv/linux/powerpc/libc-start.c b/sysdeps/unix/sysv/linux/powerpc/libc-start.c
+index a9364c7..a3ed1d4 100644
+--- a/sysdeps/unix/sysv/linux/powerpc/libc-start.c
++++ b/sysdeps/unix/sysv/linux/powerpc/libc-start.c
+@@ -68,11 +68,24 @@ __libc_start_main (int argc, char **argv,
        rtld_fini = NULL;
      }
  
@@ -66,3 +76,6 @@ Index: git/sysdeps/unix/sysv/linux/powerpc/libc-start.c
  	__cache_line_size = av->a_un.a_val;
  	break;
        }
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/glibc/glibc/eglibc-sh4-fpscr_values.patch b/meta/recipes-core/glibc/glibc/0023-eglibc-Resolve-__fpscr_values-on-SH4.patch
similarity index 50%
rename from meta/recipes-core/glibc/glibc/eglibc-sh4-fpscr_values.patch
rename to meta/recipes-core/glibc/glibc/0023-eglibc-Resolve-__fpscr_values-on-SH4.patch
index bfb813e..5fba613 100644
--- a/meta/recipes-core/glibc/glibc/eglibc-sh4-fpscr_values.patch
+++ b/meta/recipes-core/glibc/glibc/0023-eglibc-Resolve-__fpscr_values-on-SH4.patch
@@ -1,3 +1,8 @@
+From 0612b68add082eef019d04164984641493dcbe78 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 18 Mar 2015 00:55:53 +0000
+Subject: [PATCH 23/27] eglibc: Resolve __fpscr_values on SH4
+
 2010-09-29  Nobuhiro Iwamatsu  <iwamatsu@nigauri.org>
             Andrew Stubbs  <ams@codesourcery.com>
 
@@ -9,11 +14,29 @@
 
 Upstream-Status: Pending
 
-Index: git/sysdeps/unix/sysv/linux/sh/sysdep.S
-===================================================================
---- git.orig/sysdeps/unix/sysv/linux/sh/sysdep.S	2014-08-27 18:49:24.036070587 +0000
-+++ git/sysdeps/unix/sysv/linux/sh/sysdep.S	2014-08-27 18:49:27.332070587 +0000
-@@ -30,3 +30,14 @@
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ sysdeps/unix/sysv/linux/sh/Versions |  1 +
+ sysdeps/unix/sysv/linux/sh/sysdep.S | 11 +++++++++++
+ 2 files changed, 12 insertions(+)
+
+diff --git a/sysdeps/unix/sysv/linux/sh/Versions b/sysdeps/unix/sysv/linux/sh/Versions
+index e0938c4..ca1d7da 100644
+--- a/sysdeps/unix/sysv/linux/sh/Versions
++++ b/sysdeps/unix/sysv/linux/sh/Versions
+@@ -2,6 +2,7 @@ libc {
+   GLIBC_2.2 {
+     # functions used in other libraries
+     __xstat64; __fxstat64; __lxstat64;
++    __fpscr_values;
+ 
+     # a*
+     alphasort64;
+diff --git a/sysdeps/unix/sysv/linux/sh/sysdep.S b/sysdeps/unix/sysv/linux/sh/sysdep.S
+index a02b7e2..b9be326 100644
+--- a/sysdeps/unix/sysv/linux/sh/sysdep.S
++++ b/sysdeps/unix/sysv/linux/sh/sysdep.S
+@@ -30,3 +30,14 @@ ENTRY (__syscall_error)
  
  #define __syscall_error __syscall_error_1
  #include <sysdeps/unix/sh/sysdep.S>
@@ -28,15 +51,6 @@ Index: git/sysdeps/unix/sysv/linux/sh/sysdep.S
 +       .long 0x80000
 +weak_alias (___fpscr_values, __fpscr_values)
 +
-Index: git/sysdeps/unix/sysv/linux/sh/Versions
-===================================================================
---- git.orig/sysdeps/unix/sysv/linux/sh/Versions	2014-08-27 18:49:24.028070587 +0000
-+++ git/sysdeps/unix/sysv/linux/sh/Versions	2014-08-27 18:49:27.332070587 +0000
-@@ -2,6 +2,7 @@
-   GLIBC_2.2 {
-     # functions used in other libraries
-     __xstat64; __fxstat64; __lxstat64;
-+    __fpscr_values;
- 
-     # a*
-     alphasort64;
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch b/meta/recipes-core/glibc/glibc/0024-eglibc-Forward-port-eglibc-options-groups-support.patch
similarity index 90%
rename from meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
rename to meta/recipes-core/glibc/glibc/0024-eglibc-Forward-port-eglibc-options-groups-support.patch
index da92203..22d069a 100644
--- a/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
+++ b/meta/recipes-core/glibc/glibc/0024-eglibc-Forward-port-eglibc-options-groups-support.patch
@@ -1,11 +1,249 @@
-Forward port eglibc options groups support
+From f080939bde0ebb4a3c45f8a7c7393139e2d5d83e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 18 Mar 2015 01:33:49 +0000
+Subject: [PATCH 24/27] eglibc: Forward port eglibc options groups support
 
 Upstream-Status: Pending
 
-Index: git/argp/argp-fmtstream.c
-===================================================================
---- git.orig/argp/argp-fmtstream.c
-+++ git/argp/argp-fmtstream.c
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makeconfig                              |   20 +-
+ Makerules                               |   19 +
+ argp/Makefile                           |    2 +
+ argp/argp-fmtstream.c                   |   25 +-
+ argp/argp-help.c                        |   13 +-
+ argp/argp-namefrob.h                    |    2 +
+ catgets/Makefile                        |   17 +-
+ crypt/Makefile                          |   20 +-
+ crypt/crypt-entry.c                     |   13 +
+ crypt/crypt_common.c                    |   42 +
+ crypt/crypt_util.c                      |   18 -
+ csu/Makefile                            |    2 +
+ debug/Makefile                          |   41 +-
+ debug/segfault.c                        |   11 +-
+ debug/tst-chk1.c                        |    7 +
+ dlfcn/Makefile                          |    7 +-
+ elf/dl-support.c                        |    3 +
+ elf/rtld.c                              |   17 +-
+ extra-lib.mk                            |    6 +-
+ grp/Makefile                            |    5 +
+ hesiod/Makefile                         |    6 +-
+ iconv/Makefile                          |    7 +
+ iconv/gconv_db.c                        |    3 +
+ iconv/gconv_trans.c                     |    7 +
+ iconv/iconv_prog.c                      |    8 +
+ iconvdata/Makefile                      |   27 +-
+ include/netdb.h                         |    4 +
+ inet/Makefile                           |   22 +-
+ intl/Makefile                           |    3 +-
+ intl/dcigettext.c                       |   39 +-
+ io/Makefile                             |   18 +-
+ libidn/Makefile                         |    5 +-
+ libidn/toutf8.c                         |   11 +-
+ libio/Makefile                          |   66 +-
+ libio/__fpurge.c                        |    2 +-
+ libio/fileops.c                         |   10 +-
+ libio/iofwide.c                         |   26 +
+ libio/ioseekoff.c                       |    2 +-
+ libio/ioseekpos.c                       |    2 +-
+ libio/iosetbuffer.c                     |    4 +
+ libio/libioP.h                          |   18 +-
+ libio/wdummyfileops.c                   |  161 +
+ locale/C-ctype.c                        |   20 +
+ locale/Makefile                         |   41 +-
+ locale/catnames.c                       |   48 +
+ locale/dummy-setlocale.c                |   33 +
+ locale/localeinfo.h                     |    2 +-
+ locale/programs/charmap-dir.c           |    6 +
+ locale/programs/ld-collate.c            |   17 +-
+ locale/programs/ld-ctype.c              |   27 +-
+ locale/programs/ld-messages.c           |    5 +
+ locale/programs/ld-time.c               |   31 +-
+ locale/programs/linereader.c            |    2 +-
+ locale/programs/localedef.c             |    8 +
+ locale/programs/locfile.c               |    5 +-
+ locale/programs/locfile.h               |   59 +-
+ locale/setlocale.c                      |   30 -
+ locale/xlocale.c                        |   37 +
+ localedata/Makefile                     |   35 +-
+ login/Makefile                          |   17 +-
+ malloc/Makefile                         |   10 +-
+ malloc/memusage.c                       |    7 +-
+ malloc/memusage.sh                      |    2 +-
+ math/Makefile                           |    6 +-
+ misc/Makefile                           |   25 +-
+ misc/err.c                              |   11 +
+ misc/error.c                            |    5 +
+ misc/tst-efgcvt.c                       |    2 +-
+ nis/Makefile                            |   31 +-
+ nptl/Makefile                           |   28 +-
+ nptl/pthread_create.c                   |    5 +
+ nscd/Makefile                           |   33 +-
+ nscd/nis_hash.c                         |    3 +
+ nss/Makefile                            |   67 +-
+ nss/fixed-nsswitch.conf                 |   22 +
+ nss/fixed-nsswitch.functions            |  121 +
+ nss/gen-fixed-nsswitch.c                |  803 +++
+ nss/getent.c                            |   46 +-
+ nss/getnssent_r.c                       |    9 +-
+ nss/nsswitch.c                          |  109 +-
+ nss/nsswitch.h                          |   18 +-
+ posix/Makefile                          |   94 +-
+ posix/bug-regex1.c                      |    3 +
+ posix/bug-regex6.c                      |    8 +-
+ posix/fnmatch.c                         |    6 +-
+ posix/fnmatch_loop.c                    |   23 +-
+ posix/glob.c                            |   15 +-
+ posix/regcomp.c                         |   98 +-
+ posix/regex.h                           |   11 +
+ posix/regex_internal.c                  |   45 +-
+ posix/regex_internal.h                  |   23 +-
+ posix/regexec-compat.c                  |   39 +
+ posix/regexec.c                         |   71 +-
+ posix/xregex.c                          | 8215 +++++++++++++++++++++++++++++++
+ pwd/Makefile                            |    2 +
+ resolv/Makefile                         |   21 +-
+ stdio-common/Makefile                   |   35 +-
+ stdio-common/_i18n_number.h             |   13 +
+ stdio-common/fxprintf.c                 |    5 +
+ stdio-common/printf_fp.c                |   22 +
+ stdio-common/printf_fphex.c             |   13 +
+ stdio-common/printf_size.c              |    8 +
+ stdio-common/scanf14.c                  |    3 +
+ stdio-common/tst-popen.c                |    3 +
+ stdio-common/tst-sprintf.c              |    4 +-
+ stdio-common/tstdiomisc.c               |    5 +
+ stdio-common/vfprintf.c                 |   31 +-
+ stdio-common/vfscanf.c                  |   53 +-
+ stdlib/Makefile                         |   34 +-
+ stdlib/strtod_l.c                       |   13 +
+ stdlib/tst-strtod.c                     |    5 +
+ streams/Makefile                        |    5 +-
+ string/Makefile                         |   14 +-
+ string/strcoll_l.c                      |    5 +
+ string/strerror_l.c                     |    5 +
+ string/strxfrm_l.c                      |    5 +
+ string/test-strcmp.c                    |   28 -
+ string/tst-strxfrm.c                    |    3 +
+ string/tst-strxfrm2.c                   |    3 +
+ sunrpc/Makefile                         |   44 +-
+ sysdeps/arm/Makefile                    |    5 +-
+ sysdeps/generic/ldsodefs.h              |    8 +
+ sysdeps/gnu/Makefile                    |    3 +-
+ sysdeps/ieee754/ldbl-opt/Makefile       |   27 +-
+ sysdeps/ieee754/ldbl-opt/nldbl-compat.c |   40 +-
+ sysdeps/ieee754/ldbl-opt/nldbl-compat.h |   24 +-
+ sysdeps/nptl/Makefile                   |    3 +
+ sysdeps/nptl/bits/libc-lock.h           |   45 +
+ sysdeps/nptl/bits/libc-lockP.h          |   50 +-
+ sysdeps/nptl/small-macros-fns.c         |   72 +
+ sysdeps/unix/sysv/linux/gethostid.c     |    6 +
+ sysdeps/unix/sysv/linux/libc_fatal.c    |    3 +
+ time/Makefile                           |   18 +-
+ time/strftime_l.c                       |   12 +-
+ time/strptime_l.c                       |   14 +-
+ timezone/Makefile                       |    2 +-
+ wcsmbs/Makefile                         |   27 +-
+ wcsmbs/wcsmbsload.c                     |   13 +
+ wctype/Makefile                         |   14 +-
+ 139 files changed, 11363 insertions(+), 583 deletions(-)
+ create mode 100644 crypt/crypt_common.c
+ create mode 100644 libio/wdummyfileops.c
+ create mode 100644 locale/catnames.c
+ create mode 100644 locale/dummy-setlocale.c
+ create mode 100644 nscd/nis_hash.c
+ create mode 100644 nss/fixed-nsswitch.conf
+ create mode 100644 nss/fixed-nsswitch.functions
+ create mode 100644 nss/gen-fixed-nsswitch.c
+ create mode 100644 posix/regexec-compat.c
+ create mode 100644 posix/xregex.c
+ create mode 100644 sysdeps/nptl/small-macros-fns.c
+
+diff --git a/Makeconfig b/Makeconfig
+index 7b46323..a1b6559 100644
+--- a/Makeconfig
++++ b/Makeconfig
+@@ -609,7 +609,7 @@ elf-objpfx = $(common-objpfx)elf/
+ # and run on the build system, causes that program with those
+ # arguments to be run on the host for which the library is built.
+ ifndef test-wrapper
+-test-wrapper =
++test-wrapper = $(cross-test-wrapper)
+ endif
+ # Likewise, but the name of the program is preceded by
+ # <variable>=<value> assignments for environment variables.
+@@ -1085,6 +1085,24 @@ libm = $(common-objpfx)math/libm.a
+ libmvec = $(common-objpfx)mathvec/libmvec.a
+ endif
+ 
++# Generate a header file that #defines preprocessor symbols indicating
++# which option groups are enabled.  Note that the option-groups.config file
++# may not exist at all.
++before-compile += $(common-objpfx)gnu/option-groups.h
++common-generated += gnu/option-groups.h gnu/option-groups.stmp
++headers += gnu/option-groups.h
++$(common-objpfx)gnu/option-groups.h: $(common-objpfx)gnu/option-groups.stmp; @:
++$(common-objpfx)gnu/option-groups.stmp:					\
++		$(..)scripts/option-groups.awk				\
++		$(..)option-groups.defaults				\
++		$(wildcard $(common-objpfx)option-groups.config)
++	$(make-target-directory)
++	@rm -f ${@:stmp=T} $@
++	LC_ALL=C $(AWK) -f $^ > ${@:stmp=T}
++	$(move-if-change) ${@:stmp=T} ${@:stmp=h}
++	touch $@
++
++
+ # These are the subdirectories containing the library source.  The order
+ # is more or less arbitrary.  The sorting step will take care of the
+ # dependencies.
+diff --git a/Makerules b/Makerules
+index f9ca3f5..1dd41aa 100644
+--- a/Makerules
++++ b/Makerules
+@@ -456,6 +456,25 @@ define sed-remove-objpfx
+ endef
+ endif
+ 
++# Include targets in the selected option groups.
++aux                  += $(aux-y)
++extra-libs           += $(extra-libs-y)
++extra-libs-others    += $(extra-libs-others-y)
++extra-objs           += $(extra-objs-y)
++install-bin          += $(install-bin-y)
++install-others       += $(install-others-y)
++install-sbin         += $(install-sbin-y)
++modules              += $(modules-y)
++others               += $(others-y)
++others-pie           += $(others-pie-y)
++routines             += $(routines-y)
++static-only-routines += $(static-only-routines-y)
++sysdep_routines      += $(sysdep_routines-y)
++test-srcs            += $(test-srcs-y)
++tests                += $(tests-y)
++xtests               += $(xtests-y)
++
++
+ # Modify the list of routines we build for different targets
+ 
+ ifeq (yes,$(build-shared))
+diff --git a/argp/Makefile b/argp/Makefile
+index 1a87629..f7c1e40 100644
+--- a/argp/Makefile
++++ b/argp/Makefile
+@@ -18,6 +18,8 @@
+ #
+ #	Makefile for argp.
+ #
++include ../option-groups.mak
++
+ subdir	:= argp
+ 
+ include ../Makeconfig
+diff --git a/argp/argp-fmtstream.c b/argp/argp-fmtstream.c
+index 2b845e0..c344e7b 100644
+--- a/argp/argp-fmtstream.c
++++ b/argp/argp-fmtstream.c
 @@ -42,6 +42,7 @@
  #ifdef _LIBC
  # include <wchar.h>
@@ -14,7 +252,7 @@ Index: git/argp/argp-fmtstream.c
  # define __vsnprintf(s, l, f, a) _IO_vsnprintf (s, l, f, a)
  #endif
  
-@@ -100,7 +101,11 @@ __argp_fmtstream_free (argp_fmtstream_t
+@@ -100,7 +101,11 @@ __argp_fmtstream_free (argp_fmtstream_t fs)
    __argp_fmtstream_update (fs);
    if (fs->p > fs->buf)
      {
@@ -26,7 +264,7 @@ Index: git/argp/argp-fmtstream.c
      }
    free (fs->buf);
    free (fs);
-@@ -145,9 +150,17 @@ __argp_fmtstream_update (argp_fmtstream_
+@@ -145,9 +150,17 @@ __argp_fmtstream_update (argp_fmtstream_t fs)
  	      size_t i;
  	      for (i = 0; i < pad; i++)
  		{
@@ -45,7 +283,7 @@ Index: git/argp/argp-fmtstream.c
  		    putc_unlocked (' ', fs->stream);
  		}
  	    }
-@@ -308,9 +321,17 @@ __argp_fmtstream_update (argp_fmtstream_
+@@ -308,9 +321,17 @@ __argp_fmtstream_update (argp_fmtstream_t fs)
  	      *nl++ = ' ';
  	  else
  	    for (i = 0; i < fs->wmargin; ++i)
@@ -64,10 +302,10 @@ Index: git/argp/argp-fmtstream.c
  		putc_unlocked (' ', fs->stream);
  
  	  /* Copy the tail of the original buffer into the current buffer
-Index: git/argp/argp-help.c
-===================================================================
---- git.orig/argp/argp-help.c
-+++ git/argp/argp-help.c
+diff --git a/argp/argp-help.c b/argp/argp-help.c
+index b055e45..6b3c4c1 100644
+--- a/argp/argp-help.c
++++ b/argp/argp-help.c
 @@ -51,6 +51,7 @@ char *alloca ();
  #ifdef _LIBC
  # include <../libio/libioP.h>
@@ -85,7 +323,7 @@ Index: git/argp/argp-help.c
  {
  # if HAVE_DECL_PROGRAM_INVOCATION_SHORT_NAME
    return program_invocation_short_name;
-@@ -1873,9 +1874,17 @@ __argp_failure (const struct argp_state
+@@ -1873,9 +1874,17 @@ __argp_failure (const struct argp_state *state, int status, int errnum,
  #endif
  	    }
  
@@ -104,10 +342,10 @@ Index: git/argp/argp-help.c
  	    putc_unlocked ('\n', stream);
  
  #if _LIBC || (HAVE_FLOCKFILE && HAVE_FUNLOCKFILE)
-Index: git/argp/argp-namefrob.h
-===================================================================
---- git.orig/argp/argp-namefrob.h
-+++ git/argp/argp-namefrob.h
+diff --git a/argp/argp-namefrob.h b/argp/argp-namefrob.h
+index f67c58f..e2002dc 100644
+--- a/argp/argp-namefrob.h
++++ b/argp/argp-namefrob.h
 @@ -76,10 +76,12 @@
  #undef __argp_fmtstream_wmargin
  #define __argp_fmtstream_wmargin argp_fmtstream_wmargin
@@ -121,23 +359,10 @@ Index: git/argp/argp-namefrob.h
  
  /* normal libc functions we call */
  #undef __flockfile
-Index: git/argp/Makefile
-===================================================================
---- git.orig/argp/Makefile
-+++ git/argp/Makefile
-@@ -18,6 +18,8 @@
- #
- #	Makefile for argp.
- #
-+include ../option-groups.mak
-+
- subdir	:= argp
- 
- include ../Makeconfig
-Index: git/catgets/Makefile
-===================================================================
---- git.orig/catgets/Makefile
-+++ git/catgets/Makefile
+diff --git a/catgets/Makefile b/catgets/Makefile
+index 4624a88..05714fd 100644
+--- a/catgets/Makefile
++++ b/catgets/Makefile
 @@ -22,20 +22,23 @@ subdir	:= catgets
  
  include ../Makeconfig
@@ -169,10 +394,66 @@ Index: git/catgets/Makefile
  gencat-modules	= xmalloc
  
  # To find xmalloc.c
-Index: git/crypt/crypt-entry.c
-===================================================================
---- git.orig/crypt/crypt-entry.c
-+++ git/crypt/crypt-entry.c
+diff --git a/crypt/Makefile b/crypt/Makefile
+index 34c4dd7..7c18c88 100644
+--- a/crypt/Makefile
++++ b/crypt/Makefile
+@@ -18,21 +18,25 @@
+ #
+ #	Sub-makefile for crypt() portion of the library.
+ #
++include ../option-groups.mak
++
+ subdir	:= crypt
+ 
+ include ../Makeconfig
+ 
+ headers := crypt.h
+ 
+-extra-libs := libcrypt
+-extra-libs-others := $(extra-libs)
++extra-libs-$(OPTION_EGLIBC_CRYPT) := libcrypt
++extra-libs-others-y := $(extra-libs-y)
+ 
+-libcrypt-routines := crypt-entry md5-crypt sha256-crypt sha512-crypt crypt \
+-		     crypt_util
++libcrypt-routines :=crypt-entry  md5-crypt sha256-crypt sha512-crypt crypt_common
++libcrypt-routines-$(OPTION_EGLIBC_CRYPT_UFC) := crypt crypt_util
++libcrypt-routines += $(libcrypt-routines-y)
+ 
+-tests := cert md5c-test sha256c-test sha512c-test badsalttest
++tests-$(OPTION_EGLIBC_CRYPT) := md5c-test sha256c-test sha512c-test badsalttest
++tests-$(OPTION_EGLIBC_CRYPT_UFC) += cert
+ 
+-ifeq ($(crypt-in-libc),yes)
++ifeq ($(crypt-in-libc)$(OPTION_EGLIBC_CRYPT),yesy)
+ routines += $(libcrypt-routines)
+ endif
+ 
+@@ -44,7 +48,7 @@ LDLIBS-crypt.so = -lfreebl3
+ else
+ libcrypt-routines += md5 sha256 sha512
+ 
+-tests += md5test sha256test sha512test
++tests-$(OPTION_EGLIBC_CRYPT) += md5test sha256test sha512test
+ 
+ # The test md5test-giant uses up to 400 MB of RSS and runs on a fast
+ # machine over a minute.
+@@ -64,8 +68,10 @@ $(objpfx)sha256test: $(patsubst %, $(objpfx)%.o,$(sha256-routines))
+ $(objpfx)sha512test: $(patsubst %, $(objpfx)%.o,$(sha512-routines))
+ endif
+ 
++ifeq ($(OPTION_EGLIBC_CRYPT),y)
+ ifeq (yes,$(build-shared))
+ $(addprefix $(objpfx),$(tests)): $(objpfx)libcrypt.so
+ else
+ $(addprefix $(objpfx),$(tests)): $(objpfx)libcrypt.a
+ endif
++endif # eglibc: OPTION_EGLIBC_CRYPT
+diff --git a/crypt/crypt-entry.c b/crypt/crypt-entry.c
+index 7e655ba..6ae5c2b 100644
+--- a/crypt/crypt-entry.c
++++ b/crypt/crypt-entry.c
 @@ -27,6 +27,7 @@
  #include <stdio.h>
  #endif
@@ -225,66 +506,91 @@ Index: git/crypt/crypt-entry.c
  }
  
  
-Index: git/crypt/Makefile
-===================================================================
---- git.orig/crypt/Makefile
-+++ git/crypt/Makefile
-@@ -18,21 +18,25 @@
- #
- #	Sub-makefile for crypt() portion of the library.
- #
-+include ../option-groups.mak
+diff --git a/crypt/crypt_common.c b/crypt/crypt_common.c
+new file mode 100644
+index 0000000..cce6a31
+--- /dev/null
++++ b/crypt/crypt_common.c
+@@ -0,0 +1,42 @@
++/*
++ * crypt: crypt(3) implementation
++ *
++ * Copyright (C) 1991-2014 Free Software Foundation, Inc.
++ *
++ * This library is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU Lesser General Public
++ * License as published by the Free Software Foundation; either
++ * version 2.1 of the License, or (at your option) any later version.
++ *
++ * This library is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++ * Lesser General Public License for more details.
++ *
++ * You should have received a copy of the GNU Lesser General Public
++ * License along with this library; see the file COPYING.LIB.  If not,
++ * see <http://www.gnu.org/licenses/>.
++ *
++ * General Support routines
++ *
++ */
 +
- subdir	:= crypt
- 
- include ../Makeconfig
- 
- headers := crypt.h
- 
--extra-libs := libcrypt
--extra-libs-others := $(extra-libs)
-+extra-libs-$(OPTION_EGLIBC_CRYPT) := libcrypt
-+extra-libs-others-y := $(extra-libs-y)
- 
--libcrypt-routines := crypt-entry md5-crypt sha256-crypt sha512-crypt crypt \
--		     crypt_util
-+libcrypt-routines :=crypt-entry  md5-crypt sha256-crypt sha512-crypt crypt_common
-+libcrypt-routines-$(OPTION_EGLIBC_CRYPT_UFC) := crypt crypt_util
-+libcrypt-routines += $(libcrypt-routines-y)
- 
--tests := cert md5c-test sha256c-test sha512c-test badsalttest
-+tests-$(OPTION_EGLIBC_CRYPT) := md5c-test sha256c-test sha512c-test badsalttest
-+tests-$(OPTION_EGLIBC_CRYPT_UFC) += cert
- 
--ifeq ($(crypt-in-libc),yes)
-+ifeq ($(crypt-in-libc)$(OPTION_EGLIBC_CRYPT),yesy)
- routines += $(libcrypt-routines)
- endif
- 
-@@ -44,7 +48,7 @@ LDLIBS-crypt.so = -lfreebl3
- else
- libcrypt-routines += md5 sha256 sha512
- 
--tests += md5test sha256test sha512test
-+tests-$(OPTION_EGLIBC_CRYPT) += md5test sha256test sha512test
- 
- # The test md5test-giant uses up to 400 MB of RSS and runs on a fast
- # machine over a minute.
-@@ -64,8 +68,10 @@ $(objpfx)sha256test: $(patsubst %, $(obj
- $(objpfx)sha512test: $(patsubst %, $(objpfx)%.o,$(sha512-routines))
- endif
++#include "crypt-private.h"
++
++/* Table with characters for base64 transformation.  */
++static const char b64t[64] =
++"./0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
++
++void
++__b64_from_24bit (char **cp, int *buflen,
++		  unsigned int b2, unsigned int b1, unsigned int b0,
++		  int n)
++{
++  unsigned int w = (b2 << 16) | (b1 << 8) | b0;
++  while (n-- > 0 && (*buflen) > 0)
++    {
++      *(*cp)++ = b64t[w & 0x3f];
++      --(*buflen);
++      w >>= 6;
++    }
++}
+diff --git a/crypt/crypt_util.c b/crypt/crypt_util.c
+index 1597885..9297974 100644
+--- a/crypt/crypt_util.c
++++ b/crypt/crypt_util.c
+@@ -242,10 +242,6 @@ static ufc_long eperm32tab[4][256][2];
+  */
+ static ufc_long efp[16][64][2];
  
-+ifeq ($(OPTION_EGLIBC_CRYPT),y)
- ifeq (yes,$(build-shared))
- $(addprefix $(objpfx),$(tests)): $(objpfx)libcrypt.so
- else
- $(addprefix $(objpfx),$(tests)): $(objpfx)libcrypt.a
- endif
-+endif # eglibc: OPTION_EGLIBC_CRYPT
-Index: git/csu/Makefile
-===================================================================
---- git.orig/csu/Makefile
-+++ git/csu/Makefile
+-/* Table with characters for base64 transformation.  */
+-static const char b64t[64] =
+-"./0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
+-
+ /*
+  * For use by the old, non-reentrant routines
+  * (crypt/encrypt/setkey)
+@@ -949,17 +945,3 @@ setkey(__key)
+ {
+   __setkey_r(__key, &_ufc_foobar);
+ }
+-
+-void
+-__b64_from_24bit (char **cp, int *buflen,
+-		  unsigned int b2, unsigned int b1, unsigned int b0,
+-		  int n)
+-{
+-  unsigned int w = (b2 << 16) | (b1 << 8) | b0;
+-  while (n-- > 0 && (*buflen) > 0)
+-    {
+-      *(*cp)++ = b64t[w & 0x3f];
+-      --(*buflen);
+-      w >>= 6;
+-    }
+-}
+diff --git a/csu/Makefile b/csu/Makefile
+index 9f0855a..b1c3363 100644
+--- a/csu/Makefile
++++ b/csu/Makefile
 @@ -22,6 +22,8 @@
  # crtn.o, special "initializer" and "finalizer" files used in the link
  # to make the .init and .fini sections work right.
@@ -294,10 +600,10 @@ Index: git/csu/Makefile
  subdir := csu
  
  include ../Makeconfig
-Index: git/debug/Makefile
-===================================================================
---- git.orig/debug/Makefile
-+++ git/debug/Makefile
+diff --git a/debug/Makefile b/debug/Makefile
+index 9ff357b..d23d97d 100644
+--- a/debug/Makefile
++++ b/debug/Makefile
 @@ -18,6 +18,8 @@
  #
  #	Sub-makefile for debug portion of the library.
@@ -316,7 +622,7 @@ Index: git/debug/Makefile
  	    memcpy_chk memmove_chk mempcpy_chk memset_chk stpcpy_chk \
  	    strcat_chk strcpy_chk strncat_chk strncpy_chk stpncpy_chk \
  	    sprintf_chk vsprintf_chk snprintf_chk vsnprintf_chk \
-@@ -36,20 +38,27 @@ routines  = backtrace backtracesyms back
+@@ -36,20 +38,27 @@ routines  = backtrace backtracesyms backtracesymsfd noophooks \
  	    read_chk pread_chk pread64_chk recv_chk recvfrom_chk \
  	    readlink_chk readlinkat_chk getwd_chk getcwd_chk \
  	    realpath_chk fread_chk fread_u_chk \
@@ -371,12 +677,12 @@ Index: git/debug/Makefile
 +tests += tst-chk4 tst-chk5 tst-chk6 tst-lfschk4 tst-lfschk5 tst-lfschk6
 +endif
  
- extra-libs = libSegFault libpcprofile
- extra-libs-others = $(extra-libs)
-Index: git/debug/segfault.c
-===================================================================
---- git.orig/debug/segfault.c
-+++ git/debug/segfault.c
+ ifeq (,$(CXX))
+ tests-unsupported = tst-chk4 tst-chk5 tst-chk6 \
+diff --git a/debug/segfault.c b/debug/segfault.c
+index 3459a2a..ee9a146 100644
+--- a/debug/segfault.c
++++ b/debug/segfault.c
 @@ -30,6 +30,7 @@
  #include <unistd.h>
  #include <_itoa.h>
@@ -402,7 +708,7 @@ Index: git/debug/segfault.c
    /* This is the name of the file we are writing to.  If none is given
       or we cannot write to this file write to stderr.  */
    fd = 2;
-@@ -91,6 +94,7 @@ catch_segfault (int signal, SIGCONTEXT c
+@@ -91,6 +94,7 @@ catch_segfault (int signal, SIGCONTEXT ctx)
    REGISTER_DUMP;
  #endif
  
@@ -410,7 +716,7 @@ Index: git/debug/segfault.c
    WRITE_STRING ("\nBacktrace:\n");
  
    /* Get the backtrace.  */
-@@ -113,6 +117,7 @@ catch_segfault (int signal, SIGCONTEXT c
+@@ -113,6 +117,7 @@ catch_segfault (int signal, SIGCONTEXT ctx)
  
    /* Now generate nicely formatted output.  */
    __backtrace_symbols_fd (arr + i, cnt - i, fd);
@@ -418,10 +724,10 @@ Index: git/debug/segfault.c
  
  #ifdef HAVE_PROC_SELF
    /* Now the link map.  */
-Index: git/debug/tst-chk1.c
-===================================================================
---- git.orig/debug/tst-chk1.c
-+++ git/debug/tst-chk1.c
+diff --git a/debug/tst-chk1.c b/debug/tst-chk1.c
+index 53559e6..362d92a 100644
+--- a/debug/tst-chk1.c
++++ b/debug/tst-chk1.c
 @@ -31,6 +31,7 @@
  #include <sys/select.h>
  #include <sys/socket.h>
@@ -478,10 +784,10 @@ Index: git/debug/tst-chk1.c
  
    int fd = posix_openpt (O_RDWR);
    if (fd != -1)
-Index: git/dlfcn/Makefile
-===================================================================
---- git.orig/dlfcn/Makefile
-+++ git/dlfcn/Makefile
+diff --git a/dlfcn/Makefile b/dlfcn/Makefile
+index 759780d..3827607 100644
+--- a/dlfcn/Makefile
++++ b/dlfcn/Makefile
 @@ -15,6 +15,8 @@
  # License along with the GNU C Library; if not, see
  # <http://www.gnu.org/licenses/>.
@@ -491,85 +797,32 @@ Index: git/dlfcn/Makefile
  subdir		:= dlfcn
  
  include ../Makeconfig
-@@ -36,14 +38,18 @@ endif
+@@ -36,8 +38,11 @@ endif
  ifeq (yes,$(build-shared))
  tests = glrefmain failtest tst-dladdr default errmsg1 tstcxaatexit \
  	bug-dlopen1 bug-dlsym1 tst-dlinfo bug-atexit1 bug-atexit2 \
 -	bug-atexit3 tstatexit bug-dl-leaf tst-rec-dlopen
 +	tstatexit bug-dl-leaf tst-rec-dlopen
-+tests-$(OPTION_EGLIBC_CXX_TESTS) += bug-atexit3
  endif
++
++tests-$(OPTION_EGLIBC_CXX_TESTS) += bug-atexit3
++
  modules-names = glreflib1 glreflib2 glreflib3 failtestmod defaultmod1 \
  		defaultmod2 errmsg1mod modatexit modcxaatexit \
  		bug-dlsym1-lib1 bug-dlsym1-lib2 bug-atexit1-lib \
--		bug-atexit2-lib bug-atexit3-lib bug-dl-leaf-lib \
-+		bug-atexit2-lib bug-dl-leaf-lib \
- 		bug-dl-leaf-lib-cb moddummy1 moddummy2
- 
-+ifeq (y,$(OPTION_EGLIBC_CXX_TESTS))
-+modules-names += bug-atexit3-lib
-+endif
- failtestmod.so-no-z-defs = yes
- glreflib2.so-no-z-defs = yes
- errmsg1mod.so-no-z-defs = yes
-Index: git/elf/Makefile
-===================================================================
---- git.orig/elf/Makefile
-+++ git/elf/Makefile
-@@ -17,6 +17,8 @@
- 
- # Makefile for elf subdirectory of GNU C Library.
- 
-+include ../option-groups.mak
-+
- subdir		:= elf
- 
- include ../Makeconfig
-@@ -144,10 +146,11 @@ tests += loadtest restest1 preloadtest loadfail multiload origtest resolvfail \
- 	 unload3 unload4 unload5 unload6 unload7 unload8 tst-global1 order2 \
- 	 tst-audit1 tst-audit2 tst-audit8 tst-audit9 \
- 	 tst-stackguard1 tst-addr1 tst-thrlock \
--	 tst-unique1 tst-unique2 tst-unique3 tst-unique4 \
-+	 tst-unique1 tst-unique2 \
- 	 tst-initorder tst-initorder2 tst-relsort1 tst-null-argv \
- 	 tst-ptrguard1
- #	 reldep9
-+tests-$(OPTION_EGLIBC_CXX_TESTS) += tst-unique3 tst-unique4
- ifeq ($(build-hardcoded-path-in-tests),yes)
- tests += tst-dlopen-aout
- endif
-@@ -205,8 +208,6 @@ modules-names = testobj1 testobj2 testobj3 testobj4 testobj5 testobj6 \
- 		tst-unique1mod1 tst-unique1mod2 \
- 		tst-unique2mod1 tst-unique2mod2 \
- 		tst-auditmod9a tst-auditmod9b \
--		tst-unique3lib tst-unique3lib2 \
--		tst-unique4lib \
- 		tst-initordera1 tst-initorderb1 \
- 		tst-initordera2 tst-initorderb2 \
- 		tst-initordera3 tst-initordera4 \
-@@ -214,6 +215,9 @@ modules-names = testobj1 testobj2 testobj3 testobj4 testobj5 testobj6 \
- 		tst-initorder2d \
- 		tst-relsort1mod1 tst-relsort1mod2 tst-array2dep \
- 		tst-array5dep tst-null-argv-lib
-+ifeq (y,$(OPTION_EGLIBC_CXX_TESTS))
-+modules-names += tst-unique3lib tst-unique3lib2 tst-unique4lib 
-+endif
- ifeq (yesyes,$(have-fpie)$(build-shared))
- modules-names += tst-piemod1
- tests += tst-pie1 tst-pie2
-Index: git/elf/dl-support.c
-===================================================================
---- git.orig/elf/dl-support.c
-+++ git/elf/dl-support.c
-@@ -19,6 +19,7 @@
- /* This file defines some things that for the dynamic linker are defined in
-    rtld.c and dl-sysdep.c in ways appropriate to bootstrap dynamic linking.  */
+diff --git a/elf/dl-support.c b/elf/dl-support.c
+index 4d036f1..c15f405 100644
+--- a/elf/dl-support.c
++++ b/elf/dl-support.c
+@@ -19,6 +19,7 @@
+ /* This file defines some things that for the dynamic linker are defined in
+    rtld.c and dl-sysdep.c in ways appropriate to bootstrap dynamic linking.  */
  
 +#include <gnu/option-groups.h>
  #include <errno.h>
  #include <libintl.h>
  #include <stdlib.h>
-@@ -42,7 +43,9 @@ char **_dl_argv = &__progname;	/* This i
+@@ -42,7 +43,9 @@ char **_dl_argv = &__progname;	/* This is checked for some error messages.  */
  const char *_dl_platform;
  size_t _dl_platformlen;
  
@@ -579,10 +832,10 @@ Index: git/elf/dl-support.c
  int _dl_lazy;
  ElfW(Addr) _dl_use_load_bias = -2;
  int _dl_dynamic_weak;
-Index: git/elf/rtld.c
-===================================================================
---- git.orig/elf/rtld.c
-+++ git/elf/rtld.c
+diff --git a/elf/rtld.c b/elf/rtld.c
+index 6d3add7..fc3a2db 100644
+--- a/elf/rtld.c
++++ b/elf/rtld.c
 @@ -16,6 +16,7 @@
     License along with the GNU C Library; if not, see
     <http://www.gnu.org/licenses/>.  */
@@ -591,7 +844,7 @@ Index: git/elf/rtld.c
  #include <errno.h>
  #include <dlfcn.h>
  #include <fcntl.h>
-@@ -2200,6 +2201,7 @@ print_missing_version (int errcode __att
+@@ -2201,6 +2202,7 @@ print_missing_version (int errcode __attribute__ ((unused)),
  		    objname, errstring);
  }
  
@@ -599,7 +852,7 @@ Index: git/elf/rtld.c
  /* Nonzero if any of the debugging options is enabled.  */
  static int any_debug attribute_relro;
  
-@@ -2309,6 +2311,7 @@ a filename can be specified using the LD
+@@ -2310,6 +2312,7 @@ a filename can be specified using the LD_DEBUG_OUTPUT environment variable.\n");
        _exit (0);
      }
  }
@@ -607,7 +860,7 @@ Index: git/elf/rtld.c
  
  static void
  process_dl_audit (char *str)
-@@ -2348,8 +2351,9 @@ process_envvars (enum mode *modep)
+@@ -2349,8 +2352,9 @@ process_envvars (enum mode *modep)
    char **runp = _environ;
    char *envline;
    enum mode mode = normal;
@@ -618,7 +871,7 @@ Index: git/elf/rtld.c
    /* This is the default place for profiling data file.  */
    GLRO(dl_profile_output)
      = &"/var/tmp\0/var/profile"[__libc_enable_secure ? 9 : 0];
-@@ -2376,12 +2380,14 @@ process_envvars (enum mode *modep)
+@@ -2377,12 +2381,14 @@ process_envvars (enum mode *modep)
  	  break;
  
  	case 5:
@@ -633,7 +886,7 @@ Index: git/elf/rtld.c
  	  if (memcmp (envline, "AUDIT", 5) == 0)
  	    process_dl_audit (&envline[6]);
  	  break;
-@@ -2447,13 +2453,14 @@ process_envvars (enum mode *modep)
+@@ -2448,13 +2454,14 @@ process_envvars (enum mode *modep)
  	      break;
  	    }
  
@@ -649,22 +902,22 @@ Index: git/elf/rtld.c
  	  if (!__libc_enable_secure
  	      && memcmp (envline, "DYNAMIC_WEAK", 12) == 0)
  	    GLRO(dl_dynamic_weak) = 1;
-@@ -2490,7 +2497,9 @@ process_envvars (enum mode *modep)
+@@ -2491,7 +2498,9 @@ process_envvars (enum mode *modep)
  	    {
  	      mode = trace;
  	      GLRO(dl_verbose) = 1;
 +#if __OPTION_EGLIBC_RTLD_DEBUG
- 	      GLRO_dl_debug_mask |= DL_DEBUG_PRELINK;
+ 	      GLRO(dl_debug_mask) |= DL_DEBUG_PRELINK;
 +#endif
  	      GLRO(dl_trace_prelink) = &envline[17];
  	    }
  	  break;
-@@ -2537,12 +2546,15 @@ process_envvars (enum mode *modep)
+@@ -2538,12 +2547,15 @@ process_envvars (enum mode *modep)
        if (__access ("/etc/suid-debug", F_OK) != 0)
  	{
  	  unsetenv ("MALLOC_CHECK_");
 +#if __OPTION_EGLIBC_RTLD_DEBUG
- 	  GLRO_dl_debug_mask = 0;
+ 	  GLRO(dl_debug_mask) = 0;
 +#endif
  	}
  
@@ -675,7 +928,7 @@ Index: git/elf/rtld.c
    /* If we have to run the dynamic linker in debugging mode and the
       LD_DEBUG_OUTPUT environment variable is given, we write the debug
       messages to this file.  */
-@@ -2567,6 +2579,7 @@ process_envvars (enum mode *modep)
+@@ -2568,6 +2580,7 @@ process_envvars (enum mode *modep)
  	/* We use standard output if opening the file failed.  */
  	GLRO(dl_debug_fd) = STDOUT_FILENO;
      }
@@ -683,10 +936,10 @@ Index: git/elf/rtld.c
  }
  
  
-Index: git/extra-lib.mk
-===================================================================
---- git.orig/extra-lib.mk
-+++ git/extra-lib.mk
+diff --git a/extra-lib.mk b/extra-lib.mk
+index b10748d..d71a06f 100644
+--- a/extra-lib.mk
++++ b/extra-lib.mk
 @@ -25,7 +25,9 @@ install-lib := $(install-lib)
  extra-objs := $(extra-objs)
  
@@ -707,10 +960,10 @@ Index: git/extra-lib.mk
  ifneq (,$(cpp-srcs-left))
  include $(patsubst %,$(..)cppflags-iterator.mk,$(cpp-srcs-left))
  endif
-Index: git/grp/Makefile
-===================================================================
---- git.orig/grp/Makefile
-+++ git/grp/Makefile
+diff --git a/grp/Makefile b/grp/Makefile
+index c63b552..7486f32 100644
+--- a/grp/Makefile
++++ b/grp/Makefile
 @@ -18,6 +18,8 @@
  #
  #	Sub-makefile for grp portion of the library.
@@ -720,7 +973,7 @@ Index: git/grp/Makefile
  subdir	:= grp
  
  include ../Makeconfig
-@@ -29,6 +31,9 @@ routines := fgetgrent initgroups setgrou
+@@ -29,6 +31,9 @@ routines := fgetgrent initgroups setgroups \
  	    getgrent_r getgrgid_r getgrnam_r fgetgrent_r
  
  tests := testgrp
@@ -730,10 +983,10 @@ Index: git/grp/Makefile
  
  ifeq (yes,$(build-shared))
  test-srcs :=  tst_fgetgrent
-Index: git/hesiod/Makefile
-===================================================================
---- git.orig/hesiod/Makefile
-+++ git/hesiod/Makefile
+diff --git a/hesiod/Makefile b/hesiod/Makefile
+index ac0bc01..38263b4 100644
+--- a/hesiod/Makefile
++++ b/hesiod/Makefile
 @@ -18,12 +18,14 @@
  #
  #	Sub-makefile for hesiod portion of the library.
@@ -751,10 +1004,35 @@ Index: git/hesiod/Makefile
  
  subdir-dirs = nss_hesiod
  vpath %.c nss_hesiod
-Index: git/iconv/gconv_db.c
-===================================================================
---- git.orig/iconv/gconv_db.c
-+++ git/iconv/gconv_db.c
+diff --git a/iconv/Makefile b/iconv/Makefile
+index 0d55eda..a1847c6 100644
+--- a/iconv/Makefile
++++ b/iconv/Makefile
+@@ -18,6 +18,8 @@
+ #
+ #	Makefile for iconv.
+ #
++include ../option-groups.mak
++
+ subdir	:= iconv
+ 
+ include ../Makeconfig
+@@ -39,6 +41,11 @@ CFLAGS-iconv_charmap.c = -I../locale/programs
+ CFLAGS-dummy-repertoire.c = -I../locale/programs
+ CFLAGS-charmap.c = -DCHARMAP_PATH='"$(i18ndir)/charmaps"' \
+ 		   -DDEFAULT_CHARMAP=null_pointer -DNEED_NULL_POINTER
++
++ifneq (y,$(OPTION_EGLIBC_SPAWN))
++CFLAGS-charmap-dir.c += -DNO_UNCOMPRESS
++endif
++
+ CFLAGS-linereader.c = -DNO_TRANSLITERATION
+ CFLAGS-simple-hash.c = -I../locale
+ 
+diff --git a/iconv/gconv_db.c b/iconv/gconv_db.c
+index ce46216..ea18964 100644
+--- a/iconv/gconv_db.c
++++ b/iconv/gconv_db.c
 @@ -25,6 +25,7 @@
  #include <sys/param.h>
  #include <bits/libc-lock.h>
@@ -763,7 +1041,7 @@ Index: git/iconv/gconv_db.c
  
  #include <dlfcn.h>
  #include <gconv_int.h>
-@@ -828,9 +829,11 @@ free_modules_db (struct gconv_module *no
+@@ -828,9 +829,11 @@ free_modules_db (struct gconv_module *node)
  /* Free all resources if necessary.  */
  libc_freeres_fn (free_mem)
  {
@@ -775,10 +1053,10 @@ Index: git/iconv/gconv_db.c
  
    /* finddomain.c has similar problem.  */
    extern void _nl_finddomain_subfreeres (void) attribute_hidden;
-Index: git/iconv/gconv_trans.c
-===================================================================
---- git.orig/iconv/gconv_trans.c
-+++ git/iconv/gconv_trans.c
+diff --git a/iconv/gconv_trans.c b/iconv/gconv_trans.c
+index 5d5d4d7..a7d3072 100644
+--- a/iconv/gconv_trans.c
++++ b/iconv/gconv_trans.c
 @@ -23,6 +23,7 @@
  #include <stdint.h>
  #include <string.h>
@@ -787,7 +1065,7 @@ Index: git/iconv/gconv_trans.c
  
  #include <bits/libc-lock.h>
  #include "gconv_int.h"
-@@ -38,15 +39,19 @@ __gconv_transliterate (struct __gconv_st
+@@ -38,15 +39,19 @@ __gconv_transliterate (struct __gconv_step *step,
  		       unsigned char **outbufstart, size_t *irreversible)
  {
    /* Find out about the locale's transliteration.  */
@@ -807,7 +1085,7 @@ Index: git/iconv/gconv_trans.c
  
    /* The input buffer.  There are actually 4-byte values.  */
    winbuf = (const uint32_t *) *inbufp;
-@@ -58,6 +63,7 @@ __gconv_transliterate (struct __gconv_st
+@@ -58,6 +63,7 @@ __gconv_transliterate (struct __gconv_step *step,
      PTR_DEMANGLE (fct);
  #endif
  
@@ -815,7 +1093,7 @@ Index: git/iconv/gconv_trans.c
    /* If there is no transliteration information in the locale don't do
       anything and return the error.  */
    size = _NL_CURRENT_WORD (LC_CTYPE, _NL_CTYPE_TRANSLIT_TAB_SIZE);
-@@ -193,6 +199,7 @@ __gconv_transliterate (struct __gconv_st
+@@ -193,6 +199,7 @@ __gconv_transliterate (struct __gconv_step *step,
               sorted.  */
  	  break;
      }
@@ -823,10 +1101,10 @@ Index: git/iconv/gconv_trans.c
  
    /* One last chance: use the default replacement.  */
    if (_NL_CURRENT_WORD (LC_CTYPE, _NL_CTYPE_TRANSLIT_DEFAULT_MISSING_LEN) != 0)
-Index: git/iconv/iconv_prog.c
-===================================================================
---- git.orig/iconv/iconv_prog.c
-+++ git/iconv/iconv_prog.c
+diff --git a/iconv/iconv_prog.c b/iconv/iconv_prog.c
+index e249bce..403ece5 100644
+--- a/iconv/iconv_prog.c
++++ b/iconv/iconv_prog.c
 @@ -35,6 +35,7 @@
  #ifdef _POSIX_MAPPED_FILES
  # include <sys/mman.h>
@@ -853,35 +1131,10 @@ Index: git/iconv/iconv_prog.c
  
  	      if (from_wrong)
  		{
-Index: git/iconv/Makefile
-===================================================================
---- git.orig/iconv/Makefile
-+++ git/iconv/Makefile
-@@ -18,6 +18,8 @@
- #
- #	Makefile for iconv.
- #
-+include ../option-groups.mak
-+
- subdir	:= iconv
- 
- include ../Makeconfig
-@@ -39,6 +41,11 @@ CFLAGS-iconv_charmap.c = -I../locale/pro
- CFLAGS-dummy-repertoire.c = -I../locale/programs
- CFLAGS-charmap.c = -DCHARMAP_PATH='"$(i18ndir)/charmaps"' \
- 		   -DDEFAULT_CHARMAP=null_pointer -DNEED_NULL_POINTER
-+
-+ifneq (y,$(OPTION_EGLIBC_SPAWN))
-+CFLAGS-charmap-dir.c += -DNO_UNCOMPRESS
-+endif
-+
- CFLAGS-linereader.c = -DNO_TRANSLITERATION
- CFLAGS-simple-hash.c = -I../locale
- 
-Index: git/iconvdata/Makefile
-===================================================================
---- git.orig/iconvdata/Makefile
-+++ git/iconvdata/Makefile
+diff --git a/iconvdata/Makefile b/iconvdata/Makefile
+index a3d1d09..0832708 100644
+--- a/iconvdata/Makefile
++++ b/iconvdata/Makefile
 @@ -18,12 +18,15 @@
  #
  #	Makefile for iconv data and code.
@@ -899,7 +1152,7 @@ Index: git/iconvdata/Makefile
  	   ISO8859-6 ISO8859-7 ISO8859-8 ISO8859-9 ISO8859-10		 \
  	   ISO8859-11 ISO8859-13 ISO8859-14 ISO8859-15 ISO8859-16	 \
  	   T.61 ISO_6937 SJIS KOI-8 HP-ROMAN8 HP-ROMAN9 EBCDIC-AT-DE	 \
-@@ -63,11 +66,13 @@ modules	:= ISO8859-1 ISO8859-2 ISO8859-3
+@@ -63,11 +66,13 @@ modules	:= ISO8859-1 ISO8859-2 ISO8859-3 ISO8859-4 ISO8859-5		 \
  	   MAC-CENTRALEUROPE KOI8-RU ISO8859-9E				 \
  	   CP770 CP771 CP772 CP773 CP774
  
@@ -932,7 +1185,7 @@ Index: git/iconvdata/Makefile
  
  # We can build the conversion tables for numerous charsets automatically.
  
-@@ -201,7 +206,7 @@ before-compile += $(addprefix $(objpfx),
+@@ -201,7 +206,7 @@ before-compile += $(addprefix $(objpfx),$(generated-modules:=.h))
  ifndef avoid-generated
  $(objpfx)iconv-rules: Makefile
  	$(make-target-directory)
@@ -941,7 +1194,7 @@ Index: git/iconvdata/Makefile
  	  echo 8bit $(gen-8bit-modules); \
  	  echo 8bit-gap $(gen-8bit-gap-modules); } | \
  	LC_ALL=C \
-@@ -245,7 +250,7 @@ $(addprefix $(inst_gconvdir)/, $(modules
+@@ -245,7 +250,7 @@ $(addprefix $(inst_gconvdir)/, $(modules.so)): \
  	$(do-install-program)
  $(inst_gconvdir)/gconv-modules: gconv-modules $(+force)
  	$(do-install)
@@ -963,11 +1216,11 @@ Index: git/iconvdata/Makefile
  
  endif # build-shared = yes
  
-Index: git/include/netdb.h
-===================================================================
---- git.orig/include/netdb.h
-+++ git/include/netdb.h
-@@ -232,6 +232,10 @@ extern enum nss_status _nss_ ## service
+diff --git a/include/netdb.h b/include/netdb.h
+index e1f051d..f6d15aa 100644
+--- a/include/netdb.h
++++ b/include/netdb.h
+@@ -232,6 +232,10 @@ extern enum nss_status _nss_ ## service ## _gethostbyname2_r		      \
  		       (const char *name, int af, struct hostent *host,	      \
  			char *buffer, size_t buflen, int *errnop,	      \
  			int *h_errnop);					      \
@@ -978,10 +1231,10 @@ Index: git/include/netdb.h
  extern enum nss_status _nss_ ## service ## _gethostbyname_r		      \
  		       (const char *name, struct hostent *host, char *buffer, \
  			size_t buflen, int *errnop, int *h_errnop);	      \
-Index: git/inet/Makefile
-===================================================================
---- git.orig/inet/Makefile
-+++ git/inet/Makefile
+diff --git a/inet/Makefile b/inet/Makefile
+index f1d871f..7cb1709 100644
+--- a/inet/Makefile
++++ b/inet/Makefile
 @@ -18,6 +18,8 @@
  #
  #	Sub-makefile for inet portion of the library.
@@ -991,7 +1244,7 @@ Index: git/inet/Makefile
  subdir	:= inet
  
  include ../Makeconfig
-@@ -27,7 +29,8 @@ headers	:= netinet/ether.h netinet/in.h
+@@ -27,7 +29,8 @@ headers	:= netinet/ether.h netinet/in.h netinet/in_systm.h \
  	   netinet/tcp.h netinet/ip.h $(wildcard arpa/*.h protocols/*.h) \
  	   aliases.h ifaddrs.h netinet/ip6.h netinet/icmp6.h bits/in.h
  
@@ -1001,8 +1254,8 @@ Index: git/inet/Makefile
  	    inet_lnaof inet_mkadr	\
  	    inet_netof inet_ntoa inet_net herrno herrno-loc \
  	    gethstbyad gethstbyad_r gethstbynm gethstbynm2 gethstbynm2_r \
-@@ -41,18 +44,23 @@ routines := htonl htons		\
- 	    getrpcent_r getrpcbyname_r getrpcbynumber_r \
+@@ -39,18 +42,23 @@ routines := htonl htons		\
+ 	    getservent_r	\
  	    ether_aton ether_aton_r ether_hton ether_line \
  	    ether_ntoa ether_ntoa_r ether_ntoh \
 -	    rcmd rexec ruserpass \
@@ -1031,10 +1284,31 @@ Index: git/inet/Makefile
  
  include ../Rules
  
-Index: git/intl/dcigettext.c
-===================================================================
---- git.orig/intl/dcigettext.c
-+++ git/intl/dcigettext.c
+diff --git a/intl/Makefile b/intl/Makefile
+index 9ecf8fe..587bc0d 100644
+--- a/intl/Makefile
++++ b/intl/Makefile
+@@ -16,6 +16,7 @@
+ # <http://www.gnu.org/licenses/>.
+ 
+ # Makefile for intl subdirectory: message handling code from GNU gettext.
++include ../option-groups.mak
+ 
+ subdir = intl
+ 
+@@ -48,7 +49,7 @@ endif
+ $(objpfx)plural.o: plural.c
+ 
+ ifeq ($(run-built-tests),yes)
+-ifeq (yes,$(build-shared))
++ifeq (yyyes,$(OPTION_EGLIBC_LOCALES)$(OPTION_EGLIBC_LOCALE_CODE)$(build-shared))
+ ifneq ($(strip $(MSGFMT)),:)
+ tests-special += $(objpfx)tst-translit.out $(objpfx)tst-gettext.out \
+ 		 $(objpfx)tst-gettext2.out $(objpfx)tst-codeset.out \
+diff --git a/intl/dcigettext.c b/intl/dcigettext.c
+index 8a3f091..e271648 100644
+--- a/intl/dcigettext.c
++++ b/intl/dcigettext.c
 @@ -100,11 +100,15 @@ extern int errno;
  # include "libgnuintl.h"
  #endif
@@ -1051,7 +1325,7 @@ Index: git/intl/dcigettext.c
  # define gl_rwlock_rdlock __libc_rwlock_rdlock
  # define gl_rwlock_wrlock __libc_rwlock_wrlock
  # define gl_rwlock_unlock __libc_rwlock_unlock
-@@ -523,8 +527,10 @@ DCIGETTEXT (const char *domainname, cons
+@@ -523,8 +527,10 @@ DCIGETTEXT (const char *domainname, const char *msgid1, const char *msgid2,
    saved_errno = errno;
  
  #ifdef _LIBC
@@ -1064,7 +1338,7 @@ Index: git/intl/dcigettext.c
  #endif
  
    gl_rwlock_rdlock (_nl_state_lock);
-@@ -550,7 +556,11 @@ DCIGETTEXT (const char *domainname, cons
+@@ -550,7 +556,11 @@ DCIGETTEXT (const char *domainname, const char *msgid1, const char *msgid2,
  #ifdef HAVE_PER_THREAD_LOCALE
  # ifndef IN_LIBGLOCALE
  #  ifdef _LIBC
@@ -1077,7 +1351,7 @@ Index: git/intl/dcigettext.c
  #  else
    categoryname = category_to_name (category);
  #   define CATEGORYNAME_INITIALIZED
-@@ -581,10 +591,12 @@ DCIGETTEXT (const char *domainname, cons
+@@ -581,10 +591,12 @@ DCIGETTEXT (const char *domainname, const char *msgid1, const char *msgid2,
        else
  	retval = (char *) (*foundp)->translation;
  
@@ -1092,7 +1366,7 @@ Index: git/intl/dcigettext.c
        __set_errno (saved_errno);
        return retval;
      }
-@@ -838,10 +850,13 @@ DCIGETTEXT (const char *domainname, cons
+@@ -838,10 +850,13 @@ DCIGETTEXT (const char *domainname, const char *msgid1, const char *msgid2,
  	      if (plural)
  		retval = plural_lookup (domain, n, retval, retlen);
  
@@ -1108,7 +1382,7 @@ Index: git/intl/dcigettext.c
  	      return retval;
  	    }
  	}
-@@ -850,10 +865,12 @@ DCIGETTEXT (const char *domainname, cons
+@@ -850,10 +865,12 @@ DCIGETTEXT (const char *domainname, const char *msgid1, const char *msgid2,
   return_untranslated:
    /* Return the untranslated MSGID.  */
    FREE_BLOCKS (block_list);
@@ -1123,7 +1397,7 @@ Index: git/intl/dcigettext.c
  #ifndef _LIBC
    if (!ENABLE_SECURE)
      {
-@@ -1550,7 +1567,11 @@ guess_category_value (int category, cons
+@@ -1550,7 +1567,11 @@ guess_category_value (int category, const char *categoryname)
       `LC_xxx', and `LANG'.  On some systems this can be done by the
       `setlocale' function itself.  */
  # ifdef _LIBC
@@ -1135,31 +1409,10 @@ Index: git/intl/dcigettext.c
  # else
    locale_defaulted = 0;
  #  if HAVE_USELOCALE
-Index: git/intl/Makefile
-===================================================================
---- git.orig/intl/Makefile
-+++ git/intl/Makefile
-@@ -16,6 +16,7 @@
- # <http://www.gnu.org/licenses/>.
- 
- # Makefile for intl subdirectory: message handling code from GNU gettext.
-+include ../option-groups.mak
- 
- subdir = intl
- 
-@@ -48,7 +49,7 @@ endif
- $(objpfx)plural.o: plural.c
- 
- ifeq ($(run-built-tests),yes)
--ifeq (yes,$(build-shared))
-+ifeq (yyyes,$(OPTION_EGLIBC_LOCALES)$(OPTION_EGLIBC_LOCALE_CODE)$(build-shared))
- ifneq ($(strip $(MSGFMT)),:)
- tests-special += $(objpfx)tst-translit.out $(objpfx)tst-gettext.out \
- 		 $(objpfx)tst-gettext2.out $(objpfx)tst-codeset.out \
-Index: git/io/Makefile
-===================================================================
---- git.orig/io/Makefile
-+++ git/io/Makefile
+diff --git a/io/Makefile b/io/Makefile
+index 613dce0..697439e 100644
+--- a/io/Makefile
++++ b/io/Makefile
 @@ -18,6 +18,8 @@
  #
  #	Sub-makefile for I/O portion of the library.
@@ -1193,7 +1446,7 @@ Index: git/io/Makefile
  
  aux := have_o_cloexec
  
-@@ -64,18 +68,22 @@ static-only-routines = stat fstat lstat
+@@ -64,18 +68,22 @@ static-only-routines = stat fstat lstat stat64 fstat64 lstat64	\
  		       fstatat fstatat64 mknod mknodat
  
  others		:= pwd
@@ -1219,10 +1472,10 @@ Index: git/io/Makefile
  
  include ../Rules
  
-Index: git/libidn/Makefile
-===================================================================
---- git.orig/libidn/Makefile
-+++ git/libidn/Makefile
+diff --git a/libidn/Makefile b/libidn/Makefile
+index 940fa52..43aad0c 100644
+--- a/libidn/Makefile
++++ b/libidn/Makefile
 @@ -16,6 +16,7 @@
  # <http://www.gnu.org/licenses/>.
  
@@ -1242,10 +1495,10 @@ Index: git/libidn/Makefile
  
  libcidn-routines := punycode toutf8 nfkc stringprep rfc3454 profiles idna \
  		    iconvme
-Index: git/libidn/toutf8.c
-===================================================================
---- git.orig/libidn/toutf8.c
-+++ git/libidn/toutf8.c
+diff --git a/libidn/toutf8.c b/libidn/toutf8.c
+index c7e67ca..62df478 100644
+--- a/libidn/toutf8.c
++++ b/libidn/toutf8.c
 @@ -33,6 +33,11 @@
  /* Get strlen. */
  #include <string.h>
@@ -1271,11 +1524,138 @@ Index: git/libidn/toutf8.c
  #else
  /**
   * stringprep_locale_charset - return charset used in current locale
-Index: git/libio/fileops.c
-===================================================================
---- git.orig/libio/fileops.c
-+++ git/libio/fileops.c
-@@ -38,6 +38,7 @@
+diff --git a/libio/Makefile b/libio/Makefile
+index 7b3bcf9..27c9186 100644
+--- a/libio/Makefile
++++ b/libio/Makefile
+@@ -18,6 +18,8 @@
+ #
+ #	Specific makefile for libio.
+ #
++include ../option-groups.mak
++
+ subdir	:= libio
+ 
+ include ../Makeconfig
+@@ -27,16 +29,13 @@ headers	:= stdio.h libio.h _G_config.h bits/stdio.h bits/stdio-lock.h \
+ 
+ routines	:=							      \
+ 	filedoalloc iofclose iofdopen iofflush iofgetpos iofgets iofopen      \
+-	iofopncook iofputs iofread iofsetpos ioftell wfiledoalloc	      \
++	iofopncook iofputs iofread iofsetpos ioftell			      \
+ 	iofwrite iogetdelim iogetline iogets iopadn iopopen ioputs	      \
+ 	ioseekoff ioseekpos iosetbuffer iosetvbuf ioungetc		      \
+ 	iovsprintf iovsscanf						      \
+ 	iofgetpos64 iofopen64 iofsetpos64				      \
+-	fputwc fputwc_u getwc getwc_u getwchar getwchar_u iofgetws iofgetws_u \
+-	iofputws iofputws_u iogetwline iowpadn ioungetwc putwc putwc_u	      \
+-	putwchar putwchar_u putchar putchar_u fwprintf swprintf vwprintf      \
+-	wprintf wscanf fwscanf vwscanf vswprintf iovswscanf swscanf wgenops   \
+-	wstrops wfileops iofwide fwide wmemstream			      \
++	putchar putchar_u						      \
++	iofwide								      \
+ 									      \
+ 	clearerr feof ferror fileno fputc freopen fseek getc getchar	      \
+ 	memstream pclose putc putchar rewind setbuf setlinebuf vasprintf      \
+@@ -48,24 +47,49 @@ routines	:=							      \
+ 									      \
+ 	libc_fatal fmemopen oldfmemopen
+ 
+-tests = tst_swprintf tst_wprintf tst_swscanf tst_wscanf tst_getwc tst_putwc   \
+-	tst_wprintf2 tst-widetext test-fmemopen tst-ext tst-ext2 \
+-	tst-fgetws tst-ungetwc1 tst-ungetwc2 tst-swscanf tst-sscanf	      \
+-	tst-mmap-setvbuf bug-ungetwc1 bug-ungetwc2 tst-atime tst-eof          \
+-	tst-freopen bug-rewind bug-rewind2 bug-ungetc bug-fseek \
++routines-$(OPTION_POSIX_C_LANG_WIDE_CHAR) +=				      \
++	wfiledoalloc                                                          \
++	iowpadn                                                               \
++	swprintf                                                              \
++	vswprintf iovswscanf swscanf wgenops                                  \
++	wstrops wfileops wmemstream
++routines-$(call option-disabled, OPTION_POSIX_C_LANG_WIDE_CHAR) +=	      \
++	wdummyfileops
++routines-$(OPTION_POSIX_WIDE_CHAR_DEVICE_IO) +=				      \
++	fputwc fputwc_u getwc getwc_u getwchar getwchar_u iofgetws iofgetws_u \
++	iofputws iofputws_u iogetwline ioungetwc putwc putwc_u                \
++	putwchar putwchar_u fwprintf vwprintf                                 \
++	wprintf wscanf fwscanf vwscanf                                        \
++	fwide
++
++tests = test-fmemopen tst-ext tst-ext2 \
++	tst-mmap-setvbuf tst-atime tst-eof \
++	tst-freopen bug-ungetc bug-fseek \
+ 	tst-mmap-eofsync tst-mmap-fflushsync bug-mmap-fflush \
+-	tst-mmap2-eofsync tst-mmap-offend bug-fopena+ bug-wfflush \
+-	bug-ungetc2 bug-ftell bug-ungetc3 bug-ungetc4 tst-fopenloc2 \
++	tst-mmap2-eofsync tst-mmap-offend bug-fopena+ \
++	bug-ungetc2 bug-ungetc3 bug-ungetc4 \
+ 	tst-memstream1 tst-memstream2 \
+-	tst-wmemstream1 tst-wmemstream2 \
+-	bug-memstream1 bug-wmemstream1 \
+-	tst-setvbuf1 tst-popen1 tst-fgetwc bug-wsetpos tst-fseek \
+-	tst-fwrite-error tst-ftell-partial-wide tst-ftell-active-handler \
+-	tst-ftell-append tst-fputws
++	bug-memstream1 tst-popen1 tst-fwrite-error \
++	tst-ftell-active-handler tst-ftell-append
++tests-$(OPTION_EGLIBC_LOCALE_CODE) \
++	+= tst-swscanf tst-fgetws tst-setvbuf1 \
++	tst-ungetwc1 tst-ungetwc2 bug-ftell bug-ungetwc2 \
++	tst-widetext tst-fputws
++tests-$(OPTION_POSIX_WIDE_CHAR_DEVICE_IO) \
++	+= bug-rewind bug-rewind2 bug-ungetwc1 \
++	bug-wfflush bug-wmemstream1 tst-fopenloc2 \
++	tst_getwc \
++	tst_putwc tst_wprintf tst_wprintf2 tst_wscanf \
++	tst-fgetwc bug-wsetpos tst-fseek tst-ftell-partial-wide
++tests-$(OPTION_POSIX_C_LANG_WIDE_CHAR) \
++	+= tst_swprintf tst_swscanf \
++	tst-sscanf \
++	tst-wmemstream1 tst-wmemstream2
++
+ ifeq (yes,$(build-shared))
+ # Add test-fopenloc only if shared library is enabled since it depends on
+ # shared localedata objects.
+-tests += tst-fopenloc
++tests-$(OPTION_EGLIBC_LOCALE_CODE) += tst-fopenloc
+ endif
+ test-srcs = test-freopen
+ 
+@@ -164,13 +188,17 @@ shared-only-routines = oldiofopen oldiofdopen oldiofclose oldfileops	\
+ 		       oldiofsetpos64
+ 
+ ifeq ($(run-built-tests),yes)
++ifeq (y,$(OPTION_POSIX_WIDE_CHAR_DEVICE_IO))
+ tests-special += $(objpfx)test-freopen.out
++endif
++ifeq (y,$(OPTION_EGLIBC_LOCALE_CODE))
+ ifeq (yes,$(build-shared))
+ # Run tst-fopenloc-cmp.out and tst-openloc-mem.out only if shared
+ # library is enabled since they depend on tst-fopenloc.out.
+ tests-special += $(objpfx)tst-fopenloc-cmp.out $(objpfx)tst-fopenloc-mem.out
+ endif
+ endif
++endif
+ 
+ include ../Rules
+ 
+diff --git a/libio/__fpurge.c b/libio/__fpurge.c
+index 065cf61..e32a3e9 100644
+--- a/libio/__fpurge.c
++++ b/libio/__fpurge.c
+@@ -21,7 +21,7 @@
+ void
+ __fpurge (FILE *fp)
+ {
+-  if (fp->_mode > 0)
++  if (_IO_is_wide (fp))
+     {
+       /* Wide-char stream.  */
+       if (_IO_in_backup (fp))
+diff --git a/libio/fileops.c b/libio/fileops.c
+index cbcd6f5..19e43c2 100644
+--- a/libio/fileops.c
++++ b/libio/fileops.c
+@@ -39,6 +39,7 @@
  #include <string.h>
  #include <errno.h>
  #include <unistd.h>
@@ -1283,7 +1663,7 @@ Index: git/libio/fileops.c
  #include <stdlib.h>
  #if _LIBC
  # include "../wcsmbs/wcsmbsload.h"
-@@ -172,7 +173,7 @@ _IO_new_file_close_it (_IO_FILE *fp)
+@@ -173,7 +174,7 @@ _IO_new_file_close_it (_IO_FILE *fp)
  
    /* Free buffer. */
  #if defined _LIBC || defined _GLIBCPP_USE_WCHAR_T
@@ -1292,7 +1672,7 @@ Index: git/libio/fileops.c
      {
        if (_IO_have_wbackup (fp))
  	_IO_free_wbackup_area (fp);
-@@ -347,6 +348,7 @@ _IO_new_file_fopen (_IO_FILE *fp, const
+@@ -348,6 +349,7 @@ _IO_new_file_fopen (_IO_FILE *fp, const char *filename, const char *mode,
        cs = strstr (last_recognized + 1, ",ccs=");
        if (cs != NULL)
  	{
@@ -1300,7 +1680,7 @@ Index: git/libio/fileops.c
  	  /* Yep.  Load the appropriate conversions and set the orientation
  	     to wide.  */
  	  struct gconv_fcts fcts;
-@@ -406,6 +408,12 @@ _IO_new_file_fopen (_IO_FILE *fp, const
+@@ -418,6 +420,12 @@ _IO_new_file_fopen (_IO_FILE *fp, const char *filename, const char *mode,
  
  	  /* Set the mode now.  */
  	  result->_mode = 1;
@@ -1313,23 +1693,10 @@ Index: git/libio/fileops.c
  	}
      }
  
-Index: git/libio/__fpurge.c
-===================================================================
---- git.orig/libio/__fpurge.c
-+++ git/libio/__fpurge.c
-@@ -21,7 +21,7 @@
- void
- __fpurge (FILE *fp)
- {
--  if (fp->_mode > 0)
-+  if (_IO_is_wide (fp))
-     {
-       /* Wide-char stream.  */
-       if (_IO_in_backup (fp))
-Index: git/libio/iofwide.c
-===================================================================
---- git.orig/libio/iofwide.c
-+++ git/libio/iofwide.c
+diff --git a/libio/iofwide.c b/libio/iofwide.c
+index 0c175d1..3e9f52b 100644
+--- a/libio/iofwide.c
++++ b/libio/iofwide.c
 @@ -26,6 +26,7 @@
  
  #include <libioP.h>
@@ -1347,7 +1714,7 @@ Index: git/libio/iofwide.c
  /* Prototypes of libio's codecvt functions.  */
  static enum __codecvt_result do_out (struct _IO_codecvt *codecvt,
  				     __mbstate_t *statep,
-@@ -499,3 +502,26 @@ do_max_length (struct _IO_codecvt *codec
+@@ -499,3 +502,26 @@ do_max_length (struct _IO_codecvt *codecvt)
    return MB_CUR_MAX;
  #endif
  }
@@ -1374,11 +1741,11 @@ Index: git/libio/iofwide.c
 +}
 +
 +#endif
-Index: git/libio/ioseekoff.c
-===================================================================
---- git.orig/libio/ioseekoff.c
-+++ git/libio/ioseekoff.c
-@@ -60,7 +60,7 @@ _IO_seekoff_unlocked (fp, offset, dir, m
+diff --git a/libio/ioseekoff.c b/libio/ioseekoff.c
+index 11765cf..15d6230 100644
+--- a/libio/ioseekoff.c
++++ b/libio/ioseekoff.c
+@@ -60,7 +60,7 @@ _IO_seekoff_unlocked (fp, offset, dir, mode)
  	  else
  	    abort ();
  	}
@@ -1387,10 +1754,10 @@ Index: git/libio/ioseekoff.c
  	_IO_free_backup_area (fp);
        else
  	_IO_free_wbackup_area (fp);
-Index: git/libio/ioseekpos.c
-===================================================================
---- git.orig/libio/ioseekpos.c
-+++ git/libio/ioseekpos.c
+diff --git a/libio/ioseekpos.c b/libio/ioseekpos.c
+index a7652a1..6938b68 100644
+--- a/libio/ioseekpos.c
++++ b/libio/ioseekpos.c
 @@ -35,7 +35,7 @@ _IO_seekpos_unlocked (fp, pos, mode)
    /* If we have a backup buffer, get rid of it, since the __seekoff
       callback may not know to do the right thing about it.
@@ -1400,10 +1767,10 @@ Index: git/libio/ioseekpos.c
      {
        if (_IO_have_backup (fp))
  	_IO_free_backup_area (fp);
-Index: git/libio/iosetbuffer.c
-===================================================================
---- git.orig/libio/iosetbuffer.c
-+++ git/libio/iosetbuffer.c
+diff --git a/libio/iosetbuffer.c b/libio/iosetbuffer.c
+index 0a41c10..3d99fa0 100644
+--- a/libio/iosetbuffer.c
++++ b/libio/iosetbuffer.c
 @@ -24,6 +24,8 @@
     This exception applies to code released by its copyright holders
     in files containing the exception.  */
@@ -1425,11 +1792,11 @@ Index: git/libio/iosetbuffer.c
    _IO_release_lock (fp);
  }
  libc_hidden_def (_IO_setbuffer)
-Index: git/libio/libioP.h
-===================================================================
---- git.orig/libio/libioP.h
-+++ git/libio/libioP.h
-@@ -42,6 +42,10 @@
+diff --git a/libio/libioP.h b/libio/libioP.h
+index 0f16e2d..d2626d6 100644
+--- a/libio/libioP.h
++++ b/libio/libioP.h
+@@ -44,6 +44,10 @@
  /*# include <comthread.h>*/
  #endif
  
@@ -1440,7 +1807,7 @@ Index: git/libio/libioP.h
  #include <math_ldbl_opt.h>
  
  #include "iolibio.h"
-@@ -508,8 +512,20 @@ extern void _IO_old_init (_IO_FILE *fp,
+@@ -523,8 +527,20 @@ extern void _IO_old_init (_IO_FILE *fp, int flags) __THROW;
  
  
  #if defined _LIBC || defined _GLIBCPP_USE_WCHAR_T
@@ -1462,127 +1829,14 @@ Index: git/libio/libioP.h
     ? _IO_do_write(_f, (_f)->_IO_write_base,				      \
  		  (_f)->_IO_write_ptr-(_f)->_IO_write_base)		      \
     : _IO_wdo_write(_f, (_f)->_wide_data->_IO_write_base,		      \
-Index: git/libio/Makefile
-===================================================================
---- git.orig/libio/Makefile
-+++ git/libio/Makefile
-@@ -18,6 +18,8 @@
- #
- #	Specific makefile for libio.
- #
-+include ../option-groups.mak
-+
- subdir	:= libio
- 
- include ../Makeconfig
-@@ -27,16 +29,13 @@ headers	:= stdio.h libio.h _G_config.h b
- 
- routines	:=							      \
- 	filedoalloc iofclose iofdopen iofflush iofgetpos iofgets iofopen      \
--	iofopncook iofputs iofread iofsetpos ioftell wfiledoalloc	      \
-+	iofopncook iofputs iofread iofsetpos ioftell			      \
- 	iofwrite iogetdelim iogetline iogets iopadn iopopen ioputs	      \
- 	ioseekoff ioseekpos iosetbuffer iosetvbuf ioungetc		      \
- 	iovsprintf iovsscanf						      \
- 	iofgetpos64 iofopen64 iofsetpos64				      \
--	fputwc fputwc_u getwc getwc_u getwchar getwchar_u iofgetws iofgetws_u \
--	iofputws iofputws_u iogetwline iowpadn ioungetwc putwc putwc_u	      \
--	putwchar putwchar_u putchar putchar_u fwprintf swprintf vwprintf      \
--	wprintf wscanf fwscanf vwscanf vswprintf iovswscanf swscanf wgenops   \
--	wstrops wfileops iofwide fwide wmemstream			      \
-+	putchar putchar_u						      \
-+	iofwide								      \
- 									      \
- 	clearerr feof ferror fileno fputc freopen fseek getc getchar	      \
- 	memstream pclose putc putchar rewind setbuf setlinebuf vasprintf      \
-@@ -48,24 +47,49 @@ routines	:=							      \
- 									      \
- 	libc_fatal fmemopen
- 
--tests = tst_swprintf tst_wprintf tst_swscanf tst_wscanf tst_getwc tst_putwc   \
--	tst_wprintf2 tst-widetext test-fmemopen tst-ext tst-ext2 \
--	tst-fgetws tst-ungetwc1 tst-ungetwc2 tst-swscanf tst-sscanf	      \
--	tst-mmap-setvbuf bug-ungetwc1 bug-ungetwc2 tst-atime tst-eof          \
--	tst-freopen bug-rewind bug-rewind2 bug-ungetc bug-fseek \
-+routines-$(OPTION_POSIX_C_LANG_WIDE_CHAR) +=				      \
-+	wfiledoalloc                                                          \
-+	iowpadn                                                               \
-+	swprintf                                                              \
-+	vswprintf iovswscanf swscanf wgenops                                  \
-+	wstrops wfileops wmemstream
-+routines-$(call option-disabled, OPTION_POSIX_C_LANG_WIDE_CHAR) +=	      \
-+	wdummyfileops
-+routines-$(OPTION_POSIX_WIDE_CHAR_DEVICE_IO) +=				      \
-+	fputwc fputwc_u getwc getwc_u getwchar getwchar_u iofgetws iofgetws_u \
-+	iofputws iofputws_u iogetwline ioungetwc putwc putwc_u                \
-+	putwchar putwchar_u fwprintf vwprintf                                 \
-+	wprintf wscanf fwscanf vwscanf                                        \
-+	fwide
-+
-+tests = test-fmemopen tst-ext tst-ext2 \
-+	tst-mmap-setvbuf tst-atime tst-eof \
-+	tst-freopen bug-ungetc bug-fseek \
- 	tst-mmap-eofsync tst-mmap-fflushsync bug-mmap-fflush \
--	tst-mmap2-eofsync tst-mmap-offend bug-fopena+ bug-wfflush \
--	bug-ungetc2 bug-ftell bug-ungetc3 bug-ungetc4 tst-fopenloc2 \
-+	tst-mmap2-eofsync tst-mmap-offend bug-fopena+ \
-+	bug-ungetc2 bug-ungetc3 bug-ungetc4 \
- 	tst-memstream1 tst-memstream2 \
--	tst-wmemstream1 tst-wmemstream2 \
--	bug-memstream1 bug-wmemstream1 \
--	tst-setvbuf1 tst-popen1 tst-fgetwc bug-wsetpos tst-fseek \
--	tst-fwrite-error tst-ftell-partial-wide tst-ftell-active-handler \
--	tst-ftell-append tst-fputws
-+	bug-memstream1 tst-popen1 tst-fwrite-error \
-+	tst-ftell-active-handler tst-ftell-append
-+tests-$(OPTION_EGLIBC_LOCALE_CODE) \
-+	+= tst-swscanf tst-fgetws tst-setvbuf1 \
-+	tst-ungetwc1 tst-ungetwc2 bug-ftell bug-ungetwc2 \
-+	tst-widetext tst-fputws
-+tests-$(OPTION_POSIX_WIDE_CHAR_DEVICE_IO) \
-+	+= bug-rewind bug-rewind2 bug-ungetwc1 \
-+	bug-wfflush bug-wmemstream1 tst-fopenloc2 \
-+	tst_getwc \
-+	tst_putwc tst_wprintf tst_wprintf2 tst_wscanf \
-+	tst-fgetwc bug-wsetpos tst-fseek tst-ftell-partial-wide
-+tests-$(OPTION_POSIX_C_LANG_WIDE_CHAR) \
-+	+= tst_swprintf tst_swscanf \
-+	tst-sscanf \
-+	tst-wmemstream1 tst-wmemstream2
-+
- ifeq (yes,$(build-shared))
- # Add test-fopenloc only if shared library is enabled since it depends on
- # shared localedata objects.
--tests += tst-fopenloc
-+tests-$(OPTION_EGLIBC_LOCALE_CODE) += tst-fopenloc
- endif
- test-srcs = test-freopen
- 
-@@ -164,13 +188,17 @@ shared-only-routines = oldiofopen oldiof
- 		       oldiofsetpos64
- 
- ifeq ($(run-built-tests),yes)
-+ifeq (y,$(OPTION_POSIX_WIDE_CHAR_DEVICE_IO))
- tests-special += $(objpfx)test-freopen.out
-+endif
-+ifeq (y,$(OPTION_EGLIBC_LOCALE_CODE))
- ifeq (yes,$(build-shared))
- # Run tst-fopenloc-cmp.out and tst-openloc-mem.out only if shared
- # library is enabled since they depend on tst-fopenloc.out.
- tests-special += $(objpfx)tst-fopenloc-cmp.out $(objpfx)tst-fopenloc-mem.out
- endif
- endif
-+endif
- 
- include ../Rules
- 
-Index: git/libio/wdummyfileops.c
-===================================================================
---- /dev/null
-+++ git/libio/wdummyfileops.c
-@@ -0,0 +1,161 @@
-+/* Copyright (C) 2007 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
+diff --git a/libio/wdummyfileops.c b/libio/wdummyfileops.c
+new file mode 100644
+index 0000000..c0150b8
+--- /dev/null
++++ b/libio/wdummyfileops.c
+@@ -0,0 +1,161 @@
++/* Copyright (C) 2007 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
 +
 +   The GNU C Library is free software; you can redistribute it and/or
 +   modify it under the terms of the GNU Lesser General Public
@@ -1742,63 +1996,10 @@ Index: git/libio/wdummyfileops.c
 +libc_hidden_data_def (_IO_wfile_jumps)
 +strong_alias (_IO_wfile_jumps_disabled, _IO_wfile_jumps_mmap)
 +strong_alias (_IO_wfile_jumps_disabled, _IO_wfile_jumps_maybe_mmap)
-Index: git/locale/catnames.c
-===================================================================
---- /dev/null
-+++ git/locale/catnames.c
-@@ -0,0 +1,48 @@
-+/* Copyright (C) 2006  Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, write to the Free
-+   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
-+   02111-1307 USA.  */
-+
-+#include "localeinfo.h"
-+
-+/* Define an array of category names (also the environment variable names).  */
-+const union catnamestr_t _nl_category_names attribute_hidden =
-+  {
-+    {
-+#define DEFINE_CATEGORY(category, category_name, items, a) \
-+      category_name,
-+#include "categories.def"
-+#undef DEFINE_CATEGORY
-+    }
-+  };
-+
-+const uint8_t _nl_category_name_idxs[__LC_LAST] attribute_hidden =
-+  {
-+#define DEFINE_CATEGORY(category, category_name, items, a) \
-+    [category] = offsetof (union catnamestr_t, CATNAMEMF (__LINE__)),
-+#include "categories.def"
-+#undef DEFINE_CATEGORY
-+  };
-+
-+/* An array of their lengths, for convenience.  */
-+const uint8_t _nl_category_name_sizes[] attribute_hidden =
-+  {
-+#define DEFINE_CATEGORY(category, category_name, items, a) \
-+    [category] = sizeof (category_name) - 1,
-+#include "categories.def"
-+#undef	DEFINE_CATEGORY
-+    [LC_ALL] = sizeof ("LC_ALL") - 1
-+  };
-Index: git/locale/C-ctype.c
-===================================================================
---- git.orig/locale/C-ctype.c
-+++ git/locale/C-ctype.c
+diff --git a/locale/C-ctype.c b/locale/C-ctype.c
+index aa5f19f..06be081 100644
+--- a/locale/C-ctype.c
++++ b/locale/C-ctype.c
 @@ -19,8 +19,11 @@
  #include "localeinfo.h"
  #include <endian.h>
@@ -1811,7 +2012,7 @@ Index: git/locale/C-ctype.c
  
  /* This table's entries are taken from POSIX.2 Table 2-6
     ``LC_CTYPE Category Definition in the POSIX Locale''.
-@@ -647,6 +650,7 @@ const struct __locale_data _nl_C_LC_CTYP
+@@ -634,6 +637,7 @@ const struct __locale_data _nl_C_LC_CTYPE attribute_hidden =
      { .word = L'7' },
      { .word = L'8' },
      { .word = L'9' },
@@ -1819,7 +2020,7 @@ Index: git/locale/C-ctype.c
      /* _NL_CTYPE_TRANSLIT_TAB_SIZE */
      { .word = NTRANSLIT },
      /* _NL_CTYPE_TRANSLIT_FROM_IDX */
-@@ -657,6 +661,22 @@ const struct __locale_data _nl_C_LC_CTYP
+@@ -644,6 +648,22 @@ const struct __locale_data _nl_C_LC_CTYPE attribute_hidden =
      { .wstr = translit_to_idx },
      /* _NL_CTYPE_TRANSLIT_TO_TBL */
      { .wstr = (uint32_t *) translit_to_tbl },
@@ -1842,61 +2043,10 @@ Index: git/locale/C-ctype.c
      /* _NL_CTYPE_TRANSLIT_DEFAULT_MISSING_LEN */
      { .word = 1 },
      /* _NL_CTYPE_TRANSLIT_DEFAULT_MISSING */
-Index: git/locale/dummy-setlocale.c
-===================================================================
---- /dev/null
-+++ git/locale/dummy-setlocale.c
-@@ -0,0 +1,33 @@
-+/* Copyright (C) 2006  Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, write to the Free
-+   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
-+   02111-1307 USA.  */
-+
-+#include <string.h>
-+#include <locale.h>
-+
-+char *
-+setlocale (int category, const char *locale)
-+{
-+  if (! locale
-+      || locale[0] == '\0'
-+      || strcmp (locale, "C") == 0
-+      || strcmp (locale, "POSIX") == 0)
-+    return (char *) "C";
-+  else
-+    return NULL;
-+}
-+libc_hidden_def (setlocale)
-Index: git/locale/localeinfo.h
-===================================================================
---- git.orig/locale/localeinfo.h
-+++ git/locale/localeinfo.h
-@@ -224,7 +224,7 @@ __libc_tsd_define (extern, __locale_t, L
-    unused.  We can manage this playing some tricks with weak references.
-    But with thread-local locale settings, it becomes quite ungainly unless
-    we can use __thread variables.  So only in that case do we attempt this.  */
--#ifndef SHARED
-+#if !defined SHARED && !defined IN_GLIBC_LOCALEDEF
- # include <tls.h>
- # define NL_CURRENT_INDIRECT	1
- #endif
-Index: git/locale/Makefile
-===================================================================
---- git.orig/locale/Makefile
-+++ git/locale/Makefile
+diff --git a/locale/Makefile b/locale/Makefile
+index f1b4343..599a1a9 100644
+--- a/locale/Makefile
++++ b/locale/Makefile
 @@ -18,27 +18,43 @@
  #
  #	Makefile for locales.
@@ -1952,7 +2102,7 @@ Index: git/locale/Makefile
  
  libBrokenLocale-routines = broken_cur_max
  
-@@ -93,6 +109,9 @@ CPPFLAGS-locale-programs = -DLOCALE_PATH
+@@ -93,6 +109,9 @@ CPPFLAGS-locale-programs = -DLOCALE_PATH='$(localepath)' \
  CFLAGS-charmap.c = -Wno-write-strings -Wno-char-subscripts
  CFLAGS-locfile.c = -Wno-write-strings -Wno-char-subscripts
  CFLAGS-charmap-dir.c = -Wno-write-strings
@@ -1962,124 +2112,230 @@ Index: git/locale/Makefile
  
  # Set libof-* for each routine.
  cpp-srcs-left := $(localedef-modules) $(localedef-aux) $(locale-modules) \
-Index: git/locale/programs/charmap-dir.c
-===================================================================
---- git.orig/locale/programs/charmap-dir.c
-+++ git/locale/programs/charmap-dir.c
-@@ -19,7 +19,9 @@
- #include <error.h>
- #include <fcntl.h>
- #include <libintl.h>
-+#ifndef NO_UNCOMPRESS
- #include <spawn.h>
-+#endif
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
-@@ -156,6 +158,7 @@ charmap_closedir (CHARMAP_DIR *cdir)
-   return closedir (dir);
- }
- 
-+#ifndef NO_UNCOMPRESS
- /* Creates a subprocess decompressing the given pathname, and returns
-    a stream reading its output (the decompressed data).  */
- static
-@@ -204,6 +207,7 @@ fopen_uncompressed (const char *pathname
-     }
-   return NULL;
- }
-+#endif
- 
- /* Opens a charmap for reading, given its name (not an alias name).  */
- FILE *
-@@ -226,6 +230,7 @@ charmap_open (const char *directory, con
-   if (stream != NULL)
-     return stream;
- 
-+#ifndef NO_UNCOMPRESS
-   memcpy (p, ".gz", 4);
-   stream = fopen_uncompressed (pathname, "gzip");
-   if (stream != NULL)
-@@ -235,6 +240,7 @@ charmap_open (const char *directory, con
-   stream = fopen_uncompressed (pathname, "bzip2");
-   if (stream != NULL)
-     return stream;
-+#endif
- 
-   return NULL;
- }
-Index: git/locale/programs/ld-collate.c
-===================================================================
---- git.orig/locale/programs/ld-collate.c
-+++ git/locale/programs/ld-collate.c
-@@ -350,7 +350,7 @@ new_element (struct locale_collate_t *co
-     }
-   if (wcs != NULL)
-     {
--      size_t nwcs = wcslen ((wchar_t *) wcs);
-+      size_t nwcs = wcslen_uint32 (wcs);
-       uint32_t zero = 0;
-       /* Handle <U0000> as a single character.  */
-       if (nwcs == 0)
-@@ -1776,8 +1776,7 @@ symbol `%s' has the same encoding as"),
- 
- 	      if ((*eptr)->nwcs == runp->nwcs)
- 		{
--		  int c = wmemcmp ((wchar_t *) (*eptr)->wcs,
--				   (wchar_t *) runp->wcs, runp->nwcs);
-+		  int c = wmemcmp_uint32 ((*eptr)->wcs, runp->wcs, runp->nwcs);
- 
- 		  if (c == 0)
- 		    {
-@@ -2010,9 +2009,9 @@ add_to_tablewc (uint32_t ch, struct elem
- 	     one consecutive entry.  */
- 	  if (runp->wcnext != NULL
- 	      && runp->nwcs == runp->wcnext->nwcs
--	      && wmemcmp ((wchar_t *) runp->wcs,
--			  (wchar_t *)runp->wcnext->wcs,
--			  runp->nwcs - 1) == 0
-+	      && wmemcmp_uint32 (runp->wcs,
-+				 runp->wcnext->wcs,
-+				 runp->nwcs - 1) == 0
- 	      && (runp->wcs[runp->nwcs - 1]
- 		  == runp->wcnext->wcs[runp->nwcs - 1] + 1))
- 	    {
-@@ -2036,9 +2035,9 @@ add_to_tablewc (uint32_t ch, struct elem
- 		runp = runp->wcnext;
- 	      while (runp->wcnext != NULL
- 		     && runp->nwcs == runp->wcnext->nwcs
--		     && wmemcmp ((wchar_t *) runp->wcs,
--				 (wchar_t *)runp->wcnext->wcs,
--				 runp->nwcs - 1) == 0
-+		     && wmemcmp_uint32 (runp->wcs,
-+					runp->wcnext->wcs,
-+					runp->nwcs - 1) == 0
- 		     && (runp->wcs[runp->nwcs - 1]
- 			 == runp->wcnext->wcs[runp->nwcs - 1] + 1));
- 
-Index: git/locale/programs/ld-ctype.c
-===================================================================
---- git.orig/locale/programs/ld-ctype.c
-+++ git/locale/programs/ld-ctype.c
-@@ -960,7 +960,7 @@ ctype_output (struct localedef_t *locale
-   allocate_arrays (ctype, charmap, ctype->repertoire);
- 
-   default_missing_len = (ctype->default_missing
--			 ? wcslen ((wchar_t *) ctype->default_missing)
-+			 ? wcslen_uint32 (ctype->default_missing)
- 			 : 0);
- 
-   init_locale_data (&file, nelems);
-@@ -1971,7 +1971,7 @@ read_translit_entry (struct linereader *
- 	    ignore = 1;
- 	  else
- 	    /* This value is usable.  */
--	    obstack_grow (ob, to_wstr, wcslen ((wchar_t *) to_wstr) * 4);
+diff --git a/locale/catnames.c b/locale/catnames.c
+new file mode 100644
+index 0000000..9fad357
+--- /dev/null
++++ b/locale/catnames.c
+@@ -0,0 +1,48 @@
++/* Copyright (C) 2006  Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, write to the Free
++   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
++   02111-1307 USA.  */
++
++#include "localeinfo.h"
++
++/* Define an array of category names (also the environment variable names).  */
++const union catnamestr_t _nl_category_names attribute_hidden =
++  {
++    {
++#define DEFINE_CATEGORY(category, category_name, items, a) \
++      category_name,
++#include "categories.def"
++#undef DEFINE_CATEGORY
++    }
++  };
++
++const uint8_t _nl_category_name_idxs[__LC_LAST] attribute_hidden =
++  {
++#define DEFINE_CATEGORY(category, category_name, items, a) \
++    [category] = offsetof (union catnamestr_t, CATNAMEMF (__LINE__)),
++#include "categories.def"
++#undef DEFINE_CATEGORY
++  };
++
++/* An array of their lengths, for convenience.  */
++const uint8_t _nl_category_name_sizes[] attribute_hidden =
++  {
++#define DEFINE_CATEGORY(category, category_name, items, a) \
++    [category] = sizeof (category_name) - 1,
++#include "categories.def"
++#undef	DEFINE_CATEGORY
++    [LC_ALL] = sizeof ("LC_ALL") - 1
++  };
+diff --git a/locale/dummy-setlocale.c b/locale/dummy-setlocale.c
+new file mode 100644
+index 0000000..219964a
+--- /dev/null
++++ b/locale/dummy-setlocale.c
+@@ -0,0 +1,33 @@
++/* Copyright (C) 2006  Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, write to the Free
++   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
++   02111-1307 USA.  */
++
++#include <string.h>
++#include <locale.h>
++
++char *
++setlocale (int category, const char *locale)
++{
++  if (! locale
++      || locale[0] == '\0'
++      || strcmp (locale, "C") == 0
++      || strcmp (locale, "POSIX") == 0)
++    return (char *) "C";
++  else
++    return NULL;
++}
++libc_hidden_def (setlocale)
+diff --git a/locale/localeinfo.h b/locale/localeinfo.h
+index bdab9fe..a7516c0 100644
+--- a/locale/localeinfo.h
++++ b/locale/localeinfo.h
+@@ -232,7 +232,7 @@ __libc_tsd_define (extern, __locale_t, LOCALE)
+    unused.  We can manage this playing some tricks with weak references.
+    But with thread-local locale settings, it becomes quite ungainly unless
+    we can use __thread variables.  So only in that case do we attempt this.  */
+-#ifndef SHARED
++#if !defined SHARED && !defined IN_GLIBC_LOCALEDEF
+ # include <tls.h>
+ # define NL_CURRENT_INDIRECT	1
+ #endif
+diff --git a/locale/programs/charmap-dir.c b/locale/programs/charmap-dir.c
+index cf7adea..ef3b811 100644
+--- a/locale/programs/charmap-dir.c
++++ b/locale/programs/charmap-dir.c
+@@ -19,7 +19,9 @@
+ #include <error.h>
+ #include <fcntl.h>
+ #include <libintl.h>
++#ifndef NO_UNCOMPRESS
+ #include <spawn.h>
++#endif
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+@@ -156,6 +158,7 @@ charmap_closedir (CHARMAP_DIR *cdir)
+   return closedir (dir);
+ }
+ 
++#ifndef NO_UNCOMPRESS
+ /* Creates a subprocess decompressing the given pathname, and returns
+    a stream reading its output (the decompressed data).  */
+ static
+@@ -204,6 +207,7 @@ fopen_uncompressed (const char *pathname, const char *compressor)
+     }
+   return NULL;
+ }
++#endif
+ 
+ /* Opens a charmap for reading, given its name (not an alias name).  */
+ FILE *
+@@ -226,6 +230,7 @@ charmap_open (const char *directory, const char *name)
+   if (stream != NULL)
+     return stream;
+ 
++#ifndef NO_UNCOMPRESS
+   memcpy (p, ".gz", 4);
+   stream = fopen_uncompressed (pathname, "gzip");
+   if (stream != NULL)
+@@ -235,6 +240,7 @@ charmap_open (const char *directory, const char *name)
+   stream = fopen_uncompressed (pathname, "bzip2");
+   if (stream != NULL)
+     return stream;
++#endif
+ 
+   return NULL;
+ }
+diff --git a/locale/programs/ld-collate.c b/locale/programs/ld-collate.c
+index a39a94f..16e9039 100644
+--- a/locale/programs/ld-collate.c
++++ b/locale/programs/ld-collate.c
+@@ -351,7 +351,7 @@ new_element (struct locale_collate_t *collate, const char *mbs, size_t mbslen,
+     }
+   if (wcs != NULL)
+     {
+-      size_t nwcs = wcslen ((wchar_t *) wcs);
++      size_t nwcs = wcslen_uint32 (wcs);
+       uint32_t zero = 0;
+       /* Handle <U0000> as a single character.  */
+       if (nwcs == 0)
+@@ -1777,8 +1777,7 @@ symbol `%s' has the same encoding as"), (*eptr)->name);
+ 
+ 	      if ((*eptr)->nwcs == runp->nwcs)
+ 		{
+-		  int c = wmemcmp ((wchar_t *) (*eptr)->wcs,
+-				   (wchar_t *) runp->wcs, runp->nwcs);
++		  int c = wmemcmp_uint32 ((*eptr)->wcs, runp->wcs, runp->nwcs);
+ 
+ 		  if (c == 0)
+ 		    {
+@@ -2011,9 +2010,9 @@ add_to_tablewc (uint32_t ch, struct element_t *runp)
+ 	     one consecutive entry.  */
+ 	  if (runp->wcnext != NULL
+ 	      && runp->nwcs == runp->wcnext->nwcs
+-	      && wmemcmp ((wchar_t *) runp->wcs,
+-			  (wchar_t *)runp->wcnext->wcs,
+-			  runp->nwcs - 1) == 0
++	      && wmemcmp_uint32 (runp->wcs,
++				 runp->wcnext->wcs,
++				 runp->nwcs - 1) == 0
+ 	      && (runp->wcs[runp->nwcs - 1]
+ 		  == runp->wcnext->wcs[runp->nwcs - 1] + 1))
+ 	    {
+@@ -2037,9 +2036,9 @@ add_to_tablewc (uint32_t ch, struct element_t *runp)
+ 		runp = runp->wcnext;
+ 	      while (runp->wcnext != NULL
+ 		     && runp->nwcs == runp->wcnext->nwcs
+-		     && wmemcmp ((wchar_t *) runp->wcs,
+-				 (wchar_t *)runp->wcnext->wcs,
+-				 runp->nwcs - 1) == 0
++		     && wmemcmp_uint32 (runp->wcs,
++					runp->wcnext->wcs,
++					runp->nwcs - 1) == 0
+ 		     && (runp->wcs[runp->nwcs - 1]
+ 			 == runp->wcnext->wcs[runp->nwcs - 1] + 1));
+ 
+diff --git a/locale/programs/ld-ctype.c b/locale/programs/ld-ctype.c
+index 3f464ef..b7b6b51 100644
+--- a/locale/programs/ld-ctype.c
++++ b/locale/programs/ld-ctype.c
+@@ -926,7 +926,7 @@ ctype_output (struct localedef_t *locale, const struct charmap_t *charmap,
+   allocate_arrays (ctype, charmap, ctype->repertoire);
+ 
+   default_missing_len = (ctype->default_missing
+-			 ? wcslen ((wchar_t *) ctype->default_missing)
++			 ? wcslen_uint32 (ctype->default_missing)
+ 			 : 0);
+ 
+   init_locale_data (&file, nelems);
+@@ -1937,7 +1937,7 @@ read_translit_entry (struct linereader *ldfile, struct locale_ctype_t *ctype,
+ 	    ignore = 1;
+ 	  else
+ 	    /* This value is usable.  */
+-	    obstack_grow (ob, to_wstr, wcslen ((wchar_t *) to_wstr) * 4);
 +	    obstack_grow (ob, to_wstr, wcslen_uint32 (to_wstr) * 4);
  
  	  first = 0;
  	}
-@@ -2519,8 +2519,8 @@ with character code range values one mus
+@@ -2471,8 +2471,8 @@ with character code range values one must use the absolute ellipsis `...'"));
  	    }
  
  	handle_tok_digit:
@@ -2090,7 +2346,7 @@ Index: git/locale/programs/ld-ctype.c
  	  handle_digits = 1;
  	  goto read_charclass;
  
-@@ -4002,8 +4002,7 @@ allocate_arrays (struct locale_ctype_t *
+@@ -3929,8 +3929,7 @@ allocate_arrays (struct locale_ctype_t *ctype, const struct charmap_t *charmap,
  
  	  while (idx < number)
  	    {
@@ -2100,7 +2356,7 @@ Index: git/locale/programs/ld-ctype.c
  	      if (res == 0)
  		{
  		  replace = 1;
-@@ -4040,11 +4039,11 @@ allocate_arrays (struct locale_ctype_t *
+@@ -3967,11 +3966,11 @@ allocate_arrays (struct locale_ctype_t *ctype, const struct charmap_t *charmap,
        for (size_t cnt = 0; cnt < number; ++cnt)
  	{
  	  struct translit_to_t *srunp;
@@ -2114,7 +2370,7 @@ Index: git/locale/programs/ld-ctype.c
  	      srunp = srunp->next;
  	    }
  	  /* Plus one for the extra NUL character marking the end of
-@@ -4068,18 +4067,18 @@ allocate_arrays (struct locale_ctype_t *
+@@ -3995,18 +3994,18 @@ allocate_arrays (struct locale_ctype_t *ctype, const struct charmap_t *charmap,
  	  ctype->translit_from_idx[cnt] = from_len;
  	  ctype->translit_to_idx[cnt] = to_len;
  
@@ -2139,10 +2395,10 @@ Index: git/locale/programs/ld-ctype.c
  	      to_len += len;
  	      srunp = srunp->next;
  	    }
-Index: git/locale/programs/ld-messages.c
-===================================================================
---- git.orig/locale/programs/ld-messages.c
-+++ git/locale/programs/ld-messages.c
+diff --git a/locale/programs/ld-messages.c b/locale/programs/ld-messages.c
+index ec1a80b..736eed8 100644
+--- a/locale/programs/ld-messages.c
++++ b/locale/programs/ld-messages.c
 @@ -25,6 +25,7 @@
  #include <string.h>
  #include <stdint.h>
@@ -2151,7 +2407,7 @@ Index: git/locale/programs/ld-messages.c
  
  #include <assert.h>
  
-@@ -124,6 +125,7 @@ No definition for %s category found"), "
+@@ -124,6 +125,7 @@ No definition for %s category found"), "LC_MESSAGES"));
      }
    else
      {
@@ -2159,7 +2415,7 @@ Index: git/locale/programs/ld-messages.c
        int result;
        regex_t re;
  
-@@ -140,6 +142,7 @@ No definition for %s category found"), "
+@@ -140,6 +142,7 @@ No definition for %s category found"), "LC_MESSAGES"));
  	}
        else if (result != 0)
  	regfree (&re);
@@ -2167,7 +2423,7 @@ Index: git/locale/programs/ld-messages.c
      }
  
    if (messages->noexpr == NULL)
-@@ -158,6 +161,7 @@ No definition for %s category found"), "
+@@ -158,6 +161,7 @@ No definition for %s category found"), "LC_MESSAGES"));
      }
    else
      {
@@ -2175,7 +2431,7 @@ Index: git/locale/programs/ld-messages.c
        int result;
        regex_t re;
  
-@@ -174,6 +178,7 @@ No definition for %s category found"), "
+@@ -174,6 +178,7 @@ No definition for %s category found"), "LC_MESSAGES"));
  	}
        else if (result != 0)
  	regfree (&re);
@@ -2183,11 +2439,11 @@ Index: git/locale/programs/ld-messages.c
      }
  }
  
-Index: git/locale/programs/ld-time.c
-===================================================================
---- git.orig/locale/programs/ld-time.c
-+++ git/locale/programs/ld-time.c
-@@ -215,8 +215,10 @@ No definition for %s category found"), "
+diff --git a/locale/programs/ld-time.c b/locale/programs/ld-time.c
+index db490c6..75dc505 100644
+--- a/locale/programs/ld-time.c
++++ b/locale/programs/ld-time.c
+@@ -215,8 +215,10 @@ No definition for %s category found"), "LC_TIME"));
  	}
        else
  	{
@@ -2199,7 +2455,7 @@ Index: git/locale/programs/ld-time.c
  	}
      }
  
-@@ -226,7 +228,7 @@ No definition for %s category found"), "
+@@ -226,7 +228,7 @@ No definition for %s category found"), "LC_TIME"));
        const int days_per_month[12] = { 31, 29, 31, 30, 31, 30,
  				       31, 31, 30, 31 ,30, 31 };
        size_t idx;
@@ -2208,7 +2464,7 @@ Index: git/locale/programs/ld-time.c
  
        time->era_entries =
  	(struct era_data *) xmalloc (time->num_era
-@@ -464,18 +466,18 @@ No definition for %s category found"), "
+@@ -464,18 +466,18 @@ No definition for %s category found"), "LC_TIME"));
  	    }
  
  	  /* Now generate the wide character name and format.  */
@@ -2234,7 +2490,7 @@ Index: git/locale/programs/ld-time.c
  		}
  	      else
  		time->era_entries[idx].wname =
-@@ -530,7 +532,16 @@ No definition for %s category found"), "
+@@ -530,7 +532,16 @@ No definition for %s category found"), "LC_TIME"));
    if (time->date_fmt == NULL)
      time->date_fmt = "%a %b %e %H:%M:%S %Z %Y";
    if (time->wdate_fmt == NULL)
@@ -2252,11 +2508,11 @@ Index: git/locale/programs/ld-time.c
  }
  
  
-Index: git/locale/programs/linereader.c
-===================================================================
---- git.orig/locale/programs/linereader.c
-+++ git/locale/programs/linereader.c
-@@ -595,7 +595,7 @@ get_string (struct linereader *lr, const
+diff --git a/locale/programs/linereader.c b/locale/programs/linereader.c
+index 2e05130..653b68c 100644
+--- a/locale/programs/linereader.c
++++ b/locale/programs/linereader.c
+@@ -595,7 +595,7 @@ get_string (struct linereader *lr, const struct charmap_t *charmap,
  {
    int return_widestr = lr->return_widestr;
    char *buf;
@@ -2265,11 +2521,11 @@ Index: git/locale/programs/linereader.c
    size_t bufact;
    size_t bufmax = 56;
  
-Index: git/locale/programs/localedef.c
-===================================================================
---- git.orig/locale/programs/localedef.c
-+++ git/locale/programs/localedef.c
-@@ -114,6 +114,7 @@ void (*argp_program_version_hook) (FILE
+diff --git a/locale/programs/localedef.c b/locale/programs/localedef.c
+index 2a0f2aa..583d233 100644
+--- a/locale/programs/localedef.c
++++ b/locale/programs/localedef.c
+@@ -114,6 +114,7 @@ void (*argp_program_version_hook) (FILE *, struct argp_state *) = print_version;
  #define OPT_LIST_ARCHIVE 309
  #define OPT_LITTLE_ENDIAN 400
  #define OPT_BIG_ENDIAN 401
@@ -2277,7 +2533,7 @@ Index: git/locale/programs/localedef.c
  
  /* Definitions of arguments for argp functions.  */
  static const struct argp_option options[] =
-@@ -150,6 +151,8 @@ static const struct argp_option options[
+@@ -150,6 +151,8 @@ static const struct argp_option options[] =
      N_("Generate little-endian output") },
    { "big-endian", OPT_BIG_ENDIAN, NULL, 0,
      N_("Generate big-endian output") },
@@ -2301,7 +2557,7 @@ Index: git/locale/programs/localedef.c
  
    /* Process charmap file.  */
    charmap = charmap_read (charmap_file, verbose, 1, be_quiet, 1);
-@@ -338,6 +343,9 @@ parse_opt (int key, char *arg, struct ar
+@@ -338,6 +343,9 @@ parse_opt (int key, char *arg, struct argp_state *state)
      case OPT_BIG_ENDIAN:
        set_big_endian (true);
        break;
@@ -2311,11 +2567,11 @@ Index: git/locale/programs/localedef.c
      case 'c':
        force_output = 1;
        break;
-Index: git/locale/programs/locfile.c
-===================================================================
---- git.orig/locale/programs/locfile.c
-+++ git/locale/programs/locfile.c
-@@ -544,6 +544,9 @@ compare_files (const char *filename1, co
+diff --git a/locale/programs/locfile.c b/locale/programs/locfile.c
+index 33da52e..f790c4c 100644
+--- a/locale/programs/locfile.c
++++ b/locale/programs/locfile.c
+@@ -544,6 +544,9 @@ compare_files (const char *filename1, const char *filename2, size_t size,
     machine running localedef.  */
  bool swap_endianness_p;
  
@@ -2325,7 +2581,7 @@ Index: git/locale/programs/locfile.c
  /* When called outside a start_locale_structure/end_locale_structure
     or start_locale_prelude/end_locale_prelude block, record that the
     next byte in FILE's obstack will be the first byte of a new element.
-@@ -621,7 +624,7 @@ add_locale_string (struct locale_file *f
+@@ -621,7 +624,7 @@ add_locale_string (struct locale_file *file, const char *string)
  void
  add_locale_wstring (struct locale_file *file, const uint32_t *string)
  {
@@ -2334,11 +2590,11 @@ Index: git/locale/programs/locfile.c
  }
  
  /* Record that FILE's next element is the 32-bit integer VALUE.  */
-Index: git/locale/programs/locfile.h
-===================================================================
---- git.orig/locale/programs/locfile.h
-+++ git/locale/programs/locfile.h
-@@ -71,6 +71,8 @@ extern void write_all_categories (struct
+diff --git a/locale/programs/locfile.h b/locale/programs/locfile.h
+index 6fc441b..118b171 100644
+--- a/locale/programs/locfile.h
++++ b/locale/programs/locfile.h
+@@ -71,6 +71,8 @@ extern void write_all_categories (struct localedef_t *definitions,
  
  extern bool swap_endianness_p;
  
@@ -2357,7 +2613,7 @@ Index: git/locale/programs/locfile.h
  maybe_swap_uint32_array (uint32_t *array, size_t n)
  {
    if (swap_endianness_p)
-@@ -99,7 +102,8 @@ maybe_swap_uint32_array (uint32_t *array
+@@ -99,7 +102,8 @@ maybe_swap_uint32_array (uint32_t *array, size_t n)
  
  /* Like maybe_swap_uint32_array, but the array of N elements is at
     the end of OBSTACK's current object.  */
@@ -2367,7 +2623,7 @@ Index: git/locale/programs/locfile.h
  maybe_swap_uint32_obstack (struct obstack *obstack, size_t n)
  {
    maybe_swap_uint32_array ((uint32_t *) obstack_next_free (obstack) - n, n);
-@@ -276,4 +280,55 @@ extern void identification_output (struc
+@@ -276,4 +280,55 @@ extern void identification_output (struct localedef_t *locale,
  				   const struct charmap_t *charmap,
  				   const char *output_path);
  
@@ -2423,10 +2679,10 @@ Index: git/locale/programs/locfile.h
 +}
 +
  #endif /* locfile.h */
-Index: git/locale/setlocale.c
-===================================================================
---- git.orig/locale/setlocale.c
-+++ git/locale/setlocale.c
+diff --git a/locale/setlocale.c b/locale/setlocale.c
+index fa9cb3a..8eee284 100644
+--- a/locale/setlocale.c
++++ b/locale/setlocale.c
 @@ -64,36 +64,6 @@ static char *const _nl_current_used[] =
  #endif
  
@@ -2464,10 +2720,10 @@ Index: git/locale/setlocale.c
  #ifdef NL_CURRENT_INDIRECT
  # define WEAK_POSTLOAD(postload) weak_extern (postload)
  #else
-Index: git/locale/xlocale.c
-===================================================================
---- git.orig/locale/xlocale.c
-+++ git/locale/xlocale.c
+diff --git a/locale/xlocale.c b/locale/xlocale.c
+index fec4564..f00269c 100644
+--- a/locale/xlocale.c
++++ b/locale/xlocale.c
 @@ -18,6 +18,7 @@
     <http://www.gnu.org/licenses/>.  */
  
@@ -2476,7 +2732,7 @@ Index: git/locale/xlocale.c
  #include "localeinfo.h"
  
  #define DEFINE_CATEGORY(category, category_name, items, a) \
-@@ -25,6 +26,19 @@ extern struct __locale_data _nl_C_##cate
+@@ -25,6 +26,19 @@ extern struct __locale_data _nl_C_##category;
  #include "categories.def"
  #undef	DEFINE_CATEGORY
  
@@ -2496,7 +2752,7 @@ Index: git/locale/xlocale.c
  /* Defined in locale/C-ctype.c.  */
  extern const char _nl_C_LC_CTYPE_class[] attribute_hidden;
  extern const char _nl_C_LC_CTYPE_toupper[] attribute_hidden;
-@@ -52,3 +66,26 @@ const struct __locale_struct _nl_C_locob
+@@ -52,3 +66,26 @@ const struct __locale_struct _nl_C_locobj attribute_hidden =
      .__ctype_tolower = (const int *) _nl_C_LC_CTYPE_tolower + 128,
      .__ctype_toupper = (const int *) _nl_C_LC_CTYPE_toupper + 128
    };
@@ -2523,10 +2779,10 @@ Index: git/locale/xlocale.c
 +#undef DEFINE_CATEGORY
 +#endif
 +#endif /* __OPTION_EGLIBC_LOCALE_CODE */
-Index: git/localedata/Makefile
-===================================================================
---- git.orig/localedata/Makefile
-+++ git/localedata/Makefile
+diff --git a/localedata/Makefile b/localedata/Makefile
+index ebf6ac9..1870753 100644
+--- a/localedata/Makefile
++++ b/localedata/Makefile
 @@ -21,12 +21,22 @@ subdir := localedata
  
  include ../Makeconfig
@@ -2537,10 +2793,11 @@ Index: git/localedata/Makefile
  
  # List with all available character set descriptions.
 -locales := $(wildcard locales/*)
+-
 +all-charmaps := $(wildcard charmaps/[A-I]*) $(wildcard charmaps/[J-Z]*)
 +
 +all-locales := $(wildcard locales/*)
- 
++
 +# If the EGLIBC_LOCALES option group is not enabled, trim the
 +# list of charmap and locale source files.
 +ifeq ($(OPTION_EGLIBC_LOCALES),y)
@@ -2553,7 +2810,7 @@ Index: git/localedata/Makefile
  
  subdir-dirs = tests-mbwc
  vpath %.c tests-mbwc
-@@ -71,14 +81,20 @@ locale_test_suite := tst_iswalnum tst_is
+@@ -71,14 +81,20 @@ locale_test_suite := tst_iswalnum tst_iswalpha tst_iswcntrl            \
  		     tst_wcsxfrm tst_wctob tst_wctomb tst_wctrans      \
  		     tst_wctype tst_wcwidth
  
@@ -2584,15 +2841,15 @@ Index: git/localedata/Makefile
  tests-special += $(objpfx)sort-test.out $(objpfx)tst-fmon.out \
  		 $(objpfx)tst-locale.out $(objpfx)tst-rpmatch.out \
  		 $(objpfx)tst-trans.out $(objpfx)tst-ctype.out \
-@@ -113,6 +130,7 @@ CHARMAPS := $(shell echo "$(LOCALES)" |
- CTYPE_FILES = $(addsuffix /LC_CTYPE,$(LOCALES))
- tests-special += $(addprefix $(objpfx),$(CTYPE_FILES))
+@@ -109,6 +126,7 @@ LOCALES := de_DE.ISO-8859-1 de_DE.UTF-8 en_US.ANSI_X3.4-1968 \
+ 	   tr_TR.ISO-8859-9 en_GB.UTF-8 uk_UA.UTF-8
+ include ../gen-locales.mk
  endif
 +endif
  
  include ../Rules
  
-@@ -205,6 +223,11 @@ endif
+@@ -191,6 +209,11 @@ endif
  
  include SUPPORTED
  
@@ -2604,10 +2861,10 @@ Index: git/localedata/Makefile
  INSTALL-SUPPORTED-LOCALES=$(addprefix install-, $(SUPPORTED-LOCALES))
  
  # Sometimes the whole collection of locale files should be installed.
-Index: git/login/Makefile
-===================================================================
---- git.orig/login/Makefile
-+++ git/login/Makefile
+diff --git a/login/Makefile b/login/Makefile
+index 0f4bb22..4036ddb 100644
+--- a/login/Makefile
++++ b/login/Makefile
 @@ -18,6 +18,7 @@
  #
  #	Sub-makefile for login portion of the library.
@@ -2639,7 +2896,7 @@ Index: git/login/Makefile
  ifeq (yes,$(build-pt-chown))
  others += pt_chown
 @@ -46,8 +49,8 @@ vpath %.c programs
- tests := tst-utmp tst-utmpx tst-grantpt tst-ptsname
+ tests := tst-utmp tst-utmpx tst-grantpt tst-ptsname tst-getlogin
  
  # Build the -lutil library with these extra functions.
 -extra-libs      := libutil
@@ -2649,78 +2906,10 @@ Index: git/login/Makefile
  
  libutil-routines:= login login_tty logout logwtmp openpty forkpty
  
-Index: git/Makeconfig
-===================================================================
---- git.orig/Makeconfig
-+++ git/Makeconfig
-@@ -582,7 +582,7 @@ elf-objpfx = $(common-objpfx)elf/
- # and run on the build system, causes that program with those
- # arguments to be run on the host for which the library is built.
- ifndef test-wrapper
--test-wrapper =
-+test-wrapper = $(cross-test-wrapper)
- endif
- # Likewise, but the name of the program is preceded by
- # <variable>=<value> assignments for environment variables.
-@@ -1055,6 +1055,24 @@ else
- libm = $(common-objpfx)math/libm.a
- endif
- 
-+# Generate a header file that #defines preprocessor symbols indicating
-+# which option groups are enabled.  Note that the option-groups.config file
-+# may not exist at all.
-+before-compile += $(common-objpfx)gnu/option-groups.h
-+common-generated += gnu/option-groups.h gnu/option-groups.stmp
-+headers += gnu/option-groups.h
-+$(common-objpfx)gnu/option-groups.h: $(common-objpfx)gnu/option-groups.stmp; @:
-+$(common-objpfx)gnu/option-groups.stmp:					\
-+		$(..)scripts/option-groups.awk				\
-+		$(..)option-groups.defaults				\
-+		$(wildcard $(common-objpfx)option-groups.config)
-+	$(make-target-directory)
-+	@rm -f ${@:stmp=T} $@
-+	LC_ALL=C $(AWK) -f $^ > ${@:stmp=T}
-+	$(move-if-change) ${@:stmp=T} ${@:stmp=h}
-+	touch $@
-+
-+
- # These are the subdirectories containing the library source.  The order
- # is more or less arbitrary.  The sorting step will take care of the
- # dependencies.
-Index: git/Makerules
-===================================================================
---- git.orig/Makerules
-+++ git/Makerules
-@@ -446,6 +446,25 @@ define sed-remove-objpfx
- endef
- endif
- 
-+# Include targets in the selected option groups.
-+aux                  += $(aux-y)
-+extra-libs           += $(extra-libs-y)
-+extra-libs-others    += $(extra-libs-others-y)
-+extra-objs           += $(extra-objs-y)
-+install-bin          += $(install-bin-y)
-+install-others       += $(install-others-y)
-+install-sbin         += $(install-sbin-y)
-+modules              += $(modules-y)
-+others               += $(others-y)
-+others-pie           += $(others-pie-y)
-+routines             += $(routines-y)
-+static-only-routines += $(static-only-routines-y)
-+sysdep_routines      += $(sysdep_routines-y)
-+test-srcs            += $(test-srcs-y)
-+tests                += $(tests-y)
-+xtests               += $(xtests-y)
-+
-+
- # Modify the list of routines we build for different targets
- 
- ifeq (yes,$(build-shared))
-Index: git/malloc/Makefile
-===================================================================
---- git.orig/malloc/Makefile
-+++ git/malloc/Makefile
+diff --git a/malloc/Makefile b/malloc/Makefile
+index 67ed293..272ca4d 100644
+--- a/malloc/Makefile
++++ b/malloc/Makefile
 @@ -18,6 +18,8 @@
  #
  #	Makefile for malloc routines
@@ -2730,7 +2919,7 @@ Index: git/malloc/Makefile
  subdir	:= malloc
  
  include ../Makeconfig
-@@ -36,9 +38,15 @@ install-lib := libmcheck.a
+@@ -39,9 +41,15 @@ install-lib := libmcheck.a
  non-lib.a := libmcheck.a
  
  # Additional library.
@@ -2746,7 +2935,7 @@ Index: git/malloc/Makefile
  libmemusage-routines = memusage
  libmemusage-inhibit-o = $(filter-out .os,$(object-suffixes))
  
-@@ -65,7 +73,7 @@ endif
+@@ -71,7 +79,7 @@ endif
  # Unless we get a test for the availability of libgd which also works
  # for cross-compiling we disable the memusagestat generation in this
  # situation.
@@ -2755,10 +2944,10 @@ Index: git/malloc/Makefile
  # If the gd library is available we build the `memusagestat' program.
  ifneq ($(LIBGD),no)
  others: $(objpfx)memusage
-Index: git/malloc/memusage.c
-===================================================================
---- git.orig/malloc/memusage.c
-+++ git/malloc/memusage.c
+diff --git a/malloc/memusage.c b/malloc/memusage.c
+index a57ba8e..732ba9d 100644
+--- a/malloc/memusage.c
++++ b/malloc/memusage.c
 @@ -33,6 +33,7 @@
  #include <stdint.h>
  #include <sys/mman.h>
@@ -2780,10 +2969,10 @@ Index: git/malloc/memusage.c
  static size_t buffer_size;
  
  static int fd = -1;
-Index: git/malloc/memusage.sh
-===================================================================
---- git.orig/malloc/memusage.sh
-+++ git/malloc/memusage.sh
+diff --git a/malloc/memusage.sh b/malloc/memusage.sh
+index 8ab8cc2..d18f446 100755
+--- a/malloc/memusage.sh
++++ b/malloc/memusage.sh
 @@ -35,7 +35,7 @@ do_missing_arg() {
  
  # Print help message
@@ -2793,10 +2982,10 @@ Index: git/malloc/memusage.sh
  Profile memory usage of PROGRAM.
  
     -n,--progname=NAME     Name of the program file to profile
-Index: git/math/Makefile
-===================================================================
---- git.orig/math/Makefile
-+++ git/math/Makefile
+diff --git a/math/Makefile b/math/Makefile
+index 2c78dd0..37815f8 100644
+--- a/math/Makefile
++++ b/math/Makefile
 @@ -21,6 +21,8 @@ subdir		:= math
  
  include ../Makeconfig
@@ -2806,7 +2995,7 @@ Index: git/math/Makefile
  # Installed header files.
  headers		:= math.h bits/mathcalls.h bits/mathinline.h bits/huge_val.h \
  		   bits/huge_valf.h bits/huge_vall.h bits/inf.h bits/nan.h \
-@@ -33,8 +35,8 @@ aux		:= setfpucw fpu_control
+@@ -34,8 +36,8 @@ aux		:= setfpucw fpu_control
  
  # Build the -lm library.
  
@@ -2817,27 +3006,97 @@ Index: git/math/Makefile
  
  libm-support = s_lib_version s_matherr s_signgam			\
  	       fclrexcpt fgetexcptflg fraiseexcpt fsetexcptflg		\
-Index: git/misc/err.c
-===================================================================
---- git.orig/misc/err.c
-+++ git/misc/err.c
-@@ -22,6 +22,7 @@
- #include <errno.h>
- #include <string.h>
- #include <stdio.h>
-+#include <gnu/option-groups.h>
+diff --git a/misc/Makefile b/misc/Makefile
+index aecb0da..e6b7c23 100644
+--- a/misc/Makefile
++++ b/misc/Makefile
+@@ -19,6 +19,10 @@
+ #	Sub-makefile for misc portion of the library.
+ #
  
- #include <wchar.h>
- #define flockfile(s) _IO_flockfile (s)
-@@ -37,6 +38,7 @@ extern char *__progname;
-   va_end (ap);								      \
++# Some system-dependent implementations of these functions use option
++# groups (see sysdeps/unix/sysv/linux/Makefile, for example).
++include ../option-groups.mak
++
+ subdir	:= misc
+ 
+ include ../Makeconfig
+@@ -46,40 +50,47 @@ routines := brk sbrk sstk ioctl \
+ 	    select pselect \
+ 	    acct chroot fsync sync fdatasync syncfs reboot \
+ 	    gethostid sethostid \
+-	    revoke vhangup \
++	    vhangup \
+ 	    swapon swapoff mktemp mkstemp mkstemp64 mkdtemp \
+ 	    mkostemp mkostemp64 mkstemps mkstemps64 mkostemps mkostemps64 \
+ 	    ualarm usleep \
+ 	    gtty stty \
+ 	    ptrace \
+-	    fstab mntent mntent_r \
++	    mntent mntent_r \
+ 	    utimes lutimes futimes futimesat \
+ 	    truncate ftruncate truncate64 ftruncate64 \
+-	    chflags fchflags \
+ 	    insremque getttyent getusershell getpass ttyslot \
+ 	    syslog syscall daemon \
+ 	    mmap mmap64 munmap mprotect msync madvise mincore remap_file_pages\
+ 	    mlock munlock mlockall munlockall \
+-	    efgcvt efgcvt_r qefgcvt qefgcvt_r \
+ 	    hsearch hsearch_r tsearch lsearch \
+ 	    err error ustat \
+-	    getsysstats dirname regexp \
++	    getsysstats dirname \
+ 	    getloadavg getclktck \
+ 	    fgetxattr flistxattr fremovexattr fsetxattr getxattr \
+ 	    listxattr lgetxattr llistxattr lremovexattr lsetxattr \
+ 	    removexattr setxattr getauxval ifunc-impl-list
+ 
++routines-$(OPTION_POSIX_REGEXP) += regexp
++routines-$(OPTION_EGLIBC_FSTAB) += fstab
++routines-$(OPTION_EGLIBC_BSD) += chflags fchflags revoke
++routines-$(OPTION_EGLIBC_FCVT) += efgcvt efgcvt_r qefgcvt qefgcvt_r
++
+ generated += tst-error1.mtrace tst-error1-mem.out
+ 
+ aux := init-misc
+ install-lib := libg.a
+ gpl2lgpl := error.c error.h
+ 
+-tests := tst-dirname tst-tsearch tst-fdset tst-efgcvt tst-mntent tst-hsearch \
+-	 tst-error1 tst-pselect tst-insremque tst-mntent2 bug-hsearch1
++tests := tst-dirname tst-tsearch tst-fdset tst-mntent tst-hsearch \
++	 tst-pselect tst-insremque tst-mntent2 bug-hsearch1
++tests-$(OPTION_POSIX_WIDE_CHAR_DEVICE_IO) += tst-error1
++tests-$(OPTION_EGLIBC_FCVT) += tst-efgcvt
+ ifeq ($(run-built-tests),yes)
++ifeq (y,$(OPTION_POSIX_WIDE_CHAR_DEVICE_IO))
+ tests-special += $(objpfx)tst-error1-mem.out
+ endif
++endif
+ 
+ CFLAGS-select.c = -fexceptions -fasynchronous-unwind-tables
+ CFLAGS-tsearch.c = $(uses-callbacks)
+diff --git a/misc/err.c b/misc/err.c
+index 7b98157..efce8d5 100644
+--- a/misc/err.c
++++ b/misc/err.c
+@@ -22,6 +22,7 @@
+ #include <errno.h>
+ #include <string.h>
+ #include <stdio.h>
++#include <gnu/option-groups.h>
+ 
+ #include <wchar.h>
+ #define flockfile(s) _IO_flockfile (s)
+@@ -37,6 +38,7 @@ extern char *__progname;
+   va_end (ap);								      \
  }
  
 +#if __OPTION_POSIX_WIDE_CHAR_DEVICE_IO
  static void
  convert_and_print (const char *format, __gnuc_va_list ap)
  {
-@@ -81,6 +83,7 @@ convert_and_print (const char *format, _
+@@ -81,6 +83,7 @@ convert_and_print (const char *format, __gnuc_va_list ap)
  
    __vfwprintf (stderr, wformat, ap);
  }
@@ -2845,7 +3104,7 @@ Index: git/misc/err.c
  
  void
  vwarnx (const char *format, __gnuc_va_list ap)
-@@ -88,9 +91,13 @@ vwarnx (const char *format, __gnuc_va_li
+@@ -88,9 +91,13 @@ vwarnx (const char *format, __gnuc_va_list ap)
    flockfile (stderr);
    if (_IO_fwide (stderr, 0) > 0)
      {
@@ -2859,7 +3118,7 @@ Index: git/misc/err.c
      }
    else
      {
-@@ -111,6 +118,7 @@ vwarn (const char *format, __gnuc_va_lis
+@@ -111,6 +118,7 @@ vwarn (const char *format, __gnuc_va_list ap)
    flockfile (stderr);
    if (_IO_fwide (stderr, 0) > 0)
      {
@@ -2867,7 +3126,7 @@ Index: git/misc/err.c
        __fwprintf (stderr, L"%s: ", __progname);
        if (format)
  	{
-@@ -119,6 +127,9 @@ vwarn (const char *format, __gnuc_va_lis
+@@ -119,6 +127,9 @@ vwarn (const char *format, __gnuc_va_list ap)
  	}
        __set_errno (error);
        __fwprintf (stderr, L"%m\n");
@@ -2877,10 +3136,10 @@ Index: git/misc/err.c
      }
    else
      {
-Index: git/misc/error.c
-===================================================================
---- git.orig/misc/error.c
-+++ git/misc/error.c
+diff --git a/misc/error.c b/misc/error.c
+index aaa120d..d6cbc82 100644
+--- a/misc/error.c
++++ b/misc/error.c
 @@ -35,6 +35,7 @@
  #endif
  
@@ -2889,7 +3148,7 @@ Index: git/misc/error.c
  # include <libintl.h>
  # include <stdbool.h>
  # include <stdint.h>
-@@ -205,6 +206,7 @@ error_tail (int status, int errnum, cons
+@@ -205,6 +206,7 @@ error_tail (int status, int errnum, const char *message, va_list args)
  #if _LIBC
    if (_IO_fwide (stderr, 0) > 0)
      {
@@ -2897,7 +3156,7 @@ Index: git/misc/error.c
        size_t len = strlen (message) + 1;
        wchar_t *wmessage = NULL;
        mbstate_t st;
-@@ -265,6 +267,9 @@ error_tail (int status, int errnum, cons
+@@ -265,6 +267,9 @@ error_tail (int status, int errnum, const char *message, va_list args)
  
        if (use_malloc)
  	free (wmessage);
@@ -2907,80 +3166,10 @@ Index: git/misc/error.c
      }
    else
  #endif
-Index: git/misc/Makefile
-===================================================================
---- git.orig/misc/Makefile
-+++ git/misc/Makefile
-@@ -19,6 +19,10 @@
- #	Sub-makefile for misc portion of the library.
- #
- 
-+# Some system-dependent implementations of these functions use option
-+# groups (see sysdeps/unix/sysv/linux/Makefile, for example).
-+include ../option-groups.mak
-+
- subdir	:= misc
- 
- include ../Makeconfig
-@@ -46,40 +50,47 @@ routines := brk sbrk sstk ioctl \
- 	    select pselect \
- 	    acct chroot fsync sync fdatasync syncfs reboot \
- 	    gethostid sethostid \
--	    revoke vhangup \
-+	    vhangup \
- 	    swapon swapoff mktemp mkstemp mkstemp64 mkdtemp \
- 	    mkostemp mkostemp64 mkstemps mkstemps64 mkostemps mkostemps64 \
- 	    ualarm usleep \
- 	    gtty stty \
- 	    ptrace \
--	    fstab mntent mntent_r \
-+	    mntent mntent_r \
- 	    utimes lutimes futimes futimesat \
- 	    truncate ftruncate truncate64 ftruncate64 \
--	    chflags fchflags \
- 	    insremque getttyent getusershell getpass ttyslot \
- 	    syslog syscall daemon \
- 	    mmap mmap64 munmap mprotect msync madvise mincore remap_file_pages\
- 	    mlock munlock mlockall munlockall \
--	    efgcvt efgcvt_r qefgcvt qefgcvt_r \
- 	    hsearch hsearch_r tsearch lsearch \
- 	    err error ustat \
--	    getsysstats dirname regexp \
-+	    getsysstats dirname \
- 	    getloadavg getclktck \
- 	    fgetxattr flistxattr fremovexattr fsetxattr getxattr \
- 	    listxattr lgetxattr llistxattr lremovexattr lsetxattr \
- 	    removexattr setxattr getauxval ifunc-impl-list
- 
-+routines-$(OPTION_POSIX_REGEXP) += regexp
-+routines-$(OPTION_EGLIBC_FSTAB) += fstab
-+routines-$(OPTION_EGLIBC_BSD) += chflags fchflags revoke
-+routines-$(OPTION_EGLIBC_FCVT) += efgcvt efgcvt_r qefgcvt qefgcvt_r
-+
- generated += tst-error1.mtrace tst-error1-mem.out
- 
- aux := init-misc
- install-lib := libg.a
- gpl2lgpl := error.c error.h
- 
--tests := tst-dirname tst-tsearch tst-fdset tst-efgcvt tst-mntent tst-hsearch \
--	 tst-error1 tst-pselect tst-insremque tst-mntent2 bug-hsearch1
-+tests := tst-dirname tst-tsearch tst-fdset tst-mntent tst-hsearch \
-+	 tst-pselect tst-insremque tst-mntent2 bug-hsearch1
-+tests-$(OPTION_POSIX_WIDE_CHAR_DEVICE_IO) += tst-error1
-+tests-$(OPTION_EGLIBC_FCVT) += tst-efgcvt
- ifeq ($(run-built-tests),yes)
-+ifeq (y,$(OPTION_POSIX_WIDE_CHAR_DEVICE_IO))
- tests-special += $(objpfx)tst-error1-mem.out
- endif
-+endif
- 
- CFLAGS-select.c = -fexceptions -fasynchronous-unwind-tables
- CFLAGS-tsearch.c = $(uses-callbacks)
-Index: git/misc/tst-efgcvt.c
-===================================================================
---- git.orig/misc/tst-efgcvt.c
-+++ git/misc/tst-efgcvt.c
+diff --git a/misc/tst-efgcvt.c b/misc/tst-efgcvt.c
+index 5083fec..79ed36c 100644
+--- a/misc/tst-efgcvt.c
++++ b/misc/tst-efgcvt.c
 @@ -59,7 +59,7 @@ static testcase ecvt_tests[] =
    { 123.01, -4, 3, "" },
    { 126.71, -4, 3, "" },
@@ -2990,10 +3179,10 @@ Index: git/misc/tst-efgcvt.c
    { 0x1p-1074, 3, -323, "494" },
    { -0x1p-1074, 3, -323, "494" },
  #endif
-Index: git/nis/Makefile
-===================================================================
---- git.orig/nis/Makefile
-+++ git/nis/Makefile
+diff --git a/nis/Makefile b/nis/Makefile
+index 037e674..c967850 100644
+--- a/nis/Makefile
++++ b/nis/Makefile
 @@ -18,6 +18,8 @@
  #
  #	Makefile for NIS/NIS+ part.
@@ -3036,7 +3225,7 @@ Index: git/nis/Makefile
  vpath %.c $(subdir-dirs)
  
  libnsl-routines = yp_xdr ypclnt ypupdate_xdr \
-@@ -60,11 +69,11 @@ libnsl-routines = yp_xdr ypclnt ypupdate
+@@ -60,11 +69,11 @@ libnsl-routines = yp_xdr ypclnt ypupdate_xdr \
  libnss_compat-routines	:= $(addprefix compat-,grp pwd spwd initgroups)
  libnss_compat-inhibit-o	= $(filter-out .os,$(object-suffixes))
  
@@ -3050,7 +3239,7 @@ Index: git/nis/Makefile
  			   nss-nisplus nisplus-initgroups
  libnss_nisplus-inhibit-o = $(filter-out .os,$(object-suffixes))
  
-@@ -80,12 +89,12 @@ libnsl-libc = $(common-objpfx)linkobj/li
+@@ -80,12 +89,12 @@ libnsl-libc = $(common-objpfx)linkobj/libc.so
  # Target-specific variable setting to link objects using deprecated
  # RPC interfaces with the version of libc.so that makes them available
  # for new links:
@@ -3066,10 +3255,10 @@ Index: git/nis/Makefile
 -$(others:%=$(objpfx)%): $(objpfx)libnsl.a
 +$(others-y:%=$(objpfx)%): $(objpfx)libnsl.a
  endif
-Index: git/nptl/Makefile
-===================================================================
---- git.orig/nptl/Makefile
-+++ git/nptl/Makefile
+diff --git a/nptl/Makefile b/nptl/Makefile
+index 140f063..8e7b6ea 100644
+--- a/nptl/Makefile
++++ b/nptl/Makefile
 @@ -18,6 +18,8 @@
  #
  #	Sub-makefile for NPTL portion of the library.
@@ -3079,7 +3268,7 @@ Index: git/nptl/Makefile
  subdir	:= nptl
  
  include ../Makeconfig
-@@ -117,7 +119,7 @@ libpthread-routines = nptl-init vars eve
+@@ -118,7 +120,7 @@ libpthread-routines = nptl-init vars events version pt-interp \
  		      pt-raise pt-system \
  		      flockfile ftrylockfile funlockfile \
  		      sigaction \
@@ -3088,16 +3277,18 @@ Index: git/nptl/Makefile
  		      pthread_kill_other_threads \
  		      pthread_getaffinity pthread_setaffinity \
  		      pthread_attr_getaffinity pthread_attr_setaffinity \
-@@ -137,6 +139,8 @@ libpthread-routines = nptl-init vars eve
+@@ -138,8 +140,10 @@ libpthread-routines = nptl-init vars events version pt-interp \
  #		      pthread_setgid pthread_setegid pthread_setregid \
  #		      pthread_setresgid
  
 +libpthread-routines-$(OPTION_EGLIBC_INET) := herrno res
+ libpthread-shared-only-routines = version pt-interp pt-allocrtsig \
+ 				  unwind-forcedunwind
 +
- libpthread-shared-only-routines = version pt-allocrtsig unwind-forcedunwind
  libpthread-static-only-routines = pthread_atfork
  
-@@ -211,7 +215,7 @@ tests = tst-typesizes \
+ # Since cancellation handling is in large parts handled using exceptions
+@@ -220,7 +224,7 @@ tests = tst-typesizes \
  	tst-mutexpi1 tst-mutexpi2 tst-mutexpi3 tst-mutexpi4 tst-mutexpi5 \
  	tst-mutexpi5a tst-mutexpi6 tst-mutexpi7 tst-mutexpi7a tst-mutexpi8 \
  	tst-mutexpi9 \
@@ -3106,7 +3297,7 @@ Index: git/nptl/Makefile
  	tst-cond1 tst-cond2 tst-cond3 tst-cond4 tst-cond5 tst-cond6 tst-cond7 \
  	tst-cond8 tst-cond9 tst-cond10 tst-cond11 tst-cond12 tst-cond13 \
  	tst-cond14 tst-cond15 tst-cond16 tst-cond17 tst-cond18 tst-cond19 \
-@@ -245,14 +249,14 @@ tests = tst-typesizes \
+@@ -256,14 +260,14 @@ tests = tst-typesizes \
  	tst-cancel6 tst-cancel7 tst-cancel8 tst-cancel9 tst-cancel10 \
  	tst-cancel11 tst-cancel12 tst-cancel13 tst-cancel14 tst-cancel15 \
  	tst-cancel16 tst-cancel17 tst-cancel18 tst-cancel19 tst-cancel20 \
@@ -3123,7 +3314,7 @@ Index: git/nptl/Makefile
  	tst-exit1 tst-exit2 tst-exit3 \
  	tst-stdio1 tst-stdio2 \
  	tst-stack1 tst-stack2 tst-stack3 tst-stack4 tst-pthread-getattr \
-@@ -260,13 +264,12 @@ tests = tst-typesizes \
+@@ -271,13 +275,12 @@ tests = tst-typesizes \
  	tst-unload \
  	tst-dlsym1 \
  	tst-sysconf \
@@ -3137,11 +3328,14 @@ Index: git/nptl/Makefile
 -	tst-backtrace1 \
  	tst-abstime \
  	tst-vfork1 tst-vfork2 tst-vfork1x tst-vfork2x \
- 	tst-getpid1 tst-getpid2 tst-getpid3 \
-@@ -277,6 +280,17 @@ xtests = tst-setuid1 tst-setuid1-static
+ 	tst-getpid3 \
+@@ -288,9 +291,16 @@ xtests = tst-setuid1 tst-setuid1-static tst-setuid2 \
  	tst-mutexpp1 tst-mutexpp6 tst-mutexpp10
  test-srcs = tst-oddstacklimit
  
+-# Test expected to fail on most targets (except x86_64) due to bug
+-# 18435 - pthread_once hangs when init routine throws an exception.
+-test-xfail-tst-once5 = yes
 +# This test uses the posix_spawn functions.
 +tests-$(OPTION_EGLIBC_SPAWN) += tst-exec1
 +
@@ -3152,44 +3346,22 @@ Index: git/nptl/Makefile
 +tests-$(OPTION_EGLIBC_CXX_TESTS) += tst-cancel24
 +
 +tests-$(OPTION_EGLIBC_LOCALE_CODE) += tst-locale1
-+
+ 
  # Files which must not be linked with libpthread.
  tests-nolibpthread = tst-unload
- 
-@@ -363,12 +377,18 @@
- 		    $(common-objpfx)libc.a
- 
- tests-static += tst-locale1 tst-locale2 tst-stackguard1-static \
--		tst-cancel21-static tst-cancel24-static tst-cond8-static \
-+		tst-cancel21-static tst-cond8-static \
- 		tst-mutex8-static tst-mutexpi8-static tst-sem11-static \
- 		tst-sem12-static
--tests += tst-stackguard1-static tst-cancel21-static tst-cancel24-static \
-+
-+ifeq (y,$(OPTION_EGLIBC_CXX_TESTS))
-+tests-static += tst-cancel24-static
-+endif
-+
-+tests += tst-stackguard1-static tst-cancel21-static \
- 	 tst-cond8-static tst-mutex8-static tst-mutexpi8-static \
- 	 tst-sem11-static tst-sem12-static
-+tests-$(OPTION_EGLIBC_CXX_TESTS) += tst-cancel24-static
- xtests-static += tst-setuid1-static
- 
- # These tests are linked with libc before libpthread
-Index: git/nptl/pthread_create.c
-===================================================================
---- git.orig/nptl/pthread_create.c
-+++ git/nptl/pthread_create.c
-@@ -32,6 +32,7 @@
- #include <exit-thread.h>
+diff --git a/nptl/pthread_create.c b/nptl/pthread_create.c
+index d10f4ea..14257ce 100644
+--- a/nptl/pthread_create.c
++++ b/nptl/pthread_create.c
+@@ -33,6 +33,7 @@
  #include <default-sched.h>
+ #include <futex-internal.h>
  
 +#include <gnu/option-groups.h>
  #include <shlib-compat.h>
  
  #include <stap-probe.h>
-@@ -261,8 +262,10 @@ START_THREAD_DEFN
+@@ -262,8 +263,10 @@ START_THREAD_DEFN
    THREAD_SETMEM (pd, cpuclock_offset, now);
  #endif
  
@@ -3200,7 +3372,7 @@ Index: git/nptl/pthread_create.c
  
    /* Initialize pointers to locale data.  */
    __ctype_init ();
-@@ -345,8 +348,10 @@ START_THREAD_DEFN
+@@ -346,8 +349,10 @@ START_THREAD_DEFN
    /* Run the destructor for the thread-local data.  */
    __nptl_deallocate_tsd ();
  
@@ -3211,10 +3383,10 @@ Index: git/nptl/pthread_create.c
  
    /* If this is the last thread we terminate the process now.  We
       do not notify the debugger, it might just irritate it if there
-Index: git/nscd/Makefile
-===================================================================
---- git.orig/nscd/Makefile
-+++ git/nscd/Makefile
+diff --git a/nscd/Makefile b/nscd/Makefile
+index ede941d..f4f3f8d 100644
+--- a/nscd/Makefile
++++ b/nscd/Makefile
 @@ -18,14 +18,17 @@
  #
  #	Sub-makefile for nscd portion of the library.
@@ -3235,7 +3407,7 @@ Index: git/nscd/Makefile
  endif
  
  # To find xmalloc.c
-@@ -37,14 +40,18 @@ nscd-modules := nscd connections pwdcach
+@@ -37,14 +40,18 @@ nscd-modules := nscd connections pwdcache getpwnam_r getpwuid_r grpcache \
  		dbg_log nscd_conf nscd_stat cache mem nscd_setup_thread \
  		xmalloc xstrdup aicache initgrcache gai res_hconf \
  		netgroupcache
@@ -3259,7 +3431,7 @@ Index: git/nscd/Makefile
  
  endif
  
-@@ -100,7 +107,15 @@ include $(patsubst %,$(..)cppflags-itera
+@@ -100,7 +107,15 @@ include $(patsubst %,$(..)cppflags-iterator.mk,$(cpp-srcs-left))
  $(objpfx)nscd: $(nscd-modules:%=$(objpfx)%.o)
  
  ifeq ($(build-shared),yes)
@@ -3277,18 +3449,134 @@ Index: git/nscd/Makefile
 +$(objpfx)nscd: $(common-objpfx)nis/libnsl.a
 +endif
  endif
-Index: git/nscd/nis_hash.c
-===================================================================
+diff --git a/nscd/nis_hash.c b/nscd/nis_hash.c
+new file mode 100644
+index 0000000..d244c41
 --- /dev/null
-+++ git/nscd/nis_hash.c
++++ b/nscd/nis_hash.c
 @@ -0,0 +1,3 @@
 +/* If OPTION_EGLIBC_NIS is disabled, nscd can't get this from libnsl.so;
 +   we need our own copy.  */
 +#include "../nis/nis_hash.c"
-Index: git/nss/fixed-nsswitch.conf
-===================================================================
+diff --git a/nss/Makefile b/nss/Makefile
+index 65ab7b5..19f0aef 100644
+--- a/nss/Makefile
++++ b/nss/Makefile
+@@ -18,28 +18,35 @@
+ #
+ #	Makefile for name service switch.
+ #
++include ../option-groups.mak
++
+ subdir	:= nss
+ 
+ include ../Makeconfig
+ 
+ headers			:= nss.h
+ 
+-# This is the trivial part which goes into libc itself.
+-routines		= nsswitch getnssent getnssent_r digits_dots \
+-			  $(addsuffix -lookup,$(databases))
+-
+ # These are the databases that go through nss dispatch.
+ # Caution: if you add a database here, you must add its real name
+ # in databases.def, too.
+-databases		= proto service hosts network grp pwd ethers \
+-			  spwd netgrp alias sgrp
++databases-y		= grp pwd spwd sgrp
++databases-$(OPTION_EGLIBC_INET) \
++			+= proto service hosts network ethers \
++			   netgrp
++databases-$(OPTION_EGLIBC_DB_ALIASES) += alias
++
++routines-$(OPTION_EGLIBC_INET) += digits_dots
+ 
+ ifneq (,$(filter sunrpc,$(subdirs)))
+-databases		+= key rpc
++databases-$(OPTION_EGLIBC_INET)	+= key rpc
+ have-sunrpc		:= 1
+ else
+ have-sunrpc		:= 0
+ endif
++# This is the trivial part which goes into libc itself.
++routines-y		+= nsswitch getnssent getnssent_r \
++			  $(addsuffix -lookup,$(databases-y))
++
+ CPPFLAGS-getent.c	= -DHAVE_SUNRPC=$(have-sunrpc)
+ 
+ others                  := getent makedb
+@@ -47,8 +54,9 @@ install-bin             := getent makedb
+ makedb-modules = xmalloc hash-string
+ extra-objs		+= $(makedb-modules:=.o)
+ 
+-tests			= test-netdb tst-nss-test1 test-digits-dots tst-nss-getpwent
+-xtests			= bug-erange
++tests			= tst-nss-test1 tst-nss-getpwent
++tests-$(OPTION_EGLIBC_INET)	+= test-netdb test-digits-dots
++xtests-$(OPTION_EGLIBC_INET)	+= bug-erange
+ 
+ # Specify rules for the nss_* modules.  We have some services.
+ services		:= files db
+@@ -63,7 +71,7 @@ subdir-dirs = $(services:%=nss_%)
+ vpath %.c $(subdir-dirs) ../locale/programs ../intl
+ 
+ 
+-libnss_files-routines	:= $(addprefix files-,$(databases)) \
++libnss_files-routines	:= $(addprefix files-,$(databases-y)) \
+ 			   files-initgroups files-have_o_cloexec files-init
+ 
+ libnss_db-dbs		:= $(addprefix db-,\
+@@ -86,6 +94,45 @@ tests-static		= tst-nss-static
+ tests			+= $(tests-static)
+ endif
+ 
++ifneq ($(OPTION_EGLIBC_NSSWITCH),y)
++
++ifndef OPTION_EGLIBC_NSSWITCH_FIXED_CONFIG
++$(error OPTION_EGLIBC_NSSWITCH_FIXED_CONFIG variable left unset)
++endif
++
++ifndef OPTION_EGLIBC_NSSWITCH_FIXED_FUNCTIONS
++$(error OPTION_EGLIBC_NSSWITCH_FIXED_FUNCTIONS variable left unset)
++endif
++
++ifeq (,$(wildcard $(OPTION_EGLIBC_NSSWITCH_FIXED_CONFIG)))
++$(warning OPTION_EGLIBC_NSSWITCH is disabled, but fixed config file)
++$(error does not exist: $(OPTION_EGLIBC_NSSWITCH_FIXED_CONFIG))
++endif
++
++ifeq (,$(wildcard $(OPTION_EGLIBC_NSSWITCH_FIXED_FUNCTIONS)))
++$(warning OPTION_EGLIBC_NSSWITCH is disabled, but fixed functions file)
++$(error does not exist: $(OPTION_EGLIBC_NSSWITCH_FIXED_FUNCTIONS))
++endif
++
++before-compile := $(objpfx)fixed-nsswitch.h
++generated := fixed-nsswitch.h
++$(objpfx)fixed-nsswitch.h $(objfpx)fixed-nsswitch-libs:	\
++    $(objpfx)gen-fixed-nsswitch				\
++    $(OPTION_EGLIBC_NSSWITCH_FIXED_CONFIG)
++	$< $(objpfx)fixed-nsswitch.h			\
++	   $(objpfx)fixed-nsswitch-libs			\
++	   $(OPTION_EGLIBC_NSSWITCH_FIXED_CONFIG)
++
++$(objpfx)gen-fixed-nsswitch: gen-fixed-nsswitch.c	\
++    $(common-objpfx)option-groups.config		\
++    $(OPTION_EGLIBC_NSSWITCH_FIXED_FUNCTIONS)
++	$(native-compile)
++gen-fixed-nsswitch-CFLAGS =						\
++	-g3 -O -Wall							\
++	-I $(objpfx)							\
++	-DFIXED_FUNCTIONS='"$(OPTION_EGLIBC_NSSWITCH_FIXED_FUNCTIONS)"'
++endif
++
+ include ../Rules
+ 
+ ifeq (yes,$(have-selinux))
+diff --git a/nss/fixed-nsswitch.conf b/nss/fixed-nsswitch.conf
+new file mode 100644
+index 0000000..91bb675
 --- /dev/null
-+++ git/nss/fixed-nsswitch.conf
++++ b/nss/fixed-nsswitch.conf
 @@ -0,0 +1,22 @@
 +# /etc/nsswitch.conf
 +#
@@ -3312,10 +3600,11 @@ Index: git/nss/fixed-nsswitch.conf
 +rpc:            files
 +
 +netgroup:       files
-Index: git/nss/fixed-nsswitch.functions
-===================================================================
+diff --git a/nss/fixed-nsswitch.functions b/nss/fixed-nsswitch.functions
+new file mode 100644
+index 0000000..2f3fa83
 --- /dev/null
-+++ git/nss/fixed-nsswitch.functions
++++ b/nss/fixed-nsswitch.functions
 @@ -0,0 +1,121 @@
 +/* List of functions defined for fixed NSS in GNU C Library.
 +   Copyright (C) 1996, 1997, 1998, 2005 Free Software Foundation, Inc.
@@ -3438,10 +3727,11 @@ Index: git/nss/fixed-nsswitch.functions
 +/* shadow */
 +DEFINE_ENT (shadow, files, sp)
 +DEFINE_GET (shadow, files, spnam)
-Index: git/nss/gen-fixed-nsswitch.c
-===================================================================
+diff --git a/nss/gen-fixed-nsswitch.c b/nss/gen-fixed-nsswitch.c
+new file mode 100644
+index 0000000..6e1c98c
 --- /dev/null
-+++ git/nss/gen-fixed-nsswitch.c
++++ b/nss/gen-fixed-nsswitch.c
 @@ -0,0 +1,803 @@
 +/* gen-fixed-nsswitch.c --- generate fixed name service data structures
 +   Copyright (C) 1996-1999, 2001-2006, 2007 Free Software Foundation, Inc.
@@ -4246,10 +4536,10 @@ Index: git/nss/gen-fixed-nsswitch.c
 +
 +  return 0;
 +}
-Index: git/nss/getent.c
-===================================================================
---- git.orig/nss/getent.c
-+++ git/nss/getent.c
+diff --git a/nss/getent.c b/nss/getent.c
+index 34df848..674c8ee 100644
+--- a/nss/getent.c
++++ b/nss/getent.c
 @@ -39,6 +39,7 @@
  #include <netinet/ether.h>
  #include <netinet/in.h>
@@ -4258,7 +4548,7 @@ Index: git/nss/getent.c
  
  /* Get libc version number.  */
  #include <version.h>
-@@ -91,6 +92,7 @@ warranty; not even for MERCHANTABILITY o
+@@ -91,6 +92,7 @@ warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.\n\
    fprintf (stream, gettext ("Written by %s.\n"), "Thorsten Kukuk");
  }
  
@@ -4308,7 +4598,7 @@ Index: git/nss/getent.c
  /* This is for protocols */
  static void
  print_protocols (struct protoent *proto)
-@@ -805,6 +813,7 @@ services_keys (int number, char *key[])
+@@ -807,6 +815,7 @@ services_keys (int number, char *key[])
  
    return result;
  }
@@ -4316,7 +4606,7 @@ Index: git/nss/getent.c
  
  /* This is for shadow */
  static void
-@@ -871,21 +880,34 @@ struct
+@@ -873,23 +882,36 @@ struct
    } databases[] =
    {
  #define D(name) { #name, name ## _keys },
@@ -4327,15 +4617,15 @@ Index: git/nss/getent.c
 -D(ethers)
 +
 +#if __OPTION_EGLIBC_INET
-+#define DN(name) D(name)
++# define DN(name) D(name)
 +#else
-+#define DN(name)
++# define DN(name)
 +#endif
 +
 +#if __OPTION_EGLIBC_DB_ALIASES
-+#define DA(name) D(name)
++# define DA(name) D(name)
 +#else
-+#define DA(name)
++# define DA(name)
 +#endif
 +
 +DN(ahosts)
@@ -4355,18 +4645,20 @@ Index: git/nss/getent.c
 +DN(networks)
  D(passwd)
 -D(protocols)
--D(rpc)
--D(services)
 +DN(protocols)
+ #if HAVE_SUNRPC
+-D(rpc)
 +DN(rpc)
+ #endif
+-D(services)
 +DN(services)
  D(shadow)
  #undef D
      { NULL, NULL }
-Index: git/nss/getnssent_r.c
-===================================================================
---- git.orig/nss/getnssent_r.c
-+++ git/nss/getnssent_r.c
+diff --git a/nss/getnssent_r.c b/nss/getnssent_r.c
+index f5b9036..f09f7fe 100644
+--- a/nss/getnssent_r.c
++++ b/nss/getnssent_r.c
 @@ -16,6 +16,7 @@
     <http://www.gnu.org/licenses/>.  */
  
@@ -4375,7 +4667,7 @@ Index: git/nss/getnssent_r.c
  #include <netdb.h>
  #include "nsswitch.h"
  
-@@ -59,11 +60,13 @@ __nss_setent (const char *func_name, db_
+@@ -59,11 +60,13 @@ __nss_setent (const char *func_name, db_lookup_function lookup_fct,
    } fct;
    int no_more;
  
@@ -4389,7 +4681,7 @@ Index: git/nss/getnssent_r.c
  
    /* Cycle through the services and run their `setXXent' functions until
       we find an available service.  */
-@@ -101,11 +104,13 @@ __nss_endent (const char *func_name, db_
+@@ -101,11 +104,13 @@ __nss_endent (const char *func_name, db_lookup_function lookup_fct,
    } fct;
    int no_more;
  
@@ -4403,7 +4695,7 @@ Index: git/nss/getnssent_r.c
  
    /* Cycle through all the services and run their endXXent functions.  */
    no_more = setup (func_name, lookup_fct, &fct.ptr, nip, startp, 1);
-@@ -141,12 +146,14 @@ __nss_getent_r (const char *getent_func_
+@@ -141,12 +146,14 @@ __nss_getent_r (const char *getent_func_name,
    int no_more;
    enum nss_status status;
  
@@ -4418,7 +4710,7 @@ Index: git/nss/getnssent_r.c
  
    /* Initialize status to return if no more functions are found.  */
    status = NSS_STATUS_NOTFOUND;
-@@ -161,7 +168,7 @@ __nss_getent_r (const char *getent_func_
+@@ -161,7 +168,7 @@ __nss_getent_r (const char *getent_func_name,
        int is_last_nip = *nip == *last_nip;
  
        status = DL_CALL_FCT (fct.f,
@@ -4427,119 +4719,15 @@ Index: git/nss/getnssent_r.c
  
        /* The status is NSS_STATUS_TRYAGAIN and errno is ERANGE the
  	 provided buffer is too small.  In this case we should give
-Index: git/nss/Makefile
-===================================================================
---- git.orig/nss/Makefile
-+++ git/nss/Makefile
-@@ -18,29 +18,36 @@
- #
- #	Makefile for name service switch.
- #
-+include ../option-groups.mak
-+
- subdir	:= nss
- 
- include ../Makeconfig
- 
- headers			:= nss.h
- 
--# This is the trivial part which goes into libc itself.
--routines		= nsswitch getnssent getnssent_r digits_dots \
--			  $(addsuffix -lookup,$(databases))
--
- # These are the databases that go through nss dispatch.
- # Caution: if you add a database here, you must add its real name
- # in databases.def, too.
--databases		= proto service hosts network grp pwd rpc ethers \
--			  spwd netgrp key alias sgrp
-+databases-y		= grp pwd spwd sgrp
-+databases-$(OPTION_EGLIBC_INET) \
-+			+= proto service hosts network rpc ethers \
-+			   netgrp key
-+databases-$(OPTION_EGLIBC_DB_ALIASES) += alias
-+
-+# This is the trivial part which goes into libc itself.
-+routines-y		+= nsswitch getnssent getnssent_r \
-+			  $(addsuffix -lookup,$(databases-y))
-+routines-$(OPTION_EGLIBC_INET) += digits_dots
- 
- others                  := getent makedb
- install-bin             := getent makedb
- makedb-modules = xmalloc hash-string
- extra-objs		+= $(makedb-modules:=.o)
- 
--tests			= test-netdb tst-nss-test1 test-digits-dots
--xtests			= bug-erange
-+tests			= tst-nss-test1
-+tests-$(OPTION_EGLIBC_INET) += test-netdb test-digits-dots
-+xtests-$(OPTION_EGLIBC_INET) += bug-erange
- 
- # Specify rules for the nss_* modules.  We have some services.
- services		:= files db
-@@ -55,7 +62,7 @@ subdir-dirs = $(services:%=nss_%)
- vpath %.c $(subdir-dirs) ../locale/programs ../intl
- 
- 
--libnss_files-routines	:= $(addprefix files-,$(databases)) \
-+libnss_files-routines	:= $(addprefix files-,$(databases-y)) \
- 			   files-initgroups files-have_o_cloexec files-init
- 
- libnss_db-dbs		:= $(addprefix db-,\
-@@ -78,6 +85,45 @@ tests-static		= tst-nss-static
- tests			+= $(tests-static)
- endif
- 
-+ifneq ($(OPTION_EGLIBC_NSSWITCH),y)
-+
-+ifndef OPTION_EGLIBC_NSSWITCH_FIXED_CONFIG
-+$(error OPTION_EGLIBC_NSSWITCH_FIXED_CONFIG variable left unset)
-+endif
-+
-+ifndef OPTION_EGLIBC_NSSWITCH_FIXED_FUNCTIONS
-+$(error OPTION_EGLIBC_NSSWITCH_FIXED_FUNCTIONS variable left unset)
-+endif
-+
-+ifeq (,$(wildcard $(OPTION_EGLIBC_NSSWITCH_FIXED_CONFIG)))
-+$(warning OPTION_EGLIBC_NSSWITCH is disabled, but fixed config file)
-+$(error does not exist: $(OPTION_EGLIBC_NSSWITCH_FIXED_CONFIG))
-+endif
-+
-+ifeq (,$(wildcard $(OPTION_EGLIBC_NSSWITCH_FIXED_FUNCTIONS)))
-+$(warning OPTION_EGLIBC_NSSWITCH is disabled, but fixed functions file)
-+$(error does not exist: $(OPTION_EGLIBC_NSSWITCH_FIXED_FUNCTIONS))
-+endif
-+
-+before-compile := $(objpfx)fixed-nsswitch.h
-+generated := fixed-nsswitch.h
-+$(objpfx)fixed-nsswitch.h $(objfpx)fixed-nsswitch-libs:	\
-+    $(objpfx)gen-fixed-nsswitch				\
-+    $(OPTION_EGLIBC_NSSWITCH_FIXED_CONFIG)
-+	$< $(objpfx)fixed-nsswitch.h			\
-+	   $(objpfx)fixed-nsswitch-libs			\
-+	   $(OPTION_EGLIBC_NSSWITCH_FIXED_CONFIG)
-+
-+$(objpfx)gen-fixed-nsswitch: gen-fixed-nsswitch.c	\
-+    $(common-objpfx)option-groups.config		\
-+    $(OPTION_EGLIBC_NSSWITCH_FIXED_FUNCTIONS)
-+	$(native-compile)
-+gen-fixed-nsswitch-CFLAGS =						\
-+	-g3 -O -Wall							\
-+	-I $(objpfx)							\
-+	-DFIXED_FUNCTIONS='"$(OPTION_EGLIBC_NSSWITCH_FIXED_FUNCTIONS)"'
-+endif
-+
- include ../Rules
- 
- ifeq (yes,$(have-selinux))
-Index: git/nss/nsswitch.c
-===================================================================
---- git.orig/nss/nsswitch.c
-+++ git/nss/nsswitch.c
-@@ -26,6 +26,7 @@
- #include <stdio_ext.h>
- #include <stdlib.h>
- #include <string.h>
-+#include <gnu/option-groups.h>
+diff --git a/nss/nsswitch.c b/nss/nsswitch.c
+index 9712623..c81e207 100644
+--- a/nss/nsswitch.c
++++ b/nss/nsswitch.c
+@@ -26,6 +26,7 @@
+ #include <stdio_ext.h>
+ #include <stdlib.h>
+ #include <string.h>
++#include <gnu/option-groups.h>
  
  #include <aliases.h>
  #include <grp.h>
@@ -4559,7 +4747,7 @@ Index: git/nss/nsswitch.c
  /* Prototypes for the local functions.  */
  static name_database *nss_parse_file (const char *fname) internal_function;
  static name_database_entry *nss_getline (char *line) internal_function;
-@@ -79,6 +89,9 @@ bool __nss_database_custom[NSS_DBSIDX_ma
+@@ -79,6 +89,9 @@ bool __nss_database_custom[NSS_DBSIDX_max];
  
  __libc_lock_define_initialized (static, lock)
  
@@ -4590,7 +4778,7 @@ Index: git/nss/nsswitch.c
  
  #ifdef USE_NSCD
  /* Nonzero if this is the nscd process.  */
-@@ -109,20 +136,22 @@ __nss_database_lookup (const char *datab
+@@ -109,20 +136,22 @@ __nss_database_lookup (const char *database, const char *alternate_name,
  		       const char *defconfig, service_user **ni)
  {
    /* Prevent multiple threads to change the service table.  */
@@ -4615,7 +4803,7 @@ Index: git/nss/nsswitch.c
  
    /* Test whether configuration data is available.  */
    if (service_table != NULL)
-@@ -144,6 +173,7 @@ __nss_database_lookup (const char *datab
+@@ -144,6 +173,7 @@ __nss_database_lookup (const char *database, const char *alternate_name,
  	    *ni = entry->service;
      }
  
@@ -4623,7 +4811,7 @@ Index: git/nss/nsswitch.c
    /* No configuration data is available, either because nsswitch.conf
       doesn't exist or because it doesn't have a line for this database.
  
-@@ -166,13 +196,23 @@ __nss_database_lookup (const char *datab
+@@ -166,13 +196,23 @@ __nss_database_lookup (const char *database, const char *alternate_name,
  	    {
  	      entry->next = defconfig_entries;
  	      entry->service = *ni;
@@ -4649,7 +4837,7 @@ Index: git/nss/nsswitch.c
  
    return *ni != NULL ? 0 : -1;
  }
-@@ -252,6 +292,7 @@ __nss_next2 (service_user **ni, const ch
+@@ -252,6 +292,7 @@ __nss_next2 (service_user **ni, const char *fct_name, const char *fct2_name,
  libc_hidden_def (__nss_next2)
  
  
@@ -4657,7 +4845,7 @@ Index: git/nss/nsswitch.c
  int
  attribute_compat_text_section
  __nss_next (service_user **ni, const char *fct_name, void **fctp, int status,
-@@ -300,13 +341,13 @@ __nss_configure_lookup (const char *dbna
+@@ -300,13 +341,13 @@ __nss_configure_lookup (const char *dbname, const char *service_line)
      }
  
    /* Prevent multiple threads to change the service table.  */
@@ -4673,7 +4861,7 @@ Index: git/nss/nsswitch.c
  
    return 0;
  }
-@@ -402,7 +443,7 @@ __nss_lookup_function (service_user *ni,
+@@ -402,7 +443,7 @@ __nss_lookup_function (service_user *ni, const char *fct_name)
    void **found, *result;
  
    /* We now modify global data.  Protect it.  */
@@ -4682,7 +4870,7 @@ Index: git/nss/nsswitch.c
  
    /* Search the tree of functions previously requested.  Data in the
       tree are `known_function' structures, whose first member is a
-@@ -413,7 +454,7 @@ __nss_lookup_function (service_user *ni,
+@@ -413,7 +454,7 @@ __nss_lookup_function (service_user *ni, const char *fct_name)
       enough to a pointer to our structure to use as a lookup key that
       will be passed to `known_compare' (above).  */
  
@@ -4691,7 +4879,7 @@ Index: git/nss/nsswitch.c
    if (found == NULL)
      /* This means out-of-memory.  */
      result = NULL;
-@@ -440,7 +481,7 @@ __nss_lookup_function (service_user *ni,
+@@ -440,7 +481,7 @@ __nss_lookup_function (service_user *ni, const char *fct_name)
  #endif
  	  /* Oops.  We can't instantiate this node properly.
  	     Remove it from the tree.  */
@@ -4700,7 +4888,7 @@ Index: git/nss/nsswitch.c
  	  free (known);
  	  result = NULL;
  	}
-@@ -520,13 +561,43 @@ __nss_lookup_function (service_user *ni,
+@@ -520,13 +561,43 @@ __nss_lookup_function (service_user *ni, const char *fct_name)
      }
  
    /* Remove the lock.  */
@@ -4745,7 +4933,7 @@ Index: git/nss/nsswitch.c
  static name_database *
  internal_function
  nss_parse_file (const char *fname)
-@@ -632,8 +703,10 @@ nss_parse_service_list (const char *line
+@@ -632,8 +703,10 @@ nss_parse_service_list (const char *line)
  					     + (line - name + 1));
        if (new_service == NULL)
  	return result;
@@ -4757,7 +4945,7 @@ Index: git/nss/nsswitch.c
  
        /* Set default actions.  */
        new_service->actions[2 + NSS_STATUS_TRYAGAIN] = NSS_ACTION_CONTINUE;
-@@ -642,7 +715,7 @@ nss_parse_service_list (const char *line
+@@ -642,7 +715,7 @@ nss_parse_service_list (const char *line)
        new_service->actions[2 + NSS_STATUS_SUCCESS] = NSS_ACTION_RETURN;
        new_service->actions[2 + NSS_STATUS_RETURN] = NSS_ACTION_RETURN;
        new_service->library = NULL;
@@ -4778,7 +4966,7 @@ Index: git/nss/nsswitch.c
  
    /* Parse the list of services.  */
    result->service = nss_parse_service_list (line);
-@@ -816,6 +890,7 @@ nss_new_service (name_database *database
+@@ -816,6 +890,7 @@ nss_new_service (name_database *database, const char *name)
    return *currentp;
  }
  #endif
@@ -4786,7 +4974,7 @@ Index: git/nss/nsswitch.c
  
  
  #if defined SHARED && defined USE_NSCD
-@@ -834,6 +909,7 @@ nss_load_all_libraries (const char *serv
+@@ -834,6 +909,7 @@ nss_load_all_libraries (const char *service, const char *def)
  }
  
  
@@ -4794,7 +4982,7 @@ Index: git/nss/nsswitch.c
  /* Called by nscd and nscd alone.  */
  void
  __nss_disable_nscd (void (*cb) (size_t, struct traced_file *))
-@@ -857,8 +933,10 @@ __nss_disable_nscd (void (*cb) (size_t,
+@@ -857,8 +933,10 @@ __nss_disable_nscd (void (*cb) (size_t, struct traced_file *))
    __nss_not_use_nscd_services = -1;
    __nss_not_use_nscd_netgroup = -1;
  }
@@ -4805,7 +4993,7 @@ Index: git/nss/nsswitch.c
  static void
  free_database_entries (name_database_entry *entry)
  {
-@@ -871,8 +949,8 @@ free_database_entries (name_database_ent
+@@ -871,8 +949,8 @@ free_database_entries (name_database_entry *entry)
  	{
  	  service_user *olds = service;
  
@@ -4821,10 +5009,10 @@ Index: git/nss/nsswitch.c
    free (top);
  }
 +#endif /* __OPTION_EGLIBC_NSSWITCH */
-Index: git/nss/nsswitch.h
-===================================================================
---- git.orig/nss/nsswitch.h
-+++ git/nss/nsswitch.h
+diff --git a/nss/nsswitch.h b/nss/nsswitch.h
+index a5318fa..1730977 100644
+--- a/nss/nsswitch.h
++++ b/nss/nsswitch.h
 @@ -65,10 +65,20 @@ typedef struct service_user
    lookup_actions actions[5];
    /* Link to the underlying library object.  */
@@ -4858,10 +5046,177 @@ Index: git/nss/nsswitch.h
  } name_database_entry;
  
  
-Index: git/posix/bug-regex1.c
-===================================================================
---- git.orig/posix/bug-regex1.c
-+++ git/posix/bug-regex1.c
+diff --git a/posix/Makefile b/posix/Makefile
+index 15e8818..609ed03 100644
+--- a/posix/Makefile
++++ b/posix/Makefile
+@@ -18,6 +18,8 @@
+ #
+ #	Sub-makefile for POSIX portion of the library.
+ #
++include ../option-groups.mak
++
+ subdir	:= posix
+ 
+ include ../Makeconfig
+@@ -43,13 +45,24 @@ routines :=								      \
+ 	getpgid setpgid getpgrp bsd-getpgrp setpgrp getsid setsid	      \
+ 	getresuid getresgid setresuid setresgid				      \
+ 	pathconf sysconf fpathconf					      \
+-	glob glob64 fnmatch regex					      \
++	glob glob64 fnmatch						      \
+ 	confstr								      \
+ 	getopt getopt1 getopt_init					      \
+ 	sched_setp sched_getp sched_sets sched_gets sched_yield sched_primax  \
+ 	sched_primin sched_rr_gi sched_getaffinity sched_setaffinity	      \
+-	getaddrinfo gai_strerror wordexp				      \
+ 	pread pwrite pread64 pwrite64					      \
++	posix_madvise							      \
++	get_child_max sched_cpucount sched_cpualloc sched_cpufree
++
++routines-$(OPTION_EGLIBC_INET) += getaddrinfo gai_strerror
++
++ifeq (y,$(OPTION_POSIX_REGEXP_GLIBC))
++routines-$(OPTION_POSIX_REGEXP) += regex
++else
++routines-$(OPTION_POSIX_REGEXP) += xregex
++endif
++
++routines-$(OPTION_EGLIBC_SPAWN) +=					      \
+ 	spawn_faction_init spawn_faction_destroy spawn_faction_addclose	      \
+ 	spawn_faction_addopen spawn_faction_adddup2			      \
+ 	spawnattr_init spawnattr_destroy				      \
+@@ -61,37 +74,54 @@ routines :=								      \
+ 	posix_madvise							      \
+ 	get_child_max sched_cpucount sched_cpualloc sched_cpufree
+ 
++routines-$(OPTION_EGLIBC_WORDEXP) += wordexp
++
+ aux		:= init-posix environ
+-tests		:= tstgetopt testfnm runtests runptests	     \
++tests		:= tstgetopt testfnm runtests \
+ 		   tst-preadwrite tst-preadwrite64 test-vfork regexbug1 \
+-		   tst-mmap tst-getaddrinfo tst-truncate \
+-		   tst-truncate64 tst-fork tst-fnmatch tst-regexloc tst-dir \
+-		   tst-chmod bug-regex1 bug-regex2 bug-regex3 bug-regex4 \
+-		   tst-gnuglob tst-regex bug-regex5 bug-regex6 bug-regex7 \
+-		   bug-regex8 bug-regex9 bug-regex10 bug-regex11 bug-regex12 \
+-		   bug-regex13 bug-regex14 bug-regex15 bug-regex16 \
+-		   bug-regex17 bug-regex18 bug-regex19 bug-regex20 \
+-		   bug-regex21 bug-regex22 bug-regex23 bug-regex24 \
+-		   bug-regex25 bug-regex26 bug-regex27 bug-regex28 \
++		   tst-mmap tst-truncate \
++		   tst-truncate64 tst-fork tst-dir \
++		   tst-chmod bug-regex2 bug-regex3 bug-regex4 \
++		   tst-gnuglob bug-regex6 bug-regex7 \
++		   bug-regex8 bug-regex9 bug-regex10 bug-regex12 \
++		   bug-regex14 bug-regex15 \
++		   bug-regex21 bug-regex24 \
++		   bug-regex27 bug-regex28 \
+ 		   bug-regex29 bug-regex30 bug-regex31 bug-regex32 \
+-		   bug-regex33 tst-nice tst-nanosleep tst-regex2 \
+-		   transbug tst-rxspencer tst-pcre tst-boost \
+-		   bug-ga1 tst-vfork1 tst-vfork2 tst-vfork3 tst-waitid \
+-		   tst-getaddrinfo2 bug-glob1 bug-glob2 bug-glob3 tst-sysconf \
++		   tst-nice tst-nanosleep \
++		   transbug \
++		   tst-vfork1 tst-vfork2 tst-vfork3 tst-waitid \
++		   bug-glob1 bug-glob2 bug-glob3 tst-sysconf \
+ 		   tst-execvp1 tst-execvp2 tst-execlp1 tst-execlp2 \
+ 		   tst-execv1 tst-execv2 tst-execl1 tst-execl2 \
+ 		   tst-execve1 tst-execve2 tst-execle1 tst-execle2 \
+-		   tst-execvp3 tst-execvp4 tst-rfc3484 tst-rfc3484-2 \
+-		   tst-rfc3484-3 \
+-		   tst-getaddrinfo3 tst-fnmatch2 tst-cpucount tst-cpuset \
++		   tst-execvp3 tst-execvp4 \
++		   tst-fnmatch2 tst-cpucount tst-cpuset \
+ 		   bug-getopt1 bug-getopt2 bug-getopt3 bug-getopt4 \
+ 		   bug-getopt5 tst-getopt_long1 bug-regex34 bug-regex35 \
+ 		   tst-pathconf tst-getaddrinfo4 tst-rxspencer-no-utf8 \
+ 		   tst-fnmatch3 bug-regex36 tst-getaddrinfo5
+-xtests		:= bug-ga2
++
++tests-$(OPTION_EGLIBC_LOCALE_CODE) \
++		+= tst-fnmatch tst-regexloc bug-regex1 bug-regex5 \
++		   bug-regex23 bug-regex25 bug-regex32 bug-regex33
++tests-$(OPTION_EGLIBC_INET) \
++		+= tst-getaddrinfo bug-ga1 tst-getaddrinfo2 \
++		   tst-rfc3484 tst-rfc3484-2 tst-rfc3484-3 tst-getaddrinfo3
++tests-$(OPTION_POSIX_REGEXP_GLIBC) \
++		+= runptests bug-regex11 bug-regex13 bug-regex16 \
++		   tst-regex2 tst-rxspencer tst-pcre tst-boost
++ifeq (yy,$(OPTION_EGLIBC_LOCALE_CODE)$(OPTION_POSIX_REGEXP_GLIBC))
++tests		+= tst-regex bug-regex17 bug-regex18 bug-regex19 bug-regex20 \
++		   bug-regex22 bug-regex26
++endif
++xtests-$(OPTION_EGLIBC_INET) += bug-ga2
++
+ ifeq (yes,$(build-shared))
+ test-srcs	:= globtest
+-tests           += wordexp-test tst-exec tst-spawn
++tests		+= tst-exec
++tests-$(OPTION_EGLIBC_SPAWN) += tst-spawn
++tests-$(OPTION_EGLIBC_WORDEXP) += wordexp-test
+ endif
+ tests-static	= tst-exec-static tst-spawn-static
+ tests		+= $(tests-static)
+@@ -117,7 +147,10 @@ generated += $(addprefix wordexp-test-result, 1 2 3 4 5 6 7 8 9 10) \
+ 
+ ifeq ($(run-built-tests),yes)
+ ifeq (yes,$(build-shared))
+-tests-special += $(objpfx)globtest.out $(objpfx)wordexp-tst.out
++tests-special += $(objpfx)globtest.out
++ifeq (y,$(OPTION_EGLIBC_WORDEXP))
++tests-special += $(objpfx)wordexp-tst.out
++endif
+ endif
+ endif
+ 
+@@ -125,12 +158,16 @@ endif
+ # XXX Please note that for now we ignore the result of this test.
+ tests-special += $(objpfx)annexc.out
+ ifeq ($(run-built-tests),yes)
+-tests-special += $(objpfx)bug-regex2-mem.out $(objpfx)bug-regex14-mem.out \
++tests-special += $(objpfx)bug-regex2-mem.out \
+ 		 $(objpfx)bug-regex21-mem.out $(objpfx)bug-regex31-mem.out \
+-		 $(objpfx)tst-rxspencer-no-utf8-mem.out $(objpfx)tst-pcre-mem.out \
+-		 $(objpfx)tst-boost-mem.out $(objpfx)tst-getconf.out \
++		 $(objpfx)tst-getconf.out \
+ 		 $(objpfx)bug-glob2-mem.out $(objpfx)tst-vfork3-mem.out \
+ 		 $(objpfx)tst-fnmatch-mem.out $(objpfx)bug-regex36-mem.out
++ifeq (y,$(OPTION_POSIX_REGEXP_GLIBC))
++tests-special += $(objpfx)bug-regex14-mem.out $(objpfx)tst-rxspencer-no-utf8-mem.out \
++  		 $(objpfx)tst-pcre-mem.out $(objpfx)tst-boost-mem.out
++endif
++
+ xtests-special += $(objpfx)bug-ga2-mem.out
+ endif
+ 
+@@ -143,6 +180,8 @@ $(objpfx)globtest.out: globtest.sh $(objpfx)globtest
+ 	$(SHELL) $< $(common-objpfx) '$(test-via-rtld-prefix)' \
+ 		'$(test-program-prefix)' '$(test-wrapper-env)'; \
+ 	$(evaluate-test)
++LDLIBS-globtest += $(shell cat $(common-objpfx)nss/fixed-nsswitch-libs)
++
+ $(objpfx)wordexp-tst.out: wordexp-tst.sh $(objpfx)wordexp-test
+ 	$(SHELL) $< $(common-objpfx) '$(test-program-prefix-before-env)' \
+ 		 '$(run-program-env)' '$(test-program-prefix-after-env)'; \
+@@ -205,7 +244,10 @@ tst-dir-ARGS = `pwd` `cd $(common-objdir)/$(subdir); pwd` `cd $(common-objdir);
+ tst-chmod-ARGS = $(objdir)
+ tst-vfork3-ARGS = --test-dir=$(objpfx)
+ 
+-tst-rxspencer-ARGS = --utf8 rxspencer/tests
++tst-rxspencer-ARGS = rxspencer/tests
++ifeq (y,$(OPTION_EGLIBC_LOCALE_CODE))
++tst-rxspencer-ARGS += --utf8
++endif
+ tst-rxspencer-no-utf8-ARGS = rxspencer/tests
+ tst-pcre-ARGS = PCRE.tests
+ tst-boost-ARGS = BOOST.tests
+diff --git a/posix/bug-regex1.c b/posix/bug-regex1.c
+index 38eb543..17cd1a0 100644
+--- a/posix/bug-regex1.c
++++ b/posix/bug-regex1.c
 @@ -4,6 +4,7 @@
  #include <string.h>
  #include <regex.h>
@@ -4880,10 +5235,10 @@ Index: git/posix/bug-regex1.c
  
    re_set_syntax (RE_SYNTAX_POSIX_EGREP | RE_DEBUG);
  
-Index: git/posix/bug-regex6.c
-===================================================================
---- git.orig/posix/bug-regex6.c
-+++ git/posix/bug-regex6.c
+diff --git a/posix/bug-regex6.c b/posix/bug-regex6.c
+index efcc890..3b270c7 100644
+--- a/posix/bug-regex6.c
++++ b/posix/bug-regex6.c
 @@ -22,6 +22,7 @@
  #include <string.h>
  #include <sys/types.h>
@@ -4906,10 +5261,10 @@ Index: git/posix/bug-regex6.c
    const char *string = "http://www.regex.com/pattern/matching.html#intro";
    regmatch_t expect[10] = {
      { 0, 48 }, { 0, 5 }, { 0, 4 }, { 5, 20 }, { 7, 20 }, { 20, 42 },
-Index: git/posix/fnmatch.c
-===================================================================
---- git.orig/posix/fnmatch.c
-+++ git/posix/fnmatch.c
+diff --git a/posix/fnmatch.c b/posix/fnmatch.c
+index fd85efa..01cc9fe 100644
+--- a/posix/fnmatch.c
++++ b/posix/fnmatch.c
 @@ -30,6 +30,10 @@
  #include <ctype.h>
  #include <string.h>
@@ -4921,7 +5276,7 @@ Index: git/posix/fnmatch.c
  #if defined STDC_HEADERS || defined _LIBC
  # include <stdlib.h>
  #endif
-@@ -131,7 +135,7 @@ extern int fnmatch (const char *pattern,
+@@ -131,7 +135,7 @@ extern int fnmatch (const char *pattern, const char *string, int flags);
  #   define ISWCTYPE(WC, WT)	iswctype (WC, WT)
  #  endif
  
@@ -4930,10 +5285,10 @@ Index: git/posix/fnmatch.c
  /* In this case we are implementing the multibyte character handling.  */
  #   define HANDLE_MULTIBYTE	1
  #  endif
-Index: git/posix/fnmatch_loop.c
-===================================================================
---- git.orig/posix/fnmatch_loop.c
-+++ git/posix/fnmatch_loop.c
+diff --git a/posix/fnmatch_loop.c b/posix/fnmatch_loop.c
+index f46c9df..74e1754 100644
+--- a/posix/fnmatch_loop.c
++++ b/posix/fnmatch_loop.c
 @@ -15,6 +15,8 @@
     License along with the GNU C Library; if not, see
     <http://www.gnu.org/licenses/>.  */
@@ -4943,7 +5298,7 @@ Index: git/posix/fnmatch_loop.c
  #include <stdint.h>
  
  struct STRUCT
-@@ -54,10 +56,15 @@ FCT (pattern, string, string_end, no_lea
+@@ -54,10 +56,15 @@ FCT (pattern, string, string_end, no_leading_period, flags, ends, alloca_used)
    const char *collseq = (const char *)
      _NL_CURRENT(LC_COLLATE, _NL_COLLATE_COLLSEQWC);
  # else
@@ -4961,7 +5316,7 @@ Index: git/posix/fnmatch_loop.c
  
    while ((c = *p++) != L('\0'))
      {
-@@ -277,7 +284,7 @@ FCT (pattern, string, string_end, no_lea
+@@ -277,7 +284,7 @@ FCT (pattern, string, string_end, no_leading_period, flags, ends, alloca_used)
  		    /* Leave room for the null.  */
  		    CHAR str[CHAR_CLASS_MAX_LENGTH + 1];
  		    size_t c1 = 0;
@@ -4970,7 +5325,7 @@ Index: git/posix/fnmatch_loop.c
  		    wctype_t wt;
  #endif
  		    const CHAR *startp = p;
-@@ -307,7 +314,7 @@ FCT (pattern, string, string_end, no_lea
+@@ -307,7 +314,7 @@ FCT (pattern, string, string_end, no_leading_period, flags, ends, alloca_used)
  		      }
  		    str[c1] = L('\0');
  
@@ -4979,7 +5334,7 @@ Index: git/posix/fnmatch_loop.c
  		    wt = IS_CHAR_CLASS (str);
  		    if (wt == 0)
  		      /* Invalid character class name.  */
-@@ -680,8 +687,10 @@ FCT (pattern, string, string_end, no_lea
+@@ -680,8 +687,10 @@ FCT (pattern, string, string_end, no_leading_period, flags, ends, alloca_used)
  			else
  			  lcollseq = __collseq_table_lookup (collseq, cold);
  # else
@@ -4992,7 +5347,7 @@ Index: git/posix/fnmatch_loop.c
  # endif
  
  			is_seqval = 0;
-@@ -857,7 +866,7 @@ FCT (pattern, string, string_end, no_lea
+@@ -857,7 +866,7 @@ FCT (pattern, string, string_end, no_leading_period, flags, ends, alloca_used)
  				    goto matched;
  				  }
  # else
@@ -5001,10 +5356,10 @@ Index: git/posix/fnmatch_loop.c
  # endif
  			      }
  
-Index: git/posix/glob.c
-===================================================================
---- git.orig/posix/glob.c
-+++ git/posix/glob.c
+diff --git a/posix/glob.c b/posix/glob.c
+index d65e55d..1ac00a1 100644
+--- a/posix/glob.c
++++ b/posix/glob.c
 @@ -25,6 +25,9 @@
  #include <sys/types.h>
  #include <sys/stat.h>
@@ -5066,186 +5421,19 @@ Index: git/posix/glob.c
  	  if (home_dir == NULL || home_dir[0] == '\0')
  	    {
  	      if (flags & GLOB_TILDE_CHECK)
-Index: git/posix/Makefile
-===================================================================
---- git.orig/posix/Makefile
-+++ git/posix/Makefile
-@@ -18,6 +18,8 @@
- #
- #	Sub-makefile for POSIX portion of the library.
- #
-+include ../option-groups.mak
-+
- subdir	:= posix
- 
- include ../Makeconfig
-@@ -43,13 +45,24 @@ routines :=								      \
- 	getpgid setpgid getpgrp bsd-getpgrp setpgrp getsid setsid	      \
- 	getresuid getresgid setresuid setresgid				      \
- 	pathconf sysconf fpathconf					      \
--	glob glob64 fnmatch regex					      \
-+	glob glob64 fnmatch						      \
- 	confstr								      \
- 	getopt getopt1 getopt_init					      \
- 	sched_setp sched_getp sched_sets sched_gets sched_yield sched_primax  \
- 	sched_primin sched_rr_gi sched_getaffinity sched_setaffinity	      \
--	getaddrinfo gai_strerror wordexp				      \
- 	pread pwrite pread64 pwrite64					      \
-+	posix_madvise							      \
-+	get_child_max sched_cpucount sched_cpualloc sched_cpufree
-+
-+routines-$(OPTION_EGLIBC_INET) += getaddrinfo gai_strerror
-+
-+ifeq (y,$(OPTION_POSIX_REGEXP_GLIBC))
-+routines-$(OPTION_POSIX_REGEXP) += regex
-+else
-+routines-$(OPTION_POSIX_REGEXP) += xregex
-+endif
-+
-+routines-$(OPTION_EGLIBC_SPAWN) +=					      \
- 	spawn_faction_init spawn_faction_destroy spawn_faction_addclose	      \
- 	spawn_faction_addopen spawn_faction_adddup2			      \
- 	spawnattr_init spawnattr_destroy				      \
-@@ -61,37 +74,53 @@ routines :=								      \
- 	posix_madvise							      \
- 	get_child_max sched_cpucount sched_cpualloc sched_cpufree
- 
-+routines-$(OPTION_EGLIBC_WORDEXP) += wordexp
-+
- aux		:= init-posix environ
--tests		:= tstgetopt testfnm runtests runptests	     \
-+tests		:= tstgetopt testfnm runtests	\
- 		   tst-preadwrite tst-preadwrite64 test-vfork regexbug1 \
--		   tst-getlogin tst-mmap tst-getaddrinfo tst-truncate \
--		   tst-truncate64 tst-fork tst-fnmatch tst-regexloc tst-dir \
--		   tst-chmod bug-regex1 bug-regex2 bug-regex3 bug-regex4 \
--		   tst-gnuglob tst-regex bug-regex5 bug-regex6 bug-regex7 \
--		   bug-regex8 bug-regex9 bug-regex10 bug-regex11 bug-regex12 \
--		   bug-regex13 bug-regex14 bug-regex15 bug-regex16 \
--		   bug-regex17 bug-regex18 bug-regex19 bug-regex20 \
--		   bug-regex21 bug-regex22 bug-regex23 bug-regex24 \
--		   bug-regex25 bug-regex26 bug-regex27 bug-regex28 \
--		   bug-regex29 bug-regex30 bug-regex31 bug-regex32 \
--		   bug-regex33 tst-nice tst-nanosleep tst-regex2 \
--		   transbug tst-rxspencer tst-pcre tst-boost \
--		   bug-ga1 tst-vfork1 tst-vfork2 tst-vfork3 tst-waitid \
--		   tst-getaddrinfo2 bug-glob1 bug-glob2 bug-glob3 tst-sysconf \
-+		   tst-getlogin tst-mmap tst-truncate \
-+		   tst-truncate64 tst-fork tst-dir \
-+		   tst-chmod bug-regex2 bug-regex3 bug-regex4 \
-+		   tst-gnuglob bug-regex6 bug-regex7 \
-+		   bug-regex8 bug-regex9 bug-regex10 bug-regex12 \
-+		   bug-regex14 bug-regex15 \
-+		   bug-regex21 bug-regex24 \
-+		   bug-regex27 bug-regex28 \
-+		   bug-regex29 bug-regex30 bug-regex31 \
-+		   tst-nice tst-nanosleep \
-+		   transbug \
-+		   tst-vfork1 tst-vfork2 tst-vfork3 tst-waitid \
-+		   bug-glob1 bug-glob2 bug-glob3 tst-sysconf \
- 		   tst-execvp1 tst-execvp2 tst-execlp1 tst-execlp2 \
- 		   tst-execv1 tst-execv2 tst-execl1 tst-execl2 \
- 		   tst-execve1 tst-execve2 tst-execle1 tst-execle2 \
--		   tst-execvp3 tst-execvp4 tst-rfc3484 tst-rfc3484-2 \
--		   tst-rfc3484-3 \
--		   tst-getaddrinfo3 tst-fnmatch2 tst-cpucount tst-cpuset \
-+		   tst-execvp3 tst-execvp4 \
-+		   tst-fnmatch2 tst-cpucount tst-cpuset \
- 		   bug-getopt1 bug-getopt2 bug-getopt3 bug-getopt4 \
- 		   bug-getopt5 tst-getopt_long1 bug-regex34 bug-regex35 \
- 		   tst-pathconf tst-getaddrinfo4 tst-rxspencer-no-utf8 \
- 		   tst-fnmatch3 bug-regex36 tst-getaddrinfo5
--xtests		:= bug-ga2
-+tests-$(OPTION_EGLIBC_LOCALE_CODE)                                         \
-+	+= tst-fnmatch tst-regexloc bug-regex1 bug-regex5 \
-+	bug-regex23 bug-regex25 bug-regex32 bug-regex33
-+tests-$(OPTION_EGLIBC_INET) \
-+	+= tst-getaddrinfo bug-ga1 tst-getaddrinfo2 \
-+	tst-rfc3484 tst-rfc3484-2 tst-rfc3484-3 tst-getaddrinfo3
-+tests-$(OPTION_POSIX_REGEXP_GLIBC) \
-+	+= runptests bug-regex11 bug-regex13 bug-regex16 \
-+	tst-regex2 tst-rxspencer tst-pcre tst-boost
-+ifeq (yy,$(OPTION_EGLIBC_LOCALE_CODE)$(OPTION_POSIX_REGEXP_GLIBC))
-+tests	+= tst-regex bug-regex17 bug-regex18 bug-regex19 bug-regex20 \
-+	bug-regex22 bug-regex26
-+endif
-+xtests-$(OPTION_EGLIBC_INET) += bug-ga2
-+
- ifeq (yes,$(build-shared))
- test-srcs	:= globtest
--tests           += wordexp-test tst-exec tst-spawn
-+tests           += tst-exec
-+tests-$(OPTION_EGLIBC_SPAWN) += tst-spawn
-+tests-$(OPTION_EGLIBC_WORDEXP) += wordexp-test
- endif
- tests-static	= tst-exec-static tst-spawn-static
- tests		+= $(tests-static)
-@@ -117,7 +146,10 @@ generated += $(addprefix wordexp-test-re
- 
- ifeq ($(run-built-tests),yes)
- ifeq (yes,$(build-shared))
--tests-special += $(objpfx)globtest.out $(objpfx)wordexp-tst.out
-+tests-special += $(objpfx)globtest.out
-+ifeq (y,$(OPTION_EGLIBC_WORDEXP))
-+tests-special += $(objpfx)wordexp-tst.out
-+endif
- endif
- endif
- 
-@@ -125,12 +157,16 @@ endif
- # XXX Please note that for now we ignore the result of this test.
- tests-special += $(objpfx)annexc.out
- ifeq ($(run-built-tests),yes)
--tests-special += $(objpfx)bug-regex2-mem.out $(objpfx)bug-regex14-mem.out \
-+tests-special += $(objpfx)bug-regex2-mem.out \
- 		 $(objpfx)bug-regex21-mem.out $(objpfx)bug-regex31-mem.out \
--		 $(objpfx)tst-rxspencer-no-utf8-mem.out $(objpfx)tst-pcre-mem.out \
--		 $(objpfx)tst-boost-mem.out $(objpfx)tst-getconf.out \
-+		 $(objpfx)tst-getconf.out \
- 		 $(objpfx)bug-glob2-mem.out $(objpfx)tst-vfork3-mem.out \
- 		 $(objpfx)tst-fnmatch-mem.out $(objpfx)bug-regex36-mem.out
-+ifeq (y,$(OPTION_POSIX_REGEXP_GLIBC))
-+tests-special += $(objpfx)bug-regex14-mem.out $(objpfx)tst-rxspencer-no-utf8-mem.out \
-+  		 $(objpfx)tst-pcre-mem.out $(objpfx)tst-boost-mem.out
-+endif
-+
- xtests-special += $(objpfx)bug-ga2-mem.out
- endif
- 
-@@ -143,6 +179,8 @@ $(objpfx)globtest.out: globtest.sh $(obj
- 	$(SHELL) $< $(common-objpfx) '$(test-via-rtld-prefix)' \
- 		'$(test-program-prefix)' '$(test-wrapper-env)'; \
- 	$(evaluate-test)
-+LDLIBS-globtest += $(shell cat $(common-objpfx)nss/fixed-nsswitch-libs)
-+
- $(objpfx)wordexp-tst.out: wordexp-tst.sh $(objpfx)wordexp-test
- 	$(SHELL) $< $(common-objpfx) '$(test-program-prefix-before-env)' \
- 		 '$(run-program-env)' '$(test-program-prefix-after-env)'; \
-@@ -205,7 +243,10 @@ tst-dir-ARGS = `pwd` `cd $(common-objdir
- tst-chmod-ARGS = $(objdir)
- tst-vfork3-ARGS = --test-dir=$(objpfx)
- 
--tst-rxspencer-ARGS = --utf8 rxspencer/tests
-+tst-rxspencer-ARGS = rxspencer/tests
-+ifeq (y,$(OPTION_EGLIBC_LOCALE_CODE))
-+tst-rxspencer-ARGS += --utf8
-+endif
- tst-rxspencer-no-utf8-ARGS = rxspencer/tests
- tst-pcre-ARGS = PCRE.tests
- tst-boost-ARGS = BOOST.tests
-Index: git/posix/regcomp.c
-===================================================================
---- git.orig/posix/regcomp.c
-+++ git/posix/regcomp.c
-@@ -18,6 +18,7 @@
-    <http://www.gnu.org/licenses/>.  */
+diff --git a/posix/regcomp.c b/posix/regcomp.c
+index bf8aa16..6a41251 100644
+--- a/posix/regcomp.c
++++ b/posix/regcomp.c
+@@ -18,6 +18,7 @@
+    <http://www.gnu.org/licenses/>.  */
  
  #include <stdint.h>
 +#include <gnu/option-groups.h>
  
  #ifdef _LIBC
  # include <locale/weight.h>
-@@ -309,7 +310,7 @@ re_compile_fastmap_iter (regex_t *bufp,
+@@ -309,7 +310,7 @@ re_compile_fastmap_iter (regex_t *bufp, const re_dfastate_t *init_state,
  {
    re_dfa_t *dfa = (re_dfa_t *) bufp->buffer;
    int node_cnt;
@@ -5254,7 +5442,7 @@ Index: git/posix/regcomp.c
    for (node_cnt = 0; node_cnt < init_state->nodes.nelem; ++node_cnt)
      {
        int node = init_state->nodes.elems[node_cnt];
-@@ -319,9 +320,9 @@ re_compile_fastmap_iter (regex_t *bufp,
+@@ -319,9 +320,9 @@ re_compile_fastmap_iter (regex_t *bufp, const re_dfastate_t *init_state,
  	{
  	  re_set_fastmap (fastmap, icase, dfa->nodes[node].opr.c);
  #ifdef RE_ENABLE_I18N
@@ -5266,7 +5454,7 @@ Index: git/posix/regcomp.c
  	      wchar_t wc;
  	      mbstate_t state;
  
-@@ -352,7 +353,11 @@ re_compile_fastmap_iter (regex_t *bufp,
+@@ -352,7 +353,11 @@ re_compile_fastmap_iter (regex_t *bufp, const re_dfastate_t *init_state,
  		  re_set_fastmap (fastmap, icase, ch);
  	    }
  	}
@@ -5279,7 +5467,7 @@ Index: git/posix/regcomp.c
        else if (type == COMPLEX_BRACKET)
  	{
  	  re_charset_t *cset = dfa->nodes[node].opr.mbcset;
-@@ -380,7 +385,7 @@ re_compile_fastmap_iter (regex_t *bufp,
+@@ -380,7 +385,7 @@ re_compile_fastmap_iter (regex_t *bufp, const re_dfastate_t *init_state,
  	     i.e. where we would not find an invalid sequence.  This only
  	     applies to multibyte character sets; for single byte character
  	     sets, the SIMPLE_BRACKET again suffices.  */
@@ -5288,16 +5476,16 @@ Index: git/posix/regcomp.c
  	      && (cset->nchar_classes || cset->non_match || cset->nranges
  # ifdef _LIBC
  		  || cset->nequiv_classes
-@@ -408,7 +413,7 @@ re_compile_fastmap_iter (regex_t *bufp,
+@@ -408,7 +413,7 @@ re_compile_fastmap_iter (regex_t *bufp, const re_dfastate_t *init_state,
  		  memset (&state, '\0', sizeof (state));
  		  if (__wcrtomb (buf, cset->mbchars[i], &state) != (size_t) -1)
  		    re_set_fastmap (fastmap, icase, *(unsigned char *) buf);
 -		  if ((bufp->syntax & RE_ICASE) && dfa->mb_cur_max > 1)
 +		  if ((bufp->syntax & RE_ICASE) && dfa_mb_cur_max (dfa) > 1)
  		    {
- 		      if (__wcrtomb (buf, towlower (cset->mbchars[i]), &state)
+ 		      if (__wcrtomb (buf, __towlower (cset->mbchars[i]), &state)
  			  != (size_t) -1)
-@@ -417,7 +422,7 @@ re_compile_fastmap_iter (regex_t *bufp,
+@@ -417,7 +422,7 @@ re_compile_fastmap_iter (regex_t *bufp, const re_dfastate_t *init_state,
  		}
  	    }
  	}
@@ -5332,7 +5520,7 @@ Index: git/posix/regcomp.c
      {
        if (dfa->is_utf8)
  	dfa->sb_char = (re_bitset_ptr_t) utf8_sb_map;
-@@ -1788,7 +1797,7 @@ peek_token (re_token_t *token, re_string
+@@ -1788,7 +1797,7 @@ peek_token (re_token_t *token, re_string_t *input, reg_syntax_t syntax)
    token->word_char = 0;
  #ifdef RE_ENABLE_I18N
    token->mb_partial = 0;
@@ -5341,7 +5529,7 @@ Index: git/posix/regcomp.c
        !re_string_first_byte (input, re_string_cur_idx (input)))
      {
        token->type = CHARACTER;
-@@ -1809,7 +1818,7 @@ peek_token (re_token_t *token, re_string
+@@ -1809,7 +1818,7 @@ peek_token (re_token_t *token, re_string_t *input, reg_syntax_t syntax)
        token->opr.c = c2;
        token->type = CHARACTER;
  #ifdef RE_ENABLE_I18N
@@ -5350,7 +5538,7 @@ Index: git/posix/regcomp.c
  	{
  	  wint_t wc = re_string_wchar_at (input,
  					  re_string_cur_idx (input) + 1);
-@@ -1923,7 +1932,7 @@ peek_token (re_token_t *token, re_string
+@@ -1923,7 +1932,7 @@ peek_token (re_token_t *token, re_string_t *input, reg_syntax_t syntax)
  
    token->type = CHARACTER;
  #ifdef RE_ENABLE_I18N
@@ -5359,7 +5547,7 @@ Index: git/posix/regcomp.c
      {
        wint_t wc = re_string_wchar_at (input, re_string_cur_idx (input));
        token->word_char = IS_WIDE_WORD_CHAR (wc) != 0;
-@@ -2023,7 +2032,7 @@ peek_token_bracket (re_token_t *token, r
+@@ -2023,7 +2032,7 @@ peek_token_bracket (re_token_t *token, re_string_t *input, reg_syntax_t syntax)
    token->opr.c = c;
  
  #ifdef RE_ENABLE_I18N
@@ -5368,7 +5556,7 @@ Index: git/posix/regcomp.c
        !re_string_first_byte (input, re_string_cur_idx (input)))
      {
        token->type = CHARACTER;
-@@ -2246,7 +2255,7 @@ parse_expression (re_string_t *regexp, r
+@@ -2246,7 +2255,7 @@ parse_expression (re_string_t *regexp, regex_t *preg, re_token_t *token,
  	  return NULL;
  	}
  #ifdef RE_ENABLE_I18N
@@ -5377,7 +5565,7 @@ Index: git/posix/regcomp.c
  	{
  	  while (!re_string_eoi (regexp)
  		 && !re_string_first_byte (regexp, re_string_cur_idx (regexp)))
-@@ -2384,7 +2393,7 @@ parse_expression (re_string_t *regexp, r
+@@ -2384,7 +2393,7 @@ parse_expression (re_string_t *regexp, regex_t *preg, re_token_t *token,
  	  *err = REG_ESPACE;
  	  return NULL;
  	}
@@ -5386,7 +5574,7 @@ Index: git/posix/regcomp.c
  	dfa->has_mb_node = 1;
        break;
      case OP_WORD:
-@@ -2690,7 +2699,7 @@ build_range_exp (bitset_t sbcset, bracke
+@@ -2690,7 +2699,7 @@ build_range_exp (bitset_t sbcset, bracket_elem_t *start_elem,
         However, for !_LIBC we have no collation elements: if the
         character set is single byte, the single byte character set
         that we build below suffices.  parse_bracket_exp passes
@@ -5395,7 +5583,7 @@ Index: git/posix/regcomp.c
      if (mbcset)
        {
  	/* Check the space of the arrays.  */
-@@ -2786,7 +2795,13 @@ parse_bracket_exp (re_string_t *regexp,
+@@ -2786,7 +2795,13 @@ parse_bracket_exp (re_string_t *regexp, re_dfa_t *dfa, re_token_t *token,
  		   reg_syntax_t syntax, reg_errcode_t *err)
  {
  #ifdef _LIBC
@@ -5409,7 +5597,7 @@ Index: git/posix/regcomp.c
    const char *collseqwc;
    uint32_t nrules;
    int32_t table_size;
-@@ -2834,18 +2849,20 @@ parse_bracket_exp (re_string_t *regexp,
+@@ -2834,18 +2849,20 @@ parse_bracket_exp (re_string_t *regexp, re_dfa_t *dfa, re_token_t *token,
  	  if (MB_CUR_MAX == 1)
  	  */
  	  if (nrules == 0)
@@ -5431,7 +5619,7 @@ Index: git/posix/regcomp.c
        else if (br_elem->type == COLL_SYM)
  	{
  	  size_t sym_name_len = strlen ((char *) br_elem->opr.name);
-@@ -2876,11 +2893,11 @@ parse_bracket_exp (re_string_t *regexp,
+@@ -2876,11 +2893,11 @@ parse_bracket_exp (re_string_t *regexp, re_dfa_t *dfa, re_token_t *token,
  		{
  		  /* No valid character.  Match it as a single byte
  		     character.  */
@@ -5445,7 +5633,7 @@ Index: git/posix/regcomp.c
  	}
        return UINT_MAX;
      }
-@@ -2920,7 +2937,7 @@ parse_bracket_exp (re_string_t *regexp,
+@@ -2920,7 +2937,7 @@ parse_bracket_exp (re_string_t *regexp, re_dfa_t *dfa, re_token_t *token,
  	 However, if we have no collation elements, and the character set
  	 is single byte, the single byte character set that we
  	 build below suffices. */
@@ -5454,7 +5642,7 @@ Index: git/posix/regcomp.c
  	{
  	  /* Check the space of the arrays.  */
  	  if (BE (*range_alloc == mbcset->nranges, 0))
-@@ -2957,7 +2974,7 @@ parse_bracket_exp (re_string_t *regexp,
+@@ -2957,7 +2974,7 @@ parse_bracket_exp (re_string_t *regexp, re_dfa_t *dfa, re_token_t *token,
  	  if (MB_CUR_MAX == 1)
  	  */
  	  if (nrules == 0)
@@ -5463,7 +5651,7 @@ Index: git/posix/regcomp.c
  	  else
  	    ch_collseq = __collseq_table_lookup (collseqwc, __btowc (ch));
  	  if (start_collseq <= ch_collseq && ch_collseq <= end_collseq)
-@@ -3035,7 +3052,10 @@ parse_bracket_exp (re_string_t *regexp,
+@@ -3035,7 +3052,10 @@ parse_bracket_exp (re_string_t *regexp, re_dfa_t *dfa, re_token_t *token,
    re_bitset_ptr_t sbcset;
  #ifdef RE_ENABLE_I18N
    re_charset_t *mbcset;
@@ -5475,7 +5663,7 @@ Index: git/posix/regcomp.c
    int equiv_class_alloc = 0, char_class_alloc = 0;
  #endif /* not RE_ENABLE_I18N */
    int non_match = 0;
-@@ -3043,9 +3063,15 @@ parse_bracket_exp (re_string_t *regexp,
+@@ -3043,9 +3063,15 @@ parse_bracket_exp (re_string_t *regexp, re_dfa_t *dfa, re_token_t *token,
    int token_len;
    int first_round = 1;
  #ifdef _LIBC
@@ -5491,7 +5679,7 @@ Index: git/posix/regcomp.c
    if (nrules)
      {
        /*
-@@ -3175,7 +3201,7 @@ parse_bracket_exp (re_string_t *regexp,
+@@ -3175,7 +3201,7 @@ parse_bracket_exp (re_string_t *regexp, re_dfa_t *dfa, re_token_t *token,
  #else
  # ifdef RE_ENABLE_I18N
  	  *err = build_range_exp (sbcset,
@@ -5500,7 +5688,7 @@ Index: git/posix/regcomp.c
  				  &range_alloc, &start_elem, &end_elem);
  # else
  	  *err = build_range_exp (sbcset, &start_elem, &end_elem);
-@@ -3191,7 +3217,7 @@ parse_bracket_exp (re_string_t *regexp,
+@@ -3191,7 +3217,7 @@ parse_bracket_exp (re_string_t *regexp, re_dfa_t *dfa, re_token_t *token,
  	    case SB_CHAR:
  	      bitset_set (sbcset, start_elem.opr.ch);
  	      break;
@@ -5509,7 +5697,7 @@ Index: git/posix/regcomp.c
  	    case MB_CHAR:
  	      /* Check whether the array has enough space.  */
  	      if (BE (mbchar_alloc == mbcset->nmbchars, 0))
-@@ -3209,7 +3235,7 @@ parse_bracket_exp (re_string_t *regexp,
+@@ -3209,7 +3235,7 @@ parse_bracket_exp (re_string_t *regexp, re_dfa_t *dfa, re_token_t *token,
  		}
  	      mbcset->mbchars[mbcset->nmbchars++] = start_elem.opr.wch;
  	      break;
@@ -5518,7 +5706,7 @@ Index: git/posix/regcomp.c
  	    case EQUIV_CLASS:
  	      *err = build_equiv_class (sbcset,
  #ifdef RE_ENABLE_I18N
-@@ -3259,11 +3285,11 @@ parse_bracket_exp (re_string_t *regexp,
+@@ -3259,11 +3285,11 @@ parse_bracket_exp (re_string_t *regexp, re_dfa_t *dfa, re_token_t *token,
  
  #ifdef RE_ENABLE_I18N
    /* Ensure only single byte characters are set.  */
@@ -5532,7 +5720,7 @@ Index: git/posix/regcomp.c
  						     || mbcset->non_match)))
      {
        bin_tree_t *mbc_tree;
-@@ -3332,7 +3358,7 @@ parse_bracket_element (bracket_elem_t *e
+@@ -3332,7 +3358,7 @@ parse_bracket_element (bracket_elem_t *elem, re_string_t *regexp,
  		       re_token_t *token, int token_len, re_dfa_t *dfa,
  		       reg_syntax_t syntax, int accept_hyphen)
  {
@@ -5541,7 +5729,7 @@ Index: git/posix/regcomp.c
    int cur_char_size;
    cur_char_size = re_string_char_size_at (regexp, re_string_cur_idx (regexp));
    if (cur_char_size > 1)
-@@ -3342,7 +3368,7 @@ parse_bracket_element (bracket_elem_t *e
+@@ -3342,7 +3368,7 @@ parse_bracket_element (bracket_elem_t *elem, re_string_t *regexp,
        re_string_skip_bytes (regexp, cur_char_size);
        return REG_NOERROR;
      }
@@ -5550,7 +5738,7 @@ Index: git/posix/regcomp.c
    re_string_skip_bytes (regexp, token_len); /* Skip a token.  */
    if (token->type == OP_OPEN_COLL_ELEM || token->type == OP_OPEN_CHAR_CLASS
        || token->type == OP_OPEN_EQUIV_CLASS)
-@@ -3422,7 +3448,9 @@ build_equiv_class (bitset_t sbcset, re_c
+@@ -3422,7 +3448,9 @@ build_equiv_class (bitset_t sbcset, re_charset_t *mbcset,
  build_equiv_class (bitset_t sbcset, const unsigned char *name)
  #endif /* not RE_ENABLE_I18N */
  {
@@ -5561,7 +5749,7 @@ Index: git/posix/regcomp.c
    uint32_t nrules = _NL_CURRENT_WORD (LC_COLLATE, _NL_COLLATE_NRULES);
    if (nrules != 0)
      {
-@@ -3492,7 +3520,7 @@ build_equiv_class (bitset_t sbcset, cons
+@@ -3492,7 +3520,7 @@ build_equiv_class (bitset_t sbcset, const unsigned char *name)
        mbcset->equiv_classes[mbcset->nequiv_classes++] = idx1;
      }
    else
@@ -5570,7 +5758,7 @@ Index: git/posix/regcomp.c
      {
        if (BE (strlen ((const char *) name) != 1, 0))
  	return REG_ECOLLATE;
-@@ -3526,7 +3554,7 @@ build_charclass (RE_TRANSLATE_TYPE trans
+@@ -3526,7 +3554,7 @@ build_charclass (RE_TRANSLATE_TYPE trans, bitset_t sbcset,
        && (strcmp (name, "upper") == 0 || strcmp (name, "lower") == 0))
      name = "alpha";
  
@@ -5579,7 +5767,7 @@ Index: git/posix/regcomp.c
    /* Check the space of the arrays.  */
    if (BE (*char_class_alloc == mbcset->nchar_classes, 0))
      {
-@@ -3542,7 +3570,7 @@ build_charclass (RE_TRANSLATE_TYPE trans
+@@ -3542,7 +3570,7 @@ build_charclass (RE_TRANSLATE_TYPE trans, bitset_t sbcset,
        *char_class_alloc = new_char_class_alloc;
      }
    mbcset->char_classes[mbcset->nchar_classes++] = __wctype (name);
@@ -5588,7 +5776,7 @@ Index: git/posix/regcomp.c
  
  #define BUILD_CHARCLASS_LOOP(ctype_func)	\
    do {						\
-@@ -3653,7 +3681,7 @@ build_charclass_op (re_dfa_t *dfa, RE_TR
+@@ -3653,7 +3681,7 @@ build_charclass_op (re_dfa_t *dfa, RE_TRANSLATE_TYPE trans,
  
  #ifdef RE_ENABLE_I18N
    /* Ensure only single byte characters are set.  */
@@ -5597,7 +5785,7 @@ Index: git/posix/regcomp.c
      bitset_mask (sbcset, dfa->sb_char);
  #endif
  
-@@ -3665,7 +3693,7 @@ build_charclass_op (re_dfa_t *dfa, RE_TR
+@@ -3665,7 +3693,7 @@ build_charclass_op (re_dfa_t *dfa, RE_TRANSLATE_TYPE trans,
      goto build_word_op_espace;
  
  #ifdef RE_ENABLE_I18N
@@ -5606,343 +5794,95 @@ Index: git/posix/regcomp.c
      {
        bin_tree_t *mbc_tree;
        /* Build a tree for complex bracket.  */
-Index: git/posix/regexec.c
-===================================================================
---- git.orig/posix/regexec.c
-+++ git/posix/regexec.c
-@@ -18,6 +18,7 @@
-    <http://www.gnu.org/licenses/>.  */
+diff --git a/posix/regex.h b/posix/regex.h
+index 5b1981e..2941f94 100644
+--- a/posix/regex.h
++++ b/posix/regex.h
+@@ -21,6 +21,7 @@
+ #define _REGEX_H 1
  
- #include <stdint.h>
+ #include <sys/types.h>
 +#include <gnu/option-groups.h>
  
- static reg_errcode_t match_ctx_init (re_match_context_t *cache, int eflags,
- 				     int n) internal_function;
-@@ -186,11 +187,11 @@ static int build_trtable (const re_dfa_t
- static int check_node_accept_bytes (const re_dfa_t *dfa, int node_idx,
- 				    const re_string_t *input, int idx)
-      internal_function;
--# ifdef _LIBC
-+# if defined _LIBC && __OPTION_EGLIBC_LOCALE_CODE
- static unsigned int find_collation_sequence_value (const unsigned char *mbs,
- 						   size_t name_len)
-      internal_function;
--# endif /* _LIBC */
-+# endif /* _LIBC && __OPTION_EGLIBC_LOCALE_CODE */
- #endif /* RE_ENABLE_I18N */
- static int group_nodes_into_DFAstates (const re_dfa_t *dfa,
- 				       const re_dfastate_t *state,
-@@ -255,25 +256,9 @@ regexec (preg, string, nmatch, pmatch, e
-   return err != REG_NOERROR;
- }
+ /* Allow the use in C++ code.  */
+ #ifdef __cplusplus
+@@ -156,6 +157,8 @@ typedef unsigned long int reg_syntax_t;
+    treated as 'a\{1'.  */
+ # define RE_INVALID_INTERVAL_ORD (RE_DEBUG << 1)
  
--#ifdef _LIBC
--# include <shlib-compat.h>
--versioned_symbol (libc, __regexec, regexec, GLIBC_2_3_4);
--
--# if SHLIB_COMPAT (libc, GLIBC_2_0, GLIBC_2_3_4)
--__typeof__ (__regexec) __compat_regexec;
--
--int
--attribute_compat_text_section
--__compat_regexec (const regex_t *__restrict preg,
--		  const char *__restrict string, size_t nmatch,
--		  regmatch_t pmatch[], int eflags)
--{
--  return regexec (preg, string, nmatch, pmatch,
--		  eflags & (REG_NOTBOL | REG_NOTEOL));
--}
--compat_symbol (libc, __compat_regexec, regexec, GLIBC_2_0);
--# endif
--#endif
-+/* EGLIBC: The code that used to be here was move to a separate file
-+   so that it can be shared with xregex.c.  */
-+#include "regexec-compat.c"
++/* EGLIBC: Old regex implementation does not support these.  */
++# if __OPTION_POSIX_REGEXP_GLIBC
+ /* If this bit is set, then ignore case when matching.
+    If not set, then case is significant.  */
+ # define RE_ICASE (RE_INVALID_INTERVAL_ORD << 1)
+@@ -172,6 +175,7 @@ typedef unsigned long int reg_syntax_t;
+ /* If this bit is set, then no_sub will be set to 1 during
+    re_compile_pattern.  */
+ # define RE_NO_SUB (RE_CONTEXT_INVALID_DUP << 1)
++# endif /* __OPTION_POSIX_REGEXP_GLIBC */
+ #endif
  
- /* Entry points for GNU code.  */
+ /* This global variable defines the particular regexp syntax to use (for
+@@ -231,8 +235,13 @@ extern reg_syntax_t re_syntax_options;
+   (RE_CHAR_CLASSES | RE_DOT_NEWLINE      | RE_DOT_NOT_NULL		\
+    | RE_INTERVALS  | RE_NO_EMPTY_RANGES)
  
-@@ -728,7 +713,7 @@ re_search_internal (preg, string, length
-   incr = (range < 0) ? -1 : 1;
-   left_lim = (range < 0) ? start + range : start;
-   right_lim = (range < 0) ? start : start + range;
--  sb = dfa->mb_cur_max == 1;
-+  sb = dfa_mb_cur_max (dfa) == 1;
-   match_kind =
-     (fastmap
-      ? ((sb || !(preg->syntax & RE_ICASE || t) ? 4 : 0)
-@@ -3448,7 +3433,7 @@ out_free:
- 	  if (BE (dest_states_word[i] == NULL && err != REG_NOERROR, 0))
- 	    goto out_free;
++#if __OPTION_POSIX_REGEXP_GLIBC
+ #define RE_SYNTAX_POSIX_BASIC						\
+   (_RE_SYNTAX_POSIX_COMMON | RE_BK_PLUS_QM | RE_CONTEXT_INVALID_DUP)
++#else
++#define RE_SYNTAX_POSIX_BASIC						\
++  (_RE_SYNTAX_POSIX_COMMON | RE_BK_PLUS_QM)
++#endif
  
--	  if (dest_states[i] != dest_states_word[i] && dfa->mb_cur_max > 1)
-+	  if (dest_states[i] != dest_states_word[i] && dfa_mb_cur_max (dfa) > 1)
- 	    need_word_trtable = 1;
+ /* Differs from ..._POSIX_BASIC only in that RE_BK_PLUS_QM becomes
+    RE_LIMITED_OPS, i.e., \? \+ \| are not recognized.  Actually, this
+@@ -298,9 +307,11 @@ extern reg_syntax_t re_syntax_options;
+ /* Like REG_NOTBOL, except for the end-of-line.  */
+ #define REG_NOTEOL (1 << 1)
  
- 	  dest_states_nl[i] = re_acquire_state_context (&err, dfa, &follows,
-@@ -3590,7 +3575,7 @@ group_nodes_into_DFAstates (const re_dfa
-       else if (type == OP_PERIOD)
- 	{
- #ifdef RE_ENABLE_I18N
--	  if (dfa->mb_cur_max > 1)
-+	  if (dfa_mb_cur_max (dfa) > 1)
- 	    bitset_merge (accepts, dfa->sb_char);
- 	  else
- #endif
-@@ -3641,7 +3626,7 @@ group_nodes_into_DFAstates (const re_dfa
- 		  continue;
- 		}
- #ifdef RE_ENABLE_I18N
--	      if (dfa->mb_cur_max > 1)
-+	      if (dfa_mb_cur_max (dfa) > 1)
- 		for (j = 0; j < BITSET_WORDS; ++j)
- 		  any_set |= (accepts[j] &= (dfa->word_char[j] | ~dfa->sb_char[j]));
- 	      else
-@@ -3660,7 +3645,7 @@ group_nodes_into_DFAstates (const re_dfa
- 		  continue;
- 		}
- #ifdef RE_ENABLE_I18N
--	      if (dfa->mb_cur_max > 1)
-+	      if (dfa_mb_cur_max (dfa) > 1)
- 		for (j = 0; j < BITSET_WORDS; ++j)
- 		  any_set |= (accepts[j] &= ~(dfa->word_char[j] & dfa->sb_char[j]));
- 	      else
-@@ -3836,12 +3821,6 @@ check_node_accept_bytes (const re_dfa_t
-   if (node->type == COMPLEX_BRACKET)
-     {
-       const re_charset_t *cset = node->opr.mbcset;
--# ifdef _LIBC
--      const unsigned char *pin
--	= ((const unsigned char *) re_string_get_buffer (input) + str_idx);
--      int j;
--      uint32_t nrules;
--# endif /* _LIBC */
-       int match_len = 0;
-       wchar_t wc = ((cset->nranges || cset->nchar_classes || cset->nmbchars)
- 		    ? re_string_wchar_at (input, str_idx) : 0);
-@@ -3853,6 +3832,7 @@ check_node_accept_bytes (const re_dfa_t
- 	    match_len = char_len;
- 	    goto check_node_accept_bytes_match;
- 	  }
-+#if __OPTION_EGLIBC_LOCALE_CODE
-       /* match with character_class?  */
-       for (i = 0; i < cset->nchar_classes; ++i)
- 	{
-@@ -3863,14 +3843,22 @@ check_node_accept_bytes (const re_dfa_t
- 	      goto check_node_accept_bytes_match;
- 	    }
- 	}
-+#endif
-+
-+      /* When __OPTION_EGLIBC_LOCALE_CODE is disabled, only the C
-+         locale is supported; it has no collation rules.  */
-+# if defined _LIBC && __OPTION_EGLIBC_LOCALE_CODE
-+      const unsigned char *pin
-+	= ((const unsigned char *) re_string_get_buffer (input) + str_idx);
-+      int j;
-+      uint32_t nrules;
- 
--# ifdef _LIBC
-       nrules = _NL_CURRENT_WORD (LC_COLLATE, _NL_COLLATE_NRULES);
-       if (nrules != 0)
- 	{
- 	  unsigned int in_collseq = 0;
- 	  const int32_t *table, *indirect;
--	  const unsigned char *weights, *extra;
-+	  const unsigned char *weights, *extra = NULL;
- 	  const char *collseqwc;
- 
- 	  /* match with collating_symbol?  */
-@@ -3955,8 +3943,12 @@ check_node_accept_bytes (const re_dfa_t
- 	    }
- 	}
-       else
--# endif /* _LIBC */
-+# endif /* _LIBC && __OPTION_EGLIBC_LOCALE_CODE */
- 	{
-+          /* In the _LIBC version, if OPTION_EGLIBC_LOCALE_CODE is
-+             disabled, there can be no multibyte range endpoints, and
-+             cset->nranges is always zero.  */
-+#if __OPTION_EGLIBC_LOCALE_CODE
- 	  /* match with range expression?  */
- #if __GNUC__ >= 2
- 	  wchar_t cmp_buf[] = {L'\0', L'\0', wc, L'\0', L'\0', L'\0'};
-@@ -3975,6 +3967,7 @@ check_node_accept_bytes (const re_dfa_t
- 		  goto check_node_accept_bytes_match;
- 		}
- 	    }
-+#endif /* __OPTION_EGLIBC_LOCALE_CODE */
- 	}
-     check_node_accept_bytes_match:
-       if (!cset->non_match)
-@@ -3990,7 +3983,7 @@ check_node_accept_bytes (const re_dfa_t
-   return 0;
- }
- 
--# ifdef _LIBC
-+# if defined _LIBC && __OPTION_EGLIBC_LOCALE_CODE
- static unsigned int
- internal_function
- find_collation_sequence_value (const unsigned char *mbs, size_t mbs_len)
-@@ -4048,7 +4041,7 @@ find_collation_sequence_value (const uns
-       return UINT_MAX;
-     }
- }
--# endif /* _LIBC */
-+# endif /* _LIBC && __OPTION_EGLIBC_LOCALE_CODE */
- #endif /* RE_ENABLE_I18N */
- 
- /* Check whether the node accepts the byte which is IDX-th
-@@ -4139,7 +4132,7 @@ extend_buffers (re_match_context_t *mctx
-   if (pstr->icase)
-     {
- #ifdef RE_ENABLE_I18N
--      if (pstr->mb_cur_max > 1)
-+      if (string_mb_cur_max (pstr) > 1)
- 	{
- 	  ret = build_wcs_upper_buffer (pstr);
- 	  if (BE (ret != REG_NOERROR, 0))
-@@ -4152,7 +4145,7 @@ extend_buffers (re_match_context_t *mctx
-   else
-     {
- #ifdef RE_ENABLE_I18N
--      if (pstr->mb_cur_max > 1)
-+      if (string_mb_cur_max (pstr) > 1)
- 	build_wcs_buffer (pstr);
-       else
- #endif /* RE_ENABLE_I18N  */
-Index: git/posix/regexec-compat.c
-===================================================================
---- /dev/null
-+++ git/posix/regexec-compat.c
-@@ -0,0 +1,39 @@
-+/* Extended regular expression matching and search library.
-+   Copyright (C) 2008 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+   Contributed by Isamu Hasegawa <isamu@yamato.ibm.com>.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, write to the Free
-+   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
-+   02111-1307 USA.  */
-+
-+#ifdef _LIBC
-+# include <shlib-compat.h>
-+versioned_symbol (libc, __regexec, regexec, GLIBC_2_3_4);
-+
-+# if SHLIB_COMPAT (libc, GLIBC_2_0, GLIBC_2_3_4)
-+__typeof__ (__regexec) __compat_regexec;
-+
-+int
-+attribute_compat_text_section
-+__compat_regexec (const regex_t *__restrict preg,
-+		  const char *__restrict string, size_t nmatch,
-+		  regmatch_t pmatch[], int eflags)
-+{
-+  return regexec (preg, string, nmatch, pmatch,
-+		  eflags & (REG_NOTBOL | REG_NOTEOL));
-+}
-+compat_symbol (libc, __compat_regexec, regexec, GLIBC_2_0);
-+# endif
-+#endif
-Index: git/posix/regex.h
-===================================================================
---- git.orig/posix/regex.h
-+++ git/posix/regex.h
-@@ -21,6 +21,7 @@
- #define _REGEX_H 1
- 
- #include <sys/types.h>
-+#include <gnu/option-groups.h>
- 
- /* Allow the use in C++ code.  */
- #ifdef __cplusplus
-@@ -156,6 +157,8 @@ typedef unsigned long int reg_syntax_t;
-    treated as 'a\{1'.  */
- # define RE_INVALID_INTERVAL_ORD (RE_DEBUG << 1)
- 
-+/* EGLIBC: Old regex implementation does not support these.  */
-+# if __OPTION_POSIX_REGEXP_GLIBC
- /* If this bit is set, then ignore case when matching.
-    If not set, then case is significant.  */
- # define RE_ICASE (RE_INVALID_INTERVAL_ORD << 1)
-@@ -172,6 +175,7 @@ typedef unsigned long int reg_syntax_t;
- /* If this bit is set, then no_sub will be set to 1 during
-    re_compile_pattern.  */
- # define RE_NO_SUB (RE_CONTEXT_INVALID_DUP << 1)
-+# endif /* __OPTION_POSIX_REGEXP_GLIBC */
- #endif
- 
- /* This global variable defines the particular regexp syntax to use (for
-@@ -231,8 +235,13 @@ extern reg_syntax_t re_syntax_options;
-   (RE_CHAR_CLASSES | RE_DOT_NEWLINE      | RE_DOT_NOT_NULL		\
-    | RE_INTERVALS  | RE_NO_EMPTY_RANGES)
- 
-+#if __OPTION_POSIX_REGEXP_GLIBC
- #define RE_SYNTAX_POSIX_BASIC						\
-   (_RE_SYNTAX_POSIX_COMMON | RE_BK_PLUS_QM | RE_CONTEXT_INVALID_DUP)
-+#else
-+#define RE_SYNTAX_POSIX_BASIC						\
-+  (_RE_SYNTAX_POSIX_COMMON | RE_BK_PLUS_QM)
-+#endif
- 
- /* Differs from ..._POSIX_BASIC only in that RE_BK_PLUS_QM becomes
-    RE_LIMITED_OPS, i.e., \? \+ \| are not recognized.  Actually, this
-@@ -298,9 +307,11 @@ extern reg_syntax_t re_syntax_options;
- /* Like REG_NOTBOL, except for the end-of-line.  */
- #define REG_NOTEOL (1 << 1)
- 
-+#if __OPTION_POSIX_REGEXP_GLIBC
- /* Use PMATCH[0] to delimit the start and end of the search in the
-    buffer.  */
- #define REG_STARTEND (1 << 2)
-+#endif
- 
- 
- /* If any error codes are removed, changed, or added, update the
-Index: git/posix/regex_internal.c
-===================================================================
---- git.orig/posix/regex_internal.c
-+++ git/posix/regex_internal.c
-@@ -43,8 +43,8 @@ re_string_allocate (re_string_t *pstr, c
-   int init_buf_len;
- 
-   /* Ensure at least one character fits into the buffers.  */
--  if (init_len < dfa->mb_cur_max)
--    init_len = dfa->mb_cur_max;
-+  if (init_len < dfa_mb_cur_max (dfa))
-+    init_len = dfa_mb_cur_max (dfa);
-   init_buf_len = (len + 1 < init_len) ? len + 1: init_len;
-   re_string_construct_common (str, len, pstr, trans, icase, dfa);
- 
-@@ -55,7 +55,7 @@ re_string_allocate (re_string_t *pstr, c
-   pstr->word_char = dfa->word_char;
-   pstr->word_ops_used = dfa->word_ops_used;
-   pstr->mbs = pstr->mbs_allocated ? pstr->mbs : (unsigned char *) str;
--  pstr->valid_len = (pstr->mbs_allocated || dfa->mb_cur_max > 1) ? 0 : len;
-+  pstr->valid_len = (pstr->mbs_allocated || dfa_mb_cur_max (dfa) > 1) ? 0 : len;
-   pstr->valid_raw_len = pstr->valid_len;
-   return REG_NOERROR;
- }
-@@ -82,7 +82,7 @@ re_string_construct (re_string_t *pstr,
-   if (icase)
-     {
++#if __OPTION_POSIX_REGEXP_GLIBC
+ /* Use PMATCH[0] to delimit the start and end of the search in the
+    buffer.  */
+ #define REG_STARTEND (1 << 2)
++#endif
+ 
+ 
+ /* If any error codes are removed, changed, or added, update the
+diff --git a/posix/regex_internal.c b/posix/regex_internal.c
+index 8597d7e..d53b2a8 100644
+--- a/posix/regex_internal.c
++++ b/posix/regex_internal.c
+@@ -43,8 +43,8 @@ re_string_allocate (re_string_t *pstr, const char *str, int len, int init_len,
+   int init_buf_len;
+ 
+   /* Ensure at least one character fits into the buffers.  */
+-  if (init_len < dfa->mb_cur_max)
+-    init_len = dfa->mb_cur_max;
++  if (init_len < dfa_mb_cur_max (dfa))
++    init_len = dfa_mb_cur_max (dfa);
+   init_buf_len = (len + 1 < init_len) ? len + 1: init_len;
+   re_string_construct_common (str, len, pstr, trans, icase, dfa);
+ 
+@@ -55,7 +55,7 @@ re_string_allocate (re_string_t *pstr, const char *str, int len, int init_len,
+   pstr->word_char = dfa->word_char;
+   pstr->word_ops_used = dfa->word_ops_used;
+   pstr->mbs = pstr->mbs_allocated ? pstr->mbs : (unsigned char *) str;
+-  pstr->valid_len = (pstr->mbs_allocated || dfa->mb_cur_max > 1) ? 0 : len;
++  pstr->valid_len = (pstr->mbs_allocated || dfa_mb_cur_max (dfa) > 1) ? 0 : len;
+   pstr->valid_raw_len = pstr->valid_len;
+   return REG_NOERROR;
+ }
+@@ -82,7 +82,7 @@ re_string_construct (re_string_t *pstr, const char *str, int len,
+   if (icase)
+     {
  #ifdef RE_ENABLE_I18N
 -      if (dfa->mb_cur_max > 1)
 +      if (dfa_mb_cur_max (dfa) > 1)
  	{
  	  while (1)
  	    {
-@@ -91,7 +91,7 @@ re_string_construct (re_string_t *pstr,
+@@ -91,7 +91,7 @@ re_string_construct (re_string_t *pstr, const char *str, int len,
  		return ret;
  	      if (pstr->valid_raw_len >= len)
  		break;
@@ -5951,7 +5891,7 @@ Index: git/posix/regex_internal.c
  		break;
  	      ret = re_string_realloc_buffers (pstr, pstr->bufs_len * 2);
  	      if (BE (ret != REG_NOERROR, 0))
-@@ -105,7 +105,7 @@ re_string_construct (re_string_t *pstr,
+@@ -105,7 +105,7 @@ re_string_construct (re_string_t *pstr, const char *str, int len,
    else
      {
  #ifdef RE_ENABLE_I18N
@@ -5960,7 +5900,7 @@ Index: git/posix/regex_internal.c
  	build_wcs_buffer (pstr);
        else
  #endif /* RE_ENABLE_I18N  */
-@@ -130,7 +130,7 @@ internal_function __attribute_warn_unuse
+@@ -130,7 +130,7 @@ internal_function __attribute_warn_unused_result__
  re_string_realloc_buffers (re_string_t *pstr, int new_buf_len)
  {
  #ifdef RE_ENABLE_I18N
@@ -5969,7 +5909,7 @@ Index: git/posix/regex_internal.c
      {
        wint_t *new_wcs;
  
-@@ -177,7 +177,7 @@ re_string_construct_common (const char *
+@@ -177,7 +177,7 @@ re_string_construct_common (const char *str, int len, re_string_t *pstr,
    pstr->trans = trans;
    pstr->icase = icase ? 1 : 0;
    pstr->mbs_allocated = (trans != NULL || icase);
@@ -5996,7 +5936,7 @@ Index: git/posix/regex_internal.c
  	    {
  	      ch = pstr->raw_mbs [pstr->raw_mbs_idx + byte_idx + i];
  	      buf[i] = pstr->mbs[byte_idx + i] = pstr->trans[ch];
-@@ -275,7 +275,7 @@ build_wcs_upper_buffer (re_string_t *pst
+@@ -275,7 +275,7 @@ build_wcs_upper_buffer (re_string_t *pstr)
    size_t mbclen;
  #ifdef _LIBC
    char buf[MB_LEN_MAX];
@@ -6005,7 +5945,7 @@ Index: git/posix/regex_internal.c
  #else
    char buf[64];
  #endif
-@@ -369,7 +369,7 @@ build_wcs_upper_buffer (re_string_t *pst
+@@ -369,7 +369,7 @@ build_wcs_upper_buffer (re_string_t *pstr)
  	  {
  	    int i, ch;
  
@@ -6014,7 +5954,7 @@ Index: git/posix/regex_internal.c
  	      {
  		ch = pstr->raw_mbs [pstr->raw_mbs_idx + src_idx + i];
  		buf[i] = pstr->trans[ch];
-@@ -567,8 +567,9 @@ re_string_translate_buffer (re_string_t
+@@ -567,8 +567,9 @@ re_string_translate_buffer (re_string_t *pstr)
  }
  
  /* This function re-construct the buffers.
@@ -6026,7 +5966,7 @@ Index: git/posix/regex_internal.c
  
  static reg_errcode_t
  internal_function __attribute_warn_unused_result__
-@@ -579,7 +580,7 @@ re_string_reconstruct (re_string_t *pstr
+@@ -579,7 +580,7 @@ re_string_reconstruct (re_string_t *pstr, int idx, int eflags)
      {
        /* Reset buffer.  */
  #ifdef RE_ENABLE_I18N
@@ -6035,7 +5975,7 @@ Index: git/posix/regex_internal.c
  	memset (&pstr->cur_state, '\0', sizeof (mbstate_t));
  #endif /* RE_ENABLE_I18N */
        pstr->len = pstr->raw_len;
-@@ -670,7 +671,7 @@ re_string_reconstruct (re_string_t *pstr
+@@ -670,7 +671,7 @@ re_string_reconstruct (re_string_t *pstr, int idx, int eflags)
  	      pstr->tip_context = re_string_context_at (pstr, offset - 1,
  							eflags);
  #ifdef RE_ENABLE_I18N
@@ -6044,7 +5984,7 @@ Index: git/posix/regex_internal.c
  		memmove (pstr->wcs, pstr->wcs + offset,
  			 (pstr->valid_len - offset) * sizeof (wint_t));
  #endif /* RE_ENABLE_I18N */
-@@ -699,7 +700,7 @@ re_string_reconstruct (re_string_t *pstr
+@@ -699,7 +700,7 @@ re_string_reconstruct (re_string_t *pstr, int idx, int eflags)
  #endif
  	  pstr->valid_len = 0;
  #ifdef RE_ENABLE_I18N
@@ -6053,7 +5993,7 @@ Index: git/posix/regex_internal.c
  	    {
  	      int wcs_idx;
  	      wint_t wc = WEOF;
-@@ -711,7 +712,7 @@ re_string_reconstruct (re_string_t *pstr
+@@ -711,7 +712,7 @@ re_string_reconstruct (re_string_t *pstr, int idx, int eflags)
  		  /* Special case UTF-8.  Multi-byte chars start with any
  		     byte other than 0x80 - 0xbf.  */
  		  raw = pstr->raw_mbs + pstr->raw_mbs_idx;
@@ -6062,7 +6002,7 @@ Index: git/posix/regex_internal.c
  		  if (end < pstr->raw_mbs)
  		    end = pstr->raw_mbs;
  		  p = raw + offset - 1;
-@@ -803,7 +804,7 @@ re_string_reconstruct (re_string_t *pstr
+@@ -803,7 +804,7 @@ re_string_reconstruct (re_string_t *pstr, int idx, int eflags)
  
    /* Then build the buffers.  */
  #ifdef RE_ENABLE_I18N
@@ -6071,7 +6011,7 @@ Index: git/posix/regex_internal.c
      {
        if (pstr->icase)
  	{
-@@ -841,7 +842,7 @@ re_string_peek_byte_case (const re_strin
+@@ -841,7 +842,7 @@ re_string_peek_byte_case (const re_string_t *pstr, int idx)
      return re_string_peek_byte (pstr, idx);
  
  #ifdef RE_ENABLE_I18N
@@ -6080,7 +6020,7 @@ Index: git/posix/regex_internal.c
        && ! re_string_is_single_byte_char (pstr, pstr->cur_idx + idx))
      return re_string_peek_byte (pstr, idx);
  #endif
-@@ -930,7 +931,7 @@ re_string_context_at (const re_string_t
+@@ -930,7 +931,7 @@ re_string_context_at (const re_string_t *input, int idx, int eflags)
      return ((eflags & REG_NOTEOL) ? CONTEXT_ENDBUF
  	    : CONTEXT_NEWLINE | CONTEXT_ENDBUF);
  #ifdef RE_ENABLE_I18N
@@ -6089,7 +6029,7 @@ Index: git/posix/regex_internal.c
      {
        wint_t wc;
        int wc_idx = idx;
-@@ -1444,7 +1445,7 @@ re_dfa_add_node (re_dfa_t *dfa, re_token
+@@ -1444,7 +1445,7 @@ re_dfa_add_node (re_dfa_t *dfa, re_token_t token)
    dfa->nodes[dfa->nodes_len].constraint = 0;
  #ifdef RE_ENABLE_I18N
    dfa->nodes[dfa->nodes_len].accept_mb =
@@ -6098,10 +6038,10 @@ Index: git/posix/regex_internal.c
  #endif
    dfa->nexts[dfa->nodes_len] = -1;
    re_node_set_init_empty (dfa->edests + dfa->nodes_len);
-Index: git/posix/regex_internal.h
-===================================================================
---- git.orig/posix/regex_internal.h
-+++ git/posix/regex_internal.h
+diff --git a/posix/regex_internal.h b/posix/regex_internal.h
+index 154e969..c43909a 100644
+--- a/posix/regex_internal.h
++++ b/posix/regex_internal.h
 @@ -26,6 +26,10 @@
  #include <stdlib.h>
  #include <string.h>
@@ -6142,7 +6082,7 @@ Index: git/posix/regex_internal.h
  #define re_node_set_init_empty(set) memset (set, '\0', sizeof (re_node_set))
  #define re_node_set_remove(set,id) \
    (re_node_set_remove_at (set, re_node_set_contains (set, id) - 1))
-@@ -714,7 +733,7 @@ internal_function __attribute__ ((pure,
+@@ -714,7 +733,7 @@ internal_function __attribute__ ((pure, unused))
  re_string_char_size_at (const re_string_t *pstr, int idx)
  {
    int byte_idx;
@@ -6160,19 +6100,16 @@ Index: git/posix/regex_internal.h
      return (wint_t) pstr->mbs[idx];
    return (wint_t) pstr->wcs[idx];
  }
-Index: git/posix/xregex.c
-===================================================================
+diff --git a/posix/regexec-compat.c b/posix/regexec-compat.c
+new file mode 100644
+index 0000000..0f9b7c7
 --- /dev/null
-+++ git/posix/xregex.c
-@@ -0,0 +1,8215 @@
-+/* Extended regular expression matching and search library,
-+   version 0.12.
-+   (Implements POSIX draft P1003.2/D11.2, except for some of the
-+   internationalization features.)
-+
-+   Copyright (C) 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001,
-+   2002, 2005 Free Software Foundation, Inc.
++++ b/posix/regexec-compat.c
+@@ -0,0 +1,39 @@
++/* Extended regular expression matching and search library.
++   Copyright (C) 2008 Free Software Foundation, Inc.
 +   This file is part of the GNU C Library.
++   Contributed by Isamu Hasegawa <isamu@yamato.ibm.com>.
 +
 +   The GNU C Library is free software; you can redistribute it and/or
 +   modify it under the terms of the GNU Lesser General Public
@@ -6186,27 +6123,280 @@ Index: git/posix/xregex.c
 +
 +   You should have received a copy of the GNU Lesser General Public
 +   License along with the GNU C Library; if not, write to the Free
-+   Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
-+   02110-1301 USA.  */
-+
-+/* AIX requires this to be the first thing in the file. */
-+#if defined _AIX && !defined __GNUC__ && !defined REGEX_MALLOC
-+  #pragma alloca
-+#endif
-+
-+#undef	_GNU_SOURCE
-+#define _GNU_SOURCE
-+
-+#ifndef INSIDE_RECURSION
-+# ifdef HAVE_CONFIG_H
-+#  include <config.h>
-+# endif
-+#endif
-+
-+/*#include <ansidecl.h>*/
++   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
++   02111-1307 USA.  */
 +
++#ifdef _LIBC
++# include <shlib-compat.h>
++versioned_symbol (libc, __regexec, regexec, GLIBC_2_3_4);
 +
-+#ifndef INSIDE_RECURSION
++# if SHLIB_COMPAT (libc, GLIBC_2_0, GLIBC_2_3_4)
++__typeof__ (__regexec) __compat_regexec;
++
++int
++attribute_compat_text_section
++__compat_regexec (const regex_t *__restrict preg,
++		  const char *__restrict string, size_t nmatch,
++		  regmatch_t pmatch[], int eflags)
++{
++  return regexec (preg, string, nmatch, pmatch,
++		  eflags & (REG_NOTBOL | REG_NOTEOL));
++}
++compat_symbol (libc, __compat_regexec, regexec, GLIBC_2_0);
++# endif
++#endif
+diff --git a/posix/regexec.c b/posix/regexec.c
+index 70cd606..e3b49e4 100644
+--- a/posix/regexec.c
++++ b/posix/regexec.c
+@@ -18,6 +18,7 @@
+    <http://www.gnu.org/licenses/>.  */
+ 
+ #include <stdint.h>
++#include <gnu/option-groups.h>
+ 
+ static reg_errcode_t match_ctx_init (re_match_context_t *cache, int eflags,
+ 				     int n) internal_function;
+@@ -186,11 +187,11 @@ static int build_trtable (const re_dfa_t *dfa,
+ static int check_node_accept_bytes (const re_dfa_t *dfa, int node_idx,
+ 				    const re_string_t *input, int idx)
+      internal_function;
+-# ifdef _LIBC
++# if defined _LIBC && __OPTION_EGLIBC_LOCALE_CODE
+ static unsigned int find_collation_sequence_value (const unsigned char *mbs,
+ 						   size_t name_len)
+      internal_function;
+-# endif /* _LIBC */
++# endif /* _LIBC && __OPTION_EGLIBC_LOCALE_CODE */
+ #endif /* RE_ENABLE_I18N */
+ static int group_nodes_into_DFAstates (const re_dfa_t *dfa,
+ 				       const re_dfastate_t *state,
+@@ -255,25 +256,9 @@ regexec (preg, string, nmatch, pmatch, eflags)
+   return err != REG_NOERROR;
+ }
+ 
+-#ifdef _LIBC
+-# include <shlib-compat.h>
+-versioned_symbol (libc, __regexec, regexec, GLIBC_2_3_4);
+-
+-# if SHLIB_COMPAT (libc, GLIBC_2_0, GLIBC_2_3_4)
+-__typeof__ (__regexec) __compat_regexec;
+-
+-int
+-attribute_compat_text_section
+-__compat_regexec (const regex_t *__restrict preg,
+-		  const char *__restrict string, size_t nmatch,
+-		  regmatch_t pmatch[], int eflags)
+-{
+-  return regexec (preg, string, nmatch, pmatch,
+-		  eflags & (REG_NOTBOL | REG_NOTEOL));
+-}
+-compat_symbol (libc, __compat_regexec, regexec, GLIBC_2_0);
+-# endif
+-#endif
++/* EGLIBC: The code that used to be here was move to a separate file
++   so that it can be shared with xregex.c.  */
++#include "regexec-compat.c"
+ 
+ /* Entry points for GNU code.  */
+ 
+@@ -728,7 +713,7 @@ re_search_internal (preg, string, length, start, range, stop, nmatch, pmatch,
+   incr = (range < 0) ? -1 : 1;
+   left_lim = (range < 0) ? start + range : start;
+   right_lim = (range < 0) ? start : start + range;
+-  sb = dfa->mb_cur_max == 1;
++  sb = dfa_mb_cur_max (dfa) == 1;
+   match_kind =
+     (fastmap
+      ? ((sb || !(preg->syntax & RE_ICASE || t) ? 4 : 0)
+@@ -3448,7 +3433,7 @@ out_free:
+ 	  if (BE (dest_states_word[i] == NULL && err != REG_NOERROR, 0))
+ 	    goto out_free;
+ 
+-	  if (dest_states[i] != dest_states_word[i] && dfa->mb_cur_max > 1)
++	  if (dest_states[i] != dest_states_word[i] && dfa_mb_cur_max (dfa) > 1)
+ 	    need_word_trtable = 1;
+ 
+ 	  dest_states_nl[i] = re_acquire_state_context (&err, dfa, &follows,
+@@ -3590,7 +3575,7 @@ group_nodes_into_DFAstates (const re_dfa_t *dfa, const re_dfastate_t *state,
+       else if (type == OP_PERIOD)
+ 	{
+ #ifdef RE_ENABLE_I18N
+-	  if (dfa->mb_cur_max > 1)
++	  if (dfa_mb_cur_max (dfa) > 1)
+ 	    bitset_merge (accepts, dfa->sb_char);
+ 	  else
+ #endif
+@@ -3641,7 +3626,7 @@ group_nodes_into_DFAstates (const re_dfa_t *dfa, const re_dfastate_t *state,
+ 		  continue;
+ 		}
+ #ifdef RE_ENABLE_I18N
+-	      if (dfa->mb_cur_max > 1)
++	      if (dfa_mb_cur_max (dfa) > 1)
+ 		for (j = 0; j < BITSET_WORDS; ++j)
+ 		  any_set |= (accepts[j] &= (dfa->word_char[j] | ~dfa->sb_char[j]));
+ 	      else
+@@ -3660,7 +3645,7 @@ group_nodes_into_DFAstates (const re_dfa_t *dfa, const re_dfastate_t *state,
+ 		  continue;
+ 		}
+ #ifdef RE_ENABLE_I18N
+-	      if (dfa->mb_cur_max > 1)
++	      if (dfa_mb_cur_max (dfa) > 1)
+ 		for (j = 0; j < BITSET_WORDS; ++j)
+ 		  any_set |= (accepts[j] &= ~(dfa->word_char[j] & dfa->sb_char[j]));
+ 	      else
+@@ -3836,12 +3821,6 @@ check_node_accept_bytes (const re_dfa_t *dfa, int node_idx,
+   if (node->type == COMPLEX_BRACKET)
+     {
+       const re_charset_t *cset = node->opr.mbcset;
+-# ifdef _LIBC
+-      const unsigned char *pin
+-	= ((const unsigned char *) re_string_get_buffer (input) + str_idx);
+-      int j;
+-      uint32_t nrules;
+-# endif /* _LIBC */
+       int match_len = 0;
+       wchar_t wc = ((cset->nranges || cset->nchar_classes || cset->nmbchars)
+ 		    ? re_string_wchar_at (input, str_idx) : 0);
+@@ -3853,6 +3832,7 @@ check_node_accept_bytes (const re_dfa_t *dfa, int node_idx,
+ 	    match_len = char_len;
+ 	    goto check_node_accept_bytes_match;
+ 	  }
++#if __OPTION_EGLIBC_LOCALE_CODE
+       /* match with character_class?  */
+       for (i = 0; i < cset->nchar_classes; ++i)
+ 	{
+@@ -3863,14 +3843,22 @@ check_node_accept_bytes (const re_dfa_t *dfa, int node_idx,
+ 	      goto check_node_accept_bytes_match;
+ 	    }
+ 	}
++#endif
++
++      /* When __OPTION_EGLIBC_LOCALE_CODE is disabled, only the C
++         locale is supported; it has no collation rules.  */
++# if defined _LIBC && __OPTION_EGLIBC_LOCALE_CODE
++      const unsigned char *pin
++	= ((const unsigned char *) re_string_get_buffer (input) + str_idx);
++      int j;
++      uint32_t nrules;
+ 
+-# ifdef _LIBC
+       nrules = _NL_CURRENT_WORD (LC_COLLATE, _NL_COLLATE_NRULES);
+       if (nrules != 0)
+ 	{
+ 	  unsigned int in_collseq = 0;
+ 	  const int32_t *table, *indirect;
+-	  const unsigned char *weights, *extra;
++	  const unsigned char *weights, *extra = NULL;
+ 	  const char *collseqwc;
+ 
+ 	  /* match with collating_symbol?  */
+@@ -3955,8 +3943,12 @@ check_node_accept_bytes (const re_dfa_t *dfa, int node_idx,
+ 	    }
+ 	}
+       else
+-# endif /* _LIBC */
++# endif /* _LIBC && __OPTION_EGLIBC_LOCALE_CODE */
+ 	{
++          /* In the _LIBC version, if OPTION_EGLIBC_LOCALE_CODE is
++             disabled, there can be no multibyte range endpoints, and
++             cset->nranges is always zero.  */
++#if __OPTION_EGLIBC_LOCALE_CODE
+ 	  /* match with range expression?  */
+ #if __GNUC__ >= 2
+ 	  wchar_t cmp_buf[] = {L'\0', L'\0', wc, L'\0', L'\0', L'\0'};
+@@ -3975,6 +3967,7 @@ check_node_accept_bytes (const re_dfa_t *dfa, int node_idx,
+ 		  goto check_node_accept_bytes_match;
+ 		}
+ 	    }
++#endif /* __OPTION_EGLIBC_LOCALE_CODE */
+ 	}
+     check_node_accept_bytes_match:
+       if (!cset->non_match)
+@@ -3990,7 +3983,7 @@ check_node_accept_bytes (const re_dfa_t *dfa, int node_idx,
+   return 0;
+ }
+ 
+-# ifdef _LIBC
++# if defined _LIBC && __OPTION_EGLIBC_LOCALE_CODE
+ static unsigned int
+ internal_function
+ find_collation_sequence_value (const unsigned char *mbs, size_t mbs_len)
+@@ -4048,7 +4041,7 @@ find_collation_sequence_value (const unsigned char *mbs, size_t mbs_len)
+       return UINT_MAX;
+     }
+ }
+-# endif /* _LIBC */
++# endif /* _LIBC && __OPTION_EGLIBC_LOCALE_CODE */
+ #endif /* RE_ENABLE_I18N */
+ 
+ /* Check whether the node accepts the byte which is IDX-th
+@@ -4139,7 +4132,7 @@ extend_buffers (re_match_context_t *mctx, int min_len)
+   if (pstr->icase)
+     {
+ #ifdef RE_ENABLE_I18N
+-      if (pstr->mb_cur_max > 1)
++      if (string_mb_cur_max (pstr) > 1)
+ 	{
+ 	  ret = build_wcs_upper_buffer (pstr);
+ 	  if (BE (ret != REG_NOERROR, 0))
+@@ -4152,7 +4145,7 @@ extend_buffers (re_match_context_t *mctx, int min_len)
+   else
+     {
+ #ifdef RE_ENABLE_I18N
+-      if (pstr->mb_cur_max > 1)
++      if (string_mb_cur_max (pstr) > 1)
+ 	build_wcs_buffer (pstr);
+       else
+ #endif /* RE_ENABLE_I18N  */
+diff --git a/posix/xregex.c b/posix/xregex.c
+new file mode 100644
+index 0000000..d3f7ace
+--- /dev/null
++++ b/posix/xregex.c
+@@ -0,0 +1,8215 @@
++/* Extended regular expression matching and search library,
++   version 0.12.
++   (Implements POSIX draft P1003.2/D11.2, except for some of the
++   internationalization features.)
++
++   Copyright (C) 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001,
++   2002, 2005 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, write to the Free
++   Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
++   02110-1301 USA.  */
++
++/* AIX requires this to be the first thing in the file. */
++#if defined _AIX && !defined __GNUC__ && !defined REGEX_MALLOC
++  #pragma alloca
++#endif
++
++#undef	_GNU_SOURCE
++#define _GNU_SOURCE
++
++#ifndef INSIDE_RECURSION
++# ifdef HAVE_CONFIG_H
++#  include <config.h>
++# endif
++#endif
++
++/*#include <ansidecl.h>*/
++
++
++#ifndef INSIDE_RECURSION
 +
 +# if defined STDC_HEADERS && !defined emacs
 +#  include <stddef.h>
@@ -14380,10 +14570,10 @@ Index: git/posix/xregex.c
 +# undef WCHAR
 +
 +# define DEFINED_ONCE
-Index: git/pwd/Makefile
-===================================================================
---- git.orig/pwd/Makefile
-+++ git/pwd/Makefile
+diff --git a/pwd/Makefile b/pwd/Makefile
+index 7f6de03..916d546 100644
+--- a/pwd/Makefile
++++ b/pwd/Makefile
 @@ -18,6 +18,8 @@
  #
  #	Sub-makefile for pwd portion of the library.
@@ -14393,10 +14583,10 @@ Index: git/pwd/Makefile
  subdir	:= pwd
  
  include ../Makeconfig
-Index: git/resolv/Makefile
-===================================================================
---- git.orig/resolv/Makefile
-+++ git/resolv/Makefile
+diff --git a/resolv/Makefile b/resolv/Makefile
+index 1dcb75f..2e4b630 100644
+--- a/resolv/Makefile
++++ b/resolv/Makefile
 @@ -18,6 +18,8 @@
  #
  #	Sub-makefile for resolv portion of the library.
@@ -14406,7 +14596,7 @@ Index: git/resolv/Makefile
  subdir	:= resolv
  
  include ../Makeconfig
-@@ -27,20 +29,21 @@ headers	:= resolv.h \
+@@ -27,21 +29,22 @@ headers	:= resolv.h \
  	   arpa/nameser.h arpa/nameser_compat.h \
  	   sys/bitypes.h
  
@@ -14430,13 +14620,14 @@ Index: git/resolv/Makefile
 -routines += gai_sigqueue
 +extra-libs-$(OPTION_EGLIBC_INET_ANL) += libanl
 +routines-$(OPTION_EGLIBC_INET) += gai_sigqueue
+ tests += tst-res_hconf_reorder
  endif
 -extra-libs-others = $(extra-libs)
 +extra-libs-others-y += $(extra-libs-y)
  libresolv-routines := gethnamaddr res_comp res_debug	\
  		      res_data res_mkquery res_query res_send		\
  		      inet_net_ntop inet_net_pton inet_neta base64	\
-@@ -60,7 +63,7 @@ routines                += $(libnss_dns-
+@@ -61,7 +64,7 @@ routines                += $(libnss_dns-routines) $(libresolv-routines)
  static-only-routines    += $(libnss_dns-routines) $(libresolv-routines)
  endif
  
@@ -14445,79 +14636,17 @@ Index: git/resolv/Makefile
  tests: $(objpfx)ga_test
  endif
  
-Index: git/stdio-common/fxprintf.c
-===================================================================
---- git.orig/stdio-common/fxprintf.c
-+++ git/stdio-common/fxprintf.c
-@@ -23,6 +23,7 @@
- #include <wchar.h>
- #include <string.h>
- #include <libioP.h>
-+#include <gnu/option-groups.h>
- 
- 
- int
-@@ -37,6 +38,7 @@ __fxprintf (FILE *fp, const char *fmt, .
-   int res;
-   if (_IO_fwide (fp, 0) > 0)
-     {
-+#if __OPTION_POSIX_WIDE_CHAR_DEVICE_IO
-       size_t len = strlen (fmt) + 1;
-       wchar_t wfmt[len];
-       for (size_t i = 0; i < len; ++i)
-@@ -45,6 +47,9 @@ __fxprintf (FILE *fp, const char *fmt, .
- 	  wfmt[i] = fmt[i];
- 	}
-       res = __vfwprintf (fp, wfmt, ap);
-+#else
-+      abort();
-+#endif
-     }
-   else
-     res = _IO_vfprintf (fp, fmt, ap);
-Index: git/stdio-common/_i18n_number.h
-===================================================================
---- git.orig/stdio-common/_i18n_number.h
-+++ git/stdio-common/_i18n_number.h
-@@ -19,10 +19,13 @@
- #include <stdbool.h>
- #include <wchar.h>
- #include <wctype.h>
-+#include <gnu/option-groups.h>
- 
- #include "../locale/outdigits.h"
- #include "../locale/outdigitswc.h"
- 
-+#if __OPTION_EGLIBC_LOCALE_CODE
-+
- static CHAR_T *
- _i18n_number_rewrite (CHAR_T *w, CHAR_T *rear_ptr, CHAR_T *end)
- {
-@@ -115,3 +118,13 @@ _i18n_number_rewrite (CHAR_T *w, CHAR_T
- 
-   return w;
- }
-+
-+#else
-+
-+static CHAR_T *
-+_i18n_number_rewrite (CHAR_T *w, CHAR_T *rear_ptr, CHAR_T *end)
-+{
-+  return w;
-+}
-+
-+#endif
-Index: git/stdio-common/Makefile
-===================================================================
---- git.orig/stdio-common/Makefile
-+++ git/stdio-common/Makefile
-@@ -18,6 +18,8 @@
- #
- #	Specific makefile for stdio-common.
- #
-+include ../option-groups.mak
-+
- subdir	:= stdio-common
+diff --git a/stdio-common/Makefile b/stdio-common/Makefile
+index d0bf0e1..8655801 100644
+--- a/stdio-common/Makefile
++++ b/stdio-common/Makefile
+@@ -18,6 +18,8 @@
+ #
+ #	Specific makefile for stdio-common.
+ #
++include ../option-groups.mak
++
+ subdir	:= stdio-common
  
  include ../Makeconfig
 @@ -30,7 +32,7 @@ routines	:=							      \
@@ -14565,7 +14694,7 @@ Index: git/stdio-common/Makefile
 +	 bug19 tst-popen2 scanf14 scanf15 bug21 bug22 \
 +	 scanf16 scanf17 tst-setvbuf1 bug23 bug24 \
 +	 bug-vfprintf-nargs tst-sprintf3 \
- 	 bug25 tst-printf-round bug23-2 bug23-3 bug23-4 bug26
+ 	 bug25 tst-printf-round bug23-2 bug23-3 bug23-4 bug26 tst-fmemopen3
 +tests-$(OPTION_EGLIBC_LOCALE_CODE) \
 +	 += tst-sscanf tst-swprintf test-vfprintf bug14 scanf13 tst-grouping
 +tests-$(OPTION_POSIX_WIDE_CHAR_DEVICE_IO) \
@@ -14575,10 +14704,72 @@ Index: git/stdio-common/Makefile
  
  test-srcs = tst-unbputc tst-printf
  
-Index: git/stdio-common/printf_fp.c
-===================================================================
---- git.orig/stdio-common/printf_fp.c
-+++ git/stdio-common/printf_fp.c
+diff --git a/stdio-common/_i18n_number.h b/stdio-common/_i18n_number.h
+index 3c73044..ac62b3a 100644
+--- a/stdio-common/_i18n_number.h
++++ b/stdio-common/_i18n_number.h
+@@ -19,10 +19,13 @@
+ #include <stdbool.h>
+ #include <wchar.h>
+ #include <wctype.h>
++#include <gnu/option-groups.h>
+ 
+ #include "../locale/outdigits.h"
+ #include "../locale/outdigitswc.h"
+ 
++#if __OPTION_EGLIBC_LOCALE_CODE
++
+ static CHAR_T *
+ _i18n_number_rewrite (CHAR_T *w, CHAR_T *rear_ptr, CHAR_T *end)
+ {
+@@ -115,3 +118,13 @@ _i18n_number_rewrite (CHAR_T *w, CHAR_T *rear_ptr, CHAR_T *end)
+ 
+   return w;
+ }
++
++#else
++
++static CHAR_T *
++_i18n_number_rewrite (CHAR_T *w, CHAR_T *rear_ptr, CHAR_T *end)
++{
++  return w;
++}
++
++#endif
+diff --git a/stdio-common/fxprintf.c b/stdio-common/fxprintf.c
+index 7b2eb94..8476076 100644
+--- a/stdio-common/fxprintf.c
++++ b/stdio-common/fxprintf.c
+@@ -23,6 +23,7 @@
+ #include <wchar.h>
+ #include <string.h>
+ #include <libioP.h>
++#include <gnu/option-groups.h>
+ 
+ 
+ int
+@@ -37,6 +38,7 @@ __fxprintf (FILE *fp, const char *fmt, ...)
+   int res;
+   if (_IO_fwide (fp, 0) > 0)
+     {
++#if __OPTION_POSIX_WIDE_CHAR_DEVICE_IO
+       size_t len = strlen (fmt) + 1;
+       wchar_t wfmt[len];
+       for (size_t i = 0; i < len; ++i)
+@@ -45,6 +47,9 @@ __fxprintf (FILE *fp, const char *fmt, ...)
+ 	  wfmt[i] = fmt[i];
+ 	}
+       res = __vfwprintf (fp, wfmt, ap);
++#else
++      abort();
++#endif
+     }
+   else
+     res = _IO_vfprintf (fp, fmt, ap);
+diff --git a/stdio-common/printf_fp.c b/stdio-common/printf_fp.c
+index 3023b20..bd0df66 100644
+--- a/stdio-common/printf_fp.c
++++ b/stdio-common/printf_fp.c
 @@ -39,6 +39,7 @@
  #include <unistd.h>
  #include <stdlib.h>
@@ -14587,7 +14778,7 @@ Index: git/stdio-common/printf_fp.c
  #include <stdbool.h>
  #include <rounding-mode.h>
  
-@@ -142,6 +143,10 @@ extern mp_size_t __mpn_extract_long_doub
+@@ -142,6 +143,10 @@ extern mp_size_t __mpn_extract_long_double (mp_ptr res_ptr, mp_size_t size,
  extern unsigned int __guess_grouping (unsigned int intdig_max,
  				      const char *grouping);
  
@@ -14645,10 +14836,10 @@ Index: git/stdio-common/printf_fp.c
  
    /* Fetch the argument value.	*/
  #ifndef __NO_LONG_DOUBLE_MATH
-Index: git/stdio-common/printf_fphex.c
-===================================================================
---- git.orig/stdio-common/printf_fphex.c
-+++ git/stdio-common/printf_fphex.c
+diff --git a/stdio-common/printf_fphex.c b/stdio-common/printf_fphex.c
+index 6c3b5e9..f660ce0 100644
+--- a/stdio-common/printf_fphex.c
++++ b/stdio-common/printf_fphex.c
 @@ -28,6 +28,7 @@
  #include <_itoa.h>
  #include <_itowa.h>
@@ -14687,10 +14878,10 @@ Index: git/stdio-common/printf_fphex.c
  
  
    /* Fetch the argument value.	*/
-Index: git/stdio-common/printf_size.c
-===================================================================
---- git.orig/stdio-common/printf_size.c
-+++ git/stdio-common/printf_size.c
+diff --git a/stdio-common/printf_size.c b/stdio-common/printf_size.c
+index 7dcd58e..6fb7491 100644
+--- a/stdio-common/printf_size.c
++++ b/stdio-common/printf_size.c
 @@ -23,6 +23,7 @@
  #include <math.h>
  #include <printf.h>
@@ -14699,7 +14890,7 @@ Index: git/stdio-common/printf_size.c
  
  
  /* This defines make it possible to use the same code for GNU C library and
-@@ -116,7 +117,14 @@ __printf_size (FILE *fp, const struct pr
+@@ -116,7 +117,14 @@ __printf_size (FILE *fp, const struct printf_info *info,
  
    struct printf_info fp_info;
    int done = 0;
@@ -14714,10 +14905,10 @@ Index: git/stdio-common/printf_size.c
    int res;
  
    /* Fetch the argument value.	*/
-Index: git/stdio-common/scanf14.c
-===================================================================
---- git.orig/stdio-common/scanf14.c
-+++ git/stdio-common/scanf14.c
+diff --git a/stdio-common/scanf14.c b/stdio-common/scanf14.c
+index cffccb0..6cc260a 100644
+--- a/stdio-common/scanf14.c
++++ b/stdio-common/scanf14.c
 @@ -3,6 +3,7 @@
  #include <string.h>
  #include <wchar.h>
@@ -14742,54 +14933,10 @@ Index: git/stdio-common/scanf14.c
    if (sscanf ("4.25[0-9.] x", "%a[0-9.]%8c", &sp, c) != 2)
      FAIL ();
    else
-Index: git/stdio-common/tstdiomisc.c
-===================================================================
---- git.orig/stdio-common/tstdiomisc.c
-+++ git/stdio-common/tstdiomisc.c
-@@ -4,6 +4,7 @@
- #include <string.h>
- #include <wchar.h>
- #include <libc-internal.h>
-+#include <gnu/option-groups.h>
- 
- static int
- t1 (void)
-@@ -134,6 +135,7 @@ F (void)
-   printf ("expected \"-inf -INF -inf -INF -inf -INF -inf -INF\", got \"%s\"\n",
- 	  buf);
- 
-+#if __OPTION_POSIX_C_LANG_WIDE_CHAR
-   swprintf (wbuf, sizeof wbuf / sizeof (wbuf[0]), L"%a %A %e %E %f %F %g %G",
- 	    qnanval, qnanval, qnanval, qnanval,
- 	    qnanval, qnanval, qnanval, qnanval);
-@@ -171,6 +173,7 @@ F (void)
-   result |= wcscmp (wbuf, L"-inf -INF -inf -INF -inf -INF -inf -INF") != 0;
-   printf ("expected L\"-inf -INF -inf -INF -inf -INF -inf -INF\", got L\"%S\"\n",
- 	  wbuf);
-+#endif /* __OPTION_POSIX_C_LANG_WIDE_CHAR */
- 
-   lqnanval = NAN;
- 
-@@ -215,6 +218,7 @@ F (void)
-   printf ("expected \"-inf -INF -inf -INF -inf -INF -inf -INF\", got \"%s\"\n",
- 	  buf);
- 
-+#if __OPTION_POSIX_C_LANG_WIDE_CHAR
-   swprintf (wbuf, sizeof wbuf / sizeof (wbuf[0]),
- 	    L"%La %LA %Le %LE %Lf %LF %Lg %LG",
- 	    lqnanval, lqnanval, lqnanval, lqnanval,
-@@ -259,6 +263,7 @@ F (void)
-   result |= wcscmp (wbuf, L"-inf -INF -inf -INF -inf -INF -inf -INF") != 0;
-   printf ("expected L\"-inf -INF -inf -INF -inf -INF -inf -INF\", got L\"%S\"\n",
- 	  wbuf);
-+#endif /* __OPTION_POSIX_C_LANG_WIDE_CHAR */
- 
-   return result;
- }
-Index: git/stdio-common/tst-popen.c
-===================================================================
---- git.orig/stdio-common/tst-popen.c
-+++ git/stdio-common/tst-popen.c
+diff --git a/stdio-common/tst-popen.c b/stdio-common/tst-popen.c
+index 5def27f..7c9b91e 100644
+--- a/stdio-common/tst-popen.c
++++ b/stdio-common/tst-popen.c
 @@ -19,6 +19,7 @@
  #include <stdio.h>
  #include <string.h>
@@ -14813,10 +14960,10 @@ Index: git/stdio-common/tst-popen.c
  
    if (getline (&line, &len, f) != 5)
      {
-Index: git/stdio-common/tst-sprintf.c
-===================================================================
---- git.orig/stdio-common/tst-sprintf.c
-+++ git/stdio-common/tst-sprintf.c
+diff --git a/stdio-common/tst-sprintf.c b/stdio-common/tst-sprintf.c
+index d5284b9..f1e3d21 100644
+--- a/stdio-common/tst-sprintf.c
++++ b/stdio-common/tst-sprintf.c
 @@ -3,7 +3,7 @@
  #include <locale.h>
  #include <string.h>
@@ -14841,10 +14988,54 @@ Index: git/stdio-common/tst-sprintf.c
  
  #define SIZE (1024*70000)
  #define STR(x) #x
-Index: git/stdio-common/vfprintf.c
-===================================================================
---- git.orig/stdio-common/vfprintf.c
-+++ git/stdio-common/vfprintf.c
+diff --git a/stdio-common/tstdiomisc.c b/stdio-common/tstdiomisc.c
+index 5548a71..31ed024 100644
+--- a/stdio-common/tstdiomisc.c
++++ b/stdio-common/tstdiomisc.c
+@@ -4,6 +4,7 @@
+ #include <string.h>
+ #include <wchar.h>
+ #include <libc-internal.h>
++#include <gnu/option-groups.h>
+ 
+ static int
+ t1 (void)
+@@ -134,6 +135,7 @@ F (void)
+   printf ("expected \"-inf -INF -inf -INF -inf -INF -inf -INF\", got \"%s\"\n",
+ 	  buf);
+ 
++#if __OPTION_POSIX_C_LANG_WIDE_CHAR
+   swprintf (wbuf, sizeof wbuf / sizeof (wbuf[0]), L"%a %A %e %E %f %F %g %G",
+ 	    qnanval, qnanval, qnanval, qnanval,
+ 	    qnanval, qnanval, qnanval, qnanval);
+@@ -171,6 +173,7 @@ F (void)
+   result |= wcscmp (wbuf, L"-inf -INF -inf -INF -inf -INF -inf -INF") != 0;
+   printf ("expected L\"-inf -INF -inf -INF -inf -INF -inf -INF\", got L\"%S\"\n",
+ 	  wbuf);
++#endif /* __OPTION_POSIX_C_LANG_WIDE_CHAR */
+ 
+   lqnanval = NAN;
+ 
+@@ -215,6 +218,7 @@ F (void)
+   printf ("expected \"-inf -INF -inf -INF -inf -INF -inf -INF\", got \"%s\"\n",
+ 	  buf);
+ 
++#if __OPTION_POSIX_C_LANG_WIDE_CHAR
+   swprintf (wbuf, sizeof wbuf / sizeof (wbuf[0]),
+ 	    L"%La %LA %Le %LE %Lf %LF %Lg %LG",
+ 	    lqnanval, lqnanval, lqnanval, lqnanval,
+@@ -259,6 +263,7 @@ F (void)
+   result |= wcscmp (wbuf, L"-inf -INF -inf -INF -inf -INF -inf -INF") != 0;
+   printf ("expected L\"-inf -INF -inf -INF -inf -INF -inf -INF\", got L\"%S\"\n",
+ 	  wbuf);
++#endif /* __OPTION_POSIX_C_LANG_WIDE_CHAR */
+ 
+   return result;
+ }
+diff --git a/stdio-common/vfprintf.c b/stdio-common/vfprintf.c
+index 0592e70..f21d973 100644
+--- a/stdio-common/vfprintf.c
++++ b/stdio-common/vfprintf.c
 @@ -29,6 +29,7 @@
  #include <_itoa.h>
  #include <locale/localeinfo.h>
@@ -14853,7 +15044,7 @@ Index: git/stdio-common/vfprintf.c
  
  /* This code is shared between the standard stdio implementation found
     in GNU C library and the libio implementation originally found in
-@@ -138,6 +139,18 @@
+@@ -140,6 +141,18 @@ typedef wchar_t THOUSANDS_SEP_T;
  # define EOF WEOF
  #endif
  
@@ -14872,7 +15063,7 @@ Index: git/stdio-common/vfprintf.c
  #include "_i18n_number.h"
  
  /* Include the shared code for parsing the format string.  */
-@@ -1129,8 +1142,11 @@ vfprintf (FILE *s, const CHAR_T *format,
+@@ -1065,8 +1078,11 @@ static const uint8_t jump_table[] =
  # define process_string_arg(fspec) \
      LABEL (form_character):						      \
        /* Character.  */							      \
@@ -14886,7 +15077,7 @@ Index: git/stdio-common/vfprintf.c
        --width;	/* Account for the character itself.  */		      \
        if (!left)							      \
  	PAD (' ');							      \
-@@ -1143,6 +1159,7 @@ vfprintf (FILE *s, const CHAR_T *format,
+@@ -1079,6 +1095,7 @@ static const uint8_t jump_table[] =
        break;								      \
  									      \
      LABEL (form_wcharacter):						      \
@@ -14894,7 +15085,7 @@ Index: git/stdio-common/vfprintf.c
        {									      \
  	/* Wide character.  */						      \
  	char buf[MB_CUR_MAX];						      \
-@@ -1209,6 +1226,7 @@ vfprintf (FILE *s, const CHAR_T *format,
+@@ -1145,6 +1162,7 @@ static const uint8_t jump_table[] =
  	  }								      \
  	else								      \
  	  {								      \
@@ -14902,7 +15093,7 @@ Index: git/stdio-common/vfprintf.c
  	    const wchar_t *s2 = (const wchar_t *) string;		      \
  	    mbstate_t mbstate;						      \
  									      \
-@@ -1409,7 +1427,9 @@ vfprintf (FILE *s, const CHAR_T *format,
+@@ -1399,7 +1417,9 @@ vfprintf (FILE *s, const CHAR_T *format, va_list ap)
      LABEL (flag_quote):
        group = 1;
  
@@ -14913,21 +15104,22 @@ Index: git/stdio-common/vfprintf.c
  	{
  #ifdef COMPILE_WPRINTF
  	  thousands_sep = _NL_CURRENT_WORD (LC_NUMERIC,
-@@ -1708,7 +1728,9 @@ do_positional:
-       free (workstart);
-     workstart = NULL;
- 
--    if (grouping == (const char *) -1)
-+    if (! LOCALE_SUPPORT)
-+      grouping = NULL;
-+    else if (grouping == (const char *) -1)
-       {
+@@ -1728,8 +1748,9 @@ printf_positional (_IO_FILE *s, const CHAR_T *format, int readonly_format,
+   size_t cnt;
+ 
+   CHAR_T *workstart = NULL;
+-
+-  if (grouping == (const char *) -1)
++  if (! LOCALE_SUPPORT)
++    grouping = NULL;
++  else if (grouping == (const char *) -1)
+     {
  #ifdef COMPILE_WPRINTF
- 	thousands_sep = _NL_CURRENT_WORD (LC_NUMERIC,
-Index: git/stdio-common/vfscanf.c
-===================================================================
---- git.orig/stdio-common/vfscanf.c
-+++ git/stdio-common/vfscanf.c
+       thousands_sep = _NL_CURRENT_WORD (LC_NUMERIC,
+diff --git a/stdio-common/vfscanf.c b/stdio-common/vfscanf.c
+index 0e204e7..66cc0af 100644
+--- a/stdio-common/vfscanf.c
++++ b/stdio-common/vfscanf.c
 @@ -29,6 +29,7 @@
  #include <wctype.h>
  #include <bits/libc-lock.h>
@@ -14949,7 +15141,7 @@ Index: git/stdio-common/vfscanf.c
  #define encode_error() do {						      \
  			  errval = 4;					      \
  			  __set_errno (EILSEQ);				      \
-@@ -316,24 +323,35 @@ _IO_vfscanf_internal (_IO_FILE *s, const
+@@ -316,24 +323,35 @@ _IO_vfscanf_internal (_IO_FILE *s, const char *format, _IO_va_list argptr,
    ARGCHECK (s, format);
  
   {
@@ -14992,7 +15184,7 @@ Index: git/stdio-common/vfscanf.c
   }
  
    /* Lock the stream.  */
-@@ -385,6 +403,8 @@ _IO_vfscanf_internal (_IO_FILE *s, const
+@@ -385,6 +403,8 @@ _IO_vfscanf_internal (_IO_FILE *s, const char *format, _IO_va_list argptr,
  #ifndef COMPILE_WSCANF
        if (!isascii ((unsigned char) *f))
  	{
@@ -15001,7 +15193,7 @@ Index: git/stdio-common/vfscanf.c
  	  /* Non-ASCII, may be a multibyte.  */
  	  int len = __mbrlen (f, strlen (f), &state);
  	  if (len > 0)
-@@ -830,6 +850,8 @@ _IO_vfscanf_internal (_IO_FILE *s, const
+@@ -830,6 +850,8 @@ _IO_vfscanf_internal (_IO_FILE *s, const char *format, _IO_va_list argptr,
  	    }
  	  /* FALLTHROUGH */
  	case L_('C'):
@@ -15010,7 +15202,7 @@ Index: git/stdio-common/vfscanf.c
  	  if (width == -1)
  	    width = 1;
  
-@@ -1172,6 +1194,8 @@ _IO_vfscanf_internal (_IO_FILE *s, const
+@@ -1172,6 +1194,8 @@ _IO_vfscanf_internal (_IO_FILE *s, const char *format, _IO_va_list argptr,
  	  /* FALLTHROUGH */
  
  	case L_('S'):
@@ -15019,7 +15211,7 @@ Index: git/stdio-common/vfscanf.c
  	  {
  #ifndef COMPILE_WSCANF
  	    mbstate_t cstate;
-@@ -1419,10 +1443,17 @@ _IO_vfscanf_internal (_IO_FILE *s, const
+@@ -1419,10 +1443,17 @@ _IO_vfscanf_internal (_IO_FILE *s, const char *format, _IO_va_list argptr,
  	      const char *mbdigits[10];
  	      const char *mbdigits_extended[10];
  #endif
@@ -15037,7 +15229,7 @@ Index: git/stdio-common/vfscanf.c
  	      int n;
  
  	      from_level = 0;
-@@ -2088,6 +2119,7 @@ _IO_vfscanf_internal (_IO_FILE *s, const
+@@ -2088,6 +2119,7 @@ _IO_vfscanf_internal (_IO_FILE *s, const char *format, _IO_va_list argptr,
  		--width;
  	    }
  
@@ -15045,7 +15237,7 @@ Index: git/stdio-common/vfscanf.c
  	  wctrans_t map;
  	  if (__builtin_expect ((flags & I18N) != 0, 0)
  	      /* Hexadecimal floats make no sense, fixing localized
-@@ -2304,6 +2336,7 @@ _IO_vfscanf_internal (_IO_FILE *s, const
+@@ -2304,6 +2336,7 @@ _IO_vfscanf_internal (_IO_FILE *s, const char *format, _IO_va_list argptr,
  	      ;
  #endif
  	    }
@@ -15053,7 +15245,7 @@ Index: git/stdio-common/vfscanf.c
  
  	  /* Have we read any character?  If we try to read a number
  	     in hexadecimal notation and we have read only the `0x'
-@@ -2343,7 +2376,10 @@ _IO_vfscanf_internal (_IO_FILE *s, const
+@@ -2343,7 +2376,10 @@ _IO_vfscanf_internal (_IO_FILE *s, const char *format, _IO_va_list argptr,
  
  	case L_('['):	/* Character class.  */
  	  if (flags & LONG)
@@ -15065,7 +15257,7 @@ Index: git/stdio-common/vfscanf.c
  	  else
  	    STRING_ARG (str, char, 100);
  
-@@ -2417,6 +2453,7 @@ _IO_vfscanf_internal (_IO_FILE *s, const
+@@ -2417,6 +2453,7 @@ _IO_vfscanf_internal (_IO_FILE *s, const char *format, _IO_va_list argptr,
  	  if (flags & LONG)
  	    {
  	      size_t now = read_in;
@@ -15073,10 +15265,10 @@ Index: git/stdio-common/vfscanf.c
  #ifdef COMPILE_WSCANF
  	      if (__glibc_unlikely (inchar () == WEOF))
  		input_error ();
-Index: git/stdlib/Makefile
-===================================================================
---- git.orig/stdlib/Makefile
-+++ git/stdlib/Makefile
+diff --git a/stdlib/Makefile b/stdlib/Makefile
+index 402466a..7e7e304 100644
+--- a/stdlib/Makefile
++++ b/stdlib/Makefile
 @@ -18,6 +18,8 @@
  #
  #	Makefile for stdlib routines
@@ -15086,7 +15278,7 @@ Index: git/stdlib/Makefile
  subdir	:= stdlib
  
  include ../Makeconfig
-@@ -30,7 +32,7 @@ headers	:= stdlib.h bits/stdlib.h bits/s
+@@ -30,7 +32,7 @@ headers	:= stdlib.h bits/stdlib.h bits/stdlib-ldbl.h bits/stdlib-float.h      \
  	   alloca.h fmtmsg.h						      \
  	   bits/stdlib-bsearch.h
  
@@ -15124,38 +15316,37 @@ Index: git/stdlib/Makefile
  aux =	grouping groupingwc tens_in_limb
  
  # These routines will be omitted from the libc shared object.
-@@ -62,20 +72,22 @@ aux =	grouping groupingwc tens_in_limb
+@@ -62,20 +72,24 @@ aux =	grouping groupingwc tens_in_limb
  # linked against when the shared library will be used.
  static-only-routines = atexit at_quick_exit
  
 -test-srcs	:= tst-fmtmsg
 -tests		:= tst-strtol tst-strtod testmb testrand testsort testdiv   \
-+test-srcs-$(OPTION_EGLIBC_FMTMSG) := tst-fmtmsg
-+tests		:= tst-strtol tst-strtod testrand testsort testdiv          \
++test-srcs-$(OPTION_EGLIBC_FMTMSG)	:= tst-fmtmsg
++tests		:= tst-strtol tst-strtod testrand testsort testdiv	    \
  		   test-canon test-canon2 tst-strtoll tst-environ	    \
  		   tst-xpg-basename tst-random tst-random2 tst-bsearch	    \
- 		   tst-limits tst-rand48 bug-strtod tst-setcontext	    \
--		   test-a64l tst-qsort tst-system testmb2 bug-strtod2	    \
--		   tst-atof1 tst-atof2 tst-strtod2 tst-strtod3 tst-rand48-2 \
--		   tst-makecontext tst-strtod4 tst-strtod5 tst-qsort2	    \
--		   tst-makecontext2 tst-strtod6 tst-unsetenv1		    \
--		   tst-makecontext3 bug-getcontext bug-fmtmsg1		    \
-+		   test-a64l tst-qsort tst-system bug-strtod2		    \
-+		   tst-atof1 tst-atof2 tst-strtod2 tst-rand48-2             \
-+		   tst-makecontext tst-qsort2 tst-makecontext2 tst-strtod6  \
-+		   tst-unsetenv1 tst-makecontext3 bug-getcontext bug-fmtmsg1 \
+ 		   tst-limits tst-rand48 bug-strtod tst-setcontext          \
+-		   tst-setcontext2 test-a64l tst-qsort tst-system testmb2   \
+-		   bug-strtod2 tst-atof1 tst-atof2 tst-strtod2 tst-strtod3  \
+-		   tst-rand48-2 tst-makecontext tst-strtod4 tst-strtod5     \
++		   tst-setcontext2 test-a64l tst-qsort tst-system	    \
++		   bug-strtod2 tst-atof1 tst-atof2 tst-strtod2 		    \
++		   tst-rand48-2 tst-makecontext 			    \
+ 		   tst-qsort2 tst-makecontext2 tst-strtod6 tst-unsetenv1    \
+ 		   tst-makecontext3 bug-getcontext bug-fmtmsg1		    \
  		   tst-secure-getenv tst-strtod-overflow tst-strtod-round   \
- 		   tst-tininess tst-strtod-underflow tst-tls-atexit
+ 		   tst-tininess tst-strtod-underflow tst-tls-atexit	    \
+ 		   tst-setcontext3 tst-tls-atexit-nodelete
  tests-static	:= tst-secure-getenv
--
 +tests-$(OPTION_EGLIBC_LOCALE_CODE) \
 +		+= tst-strtod3 tst-strtod4 tst-strtod5 testmb2
 +tests-$(OPTION_POSIX_C_LANG_WIDE_CHAR) \
 +		+= testmb
+ 
  modules-names	= tst-tls-atexit-lib
  
- ifeq ($(build-shared),yes)
-@@ -115,8 +127,10 @@ CFLAGS-tst-makecontext2.c = $(stack-alig
+@@ -116,8 +130,10 @@ CFLAGS-tst-makecontext2.c = $(stack-align-test-flags)
  tests-special += $(objpfx)isomac.out
  
  ifeq ($(run-built-tests),yes)
@@ -15166,10 +15357,10 @@ Index: git/stdlib/Makefile
  
  include ../Rules
  
-Index: git/stdlib/strtod_l.c
-===================================================================
---- git.orig/stdlib/strtod_l.c
-+++ git/stdlib/strtod_l.c
+diff --git a/stdlib/strtod_l.c b/stdlib/strtod_l.c
+index e13ab1e..63efe41 100644
+--- a/stdlib/strtod_l.c
++++ b/stdlib/strtod_l.c
 @@ -17,6 +17,7 @@
     License along with the GNU C Library; if not, see
     <http://www.gnu.org/licenses/>.  */
@@ -15178,7 +15369,7 @@ Index: git/stdlib/strtod_l.c
  #include <xlocale.h>
  
  extern double ____strtod_l_internal (const char *, char **, int, __locale_t);
-@@ -548,6 +549,7 @@ ____STRTOF_INTERNAL (nptr, endptr, group
+@@ -548,6 +549,7 @@ ____STRTOF_INTERNAL (nptr, endptr, group, loc)
    /* Used in several places.  */
    int cnt;
  
@@ -15186,7 +15377,7 @@ Index: git/stdlib/strtod_l.c
    struct __locale_data *current = loc->__locales[LC_NUMERIC];
  
    if (__glibc_unlikely (group))
-@@ -586,6 +588,17 @@ ____STRTOF_INTERNAL (nptr, endptr, group
+@@ -586,6 +588,17 @@ ____STRTOF_INTERNAL (nptr, endptr, group, loc)
    decimal_len = strlen (decimal);
    assert (decimal_len > 0);
  #endif
@@ -15204,10 +15395,10 @@ Index: git/stdlib/strtod_l.c
  
    /* Prepare number representation.  */
    exponent = 0;
-Index: git/stdlib/tst-strtod.c
-===================================================================
---- git.orig/stdlib/tst-strtod.c
-+++ git/stdlib/tst-strtod.c
+diff --git a/stdlib/tst-strtod.c b/stdlib/tst-strtod.c
+index a469208..28fb423 100644
+--- a/stdlib/tst-strtod.c
++++ b/stdlib/tst-strtod.c
 @@ -23,6 +23,7 @@
  #include <errno.h>
  #include <string.h>
@@ -15239,10 +15430,10 @@ Index: git/stdlib/tst-strtod.c
    return result;
  }
 +#endif /* __OPTION_EGLIBC_LOCALE_CODE */
-Index: git/streams/Makefile
-===================================================================
---- git.orig/streams/Makefile
-+++ git/streams/Makefile
+diff --git a/streams/Makefile b/streams/Makefile
+index a8a6162..ceb423f 100644
+--- a/streams/Makefile
++++ b/streams/Makefile
 @@ -18,11 +18,14 @@
  #
  #	Makefile for streams.
@@ -15259,10 +15450,10 @@ Index: git/streams/Makefile
 +	+= isastream getmsg getpmsg putmsg putpmsg fattach fdetach
  
  include ../Rules
-Index: git/string/Makefile
-===================================================================
---- git.orig/string/Makefile
-+++ git/string/Makefile
+diff --git a/string/Makefile b/string/Makefile
+index 8424a61..5988834 100644
+--- a/string/Makefile
++++ b/string/Makefile
 @@ -18,6 +18,8 @@
  #
  #	Sub-makefile for string portion of library.
@@ -15272,7 +15463,7 @@ Index: git/string/Makefile
  subdir	:= string
  
  include ../Makeconfig
-@@ -39,10 +41,12 @@ routines	:= strcat strchr strcmp strcoll
+@@ -39,10 +41,12 @@ routines	:= strcat strchr strcmp strcoll strcpy strcspn		\
  		   $(addprefix argz-,append count create ctsep next	\
  				     delete extract insert stringify	\
  				     addsep replace)			\
@@ -15286,7 +15477,7 @@ Index: git/string/Makefile
  strop-tests	:= memchr memcmp memcpy memmove mempcpy memset memccpy	\
  		   stpcpy stpncpy strcat strchr strcmp strcpy strcspn	\
  		   strlen strncmp strncpy strpbrk strrchr strspn memmem	\
-@@ -51,10 +55,12 @@ strop-tests	:= memchr memcmp memcpy memm
+@@ -51,10 +55,12 @@ strop-tests	:= memchr memcmp memcpy memmove mempcpy memset memccpy	\
  tests		:= tester inl-tester noinl-tester testcopy test-ffs	\
  		   tst-strlen stratcliff tst-svc tst-inlcall		\
  		   bug-strncat1 bug-strspn1 bug-strpbrk1 tst-bswap	\
@@ -15302,10 +15493,10 @@ Index: git/string/Makefile
  
  xtests = tst-strcoll-overflow
  
-Index: git/string/strcoll_l.c
-===================================================================
---- git.orig/string/strcoll_l.c
-+++ git/string/strcoll_l.c
+diff --git a/string/strcoll_l.c b/string/strcoll_l.c
+index 8f1225f..b36b18c 100644
+--- a/string/strcoll_l.c
++++ b/string/strcoll_l.c
 @@ -24,6 +24,7 @@
  #include <stdint.h>
  #include <string.h>
@@ -15314,7 +15505,7 @@ Index: git/string/strcoll_l.c
  
  #ifndef STRING_TYPE
  # define STRING_TYPE char
-@@ -247,7 +248,11 @@ int
+@@ -260,7 +261,11 @@ int
  STRCOLL (const STRING_TYPE *s1, const STRING_TYPE *s2, __locale_t l)
  {
    struct __locale_data *current = l->__locales[LC_COLLATE];
@@ -15326,10 +15517,10 @@ Index: git/string/strcoll_l.c
    /* We don't assign the following values right away since it might be
       unnecessary in case there are no rules.  */
    const unsigned char *rulesets;
-Index: git/string/strerror_l.c
-===================================================================
---- git.orig/string/strerror_l.c
-+++ git/string/strerror_l.c
+diff --git a/string/strerror_l.c b/string/strerror_l.c
+index 2ed78b5..6584813 100644
+--- a/string/strerror_l.c
++++ b/string/strerror_l.c
 @@ -21,6 +21,7 @@
  #include <stdlib.h>
  #include <string.h>
@@ -15353,10 +15544,10 @@ Index: git/string/strerror_l.c
  }
  
  
-Index: git/string/strxfrm_l.c
-===================================================================
---- git.orig/string/strxfrm_l.c
-+++ git/string/strxfrm_l.c
+diff --git a/string/strxfrm_l.c b/string/strxfrm_l.c
+index 8b61ea2..41fdc22 100644
+--- a/string/strxfrm_l.c
++++ b/string/strxfrm_l.c
 @@ -24,6 +24,7 @@
  #include <stdlib.h>
  #include <string.h>
@@ -15365,7 +15556,7 @@ Index: git/string/strxfrm_l.c
  
  #ifndef STRING_TYPE
  # define STRING_TYPE char
-@@ -670,7 +671,11 @@ STRXFRM (STRING_TYPE *dest, const STRING
+@@ -669,7 +670,11 @@ STRXFRM (STRING_TYPE *dest, const STRING_TYPE *src, size_t n, __locale_t l)
  {
    locale_data_t l_data;
    struct __locale_data *current = l->__locales[LC_COLLATE];
@@ -15377,10 +15568,10 @@ Index: git/string/strxfrm_l.c
  
    /* Handle byte comparison case.  */
    if (l_data.nrules == 0)
-Index: git/string/test-strcmp.c
-===================================================================
---- git.orig/string/test-strcmp.c
-+++ git/string/test-strcmp.c
+diff --git a/string/test-strcmp.c b/string/test-strcmp.c
+index dc4ba6f..a978656 100644
+--- a/string/test-strcmp.c
++++ b/string/test-strcmp.c
 @@ -329,34 +329,6 @@ check (void)
  		FOR_EACH_IMPL (impl, 0)
  		check_result (impl, s1 + i1, s2 + i2, exp_result);
@@ -15416,10 +15607,33 @@ Index: git/string/test-strcmp.c
  }
  
  
-Index: git/string/tst-strxfrm2.c
-===================================================================
---- git.orig/string/tst-strxfrm2.c
-+++ git/string/tst-strxfrm2.c
+diff --git a/string/tst-strxfrm.c b/string/tst-strxfrm.c
+index f48cfc0..c3a51f9 100644
+--- a/string/tst-strxfrm.c
++++ b/string/tst-strxfrm.c
+@@ -3,6 +3,7 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
++#include <gnu/option-groups.h>
+ 
+ 
+ char const string[] = "";
+@@ -64,8 +65,10 @@ do_test (void)
+   int result = 0;
+ 
+   result |= test ("C");
++#if __OPTION_EGLIBC_LOCALE_CODE
+   result |= test ("en_US.ISO-8859-1");
+   result |= test ("de_DE.UTF-8");
++#endif
+ 
+   return result;
+ }
+diff --git a/string/tst-strxfrm2.c b/string/tst-strxfrm2.c
+index d5a1115..19c7f30 100644
+--- a/string/tst-strxfrm2.c
++++ b/string/tst-strxfrm2.c
 @@ -1,6 +1,7 @@
  #include <locale.h>
  #include <stdio.h>
@@ -15444,33 +15658,10 @@ Index: git/string/tst-strxfrm2.c
  
    return res;
  }
-Index: git/string/tst-strxfrm.c
-===================================================================
---- git.orig/string/tst-strxfrm.c
-+++ git/string/tst-strxfrm.c
-@@ -3,6 +3,7 @@
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
-+#include <gnu/option-groups.h>
- 
- 
- char const string[] = "";
-@@ -64,8 +65,10 @@ do_test (void)
-   int result = 0;
- 
-   result |= test ("C");
-+#if __OPTION_EGLIBC_LOCALE_CODE
-   result |= test ("en_US.ISO-8859-1");
-   result |= test ("de_DE.UTF-8");
-+#endif
- 
-   return result;
- }
-Index: git/sunrpc/Makefile
-===================================================================
---- git.orig/sunrpc/Makefile
-+++ git/sunrpc/Makefile
+diff --git a/sunrpc/Makefile b/sunrpc/Makefile
+index 60caa0a..5bc70ab 100644
+--- a/sunrpc/Makefile
++++ b/sunrpc/Makefile
 @@ -18,6 +18,8 @@
  #
  #	Sub-makefile for sunrpc portion of the library.
@@ -15480,7 +15671,7 @@ Index: git/sunrpc/Makefile
  subdir	:= sunrpc
  
  include ../Makeconfig
-@@ -55,7 +57,6 @@ headers-in-tirpc = $(addprefix rpc/,auth
+@@ -55,7 +57,6 @@ headers-in-tirpc = $(addprefix rpc/,auth.h auth_unix.h clnt.h pmap_clnt.h \
  headers-not-in-tirpc = $(addprefix rpc/,key_prot.h rpc_des.h) \
  		       $(rpcsvc:%=rpcsvc/%) rpcsvc/bootparam.h
  headers = rpc/netdb.h
@@ -15488,32 +15679,32 @@ Index: git/sunrpc/Makefile
  generated += $(rpcsvc:%.x=rpcsvc/%.h) $(rpcsvc:%.x=x%.c) $(rpcsvc:%.x=x%.stmp) \
  	     $(rpcsvc:%.x=rpcsvc/%.stmp) rpcgen
  generated-dirs += rpcsvc
-@@ -65,18 +66,28 @@ headers += $(headers-in-tirpc) $(headers
+@@ -65,20 +66,28 @@ headers += $(headers-in-tirpc) $(headers-not-in-tirpc)
  endif
  
  ifeq ($(build-shared),yes)
 -need-export-routines := auth_des auth_unix clnt_gen clnt_perr clnt_tcp \
-+need-export-routines-$(OPTION_EGLIBC_SUNRPC) += \
++need-export-routines-$(OPTION_EGLIBC_SUNRPC) := \
 +			auth_des auth_unix clnt_gen clnt_perr clnt_tcp \
  			clnt_udp get_myaddr key_call netname pm_getport \
 -			rpc_thread svc svc_tcp svc_udp xcrypt xdr_array xdr \
 +			rpc_thread svc svc_tcp svc_udp xdr_array xdr \
  			xdr_intXX_t xdr_mem xdr_ref xdr_sizeof xdr_stdio \
  			svc_run
- 
--routines := auth_none authuxprot bindrsvprt clnt_raw clnt_simp \
 +need-export-routines-y += xcrypt
-+
 +need-export-routines := $(need-export-routines-y)
-+
-+routines-$(OPTION_EGLIBC_SUNRPC) \
-+	 += auth_none authuxprot bindrsvprt clnt_raw clnt_simp \
+ 
+-routines := auth_none authuxprot bindrsvprt clnt_raw clnt_simp \
++routines-$(OPTION_EGLIBC_SUNRPC) := \
++	    auth_none authuxprot bindrsvprt clnt_raw clnt_simp \
  	    rpc_dtable getrpcport pmap_clnt pm_getmaps pmap_prot pmap_prot2 \
  	    pmap_rmt rpc_prot rpc_common rpc_cmsg svc_auth svc_authux svc_raw \
  	    svc_simple xdr_float xdr_rec publickey authdes_prot \
 -	    des_crypt des_impl des_soft key_prot openchild rtime svcauth_des \
--	    clnt_unix svc_unix create_xid $(need-export-routines)
 +	    key_prot openchild rtime svcauth_des \
+ 	    getrpcent getrpcbyname getrpcbynumber \
+ 	    getrpcent_r getrpcbyname_r getrpcbynumber_r \
+-	    clnt_unix svc_unix create_xid $(need-export-routines)
 +	    clnt_unix svc_unix create_xid
 +
 +# xdecrypt is also used by nss/nss_files/files-key.c.
@@ -15522,7 +15713,7 @@ Index: git/sunrpc/Makefile
  ifneq ($(link-obsolete-rpc),yes)
  # We only add the RPC for compatibility to libc.so.
  shared-only-routines = $(routines)
-@@ -85,25 +96,28 @@ endif
+@@ -87,25 +96,28 @@ endif
  
  # We do not build rpcinfo anymore.  It is not needed for a bootstrap
  # and not wanted on complete systems.
@@ -15542,9 +15733,9 @@ Index: git/sunrpc/Makefile
 +
 +install-others-$(OPTION_EGLIBC_SUNRPC) += $(inst_sysconfdir)/rpc
  
--tests = tst-xdrmem tst-xdrmem2
+-tests = tst-xdrmem tst-xdrmem2 test-rpcent
 -xtests := tst-getmyaddr
-+tests-$(OPTION_EGLIBC_SUNRPC) = tst-xdrmem tst-xdrmem2
++tests-$(OPTION_EGLIBC_SUNRPC) = tst-xdrmem tst-xdrmem2 test-rpcent
 +xtests-$(OPTION_EGLIBC_SUNRPC) := tst-getmyaddr
  
  ifeq ($(have-thread-library),yes)
@@ -15561,11 +15752,30 @@ Index: git/sunrpc/Makefile
  librpcsvc-routines = $(rpcsvc:%.x=x%)
  librpcsvc-inhibit-o = .os # Build no shared rpcsvc library.
  omit-deps = $(librpcsvc-routines)
-Index: git/sysdeps/generic/ldsodefs.h
-===================================================================
---- git.orig/sysdeps/generic/ldsodefs.h
-+++ git/sysdeps/generic/ldsodefs.h
-@@ -425,6 +425,12 @@ extern struct rtld_global _rtld_global _
+diff --git a/sysdeps/arm/Makefile b/sysdeps/arm/Makefile
+index 17c129b..543791a 100644
+--- a/sysdeps/arm/Makefile
++++ b/sysdeps/arm/Makefile
+@@ -37,10 +37,13 @@ ifeq ($(subdir),csu)
+ # get offset to rtld_global._dl_hwcap
+ gen-as-const-headers += rtld-global-offsets.sym tlsdesc.sym
+ aeabi_constants = aeabi_lcsts aeabi_sighandlers aeabi_math
+-aeabi_routines = aeabi_assert aeabi_localeconv aeabi_errno_addr \
++aeabi_routines = aeabi_assert aeabi_errno_addr \
+ 		 aeabi_mb_cur_max aeabi_atexit aeabi_memclr aeabi_memcpy \
+ 		 aeabi_memmove aeabi_memset \
+ 		 aeabi_read_tp libc-aeabi_read_tp
++ifeq (y,$(OPTION_EGLIBC_LOCALE_CODE))
++aeabi_routines += aeabi_localeconv
++endif
+ 
+ sysdep_routines += $(aeabi_constants) $(aeabi_routines)
+ static-only-routines += $(aeabi_constants) aeabi_read_tp
+diff --git a/sysdeps/generic/ldsodefs.h b/sysdeps/generic/ldsodefs.h
+index 7a0fe8d..a3e2c0a 100644
+--- a/sysdeps/generic/ldsodefs.h
++++ b/sysdeps/generic/ldsodefs.h
+@@ -435,6 +435,12 @@ extern struct rtld_global _rtld_global __rtld_global_attribute__;
  # undef __rtld_global_attribute__
  #endif
  
@@ -15578,7 +15788,7 @@ Index: git/sysdeps/generic/ldsodefs.h
  #ifndef SHARED
  # define GLRO(name) _##name
  #else
-@@ -437,8 +443,10 @@ struct rtld_global_ro
+@@ -447,8 +453,10 @@ struct rtld_global_ro
  {
  #endif
  
@@ -15589,11 +15799,11 @@ Index: git/sysdeps/generic/ldsodefs.h
  #define DL_DEBUG_LIBS	    (1 << 0)
  #define DL_DEBUG_IMPCALLS   (1 << 1)
  #define DL_DEBUG_BINDINGS   (1 << 2)
-Index: git/sysdeps/gnu/Makefile
-===================================================================
---- git.orig/sysdeps/gnu/Makefile
-+++ git/sysdeps/gnu/Makefile
-@@ -59,7 +59,8 @@ $(foreach o,$(object-suffixes) $(object-
+diff --git a/sysdeps/gnu/Makefile b/sysdeps/gnu/Makefile
+index ea68037..3175cc3 100644
+--- a/sysdeps/gnu/Makefile
++++ b/sysdeps/gnu/Makefile
+@@ -59,7 +59,8 @@ $(foreach o,$(object-suffixes) $(object-suffixes:=.d),\
  endif
  
  ifeq ($(subdir),login)
@@ -15603,10 +15813,10 @@ Index: git/sysdeps/gnu/Makefile
  		   pututxline utmpxname updwtmpx getutmpx getutmp
  
  sysdep_headers += utmpx.h bits/utmpx.h
-Index: git/sysdeps/ieee754/ldbl-opt/Makefile
-===================================================================
---- git.orig/sysdeps/ieee754/ldbl-opt/Makefile
-+++ git/sysdeps/ieee754/ldbl-opt/Makefile
+diff --git a/sysdeps/ieee754/ldbl-opt/Makefile b/sysdeps/ieee754/ldbl-opt/Makefile
+index 222122d..4509357 100644
+--- a/sysdeps/ieee754/ldbl-opt/Makefile
++++ b/sysdeps/ieee754/ldbl-opt/Makefile
 @@ -11,19 +11,18 @@ libm-routines += s_nexttowardfd
  routines += math_ldbl_opt nldbl-compat
  
@@ -15636,7 +15846,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/Makefile
  		 strtold strtold_l strtoldint wcstold wcstold_l wcstoldint \
  		 qecvt qfcvt qgcvt qecvt_r qfcvt_r \
  		 isinf isnan finite signbit scalb log2 lgamma_r ceil \
-@@ -38,9 +37,15 @@ libnldbl-calls = asprintf dprintf fprint
+@@ -38,9 +37,15 @@ libnldbl-calls = asprintf dprintf fprintf fscanf fwprintf fwscanf iovfscanf \
  		 casinh cexp clog cproj csin csinh csqrt ctan ctanh cpow \
  		 cabs carg cimag creal clog10 \
  		 isoc99_scanf isoc99_fscanf isoc99_sscanf \
@@ -15653,10 +15863,10 @@ Index: git/sysdeps/ieee754/ldbl-opt/Makefile
  libnldbl-routines = $(libnldbl-calls:%=nldbl-%)
  libnldbl-inhibit-o = $(object-suffixes)
  libnldbl-static-only-routines = $(libnldbl-routines)
-Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
-===================================================================
---- git.orig/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
-+++ git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
+diff --git a/sysdeps/ieee754/ldbl-opt/nldbl-compat.c b/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
+index 0198886..55501cd 100644
+--- a/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
++++ b/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
 @@ -26,6 +26,7 @@
  #include <locale/localeinfo.h>
  #include <sys/syslog.h>
@@ -15704,7 +15914,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  
  static void
  __nldbl_cleanup (void *arg)
-@@ -117,6 +121,7 @@ __nldbl_fprintf (FILE *stream, const cha
+@@ -117,6 +121,7 @@ __nldbl_fprintf (FILE *stream, const char *fmt, ...)
  }
  weak_alias (__nldbl_fprintf, __nldbl__IO_fprintf)
  
@@ -15712,7 +15922,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  int
  attribute_compat_text_section weak_function
  __nldbl_fwprintf (FILE *stream, const wchar_t *fmt, ...)
-@@ -130,6 +135,7 @@ __nldbl_fwprintf (FILE *stream, const wc
+@@ -130,6 +135,7 @@ __nldbl_fwprintf (FILE *stream, const wchar_t *fmt, ...)
  
    return done;
  }
@@ -15720,7 +15930,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  
  int
  attribute_compat_text_section
-@@ -226,6 +232,7 @@ __nldbl_snprintf (char *s, size_t maxlen
+@@ -226,6 +232,7 @@ __nldbl_snprintf (char *s, size_t maxlen, const char *fmt, ...)
    return done;
  }
  
@@ -15728,7 +15938,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  int
  attribute_compat_text_section
  __nldbl_swprintf (wchar_t *s, size_t n, const wchar_t *fmt, ...)
-@@ -239,6 +246,7 @@ __nldbl_swprintf (wchar_t *s, size_t n,
+@@ -239,6 +246,7 @@ __nldbl_swprintf (wchar_t *s, size_t n, const wchar_t *fmt, ...)
  
    return done;
  }
@@ -15736,7 +15946,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  
  int
  attribute_compat_text_section weak_function
-@@ -264,6 +272,7 @@ __nldbl_vdprintf (int d, const char *fmt
+@@ -264,6 +272,7 @@ __nldbl_vdprintf (int d, const char *fmt, va_list arg)
  }
  libc_hidden_def (__nldbl_vdprintf)
  
@@ -15744,7 +15954,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  int
  attribute_compat_text_section weak_function
  __nldbl_vfwprintf (FILE *s, const wchar_t *fmt, va_list ap)
-@@ -275,6 +284,7 @@ __nldbl_vfwprintf (FILE *s, const wchar_
+@@ -275,6 +284,7 @@ __nldbl_vfwprintf (FILE *s, const wchar_t *fmt, va_list ap)
    return res;
  }
  libc_hidden_def (__nldbl_vfwprintf)
@@ -15752,7 +15962,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  
  int
  attribute_compat_text_section
-@@ -297,6 +307,7 @@ __nldbl_vsnprintf (char *string, size_t
+@@ -297,6 +307,7 @@ __nldbl_vsnprintf (char *string, size_t maxlen, const char *fmt,
  libc_hidden_def (__nldbl_vsnprintf)
  weak_alias (__nldbl_vsnprintf, __nldbl___vsnprintf)
  
@@ -15760,7 +15970,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  int
  attribute_compat_text_section weak_function
  __nldbl_vswprintf (wchar_t *string, size_t maxlen, const wchar_t *fmt,
-@@ -330,6 +341,7 @@ __nldbl_wprintf (const wchar_t *fmt, ...
+@@ -330,6 +341,7 @@ __nldbl_wprintf (const wchar_t *fmt, ...)
  
    return done;
  }
@@ -15784,7 +15994,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  
  int
  attribute_compat_text_section
-@@ -506,6 +520,7 @@ __nldbl___fprintf_chk (FILE *stream, int
+@@ -506,6 +520,7 @@ __nldbl___fprintf_chk (FILE *stream, int flag, const char *fmt, ...)
    return done;
  }
  
@@ -15792,7 +16002,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  int
  attribute_compat_text_section
  __nldbl___fwprintf_chk (FILE *stream, int flag, const wchar_t *fmt, ...)
-@@ -519,6 +534,7 @@ __nldbl___fwprintf_chk (FILE *stream, in
+@@ -519,6 +534,7 @@ __nldbl___fwprintf_chk (FILE *stream, int flag, const wchar_t *fmt, ...)
  
    return done;
  }
@@ -15800,7 +16010,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  
  int
  attribute_compat_text_section
-@@ -563,6 +579,7 @@ __nldbl___sprintf_chk (char *s, int flag
+@@ -563,6 +579,7 @@ __nldbl___sprintf_chk (char *s, int flag, size_t slen, const char *fmt, ...)
    return done;
  }
  
@@ -15808,7 +16018,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  int
  attribute_compat_text_section
  __nldbl___swprintf_chk (wchar_t *s, size_t n, int flag, size_t slen,
-@@ -577,6 +594,7 @@ __nldbl___swprintf_chk (wchar_t *s, size
+@@ -577,6 +594,7 @@ __nldbl___swprintf_chk (wchar_t *s, size_t n, int flag, size_t slen,
  
    return done;
  }
@@ -15816,7 +16026,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  
  int
  attribute_compat_text_section
-@@ -590,6 +608,7 @@ __nldbl___vfprintf_chk (FILE *s, int fla
+@@ -590,6 +608,7 @@ __nldbl___vfprintf_chk (FILE *s, int flag, const char *fmt, va_list ap)
  }
  libc_hidden_def (__nldbl___vfprintf_chk)
  
@@ -15824,7 +16034,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  int
  attribute_compat_text_section
  __nldbl___vfwprintf_chk (FILE *s, int flag, const wchar_t *fmt, va_list ap)
-@@ -601,6 +620,7 @@ __nldbl___vfwprintf_chk (FILE *s, int fl
+@@ -601,6 +620,7 @@ __nldbl___vfwprintf_chk (FILE *s, int flag, const wchar_t *fmt, va_list ap)
    return res;
  }
  libc_hidden_def (__nldbl___vfwprintf_chk)
@@ -15832,7 +16042,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  
  int
  attribute_compat_text_section
-@@ -635,6 +655,7 @@ __nldbl___vsprintf_chk (char *string, in
+@@ -635,6 +655,7 @@ __nldbl___vsprintf_chk (char *string, int flag, size_t slen, const char *fmt,
  }
  libc_hidden_def (__nldbl___vsprintf_chk)
  
@@ -15840,7 +16050,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  int
  attribute_compat_text_section
  __nldbl___vswprintf_chk (wchar_t *string, size_t maxlen, int flag, size_t slen,
-@@ -668,6 +689,7 @@ __nldbl___wprintf_chk (int flag, const w
+@@ -668,6 +689,7 @@ __nldbl___wprintf_chk (int flag, const wchar_t *fmt, ...)
  
    return done;
  }
@@ -15848,7 +16058,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  
  int
  attribute_compat_text_section
-@@ -775,6 +797,7 @@ __nldbl___printf_fp (FILE *fp, const str
+@@ -775,6 +797,7 @@ __nldbl___printf_fp (FILE *fp, const struct printf_info *info,
    return ___printf_fp (fp, &info_no_ldbl, args);
  }
  
@@ -15856,7 +16066,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  ssize_t
  attribute_compat_text_section
  __nldbl_strfmon (char *s, size_t maxsize, const char *format, ...)
-@@ -829,6 +852,7 @@ __nldbl___vstrfmon_l (char *s, size_t ma
+@@ -829,6 +852,7 @@ __nldbl___vstrfmon_l (char *s, size_t maxsize, __locale_t loc,
    return res;
  }
  libc_hidden_def (__nldbl___vstrfmon_l)
@@ -15864,7 +16074,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  
  void
  attribute_compat_text_section
-@@ -941,6 +965,7 @@ __nldbl___isoc99_scanf (const char *fmt,
+@@ -941,6 +965,7 @@ __nldbl___isoc99_scanf (const char *fmt, ...)
    return done;
  }
  
@@ -15872,7 +16082,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  int
  attribute_compat_text_section
  __nldbl___isoc99_vfwscanf (FILE *s, const wchar_t *fmt, va_list ap)
-@@ -1014,6 +1039,7 @@ __nldbl___isoc99_wscanf (const wchar_t *
+@@ -1014,6 +1039,7 @@ __nldbl___isoc99_wscanf (const wchar_t *fmt, ...)
  
    return done;
  }
@@ -15880,7 +16090,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  
  #if LONG_DOUBLE_COMPAT(libc, GLIBC_2_0)
  compat_symbol (libc, __nldbl__IO_printf, _IO_printf, GLIBC_2_0);
-@@ -1057,6 +1083,7 @@ compat_symbol (libc, __nldbl_printf_size
+@@ -1057,6 +1083,7 @@ compat_symbol (libc, __nldbl_printf_size, printf_size, GLIBC_2_1);
  compat_symbol (libc, __nldbl___strfmon_l, __strfmon_l, GLIBC_2_1);
  #endif
  #if LONG_DOUBLE_COMPAT(libc, GLIBC_2_2)
@@ -15888,7 +16098,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  compat_symbol (libc, __nldbl_swprintf, swprintf, GLIBC_2_2);
  compat_symbol (libc, __nldbl_vwprintf, vwprintf, GLIBC_2_2);
  compat_symbol (libc, __nldbl_wprintf, wprintf, GLIBC_2_2);
-@@ -1069,6 +1096,7 @@ compat_symbol (libc, __nldbl_vfwscanf, v
+@@ -1069,6 +1096,7 @@ compat_symbol (libc, __nldbl_vfwscanf, vfwscanf, GLIBC_2_2);
  compat_symbol (libc, __nldbl_vswscanf, vswscanf, GLIBC_2_2);
  compat_symbol (libc, __nldbl_vwscanf, vwscanf, GLIBC_2_2);
  compat_symbol (libc, __nldbl_wscanf, wscanf, GLIBC_2_2);
@@ -15896,10 +16106,10 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.c
  #endif
  #if LONG_DOUBLE_COMPAT(libc, GLIBC_2_3)
  compat_symbol (libc, __nldbl_strfmon_l, strfmon_l, GLIBC_2_3);
-Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.h
-===================================================================
---- git.orig/sysdeps/ieee754/ldbl-opt/nldbl-compat.h
-+++ git/sysdeps/ieee754/ldbl-opt/nldbl-compat.h
+diff --git a/sysdeps/ieee754/ldbl-opt/nldbl-compat.h b/sysdeps/ieee754/ldbl-opt/nldbl-compat.h
+index 0d2c8af..f4cea50 100644
+--- a/sysdeps/ieee754/ldbl-opt/nldbl-compat.h
++++ b/sysdeps/ieee754/ldbl-opt/nldbl-compat.h
 @@ -30,6 +30,7 @@
  #include <math.h>
  #include <monetary.h>
@@ -15947,7 +16157,7 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.h
  
  /* This one does not exist in the normal interface, only
     __nldbl___vstrfmon really exists.  */
-@@ -82,22 +85,23 @@ extern ssize_t __nldbl___vstrfmon (char
+@@ -82,22 +85,23 @@ extern ssize_t __nldbl___vstrfmon (char *, size_t, const char *, va_list)
     since we don't compile with _FORTIFY_SOURCE.  */
  extern int __nldbl___vfprintf_chk (FILE *__restrict, int,
  				   const char *__restrict, _G_va_list);
@@ -15977,504 +16187,132 @@ Index: git/sysdeps/ieee754/ldbl-opt/nldbl-compat.h
 +#endif
  
  #endif /* __NLDBL_COMPAT_H */
-Index: git/sysdeps/unix/sysv/linux/gethostid.c
-===================================================================
---- git.orig/sysdeps/unix/sysv/linux/gethostid.c
-+++ git/sysdeps/unix/sysv/linux/gethostid.c
-@@ -21,6 +21,7 @@
- #include <unistd.h>
- #include <netdb.h>
- #include <not-cancel.h>
-+#include <gnu/option-groups.h>
- 
- #define HOSTIDFILE "/etc/hostid"
- 
-@@ -89,6 +90,7 @@ gethostid (void)
- 	return id;
-     }
- 
-+#if __OPTION_EGLIBC_INET
-   /* Getting from the file was not successful.  An intelligent guess for
-      a unique number of a host is its IP address.  Return this.  */
-   if (__gethostname (hostname, MAXHOSTNAMELEN) < 0 || hostname[0] == '\0')
-@@ -115,5 +117,9 @@ gethostid (void)
-   /* For the return value to be not exactly the IP address we do some
-      bit fiddling.  */
-   return (int32_t) (in.s_addr << 16 | in.s_addr >> 16);
-+#else
-+  /* Return an arbitrary value.  */
-+  return 0;
-+#endif
- }
- #endif
-Index: git/sysdeps/unix/sysv/linux/libc_fatal.c
-===================================================================
---- git.orig/sysdeps/unix/sysv/linux/libc_fatal.c
-+++ git/sysdeps/unix/sysv/linux/libc_fatal.c
-@@ -23,6 +23,7 @@
- #include <string.h>
- #include <sys/mman.h>
- #include <sys/uio.h>
-+#include <gnu/option-groups.h>
- 
- static bool
- writev_for_fatal (int fd, const struct iovec *iov, size_t niov, size_t total)
-@@ -40,6 +41,7 @@ writev_for_fatal (int fd, const struct i
- static void
- backtrace_and_maps (int do_abort, bool written, int fd)
- {
-+#if __OPTION_EGLIBC_BACKTRACE
-   if (do_abort > 1 && written)
-     {
-       void *addrs[64];
-@@ -62,6 +64,7 @@ backtrace_and_maps (int do_abort, bool w
-           close_not_cancel_no_status (fd2);
-         }
-     }
-+#endif /* __OPTION_EGLIBC_BACKTRACE */
- }
- #define BEFORE_ABORT		backtrace_and_maps
- 
-Index: git/time/Makefile
-===================================================================
---- git.orig/time/Makefile
-+++ git/time/Makefile
-@@ -18,6 +18,8 @@
- #
- #	Makefile for time routines
- #
-+include ../option-groups.mak
-+
- subdir	:= time
- 
- include ../Makeconfig
-@@ -30,15 +32,23 @@ routines := offtime asctime clock ctime
- 	    tzfile getitimer setitimer			 \
- 	    stime dysize timegm ftime			 \
- 	    getdate strptime strptime_l			 \
--	    strftime wcsftime strftime_l wcsftime_l	 \
-+	    strftime strftime_l				 \
- 	    timespec_get
--aux :=	    era alt_digit lc-time-cleanup
+diff --git a/sysdeps/nptl/Makefile b/sysdeps/nptl/Makefile
+index e9339a3..782009b 100644
+--- a/sysdeps/nptl/Makefile
++++ b/sysdeps/nptl/Makefile
+@@ -18,6 +18,9 @@
  
--tests	:= test_time clocktest tst-posixtz tst-strptime tst_wcsftime \
--	   tst-getdate tst-mktime tst-mktime2 tst-ftime_l tst-strftime \
-+routines-$(OPTION_POSIX_C_LANG_WIDE_CHAR)                \
-+	    := wcsftime wcsftime_l
-+aux-$(OPTION_EGLIBC_LOCALE_CODE) += alt_digit era lc-time-cleanup
-+
-+tests	:= test_time clocktest tst-posixtz \
-+	   tst-getdate tst-mktime tst-mktime2 tst-strftime \
- 	   tst-mktime3 tst-strptime2 bug-asctime bug-asctime_r bug-mktime1 \
- 	   tst-strptime3 bug-getdate1 tst-strptime-whitespace tst-ftime
+ ifeq ($(subdir),nptl)
+ libpthread-sysdep_routines += errno-loc
++ifeq ($(OPTION_EGLIBC_BIG_MACROS),n)
++sysdep_routines += small-macros-fns
++endif
+ endif
  
-+tests-$(OPTION_EGLIBC_LOCALE_CODE) \
-+	        += tst-strptime tst-ftime_l
-+tests-$(OPTION_POSIX_WIDE_CHAR_DEVICE_IO) \
-+	        += tst_wcsftime
-+
- include ../Rules
+ ifeq ($(subdir),rt)
+diff --git a/sysdeps/nptl/bits/libc-lock.h b/sysdeps/nptl/bits/libc-lock.h
+index 5599cf1..b839378 100644
+--- a/sysdeps/nptl/bits/libc-lock.h
++++ b/sysdeps/nptl/bits/libc-lock.h
+@@ -24,6 +24,14 @@
+ #include <stddef.h>
  
- tz-cflags = -DTZDIR='"$(zonedir)"' \
-Index: git/time/strftime_l.c
-===================================================================
---- git.orig/time/strftime_l.c
-+++ git/time/strftime_l.c
-@@ -35,6 +35,10 @@
- # include "../locale/localeinfo.h"
- #endif
  
 +#ifdef _LIBC
-+# include <gnu/option-groups.h>
++# include <lowlevellock.h>
++# include <tls.h>
++# include <pthread-functions.h>
++# include <errno.h> /* For EBUSY.  */
++# include <gnu/option-groups.h> /* For __OPTION_EGLIBC_BIG_MACROS.  */
 +#endif
 +
- #if defined emacs && !defined HAVE_BCOPY
- # define HAVE_MEMCPY 1
- #endif
-@@ -882,7 +886,7 @@ __strftime_internal (s, maxsize, format,
- 	case L_('C'):
- 	  if (modifier == L_('E'))
- 	    {
--#if HAVE_STRUCT_ERA_ENTRY
-+#if (! _LIBC || __OPTION_EGLIBC_LOCALE_CODE) && HAVE_STRUCT_ERA_ENTRY
- 	      struct era_entry *era = _nl_get_era_entry (tp HELPER_LOCALE_ARG);
- 	      if (era)
- 		{
-@@ -955,7 +959,7 @@ __strftime_internal (s, maxsize, format,
+ /* Mutex type.  */
+ #if defined _LIBC || defined _IO_MTSAFE_IO
+ # if (!IS_IN (libc) && !IS_IN (libpthread)) || !defined _LIBC
+@@ -87,6 +95,15 @@ typedef struct __libc_lock_recursive_opaque__ __libc_lock_recursive_t;
  
- 	  if (modifier == L_('O') && 0 <= number_value)
- 	    {
--#ifdef _NL_CURRENT
-+#if (! _LIBC || __OPTION_EGLIBC_LOCALE_CODE) && defined (_NL_CURRENT)
- 	      /* Get the locale specific alternate representation of
- 		 the number NUMBER_VALUE.  If none exist NULL is returned.  */
- 	      const CHAR_T *cp = nl_get_alt_digit (number_value
-@@ -1260,7 +1264,7 @@ __strftime_internal (s, maxsize, format,
- 	case L_('Y'):
- 	  if (modifier == 'E')
- 	    {
--#if HAVE_STRUCT_ERA_ENTRY
-+#if (! _LIBC || __OPTION_EGLIBC_LOCALE_CODE) && HAVE_STRUCT_ERA_ENTRY
- 	      struct era_entry *era = _nl_get_era_entry (tp HELPER_LOCALE_ARG);
- 	      if (era)
- 		{
-@@ -1285,7 +1289,7 @@ __strftime_internal (s, maxsize, format,
- 	case L_('y'):
- 	  if (modifier == L_('E'))
- 	    {
--#if HAVE_STRUCT_ERA_ENTRY
-+#if (! _LIBC || __OPTION_EGLIBC_LOCALE_CODE) && HAVE_STRUCT_ERA_ENTRY
- 	      struct era_entry *era = _nl_get_era_entry (tp HELPER_LOCALE_ARG);
- 	      if (era)
- 		{
-Index: git/time/strptime_l.c
-===================================================================
---- git.orig/time/strptime_l.c
-+++ git/time/strptime_l.c
-@@ -29,6 +29,7 @@
+ /* Lock the recursive named lock variable.  */
+ #if defined _LIBC && (IS_IN (libc) || IS_IN (libpthread))
++# if __OPTION_EGLIBC_BIG_MACROS != 1
++/* EGLIBC: Declare wrapper function for a big macro if either
++   !__OPTION_EGLIBC_BIG_MACROS or we are using a back door from
++   small-macros-fns.c (__OPTION_EGLIBC_BIG_MACROS == 2).  */
++extern void __libc_lock_lock_recursive_fn (__libc_lock_recursive_t *);
++libc_hidden_proto (__libc_lock_lock_recursive_fn);
++# endif /* __OPTION_EGLIBC_BIG_MACROS != 1 */
++# if __OPTION_EGLIBC_BIG_MACROS
++
+ # define __libc_lock_lock_recursive(NAME) \
+   do {									      \
+     void *self = THREAD_SELF;						      \
+@@ -97,6 +114,10 @@ typedef struct __libc_lock_recursive_opaque__ __libc_lock_recursive_t;
+       }									      \
+     ++(NAME).cnt;							      \
+   } while (0)
++# else
++# define __libc_lock_lock_recursive(NAME)				\
++  __libc_lock_lock_recursive_fn (&(NAME))
++# endif /* __OPTION_EGLIBC_BIG_MACROS */
+ #else
+ # define __libc_lock_lock_recursive(NAME) \
+   __libc_maybe_call (__pthread_mutex_lock, (&(NAME).mutex), 0)
+@@ -104,6 +125,14 @@ typedef struct __libc_lock_recursive_opaque__ __libc_lock_recursive_t;
  
- #ifdef _LIBC
- # define HAVE_LOCALTIME_R 0
-+# include <gnu/option-groups.h>
- # include "../locale/localeinfo.h"
- #endif
+ /* Try to lock the recursive named lock variable.  */
+ #if defined _LIBC && (IS_IN (libc) || IS_IN (libpthread))
++# if __OPTION_EGLIBC_BIG_MACROS != 1
++/* EGLIBC: Declare wrapper function for a big macro if either
++   !__OPTION_EGLIBC_BIG_MACROS or we are using a back door from
++   small-macros-fns.c (__OPTION_EGLIBC_BIG_MACROS == 2).  */
++extern int __libc_lock_trylock_recursive_fn (__libc_lock_recursive_t *);
++libc_hidden_proto (__libc_lock_trylock_recursive_fn);
++# endif /* __OPTION_EGLIBC_BIG_MACROS != 1 */
++# if __OPTION_EGLIBC_BIG_MACROS
+ # define __libc_lock_trylock_recursive(NAME) \
+   ({									      \
+     int result = 0;							      \
+@@ -122,6 +151,10 @@ typedef struct __libc_lock_recursive_opaque__ __libc_lock_recursive_t;
+       ++(NAME).cnt;							      \
+     result;								      \
+   })
++# else
++# define __libc_lock_trylock_recursive(NAME) \
++  __libc_lock_trylock_recursive_fn (&(NAME))
++# endif /* __OPTION_EGLIBC_BIG_MACROS */
+ #else
+ # define __libc_lock_trylock_recursive(NAME) \
+   __libc_maybe_call (__pthread_mutex_trylock, (&(NAME).mutex), 0)
+@@ -129,6 +162,14 @@ typedef struct __libc_lock_recursive_opaque__ __libc_lock_recursive_t;
  
-@@ -84,7 +85,7 @@ localtime_r (t, tp)
-     if (val < from || val > to)						      \
-       return NULL;							      \
+ /* Unlock the recursive named lock variable.  */
+ #if defined _LIBC && (IS_IN (libc) || IS_IN (libpthread))
++# if __OPTION_EGLIBC_BIG_MACROS != 1
++/* EGLIBC: Declare wrapper function for a big macro if either
++   !__OPTION_EGLIBC_BIG_MACROS, or we are using a back door from
++   small-macros-fns.c (__OPTION_EGLIBC_BIG_MACROS == 2).  */
++extern void __libc_lock_unlock_recursive_fn (__libc_lock_recursive_t *);
++libc_hidden_proto (__libc_lock_unlock_recursive_fn);
++# endif /* __OPTION_EGLIBC_BIG_MACROS != 1 */
++# if __OPTION_EGLIBC_BIG_MACROS
+ /* We do no error checking here.  */
+ # define __libc_lock_unlock_recursive(NAME) \
+   do {									      \
+@@ -138,6 +179,10 @@ typedef struct __libc_lock_recursive_opaque__ __libc_lock_recursive_t;
+ 	lll_unlock ((NAME).lock, LLL_PRIVATE);				      \
+       }									      \
    } while (0)
--#ifdef _NL_CURRENT
-+#if (! _LIBC || __OPTION_EGLIBC_LOCALE_CODE) && defined (_NL_CURRENT)
- # define get_alt_number(from, to, n) \
-   ({									      \
-      __label__ do_normal;						      \
-@@ -257,8 +258,10 @@ __strptime_internal (rp, fmt, tmp, state
-   int cnt;
-   int cnt_longest;
-   size_t val;
-+#if ! _LIBC || __OPTION_EGLIBC_LOCALE_CODE
-   size_t num_eras;
-   struct era_entry *era = NULL;
-+#endif
-   enum ptime_locale_status { not, loc, raw } decided_longest;
-   struct __strptime_state
-   {
-@@ -820,6 +823,7 @@ __strptime_internal (rp, fmt, tmp, state
- 	      s.want_xday = 1;
- 	      break;
- 	    case 'C':
-+#if ! _LIBC || __OPTION_EGLIBC_LOCALE_CODE
- 	      if (s.decided != raw)
- 		{
- 		  if (s.era_cnt >= 0)
-@@ -856,10 +860,12 @@ __strptime_internal (rp, fmt, tmp, state
++# else
++# define __libc_lock_unlock_recursive(NAME) \
++  __libc_lock_unlock_recursive_fn (&(NAME))
++# endif /* __OPTION_EGLIBC_BIG_MACROS */
+ #else
+ # define __libc_lock_unlock_recursive(NAME) \
+   __libc_maybe_call (__pthread_mutex_unlock, (&(NAME).mutex), 0)
+diff --git a/sysdeps/nptl/bits/libc-lockP.h b/sysdeps/nptl/bits/libc-lockP.h
+index f55f621..da98869 100644
+--- a/sysdeps/nptl/bits/libc-lockP.h
++++ b/sysdeps/nptl/bits/libc-lockP.h
+@@ -33,6 +33,8 @@
+ #include <lowlevellock.h>
+ #include <tls.h>
+ #include <pthread-functions.h>
++#include <errno.h> /* For EBUSY.  */
++#include <gnu/option-groups.h> /* For __OPTION_EGLIBC_BIG_MACROS.  */
  
- 		  s.decided = raw;
- 		}
-+#endif
- 	      /* The C locale has no era information, so use the
- 		 normal representation.  */
- 	      goto match_century;
-  	    case 'y':
-+#if ! _LIBC || __OPTION_EGLIBC_LOCALE_CODE
- 	      if (s.decided != raw)
- 		{
- 		  get_number(0, 9999, 4);
-@@ -918,9 +924,10 @@ __strptime_internal (rp, fmt, tmp, state
- 
- 		  s.decided = raw;
- 		}
--
-+#endif
- 	      goto match_year_in_century;
- 	    case 'Y':
-+#if ! _LIBC || __OPTION_EGLIBC_LOCALE_CODE
- 	      if (s.decided != raw)
- 		{
- 		  num_eras = _NL_CURRENT_WORD (LC_TIME,
-@@ -948,6 +955,7 @@ __strptime_internal (rp, fmt, tmp, state
- 
- 		  s.decided = raw;
- 		}
-+#endif
- 	      get_number (0, 9999, 4);
- 	      tm->tm_year = val - 1900;
- 	      s.want_century = 0;
-@@ -1118,6 +1126,7 @@ __strptime_internal (rp, fmt, tmp, state
- 	tm->tm_year = (s.century - 19) * 100;
-     }
- 
-+#if ! _LIBC || __OPTION_EGLIBC_LOCALE_CODE
-   if (s.era_cnt != -1)
-     {
-       era = _nl_select_era_entry (s.era_cnt HELPER_LOCALE_ARG);
-@@ -1132,6 +1141,7 @@ __strptime_internal (rp, fmt, tmp, state
- 	tm->tm_year = era->start_date[0];
-     }
-   else
-+#endif
-     if (s.want_era)
-       {
- 	/* No era found but we have seen an E modifier.  Rectify some
-Index: git/timezone/Makefile
-===================================================================
---- git.orig/timezone/Makefile
-+++ git/timezone/Makefile
-@@ -117,7 +117,7 @@ $(testdata)/Asia/Tokyo: asia $(zic-deps)
- 
- $(objpfx)tzselect: tzselect.ksh $(common-objpfx)config.make
- 	sed -e 's|/bin/bash|/bin/sh|' \
--	    -e 's|TZDIR=[^}]*|TZDIR=$(zonedir)|' \
-+	    -e '/TZDIR=/s|\$$(pwd)|$(zonedir)|' \
- 	    -e '/TZVERSION=/s|see_Makefile|"$(version)"|' \
- 	    -e '/PKGVERSION=/s|=.*|="$(PKGVERSION)"|' \
- 	    -e '/REPORT_BUGS_TO=/s|=.*|="$(REPORT_BUGS_TO)"|' \
-Index: git/wcsmbs/Makefile
-===================================================================
---- git.orig/wcsmbs/Makefile
-+++ git/wcsmbs/Makefile
-@@ -18,15 +18,21 @@
- #
- #	Sub-makefile for wcsmbs portion of the library.
- #
-+include ../option-groups.mak
-+
- subdir	:= wcsmbs
- 
- include ../Makeconfig
- 
- headers	:= wchar.h bits/wchar.h bits/wchar2.h bits/wchar-ldbl.h uchar.h
- 
--routines := wcscat wcschr wcscmp wcscpy wcscspn wcsdup wcslen wcsncat \
-+# These functions are used by printf_fp.c, even in the plain case; see
-+# comments there for OPTION_EGLIBC_LOCALE_CODE.
-+routines  := wmemcpy wmemset
-+routines-$(OPTION_POSIX_C_LANG_WIDE_CHAR) \
-+	  := wcscat wcschr wcscmp wcscpy wcscspn wcsdup wcslen wcsncat \
- 	    wcsncmp wcsncpy wcspbrk wcsrchr wcsspn wcstok wcsstr wmemchr \
--	    wmemcmp wmemcpy wmemmove wmemset wcpcpy wcpncpy wmempcpy \
-+	    wmemcmp wmemmove wcpcpy wcpncpy wmempcpy \
- 	    btowc wctob mbsinit \
- 	    mbrlen mbrtowc wcrtomb mbsrtowcs wcsrtombs \
- 	    mbsnrtowcs wcsnrtombs wcsnlen wcschrnul \
-@@ -38,14 +44,21 @@ routines := wcscat wcschr wcscmp wcscpy
- 	    wcscoll_l wcsxfrm_l \
- 	    wcscasecmp wcsncase wcscasecmp_l wcsncase_l \
- 	    wcsmbsload mbsrtowcs_l \
--	    isoc99_wscanf isoc99_vwscanf isoc99_fwscanf isoc99_vfwscanf \
- 	    isoc99_swscanf isoc99_vswscanf \
- 	    mbrtoc16 c16rtomb
- 
-+routines-$(OPTION_POSIX_WIDE_CHAR_DEVICE_IO)                           \
-+	+= isoc99_wscanf isoc99_vwscanf isoc99_fwscanf isoc99_vfwscanf
-+
- strop-tests :=  wcscmp wmemcmp wcslen wcschr wcsrchr wcscpy
--tests := tst-wcstof wcsmbs-tst1 tst-wcsnlen tst-btowc tst-mbrtowc \
--	 tst-wcrtomb tst-wcpncpy tst-mbsrtowcs tst-wchar-h tst-mbrtowc2 \
--	 tst-c16c32-1 wcsatcliff $(addprefix test-,$(strop-tests))
-+
-+tests := tst-wchar-h
-+tests-$(OPTION_EGLIBC_LOCALE_CODE) \
-+	+= tst-btowc tst-mbrtowc tst-mbrtowc2 tst-wcrtomb tst-c16c32-1
-+tests-$(OPTION_POSIX_C_LANG_WIDE_CHAR) \
-+	+= tst-wcstof wcsmbs-tst1 tst-wcsnlen \
-+	 tst-wcpncpy tst-mbsrtowcs \
-+	 wcsatcliff $(addprefix test-,$(strop-tests))
- 
- include ../Rules
- 
-Index: git/wcsmbs/wcsmbsload.c
-===================================================================
---- git.orig/wcsmbs/wcsmbsload.c
-+++ git/wcsmbs/wcsmbsload.c
-@@ -21,6 +21,7 @@
- #include <limits.h>
- #include <stdlib.h>
- #include <string.h>
-+#include <gnu/option-groups.h>
- 
- #include <locale/localeinfo.h>
- #include <wcsmbsload.h>
-@@ -143,6 +144,7 @@ __wcsmbs_getfct (const char *to, const c
-   })
- 
- 
-+#if __OPTION_EGLIBC_LOCALE_CODE
- /* Some of the functions here must not be used while setlocale is called.  */
- __libc_rwlock_define (extern, __libc_setlocale_lock attribute_hidden)
- 
-@@ -211,6 +213,17 @@ __wcsmbs_load_conv (struct __locale_data
- 
-   __libc_rwlock_unlock (__libc_setlocale_lock);
- }
-+#else
-+void
-+internal_function
-+__wcsmbs_load_conv (struct __locale_data *new_category)
-+{
-+  /* When OPTION_EGLIBC_LOCALE_CODE is disabled, we should never reach
-+     this point: there is no way to change locales, so every locale
-+     passed to get_gconv_fcts should be _nl_C_LC_CTYPE.  */
-+  abort ();
-+}
-+#endif
- 
- 
- /* Clone the current conversion function set.  */
-Index: git/wctype/Makefile
-===================================================================
---- git.orig/wctype/Makefile
-+++ git/wctype/Makefile
-@@ -18,14 +18,20 @@
- #
- #	Sub-makefile for wctype portion of the library.
- #
-+include ../option-groups.mak
-+
- subdir	:= wctype
- 
- include ../Makeconfig
- 
- headers		:= wctype.h
--routines	:= wcfuncs wctype iswctype wctrans towctrans \
--		   wcfuncs_l wctype_l iswctype_l wctrans_l towctrans_l
-+routines 	:= wctrans towctrans towctrans_l
-+routines-$(OPTION_POSIX_C_LANG_WIDE_CHAR) \
-+		:= wcfuncs wctype iswctype \
-+		   wcfuncs_l wctype_l iswctype_l wctrans_l
- 
--tests	:= test_wctype test_wcfuncs bug-wctypeh
-+tests	:=
-+tests-$(OPTION_POSIX_C_LANG_WIDE_CHAR) \
-+     += test_wctype test_wcfuncs bug-wctypeh
- 
- include ../Rules
-Index: git/sysdeps/nptl/Makefile
-===================================================================
---- git.orig/sysdeps/nptl/Makefile
-+++ git/sysdeps/nptl/Makefile
-@@ -18,6 +18,9 @@
- 
- ifeq ($(subdir),nptl)
- libpthread-sysdep_routines += errno-loc
-+ifeq ($(OPTION_EGLIBC_BIG_MACROS),n)
-+sysdep_routines += small-macros-fns
-+endif
- endif
- 
- ifeq ($(subdir),rt)
-Index: git/sysdeps/nptl/bits/libc-lock.h
-===================================================================
---- git.orig/sysdeps/nptl/bits/libc-lock.h
-+++ git/sysdeps/nptl/bits/libc-lock.h
-@@ -24,6 +24,14 @@
- #include <stddef.h>
- 
- 
-+#ifdef _LIBC
-+# include <lowlevellock.h>
-+# include <tls.h>
-+# include <pthread-functions.h>
-+# include <errno.h> /* For EBUSY.  */
-+# include <gnu/option-groups.h> /* For __OPTION_EGLIBC_BIG_MACROS.  */
-+#endif
-+
- /* Mutex type.  */
- #if defined _LIBC || defined _IO_MTSAFE_IO
- # if (!IS_IN (libc) && !IS_IN (libpthread)) || !defined _LIBC
-@@ -87,6 +95,15 @@ typedef struct __libc_lock_recursive_opa
- 
- /* Lock the recursive named lock variable.  */
- #if defined _LIBC && (IS_IN (libc) || IS_IN (libpthread))
-+# if __OPTION_EGLIBC_BIG_MACROS != 1
-+/* EGLIBC: Declare wrapper function for a big macro if either
-+   !__OPTION_EGLIBC_BIG_MACROS or we are using a back door from
-+   small-macros-fns.c (__OPTION_EGLIBC_BIG_MACROS == 2).  */
-+extern void __libc_lock_lock_recursive_fn (__libc_lock_recursive_t *);
-+libc_hidden_proto (__libc_lock_lock_recursive_fn);
-+# endif /* __OPTION_EGLIBC_BIG_MACROS != 1 */
-+# if __OPTION_EGLIBC_BIG_MACROS
-+
- # define __libc_lock_lock_recursive(NAME) \
-   do {									      \
-     void *self = THREAD_SELF;						      \
-@@ -97,6 +114,10 @@ typedef struct __libc_lock_recursive_opa
-       }									      \
-     ++(NAME).cnt;							      \
-   } while (0)
-+# else
-+# define __libc_lock_lock_recursive(NAME)				\
-+  __libc_lock_lock_recursive_fn (&(NAME))
-+# endif /* __OPTION_EGLIBC_BIG_MACROS */
- #else
- # define __libc_lock_lock_recursive(NAME) \
-   __libc_maybe_call (__pthread_mutex_lock, (&(NAME).mutex), 0)
-@@ -104,6 +125,14 @@ typedef struct __libc_lock_recursive_opa
- 
- /* Try to lock the recursive named lock variable.  */
- #if defined _LIBC && (IS_IN (libc) || IS_IN (libpthread))
-+# if __OPTION_EGLIBC_BIG_MACROS != 1
-+/* EGLIBC: Declare wrapper function for a big macro if either
-+   !__OPTION_EGLIBC_BIG_MACROS or we are using a back door from
-+   small-macros-fns.c (__OPTION_EGLIBC_BIG_MACROS == 2).  */
-+extern int __libc_lock_trylock_recursive_fn (__libc_lock_recursive_t *);
-+libc_hidden_proto (__libc_lock_trylock_recursive_fn);
-+# endif /* __OPTION_EGLIBC_BIG_MACROS != 1 */
-+# if __OPTION_EGLIBC_BIG_MACROS
- # define __libc_lock_trylock_recursive(NAME) \
-   ({									      \
-     int result = 0;							      \
-@@ -122,6 +151,10 @@ typedef struct __libc_lock_recursive_opa
-       ++(NAME).cnt;							      \
-     result;								      \
-   })
-+# else
-+# define __libc_lock_trylock_recursive(NAME) \
-+  __libc_lock_trylock_recursive_fn (&(NAME))
-+# endif /* __OPTION_EGLIBC_BIG_MACROS */
- #else
- # define __libc_lock_trylock_recursive(NAME) \
-   __libc_maybe_call (__pthread_mutex_trylock, (&(NAME).mutex), 0)
-@@ -129,6 +162,14 @@ typedef struct __libc_lock_recursive_opa
- 
- /* Unlock the recursive named lock variable.  */
- #if defined _LIBC && (IS_IN (libc) || IS_IN (libpthread))
-+# if __OPTION_EGLIBC_BIG_MACROS != 1
-+/* EGLIBC: Declare wrapper function for a big macro if either
-+   !__OPTION_EGLIBC_BIG_MACROS, or we are using a back door from
-+   small-macros-fns.c (__OPTION_EGLIBC_BIG_MACROS == 2).  */
-+extern void __libc_lock_unlock_recursive_fn (__libc_lock_recursive_t *);
-+libc_hidden_proto (__libc_lock_unlock_recursive_fn);
-+# endif /* __OPTION_EGLIBC_BIG_MACROS != 1 */
-+# if __OPTION_EGLIBC_BIG_MACROS
- /* We do no error checking here.  */
- # define __libc_lock_unlock_recursive(NAME) \
-   do {									      \
-@@ -138,6 +179,10 @@ typedef struct __libc_lock_recursive_opa
- 	lll_unlock ((NAME).lock, LLL_PRIVATE);				      \
-       }									      \
-   } while (0)
-+# else
-+# define __libc_lock_unlock_recursive(NAME) \
-+  __libc_lock_unlock_recursive_fn (&(NAME))
-+# endif /* __OPTION_EGLIBC_BIG_MACROS */
- #else
- # define __libc_lock_unlock_recursive(NAME) \
-   __libc_maybe_call (__pthread_mutex_unlock, (&(NAME).mutex), 0)
-Index: git/sysdeps/nptl/bits/libc-lockP.h
-===================================================================
---- git.orig/sysdeps/nptl/bits/libc-lockP.h
-+++ git/sysdeps/nptl/bits/libc-lockP.h
-@@ -33,6 +33,8 @@
- #include <lowlevellock.h>
- #include <tls.h>
- #include <pthread-functions.h>
-+#include <errno.h> /* For EBUSY.  */
-+#include <gnu/option-groups.h> /* For __OPTION_EGLIBC_BIG_MACROS.  */
- 
- #if IS_IN (libpthread)
- /* This gets us the declarations of the __pthread_* internal names,
-@@ -171,10 +173,22 @@ typedef pthread_key_t __libc_key_t;
+ #if IS_IN (libpthread)
+ /* This gets us the declarations of the __pthread_* internal names,
+@@ -171,10 +173,22 @@ typedef pthread_key_t __libc_key_t;
  
  /* Lock the named lock variable.  */
  #if IS_IN (libc) || IS_IN (libpthread)
@@ -16547,10 +16385,11 @@ Index: git/sysdeps/nptl/bits/libc-lockP.h
  #else
  # define __libc_lock_unlock(NAME) \
    __libc_maybe_call (__pthread_mutex_unlock, (&(NAME)), 0)
-Index: git/sysdeps/nptl/small-macros-fns.c
-===================================================================
+diff --git a/sysdeps/nptl/small-macros-fns.c b/sysdeps/nptl/small-macros-fns.c
+new file mode 100644
+index 0000000..f751053
 --- /dev/null
-+++ git/sysdeps/nptl/small-macros-fns.c
++++ b/sysdeps/nptl/small-macros-fns.c
 @@ -0,0 +1,72 @@
 +/* EGLIBC: function wrappers for big macros.
 +   Copyright (C) 2009 Free Software Foundation, Inc.
@@ -16624,102 +16463,380 @@ Index: git/sysdeps/nptl/small-macros-fns.c
 +libc_hidden_def (__libc_lock_unlock_recursive_fn);
 +
 +#endif /*defined _LIBC && (!defined NOT_IN_libc || defined IS_IN_libpthread)*/
-Index: git/crypt/crypt_common.c
-===================================================================
---- /dev/null
-+++ git/crypt/crypt_common.c
-@@ -0,0 +1,42 @@
-+/*
-+ * crypt: crypt(3) implementation
-+ *
-+ * Copyright (C) 1991-2014 Free Software Foundation, Inc.
-+ *
-+ * This library is free software; you can redistribute it and/or
-+ * modify it under the terms of the GNU Lesser General Public
-+ * License as published by the Free Software Foundation; either
-+ * version 2.1 of the License, or (at your option) any later version.
-+ *
-+ * This library is distributed in the hope that it will be useful,
-+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+ * Lesser General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU Lesser General Public
-+ * License along with this library; see the file COPYING.LIB.  If not,
-+ * see <http://www.gnu.org/licenses/>.
-+ *
-+ * General Support routines
-+ *
-+ */
+diff --git a/sysdeps/unix/sysv/linux/gethostid.c b/sysdeps/unix/sysv/linux/gethostid.c
+index 26e4692..d0a26c8 100644
+--- a/sysdeps/unix/sysv/linux/gethostid.c
++++ b/sysdeps/unix/sysv/linux/gethostid.c
+@@ -21,6 +21,7 @@
+ #include <unistd.h>
+ #include <netdb.h>
+ #include <not-cancel.h>
++#include <gnu/option-groups.h>
+ 
+ #define HOSTIDFILE "/etc/hostid"
+ 
+@@ -89,6 +90,7 @@ gethostid (void)
+ 	return id;
+     }
+ 
++#if __OPTION_EGLIBC_INET
+   /* Getting from the file was not successful.  An intelligent guess for
+      a unique number of a host is its IP address.  Return this.  */
+   if (__gethostname (hostname, MAXHOSTNAMELEN) < 0 || hostname[0] == '\0')
+@@ -115,5 +117,9 @@ gethostid (void)
+   /* For the return value to be not exactly the IP address we do some
+      bit fiddling.  */
+   return (int32_t) (in.s_addr << 16 | in.s_addr >> 16);
++#else
++  /* Return an arbitrary value.  */
++  return 0;
++#endif
+ }
+ #endif
+diff --git a/sysdeps/unix/sysv/linux/libc_fatal.c b/sysdeps/unix/sysv/linux/libc_fatal.c
+index 53a8bbb..cb110d4 100644
+--- a/sysdeps/unix/sysv/linux/libc_fatal.c
++++ b/sysdeps/unix/sysv/linux/libc_fatal.c
+@@ -23,6 +23,7 @@
+ #include <string.h>
+ #include <sys/mman.h>
+ #include <sys/uio.h>
++#include <gnu/option-groups.h>
+ 
+ static bool
+ writev_for_fatal (int fd, const struct iovec *iov, size_t niov, size_t total)
+@@ -40,6 +41,7 @@ writev_for_fatal (int fd, const struct iovec *iov, size_t niov, size_t total)
+ static void
+ backtrace_and_maps (int do_abort, bool written, int fd)
+ {
++#if __OPTION_EGLIBC_BACKTRACE
+   if (do_abort > 1 && written)
+     {
+       void *addrs[64];
+@@ -62,6 +64,7 @@ backtrace_and_maps (int do_abort, bool written, int fd)
+           close_not_cancel_no_status (fd2);
+         }
+     }
++#endif /* __OPTION_EGLIBC_BACKTRACE */
+ }
+ #define BEFORE_ABORT		backtrace_and_maps
+ 
+diff --git a/time/Makefile b/time/Makefile
+index a411f62..2d022ca 100644
+--- a/time/Makefile
++++ b/time/Makefile
+@@ -18,6 +18,8 @@
+ #
+ #	Makefile for time routines
+ #
++include ../option-groups.mak
 +
-+#include "crypt-private.h"
+ subdir	:= time
+ 
+ include ../Makeconfig
+@@ -30,15 +32,23 @@ routines := offtime asctime clock ctime ctime_r difftime \
+ 	    tzfile getitimer setitimer			 \
+ 	    stime dysize timegm ftime			 \
+ 	    getdate strptime strptime_l			 \
+-	    strftime wcsftime strftime_l wcsftime_l	 \
++	    strftime strftime_l				 \
+ 	    timespec_get
+-aux :=	    era alt_digit lc-time-cleanup
+ 
+-tests	:= test_time clocktest tst-posixtz tst-strptime tst_wcsftime \
+-	   tst-getdate tst-mktime tst-mktime2 tst-ftime_l tst-strftime \
++routines-$(OPTION_POSIX_C_LANG_WIDE_CHAR)                \
++	    := wcsftime wcsftime_l
++aux-$(OPTION_EGLIBC_LOCALE_CODE) += alt_digit era lc-time-cleanup
 +
-+/* Table with characters for base64 transformation.  */
-+static const char b64t[64] =
-+"./0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
++tests	:= test_time clocktest tst-posixtz \
++	   tst-getdate tst-mktime tst-mktime2 tst-strftime \
+ 	   tst-mktime3 tst-strptime2 bug-asctime bug-asctime_r bug-mktime1 \
+ 	   tst-strptime3 bug-getdate1 tst-strptime-whitespace tst-ftime
+ 
++tests-$(OPTION_EGLIBC_LOCALE_CODE) \
++	        += tst-strptime tst-ftime_l
++tests-$(OPTION_POSIX_WIDE_CHAR_DEVICE_IO) \
++	        += tst_wcsftime
++
+ include ../Rules
+ 
+ tz-cflags = -DTZDIR='"$(zonedir)"' \
+diff --git a/time/strftime_l.c b/time/strftime_l.c
+index b48ef34..bfdd618 100644
+--- a/time/strftime_l.c
++++ b/time/strftime_l.c
+@@ -35,6 +35,10 @@
+ # include "../locale/localeinfo.h"
+ #endif
+ 
++#ifdef _LIBC
++# include <gnu/option-groups.h>
++#endif
 +
+ #if defined emacs && !defined HAVE_BCOPY
+ # define HAVE_MEMCPY 1
+ #endif
+@@ -882,7 +886,7 @@ __strftime_internal (s, maxsize, format, tp, tzset_called ut_argument
+ 	case L_('C'):
+ 	  if (modifier == L_('E'))
+ 	    {
+-#if HAVE_STRUCT_ERA_ENTRY
++#if (! _LIBC || __OPTION_EGLIBC_LOCALE_CODE) && HAVE_STRUCT_ERA_ENTRY
+ 	      struct era_entry *era = _nl_get_era_entry (tp HELPER_LOCALE_ARG);
+ 	      if (era)
+ 		{
+@@ -955,7 +959,7 @@ __strftime_internal (s, maxsize, format, tp, tzset_called ut_argument
+ 
+ 	  if (modifier == L_('O') && 0 <= number_value)
+ 	    {
+-#ifdef _NL_CURRENT
++#if (! _LIBC || __OPTION_EGLIBC_LOCALE_CODE) && defined (_NL_CURRENT)
+ 	      /* Get the locale specific alternate representation of
+ 		 the number NUMBER_VALUE.  If none exist NULL is returned.  */
+ 	      const CHAR_T *cp = nl_get_alt_digit (number_value
+@@ -1260,7 +1264,7 @@ __strftime_internal (s, maxsize, format, tp, tzset_called ut_argument
+ 	case L_('Y'):
+ 	  if (modifier == 'E')
+ 	    {
+-#if HAVE_STRUCT_ERA_ENTRY
++#if (! _LIBC || __OPTION_EGLIBC_LOCALE_CODE) && HAVE_STRUCT_ERA_ENTRY
+ 	      struct era_entry *era = _nl_get_era_entry (tp HELPER_LOCALE_ARG);
+ 	      if (era)
+ 		{
+@@ -1285,7 +1289,7 @@ __strftime_internal (s, maxsize, format, tp, tzset_called ut_argument
+ 	case L_('y'):
+ 	  if (modifier == L_('E'))
+ 	    {
+-#if HAVE_STRUCT_ERA_ENTRY
++#if (! _LIBC || __OPTION_EGLIBC_LOCALE_CODE) && HAVE_STRUCT_ERA_ENTRY
+ 	      struct era_entry *era = _nl_get_era_entry (tp HELPER_LOCALE_ARG);
+ 	      if (era)
+ 		{
+diff --git a/time/strptime_l.c b/time/strptime_l.c
+index 5640cce..784ccbc 100644
+--- a/time/strptime_l.c
++++ b/time/strptime_l.c
+@@ -29,6 +29,7 @@
+ 
+ #ifdef _LIBC
+ # define HAVE_LOCALTIME_R 0
++# include <gnu/option-groups.h>
+ # include "../locale/localeinfo.h"
+ #endif
+ 
+@@ -84,7 +85,7 @@ localtime_r (t, tp)
+     if (val < from || val > to)						      \
+       return NULL;							      \
+   } while (0)
+-#ifdef _NL_CURRENT
++#if (! _LIBC || __OPTION_EGLIBC_LOCALE_CODE) && defined (_NL_CURRENT)
+ # define get_alt_number(from, to, n) \
+   ({									      \
+      __label__ do_normal;						      \
+@@ -257,8 +258,10 @@ __strptime_internal (rp, fmt, tmp, statep LOCALE_PARAM)
+   int cnt;
+   int cnt_longest;
+   size_t val;
++#if ! _LIBC || __OPTION_EGLIBC_LOCALE_CODE
+   size_t num_eras;
+   struct era_entry *era = NULL;
++#endif
+   enum ptime_locale_status { not, loc, raw } decided_longest;
+   struct __strptime_state
+   {
+@@ -820,6 +823,7 @@ __strptime_internal (rp, fmt, tmp, statep LOCALE_PARAM)
+ 	      s.want_xday = 1;
+ 	      break;
+ 	    case 'C':
++#if ! _LIBC || __OPTION_EGLIBC_LOCALE_CODE
+ 	      if (s.decided != raw)
+ 		{
+ 		  if (s.era_cnt >= 0)
+@@ -856,10 +860,12 @@ __strptime_internal (rp, fmt, tmp, statep LOCALE_PARAM)
+ 
+ 		  s.decided = raw;
+ 		}
++#endif
+ 	      /* The C locale has no era information, so use the
+ 		 normal representation.  */
+ 	      goto match_century;
+  	    case 'y':
++#if ! _LIBC || __OPTION_EGLIBC_LOCALE_CODE
+ 	      if (s.decided != raw)
+ 		{
+ 		  get_number(0, 9999, 4);
+@@ -918,9 +924,10 @@ __strptime_internal (rp, fmt, tmp, statep LOCALE_PARAM)
+ 
+ 		  s.decided = raw;
+ 		}
+-
++#endif
+ 	      goto match_year_in_century;
+ 	    case 'Y':
++#if ! _LIBC || __OPTION_EGLIBC_LOCALE_CODE
+ 	      if (s.decided != raw)
+ 		{
+ 		  num_eras = _NL_CURRENT_WORD (LC_TIME,
+@@ -948,6 +955,7 @@ __strptime_internal (rp, fmt, tmp, statep LOCALE_PARAM)
+ 
+ 		  s.decided = raw;
+ 		}
++#endif
+ 	      get_number (0, 9999, 4);
+ 	      tm->tm_year = val - 1900;
+ 	      s.want_century = 0;
+@@ -1118,6 +1126,7 @@ __strptime_internal (rp, fmt, tmp, statep LOCALE_PARAM)
+ 	tm->tm_year = (s.century - 19) * 100;
+     }
+ 
++#if ! _LIBC || __OPTION_EGLIBC_LOCALE_CODE
+   if (s.era_cnt != -1)
+     {
+       era = _nl_select_era_entry (s.era_cnt HELPER_LOCALE_ARG);
+@@ -1132,6 +1141,7 @@ __strptime_internal (rp, fmt, tmp, statep LOCALE_PARAM)
+ 	tm->tm_year = era->start_date[0];
+     }
+   else
++#endif
+     if (s.want_era)
+       {
+ 	/* No era found but we have seen an E modifier.  Rectify some
+diff --git a/timezone/Makefile b/timezone/Makefile
+index 886b06e..f922684 100644
+--- a/timezone/Makefile
++++ b/timezone/Makefile
+@@ -127,7 +127,7 @@ $(testdata)/XT%: testdata/XT%
+ 
+ $(objpfx)tzselect: tzselect.ksh $(common-objpfx)config.make
+ 	sed -e 's|/bin/bash|/bin/sh|' \
+-	    -e 's|TZDIR=[^}]*|TZDIR=$(zonedir)|' \
++	    -e '/TZDIR=/s|\$$(pwd)|$(zonedir)|' \
+ 	    -e '/TZVERSION=/s|see_Makefile|"$(version)"|' \
+ 	    -e '/PKGVERSION=/s|=.*|="$(PKGVERSION)"|' \
+ 	    -e '/REPORT_BUGS_TO=/s|=.*|="$(REPORT_BUGS_TO)"|' \
+diff --git a/wcsmbs/Makefile b/wcsmbs/Makefile
+index 44a4494..db9fc24 100644
+--- a/wcsmbs/Makefile
++++ b/wcsmbs/Makefile
+@@ -18,15 +18,21 @@
+ #
+ #	Sub-makefile for wcsmbs portion of the library.
+ #
++include ../option-groups.mak
++
+ subdir	:= wcsmbs
+ 
+ include ../Makeconfig
+ 
+ headers	:= wchar.h bits/wchar.h bits/wchar2.h bits/wchar-ldbl.h uchar.h
+ 
+-routines := wcscat wcschr wcscmp wcscpy wcscspn wcsdup wcslen wcsncat \
++# These functions are used by printf_fp.c, even in the plain case; see
++# comments there for OPTION_EGLIBC_LOCALE_CODE.
++routines  := wmemcpy wmemset
++routines-$(OPTION_POSIX_C_LANG_WIDE_CHAR) \
++	  := wcscat wcschr wcscmp wcscpy wcscspn wcsdup wcslen wcsncat \
+ 	    wcsncmp wcsncpy wcspbrk wcsrchr wcsspn wcstok wcsstr wmemchr \
+-	    wmemcmp wmemcpy wmemmove wmemset wcpcpy wcpncpy wmempcpy \
++	    wmemcmp wmemmove wcpcpy wcpncpy wmempcpy \
+ 	    btowc wctob mbsinit \
+ 	    mbrlen mbrtowc wcrtomb mbsrtowcs wcsrtombs \
+ 	    mbsnrtowcs wcsnrtombs wcsnlen wcschrnul \
+@@ -38,14 +44,21 @@ routines := wcscat wcschr wcscmp wcscpy wcscspn wcsdup wcslen wcsncat \
+ 	    wcscoll_l wcsxfrm_l \
+ 	    wcscasecmp wcsncase wcscasecmp_l wcsncase_l \
+ 	    wcsmbsload mbsrtowcs_l \
+-	    isoc99_wscanf isoc99_vwscanf isoc99_fwscanf isoc99_vfwscanf \
+ 	    isoc99_swscanf isoc99_vswscanf \
+ 	    mbrtoc16 c16rtomb
+ 
+-strop-tests :=  wcscmp wcsncmp wmemcmp wcslen wcschr wcsrchr wcscpy
+-tests := tst-wcstof wcsmbs-tst1 tst-wcsnlen tst-btowc tst-mbrtowc \
+-	 tst-wcrtomb tst-wcpncpy tst-mbsrtowcs tst-wchar-h tst-mbrtowc2 \
+-	 tst-c16c32-1 wcsatcliff $(addprefix test-,$(strop-tests))
++routines-$(OPTION_POSIX_WIDE_CHAR_DEVICE_IO)                           \
++	+= isoc99_wscanf isoc99_vwscanf isoc99_fwscanf isoc99_vfwscanf
++
++strop-tests :=  wcscmp wmemcmp wmemcmp wcslen wcschr wcsrchr wcscpy
++
++tests := tst-wchar-h
++tests-$(OPTION_EGLIBC_LOCALE_CODE) \
++	+= tst-btowc tst-mbrtowc tst-mbrtowc2 tst-wcrtomb tst-c16c32-1
++tests-$(OPTION_POSIX_C_LANG_WIDE_CHAR) \
++	+= tst-wcstof wcsmbs-tst1 tst-wcsnlen \
++	tst-wcpncpy tst-mbsrtowcs \
++	wcsatcliff $(addprefix test-,$(strop-tests))
+ 
+ include ../Rules
+ 
+diff --git a/wcsmbs/wcsmbsload.c b/wcsmbs/wcsmbsload.c
+index 6bb49bc..2ab9d07 100644
+--- a/wcsmbs/wcsmbsload.c
++++ b/wcsmbs/wcsmbsload.c
+@@ -21,6 +21,7 @@
+ #include <limits.h>
+ #include <stdlib.h>
+ #include <string.h>
++#include <gnu/option-groups.h>
+ 
+ #include <locale/localeinfo.h>
+ #include <wcsmbsload.h>
+@@ -143,6 +144,7 @@ __wcsmbs_getfct (const char *to, const char *from, size_t *nstepsp)
+   })
+ 
+ 
++#if __OPTION_EGLIBC_LOCALE_CODE
+ /* Some of the functions here must not be used while setlocale is called.  */
+ __libc_rwlock_define (extern, __libc_setlocale_lock attribute_hidden)
+ 
+@@ -211,6 +213,17 @@ __wcsmbs_load_conv (struct __locale_data *new_category)
+ 
+   __libc_rwlock_unlock (__libc_setlocale_lock);
+ }
++#else
 +void
-+__b64_from_24bit (char **cp, int *buflen,
-+		  unsigned int b2, unsigned int b1, unsigned int b0,
-+		  int n)
++internal_function
++__wcsmbs_load_conv (struct __locale_data *new_category)
 +{
-+  unsigned int w = (b2 << 16) | (b1 << 8) | b0;
-+  while (n-- > 0 && (*buflen) > 0)
-+    {
-+      *(*cp)++ = b64t[w & 0x3f];
-+      --(*buflen);
-+      w >>= 6;
-+    }
++  /* When OPTION_EGLIBC_LOCALE_CODE is disabled, we should never reach
++     this point: there is no way to change locales, so every locale
++     passed to get_gconv_fcts should be _nl_C_LC_CTYPE.  */
++  abort ();
 +}
-Index: git/crypt/crypt_util.c
-===================================================================
---- git.orig/crypt/crypt_util.c
-+++ git/crypt/crypt_util.c
-@@ -242,10 +242,6 @@ static ufc_long eperm32tab[4][256][2];
-  */
- static ufc_long efp[16][64][2];
++#endif
  
--/* Table with characters for base64 transformation.  */
--static const char b64t[64] =
--"./0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
--
- /*
-  * For use by the old, non-reentrant routines
-  * (crypt/encrypt/setkey)
-@@ -949,17 +945,3 @@ setkey(__key)
- {
-   __setkey_r(__key, &_ufc_foobar);
- }
+ 
+ /* Clone the current conversion function set.  */
+diff --git a/wctype/Makefile b/wctype/Makefile
+index c56f07c..4e8af43 100644
+--- a/wctype/Makefile
++++ b/wctype/Makefile
+@@ -18,14 +18,20 @@
+ #
+ #	Sub-makefile for wctype portion of the library.
+ #
++include ../option-groups.mak
++
+ subdir	:= wctype
+ 
+ include ../Makeconfig
+ 
+ headers		:= wctype.h
+-routines	:= wcfuncs wctype iswctype wctrans towctrans \
+-		   wcfuncs_l wctype_l iswctype_l wctrans_l towctrans_l
 -
--void
--__b64_from_24bit (char **cp, int *buflen,
--		  unsigned int b2, unsigned int b1, unsigned int b0,
--		  int n)
--{
--  unsigned int w = (b2 << 16) | (b1 << 8) | b0;
--  while (n-- > 0 && (*buflen) > 0)
--    {
--      *(*cp)++ = b64t[w & 0x3f];
--      --(*buflen);
--      w >>= 6;
--    }
--}
-Index: git/sysdeps/arm/Makefile
-===================================================================
---- git.orig/sysdeps/arm/Makefile
-+++ git/sysdeps/arm/Makefile
-@@ -37,10 +37,13 @@ ifeq ($(subdir),csu)
- # get offset to rtld_global._dl_hwcap
- gen-as-const-headers += rtld-global-offsets.sym tlsdesc.sym
- aeabi_constants = aeabi_lcsts aeabi_sighandlers aeabi_math
--aeabi_routines = aeabi_assert aeabi_localeconv aeabi_errno_addr \
-+aeabi_routines = aeabi_assert aeabi_errno_addr \
- 		 aeabi_mb_cur_max aeabi_atexit aeabi_memclr aeabi_memcpy \
- 		 aeabi_memmove aeabi_memset \
- 		 aeabi_read_tp libc-aeabi_read_tp
-+ifeq (y,$(OPTION_EGLIBC_LOCALE_CODE))
-+aeabi_routines += aeabi_localeconv
-+endif
+-tests	:= test_wctype test_wcfuncs bug-wctypeh
++routines 	:= wctrans towctrans towctrans_l
++routines-$(OPTION_POSIX_C_LANG_WIDE_CHAR) \
++		:= wcfuncs wctype iswctype \
++		   wcfuncs_l wctype_l iswctype_l wctrans_l
++
++tests	:=
++tests-$(OPTION_POSIX_C_LANG_WIDE_CHAR) \
++     += test_wctype test_wcfuncs bug-wctypeh
  
- sysdep_routines += $(aeabi_constants) $(aeabi_routines)
- static-only-routines += $(aeabi_constants) aeabi_read_tp
+ include ../Rules
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/glibc/glibc/eglibc-install-pic-archives.patch b/meta/recipes-core/glibc/glibc/0025-eglibc-Install-PIC-archives.patch
similarity index 80%
rename from meta/recipes-core/glibc/glibc/eglibc-install-pic-archives.patch
rename to meta/recipes-core/glibc/glibc/0025-eglibc-Install-PIC-archives.patch
index 9a31255..3c07f7d 100644
--- a/meta/recipes-core/glibc/glibc/eglibc-install-pic-archives.patch
+++ b/meta/recipes-core/glibc/glibc/0025-eglibc-Install-PIC-archives.patch
@@ -1,3 +1,10 @@
+From 11af05f5accb220f6d1ef34ad1dad63617e42f1e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 18 Mar 2015 01:57:01 +0000
+Subject: [PATCH 25/27] eglibc: Install PIC archives
+
+Forward port from eglibc
+
 2008-02-07  Joseph Myers  <joseph@codesourcery.com>
 
         * Makerules (install-extras, install-map): New variables.
@@ -9,7 +16,6 @@
         (install-no-libc.a-nosubdir): Depend on install-map-nosubdir and
         install-extras-nosubdir.
 
-
 2008-04-01  Maxim Kuvyrkov  <maxim@codesourcery.com>
 
         * Makerules (install-lib): Don't install libpthread_pic.a.
@@ -17,11 +23,16 @@
 
 Upstream-Status: Pending
 
-Index: git/Makerules
-===================================================================
---- git.orig/Makerules	2014-08-27 18:49:22.552070587 +0000
-+++ git/Makerules	2014-08-27 18:49:27.308070587 +0000
-@@ -612,6 +631,9 @@
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makerules | 42 ++++++++++++++++++++++++++++++++++++++++--
+ 1 file changed, 40 insertions(+), 2 deletions(-)
+
+diff --git a/Makerules b/Makerules
+index 1dd41aa..41778e1 100644
+--- a/Makerules
++++ b/Makerules
+@@ -713,6 +713,9 @@ ifeq ($(build-shared),yes)
  $(common-objpfx)libc.so: $(common-objpfx)libc.map
  endif
  common-generated += libc.so libc_pic.os
@@ -31,15 +42,15 @@ Index: git/Makerules
  ifdef libc.so-version
  $(common-objpfx)libc.so$(libc.so-version): $(common-objpfx)libc.so
  	$(make-link)
-@@ -834,6 +856,7 @@
- installed-libcs := $(foreach o,$(filter-out .os,$(object-suffixes-for-libc)),\
- 			     $(inst_libdir)/$(patsubst %,$(libtype$o),\
- 						     $(libprefix)$(libc-name)))
+@@ -955,6 +958,7 @@ endif
+ 
+ install: check-install-supported
+ 
 +installed-libcs := $(installed-libcs) $(inst_libdir)/libc_pic.a
  install: $(installed-libcs)
  $(installed-libcs): $(inst_libdir)/lib$(libprefix)%: lib $(+force)
  	$(make-target-directory)
-@@ -862,6 +885,22 @@
+@@ -983,6 +987,22 @@ versioned := $(strip $(foreach so,$(install-lib.so),\
  install-lib.so-versioned := $(filter $(versioned), $(install-lib.so))
  install-lib.so-unversioned := $(filter-out $(versioned), $(install-lib.so))
  
@@ -62,7 +73,7 @@ Index: git/Makerules
  # For versioned libraries, we install three files:
  #	$(inst_libdir)/libfoo.so	-- for linking, symlink or ld script
  #	$(inst_slibdir)/libfoo.so.NN	-- for loading by SONAME, symlink
-@@ -1103,9 +1142,22 @@
+@@ -1225,9 +1245,22 @@ $(addprefix $(inst_includedir)/,$(headers-nonh)): $(inst_includedir)/%: \
  endif	# headers-nonh
  endif	# headers
  
@@ -74,7 +85,7 @@ Index: git/Makerules
 +
 +ifdef install-extras
 +$(addprefix $(inst_libdir)/libc_pic/,$(install-extras)): \
-+  $(inst_libdir)/libc_pic/%.o: $(elfobjdir)/%.os $(+force)
++  $(inst_libdir)/libc_pic/%.o: $(elf-objpfx)%.os $(+force)
 +	$(do-install)
 +endif
 +
@@ -86,7 +97,7 @@ Index: git/Makerules
  install-bin-nosubdir: $(addprefix $(inst_bindir)/,$(install-bin))
  install-bin-script-nosubdir: $(addprefix $(inst_bindir)/,$(install-bin-script))
  install-rootsbin-nosubdir: \
-@@ -1118,6 +1170,10 @@
+@@ -1240,6 +1273,10 @@ install-data-nosubdir: $(addprefix $(inst_datadir)/,$(install-data))
  install-headers-nosubdir: $(addprefix $(inst_includedir)/,$(headers))
  install-others-nosubdir: $(install-others)
  install-others-programs-nosubdir: $(install-others-programs)
@@ -97,7 +108,7 @@ Index: git/Makerules
  
  # We need all the `-nosubdir' targets so that `install' in the parent
  # doesn't depend on several things which each iterate over the subdirs.
-@@ -1127,7 +1183,8 @@
+@@ -1249,7 +1286,8 @@ install-%:: install-%-nosubdir ;
  
  .PHONY: install install-no-libc.a-nosubdir
  install-no-libc.a-nosubdir: install-headers-nosubdir install-data-nosubdir \
@@ -107,3 +118,6 @@ Index: git/Makerules
  ifeq ($(build-programs),yes)
  install-no-libc.a-nosubdir: install-bin-nosubdir install-bin-script-nosubdir \
  			    install-rootsbin-nosubdir install-sbin-nosubdir \
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/glibc/glibc/GLRO_dl_debug_mask.patch b/meta/recipes-core/glibc/glibc/0026-eglibc-dl_debug_mask-is-controlled-by-__OPTION_EGLIB.patch
similarity index 68%
rename from meta/recipes-core/glibc/glibc/GLRO_dl_debug_mask.patch
rename to meta/recipes-core/glibc/glibc/0026-eglibc-dl_debug_mask-is-controlled-by-__OPTION_EGLIB.patch
index e858bfa..05a4938 100644
--- a/meta/recipes-core/glibc/glibc/GLRO_dl_debug_mask.patch
+++ b/meta/recipes-core/glibc/glibc/0026-eglibc-dl_debug_mask-is-controlled-by-__OPTION_EGLIB.patch
@@ -1,246 +1,38 @@
-Its controlled by __OPTION_EGLIBC_RTLD_DEBUG
-so we should use GLRO_dl_debug_mask
+From eef1498b87de5e75006fd4404d70344771321b64 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 18 Mar 2015 00:46:50 +0000
+Subject: [PATCH 26/27] eglibc: dl_debug_mask is controlled by
+ __OPTION_EGLIBC_RTLD_DEBUG
+
+use GLRO_dl_debug_mask
 
 Singed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Upstream-Status: Pending
-Index: git/elf/dl-open.c
-===================================================================
---- git.orig/elf/dl-open.c	2014-08-27 05:03:59.732070587 +0000
-+++ git/elf/dl-open.c	2014-08-27 05:05:25.656070587 +0000
-@@ -147,7 +147,7 @@
- 	  ns->_ns_main_searchlist->r_list[new_nlist++] = map;
- 
- 	  /* We modify the global scope.  Report this.  */
--	  if (__glibc_unlikely (GLRO(dl_debug_mask) & DL_DEBUG_SCOPES))
-+	  if (__glibc_unlikely (GLRO_dl_debug_mask & DL_DEBUG_SCOPES))
- 	    _dl_debug_printf ("\nadd %s [%lu] to global scope\n",
- 			      map->l_name, map->l_ns);
- 	}
-@@ -243,7 +243,7 @@
-   if (__glibc_unlikely (new->l_searchlist.r_list != NULL))
-     {
-       /* Let the user know about the opencount.  */
--      if (__glibc_unlikely (GLRO(dl_debug_mask) & DL_DEBUG_FILES))
-+      if (__glibc_unlikely (GLRO_dl_debug_mask & DL_DEBUG_FILES))
- 	_dl_debug_printf ("opening file=%s [%lu]; direct_opencount=%u\n\n",
- 			  new->l_name, new->l_ns, new->l_direct_opencount);
- 
-@@ -294,7 +294,7 @@
-   LIBC_PROBE (map_complete, 3, args->nsid, r, new);
- 
-   /* Print scope information.  */
--  if (__glibc_unlikely (GLRO(dl_debug_mask) & DL_DEBUG_SCOPES))
-+  if (__glibc_unlikely (GLRO_dl_debug_mask & DL_DEBUG_SCOPES))
-     _dl_show_scope (new, 0);
- 
-   /* Only do lazy relocation if `LD_BIND_NOW' is not set.  */
-@@ -511,7 +511,7 @@
- 	}
- 
-       /* Print scope information.  */
--      if (__glibc_unlikely (GLRO(dl_debug_mask) & DL_DEBUG_SCOPES))
-+      if (__glibc_unlikely (GLRO_dl_debug_mask & DL_DEBUG_SCOPES))
- 	_dl_show_scope (imap, from_scope);
-     }
- 
-@@ -584,7 +584,7 @@
- #endif
- 
-   /* Let the user know about the opencount.  */
--  if (__glibc_unlikely (GLRO(dl_debug_mask) & DL_DEBUG_FILES))
-+  if (__glibc_unlikely (GLRO_dl_debug_mask & DL_DEBUG_FILES))
-     _dl_debug_printf ("opening file=%s [%lu]; direct_opencount=%u\n\n",
- 		      new->l_name, new->l_ns, new->l_direct_opencount);
- }
-Index: git/elf/rtld.c
-===================================================================
---- git.orig/elf/rtld.c	2014-08-27 05:03:59.732070587 +0000
-+++ git/elf/rtld.c	2014-08-27 05:12:33.812070587 +0000
-@@ -321,7 +321,7 @@
-     }
- #endif
- 
--  if (__glibc_unlikely (GLRO(dl_debug_mask) & DL_DEBUG_STATISTICS))
-+  if (__glibc_unlikely (GLRO_dl_debug_mask & DL_DEBUG_STATISTICS))
-     {
- #ifndef HP_TIMING_NONAVAIL
-       print_statistics (&rtld_total_time);
-@@ -1699,7 +1699,7 @@
- 	 after relocation.  */
-       struct link_map *l;
- 
--      if (GLRO(dl_debug_mask) & DL_DEBUG_PRELINK)
-+      if (GLRO_dl_debug_mask & DL_DEBUG_PRELINK)
- 	{
- 	  struct r_scope_elem *scope = &main_map->l_searchlist;
- 
-@@ -1729,7 +1729,7 @@
- 		_dl_printf ("\n");
- 	    }
- 	}
--      else if (GLRO(dl_debug_mask) & DL_DEBUG_UNUSED)
-+      else if (GLRO_dl_debug_mask & DL_DEBUG_UNUSED)
- 	{
- 	  /* Look through the dependencies of the main executable
- 	     and determine which of them is not actually
-@@ -1837,7 +1837,7 @@
- 		    }
- 		}
- 
--	      if ((GLRO(dl_debug_mask) & DL_DEBUG_PRELINK)
-+	      if ((GLRO_dl_debug_mask & DL_DEBUG_PRELINK)
- 		  && rtld_multiple_ref)
- 		{
- 		  /* Mark the link map as not yet relocated again.  */
-@@ -1970,7 +1970,7 @@
-       if (r_list == r_listend && liblist == liblistend)
- 	prelinked = true;
- 
--      if (__glibc_unlikely (GLRO(dl_debug_mask) & DL_DEBUG_LIBS))
-+      if (__glibc_unlikely (GLRO_dl_debug_mask & DL_DEBUG_LIBS))
- 	_dl_debug_printf ("\nprelink checking: %s\n",
- 			  prelinked ? "ok" : "failed");
-     }
-@@ -1988,7 +1988,7 @@
-   GLRO(dl_init_all_dirs) = GL(dl_all_dirs);
- 
-   /* Print scope information.  */
--  if (__glibc_unlikely (GLRO(dl_debug_mask) & DL_DEBUG_SCOPES))
-+  if (__glibc_unlikely (GLRO_dl_debug_mask & DL_DEBUG_SCOPES))
-     {
-       _dl_debug_printf ("\nInitial object scopes\n");
- 
-@@ -2262,7 +2262,7 @@
- 	    if (debopts[cnt].len == len
- 		&& memcmp (dl_debug, debopts[cnt].name, len) == 0)
- 	      {
--		GLRO(dl_debug_mask) |= debopts[cnt].mask;
-+		GLRO_dl_debug_mask |= debopts[cnt].mask;
- 		any_debug = 1;
- 		break;
- 	      }
-@@ -2283,7 +2283,7 @@
-       ++dl_debug;
-     }
- 
--  if (GLRO(dl_debug_mask) & DL_DEBUG_UNUSED)
-+  if (GLRO_dl_debug_mask & DL_DEBUG_UNUSED)
-     {
-       /* In order to get an accurate picture of whether a particular
- 	 DT_NEEDED entry is actually used we have to process both
-@@ -2291,7 +2291,7 @@
-       GLRO(dl_lazy) = 0;
-     }
- 
--  if (GLRO(dl_debug_mask) & DL_DEBUG_HELP)
-+  if (GLRO_dl_debug_mask & DL_DEBUG_HELP)
-     {
-       size_t cnt;
- 
-@@ -2490,7 +2490,7 @@
- 	    {
- 	      mode = trace;
- 	      GLRO(dl_verbose) = 1;
--	      GLRO(dl_debug_mask) |= DL_DEBUG_PRELINK;
-+	      GLRO_dl_debug_mask |= DL_DEBUG_PRELINK;
- 	      GLRO(dl_trace_prelink) = &envline[17];
- 	    }
- 	  break;
-@@ -2537,7 +2537,7 @@
-       if (__access ("/etc/suid-debug", F_OK) != 0)
- 	{
- 	  unsetenv ("MALLOC_CHECK_");
--	  GLRO(dl_debug_mask) = 0;
-+	  GLRO_dl_debug_mask = 0;
- 	}
- 
-       if (mode != normal)
-Index: git/elf/dl-lookup.c
-===================================================================
---- git.orig/elf/dl-lookup.c	2014-08-27 05:03:59.732070587 +0000
-+++ git/elf/dl-lookup.c	2014-08-27 05:13:07.644070587 +0000
-@@ -300,7 +300,7 @@
- 	 hash table.  */
-       if (__glibc_unlikely (tab->size))
- 	{
--	  assert (GLRO(dl_debug_mask) & DL_DEBUG_PRELINK);
-+	  assert (GLRO_dl_debug_mask & DL_DEBUG_PRELINK);
- 	  goto success;
- 	}
- #endif
-@@ -375,7 +375,7 @@
- 	continue;
- 
-       /* Print some debugging info if wanted.  */
--      if (__glibc_unlikely (GLRO(dl_debug_mask) & DL_DEBUG_SYMBOLS))
-+      if (__glibc_unlikely (GLRO_dl_debug_mask & DL_DEBUG_SYMBOLS))
- 	_dl_debug_printf ("symbol=%s;  lookup in file=%s [%lu]\n",
- 			  undef_name, DSO_FILENAME (map->l_name),
- 			  map->l_ns);
-@@ -698,7 +698,7 @@
- 	}
- 
-       /* Display information if we are debugging.  */
--      if (__glibc_unlikely (GLRO(dl_debug_mask) & DL_DEBUG_FILES))
-+      if (__glibc_unlikely (GLRO_dl_debug_mask & DL_DEBUG_FILES))
- 	_dl_debug_printf ("\
- \nfile=%s [%lu];  needed by %s [%lu] (relocation dependency)\n\n",
- 			  DSO_FILENAME (map->l_name),
-@@ -802,7 +802,7 @@
-     {
-       if ((*ref == NULL || ELFW(ST_BIND) ((*ref)->st_info) != STB_WEAK)
- 	  && skip_map == NULL
--	  && !(GLRO(dl_debug_mask) & DL_DEBUG_UNUSED))
-+	  && !(GLRO_dl_debug_mask & DL_DEBUG_UNUSED))
- 	{
- 	  /* We could find no value for a strong reference.  */
- 	  const char *reference_name = undef_map ? undef_map->l_name : "";
-@@ -873,7 +873,7 @@
-   if (__glibc_unlikely (current_value.m->l_used == 0))
-     current_value.m->l_used = 1;
- 
--  if (__glibc_unlikely (GLRO(dl_debug_mask)
-+  if (__glibc_unlikely (GLRO_dl_debug_mask
- 			& (DL_DEBUG_BINDINGS|DL_DEBUG_PRELINK)))
-     _dl_debug_bindings (undef_name, undef_map, ref,
- 			&current_value, version, type_class, protected);
-@@ -938,7 +938,7 @@
- {
-   const char *reference_name = undef_map->l_name;
- 
--  if (GLRO(dl_debug_mask) & DL_DEBUG_BINDINGS)
-+  if (GLRO_dl_debug_mask & DL_DEBUG_BINDINGS)
-     {
-       _dl_debug_printf ("binding file %s [%lu] to %s [%lu]: %s symbol `%s'",
- 			DSO_FILENAME (reference_name),
-@@ -952,7 +952,7 @@
- 	_dl_debug_printf_c ("\n");
-     }
- #ifdef SHARED
--  if (GLRO(dl_debug_mask) & DL_DEBUG_PRELINK)
-+  if (GLRO_dl_debug_mask & DL_DEBUG_PRELINK)
-     {
-       int conflict = 0;
-       struct sym_val val = { NULL, NULL };
-Index: git/elf/get-dynamic-info.h
-===================================================================
---- git.orig/elf/get-dynamic-info.h	2014-08-27 05:03:59.732070587 +0000
-+++ git/elf/get-dynamic-info.h	2014-08-27 05:03:59.728070587 +0000
-@@ -157,7 +157,7 @@
- 	 them. Therefore to avoid breaking existing applications the
- 	 best we can do is add a warning during debugging with the
- 	 intent of notifying the user of the problem.  */
--      if (__builtin_expect (GLRO(dl_debug_mask) & DL_DEBUG_FILES, 0)
-+      if (__builtin_expect (GLRO_dl_debug_mask & DL_DEBUG_FILES, 0)
- 	  && l->l_flags_1 & ~DT_1_SUPPORTED_MASK)
- 	_dl_debug_printf ("\nWARNING: Unsupported flag value(s) of 0x%x in DT_FLAGS_1.\n",
- 			  l->l_flags_1 & ~DT_1_SUPPORTED_MASK);
-Index: git/csu/libc-start.c
-===================================================================
---- git.orig/csu/libc-start.c	2014-08-27 04:59:01.412070587 +0000
-+++ git/csu/libc-start.c	2014-08-27 05:09:28.936070587 +0000
-@@ -238,7 +238,7 @@
+---
+ csu/libc-start.c       |  4 ++--
+ elf/dl-cache.c         |  4 ++--
+ elf/dl-close.c         |  6 +++---
+ elf/dl-conflict.c      |  2 +-
+ elf/dl-deps.c          |  6 +++---
+ elf/dl-error.c         |  2 +-
+ elf/dl-fini.c          |  4 ++--
+ elf/dl-init.c          |  4 ++--
+ elf/dl-load.c          | 16 ++++++++--------
+ elf/dl-lookup.c        | 14 +++++++-------
+ elf/dl-object.c        |  2 +-
+ elf/dl-open.c          | 10 +++++-----
+ elf/dl-reloc.c         |  2 +-
+ elf/dl-version.c       |  2 +-
+ elf/get-dynamic-info.h |  2 +-
+ elf/rtld.c             | 22 +++++++++++-----------
+ 16 files changed, 51 insertions(+), 51 deletions(-)
+
+diff --git a/csu/libc-start.c b/csu/libc-start.c
+index 0afa7c0..2151fb6 100644
+--- a/csu/libc-start.c
++++ b/csu/libc-start.c
+@@ -238,7 +238,7 @@ LIBC_START_MAIN (int (*main) (int, char **, char ** MAIN_AUXVEC_DECL),
  
    /* Call the initializer of the program, if any.  */
  #ifdef SHARED
@@ -249,7 +41,7 @@ Index: git/csu/libc-start.c
      GLRO(dl_debug_printf) ("\ninitialize program: %s\n\n", argv[0]);
  #endif
    if (init)
-@@ -261,7 +261,7 @@
+@@ -261,7 +261,7 @@ LIBC_START_MAIN (int (*main) (int, char **, char ** MAIN_AUXVEC_DECL),
  #endif
  
  #ifdef SHARED
@@ -258,11 +50,11 @@ Index: git/csu/libc-start.c
      GLRO(dl_debug_printf) ("\ntransferring control: %s\n\n", argv[0]);
  #endif
  
-Index: git/elf/dl-cache.c
-===================================================================
---- git.orig/elf/dl-cache.c	2014-08-27 04:59:01.568070587 +0000
-+++ git/elf/dl-cache.c	2014-08-27 05:10:14.384070587 +0000
-@@ -187,7 +187,7 @@
+diff --git a/elf/dl-cache.c b/elf/dl-cache.c
+index 862f1d8..dab9c51 100644
+--- a/elf/dl-cache.c
++++ b/elf/dl-cache.c
+@@ -194,7 +194,7 @@ _dl_load_cache_lookup (const char *name)
    const char *best;
  
    /* Print a message if the loading of libs is traced.  */
@@ -271,7 +63,7 @@ Index: git/elf/dl-cache.c
      _dl_debug_printf (" search cache=%s\n", LD_SO_CACHE);
  
    if (cache == NULL)
-@@ -285,7 +285,7 @@
+@@ -292,7 +292,7 @@ _dl_load_cache_lookup (const char *name)
      }
  
    /* Print our result if wanted.  */
@@ -280,11 +72,11 @@ Index: git/elf/dl-cache.c
        && best != NULL)
      _dl_debug_printf ("  trying file=%s\n", best);
  
-Index: git/elf/dl-close.c
-===================================================================
---- git.orig/elf/dl-close.c	2014-08-27 04:59:01.568070587 +0000
-+++ git/elf/dl-close.c	2014-08-27 05:10:26.456070587 +0000
-@@ -125,7 +125,7 @@
+diff --git a/elf/dl-close.c b/elf/dl-close.c
+index 9105277..70fe11e 100644
+--- a/elf/dl-close.c
++++ b/elf/dl-close.c
+@@ -125,7 +125,7 @@ _dl_close_worker (struct link_map *map, bool force)
  	dl_close_state = rerun;
  
        /* There are still references to this object.  Do nothing more.  */
@@ -293,7 +85,7 @@ Index: git/elf/dl-close.c
  	_dl_debug_printf ("\nclosing file=%s; direct_opencount=%u\n",
  			  map->l_name, map->l_direct_opencount);
  
-@@ -257,7 +257,7 @@
+@@ -268,7 +268,7 @@ _dl_close_worker (struct link_map *map, bool force)
  	  if (imap->l_init_called)
  	    {
  	      /* When debugging print a message first.  */
@@ -302,7 +94,7 @@ Index: git/elf/dl-close.c
  				    0))
  		_dl_debug_printf ("\ncalling fini: %s [%lu]\n\n",
  				  imap->l_name, nsid);
-@@ -664,7 +664,7 @@
+@@ -710,7 +710,7 @@ _dl_close_worker (struct link_map *map, bool force)
  	  free (imap->l_reldeps);
  
  	  /* Print debugging message.  */
@@ -311,11 +103,11 @@ Index: git/elf/dl-close.c
  	    _dl_debug_printf ("\nfile=%s [%lu];  destroying link map\n",
  			      imap->l_name, imap->l_ns);
  
-Index: git/elf/dl-conflict.c
-===================================================================
---- git.orig/elf/dl-conflict.c	2014-08-27 04:59:01.568070587 +0000
-+++ git/elf/dl-conflict.c	2014-08-27 05:10:37.652070587 +0000
-@@ -32,7 +32,7 @@
+diff --git a/elf/dl-conflict.c b/elf/dl-conflict.c
+index 47a946e..e6a3f21 100644
+--- a/elf/dl-conflict.c
++++ b/elf/dl-conflict.c
+@@ -32,7 +32,7 @@ _dl_resolve_conflicts (struct link_map *l, ElfW(Rela) *conflict,
  		       ElfW(Rela) *conflictend)
  {
  #if ! ELF_MACHINE_NO_RELA
@@ -324,11 +116,11 @@ Index: git/elf/dl-conflict.c
      _dl_debug_printf ("\nconflict processing: %s\n", DSO_FILENAME (l->l_name));
  
    {
-Index: git/elf/dl-deps.c
-===================================================================
---- git.orig/elf/dl-deps.c	2014-08-27 04:59:01.568070587 +0000
-+++ git/elf/dl-deps.c	2014-08-27 05:10:48.260070587 +0000
-@@ -127,7 +127,7 @@
+diff --git a/elf/dl-deps.c b/elf/dl-deps.c
+index eee146a..1a4b004 100644
+--- a/elf/dl-deps.c
++++ b/elf/dl-deps.c
+@@ -127,7 +127,7 @@ empty dynamic string token substitution"));				      \
  	    else							      \
  	      {								      \
  		/* This is for DT_AUXILIARY.  */			      \
@@ -337,7 +129,7 @@ Index: git/elf/dl-deps.c
  		  _dl_debug_printf (N_("\
  cannot load auxiliary `%s' because of empty dynamic string token "	      \
  					    "substitution\n"), __str);	      \
-@@ -303,7 +303,7 @@
+@@ -303,7 +303,7 @@ _dl_map_object_deps (struct link_map *map,
  		args.name = name;
  
  		/* Say that we are about to load an auxiliary library.  */
@@ -346,7 +138,7 @@ Index: git/elf/dl-deps.c
  				      0))
  		  _dl_debug_printf ("load auxiliary object=%s"
  				    " requested by file=%s\n",
-@@ -520,7 +520,7 @@
+@@ -520,7 +520,7 @@ _dl_map_object_deps (struct link_map *map,
        runp->map->l_reserved = 0;
      }
  
@@ -355,11 +147,11 @@ Index: git/elf/dl-deps.c
        && map == GL(dl_ns)[LM_ID_BASE]._ns_loaded)
      {
        /* If we are to compute conflicts, we have to build local scope
-Index: git/elf/dl-error.c
-===================================================================
---- git.orig/elf/dl-error.c	2014-08-27 04:59:01.568070587 +0000
-+++ git/elf/dl-error.c	2014-08-27 05:11:06.752070587 +0000
-@@ -139,7 +139,7 @@
+diff --git a/elf/dl-error.c b/elf/dl-error.c
+index 0fc3fd8..ea82f4d 100644
+--- a/elf/dl-error.c
++++ b/elf/dl-error.c
+@@ -139,7 +139,7 @@ internal_function
  _dl_signal_cerror (int errcode, const char *objname, const char *occation,
  		   const char *errstring)
  {
@@ -368,11 +160,11 @@ Index: git/elf/dl-error.c
  			& ~(DL_DEBUG_STATISTICS|DL_DEBUG_PRELINK), 0))
      _dl_debug_printf ("%s: error: %s: %s (%s)\n", objname, occation,
  		      errstring, receiver ? "continued" : "fatal");
-Index: git/elf/dl-fini.c
-===================================================================
---- git.orig/elf/dl-fini.c	2014-08-27 04:59:01.568070587 +0000
-+++ git/elf/dl-fini.c	2014-08-27 05:11:17.544070587 +0000
-@@ -234,7 +234,7 @@
+diff --git a/elf/dl-fini.c b/elf/dl-fini.c
+index 6cfe651..f59f7fe 100644
+--- a/elf/dl-fini.c
++++ b/elf/dl-fini.c
+@@ -234,7 +234,7 @@ _dl_fini (void)
  		  || l->l_info[DT_FINI] != NULL)
  		{
  		  /* When debugging print a message first.  */
@@ -381,7 +173,7 @@ Index: git/elf/dl-fini.c
  					& DL_DEBUG_IMPCALLS, 0))
  		    _dl_debug_printf ("\ncalling fini: %s [%lu]\n\n",
  				      DSO_FILENAME (l->l_name),
-@@ -286,7 +286,7 @@
+@@ -286,7 +286,7 @@ _dl_fini (void)
        goto again;
      }
  
@@ -390,11 +182,11 @@ Index: git/elf/dl-fini.c
      _dl_debug_printf ("\nruntime linker statistics:\n"
  		      "           final number of relocations: %lu\n"
  		      "final number of relocations from cache: %lu\n",
-Index: git/elf/dl-init.c
-===================================================================
---- git.orig/elf/dl-init.c	2014-08-27 04:59:01.568070587 +0000
-+++ git/elf/dl-init.c	2014-08-27 05:11:28.372070587 +0000
-@@ -52,7 +52,7 @@
+diff --git a/elf/dl-init.c b/elf/dl-init.c
+index 2f85731..e46e8b6 100644
+--- a/elf/dl-init.c
++++ b/elf/dl-init.c
+@@ -46,7 +46,7 @@ call_init (struct link_map *l, int argc, char **argv, char **env)
      return;
  
    /* Print a debug message if wanted.  */
@@ -403,7 +195,7 @@ Index: git/elf/dl-init.c
      _dl_debug_printf ("\ncalling init: %s\n\n",
  		      DSO_FILENAME (l->l_name));
  
-@@ -102,7 +102,7 @@
+@@ -96,7 +96,7 @@ _dl_init (struct link_map *main_map, int argc, char **argv, char **env)
        ElfW(Addr) *addrs;
        unsigned int cnt;
  
@@ -412,11 +204,11 @@ Index: git/elf/dl-init.c
  	_dl_debug_printf ("\ncalling preinit: %s\n\n",
  			  DSO_FILENAME (main_map->l_name));
  
-Index: git/elf/dl-load.c
-===================================================================
---- git.orig/elf/dl-load.c	2014-08-27 04:59:01.572070587 +0000
-+++ git/elf/dl-load.c	2014-08-27 05:11:41.156070587 +0000
-@@ -957,7 +957,7 @@
+diff --git a/elf/dl-load.c b/elf/dl-load.c
+index f664f50..8c28744 100644
+--- a/elf/dl-load.c
++++ b/elf/dl-load.c
+@@ -943,7 +943,7 @@ _dl_map_object_from_fd (const char *name, int fd, struct filebuf *fbp,
      }
  
    /* Print debugging message.  */
@@ -425,7 +217,7 @@ Index: git/elf/dl-load.c
      _dl_debug_printf ("file=%s [%lu];  generating link map\n", name, nsid);
  
    /* This is the ELF header.  We read it in `open_verify'.  */
-@@ -1361,7 +1361,7 @@
+@@ -1347,7 +1347,7 @@ cannot enable executable stack as shared object requires");
  
    l->l_entry += l->l_addr;
  
@@ -434,7 +226,7 @@ Index: git/elf/dl-load.c
      _dl_debug_printf ("\
    dynamic: 0x%0*lx  base: 0x%0*lx   size: 0x%0*Zx\n\
      entry: 0x%0*lx  phdr: 0x%0*lx  phnum:   %*u\n\n",
-@@ -1787,7 +1787,7 @@
+@@ -1789,7 +1789,7 @@ open_path (const char *name, size_t namelen, int mode,
  
        /* If we are debugging the search for libraries print the path
  	 now if it hasn't happened now.  */
@@ -443,7 +235,7 @@ Index: git/elf/dl-load.c
  	  && current_what != this_dir->what)
  	{
  	  current_what = this_dir->what;
-@@ -1808,7 +1808,7 @@
+@@ -1810,7 +1810,7 @@ open_path (const char *name, size_t namelen, int mode,
  	     - buf);
  
  	  /* Print name we try if this is wanted.  */
@@ -452,7 +244,7 @@ Index: git/elf/dl-load.c
  	    _dl_debug_printf ("  trying file=%s\n", buf);
  
  	  fd = open_verify (buf, fbp, loader, whatcode, mode,
-@@ -1953,7 +1953,7 @@
+@@ -1955,7 +1955,7 @@ _dl_map_object (struct link_map *loader, const char *name,
      }
  
    /* Display information if we are debugging.  */
@@ -461,7 +253,7 @@ Index: git/elf/dl-load.c
        && loader != NULL)
      _dl_debug_printf ((mode & __RTLD_CALLMAP) == 0
  		      ? "\nfile=%s [%lu];  needed by %s [%lu]\n"
-@@ -1995,7 +1995,7 @@
+@@ -1997,7 +1997,7 @@ _dl_map_object (struct link_map *loader, const char *name,
  
        size_t namelen = strlen (name) + 1;
  
@@ -470,8 +262,8 @@ Index: git/elf/dl-load.c
  	_dl_debug_printf ("find library=%s [%lu]; searching\n", name, nsid);
  
        fd = -1;
-@@ -2122,7 +2122,7 @@
- 			&realname, &fb, l, LA_SER_DEFAULT, &found_other_class);
+@@ -2119,7 +2119,7 @@ _dl_map_object (struct link_map *loader, const char *name,
+ #endif
  
        /* Add another newline when we are tracing the library loading.  */
 -      if (__glibc_unlikely (GLRO(dl_debug_mask) & DL_DEBUG_LIBS))
@@ -479,7 +271,7 @@ Index: git/elf/dl-load.c
  	_dl_debug_printf ("\n");
      }
    else
-@@ -2155,7 +2155,7 @@
+@@ -2152,7 +2152,7 @@ _dl_map_object (struct link_map *loader, const char *name,
    if (__glibc_unlikely (fd == -1))
      {
        if (trace_mode
@@ -488,11 +280,78 @@ Index: git/elf/dl-load.c
  	{
  	  /* We haven't found an appropriate library.  But since we
  	     are only interested in the list of libraries this isn't
-Index: git/elf/dl-object.c
-===================================================================
---- git.orig/elf/dl-object.c	2014-08-27 04:59:01.572070587 +0000
-+++ git/elf/dl-object.c	2014-08-27 05:11:51.756070587 +0000
-@@ -98,7 +98,7 @@
+diff --git a/elf/dl-lookup.c b/elf/dl-lookup.c
+index 11cb44b..588c3e4 100644
+--- a/elf/dl-lookup.c
++++ b/elf/dl-lookup.c
+@@ -302,7 +302,7 @@ do_lookup_unique (const char *undef_name, uint_fast32_t new_hash,
+ 	 hash table.  */
+       if (__glibc_unlikely (tab->size))
+ 	{
+-	  assert (GLRO(dl_debug_mask) & DL_DEBUG_PRELINK);
++	  assert (GLRO_dl_debug_mask & DL_DEBUG_PRELINK);
+ 	  goto success;
+ 	}
+ #endif
+@@ -378,7 +378,7 @@ do_lookup_x (const char *undef_name, uint_fast32_t new_hash,
+ 	continue;
+ 
+       /* Print some debugging info if wanted.  */
+-      if (__glibc_unlikely (GLRO(dl_debug_mask) & DL_DEBUG_SYMBOLS))
++      if (__glibc_unlikely (GLRO_dl_debug_mask & DL_DEBUG_SYMBOLS))
+ 	_dl_debug_printf ("symbol=%s;  lookup in file=%s [%lu]\n",
+ 			  undef_name, DSO_FILENAME (map->l_name),
+ 			  map->l_ns);
+@@ -755,7 +755,7 @@ add_dependency (struct link_map *undef_map, struct link_map *map, int flags)
+ 	}
+ 
+       /* Display information if we are debugging.  */
+-      if (__glibc_unlikely (GLRO(dl_debug_mask) & DL_DEBUG_FILES))
++      if (__glibc_unlikely (GLRO_dl_debug_mask & DL_DEBUG_FILES))
+ 	_dl_debug_printf ("\
+ \nfile=%s [%lu];  needed by %s [%lu] (relocation dependency)\n\n",
+ 			  DSO_FILENAME (map->l_name),
+@@ -859,7 +859,7 @@ _dl_lookup_symbol_x (const char *undef_name, struct link_map *undef_map,
+     {
+       if ((*ref == NULL || ELFW(ST_BIND) ((*ref)->st_info) != STB_WEAK)
+ 	  && skip_map == NULL
+-	  && !(GLRO(dl_debug_mask) & DL_DEBUG_UNUSED))
++	  && !(GLRO_dl_debug_mask & DL_DEBUG_UNUSED))
+ 	{
+ 	  /* We could find no value for a strong reference.  */
+ 	  const char *reference_name = undef_map ? undef_map->l_name : "";
+@@ -935,7 +935,7 @@ _dl_lookup_symbol_x (const char *undef_name, struct link_map *undef_map,
+   if (__glibc_unlikely (current_value.m->l_used == 0))
+     current_value.m->l_used = 1;
+ 
+-  if (__glibc_unlikely (GLRO(dl_debug_mask)
++  if (__glibc_unlikely (GLRO_dl_debug_mask
+ 			& (DL_DEBUG_BINDINGS|DL_DEBUG_PRELINK)))
+     _dl_debug_bindings (undef_name, undef_map, ref,
+ 			&current_value, version, type_class, protected);
+@@ -1000,7 +1000,7 @@ _dl_debug_bindings (const char *undef_name, struct link_map *undef_map,
+ {
+   const char *reference_name = undef_map->l_name;
+ 
+-  if (GLRO(dl_debug_mask) & DL_DEBUG_BINDINGS)
++  if (GLRO_dl_debug_mask & DL_DEBUG_BINDINGS)
+     {
+       _dl_debug_printf ("binding file %s [%lu] to %s [%lu]: %s symbol `%s'",
+ 			DSO_FILENAME (reference_name),
+@@ -1014,7 +1014,7 @@ _dl_debug_bindings (const char *undef_name, struct link_map *undef_map,
+ 	_dl_debug_printf_c ("\n");
+     }
+ #ifdef SHARED
+-  if (GLRO(dl_debug_mask) & DL_DEBUG_PRELINK)
++  if (GLRO_dl_debug_mask & DL_DEBUG_PRELINK)
+     {
+       int conflict = 0;
+       struct sym_val val = { NULL, NULL };
+diff --git a/elf/dl-object.c b/elf/dl-object.c
+index 1d58bbc..938a257 100644
+--- a/elf/dl-object.c
++++ b/elf/dl-object.c
+@@ -98,7 +98,7 @@ _dl_new_object (char *realname, const char *libname, int type,
    new->l_type = type;
    /* If we set the bit now since we know it is never used we avoid
       dirtying the cache line later.  */
@@ -501,11 +360,60 @@ Index: git/elf/dl-object.c
      new->l_used = 1;
    new->l_loader = loader;
  #if NO_TLS_OFFSET != 0
-Index: git/elf/dl-reloc.c
-===================================================================
---- git.orig/elf/dl-reloc.c	2014-08-27 04:59:01.572070587 +0000
-+++ git/elf/dl-reloc.c	2014-08-27 05:12:07.056070587 +0000
-@@ -183,7 +183,7 @@
+diff --git a/elf/dl-open.c b/elf/dl-open.c
+index 2db1c02..1288604 100644
+--- a/elf/dl-open.c
++++ b/elf/dl-open.c
+@@ -147,7 +147,7 @@ add_to_global (struct link_map *new)
+ 	  ns->_ns_main_searchlist->r_list[new_nlist++] = map;
+ 
+ 	  /* We modify the global scope.  Report this.  */
+-	  if (__glibc_unlikely (GLRO(dl_debug_mask) & DL_DEBUG_SCOPES))
++	  if (__glibc_unlikely (GLRO_dl_debug_mask & DL_DEBUG_SCOPES))
+ 	    _dl_debug_printf ("\nadd %s [%lu] to global scope\n",
+ 			      map->l_name, map->l_ns);
+ 	}
+@@ -251,7 +251,7 @@ dl_open_worker (void *a)
+   if (__glibc_unlikely (new->l_searchlist.r_list != NULL))
+     {
+       /* Let the user know about the opencount.  */
+-      if (__glibc_unlikely (GLRO(dl_debug_mask) & DL_DEBUG_FILES))
++      if (__glibc_unlikely (GLRO_dl_debug_mask & DL_DEBUG_FILES))
+ 	_dl_debug_printf ("opening file=%s [%lu]; direct_opencount=%u\n\n",
+ 			  new->l_name, new->l_ns, new->l_direct_opencount);
+ 
+@@ -302,7 +302,7 @@ dl_open_worker (void *a)
+   LIBC_PROBE (map_complete, 3, args->nsid, r, new);
+ 
+   /* Print scope information.  */
+-  if (__glibc_unlikely (GLRO(dl_debug_mask) & DL_DEBUG_SCOPES))
++  if (__glibc_unlikely (GLRO_dl_debug_mask & DL_DEBUG_SCOPES))
+     _dl_show_scope (new, 0);
+ 
+   /* Only do lazy relocation if `LD_BIND_NOW' is not set.  */
+@@ -519,7 +519,7 @@ dl_open_worker (void *a)
+ 	}
+ 
+       /* Print scope information.  */
+-      if (__glibc_unlikely (GLRO(dl_debug_mask) & DL_DEBUG_SCOPES))
++      if (__glibc_unlikely (GLRO_dl_debug_mask & DL_DEBUG_SCOPES))
+ 	_dl_show_scope (imap, from_scope);
+     }
+ 
+@@ -577,7 +577,7 @@ TLS generation counter wrapped!  Please report this."));
+ #endif
+ 
+   /* Let the user know about the opencount.  */
+-  if (__glibc_unlikely (GLRO(dl_debug_mask) & DL_DEBUG_FILES))
++  if (__glibc_unlikely (GLRO_dl_debug_mask & DL_DEBUG_FILES))
+     _dl_debug_printf ("opening file=%s [%lu]; direct_opencount=%u\n\n",
+ 		      new->l_name, new->l_ns, new->l_direct_opencount);
+ }
+diff --git a/elf/dl-reloc.c b/elf/dl-reloc.c
+index 61252d7..4c83815 100644
+--- a/elf/dl-reloc.c
++++ b/elf/dl-reloc.c
+@@ -178,7 +178,7 @@ _dl_relocate_object (struct link_map *l, struct r_scope_elem *scope[],
        && __builtin_expect (l->l_info[DT_BIND_NOW] != NULL, 0))
      lazy = 0;
  
@@ -514,11 +422,11 @@ Index: git/elf/dl-reloc.c
      _dl_debug_printf ("\nrelocation processing: %s%s\n",
  		      DSO_FILENAME (l->l_name), lazy ? " (lazy)" : "");
  
-Index: git/elf/dl-version.c
-===================================================================
---- git.orig/elf/dl-version.c	2014-08-27 04:59:01.608070587 +0000
-+++ git/elf/dl-version.c	2014-08-27 05:12:19.568070587 +0000
-@@ -82,7 +82,7 @@
+diff --git a/elf/dl-version.c b/elf/dl-version.c
+index f6e5cd9..320628c 100644
+--- a/elf/dl-version.c
++++ b/elf/dl-version.c
+@@ -82,7 +82,7 @@ match_symbol (const char *name, Lmid_t ns, ElfW(Word) hash, const char *string,
    int result = 0;
  
    /* Display information about what we are doing while debugging.  */
@@ -527,3 +435,122 @@ Index: git/elf/dl-version.c
      _dl_debug_printf ("\
  checking for version `%s' in file %s [%lu] required by file %s [%lu]\n",
  		      string, DSO_FILENAME (map->l_name),
+diff --git a/elf/get-dynamic-info.h b/elf/get-dynamic-info.h
+index dc8359d..7774fda 100644
+--- a/elf/get-dynamic-info.h
++++ b/elf/get-dynamic-info.h
+@@ -166,7 +166,7 @@ elf_get_dynamic_info (struct link_map *l, ElfW(Dyn) *temp)
+ 	 them. Therefore to avoid breaking existing applications the
+ 	 best we can do is add a warning during debugging with the
+ 	 intent of notifying the user of the problem.  */
+-      if (__builtin_expect (GLRO(dl_debug_mask) & DL_DEBUG_FILES, 0)
++      if (__builtin_expect (GLRO_dl_debug_mask & DL_DEBUG_FILES, 0)
+ 	  && l->l_flags_1 & ~DT_1_SUPPORTED_MASK)
+ 	_dl_debug_printf ("\nWARNING: Unsupported flag value(s) of 0x%x in DT_FLAGS_1.\n",
+ 			  l->l_flags_1 & ~DT_1_SUPPORTED_MASK);
+diff --git a/elf/rtld.c b/elf/rtld.c
+index fc3a2db..59c4637 100644
+--- a/elf/rtld.c
++++ b/elf/rtld.c
+@@ -323,7 +323,7 @@ _dl_start_final (void *arg, struct dl_start_final_info *info)
+     }
+ #endif
+ 
+-  if (__glibc_unlikely (GLRO(dl_debug_mask) & DL_DEBUG_STATISTICS))
++  if (__glibc_unlikely (GLRO_dl_debug_mask & DL_DEBUG_STATISTICS))
+     {
+ #ifndef HP_TIMING_NONAVAIL
+       print_statistics (&rtld_total_time);
+@@ -1701,7 +1701,7 @@ ERROR: ld.so: object '%s' cannot be loaded as audit interface: %s; ignored.\n",
+ 	 after relocation.  */
+       struct link_map *l;
+ 
+-      if (GLRO(dl_debug_mask) & DL_DEBUG_PRELINK)
++      if (GLRO_dl_debug_mask & DL_DEBUG_PRELINK)
+ 	{
+ 	  struct r_scope_elem *scope = &main_map->l_searchlist;
+ 
+@@ -1731,7 +1731,7 @@ ERROR: ld.so: object '%s' cannot be loaded as audit interface: %s; ignored.\n",
+ 		_dl_printf ("\n");
+ 	    }
+ 	}
+-      else if (GLRO(dl_debug_mask) & DL_DEBUG_UNUSED)
++      else if (GLRO_dl_debug_mask & DL_DEBUG_UNUSED)
+ 	{
+ 	  /* Look through the dependencies of the main executable
+ 	     and determine which of them is not actually
+@@ -1839,7 +1839,7 @@ ERROR: ld.so: object '%s' cannot be loaded as audit interface: %s; ignored.\n",
+ 		    }
+ 		}
+ 
+-	      if ((GLRO(dl_debug_mask) & DL_DEBUG_PRELINK)
++	      if ((GLRO_dl_debug_mask & DL_DEBUG_PRELINK)
+ 		  && rtld_multiple_ref)
+ 		{
+ 		  /* Mark the link map as not yet relocated again.  */
+@@ -1972,7 +1972,7 @@ ERROR: ld.so: object '%s' cannot be loaded as audit interface: %s; ignored.\n",
+       if (r_list == r_listend && liblist == liblistend)
+ 	prelinked = true;
+ 
+-      if (__glibc_unlikely (GLRO(dl_debug_mask) & DL_DEBUG_LIBS))
++      if (__glibc_unlikely (GLRO_dl_debug_mask & DL_DEBUG_LIBS))
+ 	_dl_debug_printf ("\nprelink checking: %s\n",
+ 			  prelinked ? "ok" : "failed");
+     }
+@@ -1990,7 +1990,7 @@ ERROR: ld.so: object '%s' cannot be loaded as audit interface: %s; ignored.\n",
+   GLRO(dl_init_all_dirs) = GL(dl_all_dirs);
+ 
+   /* Print scope information.  */
+-  if (__glibc_unlikely (GLRO(dl_debug_mask) & DL_DEBUG_SCOPES))
++  if (__glibc_unlikely (GLRO_dl_debug_mask & DL_DEBUG_SCOPES))
+     {
+       _dl_debug_printf ("\nInitial object scopes\n");
+ 
+@@ -2265,7 +2265,7 @@ process_dl_debug (const char *dl_debug)
+ 	    if (debopts[cnt].len == len
+ 		&& memcmp (dl_debug, debopts[cnt].name, len) == 0)
+ 	      {
+-		GLRO(dl_debug_mask) |= debopts[cnt].mask;
++		GLRO_dl_debug_mask |= debopts[cnt].mask;
+ 		any_debug = 1;
+ 		break;
+ 	      }
+@@ -2286,7 +2286,7 @@ warning: debug option `%s' unknown; try LD_DEBUG=help\n", copy);
+       ++dl_debug;
+     }
+ 
+-  if (GLRO(dl_debug_mask) & DL_DEBUG_UNUSED)
++  if (GLRO_dl_debug_mask & DL_DEBUG_UNUSED)
+     {
+       /* In order to get an accurate picture of whether a particular
+ 	 DT_NEEDED entry is actually used we have to process both
+@@ -2294,7 +2294,7 @@ warning: debug option `%s' unknown; try LD_DEBUG=help\n", copy);
+       GLRO(dl_lazy) = 0;
+     }
+ 
+-  if (GLRO(dl_debug_mask) & DL_DEBUG_HELP)
++  if (GLRO_dl_debug_mask & DL_DEBUG_HELP)
+     {
+       size_t cnt;
+ 
+@@ -2499,7 +2499,7 @@ process_envvars (enum mode *modep)
+ 	      mode = trace;
+ 	      GLRO(dl_verbose) = 1;
+ #if __OPTION_EGLIBC_RTLD_DEBUG
+-	      GLRO(dl_debug_mask) |= DL_DEBUG_PRELINK;
++	      GLRO_dl_debug_mask |= DL_DEBUG_PRELINK;
+ #endif
+ 	      GLRO(dl_trace_prelink) = &envline[17];
+ 	    }
+@@ -2548,7 +2548,7 @@ process_envvars (enum mode *modep)
+ 	{
+ 	  unsetenv ("MALLOC_CHECK_");
+ #if __OPTION_EGLIBC_RTLD_DEBUG
+-	  GLRO(dl_debug_mask) = 0;
++	  GLRO_dl_debug_mask = 0;
+ #endif
+ 	}
+ 
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/glibc/glibc/0027-eglibc-use-option-groups-Conditionally-exclude-c-tes.patch b/meta/recipes-core/glibc/glibc/0027-eglibc-use-option-groups-Conditionally-exclude-c-tes.patch
new file mode 100644
index 0000000..3f8589d
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0027-eglibc-use-option-groups-Conditionally-exclude-c-tes.patch
@@ -0,0 +1,144 @@
+From a78785466ca7ac677223fc53f0ef75056519f7ce Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 27 May 2015 16:10:50 -0700
+Subject: [PATCH 27/27] eglibc-use-option-groups: Conditionally exclude c++
+ tests
+
+    Some test programs written in c++ are still included in spite of
+    "libc-cxx-tests" being omitted from DISTRO_FEATURES_LIBC.
+    All .cc programs are compiled with g++.
+    g++ automatically specifies linking against the C++ library.
+    This patch conditionally excludes the following tests as well:
+
+      bug-atexit3-lib.cc
+      tst-cancel24.cc
+      tst-cancel24-static.cc
+      tst-unique3lib.cc
+      tst-unique3lib2.cc
+      tst-unique4lib.cc
+      tst-unique3.cc
+      tst-unique4.cc
+
+    Tested with DISTRO_FEATURES_LIBC_remove = " libc-cxx-tests"
+
+    [YOCTO #7003]
+
+Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ dlfcn/Makefile |  8 ++++++--
+ elf/Makefile   | 19 ++++++++++++++-----
+ nptl/Makefile  | 12 ++++++++++--
+ 3 files changed, 30 insertions(+), 9 deletions(-)
+
+diff --git a/dlfcn/Makefile b/dlfcn/Makefile
+index 3827607..920bd58 100644
+--- a/dlfcn/Makefile
++++ b/dlfcn/Makefile
+@@ -39,16 +39,20 @@ ifeq (yes,$(build-shared))
+ tests = glrefmain failtest tst-dladdr default errmsg1 tstcxaatexit \
+ 	bug-dlopen1 bug-dlsym1 tst-dlinfo bug-atexit1 bug-atexit2 \
+ 	tstatexit bug-dl-leaf tst-rec-dlopen
+-endif
+-
+ tests-$(OPTION_EGLIBC_CXX_TESTS) += bug-atexit3
+ 
++endif
++
+ modules-names = glreflib1 glreflib2 glreflib3 failtestmod defaultmod1 \
+ 		defaultmod2 errmsg1mod modatexit modcxaatexit \
+ 		bug-dlsym1-lib1 bug-dlsym1-lib2 bug-atexit1-lib \
+ 		bug-atexit2-lib bug-dl-leaf-lib \
+ 		bug-dl-leaf-lib-cb moddummy1 moddummy2
+ 
++ifeq (y,$(OPTION_EGLIBC_CXX_TESTS))
++modules-names += bug-atexit3-lib
++endif
++
+ failtestmod.so-no-z-defs = yes
+ glreflib2.so-no-z-defs = yes
+ errmsg1mod.so-no-z-defs = yes
+diff --git a/elf/Makefile b/elf/Makefile
+index 4ceeaf8..ac364d1 100644
+--- a/elf/Makefile
++++ b/elf/Makefile
+@@ -17,6 +17,8 @@
+ 
+ # Makefile for elf subdirectory of GNU C Library.
+ 
++include ../option-groups.mak
++
+ subdir		:= elf
+ 
+ include ../Makeconfig
+@@ -145,11 +147,14 @@ tests += loadtest restest1 preloadtest loadfail multiload origtest resolvfail \
+ 	 unload3 unload4 unload5 unload6 unload7 unload8 tst-global1 order2 \
+ 	 tst-audit1 tst-audit2 tst-audit8 tst-audit9 \
+ 	 tst-stackguard1 tst-addr1 tst-thrlock \
+-	 tst-unique1 tst-unique2 $(if $(CXX),tst-unique3 tst-unique4 \
+-	 tst-nodelete) \
++	 tst-unique1 tst-unique2 \
+ 	 tst-initorder tst-initorder2 tst-relsort1 tst-null-argv \
+ 	 tst-ptrguard1 tst-tlsalign tst-tlsalign-extern tst-nodelete-opened
+ #	 reldep9
++ifeq (y,$(OPTION_EGLIBC_CXX_TESTS))
++tests += $(if $(CXX),tst-unique3 tst-unique4 tst-nodelete)
++endif
++
+ ifeq ($(build-hardcoded-path-in-tests),yes)
+ tests += tst-dlopen-aout
+ LDFLAGS-tst-dlopen-aout = $(no-pie-ldflag)
+@@ -208,9 +213,6 @@ modules-names = testobj1 testobj2 testobj3 testobj4 testobj5 testobj6 \
+ 		tst-unique1mod1 tst-unique1mod2 \
+ 		tst-unique2mod1 tst-unique2mod2 \
+ 		tst-auditmod9a tst-auditmod9b \
+-		$(if $(CXX),tst-unique3lib tst-unique3lib2 tst-unique4lib \
+-		  tst-nodelete-uniquemod tst-nodelete-rtldmod \
+-		  tst-nodelete-zmod) \
+ 		tst-initordera1 tst-initorderb1 \
+ 		tst-initordera2 tst-initorderb2 \
+ 		tst-initordera3 tst-initordera4 \
+@@ -219,6 +221,13 @@ modules-names = testobj1 testobj2 testobj3 testobj4 testobj5 testobj6 \
+ 		tst-relsort1mod1 tst-relsort1mod2 tst-array2dep \
+ 		tst-array5dep tst-null-argv-lib \
+ 		tst-tlsalign-lib tst-nodelete-opened-lib
++
++ifeq (y,$(OPTION_EGLIBC_CXX_TESTS))
++modules-names += $(if $(CXX),tst-unique3lib tst-unique3lib2 tst-unique4lib \
++		  tst-nodelete-uniquemod tst-nodelete-rtldmod \
++		  tst-nodelete-zmod)
++endif
++
+ ifeq (yes,$(have-protected-data))
+ modules-names += tst-protected1moda tst-protected1modb
+ tests += tst-protected1a tst-protected1b
+diff --git a/nptl/Makefile b/nptl/Makefile
+index 8e7b6ea..f450c92 100644
+--- a/nptl/Makefile
++++ b/nptl/Makefile
+@@ -389,12 +389,20 @@ link-libc-static := $(common-objpfx)libc.a $(static-gnulib) \
+ 		    $(common-objpfx)libc.a
+ 
+ tests-static += tst-locale1 tst-locale2 tst-stackguard1-static \
+-		tst-cancel21-static tst-cancel24-static tst-cond8-static \
++		tst-cancel21-static tst-cond8-static \
+ 		tst-mutex8-static tst-mutexpi8-static tst-sem11-static \
+ 		tst-sem12-static
+-tests += tst-stackguard1-static tst-cancel21-static tst-cancel24-static \
++
++ifeq (y,$(OPTION_EGLIBC_CXX_TESTS))
++tests-static += tst-cancel24-static
++endif
++
++tests += tst-stackguard1-static tst-cancel21-static \
+ 	 tst-cond8-static tst-mutex8-static tst-mutexpi8-static \
+ 	 tst-sem11-static tst-sem12-static
++
++tests-$(OPTION_EGLIBC_CXX_TESTS) += tst-cancel24-static
++
+ xtests-static += tst-setuid1-static
+ 
+ # These tests are linked with libc before libpthread
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/glibc/glibc/CVE-2015-1781-resolv-nss_dns-dns-host.c-buffer-overf.patch b/meta/recipes-core/glibc/glibc/CVE-2015-1781-resolv-nss_dns-dns-host.c-buffer-overf.patch
deleted file mode 100644
index c02fa12..0000000
--- a/meta/recipes-core/glibc/glibc/CVE-2015-1781-resolv-nss_dns-dns-host.c-buffer-overf.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 2959eda9272a033863c271aff62095abd01bd4e3 Mon Sep 17 00:00:00 2001
-From: Arjun Shankar <arjun.is@lostca.se>
-Date: Tue, 21 Apr 2015 14:06:31 +0200
-Subject: [PATCH] CVE-2015-1781: resolv/nss_dns/dns-host.c buffer overflow
- [BZ#18287]
-
-Upstream-Status: Backport
-https://sourceware.org/bugzilla/show_bug.cgi?id=18287
----
- resolv/nss_dns/dns-host.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/resolv/nss_dns/dns-host.c b/resolv/nss_dns/dns-host.c
-index b16b0ddf110907a0086b86612e544d3dc75182b8..d8c55791591750567f00e616e5d7b378dec934a0 100644
---- a/resolv/nss_dns/dns-host.c
-+++ b/resolv/nss_dns/dns-host.c
-@@ -608,21 +608,22 @@ getanswer_r (const querybuf *answer, int anslen, const char *qname, int qtype,
-   int n, ancount, qdcount;
-   int haveanswer, had_error;
-   char *bp, **ap, **hap;
-   char tbuf[MAXDNAME];
-   const char *tname;
-   int (*name_ok) (const char *);
-   u_char packtmp[NS_MAXCDNAME];
-   int have_to_map = 0;
-   uintptr_t pad = -(uintptr_t) buffer % __alignof__ (struct host_data);
-   buffer += pad;
--  if (__glibc_unlikely (buflen < sizeof (struct host_data) + pad))
-+  buflen = buflen > pad ? buflen - pad : 0;
-+  if (__glibc_unlikely (buflen < sizeof (struct host_data)))
-     {
-       /* The buffer is too small.  */
-     too_small:
-       *errnop = ERANGE;
-       *h_errnop = NETDB_INTERNAL;
-       return NSS_STATUS_TRYAGAIN;
-     }
-   host_data = (struct host_data *) buffer;
-   linebuflen = buflen - sizeof (struct host_data);
-   if (buflen - sizeof (struct host_data) != linebuflen)
--- 
-2.2.2
-
diff --git a/meta/recipes-core/glibc/glibc/Fix-__memcpy_chk-on-non-SSE2-CPUs.patch b/meta/recipes-core/glibc/glibc/Fix-__memcpy_chk-on-non-SSE2-CPUs.patch
deleted file mode 100644
index 2e768bb..0000000
--- a/meta/recipes-core/glibc/glibc/Fix-__memcpy_chk-on-non-SSE2-CPUs.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 132a1328eccd20621b77f7810eebbeec0a1af187 Mon Sep 17 00:00:00 2001
-From: Evangelos Foutras <evangelos@foutrelis.com>
-Date: Tue, 10 Feb 2015 03:22:58 +0000
-Subject: [PATCH] Fix __memcpy_chk on non-SSE2 CPUs
-
-In commit 8b4416d, the 1: jump label in __mempcpy_chk was accidentally
-moved.  This resulted in failures of mempcpy on CPU without SSE2.
-
-Upstream-Status: Backport
-
-  https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=132a1328eccd20621b77f7810eebbeec0a1af187
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
-
----
- sysdeps/i386/i686/multiarch/mempcpy_chk.S | 4 ++--
- 3 files changed, 9 insertions(+), 3 deletions(-)
-
-diff --git a/sysdeps/i386/i686/multiarch/mempcpy_chk.S b/sysdeps/i386/i686/multiarch/mempcpy_chk.S
-index 207b648..b6fa202 100644
---- a/sysdeps/i386/i686/multiarch/mempcpy_chk.S
-+++ b/sysdeps/i386/i686/multiarch/mempcpy_chk.S
-@@ -36,8 +36,8 @@ ENTRY(__mempcpy_chk)
- 	cmpl	$0, KIND_OFFSET+__cpu_features@GOTOFF(%ebx)
- 	jne	1f
- 	call	__init_cpu_features
--	leal	__mempcpy_chk_ia32@GOTOFF(%ebx), %eax
--1:	testl	$bit_SSE2, CPUID_OFFSET+index_SSE2+__cpu_features@GOTOFF(%ebx)
-+1:	leal	__mempcpy_chk_ia32@GOTOFF(%ebx), %eax
-+	testl	$bit_SSE2, CPUID_OFFSET+index_SSE2+__cpu_features@GOTOFF(%ebx)
- 	jz	2f
- 	leal	__mempcpy_chk_sse2_unaligned@GOTOFF(%ebx), %eax
- 	testl	$bit_Fast_Unaligned_Load, FEATURE_OFFSET+index_Fast_Unaligned_Load+__cpu_features@GOTOFF(%ebx)
--- 
-1.9.1
-
diff --git a/meta/recipes-core/glibc/glibc/IO-acquire-lock-fix.patch b/meta/recipes-core/glibc/glibc/IO-acquire-lock-fix.patch
deleted file mode 100644
index ffbaba1..0000000
--- a/meta/recipes-core/glibc/glibc/IO-acquire-lock-fix.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-import http://sourceware.org/ml/libc-ports/2007-12/msg00000.html
-
-Upstream-Status: Pending
-
-Index: git/bits/stdio-lock.h
-===================================================================
---- git.orig/bits/stdio-lock.h	2014-08-29 10:33:57.960070587 -0700
-+++ git/bits/stdio-lock.h	2014-08-29 10:33:57.952070587 -0700
-@@ -49,6 +49,8 @@
-   _IO_cleanup_region_start ((void (*) (void *)) _IO_funlockfile, (_fp));      \
-   _IO_flockfile (_fp)
- 
-+# define _IO_acquire_lock_clear_flags2(_fp) _IO_acquire_lock (_fp)
-+
- # define _IO_release_lock(_fp) \
-   _IO_funlockfile (_fp);						      \
-   _IO_cleanup_region_end (0)
diff --git a/meta/recipes-core/glibc/glibc/add_resource_h_to_wait_h.patch b/meta/recipes-core/glibc/glibc/add_resource_h_to_wait_h.patch
deleted file mode 100644
index 70f57c4..0000000
--- a/meta/recipes-core/glibc/glibc/add_resource_h_to_wait_h.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-The older versions of perf still require sys/resource.h to be 
-present in this header, the newer version of perf in 3.2 and
-beyond directly include sys/resource.h
-
-Upstream-Status: Inappropriate [older kernel/perf specific]
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-Index: git/posix/sys/wait.h
-===================================================================
---- git.orig/posix/sys/wait.h	2014-08-29 10:35:10.432070587 -0700
-+++ git/posix/sys/wait.h	2014-08-29 10:35:10.424070587 -0700
-@@ -27,6 +27,7 @@
- __BEGIN_DECLS
- 
- #include <signal.h>
-+#include <sys/resource.h>
- 
- /* These macros could also be defined in <stdlib.h>.  */
- #if !defined _STDLIB_H || (!defined __USE_XOPEN && !defined __USE_XOPEN2K8)
diff --git a/meta/recipes-core/glibc/glibc/elf-Makefile-fix-a-typo.patch b/meta/recipes-core/glibc/glibc/elf-Makefile-fix-a-typo.patch
deleted file mode 100644
index ec48006..0000000
--- a/meta/recipes-core/glibc/glibc/elf-Makefile-fix-a-typo.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 6207fb45553ee98f2f326883b7c21b76c8267343 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Tue, 31 Mar 2015 02:31:25 -0700
-Subject: [PATCH] elf/Makefile: fix a typo
-
-Fixed a typo:
-name-target-directory -> make-target-directory
-
-There is no name-target-directory, it should be make-target-directory,
-this fixed the error:
-/bin/bash: /path/to/elf/runtime-linker.T: No such file or directory
-Makefile:361: recipe for target '/path/to/elf/runtime-linker.st' failed
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- elf/Makefile |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/elf/Makefile b/elf/Makefile
-index e5b142c..62fe245 100644
---- a/elf/Makefile
-+++ b/elf/Makefile
-@@ -358,7 +358,7 @@ $(objpfx)interp.os: $(elf-objpfx)runtime-linker.h
- 
- $(elf-objpfx)runtime-linker.h: $(elf-objpfx)runtime-linker.st; @:
- $(elf-objpfx)runtime-linker.st: $(common-objpfx)config.make
--	$(name-target-directory)
-+	$(make-target-directory)
- 	echo '#define RUNTIME_LINKER "$(rtlddir)/$(rtld-installed-name)"' \
- 		> ${@:st=T}
- 	$(move-if-change) ${@:st=T} ${@:st=h}
--- 
-1.7.9.5
-
diff --git a/meta/recipes-core/glibc/glibc/fix-tibetian-locales.patch b/meta/recipes-core/glibc/glibc/fix-tibetian-locales.patch
deleted file mode 100644
index 9ab9fdc..0000000
--- a/meta/recipes-core/glibc/glibc/fix-tibetian-locales.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-cross localedef fails to compile these locales because name_fmt field is empty
-It is not acceptable for cross localedef and it errors out
-
-LC_NAME: field `name_fmt' not defined
-
-We therefore give a dummy string to the format, the real fix needs some native
-tibetian person to define proper name_fmt
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: git/localedata/locales/bo_CN
-===================================================================
---- git.orig/localedata/locales/bo_CN	2014-08-29 10:35:22.464070587 -0700
-+++ git/localedata/locales/bo_CN	2014-08-29 10:35:22.456070587 -0700
-@@ -146,7 +146,7 @@
- LC_NAME
- % FIXME
- 
--name_fmt  ""
-+name_fmt  "FIXME"
- % name_gen	"FIXME"
- % name_miss	"FIXME"
- % name_mr	"FIXME"
-Index: git/localedata/locales/bo_IN
-===================================================================
---- git.orig/localedata/locales/bo_IN	2014-08-29 10:35:22.464070587 -0700
-+++ git/localedata/locales/bo_IN	2014-08-29 10:35:22.456070587 -0700
-@@ -71,7 +71,7 @@
- 
- LC_NAME
- % FIXME
--name_fmt	""
-+name_fmt	"FIXME"
- % name_gen	"FIXME"
- % name_miss	"FIXME"
- % name_mr	"FIXME"
diff --git a/meta/recipes-core/glibc/glibc/fix_am_rootsbindir.patch b/meta/recipes-core/glibc/glibc/fix_am_rootsbindir.patch
deleted file mode 100644
index 668e8bf..0000000
--- a/meta/recipes-core/glibc/glibc/fix_am_rootsbindir.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-sysdeps/gnu/configure.ac: handle correctly $libc_cv_rootsbindir
-
-Upstream-Status:Pending
-Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
-
-Index: git/sysdeps/gnu/configure
-===================================================================
---- git.orig/sysdeps/gnu/configure	2014-08-27 07:24:38.572070587 +0000
-+++ git/sysdeps/gnu/configure	2014-08-27 07:24:41.308070587 +0000
-@@ -32,6 +32,6 @@
-   else
-     libc_cv_localstatedir=$localstatedir
-    fi
--  libc_cv_rootsbindir=/sbin
-+  test -n "$libc_cv_rootsbindir" || libc_cv_rootsbindir=/sbin
-   ;;
- esac
-Index: git/sysdeps/gnu/configure.ac
-===================================================================
---- git.orig/sysdeps/gnu/configure.ac	2014-08-27 07:24:38.572070587 +0000
-+++ git/sysdeps/gnu/configure.ac	2014-08-27 07:24:41.308070587 +0000
-@@ -21,6 +21,6 @@
-   else
-     libc_cv_localstatedir=$localstatedir
-    fi
--  libc_cv_rootsbindir=/sbin
-+  test -n "$libc_cv_rootsbindir" || libc_cv_rootsbindir=/sbin
-   ;;
- esac
diff --git a/meta/recipes-core/glibc/glibc/initgroups_keys.patch b/meta/recipes-core/glibc/glibc/initgroups_keys.patch
deleted file mode 100644
index 32aa15a..0000000
--- a/meta/recipes-core/glibc/glibc/initgroups_keys.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-This is needed since initgroups belongs to NET group
-so when NET is disabled in eglibc build then it reports
-as undefined symbol
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-
-Index: git/nss/getent.c
-===================================================================
---- git.orig/nss/getent.c	2014-08-27 05:15:25.996070587 +0000
-+++ git/nss/getent.c	2014-08-27 05:16:00.048070587 +0000
-@@ -879,7 +879,7 @@
- D(group)
- D(gshadow)
- D(hosts)
--D(initgroups)
-+DN(initgroups)
- D(netgroup)
- D(networks)
- D(passwd)
diff --git a/meta/recipes-core/glibc/glibc/makesyscall.patch b/meta/recipes-core/glibc/glibc/makesyscall.patch
deleted file mode 100644
index 9ab597f..0000000
--- a/meta/recipes-core/glibc/glibc/makesyscall.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-On x32 builds, sysd-syscalls appears malformed since the make-target-directory
-appears on the wrong line. This causes races during the build process where you can
-see failures like:
-
-Assembler messages:
-Fatal error: can't create [...]glibc/2.21-r0/build-x86_64-poky-linux-gnux32/time/gettimeofday.os: No such file or directory
-Assembler messages:
-Fatal error: can't create [...]glibc/2.21-r0/build-x86_64-poky-linux-gnux32/time/time.os: No such file or directory
-
-The isue is that the carridge return is being escaped when it should 
-not be. The change to sysd-syscalls with this change:
-
-before:
-
-"""
-$(foreach p,$(sysd-rules-targets),$(objpfx)$(patsubst %,$p,time).os): \
-                $(..)sysdeps/unix/make-syscalls.sh      $(make-target-directory)
-        (echo '#include <dl-vdso.h>'; 
-"""
-
-after:
-
-"""
-$(foreach p,$(sysd-rules-targets),$(objpfx)$(patsubst %,$p,time).os): \
-                $(..)sysdeps/unix/make-syscalls.sh
-        $(make-target-directory)
-        (echo '#include <dl-vdso.h>'; 
-"""
-
-which ensures the target directory is correctly created. Only x32 uses the vdso 
-code which contains the bug which is why the error only really appears on x32.
-
-Upstream Bug: https://sourceware.org/bugzilla/show_bug.cgi?id=18409
-Upstream Fix: https://sourceware.org/git/gitweb.cgi?p=glibc.git;h=d9efd775ba51916b58b899d8b1c8501105a830de
-
-Upstream-Status: Backport
-RP 2015/5/13
-
-Index: git/sysdeps/unix/make-syscalls.sh
-===================================================================
---- git.orig/sysdeps/unix/make-syscalls.sh
-+++ git/sysdeps/unix/make-syscalls.sh
-@@ -278,7 +278,7 @@ while read file srcfile caller syscall a
-     vdso_symver=`echo "$vdso_symver" | sed 's/\./_/g'`
-     echo "\
- \$(foreach p,\$(sysd-rules-targets),\$(objpfx)\$(patsubst %,\$p,$file).os): \\
--		\$(..)sysdeps/unix/make-syscalls.sh\
-+		\$(..)sysdeps/unix/make-syscalls.sh
- 	\$(make-target-directory)
- 	(echo '#include <dl-vdso.h>'; \\
- 	 echo 'extern void *${strong}_ifunc (void) __asm (\"${strong}\");'; \\
diff --git a/meta/recipes-core/glibc/glibc/mips-rld-map-check.patch b/meta/recipes-core/glibc/glibc/mips-rld-map-check.patch
deleted file mode 100644
index 9f593d6..0000000
--- a/meta/recipes-core/glibc/glibc/mips-rld-map-check.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-
-On mips target, binutils currently sets DT_MIPS_RLD_MAP to 0 in dynamic
-section if a --version-script sets _RLD_MAP to local. This is apparently
-a binutils bug, but libc shouldn't segfault in this case.
-
-see also: http://sourceware.org/bugilla/show_bug.cgi?id=11615
-
-Upstream-Status: Pending
-
-9/19/2010 - added by Qing He <qing.he@intel.com>
-
-
----
-Index: git/sysdeps/mips/dl-machine.h
-===================================================================
---- git.orig/sysdeps/mips/dl-machine.h	2014-08-27 04:58:11.840070587 +0000
-+++ git/sysdeps/mips/dl-machine.h	2014-08-27 04:58:11.832070587 +0000
-@@ -70,7 +70,8 @@
- /* If there is a DT_MIPS_RLD_MAP entry in the dynamic section, fill it in
-    with the run-time address of the r_debug structure  */
- #define ELF_MACHINE_DEBUG_SETUP(l,r) \
--do { if ((l)->l_info[DT_MIPS (RLD_MAP)]) \
-+do { if ((l)->l_info[DT_MIPS (RLD_MAP)] && \
-+         (l)->l_info[DT_MIPS (RLD_MAP)]->d_un.d_ptr) \
-        *(ElfW(Addr) *)((l)->l_info[DT_MIPS (RLD_MAP)]->d_un.d_ptr) = \
-        (ElfW(Addr)) (r); \
-    } while (0)
diff --git a/meta/recipes-core/glibc/glibc/multilib_readlib.patch b/meta/recipes-core/glibc/glibc/multilib_readlib.patch
deleted file mode 100644
index 13ffc46..0000000
--- a/meta/recipes-core/glibc/glibc/multilib_readlib.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-Replace the OECORE_KNOWN_INTERPRETER_NAMES with the value of 
-variable EGLIBC_KNOWN_INTERPRETER_NAMES.
-
-Lianhao Lu, 08/01/2011
-
-Index: git/elf/readlib.c
-===================================================================
---- git.orig/elf/readlib.c	2014-08-29 10:34:16.824070587 -0700
-+++ git/elf/readlib.c	2014-08-29 10:34:16.816070587 -0700
-@@ -51,6 +51,7 @@
- #ifdef SYSDEP_KNOWN_INTERPRETER_NAMES
-   SYSDEP_KNOWN_INTERPRETER_NAMES
- #endif
-+  OECORE_KNOWN_INTERPRETER_NAMES
- };
- 
- static struct known_names known_libs[] =
diff --git a/meta/recipes-core/glibc/glibc_2.21.bb b/meta/recipes-core/glibc/glibc_2.22.bb
similarity index 58%
rename from meta/recipes-core/glibc/glibc_2.21.bb
rename to meta/recipes-core/glibc/glibc_2.22.bb
index 55424bf..5587105 100644
--- a/meta/recipes-core/glibc/glibc_2.21.bb
+++ b/meta/recipes-core/glibc/glibc_2.22.bb
@@ -1,63 +1,56 @@
 require glibc.inc
 
-DEPENDS += "gperf-native kconfig-frontends-native"
+LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
+      file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+      file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
+      file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "4e42b5b8f89f0e288e68be7ad70f9525aebc2cff"
+DEPENDS += "gperf-native kconfig-frontends-native"
 
-BRANCH = "release/${PV}/master"
+SRCREV ?= "${AUTOREV}"
+
+BRANCH ?= "release/${PV}/master"
+
+GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
+
+SRC_URI = "${GLIBC_GIT_URI};branch=${BRANCH};name=glibc \
+           file://0004-Backport-https-sourceware.org-ml-libc-ports-2007-12-.patch \
+           file://0005-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch \
+           file://0006-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch \
+           file://0007-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch \
+           file://0008-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch \
+           file://0009-Quote-from-bug-1443-which-explains-what-the-patch-do.patch \
+           file://0010-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch \
+           file://0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch \
+           file://0012-Make-ld-version-output-matching-grok-gold-s-output.patch \
+           file://0013-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch \
+           file://0014-Add-unused-attribute.patch \
+           file://0015-When-disabling-SSE-also-make-sure-that-fpmath-is-not.patch \
+           file://0016-yes-within-the-path-sets-wrong-config-variables.patch \
+           file://0017-timezone-re-written-tzselect-as-posix-sh.patch \
+           file://0018-eglibc-Cross-building-and-testing-instructions.patch \
+           file://0019-eglibc-Bring-Eglibc-option-group-infrastructure-to-g.patch \
+           file://0020-eglibc-Help-bootstrap-cross-toolchain.patch \
+           file://0021-eglibc-cherry-picked-from-http-www.eglibc.org-archiv.patch \
+           file://0022-eglibc-Clear-cache-lines-on-ppc8xx.patch \
+           file://0023-eglibc-Resolve-__fpscr_values-on-SH4.patch \
+           file://0024-eglibc-Forward-port-eglibc-options-groups-support.patch \
+           file://0025-eglibc-Install-PIC-archives.patch \
+           file://0026-eglibc-dl_debug_mask-is-controlled-by-__OPTION_EGLIB.patch \
+           file://0027-eglibc-use-option-groups-Conditionally-exclude-c-tes.patch \
+"
 
-SRC_URI = "git://sourceware.org/git/glibc.git;branch=${BRANCH} \
-           file://IO-acquire-lock-fix.patch \
-           file://mips-rld-map-check.patch \
+SRC_URI += "\
            file://etc/ld.so.conf \
            file://generate-supported.mk \
-           file://glibc.fix_sqrt2.patch \
-           file://multilib_readlib.patch \
-           file://ppc-sqrt_finite.patch \
-           file://ppc_slow_ieee754_sqrt.patch \
-           file://add_resource_h_to_wait_h.patch \
-           file://0001-R_ARM_TLS_DTPOFF32.patch \
-           file://0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch \
-           file://fix-tibetian-locales.patch \
-           file://ppce6500-32b_slow_ieee754_sqrt.patch \
-           file://grok_gold.patch \
-           file://fix_am_rootsbindir.patch \
-           file://0001-Add-unused-attribute.patch \
-           file://0001-When-disabling-SSE-also-make-sure-that-fpmath-is-not.patch \
-           file://0001-yes-within-the-path-sets-wrong-config-variables.patch \
-           file://elf-Makefile-fix-a-typo.patch \
-           file://makesyscall.patch \
-           file://Fix-__memcpy_chk-on-non-SSE2-CPUs.patch \
-           ${EGLIBCPATCHES} \
-           ${CVEPATCHES} \
-          "
-EGLIBCPATCHES = "\
-           file://timezone-re-written-tzselect-as-posix-sh.patch \
-           file://eglibc.patch \
-           file://option-groups.patch \
-           file://GLRO_dl_debug_mask.patch \
-           file://eglibc-header-bootstrap.patch \
-           file://eglibc-resolv-dynamic.patch \
-           file://eglibc-ppc8xx-cache-line-workaround.patch \
-           file://eglibc-sh4-fpscr_values.patch \
-           file://eglibc-use-option-groups.patch \
-          "
-#           file://eglibc-install-pic-archives.patch \
-#	    file://initgroups_keys.patch \
-#
-CVEPATCHES = "\
-        file://CVE-2015-1781-resolv-nss_dns-dns-host.c-buffer-overf.patch \
 "
 
-LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
-      file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-      file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
-      file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
+SRC_URI_append_class-nativesdk = "\
+           file://0001-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch \
+           file://0002-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch \
+           file://0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch \
+"
 
-SRC_URI_append_class-nativesdk = " file://ld-search-order.patch \
-            file://relocatable_sdk.patch \
-            file://relocatable_sdk_fix_openpath.patch \
-            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
 
-- 
2.1.4


