Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PzRGb-0005Z3-42
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Mar 2011 11:14:17 +0100
Received: by mail-bw0-f47.google.com with SMTP id 10so363080bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2011 03:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=tbyNsYj4y+9fTrU9bMaTcNFI/1RYPVtaCIJ1qDrVIyY=;
	b=xxPuLTyI4V64eHrEikXnTKFG+SAymQkI3Eij9gkOmMCnSkiq2M1jPSG/msBEBLzNRh
	JUdDQ9PGenKH01Fk0MSFgR233IfCBfRWIj4OwZ7TzQWE7wEk/vfPqdCARIw6w8QrZ6tD
	dkMVSppl4ZwlY6rYSMBa11BDQtT28H1NO15wA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=EW42Kw2LB4O+4qT3YrIuIhTxGWZ4HOzfinCOEKu+QCwFv+L/Y+d3olD+EQO/sz3SWE
	fEhgB0YRa2HnBUkwc3xnYZpnlTsvU9KBOnH2gejZiA5OfkzqvB2TOcZ3ctmPtCupT6fM
	PgP9MIcx6oyg4rKyBFJkbZfz5dj8C6m9EQVTw=
Received: by 10.204.17.1 with SMTP id q1mr7621937bka.131.1300183957297;
	Tue, 15 Mar 2011 03:12:37 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id b6sm5839507bkb.10.2011.03.15.03.12.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Mar 2011 03:12:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Mar 2011 11:12:29 +0100
Message-Id: <0c7b5d9a74e22e2dfc72ec2c3a0ec37411565635.1300183818.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1300183818.git.Martin.Jansa@gmail.com>
References: <cover.1300183818.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/3] util-linux: remove unused files from files directory
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
X-List-Received-Date: Tue, 15 Mar 2011 10:14:17 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../util-linux/files/debian-bug392236.patch        |  203 --------------------
 .../util-linux/files/fdiskbsdlabel_thumb.diff      |   12 --
 .../recipes-core/util-linux/files/fix-make-c.patch |   41 ----
 meta/recipes-core/util-linux/files/gcc34.patch     |   23 ---
 meta/recipes-core/util-linux/files/glibc-fix.patch |   22 --
 .../util-linux/files/optional-uuid.patch           |   55 ------
 meta/recipes-core/util-linux/files/umount.diff     |   19 --
 meta/recipes-core/util-linux/files/uuid.patch      |   22 --
 8 files changed, 0 insertions(+), 397 deletions(-)
 delete mode 100644 meta/recipes-core/util-linux/files/debian-bug392236.patch
 delete mode 100644 meta/recipes-core/util-linux/files/fdiskbsdlabel_thumb.diff
 delete mode 100644 meta/recipes-core/util-linux/files/fix-make-c.patch
 delete mode 100644 meta/recipes-core/util-linux/files/gcc34.patch
 delete mode 100644 meta/recipes-core/util-linux/files/glibc-fix.patch
 delete mode 100644 meta/recipes-core/util-linux/files/optional-uuid.patch
 delete mode 100644 meta/recipes-core/util-linux/files/umount.diff
 delete mode 100644 meta/recipes-core/util-linux/files/uuid.patch

diff --git a/meta/recipes-core/util-linux/files/debian-bug392236.patch b/meta/recipes-core/util-linux/files/debian-bug392236.patch
deleted file mode 100644
index fcd2046..0000000
--- a/meta/recipes-core/util-linux/files/debian-bug392236.patch
+++ /dev/null
@@ -1,203 +0,0 @@
-Index: util-linux-2.12r/fdisk/llseek.c
-===================================================================
---- util-linux-2.12r.orig/fdisk/llseek.c	2003-07-13 23:13:33.000000000 +0200
-+++ util-linux-2.12r/fdisk/llseek.c	2007-04-04 19:01:14.000000000 +0200
-@@ -14,30 +14,23 @@
- 
- #ifdef __linux__
- 
--#ifdef HAVE_LLSEEK
--#include <syscall.h>
--
--#else	/* HAVE_LLSEEK */
-+#include <sys/syscall.h>
-+#ifndef HAVE_LLSEEK
- 
- #if defined(__alpha__) || defined(__ia64__) || defined(__s390x__)
- 
- #define my_llseek lseek
- 
- #else
--#include <linux/unistd.h>	/* for __NR__llseek */
--
--static int _llseek (unsigned int, unsigned long,
--		   unsigned long, long long *, unsigned int);
- 
--#ifdef __NR__llseek
-+#ifdef SYS__llseek
- 
--static _syscall5(int,_llseek,unsigned int,fd,unsigned long,offset_high,
--		 unsigned long, offset_low,long long *,result,
--		 unsigned int, origin)
-+#define _llseek(fd, offset_high, offset_low, result, origin) \
-+    syscall(SYS__llseek, fd, offset_high, offset_low, result, origin)
- 
- #else
- 
--/* no __NR__llseek on compilation machine - might give it explicitly */
-+/* no SYS__llseek on compilation machine - might give it explicitly */
- static int _llseek (unsigned int fd, unsigned long oh,
- 		    unsigned long ol, long long *result,
- 		    unsigned int origin) {
-Index: util-linux-2.12r/fdisk/sfdisk.c
-===================================================================
---- util-linux-2.12r.orig/fdisk/sfdisk.c	2005-01-04 23:31:57.000000000 +0100
-+++ util-linux-2.12r/fdisk/sfdisk.c	2007-04-04 19:01:14.000000000 +0200
-@@ -48,7 +48,7 @@
- #include <sys/ioctl.h>
- #include <sys/stat.h>
- #include <sys/utsname.h>
--#include <linux/unistd.h>	/* _syscall */
-+#include <sys/syscall.h>
- #include "nls.h"
- #include "common.h"
- 
-@@ -177,9 +177,8 @@
- #endif
- 
- #ifndef use_lseek
--static __attribute__used
--_syscall5(int,  _llseek,  unsigned int,  fd, ulong, hi, ulong, lo,
--       loff_t *, res, unsigned int, wh);
-+#define _llseek(fd, hi, lo, res, wh) \
-+    syscall(SYS__llseek, fd, hi, lo, res, wh)
- #endif
- 
- static int
-Index: util-linux-2.12r/lib/my_reboot.c
-===================================================================
---- util-linux-2.12r.orig/lib/my_reboot.c	1999-07-09 04:56:36.000000000 +0200
-+++ util-linux-2.12r/lib/my_reboot.c	2007-04-04 19:01:14.000000000 +0200
-@@ -23,10 +23,11 @@
- #else /* no USE_LIBC */
- 
- /* direct syscall version */
--#include <linux/unistd.h>
-+#include <sys/syscall.h>
- 
--#ifdef _syscall3
--_syscall3(int,  reboot,  int,  magic, int, magic_too, int, cmd);
-+#ifdef SYS_reboot
-+#define reboot(magic, magic2, cmd) \
-+	syscall(SYS_reboot, magic, magic2, cmd)
- #else
- /* Let us hope we have a 3-argument reboot here */
- extern int reboot(int, int, int);
-Index: util-linux-2.12r/misc-utils/setterm.c
-===================================================================
---- util-linux-2.12r.orig/misc-utils/setterm.c	2003-10-17 18:17:51.000000000 +0200
-+++ util-linux-2.12r/misc-utils/setterm.c	2007-04-04 19:01:14.000000000 +0200
-@@ -119,14 +119,13 @@
- 
- #if __GNU_LIBRARY__ < 5
- #ifndef __alpha__
--# include <linux/unistd.h>
--#define __NR_klogctl __NR_syslog
--_syscall3(int, klogctl, int, type, char*, buf, int, len);
-+# include <sys/syscall.h>
-+#define klogctl(type, buf, len) \
-+	syscall(SYS_syslog, type, buf, len)
- #else /* __alpha__ */
- #define klogctl syslog
- #endif
- #endif
--extern int klogctl(int type, char *buf, int len);
- 
- /* Constants. */
- 
-Index: util-linux-2.12r/mount/swapon.c
-===================================================================
---- util-linux-2.12r.orig/mount/swapon.c	2004-12-22 10:50:19.000000000 +0100
-+++ util-linux-2.12r/mount/swapon.c	2007-04-04 19:01:14.000000000 +0200
-@@ -82,11 +82,11 @@
- #else
- /* We want a swapon with two args, but have an old libc.
-    Build the kernel call by hand. */
--#include <linux/unistd.h>
--static
--_syscall2(int,  swapon,  const char *,  path, int, flags);
--static
--_syscall1(int,  swapoff,  const char *,  path);
-+#include <sys/syscall.h>
-+#define swapon(path, flags) \
-+	syscall(SYS_swapon, path, flags)
-+#define swapoff(path) \
-+	syscall(SYS_swapoff, path)
- #endif
- #else
- /* just do as libc says */
-Index: util-linux-2.12r/mount/umount.c
-===================================================================
---- util-linux-2.12r.orig/mount/umount.c	2007-04-04 19:01:14.000000000 +0200
-+++ util-linux-2.12r/mount/umount.c	2007-04-04 19:02:22.000000000 +0200
-@@ -37,14 +37,13 @@
- #else /* MNT_FORCE */
- 
- /* Does the present kernel source know about umount2? */
--#include <linux/unistd.h>
--#ifdef __NR_umount2
-+#include <sys/syscall.h>
-+#ifdef SYS_umount2
- 
--int umount2(const char *path, int flags);
-+#define umount2(path, flags) \
-+	syscall(SYS_umount2, path, flags)
- 
--_syscall2(int, umount2, const char *, path, int, flags);
--
--#else /* __NR_umount2 */
-+#else /* SYS_umount2 */
- 
- static int
- umount2(const char *path, int flags) {
-@@ -52,7 +51,7 @@
- 	errno = ENOSYS;
- 	return -1;
- }
--#endif /* __NR_umount2 */
-+#endif /* SYS_umount2 */
- 
- #if !defined(MNT_FORCE)
- /* dare not try to include <linux/mount.h> -- lots of errors */
-Index: util-linux-2.12r/partx/partx.c
-===================================================================
---- util-linux-2.12r.orig/partx/partx.c	2004-08-23 22:13:27.000000000 +0200
-+++ util-linux-2.12r/partx/partx.c	2007-04-04 19:01:14.000000000 +0200
-@@ -338,10 +338,9 @@
- #endif
- 
- #ifdef NEED__llseek
--#include <linux/unistd.h>       /* _syscall */
--static
--_syscall5(int,  _llseek,  uint,  fd, ulong, hi, ulong, lo,
--	  long long *, res, uint, wh);
-+#include <sys/syscall.h>
-+#define _llseek(fd, hi, lo, res, wh) \
-+	syscall(SYS__llseek, fd, hi, lo, res, wh)
- #endif
- 
- static int
-Index: util-linux-2.12r/sys-utils/dmesg.c
-===================================================================
---- util-linux-2.12r.orig/sys-utils/dmesg.c	2004-05-04 18:38:12.000000000 +0200
-+++ util-linux-2.12r/sys-utils/dmesg.c	2007-04-04 19:01:14.000000000 +0200
-@@ -29,7 +29,7 @@
-  * Only function 3 is allowed to non-root processes.
-  */
- 
--#include <linux/unistd.h>
-+#include <sys/syscall.h>
- #include <stdio.h>
- #include <getopt.h>
- #include <stdlib.h>
-@@ -38,8 +38,8 @@
- #if __GNU_LIBRARY__ < 5
- 
- #ifndef __alpha__
--# define __NR_klogctl __NR_syslog
--  static inline _syscall3(int, klogctl, int, type, char *, b, int, len);
-+# define klogctl(type, b, len) \
-+	syscall(SYS_syslog, type, b, len)
- #else /* __alpha__ */
- #define klogctl syslog
- #endif
diff --git a/meta/recipes-core/util-linux/files/fdiskbsdlabel_thumb.diff b/meta/recipes-core/util-linux/files/fdiskbsdlabel_thumb.diff
deleted file mode 100644
index e6f82b5..0000000
--- a/meta/recipes-core/util-linux/files/fdiskbsdlabel_thumb.diff
+++ /dev/null
@@ -1,12 +0,0 @@
---- util-linux-2.12r/fdisk/fdiskbsdlabel.h.orig  2006-01-21 23:53:51.000000000 +0100
-+++ util-linux-2.12r/fdisk/fdiskbsdlabel.h       2006-01-21 23:54:35.000000000 +0100
-@@ -52,6 +52,9 @@
- #elif defined (__s390__) || defined (__s390x__)
- #define BSD_LABELSECTOR   1
- #define BSD_LABELOFFSET   0
-+#elif defined (__thumb__)
-+#define BSD_LABELSECTOR   1
-+#define BSD_LABELOFFSET   0
- #else
- #error unknown architecture
- #endif
diff --git a/meta/recipes-core/util-linux/files/fix-make-c.patch b/meta/recipes-core/util-linux/files/fix-make-c.patch
deleted file mode 100644
index bf1082e..0000000
--- a/meta/recipes-core/util-linux/files/fix-make-c.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From: Karel Zak <kzak@redhat.com>
-Date: Mon, 11 May 2009 09:49:00 +0000 (+0200)
-Subject: build-sys: fix "make -C" bug
-X-Git-Url: http://git.kernel.org/?p=utils%2Futil-linux-ng%2Futil-linux-ng.git;a=commitdiff_plain;h=2ef7d41e6bbb7c842c06e911ffc562335a467b5d
-
-build-sys: fix "make -C" bug
-
-Running:
-
-./configure --with-fsprobe=builtin
-make -C mount mount
-
-causes the following error:
-
-gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I..  -include ../config.h
--I../include -DLOCALEDIR=\"/home/matthew/util-linux-ng/share/locale\"
--fsigned-char -I../libs/blkid/src   -g -O2 -MT mount-setproctitle.o
--MD -MP -MF .deps/mount-setproctitle.Tpo -c -o mount-setproctitle.o
-`test -f '../lib/setproctitle.c' || echo './'`../lib/setproctitle.c mv
--f .deps/mount-setproctitle.Tpo .deps/mount-setproctitle.Po
-make -C
-make: option requires an argument -- 'C'
-Usage: make [options] [target] ...
-...
-
-Reported-by: Matthew Burgess <matthew@linuxfromscratch.org>
-Signed-off-by: Karel Zak <kzak@redhat.com>
----
-
-diff --git a/config/include-Makefile.am b/config/include-Makefile.am
-index b42a0c3..d5da619 100644
---- a/config/include-Makefile.am
-+++ b/config/include-Makefile.am
-@@ -17,6 +17,7 @@ dist_noinst_DATA = $(dist_man_MANS)
- # Paths to in-tree libraries (use ul_ prefix to avoid possible collisions)
- #
- ul_libblkid_srcdir = $(top_srcdir)/libs/blkid/src
-+ul_libblkid_builddir = $(top_builddir)/libs/blkid/src
- ul_libblkid_la = $(top_builddir)/libs/blkid/src/libblkid.la
- 
- $(ul_libblkid_la):
diff --git a/meta/recipes-core/util-linux/files/gcc34.patch b/meta/recipes-core/util-linux/files/gcc34.patch
deleted file mode 100644
index 8c4a20c..0000000
--- a/meta/recipes-core/util-linux/files/gcc34.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-
-#
-# Patch managed by http://www.holgerschurig.de/patcher.html
-#
-
---- util-linux-2.12o/disk-utils/fsck.cramfs.c~gcc34
-+++ util-linux-2.12o/disk-utils/fsck.cramfs.c
-@@ -77,15 +77,7 @@
- #define PAD_SIZE 512
- 
- #include <asm/page.h>
--#ifdef PAGE_SIZE
--#define PAGE_CACHE_SIZE ((int) PAGE_SIZE)
--#elif defined __ia64__
--#define PAGE_CACHE_SIZE (16384)
--#elif defined __alpha__
--#define PAGE_CACHE_SIZE (8192)
--#else
- #define PAGE_CACHE_SIZE (4096)
--#endif
- 
- /* Guarantee access to at least 8kB at a time */
- #define ROMBUFFER_BITS	13
diff --git a/meta/recipes-core/util-linux/files/glibc-fix.patch b/meta/recipes-core/util-linux/files/glibc-fix.patch
deleted file mode 100644
index 6d0c2fc..0000000
--- a/meta/recipes-core/util-linux/files/glibc-fix.patch
+++ /dev/null
@@ -1,22 +0,0 @@
---- /tmp/cmos.c	2006-11-21 11:38:55.000000000 +0100
-+++ util-linux-2.12r/hwclock/cmos.c	2006-11-21 11:41:45.458554000 +0100
-@@ -46,15 +46,16 @@
- 
- #include <unistd.h>		/* for geteuid() */
- #include <fcntl.h>		/* for O_RDWR */
-+#include <linux/version.h>
- #include <errno.h>
- #include "../defines.h"		/* for HAVE_sys_io_h */
- #include "nls.h"
- 
- #if defined(__i386__)
--#ifdef HAVE_sys_io_h
--#include <sys/io.h>
-+#if LINUX_VERSION_CODE < KERNEL_VERSION(2, 6, 0)
-+#include <asm/io.h>
- #else
--#include <asm/io.h>		/* for inb, outb */
-+#include <sys/io.h>		/* for inb, outb */
- #endif
- #elif defined(__alpha__)
- /* <asm/io.h> fails to compile, probably because of u8 etc */
diff --git a/meta/recipes-core/util-linux/files/optional-uuid.patch b/meta/recipes-core/util-linux/files/optional-uuid.patch
deleted file mode 100644
index 2d0ea43..0000000
--- a/meta/recipes-core/util-linux/files/optional-uuid.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From: Karel Zak <kzak@redhat.com>
-Date: Tue, 12 May 2009 19:22:19 +0000 (+0200)
-Subject: blkid: make libuuid optional
-X-Git-Url: http://git.kernel.org/?p=utils%2Futil-linux-ng%2Futil-linux-ng.git;a=commitdiff_plain;h=cdd17c7a73cab10a34bf80616225b8215ac4e2ed
-
-blkid: make libuuid optional
-
-read.c:28:23: error: uuid/uuid.h: No such file or directory
-make[3]: *** [read.lo] Error 1
-make[3]: *** Waiting for unfinished jobs....
-
-Reported-by: Olaf <mailinglists@ban-solms.de>
-Signed-off-by: Karel Zak <kzak@redhat.com>
----
-
-diff --git a/libs/blkid/src/config.c b/libs/blkid/src/config.c
-index 2e59218..9091736 100644
---- a/libs/blkid/src/config.c
-+++ b/libs/blkid/src/config.c
-@@ -24,9 +24,6 @@
- #include <errno.h>
- #endif
- #include <stdint.h>
--#ifdef HAVE_LIBUUID
--#include <uuid/uuid.h>
--#endif
- #include <stdarg.h>
- 
- #include "blkdev.h"
-diff --git a/libs/blkid/src/evaluate.c b/libs/blkid/src/evaluate.c
-index a9c9fba..f0ae126 100644
---- a/libs/blkid/src/evaluate.c
-+++ b/libs/blkid/src/evaluate.c
-@@ -27,9 +27,6 @@
- #include <errno.h>
- #endif
- #include <stdint.h>
--#ifdef HAVE_LIBUUID
--#include <uuid/uuid.h>
--#endif
- #include <stdarg.h>
- 
- #include "pathnames.h"
-diff --git a/libs/blkid/src/read.c b/libs/blkid/src/read.c
-index 4163874..b5e9cd0 100644
---- a/libs/blkid/src/read.c
-+++ b/libs/blkid/src/read.c
-@@ -25,7 +25,6 @@
- #endif
- 
- #include "blkidP.h"
--#include "uuid/uuid.h"
- 
- #ifdef HAVE_STRTOULL
- #define STRTOULL strtoull /* defined in stdlib.h if you try hard enough */
diff --git a/meta/recipes-core/util-linux/files/umount.diff b/meta/recipes-core/util-linux/files/umount.diff
deleted file mode 100644
index 7833078..0000000
--- a/meta/recipes-core/util-linux/files/umount.diff
+++ /dev/null
@@ -1,19 +0,0 @@
-*** util-linux-2.12r/mount/umount.c.orig	2005-09-10 20:07:38.000000000 +0200
---- util-linux-2.12r/mount/umount.c	2006-06-07 21:14:04.000000000 +0200
-***************
-*** 40,46 ****
-  #include <linux/unistd.h>
-  #ifdef __NR_umount2
-  
-! static int umount2(const char *path, int flags);
-  
-  _syscall2(int, umount2, const char *, path, int, flags);
-  
---- 40,46 ----
-  #include <linux/unistd.h>
-  #ifdef __NR_umount2
-  
-! int umount2(const char *path, int flags);
-  
-  _syscall2(int, umount2, const char *, path, int, flags);
-  
diff --git a/meta/recipes-core/util-linux/files/uuid.patch b/meta/recipes-core/util-linux/files/uuid.patch
deleted file mode 100644
index 3208e0a..0000000
--- a/meta/recipes-core/util-linux/files/uuid.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Index: util-linux-ng-2.15/libs/blkid/src/Makefile.am
-===================================================================
---- util-linux-ng-2.15.orig/libs/blkid/src/Makefile.am	2009-05-19 17:01:15.000000000 +0100
-+++ util-linux-ng-2.15/libs/blkid/src/Makefile.am	2009-05-19 17:08:11.000000000 +0100
-@@ -7,7 +7,7 @@
- common_ldadd =
- 
- if HAVE_UUID
--common_ldadd += -luuid	#TODO $(UUID_LIBS)
-+common_ldadd += -luuid
- endif
- 
- # includes
-@@ -26,7 +26,7 @@
- 		     $(top_srcdir)/lib/md5.c
- 
- libblkid_la_LIBADD = probers/libblkid_probers.la $(common_ldadd)
--libblkid_la_DEPENDENCIES = $(libblkid_la_LIBADD) blkid.sym
-+libblkid_la_DEPENDENCIES = probers/libblkid_probers.la blkid.sym
- 
- # TODO: for unknown reason "make distcheck" requires
- #       full path to the version script
-- 
1.7.4.1



