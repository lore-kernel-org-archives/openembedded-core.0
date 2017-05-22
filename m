Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 16A5F77F7A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 05:00:59 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id u26so17292648pfd.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 May 2017 22:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IeISNKtd26W70/ymtt0cNE0UYyV5W0tgrCKAhQbcK7E=;
	b=hsHvf5XYrSvPpo7qxWAIQmHmAqD6hjsQnFb9k6n5Fo7uUpS6vAeSHA4iFqsXHK6Nlr
	ffEEB2PY9izrYr8Kv+NtGkgV0mXLUOwgQCe+z8re17PUkexw28J59i7QJ5wXk7EU3ulc
	xA47HWdI8nIdQdPhJFzI54+2KBEsu4S6HfuUL8C7ZTJjZwwwKtiKW5Yaaf08FvDk87kG
	rh1rT6CgxuPzoKbCTuTYZRJGkQKIGXt6QfmwH5JMfTvT1+MnQy5ejXKyN/6Hftfzoxwq
	Hvp+0CGyXuE32btyVAVY2OtHijVFuViTjK0WXQOQpRmKbDtM1g9x5ll6Eim83NxLR41Q
	cKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=IeISNKtd26W70/ymtt0cNE0UYyV5W0tgrCKAhQbcK7E=;
	b=IEQPfZaNwMsLveR5X4zrObY5zKA4go8MkHdgnIfLXkraRRC0tn/mbA9OpQxizLp/Sr
	sU+/E2rUYUu+usmZl2gEclZ78/i9q0TacYh1n5Y81Hbuna2Wh69H5ZEOKuafrgVOIWj0
	3MznuUkLR9MHoKW4tNre8fnUyni3g7I+Ke/Kd0aB9F4bLroehfiWT4IEq/cVSFgwVpSx
	ktHTRFKVJL2s+2650506ercwMg/sjdpIQE9Hd/OK4g7jcKOPju/qF88CEEBxkO8cBlzK
	SamaCxY23lAMh7Pw+OFbUSet7ezCotWyy/ezBKM2PDbE2dUAW0Aw75t68dlgj5szvSie
	hYfQ==
X-Gm-Message-State: AODbwcCLwsUukYlVoPdEecOXUwZ/f48B0rgKxhB+IZYa0gWgQlmjE0id
	iJSi7D1h0aiT26/D
X-Received: by 10.98.80.152 with SMTP id g24mr22780922pfj.222.1495429259442;
	Sun, 21 May 2017 22:00:59 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::63fb])
	by smtp.gmail.com with ESMTPSA id
	t13sm28839596pfa.126.2017.05.21.22.00.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 21 May 2017 22:00:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 May 2017 22:00:30 -0700
Message-Id: <20170522050042.42403-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170522050042.42403-1-raj.khem@gmail.com>
References: <20170522050042.42403-1-raj.khem@gmail.com>
Subject: [PATCH 03/15] grub: Update to 2.02
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
X-List-Received-Date: Mon, 22 May 2017 05:01:00 -0000

Drop git recipe, add arm bits to 2.02 itself

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-mfpmath-sse-as-well-when-SSE-is-disabled.patch |   0
 ...nforce-no-pie-if-the-compiler-supports-it.patch |  45 -------
 ...E-2015-8370-Grub2-user-pass-vulnerability.patch |  53 ---------
 ...ct-_llseek-code-and-require-long-filesyst.patch |  81 -------------
 ...Use-AC_HEADER_MAJOR-to-find-device-macros.patch |  92 ---------------
 ...ettext-gettext.c-main_context-secondary_c.patch |  39 ------
 ...ern-efi-mm.c-grub_efi_finish_boot_service.patch |  79 -------------
 ...1-grub.d-10_linux.in-add-oe-s-kernel-name.patch |   0
 ..._dhcp_vendor-Add-missing-const-qualifiers.patch |  33 ------
 ...ern-efi-mm.c-grub_efi_get_memory_map-Neve.patch |  43 -------
 .../{grub => files}/autogen.sh-exclude-pc.patch    |   0
 .../grub/files/check-if-liblzma-is-disabled.patch  |  33 ------
 .../grub/files/fix-endianness-problem.patch        |  44 -------
 .../grub/files/fix-issue-with-flex-2.5.37.patch    |  21 ----
 meta/recipes-bsp/grub/files/fix-texinfo.patch      |  32 -----
 .../grub/files/grub-2.00-add-oe-kernel.patch       |  53 ---------
 .../grub-2.00-fix-enable_execute_stack-check.patch |  27 -----
 .../grub/files/grub-2.00-fpmath-sse-387-fix.patch  |  24 ----
 ...allow-a-compilation-without-mcmodel-large.patch | 131 ---------------------
 .../grub/files/grub-efi-fix-with-glibc-2.20.patch  |  32 -----
 meta/recipes-bsp/grub/files/grub-install.in.patch  |  20 ----
 .../grub/files/grub-no-unused-result.patch         |  19 ---
 .../grub/files/grub2-fix-initrd-size-bug.patch     |  48 --------
 ...rub2-remove-sparc64-setup-from-x86-builds.patch |  44 -------
 meta/recipes-bsp/grub/files/remove-gets.patch      |  20 ----
 .../grub/{grub-efi_2.00.bb => grub-efi_2.02.bb}    |   9 +-
 meta/recipes-bsp/grub/grub2.inc                    |  50 ++++----
 .../grub/{grub_2.00.bb => grub_2.02.bb}            |   6 -
 meta/recipes-bsp/grub/grub_git.bb                  |  45 -------
 29 files changed, 26 insertions(+), 1097 deletions(-)
 rename meta/recipes-bsp/grub/{grub-git => files}/0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch (100%)
 delete mode 100644 meta/recipes-bsp/grub/files/0001-Enforce-no-pie-if-the-compiler-supports-it.patch
 delete mode 100644 meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch
 delete mode 100644 meta/recipes-bsp/grub/files/0001-Remove-direct-_llseek-code-and-require-long-filesyst.patch
 delete mode 100644 meta/recipes-bsp/grub/files/0001-build-Use-AC_HEADER_MAJOR-to-find-device-macros.patch
 delete mode 100644 meta/recipes-bsp/grub/files/0001-grub-core-gettext-gettext.c-main_context-secondary_c.patch
 delete mode 100644 meta/recipes-bsp/grub/files/0001-grub-core-kern-efi-mm.c-grub_efi_finish_boot_service.patch
 rename meta/recipes-bsp/grub/{grub-git => files}/0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch (100%)
 delete mode 100644 meta/recipes-bsp/grub/files/0001-parse_dhcp_vendor-Add-missing-const-qualifiers.patch
 delete mode 100644 meta/recipes-bsp/grub/files/0002-grub-core-kern-efi-mm.c-grub_efi_get_memory_map-Neve.patch
 rename meta/recipes-bsp/grub/{grub => files}/autogen.sh-exclude-pc.patch (100%)
 delete mode 100644 meta/recipes-bsp/grub/files/check-if-liblzma-is-disabled.patch
 delete mode 100644 meta/recipes-bsp/grub/files/fix-endianness-problem.patch
 delete mode 100644 meta/recipes-bsp/grub/files/fix-issue-with-flex-2.5.37.patch
 delete mode 100644 meta/recipes-bsp/grub/files/fix-texinfo.patch
 delete mode 100644 meta/recipes-bsp/grub/files/grub-2.00-add-oe-kernel.patch
 delete mode 100644 meta/recipes-bsp/grub/files/grub-2.00-fix-enable_execute_stack-check.patch
 delete mode 100644 meta/recipes-bsp/grub/files/grub-2.00-fpmath-sse-387-fix.patch
 delete mode 100644 meta/recipes-bsp/grub/files/grub-efi-allow-a-compilation-without-mcmodel-large.patch
 delete mode 100644 meta/recipes-bsp/grub/files/grub-efi-fix-with-glibc-2.20.patch
 delete mode 100644 meta/recipes-bsp/grub/files/grub-install.in.patch
 delete mode 100644 meta/recipes-bsp/grub/files/grub-no-unused-result.patch
 delete mode 100644 meta/recipes-bsp/grub/files/grub2-fix-initrd-size-bug.patch
 delete mode 100644 meta/recipes-bsp/grub/files/grub2-remove-sparc64-setup-from-x86-builds.patch
 delete mode 100644 meta/recipes-bsp/grub/files/remove-gets.patch
 rename meta/recipes-bsp/grub/{grub-efi_2.00.bb => grub-efi_2.02.bb} (88%)
 rename meta/recipes-bsp/grub/{grub_2.00.bb => grub_2.02.bb} (56%)
 delete mode 100644 meta/recipes-bsp/grub/grub_git.bb

diff --git a/meta/recipes-bsp/grub/grub-git/0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch b/meta/recipes-bsp/grub/files/0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch
similarity index 100%
rename from meta/recipes-bsp/grub/grub-git/0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch
rename to meta/recipes-bsp/grub/files/0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch
diff --git a/meta/recipes-bsp/grub/files/0001-Enforce-no-pie-if-the-compiler-supports-it.patch b/meta/recipes-bsp/grub/files/0001-Enforce-no-pie-if-the-compiler-supports-it.patch
deleted file mode 100644
index ccdbee215d..0000000000
--- a/meta/recipes-bsp/grub/files/0001-Enforce-no-pie-if-the-compiler-supports-it.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 6186bcf1bcaaa0f16e79339e07c64c841d4d957d Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 2 Dec 2016 20:52:40 +0200
-Subject: [PATCH] Enforce -no-pie, if the compiler supports it.
-
-Add a -no-pie as recent (2 Dec 2016) Debian testing compiler
-seems to default to enabling PIE when linking. See
-https://wiki.ubuntu.com/SecurityTeam/PIE
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- acinclude.m4 | 2 +-
- configure.ac | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/acinclude.m4 b/acinclude.m4
-index 19200b0..a713923 100644
---- a/acinclude.m4
-+++ b/acinclude.m4
-@@ -416,7 +416,7 @@ int main() {
- 
- [# `$CC -c -o ...' might not be portable.  But, oh, well...  Is calling
- # `ac_compile' like this correct, after all?
--if eval "$ac_compile -S -o conftest.s" 2> /dev/null; then]
-+if eval "$ac_compile -S -o conftest.s" 2> /dev/null && eval "$CC -dumpspecs 2>/dev/null | grep -e no-pie" ; then]
-   AC_MSG_RESULT([yes])
-   [# Should we clear up other files as well, having called `AC_LANG_CONFTEST'?
-   rm -f conftest.s
-diff --git a/configure.ac b/configure.ac
-index df20991..506c6b4 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -603,7 +603,7 @@ grub_CHECK_PIE
- [# Need that, because some distributions ship compilers that include
- # `-fPIE' in the default specs.
- if [ x"$pie_possible" = xyes ]; then
--  TARGET_CFLAGS="$TARGET_CFLAGS -fno-PIE"
-+  TARGET_CFLAGS="$TARGET_CFLAGS -fno-PIE -no-pie"
- fi]
- 
- # Position independent executable.
--- 
-2.10.2
-
diff --git a/meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch b/meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch
deleted file mode 100644
index 65ddcaf128..0000000000
--- a/meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-Upstream-Status: Accepted
-CVE: CVE-2015-8370
-Signed-off-by: Awais Belal <awais_belal@mentor.com>
-
-From 451d80e52d851432e109771bb8febafca7a5f1f2 Mon Sep 17 00:00:00 2001
-From: Hector Marco-Gisbert <hecmargi@upv.es>
-Date: Wed, 16 Dec 2015 04:57:18 +0000
-Subject: Fix security issue when reading username and password
-
-This patch fixes two integer underflows at:
-  * grub-core/lib/crypto.c
-  * grub-core/normal/auth.c
-
-CVE-2015-8370
-
-Signed-off-by: Hector Marco-Gisbert <hecmargi@upv.es>
-Signed-off-by: Ismael Ripoll-Ripoll <iripoll@disca.upv.es>
-Also-By: Andrey Borzenkov <arvidjaar@gmail.com>
----
-diff --git a/grub-core/lib/crypto.c b/grub-core/lib/crypto.c
-index 010e550..683a8aa 100644
---- a/grub-core/lib/crypto.c
-+++ b/grub-core/lib/crypto.c
-@@ -470,7 +470,8 @@ grub_password_get (char buf[], unsigned buf_size)
- 
-       if (key == '\b')
- 	{
--	  cur_len--;
-+	  if (cur_len)
-+	    cur_len--;
- 	  continue;
- 	}
- 
-diff --git a/grub-core/normal/auth.c b/grub-core/normal/auth.c
-index c6bd96e..8615c48 100644
---- a/grub-core/normal/auth.c
-+++ b/grub-core/normal/auth.c
-@@ -174,8 +174,11 @@ grub_username_get (char buf[], unsigned buf_size)
- 
-       if (key == '\b')
- 	{
--	  cur_len--;
--	  grub_printf ("\b");
-+	  if (cur_len)
-+	    {
-+	      cur_len--;
-+	      grub_printf ("\b");
-+	    }
- 	  continue;
- 	}
- 
---
-cgit v0.9.0.2
diff --git a/meta/recipes-bsp/grub/files/0001-Remove-direct-_llseek-code-and-require-long-filesyst.patch b/meta/recipes-bsp/grub/files/0001-Remove-direct-_llseek-code-and-require-long-filesyst.patch
deleted file mode 100644
index 9eabce977b..0000000000
--- a/meta/recipes-bsp/grub/files/0001-Remove-direct-_llseek-code-and-require-long-filesyst.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From 3bac4caa2bc64db313aaee54fffb90383e118517 Mon Sep 17 00:00:00 2001
-From: Felix Janda <felix.janda@posteo.de>
-Date: Thu, 22 Jan 2015 19:54:36 +0100
-Subject: [PATCH] Remove direct _llseek code and require long filesystem libc.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Backport
- configure.ac                    |  8 ++++++++
- grub-core/osdep/unix/hostdisk.c | 24 ------------------------
- 4 files changed, 13 insertions(+), 24 deletions(-)
-
-Index: grub-2.00/configure.ac
-===================================================================
---- grub-2.00.orig/configure.ac
-+++ grub-2.00/configure.ac
-@@ -306,6 +306,14 @@ if test x$grub_cv_apple_cc = xyes ; then
-   HOST_LDFLAGS="$HOST_LDFLAGS -Wl,-allow_stack_execute"
- fi
- 
-+case "$host_os" in
-+  cygwin | windows* | mingw32* | aros*)
-+     ;;
-+  *)
-+     AC_CHECK_SIZEOF(off_t)
-+     test x"$ac_cv_sizeof_off_t" = x8 || AC_MSG_ERROR([Large file support is required]);;
-+esac
-+
- if test x$USE_NLS = xno; then
-   HOST_CFLAGS="$HOST_CFLAGS -fno-builtin-gettext"
- fi
-Index: grub-2.00/grub-core/kern/emu/hostdisk.c
-===================================================================
---- grub-2.00.orig/grub-core/kern/emu/hostdisk.c
-+++ grub-2.00/grub-core/kern/emu/hostdisk.c
-@@ -44,11 +44,6 @@
- #ifdef __linux__
- # include <sys/ioctl.h>         /* ioctl */
- # include <sys/mount.h>
--# if !defined(__GLIBC__) || \
--        ((__GLIBC__ < 2) || ((__GLIBC__ == 2) && (__GLIBC_MINOR__ < 1)))
--/* Maybe libc doesn't have large file support.  */
--#  include <linux/unistd.h>     /* _llseek */
--# endif /* (GLIBC < 2) || ((__GLIBC__ == 2) && (__GLIBC_MINOR < 1)) */
- # ifndef BLKFLSBUF
- #  define BLKFLSBUF     _IO (0x12,97)   /* flush buffer cache */
- # endif /* ! BLKFLSBUF */
-@@ -761,25 +756,6 @@ linux_find_partition (char *dev, grub_di
- }
- #endif /* __linux__ */
- 
--#if defined(__linux__) && (!defined(__GLIBC__) || \
--        ((__GLIBC__ < 2) || ((__GLIBC__ == 2) && (__GLIBC_MINOR__ < 1))))
--  /* Maybe libc doesn't have large file support.  */
--grub_err_t
--grub_util_fd_seek (int fd, const char *name, grub_uint64_t off)
--{
--  loff_t offset, result;
--  static int _llseek (uint filedes, ulong hi, ulong lo,
--		      loff_t *res, uint wh);
--  _syscall5 (int, _llseek, uint, filedes, ulong, hi, ulong, lo,
--	     loff_t *, res, uint, wh);
--
--  offset = (loff_t) off;
--  if (_llseek (fd, offset >> 32, offset & 0xffffffff, &result, SEEK_SET))
--    return grub_error (GRUB_ERR_BAD_DEVICE, N_("cannot seek `%s': %s"),
--		       name, strerror (errno));
--  return GRUB_ERR_NONE;
--}
--#else
- grub_err_t
- grub_util_fd_seek (int fd, const char *name, grub_uint64_t off)
- {
-@@ -790,7 +766,6 @@ grub_util_fd_seek (int fd, const char *n
- 		       name, strerror (errno));
-   return 0;
- }
--#endif
- 
- static void
- flush_initial_buffer (const char *os_dev __attribute__ ((unused)))
diff --git a/meta/recipes-bsp/grub/files/0001-build-Use-AC_HEADER_MAJOR-to-find-device-macros.patch b/meta/recipes-bsp/grub/files/0001-build-Use-AC_HEADER_MAJOR-to-find-device-macros.patch
deleted file mode 100644
index f95b9ef9a0..0000000000
--- a/meta/recipes-bsp/grub/files/0001-build-Use-AC_HEADER_MAJOR-to-find-device-macros.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From 7a5b301e3adb8e054288518a325135a1883c1c6c Mon Sep 17 00:00:00 2001
-From: Mike Gilbert <floppym@gentoo.org>
-Date: Tue, 19 Apr 2016 14:27:22 -0400
-Subject: [PATCH] build: Use AC_HEADER_MAJOR to find device macros
-
-Depending on the OS/libc, device macros are defined in different
-headers. This change ensures we include the right one.
-
-sys/types.h - BSD
-sys/mkdev.h - Sun
-sys/sysmacros.h - glibc (Linux)
-
-glibc currently pulls sys/sysmacros.h into sys/types.h, but this may
-change in a future release.
-
-https://sourceware.org/ml/libc-alpha/2015-11/msg00253.html
----
-Upstream-Status: Backport
-
- configure.ac                         | 3 ++-
- grub-core/osdep/devmapper/getroot.c  | 6 ++++++
- grub-core/osdep/devmapper/hostdisk.c | 5 +++++
- grub-core/osdep/linux/getroot.c      | 6 ++++++
- grub-core/osdep/unix/getroot.c       | 4 +++-
- 5 files changed, 22 insertions(+), 2 deletions(-)
-
-Index: grub-2.00/configure.ac
-===================================================================
---- grub-2.00.orig/configure.ac
-+++ grub-2.00/configure.ac
-@@ -326,7 +326,8 @@ fi
- 
- # Check for functions and headers.
- AC_CHECK_FUNCS(posix_memalign memalign asprintf vasprintf getextmntent)
--AC_CHECK_HEADERS(sys/param.h sys/mount.h sys/mnttab.h sys/mkdev.h limits.h)
-+AC_CHECK_HEADERS(sys/param.h sys/mount.h sys/mnttab.h limits.h)
-+AC_HEADER_MAJOR
- 
- AC_CHECK_MEMBERS([struct statfs.f_fstypename],,,[$ac_includes_default
- #include <sys/param.h>
-Index: grub-2.00/grub-core/kern/emu/hostdisk.c
-===================================================================
---- grub-2.00.orig/grub-core/kern/emu/hostdisk.c
-+++ grub-2.00/grub-core/kern/emu/hostdisk.c
-@@ -41,6 +41,12 @@
- #include <errno.h>
- #include <limits.h>
- 
-+#if defined(MAJOR_IN_MKDEV)
-+#include <sys/mkdev.h>
-+#elif defined(MAJOR_IN_SYSMACROS)
-+#include <sys/sysmacros.h>
-+#endif
-+
- #ifdef __linux__
- # include <sys/ioctl.h>         /* ioctl */
- # include <sys/mount.h>
-Index: grub-2.00/util/getroot.c
-===================================================================
---- grub-2.00.orig/util/getroot.c
-+++ grub-2.00/util/getroot.c
-@@ -35,6 +35,13 @@
- #ifdef HAVE_LIMITS_H
- #include <limits.h>
- #endif
-+
-+#if defined(MAJOR_IN_MKDEV)
-+#include <sys/mkdev.h>
-+#elif defined(MAJOR_IN_SYSMACROS)
-+#include <sys/sysmacros.h>
-+#endif
-+
- #include <grub/util/misc.h>
- #include <grub/util/lvm.h>
- #include <grub/cryptodisk.h>
-Index: grub-2.00/util/raid.c
-===================================================================
---- grub-2.00.orig/util/raid.c
-+++ grub-2.00/util/raid.c
-@@ -29,6 +29,12 @@
- #include <errno.h>
- #include <sys/types.h>
- 
-+#if defined(MAJOR_IN_MKDEV)
-+#include <sys/mkdev.h>
-+#elif defined(MAJOR_IN_SYSMACROS)
-+#include <sys/sysmacros.h>
-+#endif
-+
- #include <linux/types.h>
- #include <linux/major.h>
- #include <linux/raid/md_p.h>
diff --git a/meta/recipes-bsp/grub/files/0001-grub-core-gettext-gettext.c-main_context-secondary_c.patch b/meta/recipes-bsp/grub/files/0001-grub-core-gettext-gettext.c-main_context-secondary_c.patch
deleted file mode 100644
index 6ec2363ae3..0000000000
--- a/meta/recipes-bsp/grub/files/0001-grub-core-gettext-gettext.c-main_context-secondary_c.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From f30c692c1f9ef0e93bee2b408a24baa017f1ca9d Mon Sep 17 00:00:00 2001
-From: Vladimir Serbinenko <phcoder@gmail.com>
-Date: Thu, 7 Nov 2013 01:01:47 +0100
-Subject: [PATCH] 	* grub-core/gettext/gettext.c (main_context),
- (secondary_context): 	Define after defining type and not before.
-
----
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Backport
-
- ChangeLog                   | 5 +++++
- grub-core/gettext/gettext.c | 4 ++--
- 2 files changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/grub-core/gettext/gettext.c b/grub-core/gettext/gettext.c
-index df73570..4880cef 100644
---- a/grub-core/gettext/gettext.c
-+++ b/grub-core/gettext/gettext.c
-@@ -34,8 +34,6 @@ GRUB_MOD_LICENSE ("GPLv3+");
-    http://www.gnu.org/software/autoconf/manual/gettext/MO-Files.html .
- */
- 
--static struct grub_gettext_context main_context, secondary_context;
--
- static const char *(*grub_gettext_original) (const char *s);
- 
- struct grub_gettext_msg
-@@ -69,6 +67,8 @@ struct grub_gettext_context
-   struct grub_gettext_msg *grub_gettext_msg_list;
- };
- 
-+static struct grub_gettext_context main_context, secondary_context;
-+
- #define MO_MAGIC_NUMBER 		0x950412de
- 
- static grub_err_t
--- 
-1.9.1
-
diff --git a/meta/recipes-bsp/grub/files/0001-grub-core-kern-efi-mm.c-grub_efi_finish_boot_service.patch b/meta/recipes-bsp/grub/files/0001-grub-core-kern-efi-mm.c-grub_efi_finish_boot_service.patch
deleted file mode 100644
index abf08e16c9..0000000000
--- a/meta/recipes-bsp/grub/files/0001-grub-core-kern-efi-mm.c-grub_efi_finish_boot_service.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From b258761d11946b28a847dff0768c3f271e13d60a Mon Sep 17 00:00:00 2001
-From: Awais Belal <awais_belal@mentor.com>
-Date: Thu, 8 Dec 2016 18:21:12 +0500
-Subject: [PATCH 1/2] * grub-core/kern/efi/mm.c
- (grub_efi_finish_boot_services):  Try terminating EFI services several times
- due to quirks in some  implementations.
-
-Upstream-status: Backport [ http://git.savannah.gnu.org/cgit/grub.git/patch/?id=e75fdee420a7ad95e9a465c9699adc2e2e970440 ]
-
-Signed-off-by: Awais Belal <awais_belal@mentor.com>
----
- grub-core/kern/efi/mm.c | 46 ++++++++++++++++++++++++++++++----------------
- 1 file changed, 30 insertions(+), 16 deletions(-)
-
-diff --git a/grub-core/kern/efi/mm.c b/grub-core/kern/efi/mm.c
-index 461deb0..b00e0bc 100644
---- a/grub-core/kern/efi/mm.c
-+++ b/grub-core/kern/efi/mm.c
-@@ -167,27 +167,41 @@ grub_efi_finish_boot_services (grub_efi_uintn_t *outbuf_size, void *outbuf,
- 			   apple, sizeof (apple)) == 0);
- #endif
- 
--  if (grub_efi_get_memory_map (&finish_mmap_size, finish_mmap_buf, &finish_key,
--			       &finish_desc_size, &finish_desc_version) < 0)
--    return grub_error (GRUB_ERR_IO, "couldn't retrieve memory map");
-+  while (1)
-+    {
-+      if (grub_efi_get_memory_map (&finish_mmap_size, finish_mmap_buf, &finish_key,
-+				   &finish_desc_size, &finish_desc_version) < 0)
-+	return grub_error (GRUB_ERR_IO, "couldn't retrieve memory map");
- 
--  if (outbuf && *outbuf_size < finish_mmap_size)
--    return grub_error (GRUB_ERR_IO, "memory map buffer is too small");
-+      if (outbuf && *outbuf_size < finish_mmap_size)
-+	return grub_error (GRUB_ERR_IO, "memory map buffer is too small");
- 
--  finish_mmap_buf = grub_malloc (finish_mmap_size);
--  if (!finish_mmap_buf)
--    return grub_errno;
-+      finish_mmap_buf = grub_malloc (finish_mmap_size);
-+      if (!finish_mmap_buf)
-+	return grub_errno;
- 
--  if (grub_efi_get_memory_map (&finish_mmap_size, finish_mmap_buf, &finish_key,
--			       &finish_desc_size, &finish_desc_version) <= 0)
--    return grub_error (GRUB_ERR_IO, "couldn't retrieve memory map");
-+      if (grub_efi_get_memory_map (&finish_mmap_size, finish_mmap_buf, &finish_key,
-+				   &finish_desc_size, &finish_desc_version) <= 0)
-+	{
-+	  grub_free (finish_mmap_buf);
-+	  return grub_error (GRUB_ERR_IO, "couldn't retrieve memory map");
-+	}
- 
--  b = grub_efi_system_table->boot_services;
--  status = efi_call_2 (b->exit_boot_services, grub_efi_image_handle,
--		       finish_key);
--  if (status != GRUB_EFI_SUCCESS)
--    return grub_error (GRUB_ERR_IO, "couldn't terminate EFI services");
-+      b = grub_efi_system_table->boot_services;
-+      status = efi_call_2 (b->exit_boot_services, grub_efi_image_handle,
-+			   finish_key);
-+      if (status == GRUB_EFI_SUCCESS)
-+	break;
- 
-+      if (status != GRUB_EFI_INVALID_PARAMETER)
-+	{
-+	  grub_free (finish_mmap_buf);
-+	  return grub_error (GRUB_ERR_IO, "couldn't terminate EFI services");
-+	}
-+
-+      grub_free (finish_mmap_buf);
-+      grub_printf ("Trying to terminate EFI services again\n");
-+    }
-   grub_efi_is_finished = 1;
-   if (outbuf_size)
-     *outbuf_size = finish_mmap_size;
--- 
-1.9.1
-
diff --git a/meta/recipes-bsp/grub/grub-git/0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch b/meta/recipes-bsp/grub/files/0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch
similarity index 100%
rename from meta/recipes-bsp/grub/grub-git/0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch
rename to meta/recipes-bsp/grub/files/0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch
diff --git a/meta/recipes-bsp/grub/files/0001-parse_dhcp_vendor-Add-missing-const-qualifiers.patch b/meta/recipes-bsp/grub/files/0001-parse_dhcp_vendor-Add-missing-const-qualifiers.patch
deleted file mode 100644
index 255e3eb7d6..0000000000
--- a/meta/recipes-bsp/grub/files/0001-parse_dhcp_vendor-Add-missing-const-qualifiers.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Upstream-Status: Backport
-
-Original commit: http://git.savannah.gnu.org/cgit/grub.git/commit/grub-core/net/bootp.c?id=f06c2172c0b32052f22e37523445cf8e7affaea3
-
-From 149d2a14f4723778ced23f439487201ccbf1a2c9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 23 Apr 2015 07:03:34 +0000
-Subject: [PATCH] parse_dhcp_vendor: Add missing const qualifiers.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- grub-core/net/bootp.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/grub-core/net/bootp.c b/grub-core/net/bootp.c
-index bc07d53..44131ed 100644
---- a/grub-core/net/bootp.c
-+++ b/grub-core/net/bootp.c
-@@ -52,9 +52,9 @@ set_env_limn_ro (const char *intername, const char *suffix,
- }
- 
- static void
--parse_dhcp_vendor (const char *name, void *vend, int limit, int *mask)
-+parse_dhcp_vendor (const char *name, const void *vend, int limit, int *mask)
- {
--  grub_uint8_t *ptr, *ptr0;
-+  const grub_uint8_t *ptr, *ptr0;
- 
-   ptr = ptr0 = vend;
- 
--- 
-2.1.4
-
diff --git a/meta/recipes-bsp/grub/files/0002-grub-core-kern-efi-mm.c-grub_efi_get_memory_map-Neve.patch b/meta/recipes-bsp/grub/files/0002-grub-core-kern-efi-mm.c-grub_efi_get_memory_map-Neve.patch
deleted file mode 100644
index 0e735ffcdc..0000000000
--- a/meta/recipes-bsp/grub/files/0002-grub-core-kern-efi-mm.c-grub_efi_get_memory_map-Neve.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 630de45f3d5f9a2dda7fad99acd21449b8c4111d Mon Sep 17 00:00:00 2001
-From: Awais Belal <awais_belal@mentor.com>
-Date: Thu, 8 Dec 2016 18:27:01 +0500
-Subject: [PATCH 2/2] * grub-core/kern/efi/mm.c (grub_efi_get_memory_map):
- Never  return a descriptor_size==0 to avoid potential divisions by zero.
-
-Upstream-status: Backport [ http://git.savannah.gnu.org/cgit/grub.git/commit/?id=69aee43fa64601cabf6efa9279c10d69b466662e ]
-
-Signed-off-by: Awais Belal <awais_belal@mentor.com>
----
- grub-core/kern/efi/mm.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/grub-core/kern/efi/mm.c b/grub-core/kern/efi/mm.c
-index b00e0bc..9f1d194 100644
---- a/grub-core/kern/efi/mm.c
-+++ b/grub-core/kern/efi/mm.c
-@@ -235,6 +235,7 @@ grub_efi_get_memory_map (grub_efi_uintn_t *memory_map_size,
-   grub_efi_boot_services_t *b;
-   grub_efi_uintn_t key;
-   grub_efi_uint32_t version;
-+  grub_efi_uintn_t size;
- 
-   if (grub_efi_is_finished)
-     {
-@@ -264,10 +265,14 @@ grub_efi_get_memory_map (grub_efi_uintn_t *memory_map_size,
-     map_key = &key;
-   if (! descriptor_version)
-     descriptor_version = &version;
-+  if (! descriptor_size)
-+    descriptor_size = &size;
- 
-   b = grub_efi_system_table->boot_services;
-   status = efi_call_5 (b->get_memory_map, memory_map_size, memory_map, map_key,
- 			      descriptor_size, descriptor_version);
-+  if (*descriptor_size == 0)
-+    *descriptor_size = sizeof (grub_efi_memory_descriptor_t);
-   if (status == GRUB_EFI_SUCCESS)
-     return 1;
-   else if (status == GRUB_EFI_BUFFER_TOO_SMALL)
--- 
-1.9.1
-
diff --git a/meta/recipes-bsp/grub/grub/autogen.sh-exclude-pc.patch b/meta/recipes-bsp/grub/files/autogen.sh-exclude-pc.patch
similarity index 100%
rename from meta/recipes-bsp/grub/grub/autogen.sh-exclude-pc.patch
rename to meta/recipes-bsp/grub/files/autogen.sh-exclude-pc.patch
diff --git a/meta/recipes-bsp/grub/files/check-if-liblzma-is-disabled.patch b/meta/recipes-bsp/grub/files/check-if-liblzma-is-disabled.patch
deleted file mode 100644
index 0eece082f8..0000000000
--- a/meta/recipes-bsp/grub/files/check-if-liblzma-is-disabled.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Disable liblzma if --enable-liblzma=no
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
-
---- a/configure.ac
-+++ b/configure.ac
-@@ -1029,10 +1029,20 @@ fi
- 
- AC_SUBST([LIBGEOM])
- 
--AC_CHECK_LIB([lzma], [lzma_code],
--             [LIBLZMA="-llzma"
--              AC_DEFINE([HAVE_LIBLZMA], [1],
--                        [Define to 1 if you have the LZMA library.])],)
-+AC_ARG_ENABLE([liblzma],
-+              [AS_HELP_STRING([--enable-liblzma],
-+                              [enable liblzma integration (default=guessed)])])
-+if test x"$enable_liblzma" = xno ; then
-+  liblzma_excuse="explicitly disabled"
-+fi
-+
-+if test x"$liblzma_excuse" = x ; then
-+  AC_CHECK_LIB([lzma], [lzma_code],
-+               [LIBLZMA="-llzma"
-+                AC_DEFINE([HAVE_LIBLZMA], [1],
-+                          [Define to 1 if you have the LZMA library.])],)
-+fi
-+
- AC_SUBST([LIBLZMA])
- 
- AC_ARG_ENABLE([libzfs],
diff --git a/meta/recipes-bsp/grub/files/fix-endianness-problem.patch b/meta/recipes-bsp/grub/files/fix-endianness-problem.patch
deleted file mode 100644
index 079992afba..0000000000
--- a/meta/recipes-bsp/grub/files/fix-endianness-problem.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-grub-core/net/tftp.c: fix endianness problem.
-
-	* grub-core/net/tftp.c (ack): Fix endianness problem.
-	(tftp_receive): Likewise.
-	Reported by: Michael Davidsaver.
-
-Upstream-Status: Backport
-
-diff --git a/ChangeLog b/ChangeLog
-index 81bdae9..c2f42d5 100644
---- a/ChangeLog
-+++ b/ChangeLog
-@@ -1,3 +1,9 @@
-+2012-07-02  Vladimir Serbinenko  <phcoder@gmail.com>
-+
-+	* grub-core/net/tftp.c (ack): Fix endianness problem.
-+	(tftp_receive): Likewise.
-+	Reported by: Michael Davidsaver.
-+
- 2012-06-27  Vladimir Serbinenko  <phcoder@gmail.com>
- 
- 	* configure.ac: Bump version to 2.00.
-diff --git a/grub-core/net/tftp.c b/grub-core/net/tftp.c
-index 9c70efb..d0f39ea 100644
---- a/grub-core/net/tftp.c
-+++ b/grub-core/net/tftp.c
-@@ -143,7 +143,7 @@ ack (tftp_data_t data, grub_uint16_t block)
- 
-   tftph_ack = (struct tftphdr *) nb_ack.data;
-   tftph_ack->opcode = grub_cpu_to_be16 (TFTP_ACK);
--  tftph_ack->u.ack.block = block;
-+  tftph_ack->u.ack.block = grub_cpu_to_be16 (block);
- 
-   err = grub_net_send_udp_packet (data->sock, &nb_ack);
-   if (err)
-@@ -225,7 +225,7 @@ tftp_receive (grub_net_udp_socket_t sock __attribute__ ((unused)),
- 	    grub_priority_queue_pop (data->pq);
- 
- 	    if (file->device->net->packs.count < 50)
--	      err = ack (data, tftph->u.data.block);
-+	      err = ack (data, data->block + 1);
- 	    else
- 	      {
- 		file->device->net->stall = 1;
diff --git a/meta/recipes-bsp/grub/files/fix-issue-with-flex-2.5.37.patch b/meta/recipes-bsp/grub/files/fix-issue-with-flex-2.5.37.patch
deleted file mode 100644
index 61ae2f5372..0000000000
--- a/meta/recipes-bsp/grub/files/fix-issue-with-flex-2.5.37.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Upstream-Status: Backport
-
-This fixes compilation issues when using flex-2.5.37. It was taken from upstream.
-
-Original author is: Vladimir Serbinenko  <phcoder@gmail.com>
-
-Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
-
-Index: grub-2.00/grub-core/script/yylex.l
-===================================================================
---- grub-2.00.orig/grub-core/script/yylex.l	2012-06-08 23:24:15.000000000 +0300
-+++ grub-2.00/grub-core/script/yylex.l	2013-07-31 14:34:40.708100982 +0300
-@@ -29,6 +29,8 @@
- #pragma GCC diagnostic ignored "-Wmissing-prototypes"
- #pragma GCC diagnostic ignored "-Wmissing-declarations"
- #pragma GCC diagnostic ignored "-Wunsafe-loop-optimizations"
-+#pragma GCC diagnostic ignored "-Wunused-function"
-+#pragma GCC diagnostic ignored "-Wsign-compare"
- 
- #define yyfree    grub_lexer_yyfree
- #define yyalloc   grub_lexer_yyalloc
diff --git a/meta/recipes-bsp/grub/files/fix-texinfo.patch b/meta/recipes-bsp/grub/files/fix-texinfo.patch
deleted file mode 100644
index b911d7370b..0000000000
--- a/meta/recipes-bsp/grub/files/fix-texinfo.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-The tarball has a texi file that doesn't parse with current texinfo, so if it's
-being re-generated the build will fail.  Take a patch from upstream to fix the
-texi.
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From d4c4b8e1a085f92afcec36f6e590c6dfc51d0a1c Mon Sep 17 00:00:00 2001
-From: Bryan Hundven <bryanhundven@gmail.com>
-Date: Mon, 08 Apr 2013 13:23:07 +0000
-Subject: 	* docs/grub-dev.texi: Move @itemize after @subsection to satisfy
-
-	texinfo-5.1.
----
-(limited to 'docs/grub-dev.texi')
-
-diff --git a/docs/grub-dev.texi b/docs/grub-dev.texi
-index a4a3820..f74c966 100644
---- a/docs/grub-dev.texi
-+++ b/docs/grub-dev.texi
-@@ -1394,8 +1394,8 @@ grub_video_blit_glyph (&glyph, color, 0, 0);
- 
- @node Bitmap API
- @section Bitmap API
--@itemize
- @subsection grub_video_bitmap_create
-+@itemize
- @item Prototype:
- @example
- grub_err_t grub_video_bitmap_create (struct grub_video_bitmap **bitmap, unsigned int width, unsigned int height, enum grub_video_blit_format blit_format)
---
-cgit v0.9.0.2
diff --git a/meta/recipes-bsp/grub/files/grub-2.00-add-oe-kernel.patch b/meta/recipes-bsp/grub/files/grub-2.00-add-oe-kernel.patch
deleted file mode 100644
index eb8916cb72..0000000000
--- a/meta/recipes-bsp/grub/files/grub-2.00-add-oe-kernel.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 7ab576a7c61406b7e63739d1b11017ae336b9008 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Mon, 3 Mar 2014 03:34:48 -0500
-Subject: [PATCH] grub.d/10_linux.in: add oe's kernel name
-
-Our kernel's name is bzImage, we need add it to grub.d/10_linux.in so
-that the grub-mkconfig and grub-install can work correctly.
-
-We only need add the bzImage to util/grub.d/10_linux.in, but also add it
-to util/grub.d/20_linux_xen.in to keep compatibility.
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- util/grub.d/10_linux.in     |    4 ++--
- util/grub.d/20_linux_xen.in |    2 +-
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/util/grub.d/10_linux.in b/util/grub.d/10_linux.in
-index 14402e8..c58f417 100644
---- a/util/grub.d/10_linux.in
-+++ b/util/grub.d/10_linux.in
-@@ -153,11 +153,11 @@ EOF
- machine=`uname -m`
- case "x$machine" in
-     xi?86 | xx86_64)
--	list=`for i in /boot/vmlinuz-* /vmlinuz-* /boot/kernel-* ; do
-+	list=`for i in /boot/bzImage-* /bzImage-* /boot/vmlinuz-* /vmlinuz-* /boot/kernel-* ; do
-                   if grub_file_is_not_garbage "$i" ; then echo -n "$i " ; fi
-               done` ;;
-     *) 
--	list=`for i in /boot/vmlinuz-* /boot/vmlinux-* /vmlinuz-* /vmlinux-* /boot/kernel-* ; do
-+	list=`for i in /boot/bzImage-* /boot/vmlinuz-* /boot/vmlinux-* /bzImage-* /vmlinuz-* /vmlinux-* /boot/kernel-* ; do
-                   if grub_file_is_not_garbage "$i" ; then echo -n "$i " ; fi
- 	     done` ;;
- esac
-diff --git a/util/grub.d/20_linux_xen.in b/util/grub.d/20_linux_xen.in
-index 1d94502..b2decf3 100644
---- a/util/grub.d/20_linux_xen.in
-+++ b/util/grub.d/20_linux_xen.in
-@@ -138,7 +138,7 @@ EOF
- EOF
- }
- 
--linux_list=`for i in /boot/vmlinu[xz]-* /vmlinu[xz]-* /boot/kernel-*; do
-+linux_list=`for i in /boot/bzImage[xz]-* /bzImage[xz]-* /boot/vmlinu[xz]-* /vmlinu[xz]-* /boot/kernel-*; do
-     if grub_file_is_not_garbage "$i"; then
-     	basename=$(basename $i)
- 	version=$(echo $basename | sed -e "s,^[^0-9]*-,,g")
--- 
-1.7.10.4
-
diff --git a/meta/recipes-bsp/grub/files/grub-2.00-fix-enable_execute_stack-check.patch b/meta/recipes-bsp/grub/files/grub-2.00-fix-enable_execute_stack-check.patch
deleted file mode 100644
index 1ff3c1ca09..0000000000
--- a/meta/recipes-bsp/grub/files/grub-2.00-fix-enable_execute_stack-check.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Upstream-Status: Pending
-
-
-This patch avoids this configure failure
-
-configure:20306: checking whether `ccache i586-poky-linux-gcc  -m32    -march=core2 -msse3 -mtune=generic -mfpmath=sse --sysroot=/builddisk/build/build0/tmp/sysroots/emenlow' generates calls to `__enable_execute_stack()'
-configure:20320: ccache i586-poky-linux-gcc  -m32    -march=core2 -msse3 -mtune=generic -mfpmath=sse --sysroot=/builddisk/build/build0/tmp/sysroots/emenlow -O2 -pipe -g -feliminate-unused-debug-types -Wall -W -Wshadow -Wpointer-arith -Wmissing-prototypes -Wundef -Wstrict-prototypes -g -falign-jumps=1 -falign-loops=1 -falign-functions=1 -mno-mmx -mno-sse -mno-sse2 -mno-3dnow -mfpmath=387 -fno-dwarf2-cfi-asm -m32 -fno-stack-protector -mno-stack-arg-probe -Werror -Wno-trampolines -falign-loops=1 -S conftest.c
-conftest.c:308:6: error: no previous prototype for 'g' [-Werror=missing-prototypes]
-cc1: all warnings being treated as errors
-configure:20323: $? = 1
-configure:20327: error: ccache i586-poky-linux-gcc  -m32    -march=core2 -msse3 -mtune=generic -mfpmath=sse --sysroot=/builddisk/build/build0/tmp/sysroots/emenlow failed to produce assembly code
-
-Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
-2012/04/13
-
-Index: grub-2.00/acinclude.m4
-===================================================================
---- grub-2.00.orig/acinclude.m4
-+++ grub-2.00/acinclude.m4
-@@ -317,6 +317,7 @@ dnl Check if the C compiler generates ca
- AC_DEFUN([grub_CHECK_ENABLE_EXECUTE_STACK],[
- AC_MSG_CHECKING([whether `$CC' generates calls to `__enable_execute_stack()'])
- AC_LANG_CONFTEST([AC_LANG_SOURCE([[
-+void g (int);
- void f (int (*p) (void));
- void g (int i)
- {
diff --git a/meta/recipes-bsp/grub/files/grub-2.00-fpmath-sse-387-fix.patch b/meta/recipes-bsp/grub/files/grub-2.00-fpmath-sse-387-fix.patch
deleted file mode 100644
index dd30d94b75..0000000000
--- a/meta/recipes-bsp/grub/files/grub-2.00-fpmath-sse-387-fix.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Upstream-Status: pending
-
-This patch fixes this configure issue for grub when -mfpmath=sse is in the gcc parameters.
-
-configure:20574: i586-poky-linux-gcc  -m32    -march=core2 -msse3 -mtune=generic -mfpmath=sse --sysroot=/usr/local/dev/yocto/grubtest2/build/tmp/sysroots/emenlow -o conftest -O2 -pipe -g -feliminate-unused-debug-types -Wall -W -Wshadow -Wpointer-arith -Wmissing-prototypes -Wundef -Wstrict-prototypes -g -falign-jumps=1 -falign-loops=1 -falign-functions=1 -mno-mmx -mno-sse -mno-sse2 -mno-3dnow -fno-dwarf2-cfi-asm -m32 -fno-stack-protector -mno-stack-arg-probe -Werror -nostdlib -Wl,--defsym,___main=0x8100  -Wall -W -I$(top_srcdir)/include -I$(top_builddir)/include  -DGRUB_MACHINE_PCBIOS=1 -DGRUB_MACHINE=I386_PC -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed conftest.c  >&5
-conftest.c:1:0: error: SSE instruction set disabled, using 387 arithmetics [-Werror]
-cc1: all warnings being treated as errors
-
-Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
-2012/04/13
-
-Index: grub-1.99/configure.ac
-===================================================================
---- grub-1.99.orig/configure.ac
-+++ grub-1.99/configure.ac
-@@ -378,7 +378,7 @@ if test "x$target_cpu" = xi386; then
- 
-   # Some toolchains enable these features by default, but they need
-   # registers that aren't set up properly in GRUB.
--  TARGET_CFLAGS="$TARGET_CFLAGS -mno-mmx -mno-sse -mno-sse2 -mno-3dnow"
-+  TARGET_CFLAGS="$TARGET_CFLAGS -mno-mmx -mno-sse -mno-sse2 -mno-3dnow -mfpmath=387"
- fi
- 
- # By default, GCC 4.4 generates .eh_frame sections containing unwind
diff --git a/meta/recipes-bsp/grub/files/grub-efi-allow-a-compilation-without-mcmodel-large.patch b/meta/recipes-bsp/grub/files/grub-efi-allow-a-compilation-without-mcmodel-large.patch
deleted file mode 100644
index 4588fca4ba..0000000000
--- a/meta/recipes-bsp/grub/files/grub-efi-allow-a-compilation-without-mcmodel-large.patch
+++ /dev/null
@@ -1,131 +0,0 @@
-Allow a compilation without -mcmodel=large
-
-It's provided by Vladimir Serbinenko, and he will commit
-it upstream so it should be backport patch.
-
-Upstream-Status: Backport
-
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
-
---
-diff --git a/configure.ac b/configure.ac
-index 9f8fb8a..2c5e6ed 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -723,9 +723,7 @@ if test "$target_cpu" = x86_64; then
- 		      [grub_cv_cc_mcmodel=yes],
- 		      [grub_cv_cc_mcmodel=no])
-   ])
--  if test "x$grub_cv_cc_mcmodel" = xno; then
--    AC_MSG_ERROR([-mcmodel=large not supported. Upgrade your gcc.])
--  else
-+  if test "x$grub_cv_cc_mcmodel" = xyes; then
-     TARGET_CFLAGS="$TARGET_CFLAGS -mcmodel=large"
-   fi
- fi
-diff --git a/grub-core/kern/efi/mm.c b/grub-core/kern/efi/mm.c
-index 1409b5d..6e9dace 100644
---- a/grub-core/kern/efi/mm.c
-+++ b/grub-core/kern/efi/mm.c
-@@ -32,6 +32,12 @@
- #define BYTES_TO_PAGES(bytes)	(((bytes) + 0xfff) >> 12)
- #define PAGES_TO_BYTES(pages)	((pages) << 12)
-
-+#if defined (__code_model_large__) || !defined (__x86_64__)
-+#define MAX_USABLE_ADDRESS 0xffffffff
-+#else
-+#define MAX_USABLE_ADDRESS 0x7fffffff
-+#endif
-+
- /* The size of a memory map obtained from the firmware. This must be
-    a multiplier of 4KB.  */
- #define MEMORY_MAP_SIZE	0x3000
-@@ -58,7 +64,7 @@ grub_efi_allocate_pages (grub_efi_physical_address_t address,
-
- #if 1
-   /* Limit the memory access to less than 4GB for 32-bit platforms.  */
--  if (address > 0xffffffff)
-+  if (address > MAX_USABLE_ADDRESS)
-     return 0;
- #endif
-
-@@ -66,7 +72,7 @@ grub_efi_allocate_pages (grub_efi_physical_address_t address,
-   if (address == 0)
-     {
-       type = GRUB_EFI_ALLOCATE_MAX_ADDRESS;
--      address = 0xffffffff;
-+      address = MAX_USABLE_ADDRESS;
-     }
-   else
-     type = GRUB_EFI_ALLOCATE_ADDRESS;
-@@ -86,7 +92,7 @@ grub_efi_allocate_pages (grub_efi_physical_address_t address,
-     {
-       /* Uggh, the address 0 was allocated... This is too annoying,
- 	 so reallocate another one.  */
--      address = 0xffffffff;
-+      address = MAX_USABLE_ADDRESS;
-       status = efi_call_4 (b->allocate_pages, type, GRUB_EFI_LOADER_DATA, pages, &address);
-       grub_efi_free_pages (0, pages);
-       if (status != GRUB_EFI_SUCCESS)
-@@ -319,7 +325,7 @@ filter_memory_map (grub_efi_memory_descriptor_t *memory_map,
-     {
-       if (desc->type == GRUB_EFI_CONVENTIONAL_MEMORY
- #if 1
--	  && desc->physical_start <= 0xffffffff
-+	  && desc->physical_start <= MAX_USABLE_ADDRESS
- #endif
- 	  && desc->physical_start + PAGES_TO_BYTES (desc->num_pages) > 0x100000
- 	  && desc->num_pages != 0)
-@@ -337,9 +343,9 @@ filter_memory_map (grub_efi_memory_descriptor_t *memory_map,
- #if 1
- 	  if (BYTES_TO_PAGES (filtered_desc->physical_start)
- 	      + filtered_desc->num_pages
--	      > BYTES_TO_PAGES (0x100000000LL))
-+	      > BYTES_TO_PAGES (MAX_USABLE_ADDRESS+1LL))
- 	    filtered_desc->num_pages
--	      = (BYTES_TO_PAGES (0x100000000LL)
-+	      = (BYTES_TO_PAGES (MAX_USABLE_ADDRESS+1LL)
- 		 - BYTES_TO_PAGES (filtered_desc->physical_start));
- #endif
-
-diff --git a/grub-core/kern/x86_64/dl.c b/grub-core/kern/x86_64/dl.c
-index 65f09ef..17c1215 100644
---- a/grub-core/kern/x86_64/dl.c
-+++ b/grub-core/kern/x86_64/dl.c
-@@ -100,14 +100,32 @@ grub_arch_dl_relocate_symbols (grub_dl_t mod, void *ehdr)
- 		    break;
-
- 		  case R_X86_64_PC32:
--		    *addr32 += rel->r_addend + sym->st_value -
--		              (Elf64_Xword) seg->addr - rel->r_offset;
-+		    {
-+		      grub_int64_t value;
-+		      value = ((grub_int32_t) *addr32) + rel->r_addend + sym->st_value -
-+			(Elf64_Xword) seg->addr - rel->r_offset;
-+		      if (value != (grub_int32_t) value)
-+			return grub_error (GRUB_ERR_BAD_MODULE, "relocation out of range");
-+		      *addr32 = value;
-+		    }
- 		    break;
-
-                   case R_X86_64_32:
-+		    {
-+		      grub_uint64_t value = *addr32 + rel->r_addend + sym->st_value;
-+		      if (value != (grub_uint32_t) value)
-+			return grub_error (GRUB_ERR_BAD_MODULE, "relocation out of range");
-+		      *addr32 = value;
-+		    }
-+		    break;
-                   case R_X86_64_32S:
--                    *addr32 += rel->r_addend + sym->st_value;
--                    break;
-+		    {
-+		      grub_int64_t value = ((grub_int32_t) *addr32) + rel->r_addend + sym->st_value;
-+		      if (value != (grub_int32_t) value)
-+			return grub_error (GRUB_ERR_BAD_MODULE, "relocation out of range");
-+		      *addr32 = value;
-+		    }
-+		    break;
-
- 		  default:
- 		    return grub_error (GRUB_ERR_NOT_IMPLEMENTED_YET,
diff --git a/meta/recipes-bsp/grub/files/grub-efi-fix-with-glibc-2.20.patch b/meta/recipes-bsp/grub/files/grub-efi-fix-with-glibc-2.20.patch
deleted file mode 100644
index 4f12628a4b..0000000000
--- a/meta/recipes-bsp/grub/files/grub-efi-fix-with-glibc-2.20.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From eb6368e65f6988eebad26cebdec057f797bceb40 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Tue, 9 Sep 2014 00:02:30 -0700
-Subject: [PATCH] Fix build with glibc 2.20
-
-* grub-core/kern/emu/hostfs.c: squahes below warning
-  warning: #warning "_BSD_SOURCE and _SVID_SOURCE are deprecated, use _DEFAULT_SOURCE"
-
-Upstream-Status: Submitted
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- grub-core/kern/emu/hostfs.c |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/grub-core/kern/emu/hostfs.c b/grub-core/kern/emu/hostfs.c
-index 3cb089c..a51ee32 100644
---- a/grub-core/kern/emu/hostfs.c
-+++ b/grub-core/kern/emu/hostfs.c
-@@ -16,7 +16,7 @@
-  *  You should have received a copy of the GNU General Public License
-  *  along with GRUB.  If not, see <http://www.gnu.org/licenses/>.
-  */
--#define _BSD_SOURCE
-+#define _DEFAULT_SOURCE
- #include <grub/fs.h>
- #include <grub/file.h>
- #include <grub/disk.h>
--- 
-1.7.9.5
-
diff --git a/meta/recipes-bsp/grub/files/grub-install.in.patch b/meta/recipes-bsp/grub/files/grub-install.in.patch
deleted file mode 100644
index 326951df44..0000000000
--- a/meta/recipes-bsp/grub/files/grub-install.in.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-Our use of grub-install doesn't require the -x option, so we should be
-be able make use of grep versions that don't support it.
-
-Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
-
-Index: grub-1.99/util/grub-install.in
-===================================================================
---- grub-1.99.orig/util/grub-install.in	2011-09-09 22:37:20.093906679 -0500
-+++ grub-1.99/util/grub-install.in	2011-09-09 22:37:30.854737882 -0500
-@@ -510,7 +510,7 @@
- 
- if [ "x${devabstraction_module}" = "x" ] ; then
-     if [ x"${install_device}" != x ]; then
--      if echo "${install_device}" | grep -qx "(.*)" ; then
-+      if echo "${install_device}" | grep -q "(.*)" ; then
-         install_drive="${install_device}"
-       else
-         install_drive="`"$grub_probe" --device-map="${device_map}" --target=drive --device "${install_device}"`" || exit 1
diff --git a/meta/recipes-bsp/grub/files/grub-no-unused-result.patch b/meta/recipes-bsp/grub/files/grub-no-unused-result.patch
deleted file mode 100644
index 4cbd0838d1..0000000000
--- a/meta/recipes-bsp/grub/files/grub-no-unused-result.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Signed-off-by: Radu Moisan <radu.moisan@intel.com>
-Upstream-Status: Pending
-
-I had an error because of an unused return value for read().
-I added -Wno-unused-result.
-
-Index: grub-2.00/configure.ac
-===================================================================
---- grub-2.00.orig/configure.ac	2012-08-13 16:32:33.000000000 +0300
-+++ grub-2.00/configure.ac	2012-08-13 16:38:22.000000000 +0300
-@@ -394,7 +394,7 @@
- LIBS=""
- 
- # debug flags.
--WARN_FLAGS="-Wall -W -Wshadow -Wold-style-definition -Wpointer-arith -Wundef -Wextra -Waddress -Wattributes -Wcast-align -Wchar-subscripts -Wcomment -Wdeprecated-declarations -Wdisabled-optimization -Wdiv-by-zero -Wempty-body -Wendif-labels -Wfloat-equal -Wformat-extra-args -Wformat-security -Wformat-y2k -Wimplicit -Wimplicit-function-declaration -Wimplicit-int -Winit-self -Wint-to-pointer-cast -Winvalid-pch -Wmain -Wmissing-braces -Wmissing-field-initializers -Wmissing-format-attribute -Wmissing-noreturn -Wmultichar -Wnonnull -Woverflow -Wparentheses -Wpointer-arith -Wpointer-to-int-cast -Wreturn-type -Wsequence-point -Wshadow -Wsign-compare -Wstrict-aliasing -Wswitch -Wtrigraphs -Wundef -Wunknown-pragmas -Wunused -Wunused-function -Wunused-label -Wunused-parameter -Wunused-value  -Wunused-variable -Wvariadic-macros -Wvolatile-register-var -Wwrite-strings -Wnested-externs -Wstrict-prototypes -Wpointer-sign"
-+WARN_FLAGS="-Wall -W -Wshadow -Wold-style-definition -Wpointer-arith -Wundef -Wextra -Waddress -Wattributes -Wcast-align -Wchar-subscripts -Wcomment -Wdeprecated-declarations -Wdisabled-optimization -Wdiv-by-zero -Wempty-body -Wendif-labels -Wfloat-equal -Wformat-extra-args -Wformat-security -Wformat-y2k -Wimplicit -Wimplicit-function-declaration -Wimplicit-int -Winit-self -Wint-to-pointer-cast -Winvalid-pch -Wmain -Wmissing-braces -Wmissing-field-initializers -Wmissing-format-attribute -Wmissing-noreturn -Wmultichar -Wnonnull -Woverflow -Wparentheses -Wpointer-arith -Wpointer-to-int-cast -Wreturn-type -Wsequence-point -Wshadow -Wsign-compare -Wstrict-aliasing -Wswitch -Wtrigraphs -Wundef -Wunknown-pragmas -Wunused -Wunused-function -Wunused-label -Wunused-parameter -Wunused-value  -Wunused-variable -Wno-unused-result -Wvariadic-macros -Wvolatile-register-var -Wwrite-strings -Wnested-externs -Wstrict-prototypes -Wpointer-sign"
- HOST_CFLAGS="$HOST_CFLAGS $WARN_FLAGS"
- TARGET_CFLAGS="$TARGET_CFLAGS $WARN_FLAGS -g -Wredundant-decls -Wmissing-prototypes -Wmissing-declarations"
- TARGET_CCASFLAGS="$TARGET_CCASFLAGS -g"
diff --git a/meta/recipes-bsp/grub/files/grub2-fix-initrd-size-bug.patch b/meta/recipes-bsp/grub/files/grub2-fix-initrd-size-bug.patch
deleted file mode 100644
index d114f4847b..0000000000
--- a/meta/recipes-bsp/grub/files/grub2-fix-initrd-size-bug.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 8fbb150a56966edde4dc07b8d01be5eb149b65ab Mon Sep 17 00:00:00 2001
-From: Colin Watson <cjwatson@ubuntu.com>
-Date: Sun, 20 Jan 2013 23:03:35 +0000
-Subject: [PATCH 1/1] * grub-core/loader/i386/linux.c (grub_cmd_initrd): Don't
- add the initrd size to addr_min, since the initrd will be allocated after
- this address.
-
-commit 6a0debbd9167e8f79cdef5497a73d23e580c0cd4 upstream
-
-Upstream-Status: Backport
-
-Signed-off-by: Shan Hai <shan.hai@windriver.com>
----
- ChangeLog                     | 6 ++++++
- grub-core/loader/i386/linux.c | 3 +--
- 2 files changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/ChangeLog b/ChangeLog
-index c2f42d5..40cb508 100644
---- a/ChangeLog
-+++ b/ChangeLog
-@@ -1,3 +1,9 @@
-+2013-01-20  Colin Watson  <cjwatson@ubuntu.com>
-+
-+	* grub-core/loader/i386/linux.c (grub_cmd_initrd): Don't add the
-+	initrd size to addr_min, since the initrd will be allocated after
-+	this address.
-+
- 2012-07-02  Vladimir Serbinenko  <phcoder@gmail.com>
- 
- 	* grub-core/net/tftp.c (ack): Fix endianness problem.
-diff --git a/grub-core/loader/i386/linux.c b/grub-core/loader/i386/linux.c
-index 62087cf..e2425c8 100644
---- a/grub-core/loader/i386/linux.c
-+++ b/grub-core/loader/i386/linux.c
-@@ -1098,8 +1098,7 @@ grub_cmd_initrd (grub_command_t cmd __attribute__ ((unused)),
-      worse than that of Linux 2.3.xx, so avoid the last 64kb.  */
-   addr_max -= 0x10000;
- 
--  addr_min = (grub_addr_t) prot_mode_target + prot_init_space
--             + page_align (size);
-+  addr_min = (grub_addr_t) prot_mode_target + prot_init_space;
- 
-   /* Put the initrd as high as possible, 4KiB aligned.  */
-   addr = (addr_max - size) & ~0xFFF;
--- 
-1.8.5.2.233.g932f7e4
-
diff --git a/meta/recipes-bsp/grub/files/grub2-remove-sparc64-setup-from-x86-builds.patch b/meta/recipes-bsp/grub/files/grub2-remove-sparc64-setup-from-x86-builds.patch
deleted file mode 100644
index 5168d3ca56..0000000000
--- a/meta/recipes-bsp/grub/files/grub2-remove-sparc64-setup-from-x86-builds.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-Subject: [PATCH] grub2: remove grub-sparc64-setup from x86 builds
-
-* remove the grub-sparc64-setup files from the x86 builds.
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- Makefile.util.def | 18 ------------------
- 1 file changed, 18 deletions(-)
-
-diff --git a/Makefile.util.def b/Makefile.util.def
-index b80187c..a670cf2 100644
---- a/Makefile.util.def
-+++ b/Makefile.util.def
-@@ -321,24 +321,6 @@ program = {
- };
- 
- program = {
--  name = grub-sparc64-setup;
--  installdir = sbin;
--  mansection = 8;
--  common = util/grub-setup.c;
--  common = util/lvm.c;
--  common = grub-core/kern/emu/argp_common.c;
--  common = grub-core/lib/reed_solomon.c;
--  common = util/ieee1275/ofpath.c;
--
--  ldadd = libgrubmods.a;
--  ldadd = libgrubkern.a;
--  ldadd = libgrubgcry.a;
--  ldadd = grub-core/gnulib/libgnu.a;
--  ldadd = '$(LIBINTL) $(LIBDEVMAPPER) $(LIBUTIL) $(LIBZFS) $(LIBNVPAIR) $(LIBGEOM)';
--  cppflags = '-DGRUB_SETUP_SPARC64=1';
--};
--
--program = {
-   name = grub-ofpathname;
-   installdir = sbin;
-   mansection = 8;
--- 
-2.8.1
-
diff --git a/meta/recipes-bsp/grub/files/remove-gets.patch b/meta/recipes-bsp/grub/files/remove-gets.patch
deleted file mode 100644
index 463f7847ad..0000000000
--- a/meta/recipes-bsp/grub/files/remove-gets.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-ISO C11 removes the specification of gets() from the C language, eglibc 2.16+ removed it
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-Index: grub-1.99/grub-core/gnulib/stdio.in.h
-===================================================================
---- grub-1.99.orig/grub-core/gnulib/stdio.in.h	2010-12-01 06:45:43.000000000 -0800
-+++ grub-1.99/grub-core/gnulib/stdio.in.h	2012-07-04 12:25:02.057099107 -0700
-@@ -140,8 +140,10 @@
- /* It is very rare that the developer ever has full control of stdin,
-    so any use of gets warrants an unconditional warning.  Assume it is
-    always declared, since it is required by C89.  */
-+#if defined gets
- #undef gets
- _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
-+#endif
- 
- #if @GNULIB_FOPEN@
- # if @REPLACE_FOPEN@
diff --git a/meta/recipes-bsp/grub/grub-efi_2.00.bb b/meta/recipes-bsp/grub/grub-efi_2.02.bb
similarity index 88%
rename from meta/recipes-bsp/grub/grub-efi_2.00.bb
rename to meta/recipes-bsp/grub/grub-efi_2.02.bb
index e12f1d773f..9d494d5d12 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.00.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.02.bb
@@ -1,8 +1,9 @@
 require grub2.inc
 
+GRUBPLATFORM = "efi"
+
 DEPENDS_class-target = "grub-efi-native"
 RDEPENDS_${PN}_class-target = "diffutils freetype"
-PR = "r3"
 
 SRC_URI += " \
            file://cfg \
@@ -29,11 +30,7 @@ python __anonymous () {
 inherit deploy
 
 CACHED_CONFIGUREVARS += "ac_cv_path_HELP2MAN="
-EXTRA_OECONF = "--with-platform=efi --disable-grub-mkfont \
-                --enable-efiemu=no --program-prefix='' \
-                --enable-liblzma=no --enable-device-mapper=no --enable-libzfs=no \
-                --enable-largefile \
-"
+EXTRA_OECONF += "--enable-efiemu=no"
 
 # ldm.c:114:7: error: trampoline generated for nested function 'hook' [-Werror=trampolines]
 # and many other places in the grub code when compiled with some native gcc compilers (specifically, gentoo)
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index ef893b327f..bb6ebddf57 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -12,41 +12,37 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
-           file://grub-module-explicitly-keeps-symbole-.module_license.patch \
-           file://grub-2.00-fpmath-sse-387-fix.patch \
-           file://check-if-liblzma-is-disabled.patch \
-           file://fix-issue-with-flex-2.5.37.patch \
-           file://grub-2.00-add-oe-kernel.patch \
-           file://grub-install.in.patch \
-           file://remove-gets.patch \
-           file://fix-endianness-problem.patch \
-           file://grub2-remove-sparc64-setup-from-x86-builds.patch \
-           file://grub-2.00-fix-enable_execute_stack-check.patch \
-           file://grub-no-unused-result.patch \
-           file://grub-efi-allow-a-compilation-without-mcmodel-large.patch \
-           file://grub-efi-fix-with-glibc-2.20.patch \
+           file://0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
-           file://0001-parse_dhcp_vendor-Add-missing-const-qualifiers.patch \
-           file://grub2-fix-initrd-size-bug.patch \
-           file://0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch \
-           file://0001-Remove-direct-_llseek-code-and-require-long-filesyst.patch \
-           file://fix-texinfo.patch \
-           file://0001-grub-core-gettext-gettext.c-main_context-secondary_c.patch \
-           file://0001-Enforce-no-pie-if-the-compiler-supports-it.patch \
-           file://0001-grub-core-kern-efi-mm.c-grub_efi_finish_boot_service.patch \
-           file://0002-grub-core-kern-efi-mm.c-grub_efi_get_memory_map-Neve.patch \
-           file://0001-build-Use-AC_HEADER_MAJOR-to-find-device-macros.patch \
-            "
+           file://autogen.sh-exclude-pc.patch \
+           file://grub-module-explicitly-keeps-symbole-.module_license.patch \
+"
+SRC_URI[md5sum] = "1116d1f60c840e6dbd67abbc99acb45d"
+SRC_URI[sha256sum] = "660ee136fbcee08858516ed4de2ad87068bfe1b6b8b37896ce3529ff054a726d"
 
 DEPENDS = "flex-native bison-native autogen-native"
 
-SRC_URI[md5sum] = "e927540b6eda8b024fb0391eeaa4091c"
-SRC_URI[sha256sum] = "65b39a0558f8c802209c574f4d02ca263a804e8a564bc6caf1cd0fd3b3cc11e3"
+COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*)-(linux.*|freebsd.*)'
+COMPATIBLE_HOST_armv7a = 'null'
+COMPATIBLE_HOST_armv7ve = 'null'
 
-COMPATIBLE_HOST = '(x86_64.*|i.86.*)-(linux|freebsd.*)'
+# configure.ac has code to set this automagically from the target tuple
+# but the OE freeform one (core2-foo-bar-linux) don't work with that.
+
+GRUBPLATFORM_arm = "uboot"
+GRUBPLATFORM_aarch64 = "efi"
+GRUBPLATFORM ??= "pc"
 
 inherit autotools gettext texinfo
 
+EXTRA_OECONF = "--with-platform=${GRUBPLATFORM} \
+                --disable-grub-mkfont \
+                --program-prefix="" \
+                --enable-liblzma=no \
+                --enable-libzfs=no \
+                --enable-largefile \
+"
+
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[grub-mount] = "--enable-grub-mount,--disable-grub-mount,fuse"
 PACKAGECONFIG[device-mapper] = "--enable-device-mapper,--disable-device-mapper,lvm2"
diff --git a/meta/recipes-bsp/grub/grub_2.00.bb b/meta/recipes-bsp/grub/grub_2.02.bb
similarity index 56%
rename from meta/recipes-bsp/grub/grub_2.00.bb
rename to meta/recipes-bsp/grub/grub_2.02.bb
index c3829381ae..57c6559365 100644
--- a/meta/recipes-bsp/grub/grub_2.00.bb
+++ b/meta/recipes-bsp/grub/grub_2.02.bb
@@ -1,12 +1,6 @@
 require grub2.inc
 
 RDEPENDS_${PN} = "diffutils freetype grub-editenv"
-PR = "r1"
-
-EXTRA_OECONF = "--with-platform=pc --disable-grub-mkfont --program-prefix="" \
-                --enable-liblzma=no --enable-device-mapper=no --enable-libzfs=no \
-                --enable-largefile \
-"
 
 PACKAGES =+ "grub-editenv"
 
diff --git a/meta/recipes-bsp/grub/grub_git.bb b/meta/recipes-bsp/grub/grub_git.bb
deleted file mode 100644
index 0a81e530f4..0000000000
--- a/meta/recipes-bsp/grub/grub_git.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-require grub2.inc
-
-DEFAULT_PREFERENCE = "-1"
-DEFAULT_PREFERENCE_arm = "1"
-
-FILESEXTRAPATHS =. "${FILE_DIRNAME}/grub-git:"
-
-PV = "2.00+${SRCPV}"
-SRCREV = "ce95549cc54b5d6f494608a7c390dba3aab4fba7"
-SRC_URI = "git://git.savannah.gnu.org/grub.git \
-           file://0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch \
-           file://autogen.sh-exclude-pc.patch \
-           file://0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch \
-          "
-
-S = "${WORKDIR}/git"
-
-COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*)-(linux.*|freebsd.*)'
-COMPATIBLE_HOST_armv7a = 'null'
-COMPATIBLE_HOST_armv7ve = 'null'
-
-# configure.ac has code to set this automagically from the target tuple
-# but the OE freeform one (core2-foo-bar-linux) don't work with that.
-
-GRUBPLATFORM_arm = "uboot"
-GRUBPLATFORM_aarch64 = "efi"
-GRUBPLATFORM ??= "pc"
-
-EXTRA_OECONF = "--with-platform=${GRUBPLATFORM} --disable-grub-mkfont --program-prefix="" \
-                --enable-liblzma=no --enable-device-mapper=no --enable-libzfs=no \
-                --enable-largefile \
-"
-
-do_install_append () {
-    install -d ${D}${sysconfdir}/grub.d
-    rm -rf ${D}${libdir}/charset.alias
-}
-
-# debugedit chokes on bare metal binaries
-INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-
-RDEPENDS_${PN} = "diffutils freetype"
-
-INSANE_SKIP_${PN} = "arch"
-INSANE_SKIP_${PN}-dbg = "arch"
-- 
2.13.0


