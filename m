Received: from mail-pb0-f50.google.com ([209.85.160.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TrHRR-0000Sw-Gm
	for openembedded-core@lists.openembedded.org;
	Sat, 05 Jan 2013 01:17:24 +0100
Received: by mail-pb0-f50.google.com with SMTP id wz7so9484760pbc.23
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Jan 2013 16:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=rtyUYJB0DcHG0JQr4qxqbitM5UtWLN6D/mJL5PAFnsE=;
	b=nnvN3vE8V5QDV6OzmEJ+55nNpciPgAqo/Wrk5OwP9lhnUU1vBWJl8LwYtT02whOuIh
	F+tG4vxnDNeOMDXXcwLfvbn37hUShtHV+luCOH65HZYESO6F9Cq2f4BG4EaY4TYKIS7J
	5nJMzTwIJs3PLcfVDkb3KedBYdRCmyOsa67NUf73Oz4R9ix9bp+7sBc4VHZMZhzvgYYb
	utveO2tCVZCTpgGDETDnF9GKiWkcaSV1bK9wMgZ5LoXOuTgTKiaI4ANcF6M3+m2/3Dth
	LV7o/WlP5N1CjfWGXHnpgVJaEhcqdiMFqfCmA0YA9Wo8NMYnKZA5R6epzIGZiCI3eN4R
	6oTA==
X-Received: by 10.68.238.8 with SMTP id vg8mr167600349pbc.26.1357344103065;
	Fri, 04 Jan 2013 16:01:43 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id nf9sm33017692pbc.17.2013.01.04.16.01.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Jan 2013 16:01:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Jan 2013 16:00:56 -0800
Message-Id: <a199c2dc372f0c5a524685e30d8417f05b3713f9.1357343832.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1357343832.git.raj.khem@gmail.com>
References: <cover.1357343832.git.raj.khem@gmail.com>
Subject: [PATCH 1/4] eglibc: Upgrade recipes 2.16 -> 2.17
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 05 Jan 2013 00:17:37 -0000
X-List-Received-Date: Sat, 05 Jan 2013 00:17:37 -0000

Drop patches that are applied upstream

Fix the license checksums for changes in LICENSES file
the new changes add more copyright notices that were missing earlier

Moving ports is no longer needed since ports is now part of libc proper

Refresh tzselect-sh.patch to accomodate upstream changes

C++ headers discovery relative to target sysroot is fixed differently
upstream hence we drop use-sysroot-cxx-headers.patch

aarch64 support is already available in 2.17 hence drop the local
patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc        |    2 +-
 ...tive_2.16.bb => cross-localedef-native_2.17.bb} |   12 +-
 .../0001-Add-ARM-specific-static-stubs.c.patch     |   27 --
 ..._handle_at-open_by_handle-etc.-to-PowerPC.patch |   65 ----
 ...f-libgcc_s-and-libgcc_eh-when-building-gl.patch |  343 --------------------
 .../eglibc-2.16/use-sysroot-cxx-headers.patch      |   42 ---
 .../0001-R_ARM_TLS_DTPOFF32.patch                  |    0
 .../0001-eglibc-menuconfig-support.patch           |    0
 ...n-libm-err-tab.pl-with-specific-dirs-in-S.patch |    0
 ...0002-eglibc-menuconfig-hex-string-options.patch |    0
 ...0003-eglibc-menuconfig-build-instructions.patch |    0
 .../GLRO_dl_debug_mask.patch                       |    0
 .../IO-acquire-lock-fix.patch                      |    0
 .../add_resource_h_to_wait_h.patch                 |    0
 .../eglibc-svn-arm-lowlevellock-include-tls.patch  |    0
 .../eglibc_fix_findidx_parameters.patch            |    0
 .../{eglibc-2.16 => eglibc-2.17}/etc/ld.so.conf    |    0
 .../fileops-without-wchar-io.patch                 |    0
 .../fix_for_centos_5.8.patch                       |    0
 .../fsl-ppc-no-fsqrt.patch                         |    0
 .../generate-supported.mk                          |    0
 .../glibc.fix_sqrt2.patch                          |    0
 .../initgroups_keys.patch                          |    0
 .../ld-search-order.patch                          |    0
 .../mips-rld-map-check.patch                       |    0
 .../multilib_readlib.patch                         |    0
 .../ppc-sqrt_finite.patch                          |    0
 .../ppc_slow_ieee754_sqrt.patch                    |    0
 .../relocatable_sdk.patch                          |    0
 .../tzselect-awk.patch                             |    0
 .../{eglibc-2.16 => eglibc-2.17}/tzselect-sh.patch |   54 ++-
 ...libc-initial_2.16.bb => eglibc-initial_2.17.bb} |    0
 meta/recipes-core/eglibc/eglibc-locale.inc         |    2 -
 ...eglibc-locale_2.16.bb => eglibc-locale_2.17.bb} |    0
 meta/recipes-core/eglibc/eglibc-mtrace.inc         |    1 -
 ...eglibc-mtrace_2.16.bb => eglibc-mtrace_2.17.bb} |    0
 ...libc-scripts_2.16.bb => eglibc-scripts_2.17.bb} |    0
 .../eglibc/{eglibc_2.16.bb => eglibc_2.17.bb}      |   38 +--
 38 files changed, 36 insertions(+), 550 deletions(-)
 rename meta/recipes-core/eglibc/{cross-localedef-native_2.16.bb => cross-localedef-native_2.17.bb} (74%)
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.16/0001-Add-ARM-specific-static-stubs.c.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.16/0001-Add-name_to_handle_at-open_by_handle-etc.-to-PowerPC.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.16/0001-Avoid-use-of-libgcc_s-and-libgcc_eh-when-building-gl.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.16/use-sysroot-cxx-headers.patch
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/0001-R_ARM_TLS_DTPOFF32.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/0001-eglibc-menuconfig-support.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/0002-eglibc-menuconfig-hex-string-options.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/0003-eglibc-menuconfig-build-instructions.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/GLRO_dl_debug_mask.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/IO-acquire-lock-fix.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/add_resource_h_to_wait_h.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/eglibc-svn-arm-lowlevellock-include-tls.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/eglibc_fix_findidx_parameters.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/etc/ld.so.conf (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/fileops-without-wchar-io.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/fix_for_centos_5.8.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/fsl-ppc-no-fsqrt.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/generate-supported.mk (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/glibc.fix_sqrt2.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/initgroups_keys.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/ld-search-order.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/mips-rld-map-check.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/multilib_readlib.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/ppc-sqrt_finite.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/ppc_slow_ieee754_sqrt.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/relocatable_sdk.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/tzselect-awk.patch (100%)
 rename meta/recipes-core/eglibc/{eglibc-2.16 => eglibc-2.17}/tzselect-sh.patch (77%)
 rename meta/recipes-core/eglibc/{eglibc-initial_2.16.bb => eglibc-initial_2.17.bb} (100%)
 rename meta/recipes-core/eglibc/{eglibc-locale_2.16.bb => eglibc-locale_2.17.bb} (100%)
 rename meta/recipes-core/eglibc/{eglibc-mtrace_2.16.bb => eglibc-mtrace_2.17.bb} (100%)
 rename meta/recipes-core/eglibc/{eglibc-scripts_2.16.bb => eglibc-scripts_2.17.bb} (100%)
 rename meta/recipes-core/eglibc/{eglibc_2.16.bb => eglibc_2.17.bb} (74%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 1d6cd8b..e0c4251 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -20,7 +20,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 GCCVERSION ?= "4.7%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.23.1"
-EGLIBCVERSION ?= "2.16"
+EGLIBCVERSION ?= "2.17"
 UCLIBCVERSION ?= "0.9.33"
 LINUXLIBCVERSION ?= "3.4.3"
 
diff --git a/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb b/meta/recipes-core/eglibc/cross-localedef-native_2.17.bb
similarity index 74%
rename from meta/recipes-core/eglibc/cross-localedef-native_2.16.bb
rename to meta/recipes-core/eglibc/cross-localedef-native_2.17.bb
index 11970e7..be1b1d5 100644
--- a/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb
+++ b/meta/recipes-core/eglibc/cross-localedef-native_2.17.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "LGPL-2.1"
 
 LIC_DIR = "${WORKDIR}/eglibc-${PV}/libc"
-LIC_FILES_CHKSUM = "file://${LIC_DIR}/LICENSES;md5=98a1128c4b58120182cbea3b1752d8b9\
+LIC_FILES_CHKSUM = "file://${LIC_DIR}/LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
       file://${LIC_DIR}/COPYING;md5=393a5ca445f6965873eca0259a17f833 \
       file://${LIC_DIR}/posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
       file://${LIC_DIR}/COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff "
@@ -13,16 +13,14 @@ LIC_FILES_CHKSUM = "file://${LIC_DIR}/LICENSES;md5=98a1128c4b58120182cbea3b1752d
 inherit native
 inherit autotools
 
-# pick up an eglibc-2.16 patch
+# pick up an eglibc patch
 FILESPATH = "${FILE_DIRNAME}/eglibc-${PV}"
 
-PR = "r2"
-SRC_URI = "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr21224.tar.bz2 \
+SRC_URI = "http://sakrah.dontexist.org/files/eglibc/eglibc-${PV}-svnr22064.tar.bz2 \
 	   file://fix_for_centos_5.8.patch;patchdir=.. \
 	  "
-
-SRC_URI[md5sum] = "88894fa6e10e58e85fbd8134b8e486a8"
-SRC_URI[sha256sum] = "460a45f422da6eb1fd909baab6a64b5ae4c8ba18ea05a1491ed1024c8b98eeaa"
+SRC_URI[md5sum] = "1464af54779c2c7d1078df9ce2e41791"
+SRC_URI[sha256sum] = "97c3991a3772f513cf704841d20c275ac48895fad2e27802dda557c0196cba6b"
 
 S = "${WORKDIR}/eglibc-${PV}/localedef"
 
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/0001-Add-ARM-specific-static-stubs.c.patch b/meta/recipes-core/eglibc/eglibc-2.16/0001-Add-ARM-specific-static-stubs.c.patch
deleted file mode 100644
index 7186f89..0000000
--- a/meta/recipes-core/eglibc/eglibc-2.16/0001-Add-ARM-specific-static-stubs.c.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Upstream-Status: Backport
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-From c57a67e03368687fc0d2ae8354cd1b347a61ea44 Mon Sep 17 00:00:00 2001
-From: Joseph Myers <joseph@codesourcery.com>
-Date: Thu, 5 Jul 2012 22:16:03 +0000
-Subject: [PATCH] Add ARM-specific static-stubs.c.
-
----
- ports/ChangeLog.arm              |    4 ++++
- ports/sysdeps/arm/static-stubs.c |    7 +++++++
- 2 files changed, 11 insertions(+)
- create mode 100644 ports/sysdeps/arm/static-stubs.c
-
-Index: libc/ports/sysdeps/arm/static-stubs.c
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ libc/ports/sysdeps/arm/static-stubs.c	2012-08-15 15:04:59.687669241 -0700
-@@ -0,0 +1,7 @@
-+/* When building with GCC with static-only libgcc, the dummy
-+   _Unwind_Resume from static-stubs.c needs to be used together with
-+   the dummy __aeabi_unwind_cpp_pr* from aeabi_unwind_cpp_pr1.c
-+   instead of the copies from libgcc.  */
-+
-+#include <elf/static-stubs.c>
-+#include <aeabi_unwind_cpp_pr1.c>
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/0001-Add-name_to_handle_at-open_by_handle-etc.-to-PowerPC.patch b/meta/recipes-core/eglibc/eglibc-2.16/0001-Add-name_to_handle_at-open_by_handle-etc.-to-PowerPC.patch
deleted file mode 100644
index 48b3c56..0000000
--- a/meta/recipes-core/eglibc/eglibc-2.16/0001-Add-name_to_handle_at-open_by_handle-etc.-to-PowerPC.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-Upstream-Status: Submitted
-
-
-From 4b2716f902c117490285e39deb6ef7925fdc846e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 8 Sep 2012 19:54:03 -0700
-Subject: [PATCH] Add name_to_handle_at, open_by_handle etc. to PowerPC
- bits/fcntl.h.
-
----
- ChangeLog                                    |    7 +++++++
- sysdeps/unix/sysv/linux/powerpc/bits/fcntl.h |   28 +++++++++++++++++++++++++-
- 2 files changed, 34 insertions(+), 1 deletion(-)
-
-Index: libc/sysdeps/unix/sysv/linux/powerpc/bits/fcntl.h
-===================================================================
---- libc.orig/sysdeps/unix/sysv/linux/powerpc/bits/fcntl.h	2012-09-08 10:27:08.000000000 -0700
-+++ libc/sysdeps/unix/sysv/linux/powerpc/bits/fcntl.h	2012-09-08 19:57:44.219191560 -0700
-@@ -1,5 +1,5 @@
- /* O_*, F_*, FD_* bit values for Linux/PowerPC.
--   Copyright (C) 1995-1998, 2000, 2003, 2004, 2006, 2007, 2009, 2010, 2011
-+   Copyright (C) 1995-2012
-    Free Software Foundation, Inc.
-    This file is part of the GNU C Library.
- 
-@@ -232,6 +232,19 @@
- 					   we splice from/to).  */
- # define SPLICE_F_MORE		4	/* Expect more data.  */
- # define SPLICE_F_GIFT		8	/* Pages passed in are a gift.  */
-+
-+
-+/* File handle structure.  */
-+struct file_handle
-+{
-+  unsigned int handle_bytes;
-+  int handle_type;
-+  /* File identifier.  */
-+  unsigned char f_handle[0];
-+};
-+
-+/* Maximum handle size (for now).  */
-+# define MAX_HANDLE_SZ  128
- #endif
- 
- __BEGIN_DECLS
-@@ -278,6 +291,19 @@
- 			__off64_t __len);
- # endif
- 
-+
-+/* Map file name to file handle.  */
-+extern int name_to_handle_at (int __dfd, const char *__name,
-+			      struct file_handle *__handle, int *__mnt_id,
-+			      int __flags) __THROW;
-+
-+/* Open file using the file handle.
-+
-+   This function is a possible cancellation point and therefore not
-+   marked with __THROW.  */
-+extern int open_by_handle_at (int __mountdirfd, struct file_handle *__handle,
-+			      int __flags);
-+
- #endif
- 
- __END_DECLS
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/0001-Avoid-use-of-libgcc_s-and-libgcc_eh-when-building-gl.patch b/meta/recipes-core/eglibc/eglibc-2.16/0001-Avoid-use-of-libgcc_s-and-libgcc_eh-when-building-gl.patch
deleted file mode 100644
index dc35b9b..0000000
--- a/meta/recipes-core/eglibc/eglibc-2.16/0001-Avoid-use-of-libgcc_s-and-libgcc_eh-when-building-gl.patch
+++ /dev/null
@@ -1,343 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-From 95f5a9a866695da4e038aa4e6ccbbfd5d9cf63b7 Mon Sep 17 00:00:00 2001
-From: Joseph Myers <joseph@codesourcery.com>
-Date: Tue, 3 Jul 2012 19:14:59 +0000
-Subject: [PATCH] Avoid use of libgcc_s and libgcc_eh when building glibc.
-
----
- ChangeLog                  |   47 ++++++++++++++++++++++++++++++
- Makeconfig                 |   68 ++++++++++++++++++++++++++++++++++++++------
- Rules                      |   45 ++++++++++++++++++++++-------
- elf/Makefile               |    6 +++-
- elf/static-stubs.c         |   46 ++++++++++++++++++++++++++++++
- ports/ChangeLog.arm        |    7 +++++
- ports/sysdeps/arm/Makefile |    8 ++++++
- 7 files changed, 206 insertions(+), 21 deletions(-)
- create mode 100644 elf/static-stubs.c
-
-Index: libc/Makeconfig
-===================================================================
---- libc.orig/Makeconfig	2012-07-04 18:26:22.000000000 -0700
-+++ libc/Makeconfig	2012-08-14 20:16:10.197093639 -0700
-@@ -415,9 +415,9 @@
- LDFLAGS-rtld += $(hashstyle-LDFLAGS)
- endif
- 
--# Command for linking programs with the C library.
-+# Commands for linking programs with the C library.
- ifndef +link
--+link = $(CC) -nostdlib -nostartfiles -o $@ \
-++link-before-libc = $(CC) -nostdlib -nostartfiles -o $@ \
- 	      $(sysdep-LDFLAGS) $(config-LDFLAGS) $(LDFLAGS) $(LDFLAGS-$(@F)) \
- 	      $(combreloc-LDFLAGS) $(relro-LDFLAGS) $(hashstyle-LDFLAGS) \
- 	      $(addprefix $(csu-objpfx),$(start-installed-name)) \
-@@ -426,7 +426,10 @@
- 						     $(start-installed-name))\
- 			   $(+preinit) $(link-extra-libs) \
- 			   $(common-objpfx)libc% $(+postinit),$^) \
--	      $(link-extra-libs) $(link-libc) $(+postctor) $(+postinit)
-+	      $(link-extra-libs)
-++link-after-libc = $(+postctor) $(+postinit)
-++link = $(+link-before-libc) $(link-libc) $(+link-after-libc)
-++link-tests = $(+link-before-libc) $(link-libc-tests) $(+link-after-libc)
- endif
- # Command for linking PIE programs with the C library.
- ifndef +link-pie
-@@ -443,7 +446,7 @@
- endif
- # Command for statically linking programs with the C library.
- ifndef +link-static
--+link-static = $(CC) -nostdlib -nostartfiles -static -o $@ \
-++link-static-before-libc = $(CC) -nostdlib -nostartfiles -static -o $@ \
- 	      $(sysdep-LDFLAGS) $(LDFLAGS) $(LDFLAGS-$(@F))  \
- 	      $(addprefix $(csu-objpfx),$(static-start-installed-name)) \
- 	      $(+preinit) $(+prector) \
-@@ -451,7 +454,12 @@
- 						     $(start-installed-name))\
- 			   $(+preinit) $(link-extra-libs-static) \
- 			   $(common-objpfx)libc% $(+postinit),$^) \
--	      $(link-extra-libs-static) $(link-libc-static) $(+postctor) $(+postinit)
-+	      $(link-extra-libs-static) $(link-libc-static)
-++link-static-after-libc = $(+postctor) $(+postinit)
-++link-static = $(+link-static-before-libc) $(link-libc-static) \
-+	       $(+link-static-after-libc)
-++link-static-tests = $(+link-static-before-libc) $(link-libc-static-tests) \
-+		     $(+link-static-after-libc)
- endif
- # Command for statically linking bounded-pointer programs with the C library.
- ifndef +link-bounded
-@@ -475,10 +483,12 @@
- # We need the versioned name of libc.so in the deps of $(others) et al
- # so that the symlink to libc.so is created before anything tries to
- # run the linked programs.
--link-libc = -Wl,-rpath-link=$(rpath-link) \
-+link-libc-before-gnulib = -Wl,-rpath-link=$(rpath-link) \
- 	    $(common-objpfx)libc.so$(libc.so-version) \
- 	    $(common-objpfx)$(patsubst %,$(libtype.oS),c) \
--	    $(as-needed) $(common-objpfx)elf/ld.so $(no-as-needed) $(gnulib)
-+	    $(as-needed) $(common-objpfx)elf/ld.so $(no-as-needed)
-+link-libc = $(link-libc-before-gnulib) $(gnulib)
-+link-libc-tests = $(link-libc-before-gnulib) $(gnulib-tests)
- # This is how to find at build-time things that will be installed there.
- rpath-dirs = math elf dlfcn nss nis rt resolv crypt
- rpath-link = \
-@@ -488,6 +498,7 @@
- nssobjdir := $(patsubst ../$(subdir),.,$(common-objpfx)nss)
- resolvobjdir := $(patsubst ../$(subdir),.,$(common-objpfx)resolv)
- link-libc = $(common-objpfx)libc.a $(otherlibs) $(gnulib) $(common-objpfx)libc.a $(gnulib)
-+link-libc-tests = $(common-objpfx)libc.a $(otherlibs) $(gnulib-tests) $(common-objpfx)libc.a $(gnulib-tests)
- endif
- endif
- 
-@@ -513,8 +524,43 @@
- 
- # The static libraries.
- link-libc-static = -Wl,--start-group $(common-objpfx)libc.a $(static-gnulib) -Wl,--end-group
-+link-libc-static-tests = -Wl,--start-group $(common-objpfx)libc.a $(static-gnulib-tests) -Wl,--end-group
- link-libc-bounded = $(common-objpfx)libc_b.a $(gnulib) $(common-objpfx)libc_b.a
- 
-+# How to link against libgcc.  Some libgcc functions, such as those
-+# for "long long" arithmetic or software floating point, can always be
-+# built without use of C library headers and do not have any global
-+# state so can safely be linked statically into any executable or
-+# shared library requiring them; these functions are in libgcc.a.
-+# Other functions, relating to exception handling, may require C
-+# library headers to build and it may not be safe to have more than
-+# one copy of them in a process; these functions are only in
-+# libgcc_s.so and libgcc_eh.a.
-+#
-+# To avoid circular dependencies when bootstrapping, it is desirable
-+# to avoid use of libgcc_s and libgcc_eh in building glibc.  Where any
-+# glibc functionality (in particular, thread cancellation) requires
-+# exception handling, this is implemented through dlopen of libgcc_s
-+# to avoid unnecessary dependencies on libgcc_s by programs not using
-+# that functionality; executables built with glibc do not use
-+# exception handling other than through thread cancellation.
-+#
-+# Undefined references to functions from libgcc_eh or libgcc_s may
-+# arise for code built with -fexceptions.  In the case of statically
-+# linked programs installed by glibc, unwinding will never actually
-+# occur at runtime and the use of elf/static-stubs.c to resolve these
-+# references is safe.  In the case of statically linked test programs
-+# and test programs built with -fexceptions, unwinding may occur in
-+# some cases and it is preferable to link with libgcc_eh or libgcc_s
-+# so that the testing is as similar as possible to how programs will
-+# be built with the installed glibc.
-+#
-+# Some architectures have architecture-specific systems for exception
-+# handling that may involve undefined references to
-+# architecture-specific functions.  On those architectures,
-+# gnulib-arch and static-gnulib-arch may be defined in sysdeps
-+# makefiles to use additional libraries for linking executables and
-+# shared libraries built by glibc.
- ifndef gnulib
- ifneq ($(have-cc-with-libunwind),yes)
-   libunwind =
-@@ -522,8 +568,12 @@
-   libunwind = -lunwind
- endif
- libgcc_eh := -Wl,--as-needed -lgcc_s $(libunwind) -Wl,--no-as-needed
--gnulib := -lgcc $(libgcc_eh)
--static-gnulib := -lgcc -lgcc_eh $(libunwind)
-+gnulib-arch =
-+gnulib = -lgcc $(gnulib-arch)
-+gnulib-tests := -lgcc $(libgcc_eh)
-+static-gnulib-arch =
-+static-gnulib = -lgcc $(static-gnulib-arch)
-+static-gnulib-tests := -lgcc -lgcc_eh $(libunwind)
- libc.so-gnulib := -lgcc
- endif
- +preinit = $(addprefix $(csu-objpfx),crti.o)
-Index: libc/Rules
-===================================================================
---- libc.orig/Rules	2012-07-04 18:25:47.000000000 -0700
-+++ libc/Rules	2012-08-14 20:16:10.197093639 -0700
-@@ -1,5 +1,4 @@
--# Copyright (C) 1991-2000,2002,2003,2004,2005,2006,2011
--#	Free Software Foundation, Inc.
-+# Copyright (C) 1991-2012 Free Software Foundation, Inc.
- # This file is part of the GNU C Library.
- 
- # The GNU C Library is free software; you can redistribute it and/or
-@@ -103,29 +102,46 @@
- # eglibc: endif
- 
- ifeq ($(build-programs),yes)
--binaries-all = $(others) $(sysdep-others) $(tests) $(xtests) $(test-srcs)
--binaries-static = $(others-static) $(tests-static) $(xtests-static)
-+binaries-all-notests = $(others) $(sysdep-others)
-+binaries-all-tests = $(tests) $(xtests) $(test-srcs)
-+binaries-all = $(binaries-all-notests) $(binaries-all-tests)
-+binaries-static-notests = $(others-static)
-+binaries-static-tests = $(tests-static) $(xtests-static)
-+binaries-static = $(binaries-static-notests) $(binaries-static-tests)
- ifeq (yesyes,$(have-fpie)$(build-shared))
- binaries-pie = $(others-pie) $(tests-pie) $(xtests-pie)
- else
- binaries-pie =
- endif
- else
--binaries-all = $(tests) $(xtests) $(test-srcs)
-+binaries-all-notests =
-+binaries-all-tests = $(tests) $(xtests) $(test-srcs)
-+binaries-all = $(binaries-all-tests)
-+binaries-static-notests =
-+binaries-static-tests =
- binaries-static =
- binaries-pie =
- endif
- 
--binaries-shared = $(filter-out $(binaries-pie) $(binaries-static), \
--			       $(binaries-all))
-+binaries-shared-tests = $(filter-out $(binaries-pie) $(binaries-static), \
-+				     $(binaries-all-tests))
-+binaries-shared-notests = $(filter-out $(binaries-pie) $(binaries-static), \
-+				       $(binaries-all-notests))
- 
--ifneq "$(strip $(binaries-shared))" ""
--$(addprefix $(objpfx),$(binaries-shared)): %: %.o \
-+ifneq "$(strip $(binaries-shared-notests))" ""
-+$(addprefix $(objpfx),$(binaries-shared-notests)): %: %.o \
-   $(sort $(filter $(common-objpfx)lib%,$(link-libc))) \
-   $(addprefix $(csu-objpfx),start.o) $(+preinit) $(+postinit)
- 	$(+link)
- endif
- 
-+ifneq "$(strip $(binaries-shared-tests))" ""
-+$(addprefix $(objpfx),$(binaries-shared-tests)): %: %.o \
-+  $(sort $(filter $(common-objpfx)lib%,$(link-libc))) \
-+  $(addprefix $(csu-objpfx),start.o) $(+preinit) $(+postinit)
-+	$(+link-tests)
-+endif
-+
- ifneq "$(strip $(binaries-pie))" ""
- $(addprefix $(objpfx),$(binaries-pie)): %: %.o \
-   $(sort $(filter $(common-objpfx)lib%,$(link-libc))) \
-@@ -133,13 +149,20 @@
- 	$(+link-pie)
- endif
- 
--ifneq "$(strip $(binaries-static))" ""
--$(addprefix $(objpfx),$(binaries-static)): %: %.o \
-+ifneq "$(strip $(binaries-static-notests))" ""
-+$(addprefix $(objpfx),$(binaries-static-notests)): %: %.o \
-   $(sort $(filter $(common-objpfx)lib%,$(link-libc-static))) \
-   $(addprefix $(csu-objpfx),start.o) $(+preinit) $(+postinit)
- 	$(+link-static)
- endif
- 
-+ifneq "$(strip $(binaries-static-tests))" ""
-+$(addprefix $(objpfx),$(binaries-static-tests)): %: %.o \
-+  $(sort $(filter $(common-objpfx)lib%,$(link-libc-static-tests))) \
-+  $(addprefix $(csu-objpfx),start.o) $(+preinit) $(+postinit)
-+	$(+link-static-tests)
-+endif
-+
- ifeq ($(build-bounded),yes)
- binaries-bounded = $(addsuffix -bp,$(tests) $(xtests) $(test-srcs))
- $(addprefix $(objpfx),$(binaries-bounded)): %-bp: %.ob \
-Index: libc/elf/Makefile
-===================================================================
---- libc.orig/elf/Makefile	2012-07-04 18:26:34.000000000 -0700
-+++ libc/elf/Makefile	2012-08-14 20:16:10.197093639 -0700
-@@ -71,6 +71,8 @@
- install-bin	= sprof pldd
- others-static   = sln
- install-rootsbin = sln
-+sln-modules	:= static-stubs
-+extra-objs	+= $(sln-modules:=.o)
- 
- ifeq (yes,$(use-ldconfig))
- ifeq (yes,$(build-shared))
-@@ -78,7 +80,7 @@
- others		+= ldconfig
- install-rootsbin += ldconfig
- 
--ldconfig-modules := cache readlib xmalloc xstrdup chroot_canon
-+ldconfig-modules := cache readlib xmalloc xstrdup chroot_canon static-stubs
- extra-objs	+= $(ldconfig-modules:=.o)
- endif
- endif
-@@ -417,6 +419,8 @@
- 
- $(objpfx)sprof: $(libdl)
- 
-+$(objpfx)sln: $(sln-modules:%=$(objpfx)%.o)
-+
- $(objpfx)ldconfig: $(ldconfig-modules:%=$(objpfx)%.o)
- 
- $(objpfx)pldd: $(pldd-modules:%=$(objpfx)%.o)
-Index: libc/elf/static-stubs.c
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ libc/elf/static-stubs.c	2012-08-14 20:16:10.197093639 -0700
-@@ -0,0 +1,46 @@
-+/* Stub implementations of functions to link into statically linked
-+   programs without needing libgcc_eh.
-+   Copyright (C) 2012 Free Software Foundation, Inc.
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
-+   License along with the GNU C Library; if not, see
-+   <http://www.gnu.org/licenses/>.  */
-+
-+/* Avoid backtrace (and so _Unwind_Backtrace) dependencies from
-+   sysdeps/unix/sysv/linux/libc_fatal.c.  */
-+#include <sysdeps/posix/libc_fatal.c>
-+
-+#include <stdlib.h>
-+#include <unwind.h>
-+
-+/* These programs do not use thread cancellation, so _Unwind_Resume
-+   and the personality routine are never actually called.  */
-+
-+void
-+_Unwind_Resume (struct _Unwind_Exception *exc __attribute__ ((unused)))
-+{
-+  abort ();
-+}
-+
-+_Unwind_Reason_Code
-+__gcc_personality_v0 (int version __attribute__ ((unused)),
-+		      _Unwind_Action actions __attribute__ ((unused)),
-+		      _Unwind_Exception_Class exception_class
-+		      __attribute__ ((unused)),
-+		      struct _Unwind_Exception *ue_header
-+		      __attribute__ ((unused)),
-+		      struct _Unwind_Context *context __attribute__ ((unused)))
-+{
-+  abort ();
-+}
-Index: libc/ports/sysdeps/arm/Makefile
-===================================================================
---- libc.orig/ports/sysdeps/arm/Makefile	2012-07-04 18:25:41.000000000 -0700
-+++ libc/ports/sysdeps/arm/Makefile	2012-08-14 20:16:10.201093638 -0700
-@@ -1,8 +1,16 @@
-+gnulib-arch = $(elfobjdir)/libgcc-stubs.a
-+static-gnulib-arch = $(elfobjdir)/libgcc-stubs.a
-+
- ifeq ($(subdir),elf)
- sysdep-dl-routines += tlsdesc dl-tlsdesc
- sysdep_routines += aeabi_unwind_cpp_pr1 find_exidx tlsdesc dl-tlsdesc
- sysdep-rtld-routines += aeabi_unwind_cpp_pr1 tlsdesc dl-tlsdesc
- shared-only-routines += aeabi_unwind_cpp_pr1
-+
-+$(objpfx)libgcc-stubs.a: $(objpfx)aeabi_unwind_cpp_pr1.os
-+	$(build-extra-lib)
-+
-+lib-noranlib: $(objpfx)libgcc-stubs.a
- endif
- 
- ifeq ($(subdir),csu)
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/use-sysroot-cxx-headers.patch b/meta/recipes-core/eglibc/eglibc-2.16/use-sysroot-cxx-headers.patch
deleted file mode 100644
index 7f82253..0000000
--- a/meta/recipes-core/eglibc/eglibc-2.16/use-sysroot-cxx-headers.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-build system of glibc currently adds the cxx headers path by detecting
-it using provided CXX and expects that they are installed w.r.t to standard
-installation location but in OE we install and use cxx headers from target
-sysroot therefore that code needs to be adapted for OE
-
-Upstream-Status: Inappropriate [OE-specific]
-
--Khem
-
-
---- a/configure.in
-+++ b/configure.in
-@@ -1094,11 +1094,10 @@ if test -n "$sysheaders"; then
- -isystem `echo $sysheaders | sed 's/:/ -isystem /g'`"
-   if test -n "$CXX"; then
-     CXX_SYSINCLUDES=
--    cxxversion=`$CXX -dumpversion 2>&AS_MESSAGE_LOG_FD` &&
-     cxxmachine=`$CXX -dumpmachine 2>&AS_MESSAGE_LOG_FD` &&
-     for d in include "$cxxmachine/include"; do
--      i=../../../../$d/c++/$cxxversion
--      cxxheaders=`$CXX -print-file-name="$i"` &&
-+      i="$prefix/$d/c++"
-+      cxxheaders=`$CXX -print-sysroot`"$i" &&
-       test "x$cxxheaders" != x && test "x$i" != "x$cxxheaders" &&
-       CXX_SYSINCLUDES="$CXX_SYSINCLUDES -isystem $cxxheaders \
- -isystem $cxxheaders/$cxxmachine -isystem $cxxheaders/backward"
---- a/configure
-+++ b/configure
-@@ -5618,11 +5618,10 @@ if test -n "$sysheaders"; then
- -isystem `echo $sysheaders | sed 's/:/ -isystem /g'`"
-   if test -n "$CXX"; then
-     CXX_SYSINCLUDES=
--    cxxversion=`$CXX -dumpversion 2>&5` &&
-     cxxmachine=`$CXX -dumpmachine 2>&5` &&
-     for d in include "$cxxmachine/include"; do
--      i=../../../../$d/c++/$cxxversion
--      cxxheaders=`$CXX -print-file-name="$i"` &&
-+      i="$prefix/$d/c++"
-+      cxxheaders=`$CXX -print-sysroot`"$i" &&
-       test "x$cxxheaders" != x && test "x$i" != "x$cxxheaders" &&
-       CXX_SYSINCLUDES="$CXX_SYSINCLUDES -isystem $cxxheaders \
- -isystem $cxxheaders/$cxxmachine -isystem $cxxheaders/backward"
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/0001-R_ARM_TLS_DTPOFF32.patch b/meta/recipes-core/eglibc/eglibc-2.17/0001-R_ARM_TLS_DTPOFF32.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.16/0001-R_ARM_TLS_DTPOFF32.patch
rename to meta/recipes-core/eglibc/eglibc-2.17/0001-R_ARM_TLS_DTPOFF32.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/0001-eglibc-menuconfig-support.patch b/meta/recipes-core/eglibc/eglibc-2.17/0001-eglibc-menuconfig-support.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.16/0001-eglibc-menuconfig-support.patch
rename to meta/recipes-core/eglibc/eglibc-2.17/0001-eglibc-menuconfig-support.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch b/meta/recipes-core/eglibc/eglibc-2.17/0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.16/0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
rename to meta/recipes-core/eglibc/eglibc-2.17/0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/0002-eglibc-menuconfig-hex-string-options.patch b/meta/recipes-core/eglibc/eglibc-2.17/0002-eglibc-menuconfig-hex-string-options.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.16/0002-eglibc-menuconfig-hex-string-options.patch
rename to meta/recipes-core/eglibc/eglibc-2.17/0002-eglibc-menuconfig-hex-string-options.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/0003-eglibc-menuconfig-build-instructions.patch b/meta/recipes-core/eglibc/eglibc-2.17/0003-eglibc-menuconfig-build-instructions.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.16/0003-eglibc-menuconfig-build-instructions.patch
rename to meta/recipes-core/eglibc/eglibc-2.17/0003-eglibc-menuconfig-build-instructions.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/GLRO_dl_debug_mask.patch b/meta/recipes-core/eglibc/eglibc-2.17/GLRO_dl_debug_mask.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.16/GLRO_dl_debug_mask.patch
rename to meta/recipes-core/eglibc/eglibc-2.17/GLRO_dl_debug_mask.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/IO-acquire-lock-fix.patch b/meta/recipes-core/eglibc/eglibc-2.17/IO-acquire-lock-fix.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.16/IO-acquire-lock-fix.patch
rename to meta/recipes-core/eglibc/eglibc-2.17/IO-acquire-lock-fix.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/add_resource_h_to_wait_h.patch b/meta/recipes-core/eglibc/eglibc-2.17/add_resource_h_to_wait_h.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.16/add_resource_h_to_wait_h.patch
rename to meta/recipes-core/eglibc/eglibc-2.17/add_resource_h_to_wait_h.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/eglibc-svn-arm-lowlevellock-include-tls.patch b/meta/recipes-core/eglibc/eglibc-2.17/eglibc-svn-arm-lowlevellock-include-tls.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.16/eglibc-svn-arm-lowlevellock-include-tls.patch
rename to meta/recipes-core/eglibc/eglibc-2.17/eglibc-svn-arm-lowlevellock-include-tls.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/eglibc_fix_findidx_parameters.patch b/meta/recipes-core/eglibc/eglibc-2.17/eglibc_fix_findidx_parameters.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.16/eglibc_fix_findidx_parameters.patch
rename to meta/recipes-core/eglibc/eglibc-2.17/eglibc_fix_findidx_parameters.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/etc/ld.so.conf b/meta/recipes-core/eglibc/eglibc-2.17/etc/ld.so.conf
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.16/etc/ld.so.conf
rename to meta/recipes-core/eglibc/eglibc-2.17/etc/ld.so.conf
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/fileops-without-wchar-io.patch b/meta/recipes-core/eglibc/eglibc-2.17/fileops-without-wchar-io.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.16/fileops-without-wchar-io.patch
rename to meta/recipes-core/eglibc/eglibc-2.17/fileops-without-wchar-io.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/fix_for_centos_5.8.patch b/meta/recipes-core/eglibc/eglibc-2.17/fix_for_centos_5.8.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.16/fix_for_centos_5.8.patch
rename to meta/recipes-core/eglibc/eglibc-2.17/fix_for_centos_5.8.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/fsl-ppc-no-fsqrt.patch b/meta/recipes-core/eglibc/eglibc-2.17/fsl-ppc-no-fsqrt.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.16/fsl-ppc-no-fsqrt.patch
rename to meta/recipes-core/eglibc/eglibc-2.17/fsl-ppc-no-fsqrt.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/generate-supported.mk b/meta/recipes-core/eglibc/eglibc-2.17/generate-supported.mk
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.16/generate-supported.mk
rename to meta/recipes-core/eglibc/eglibc-2.17/generate-supported.mk
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/glibc.fix_sqrt2.patch b/meta/recipes-core/eglibc/eglibc-2.17/glibc.fix_sqrt2.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.16/glibc.fix_sqrt2.patch
rename to meta/recipes-core/eglibc/eglibc-2.17/glibc.fix_sqrt2.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/initgroups_keys.patch b/meta/recipes-core/eglibc/eglibc-2.17/initgroups_keys.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.16/initgroups_keys.patch
rename to meta/recipes-core/eglibc/eglibc-2.17/initgroups_keys.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/ld-search-order.patch b/meta/recipes-core/eglibc/eglibc-2.17/ld-search-order.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.16/ld-search-order.patch
rename to meta/recipes-core/eglibc/eglibc-2.17/ld-search-order.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/mips-rld-map-check.patch b/meta/recipes-core/eglibc/eglibc-2.17/mips-rld-map-check.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.16/mips-rld-map-check.patch
rename to meta/recipes-core/eglibc/eglibc-2.17/mips-rld-map-check.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/multilib_readlib.patch b/meta/recipes-core/eglibc/eglibc-2.17/multilib_readlib.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.16/multilib_readlib.patch
rename to meta/recipes-core/eglibc/eglibc-2.17/multilib_readlib.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/ppc-sqrt_finite.patch b/meta/recipes-core/eglibc/eglibc-2.17/ppc-sqrt_finite.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.16/ppc-sqrt_finite.patch
rename to meta/recipes-core/eglibc/eglibc-2.17/ppc-sqrt_finite.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/ppc_slow_ieee754_sqrt.patch b/meta/recipes-core/eglibc/eglibc-2.17/ppc_slow_ieee754_sqrt.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.16/ppc_slow_ieee754_sqrt.patch
rename to meta/recipes-core/eglibc/eglibc-2.17/ppc_slow_ieee754_sqrt.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/relocatable_sdk.patch b/meta/recipes-core/eglibc/eglibc-2.17/relocatable_sdk.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.16/relocatable_sdk.patch
rename to meta/recipes-core/eglibc/eglibc-2.17/relocatable_sdk.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/tzselect-awk.patch b/meta/recipes-core/eglibc/eglibc-2.17/tzselect-awk.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.16/tzselect-awk.patch
rename to meta/recipes-core/eglibc/eglibc-2.17/tzselect-awk.patch
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/tzselect-sh.patch b/meta/recipes-core/eglibc/eglibc-2.17/tzselect-sh.patch
similarity index 77%
rename from meta/recipes-core/eglibc/eglibc-2.16/tzselect-sh.patch
rename to meta/recipes-core/eglibc/eglibc-2.17/tzselect-sh.patch
index c173ae2..e9a3691 100644
--- a/meta/recipes-core/eglibc/eglibc-2.16/tzselect-sh.patch
+++ b/meta/recipes-core/eglibc/eglibc-2.17/tzselect-sh.patch
@@ -8,43 +8,39 @@ Upstream-Status: Pending
 
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 
---- libc/timezone/tzselect.ksh
-+++ libc/timezone/tzselect.ksh
-@@ -1,6 +1,6 @@
--#! @KSH@
+Index: libc/timezone/tzselect.ksh
+===================================================================
+--- libc.orig/timezone/tzselect.ksh	2012-11-17 09:50:14.000000000 -0800
++++ libc/timezone/tzselect.ksh	2013-01-03 22:46:26.423844259 -0800
+@@ -1,4 +1,4 @@
+-#!/bin/bash
 +#!/bin/sh
  
--VERSION='@(#)tzselect.ksh	8.2'
-+VERSION='@(#)tzselect.sh	8.2'
- PKGVERSION='@PKGVERSION@'
- REPORT_BUGS_TO='@REPORT_BUGS_TO@'
- 
-@@ -11,19 +11,10 @@ REPORT_BUGS_TO='@REPORT_BUGS_TO@'
+ PKGVERSION='(tzcode) '
+ TZVERSION=see_Makefile
+@@ -11,23 +11,80 @@
  
  # Porting notes:
  #
--# This script requires several features of the Korn shell.
--# If your host lacks the Korn shell,
--# you can use either of the following free programs instead:
+-# This script requires a Posix-like shell with the extension of a
+-# 'select' statement.  The 'select' statement was introduced in the
+-# Korn shell and is available in Bash and other shell implementations.
+-# If your host lacks both Bash and the Korn shell, you can get their
+-# source from one of these locations:
 +# func_select allows this script to run on shells (such as busybox ash)
 +# which lack the ksh "select" builtin.
  #
--#	<a href=ftp://ftp.gnu.org/pub/gnu/>
--#	Bourne-Again shell (bash)
--#	</a>
--#
--#	<a href=ftp://ftp.cs.mun.ca/pub/pdksh/pdksh.tar.gz>
--#	Public domain ksh
--#	</a>
+-#	Bash <http://www.gnu.org/software/bash/bash.html>
+-#	Korn Shell <http://www.kornshell.com/>
+-#	Public Domain Korn Shell <http://www.cs.mun.ca/~michael/pdksh/>
 -#
 -# This script also uses several features of modern awk programs.
 +# This script uses several features of modern awk programs.
- # If your host lacks awk, or has an old awk that does not conform to Posix.2,
+ # If your host lacks awk, or has an old awk that does not conform to Posix,
  # you can use either of the following free programs instead:
  #
-@@ -35,6 +26,70 @@ REPORT_BUGS_TO='@REPORT_BUGS_TO@'
- #	mawk
- #	</a>
+ #	Gawk (GNU awk) <http://www.gnu.org/software/gawk/>
+ #	mawk <http://invisible-island.net/mawk/>
  
 +# Implement ksh-style select in POSIX shell
 +
@@ -113,7 +109,7 @@ Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
  
  # Specify default values for environment variables if they are unset.
  : ${AWK=awk}
-@@ -80,7 +135,7 @@ IFS=$newline
+@@ -72,7 +129,7 @@
  
  
  # Work around a bug in bash 1.14.7 and earlier, where $PS3 is sent to stdout.
@@ -122,7 +118,7 @@ Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
  ?*) PS3=
  esac
  
-@@ -100,7 +155,7 @@ while
+@@ -92,7 +149,7 @@
  
  	echo >&2 'Please select a continent or ocean.'
  
@@ -131,7 +127,7 @@ Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
  	    Africa \
  	    Americas \
  	    Antarctica \
-@@ -180,7 +235,7 @@ while
+@@ -172,7 +229,7 @@
  		case $countries in
  		*"$newline"*)
  			echo >&2 'Please select a country.'
@@ -140,7 +136,7 @@ Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
  			do
  			    case $country in
  			    '') echo >&2 'Please enter a number in range.';;
-@@ -219,7 +274,7 @@ while
+@@ -211,7 +268,7 @@
  		*"$newline"*)
  			echo >&2 'Please select one of the following' \
  				'time zone regions.'
@@ -149,7 +145,7 @@ Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
  			do
  				case $region in
  				'') echo >&2 'Please enter a number in range.';;
-@@ -296,7 +351,7 @@ Universal Time is now:	$UTdate."
+@@ -288,7 +345,7 @@
  	echo >&2 "Is the above information OK?"
  
  	ok=
diff --git a/meta/recipes-core/eglibc/eglibc-initial_2.16.bb b/meta/recipes-core/eglibc/eglibc-initial_2.17.bb
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-initial_2.16.bb
rename to meta/recipes-core/eglibc/eglibc-initial_2.17.bb
diff --git a/meta/recipes-core/eglibc/eglibc-locale.inc b/meta/recipes-core/eglibc/eglibc-locale.inc
index 0381e26..9b36110 100644
--- a/meta/recipes-core/eglibc/eglibc-locale.inc
+++ b/meta/recipes-core/eglibc/eglibc-locale.inc
@@ -20,8 +20,6 @@ BINARY_LOCALE_ARCHES ?= "arm.* i[3-6]86 x86_64 powerpc mips mips64"
 # set "0" for qemu emulation of native localedef for locale generation
 LOCALE_GENERATION_WITH_CROSS-LOCALEDEF = "1"
 
-PR = "r22"
-
 PROVIDES = "virtual/libc-locale"
 
 PACKAGES = "localedef ${PN}-dbg"
diff --git a/meta/recipes-core/eglibc/eglibc-locale_2.16.bb b/meta/recipes-core/eglibc/eglibc-locale_2.17.bb
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-locale_2.16.bb
rename to meta/recipes-core/eglibc/eglibc-locale_2.17.bb
diff --git a/meta/recipes-core/eglibc/eglibc-mtrace.inc b/meta/recipes-core/eglibc/eglibc-mtrace.inc
index 1ec93ac..d68783e 100644
--- a/meta/recipes-core/eglibc/eglibc-mtrace.inc
+++ b/meta/recipes-core/eglibc/eglibc-mtrace.inc
@@ -1,6 +1,5 @@
 include eglibc-collateral.inc
 
-PR = "r1"
 SUMMARY = "mtrace utility provided by eglibc"
 DESCRIPTION = "mtrace utility provided by eglibc"
 RDEPENDS_${PN} = "perl"
diff --git a/meta/recipes-core/eglibc/eglibc-mtrace_2.16.bb b/meta/recipes-core/eglibc/eglibc-mtrace_2.17.bb
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-mtrace_2.16.bb
rename to meta/recipes-core/eglibc/eglibc-mtrace_2.17.bb
diff --git a/meta/recipes-core/eglibc/eglibc-scripts_2.16.bb b/meta/recipes-core/eglibc/eglibc-scripts_2.17.bb
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-scripts_2.16.bb
rename to meta/recipes-core/eglibc/eglibc-scripts_2.17.bb
diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/eglibc/eglibc_2.17.bb
similarity index 74%
rename from meta/recipes-core/eglibc/eglibc_2.16.bb
rename to meta/recipes-core/eglibc/eglibc_2.17.bb
index 2dcaceb..1a9c288 100644
--- a/meta/recipes-core/eglibc/eglibc_2.16.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.17.bb
@@ -1,9 +1,9 @@
 require eglibc.inc
 
 DEPENDS += "gperf-native kconfig-frontends-native"
-PR = "r20"
 
-SRC_URI = "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr21224.tar.bz2;name=tarball \
+#SRC_URI = "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr21224.tar.bz2;name=tarball 
+SRC_URI = "http://sakrah.dontexist.org/files/eglibc/eglibc-${PV}-svnr22064.tar.bz2 \
            file://eglibc-svn-arm-lowlevellock-include-tls.patch \
            file://IO-acquire-lock-fix.patch \
            file://mips-rld-map-check.patch \
@@ -11,7 +11,6 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr21
            file://generate-supported.mk \
            file://glibc.fix_sqrt2.patch \
            file://multilib_readlib.patch \
-           file://use-sysroot-cxx-headers.patch \
            file://ppc-sqrt_finite.patch \
            file://GLRO_dl_debug_mask.patch \
            file://initgroups_keys.patch \
@@ -19,35 +18,19 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr21
            file://ppc_slow_ieee754_sqrt.patch \
            file://fileops-without-wchar-io.patch \
            file://add_resource_h_to_wait_h.patch \
-           file://0001-Avoid-use-of-libgcc_s-and-libgcc_eh-when-building-gl.patch \
-           file://0001-Add-ARM-specific-static-stubs.c.patch \
            file://0001-eglibc-menuconfig-support.patch \
            file://0002-eglibc-menuconfig-hex-string-options.patch \
            file://0003-eglibc-menuconfig-build-instructions.patch \
-           file://0001-Add-name_to_handle_at-open_by_handle-etc.-to-PowerPC.patch \
            file://fsl-ppc-no-fsqrt.patch \
            file://0001-R_ARM_TLS_DTPOFF32.patch \
-           http://people.linaro.org/~toolchain/openembedded/patches/eglibc/aarch64-0001-glibc-fsf-v1-eaf6f205.patch;name=patch1 \
-           http://people.linaro.org/~toolchain/openembedded/patches/eglibc/aarch64-0002-Synchronize-with-linux-elf.h.patch;name=patch2 \
-           http://people.linaro.org/~toolchain/openembedded/patches/eglibc/aarch64-0003-Adding-AArch64-support-to-elf-elf.h.patch;name=patch3 \
            file://tzselect-sh.patch \
            file://tzselect-awk.patch \
            file://0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch \
           "
+SRC_URI[md5sum] = "1464af54779c2c7d1078df9ce2e41791"
+SRC_URI[sha256sum] = "97c3991a3772f513cf704841d20c275ac48895fad2e27802dda557c0196cba6b"
 
-SRC_URI[tarball.md5sum] = "88894fa6e10e58e85fbd8134b8e486a8"
-SRC_URI[tarball.sha256sum] = "460a45f422da6eb1fd909baab6a64b5ae4c8ba18ea05a1491ed1024c8b98eeaa"
-
-SRC_URI[patch1.md5sum] = "5e52bf8fd9ac390b665d86a57ab7dba7"
-SRC_URI[patch1.sha256sum] = "b7eea76e72675a6ed3066952a9e08389c99838d74a58b736d527c82c34e754eb"
-
-SRC_URI[patch2.md5sum] = "e1ae1c416c01e2c991c7ca7e169c577b"
-SRC_URI[patch2.sha256sum] = "6093bb80a187081090cb14412f466c08fcaf39ccd62b751e3d871a8c5af03b0d"
-
-SRC_URI[patch3.md5sum] = "6d1d84e14f7abfe9ee3237d0ec6fe9ca"
-SRC_URI[patch3.sha256sum] = "03e79ace9eade0d57a3684cb0dc6b415ea52e4f152bfb380684b08445f125410"
-
-LIC_FILES_CHKSUM = "file://LICENSES;md5=98a1128c4b58120182cbea3b1752d8b9 \
+LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
       file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
       file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
       file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff "
@@ -102,17 +85,6 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
 
 EXTRA_OECONF += "${@get_libc_fpu_setting(bb, d)}"
 
-do_unpack_append() {
-    bb.build.exec_func('do_move_ports', d)
-}
-
-do_move_ports() {
-        if test -d ${WORKDIR}/eglibc-${PV}/ports ; then
-	    rm -rf ${S}/ports
-	    mv ${WORKDIR}/eglibc-${PV}/ports ${S}/
-	fi
-}
-
 do_patch_append() {
     bb.build.exec_func('do_fix_readlib_c', d)
 }
-- 
1.7.9.5



