Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QOHl4-000058-LK
	for openembedded-core@lists.openembedded.org;
	Mon, 23 May 2011 01:08:53 +0200
Received: by pzk36 with SMTP id 36so2410977pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 May 2011 16:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=40nD7laGOKMIz2mepWzvy3pXqQz4rDs2KQ3Th9zYNVg=;
	b=xcDOOHVEx3auYvexeS9Qc+kx9cWZPq+3SjjGSnVpgeANdvo71BN+KtJ1gCa+OQw8/t
	NeznUMLhX3zHExBG0Zdj1R+pZiisQp03P2MEy/+HV6MOfrom4ZIj+apcBPZeruYhD+Zi
	eTyDmVt0R2dfyaloXF9yEMG210R+W1DoYwfLg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	b=NVlXzLd9rnprlVmhJ8XTobsyDUIehU71U0D3h70z6JWZy3TEGQIC/BtjyCGaa6tQ6E
	gFdTUmjSPhXRoU89xqlSd/6Q3rOLh/DTqKJ16pVYNLRkVV4s0RVK5FOU2IVKqPPirlVe
	8o9qeFzpATGd2jjyio9+d2tv00ecUIdVEzTO4=
Received: by 10.142.61.33 with SMTP id j33mr675826wfa.368.1306105517442;
	Sun, 22 May 2011 16:05:17 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 25sm5306755wfb.22.2011.05.22.16.05.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 22 May 2011 16:05:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Sun, 22 May 2011 16:04:52 -0700
Message-Id: <91500a68e2d7ef841608db4ff6b3b9c179c49d87.1306105366.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1306105366.git.raj.khem@gmail.com>
References: <cover.1306105366.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] uclibc: Upgrade to 0.9.32-rc3
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
X-List-Received-Date: Sun, 22 May 2011 23:08:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Bring in the uclibc recipes from meta-oe they have been well
tested by now.

Delete 0.9.30.1 recipes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../uclibc/files/armeb-kernel-stat.h.patch         |  125 -
 .../recipes-core/uclibc/files/errno_values.h.patch |   21 -
 .../uclibc/files/kernel-key-t-ipc.h.patch          |   27 -
 .../uclibc/files/nokernelheadercheck.patch         |   24 -
 meta/recipes-core/uclibc/files/termios.h.patch     |   22 -
 meta/recipes-core/uclibc/files/uClibc.distro       |    3 -
 meta/recipes-core/uclibc/site_config/funcs         |    1 +
 .../uclibc/{uclibc-0.9.30.1 => }/uClibc.distro     |   23 +-
 ...Use-__always_inline-instead-of-__inline__.patch |  393 --
 .../uclibc/uclibc-0.9.30.1/arm-linuxthreads.patch  |  218 -
 .../uclibc/uclibc-0.9.30.1/armv5te/uClibc.machine  |   70 -
 .../uclibc/uclibc-0.9.30.1/armv6/uClibc.machine    |   70 -
 .../uclibc/uclibc-0.9.30.1/armv7a/uClibc.machine   |   70 -
 .../uclibc/uclibc-0.9.30.1/gcc-4.4-fixlet.patch    |   31 -
 .../uclibc-0.9.30.1/linuxthreads-changes.patch     |  291 --
 .../uclibc/uclibc-0.9.30.1/pthread_atfork.patch    |   42 -
 .../uclibc/uclibc-0.9.30.1/uClibc.machine.armv4t   |   69 -
 .../uclibc/uclibc-0.9.30.1/uClibc.machine.armv5te  |   70 -
 .../uclibc-0.9.30.1/uClibc.machine.strongarm       |   70 -
 .../uclibc-0.9.30.1/uclibc-c99-ldbl-math.patch     |  474 --
 .../uclibc-0.9.30.1/uclibc_ldso_use_O0.patch       |   13 -
 meta/recipes-core/uclibc/uclibc-config.inc         |  116 +
 .../uclibc/uclibc-git/argp-headers.patch           |  581 +++
 .../uclibc/uclibc-git/argp-support.patch           | 5189 ++++++++++++++++++++
 .../arm/uClibc.machine                             |    4 +-
 .../armeb/uClibc.machine}                          |   35 +-
 .../iwmmxt => uclibc-git/armv5te}/uClibc.machine   |   14 +-
 .../uclibc/uclibc-git/detect-bx-availibility.patch |   75 +
 .../uclibc/uclibc-git/efika/uClibc.machine         |   45 +
 .../x86 => uclibc-git/i386}/uClibc.machine         |   27 +-
 .../qemumips => uclibc-git/i486}/uClibc.machine    |   14 +-
 .../qemux86 => uclibc-git/i586}/uClibc.machine     |   14 +-
 .../qemumips => uclibc-git/i686}/uClibc.machine    |   25 +-
 .../uclibc/uclibc-git/include-arm-asm.h.patch      |   65 +
 ...so_use_arm_dl_linux_resolve_in_thumb_mode.patch |    0
 .../qemux86 => uclibc-git/mips64}/uClibc.machine   |   49 +-
 .../armv4t => uclibc-git/mipsel}/uClibc.machine    |   46 +-
 .../armeb => uclibc-git/nslu2be}/uClibc.machine    |    5 +-
 .../uclibc/uclibc-git/powerpc/uClibc.machine       |   46 +
 .../uclibc/uclibc-git/powerpc_copysignl.patch      |  107 +
 .../qemuarm/uClibc.machine                         |   12 +-
 .../qemux86 => uclibc-git/qemumips}/uClibc.machine |   49 +-
 .../qemumips => uclibc-git/qemux86}/uClibc.machine |   25 +-
 .../uclibc-git/remove-eabi-oabi-selection.patch    |   91 +
 .../uclibc-git/remove-sub-arch-variants.patch      |  215 +
 .../uclibc-git/remove_attribute_optimize_Os.patch  |  186 +
 .../uclibc/uclibc-git/reorder-use-BX.patch         |   72 +
 .../uclibc/uclibc-git/select-force-thumb.patch     |  172 +
 .../qemumips => uclibc-git/sh4}/uClibc.machine     |   50 +-
 .../uclibc-git/transform-eabi-oabi-choice.patch    |   71 +
 .../{uclibc-0.9.30.1 => uclibc-git}/uClibc.config  |    0
 .../{uclibc-0.9.30.1 => uclibc-git}/uClibc.distro  |   26 +-
 .../uclibc/uclibc-git/uclibc-arm-ftruncate64.patch |   13 +
 .../uclibc-git/uclibc_enable_log2_test.patch       |   30 +
 .../qemumips => uclibc-git/x86_64}/uClibc.machine  |   44 +-
 .../recipes-core/uclibc/uclibc-initial_0.9.30.1.bb |   31 -
 meta/recipes-core/uclibc/uclibc-initial_git.bb     |   39 +
 meta/recipes-core/uclibc/uclibc.inc                |  284 +-
 meta/recipes-core/uclibc/uclibc_0.9.30.1.bb        |   33 -
 meta/recipes-core/uclibc/uclibc_git.bb             |   31 +
 60 files changed, 7487 insertions(+), 2571 deletions(-)
 delete mode 100644 meta/recipes-core/uclibc/files/armeb-kernel-stat.h.patch
 delete mode 100644 meta/recipes-core/uclibc/files/errno_values.h.patch
 delete mode 100644 meta/recipes-core/uclibc/files/kernel-key-t-ipc.h.patch
 delete mode 100644 meta/recipes-core/uclibc/files/nokernelheadercheck.patch
 delete mode 100644 meta/recipes-core/uclibc/files/termios.h.patch
 delete mode 100644 meta/recipes-core/uclibc/files/uClibc.distro
 copy meta/recipes-core/uclibc/{uclibc-0.9.30.1 => }/uClibc.distro (89%)
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.30.1/Use-__always_inline-instead-of-__inline__.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.30.1/arm-linuxthreads.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.30.1/armv5te/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.30.1/armv6/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.30.1/armv7a/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.30.1/gcc-4.4-fixlet.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.30.1/linuxthreads-changes.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.30.1/pthread_atfork.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.30.1/uClibc.machine.armv4t
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.30.1/uClibc.machine.armv5te
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.30.1/uClibc.machine.strongarm
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.30.1/uclibc-c99-ldbl-math.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.30.1/uclibc_ldso_use_O0.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-config.inc
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/argp-headers.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/argp-support.patch
 rename meta/recipes-core/uclibc/{uclibc-0.9.30.1 => uclibc-git}/arm/uClibc.machine (96%)
 rename meta/recipes-core/uclibc/{uclibc-0.9.30.1/uClibc.machine.iwmmxt => uclibc-git/armeb/uClibc.machine} (65%)
 rename meta/recipes-core/uclibc/{uclibc-0.9.30.1/iwmmxt => uclibc-git/armv5te}/uClibc.machine (84%)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/detect-bx-availibility.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/efika/uClibc.machine
 rename meta/recipes-core/uclibc/{uclibc-0.9.30.1/x86 => uclibc-git/i386}/uClibc.machine (77%)
 copy meta/recipes-core/uclibc/{uclibc-0.9.30.1/qemumips => uclibc-git/i486}/uClibc.machine (89%)
 copy meta/recipes-core/uclibc/{uclibc-0.9.30.1/qemux86 => uclibc-git/i586}/uClibc.machine (88%)
 copy meta/recipes-core/uclibc/{uclibc-0.9.30.1/qemumips => uclibc-git/i686}/uClibc.machine (82%)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/include-arm-asm.h.patch
 rename meta/recipes-core/uclibc/{uclibc-0.9.30.1 => uclibc-git}/ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch (100%)
 copy meta/recipes-core/uclibc/{uclibc-0.9.30.1/qemux86 => uclibc-git/mips64}/uClibc.machine (57%)
 rename meta/recipes-core/uclibc/{uclibc-0.9.30.1/armv4t => uclibc-git/mipsel}/uClibc.machine (56%)
 rename meta/recipes-core/uclibc/{uclibc-0.9.30.1/armeb => uclibc-git/nslu2be}/uClibc.machine (92%)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/powerpc/uClibc.machine
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/powerpc_copysignl.patch
 rename meta/recipes-core/uclibc/{uclibc-0.9.30.1 => uclibc-git}/qemuarm/uClibc.machine (85%)
 rename meta/recipes-core/uclibc/{uclibc-0.9.30.1/qemux86 => uclibc-git/qemumips}/uClibc.machine (57%)
 copy meta/recipes-core/uclibc/{uclibc-0.9.30.1/qemumips => uclibc-git/qemux86}/uClibc.machine (82%)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/remove-eabi-oabi-selection.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/remove-sub-arch-variants.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/remove_attribute_optimize_Os.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/reorder-use-BX.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/select-force-thumb.patch
 copy meta/recipes-core/uclibc/{uclibc-0.9.30.1/qemumips => uclibc-git/sh4}/uClibc.machine (50%)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/transform-eabi-oabi-choice.patch
 rename meta/recipes-core/uclibc/{uclibc-0.9.30.1 => uclibc-git}/uClibc.config (100%)
 rename meta/recipes-core/uclibc/{uclibc-0.9.30.1 => uclibc-git}/uClibc.distro (88%)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/uclibc-arm-ftruncate64.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/uclibc_enable_log2_test.patch
 rename meta/recipes-core/uclibc/{uclibc-0.9.30.1/qemumips => uclibc-git/x86_64}/uClibc.machine (50%)
 delete mode 100644 meta/recipes-core/uclibc/uclibc-initial_0.9.30.1.bb
 create mode 100644 meta/recipes-core/uclibc/uclibc-initial_git.bb
 delete mode 100644 meta/recipes-core/uclibc/uclibc_0.9.30.1.bb
 create mode 100644 meta/recipes-core/uclibc/uclibc_git.bb

diff --git a/meta/recipes-core/uclibc/files/armeb-kernel-stat.h.patch b/meta/recipes-core/uclibc/files/armeb-kernel-stat.h.patch
deleted file mode 100644
index 0440718..0000000
--- a/meta/recipes-core/uclibc/files/armeb-kernel-stat.h.patch
+++ /dev/null
@@ -1,125 +0,0 @@
-# The 2.6 asm/stat.h for ARM has some rather unusual transmogrifications
-# for big-endian running.  This patch adds ARM specific code in xstatconv.c
-# which deals with the 2.4->2.6 ABI change.
---- uClibc-0.9.27/libc/sysdeps/linux/common/xstatconv.c	2005-01-11 23:59:21.000000000 -0800
-+++ uClibc-0.9.27/libc/sysdeps/linux/common/xstatconv.c	2005-06-05 11:03:56.742587966 -0700
-@@ -18,7 +18,14 @@
-    02111-1307 USA. 
-    
-    Modified for uClibc by Erik Andersen <andersen@codepoet.org>
-+   Further modified for ARMBE by John Bowler <jbowler@acm.org>
-    */
-+/* This is a copy of common/xstatconv.c with a fixup for the ABI
-+ * (structure layout) change in ARM Linux 2.6 - this shifts the
-+ * st_dev and st_rdev information from the start of the 8 byte
-+ * space to the end on big-endian ARM (only).  The code is unchanged
-+ * on little endian.
-+ */
- 
- #define _GNU_SOURCE
- #define _LARGEFILE64_SOURCE
-@@ -32,6 +39,84 @@
- #include <sys/stat.h>
- #include "xstatconv.h"
- 
-+/* Only for ARMEB and LFS. */
-+#if defined(__ARMEB__) && defined(__UCLIBC_HAS_LFS__)
-+/* stat64 (renamed) from 2.6.11.11.  What happened here is that after
-+ * Linux 2.4 the 2.4 unsigned short st_rdev and st_dev fields were
-+ * lengthened to unsigned long long - causing the inclusion of at least
-+ * some of the 0 padding bytes which followed them.  On little endian
-+ * this is fine because 2.4 did zero the pad bytes (I think) and the
-+ * position of the data did not change.  On big endian the change
-+ * shifted the data to the end of the field.  Someone noticed for the
-+ * struct stat, and the armeb (big endian) case preserved the
-+ * unsigned short (yuck), but no so for stat64 (maybe this was deliberate,
-+ * but there is no evidence in the code of this.)  Consequently a
-+ * fixup is necessary for the stat64 case.  The fixup here is to
-+ * use the new structure when the change is detected.  See below.
-+ */
-+struct __kernel_stat64_armeb {
-+	/* This definition changes the layout on big-endian from that
-+	 * used in 2.4.31 - ABI change!  Likewise for st_rdev.
-+	 */
-+	unsigned long long	st_dev;
-+	unsigned char   __pad0[4];
-+	unsigned long	__st_ino;
-+	unsigned int	st_mode;
-+	unsigned int	st_nlink;
-+	unsigned long	st_uid;
-+	unsigned long	st_gid;
-+	unsigned long long	st_rdev;
-+	unsigned char   __pad3[4];
-+	long long	st_size;
-+	unsigned long	st_blksize;
-+	unsigned long   __pad4;
-+	unsigned long   st_blocks;
-+	unsigned long	st_atime;
-+	unsigned long	st_atime_nsec;
-+	unsigned long	st_mtime;
-+	unsigned long	st_mtime_nsec;
-+	unsigned long	st_ctime;
-+	unsigned long	st_ctime_nsec;
-+	unsigned long long	st_ino;
-+};
-+
-+/* This fixup only works so long as the old struct stat64 is no
-+ * smaller than the new one - the caller of xstatconv uses the
-+ * *old* struct, but the kernel writes the new one.  CASSERT
-+ * detects this at compile time.
-+ */
-+#define CASSERT(c) do switch (0) { case 0:; case (c):; } while (0)
-+
-+void __xstat64_conv_new(struct __kernel_stat64_armeb *kbuf, struct stat64 *buf)
-+{
-+    CASSERT(sizeof *kbuf <= sizeof (struct kernel_stat64));
-+
-+    /* Convert from new kernel version of `struct stat64'.  */
-+    buf->st_dev = kbuf->st_dev;
-+    buf->st_ino = kbuf->st_ino;
-+#ifdef _HAVE_STAT64___ST_INO
-+    buf->__st_ino = kbuf->__st_ino;
-+#endif
-+    buf->st_mode = kbuf->st_mode;
-+    buf->st_nlink = kbuf->st_nlink;
-+    buf->st_uid = kbuf->st_uid;
-+    buf->st_gid = kbuf->st_gid;
-+    buf->st_rdev = kbuf->st_rdev;
-+    buf->st_size = kbuf->st_size;
-+    buf->st_blksize = kbuf->st_blksize;
-+    buf->st_blocks = kbuf->st_blocks;
-+    buf->st_atime = kbuf->st_atime;
-+    buf->st_mtime = kbuf->st_mtime;
-+    buf->st_ctime = kbuf->st_ctime;
-+}
-+#define _MAY_HAVE_NEW_STAT64 1
-+#else
-+#define _MAY_HAVE_NEW_STAT64 0
-+#endif
-+
-+/* The following is taken verbatim from xstatconv.c apart from
-+ * the addition of the _MAY_HAVE_NEW_STAT64 code.
-+ */
- void __xstat_conv(struct kernel_stat *kbuf, struct stat *buf)
- {
-     /* Convert to current kernel version of `struct stat'.  */
-@@ -53,6 +138,19 @@
- #if defined __UCLIBC_HAS_LFS__
- void __xstat64_conv(struct kernel_stat64 *kbuf, struct stat64 *buf)
- {
-+#   if _MAY_HAVE_NEW_STAT64
-+    	/* This relies on any device (0,0) not being mountable - i.e.
-+	 * it fails on Linux 2.4 if dev(0,0) is a mountable block file
-+	 * system and itself contains it's own device.  That doesn't
-+	 * happen on Linux 2.4 so far as I can see, but even if it
-+	 * does the API only fails (even then) if 2.4 didn't set all
-+	 * of the pad bytes to 0 (and it does set them to zero.)
-+	 */
-+	if (kbuf->st_dev == 0 && kbuf->st_rdev == 0) {
-+	    __xstat64_conv_new((struct __kernel_stat64_armeb*)kbuf, buf);
-+	    return;
-+	}
-+#   endif
-     /* Convert to current kernel version of `struct stat64'.  */
-     buf->st_dev = kbuf->st_dev;
-     buf->st_ino = kbuf->st_ino;
diff --git a/meta/recipes-core/uclibc/files/errno_values.h.patch b/meta/recipes-core/uclibc/files/errno_values.h.patch
deleted file mode 100644
index a1e39c1..0000000
--- a/meta/recipes-core/uclibc/files/errno_values.h.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Index: uClibc-0.9.29/libc/sysdeps/linux/common/bits/errno_values.h
-===================================================================
---- uClibc-0.9.29/libc/sysdeps/linux/common/bits/errno_values.h	2002-08-23 20:48:19.000000000 +0200
-+++ uClibc-0.9.29/libc/sysdeps/linux/common/bits/errno_values.h	2007-07-01 22:11:53.000000000 +0200
-@@ -134,4 +134,16 @@
- #define	ENOMEDIUM	123	/* No medium found */
- #define	EMEDIUMTYPE	124	/* Wrong medium type */
- 
-+/* the following errornumbers are only in 2.6 */
-+
-+#define ECANCELED       125     /* Operation Canceled */
-+#define ENOKEY          126     /* Required key not available */
-+#define EKEYEXPIRED     127     /* Key has expired */
-+#define EKEYREVOKED     128     /* Key has been revoked */
-+#define EKEYREJECTED    129     /* Key was rejected by service */
-+
-+/* for robust mutexes */
-+#define EOWNERDEAD      130     /* Owner died */
-+#define ENOTRECOVERABLE 131     /* State not recoverable */
-+
- #endif /* _BITS_ERRNO_VALUES_H */
diff --git a/meta/recipes-core/uclibc/files/kernel-key-t-ipc.h.patch b/meta/recipes-core/uclibc/files/kernel-key-t-ipc.h.patch
deleted file mode 100644
index 4cc4530..0000000
--- a/meta/recipes-core/uclibc/files/kernel-key-t-ipc.h.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-# include/linux/posix_types.h defines __kernel_key_t as int, this file
-# contains an identical definition.  This results in a compiler error
-# if both files are included.  The ipc.h file, however, also includes
-# bits/types.h, which typedefs __key_t to (int), therefore it must
-# be safe to use __key_t in place of __kernel_key_t (given that C
-# regards equivalent numeric typedefs as identical.)
---- uClibc-0.9.27/libc/sysdeps/linux/common/bits/ipc.h.orig	2005-05-07 13:36:04.448332211 -0700
-+++ uClibc-0.9.27/libc/sysdeps/linux/common/bits/ipc.h	2005-05-07 13:37:00.493885708 -0700
-@@ -35,9 +35,6 @@
- # define IPC_INFO	3		/* See ipcs.  */
- #endif
- 
--/* Type of a SYSV IPC key.  */
--typedef int __kernel_key_t;
--
- /* Special key values.  */
- #define IPC_PRIVATE	((__key_t) 0)	/* Private key.  */
- 
-@@ -45,7 +42,7 @@
- /* Data structure used to pass permission information to IPC operations.  */
- struct ipc_perm
- {
--    __kernel_key_t	__key;
-+    __key_t		__key;
-     __kernel_uid_t	uid;
-     __kernel_gid_t	gid;
-     __kernel_uid_t	cuid;
diff --git a/meta/recipes-core/uclibc/files/nokernelheadercheck.patch b/meta/recipes-core/uclibc/files/nokernelheadercheck.patch
deleted file mode 100644
index 9f09fb2..0000000
--- a/meta/recipes-core/uclibc/files/nokernelheadercheck.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-
-#
-# Patch managed by http://www.holgerschurig.de/patcher.html
-#
-
---- uClibc/Makefile~nokernelheadercheck
-+++ uClibc/Makefile
-@@ -121,11 +121,11 @@
- 	@./extra/config/conf -o extra/Configs/Config.in
- 
- headers: include/bits/uClibc_config.h
--ifeq ($(strip $(ARCH_HAS_MMU)),y)
--	@set -x; ./extra/scripts/fix_includes.sh -k $(KERNEL_SOURCE) -t $(TARGET_ARCH)
--else
--	@set -x; ./extra/scripts/fix_includes.sh -k $(KERNEL_SOURCE) -t $(TARGET_ARCH) -n
--endif
-+#ifeq ($(strip $(ARCH_HAS_MMU)),y)
-+#	@set -x; ./extra/scripts/fix_includes.sh -k $(KERNEL_SOURCE) -t $(TARGET_ARCH)
-+#else
-+#	@set -x; ./extra/scripts/fix_includes.sh -k $(KERNEL_SOURCE) -t $(TARGET_ARCH) -n
-+#endif
- 	@cd include/bits; \
- 	set -e; \
- 	for i in `ls ../../libc/sysdeps/linux/common/bits/*.h` ; do \
diff --git a/meta/recipes-core/uclibc/files/termios.h.patch b/meta/recipes-core/uclibc/files/termios.h.patch
deleted file mode 100644
index f7200ba..0000000
--- a/meta/recipes-core/uclibc/files/termios.h.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Index: uClibc-0.9.29/libc/sysdeps/linux/common/bits/termios.h
-===================================================================
---- uClibc-0.9.29.orig/libc/sysdeps/linux/common/bits/termios.h	2006-02-13 09:41:37.000000000 +0100
-+++ uClibc-0.9.29/libc/sysdeps/linux/common/bits/termios.h	2007-07-03 00:41:27.000000000 +0200
-@@ -156,7 +156,6 @@
- #endif
- #define  B57600   0010001
- #define  B115200  0010002
--#if 0 /* limited on uClibc, keep in sync w/ cfsetspeed.c */
- #define  B230400  0010003
- #define  B460800  0010004
- #define  B500000  0010005
-@@ -171,9 +170,6 @@
- #define  B3500000 0010016
- #define  B4000000 0010017
- #define __MAX_BAUD B4000000
--#else
--#define __MAX_BAUD B115200
--#endif
- #ifdef __USE_MISC
- # define CIBAUD	  002003600000		/* input baud rate (not used) */
- # define CMSPAR   010000000000		/* mark or space (stick) parity */
diff --git a/meta/recipes-core/uclibc/files/uClibc.distro b/meta/recipes-core/uclibc/files/uClibc.distro
deleted file mode 100644
index d87b891..0000000
--- a/meta/recipes-core/uclibc/files/uClibc.distro
+++ /dev/null
@@ -1,3 +0,0 @@
-# Default per-distro config
-# DO NOT CHANGE THIS
-# Create a new file ${DISTRO}/uClibc.distro
diff --git a/meta/recipes-core/uclibc/site_config/funcs b/meta/recipes-core/uclibc/site_config/funcs
index 79a3c19..ccc8539 100644
--- a/meta/recipes-core/uclibc/site_config/funcs
+++ b/meta/recipes-core/uclibc/site_config/funcs
@@ -121,6 +121,7 @@ gethostid
 gethostname
 getifaddrs
 getline
+getloadavg
 getmntent
 getmsg
 getnameinfo
diff --git a/meta/recipes-core/uclibc/uclibc-0.9.30.1/uClibc.distro b/meta/recipes-core/uclibc/uClibc.distro
similarity index 89%
copy from meta/recipes-core/uclibc/uclibc-0.9.30.1/uClibc.distro
copy to meta/recipes-core/uclibc/uClibc.distro
index 042ea4c..e25324d 100644
--- a/meta/recipes-core/uclibc/uclibc-0.9.30.1/uClibc.distro
+++ b/meta/recipes-core/uclibc/uClibc.distro
@@ -17,8 +17,9 @@ UCLIBC_CTOR_DTOR=y
 LDSO_GNU_HASH_SUPPORT=y
 # HAS_NO_THREADS is not set
 UCLIBC_HAS_THREADS=y
+UCLIBC_HAS_THREADS_NATIVE=y
 PTHREADS_DEBUG_SUPPORT=y
-LINUXTHREADS_OLD=y
+# LINUXTHREADS_OLD is not set
 UCLIBC_HAS_LFS=y
 # MALLOC is not set
 # MALLOC_SIMPLE is not set
@@ -28,12 +29,13 @@ UCLIBC_DYNAMIC_ATEXIT=y
 COMPAT_ATEXIT=y
 UCLIBC_SUSV3_LEGACY=y
 UCLIBC_SUSV3_LEGACY_MACROS=y
+UCLIBC_SUSV4_LEGACY=y
 UCLIBC_HAS_SHADOW=y
 UCLIBC_HAS_PROGRAM_INVOCATION_NAME=y
 UCLIBC_HAS___PROGNAME=y
 UNIX98PTY_ONLY=y
-UCLIBC_HAS_GETPT=y
 ASSUME_DEVPTS=y
+UCLIBC_HAS_LIBUTIL=y
 UCLIBC_HAS_TM_EXTENSIONS=y
 UCLIBC_HAS_TZ_CACHING=y
 UCLIBC_HAS_TZ_FILE=y
@@ -53,8 +55,12 @@ UCLIBC_HAS_IPV6=y
 UCLIBC_HAS_RPC=y
 UCLIBC_HAS_FULL_RPC=y
 # UCLIBC_HAS_REENTRANT_RPC is not set
-# UCLIBC_USE_NETLINK is not set
-# UCLIBC_HAS_BSD_RES_CLOSE is not set
+UCLIBC_USE_NETLINK=y
+UCLIBC_SUPPORT_AI_ADDRCONFIG=y
+
+UCLIBC_HAS_BSD_RES_CLOSE=y
+UCLIBC_HAS_LIBRESOLV_STUB=y
+UCLIBC_HAS_LIBNSL_STUB=y
 
 #
 # String and Stdio Support
@@ -83,8 +89,8 @@ UCLIBC_HAS_STDIO_BUILTIN_BUFFER_NONE=y
 # UCLIBC_HAS_STDIO_BUILTIN_BUFFER_4 is not set
 # UCLIBC_HAS_STDIO_BUILTIN_BUFFER_8 is not set
 # UCLIBC_HAS_STDIO_SHUTDOWN_ON_ABORT is not set
-# UCLIBC_HAS_STDIO_GETC_MACRO is not set
-# UCLIBC_HAS_STDIO_PUTC_MACRO is not set
+UCLIBC_HAS_STDIO_GETC_MACRO=y
+UCLIBC_HAS_STDIO_PUTC_MACRO=y
 UCLIBC_HAS_STDIO_AUTO_RW_TRANSITION=y
 # UCLIBC_HAS_FOPEN_LARGEFILE_MODE is not set
 UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE=y
@@ -105,7 +111,9 @@ UCLIBC_HAS_REGEX=y
 UCLIBC_HAS_FNMATCH=y
 # UCLIBC_HAS_FNMATCH_OLD is not set
 UCLIBC_HAS_WORDEXP=y
+UCLIBC_HAS_NFTW=y
 UCLIBC_HAS_FTW=y
+UCLIBC_HAS_FTS=y
 UCLIBC_HAS_GLOB=y
 UCLIBC_HAS_GNU_GLOB=y
 
@@ -134,7 +142,7 @@ CROSS_COMPILER_PREFIX=""
 UCLIBC_EXTRA_CFLAGS=""
 # DODEBUG is not set
 # DODEBUG_PT is not set
-DOSTRIP=n
+# DOSTRIP is not set
 # DOASSERTS is not set
 # SUPPORT_LD_DEBUG is not set
 # SUPPORT_LD_DEBUG_EARLY is not set
@@ -146,3 +154,4 @@ WARNINGS="-Wall"
 
 # math stuff for perl
 DO_C99_MATH=y
+UCLIBC_HAS_LONG_DOUBLE_MATH=y
diff --git a/meta/recipes-core/uclibc/uclibc-0.9.30.1/Use-__always_inline-instead-of-__inline__.patch b/meta/recipes-core/uclibc/uclibc-0.9.30.1/Use-__always_inline-instead-of-__inline__.patch
deleted file mode 100644
index a9c7a4f..0000000
--- a/meta/recipes-core/uclibc/uclibc-0.9.30.1/Use-__always_inline-instead-of-__inline__.patch
+++ /dev/null
@@ -1,393 +0,0 @@
-From c190f738e1b0e87658ea5f86c057fb147dc19428 Mon Sep 17 00:00:00 2001
-From: Carmelo Amoroso <carmelo.amoroso@st.com>
-Date: Thu, 5 Mar 2009 13:28:55 +0000
-Subject: [PATCH] Use __always_inline instead of __inline__
-
----
- ldso/ldso/arm/dl-sysdep.h     |    8 ++++----
- ldso/ldso/bfin/dl-sysdep.h    |    2 +-
- ldso/ldso/cris/dl-sysdep.h    |    6 +++---
- ldso/ldso/i386/dl-sysdep.h    |   10 +++++-----
- ldso/ldso/m68k/dl-sysdep.h    |    6 +++---
- ldso/ldso/mips/dl-sysdep.h    |    8 ++++----
- ldso/ldso/powerpc/dl-sysdep.h |    8 ++++----
- ldso/ldso/sh/dl-sysdep.h      |    8 ++++----
- ldso/ldso/sh64/dl-sysdep.h    |    6 +++---
- ldso/ldso/sparc/dl-sysdep.h   |    8 ++++----
- ldso/ldso/xtensa/dl-sysdep.h  |    6 +++---
- 11 files changed, 38 insertions(+), 38 deletions(-)
-
-diff --git a/ldso/ldso/arm/dl-sysdep.h b/ldso/ldso/arm/dl-sysdep.h
-index eea3b98..5191dd7 100644
---- a/ldso/ldso/arm/dl-sysdep.h
-+++ b/ldso/ldso/arm/dl-sysdep.h
-@@ -15,7 +15,7 @@
-   GOT_BASE[1] = (unsigned long) MODULE; \
- }
- 
--static __inline__ unsigned long arm_modulus(unsigned long m, unsigned long p)
-+static __always_inline unsigned long arm_modulus(unsigned long m, unsigned long p)
- {
- 	unsigned long i,t,inc;
- 	i=p; t=0;
-@@ -67,7 +67,7 @@ unsigned long _dl_linux_resolver(struct elf_resolve * tpnt, int reloc_entry);
-    first element of the GOT.  We used to use the PIC register to do this
-    without a constant pool reference, but GCC 4.2 will use a pseudo-register
-    for the PIC base, so it may not be in r10.  */
--static __inline__ Elf32_Addr __attribute__ ((unused))
-+static __always_inline Elf32_Addr __attribute__ ((unused))
- elf_machine_dynamic (void)
- {
-   Elf32_Addr dynamic;
-@@ -99,7 +99,7 @@ elf_machine_dynamic (void)
- }
- 
- /* Return the run-time load address of the shared object.  */
--static __inline__ Elf32_Addr __attribute__ ((unused))
-+static __always_inline Elf32_Addr __attribute__ ((unused))
- elf_machine_load_address (void)
- {
- 	extern void __dl_start __asm__ ("_dl_start");
-@@ -123,7 +123,7 @@ elf_machine_load_address (void)
- 	return pcrel_addr - got_addr;
- }
- 
--static __inline__ void
-+static __always_inline void
- elf_machine_relative (Elf32_Addr load_off, const Elf32_Addr rel_addr,
- 		      Elf32_Word relative_count)
- {
-diff --git a/ldso/ldso/bfin/dl-sysdep.h b/ldso/ldso/bfin/dl-sysdep.h
-index 3c88da4..f0c5129 100644
---- a/ldso/ldso/bfin/dl-sysdep.h
-+++ b/ldso/ldso/bfin/dl-sysdep.h
-@@ -210,7 +210,7 @@ while (0)
- #endif
- 
- #include <elf.h>
--static __inline__ void
-+static __always_inline void
- elf_machine_relative (DL_LOADADDR_TYPE load_off, const Elf32_Addr rel_addr,
- 		      Elf32_Word relative_count)
- {
-diff --git a/ldso/ldso/cris/dl-sysdep.h b/ldso/ldso/cris/dl-sysdep.h
-index ffb763a..e454c10 100644
---- a/ldso/ldso/cris/dl-sysdep.h
-+++ b/ldso/ldso/cris/dl-sysdep.h
-@@ -37,7 +37,7 @@ extern unsigned long _dl_linux_resolver(struct elf_resolve *tpnt, int reloc_entr
-      || ((type) == R_CRIS_GLOB_DAT)) * ELF_RTYPE_CLASS_PLT)	\
-    | (((type) == R_CRIS_COPY) * ELF_RTYPE_CLASS_COPY))
- 
--static __inline__ Elf32_Addr
-+static __always_inline Elf32_Addr
- elf_machine_dynamic(void)
- {
- 	/* Don't just set this to an asm variable "r0" since that's not logical
-@@ -59,7 +59,7 @@ elf_machine_dynamic(void)
-    there's some other symbol we could use, that we don't *have* to force a
-    GOT entry for.  */
- 
--static __inline__ Elf32_Addr
-+static __always_inline Elf32_Addr
- elf_machine_load_address(void)
- {
- 	Elf32_Addr gotaddr_diff;
-@@ -93,7 +93,7 @@ elf_machine_load_address(void)
- 	return gotaddr_diff;
- }
- 
--static __inline__ void
-+static __always_inline void
- elf_machine_relative(Elf32_Addr load_off, const Elf32_Addr rel_addr,
-                      Elf32_Word relative_count)
- {
-diff --git a/ldso/ldso/i386/dl-sysdep.h b/ldso/ldso/i386/dl-sysdep.h
-index 77fa372..6e84861 100644
---- a/ldso/ldso/i386/dl-sysdep.h
-+++ b/ldso/ldso/i386/dl-sysdep.h
-@@ -37,8 +37,8 @@ extern unsigned long _dl_linux_resolver(struct elf_resolve * tpnt, int reloc_ent
- /* Return the link-time address of _DYNAMIC.  Conveniently, this is the
-    first element of the GOT.  This must be inlined in a function which
-    uses global data.  */
--static __inline__ Elf32_Addr elf_machine_dynamic (void) attribute_unused;
--static __inline__ Elf32_Addr
-+static __always_inline Elf32_Addr elf_machine_dynamic (void) attribute_unused;
-+static __always_inline Elf32_Addr
- elf_machine_dynamic (void)
- {
- 	register Elf32_Addr *got __asm__ ("%ebx");
-@@ -47,8 +47,8 @@ elf_machine_dynamic (void)
- 
- 
- /* Return the run-time load address of the shared object.  */
--static __inline__ Elf32_Addr elf_machine_load_address (void) attribute_unused;
--static __inline__ Elf32_Addr
-+static __always_inline Elf32_Addr elf_machine_load_address (void) attribute_unused;
-+static __always_inline Elf32_Addr
- elf_machine_load_address (void)
- {
- 	/* It doesn't matter what variable this is, the reference never makes
-@@ -61,7 +61,7 @@ elf_machine_load_address (void)
- 	return addr;
- }
- 
--static __inline__ void
-+static __always_inline void
- elf_machine_relative (Elf32_Addr load_off, const Elf32_Addr rel_addr,
- 		      Elf32_Word relative_count)
- {
-diff --git a/ldso/ldso/m68k/dl-sysdep.h b/ldso/ldso/m68k/dl-sysdep.h
-index 8e26e20..259cb84 100644
---- a/ldso/ldso/m68k/dl-sysdep.h
-+++ b/ldso/ldso/m68k/dl-sysdep.h
-@@ -39,7 +39,7 @@ extern unsigned long _dl_linux_resolver (struct elf_resolve *, int);
- /* Return the link-time address of _DYNAMIC.  Conveniently, this is the
-    first element of the GOT.  This must be inlined in a function which
-    uses global data.  */
--static __inline__ Elf32_Addr
-+static __always_inline Elf32_Addr
- elf_machine_dynamic (void)
- {
- 	register Elf32_Addr *got __asm__ ("%a5");
-@@ -48,7 +48,7 @@ elf_machine_dynamic (void)
- 
- 
- /* Return the run-time load address of the shared object.  */
--static __inline__ Elf32_Addr
-+static __always_inline Elf32_Addr
- elf_machine_load_address (void)
- {
- 	Elf32_Addr addr;
-@@ -58,7 +58,7 @@ elf_machine_load_address (void)
- 	return addr;
- }
- 
--static __inline__ void
-+static __always_inline void
- elf_machine_relative (Elf32_Addr load_off, const Elf32_Addr rel_addr,
- 		      Elf32_Word relative_count)
- {
-diff --git a/ldso/ldso/mips/dl-sysdep.h b/ldso/ldso/mips/dl-sysdep.h
-index cf6b28b..30d84fb 100644
---- a/ldso/ldso/mips/dl-sysdep.h
-+++ b/ldso/ldso/mips/dl-sysdep.h
-@@ -169,7 +169,7 @@ void _dl_perform_mips_global_got_relocations(struct elf_resolve *tpnt, int lazy)
- 
- #define OFFSET_GP_GOT 0x7ff0
- 
--static __inline__ ElfW(Addr) *
-+static __always_inline ElfW(Addr) *
- elf_mips_got_from_gpreg (ElfW(Addr) gpreg)
- {
- 	/* FIXME: the offset of gp from GOT may be system-dependent. */
-@@ -179,7 +179,7 @@ elf_mips_got_from_gpreg (ElfW(Addr) gpreg)
- /* Return the link-time address of _DYNAMIC.  Conveniently, this is the
-    first element of the GOT.  This must be inlined in a function which
-    uses global data.  We assume its $gp points to the primary GOT.  */
--static __inline__ ElfW(Addr)
-+static __always_inline ElfW(Addr)
- elf_machine_dynamic (void)
- {
- 	register ElfW(Addr) gp __asm__ ("$28");
-@@ -198,7 +198,7 @@ elf_machine_dynamic (void)
- #endif
- 
- /* Return the run-time load address of the shared object.  */
--static __inline__ ElfW(Addr)
-+static __always_inline ElfW(Addr)
- elf_machine_load_address (void)
- {
- 	ElfW(Addr) addr;
-@@ -214,7 +214,7 @@ elf_machine_load_address (void)
- 	return addr;
- }
- 
--static __inline__ void
-+static __always_inline void
- elf_machine_relative (ElfW(Addr) load_off, const ElfW(Addr) rel_addr,
- 		      ElfW(Word) relative_count)
- {
-diff --git a/ldso/ldso/powerpc/dl-sysdep.h b/ldso/ldso/powerpc/dl-sysdep.h
-index fdbf564..f33214c 100644
---- a/ldso/ldso/powerpc/dl-sysdep.h
-+++ b/ldso/ldso/powerpc/dl-sysdep.h
-@@ -85,7 +85,7 @@ void _dl_init_got(unsigned long *lpnt,struct elf_resolve *tpnt);
- #define ELF_MACHINE_PLTREL_OVERLAP 1
- 
- /* Return the value of the GOT pointer.  */
--static __inline__ Elf32_Addr * __attribute__ ((const))
-+static __always_inline Elf32_Addr * __attribute__ ((const))
- ppc_got (void)
- {
- 	Elf32_Addr *got;
-@@ -104,14 +104,14 @@ ppc_got (void)
- 
- /* Return the link-time address of _DYNAMIC, stored as
-    the first value in the GOT. */
--static __inline__ Elf32_Addr __attribute__ ((const))
-+static __always_inline Elf32_Addr __attribute__ ((const))
- elf_machine_dynamic (void)
- {
- 	return *ppc_got();
- }
- 
- /* Return the run-time load address of the shared object.  */
--static __inline__ Elf32_Addr __attribute__ ((const))
-+static __always_inline Elf32_Addr __attribute__ ((const))
- elf_machine_load_address (void)
- {
-   Elf32_Addr *branchaddr;
-@@ -159,7 +159,7 @@ elf_machine_load_address (void)
-   return runtime_dynamic - elf_machine_dynamic ();
- }
- 
--static __inline__ void
-+static __always_inline void
- elf_machine_relative (Elf32_Addr load_off, const Elf32_Addr rel_addr,
- 		      Elf32_Word relative_count)
- {
-diff --git a/ldso/ldso/sh/dl-sysdep.h b/ldso/ldso/sh/dl-sysdep.h
-index daedda5..d4fc784 100644
---- a/ldso/ldso/sh/dl-sysdep.h
-+++ b/ldso/ldso/sh/dl-sysdep.h
-@@ -25,7 +25,7 @@
- struct elf_resolve;
- extern unsigned long _dl_linux_resolver(struct elf_resolve * tpnt, int reloc_entry);
- 
--static __inline__ unsigned int
-+static __always_inline unsigned int
- _dl_urem(unsigned int n, unsigned int base)
- {
-   int res;
-@@ -95,7 +95,7 @@ _dl_urem(unsigned int n, unsigned int base)
- /* Return the link-time address of _DYNAMIC.  Conveniently, this is the
-    first element of the GOT.  This must be inlined in a function which
-    uses global data.  */
--static __inline__ Elf32_Addr __attribute__ ((unused))
-+static __always_inline Elf32_Addr __attribute__ ((unused))
- elf_machine_dynamic (void)
- {
- 	register Elf32_Addr *got;
-@@ -104,7 +104,7 @@ elf_machine_dynamic (void)
- }
- 
- /* Return the run-time load address of the shared object.  */
--static __inline__ Elf32_Addr __attribute__ ((unused))
-+static __always_inline Elf32_Addr __attribute__ ((unused))
- elf_machine_load_address (void)
- {
- 	Elf32_Addr addr;
-@@ -146,7 +146,7 @@ elf_machine_load_address (void)
-     } \
-   }
- 
--static __inline__ void
-+static __always_inline void
- elf_machine_relative (Elf32_Addr load_off, const Elf32_Addr rel_addr,
- 		      Elf32_Word relative_count)
- {
-diff --git a/ldso/ldso/sh64/dl-sysdep.h b/ldso/ldso/sh64/dl-sysdep.h
-index fc67b12..15d9b5e 100644
---- a/ldso/ldso/sh64/dl-sysdep.h
-+++ b/ldso/ldso/sh64/dl-sysdep.h
-@@ -41,7 +41,7 @@ extern unsigned long _dl_linux_resolver(struct elf_resolve * tpnt, int reloc_ent
- /* Return the link-time address of _DYNAMIC.  Conveniently, this is the
-    first element of the GOT.  This must be inlined in a function which
-    uses global data.  */
--static __inline__ Elf32_Addr elf_machine_dynamic(void)
-+static __always_inline Elf32_Addr elf_machine_dynamic(void)
- {
- 	register Elf32_Addr *got;
- 
-@@ -69,7 +69,7 @@ static __inline__ Elf32_Addr elf_machine_dynamic(void)
- }
- 
- /* Return the run-time load address of the shared object.  */
--static __inline__ Elf32_Addr elf_machine_load_address(void)
-+static __always_inline Elf32_Addr elf_machine_load_address(void)
- {
- 	Elf32_Addr addr;
- 
-@@ -122,7 +122,7 @@ static __inline__ Elf32_Addr elf_machine_load_address(void)
- 	}						\
- }
- 
--static __inline__ void
-+static __always_inline void
- elf_machine_relative(Elf32_Addr load_off, const Elf32_Addr rel_addr,
- 		     Elf32_Word relative_count)
- {
-diff --git a/ldso/ldso/sparc/dl-sysdep.h b/ldso/ldso/sparc/dl-sysdep.h
-index 7936517..ebfa268 100644
---- a/ldso/ldso/sparc/dl-sysdep.h
-+++ b/ldso/ldso/sparc/dl-sysdep.h
-@@ -52,7 +52,7 @@ unsigned long _dl_linux_resolver(struct elf_resolve * tpnt, int reloc_entry);
- 
- #ifndef COMPILE_ASM
- /* Cheap modulo implementation, taken from arm/ld_sysdep.h. */
--static __inline__ unsigned long
-+static __always_inline unsigned long
- sparc_mod(unsigned long m, unsigned long p)
- {
- 	unsigned long i, t, inc;
-@@ -118,7 +118,7 @@ do {    register Elf32_Addr pc __asm__("o7"); \
- /* Return the link-time address of _DYNAMIC.  Conveniently, this is the
-    first element of the GOT.  This must be inlined in a function which
-    uses global data.  */
--static __inline__ Elf32_Addr
-+static __always_inline Elf32_Addr
- elf_machine_dynamic (void)
- {
- 	register Elf32_Addr *got __asm__ ("%l7");
-@@ -129,7 +129,7 @@ elf_machine_dynamic (void)
- }
- 
- /* Return the run-time load address of the shared object.  */
--static __inline__ Elf32_Addr
-+static __always_inline Elf32_Addr
- elf_machine_load_address (void)
- {
- 	register Elf32_Addr *pc __asm__ ("%o7"), *got __asm__ ("%l7");
-@@ -148,7 +148,7 @@ elf_machine_load_address (void)
- 	return (Elf32_Addr) got - *got + (pc[2] - pc[3]) * 4 - 4;
- }
- 
--static __inline__ void
-+static __always_inline void
- elf_machine_relative (Elf32_Addr load_off, const Elf32_Addr rel_addr,
- 		      Elf32_Word relative_count)
- {
-diff --git a/ldso/ldso/xtensa/dl-sysdep.h b/ldso/ldso/xtensa/dl-sysdep.h
-index daae428..07b9b79 100644
---- a/ldso/ldso/xtensa/dl-sysdep.h
-+++ b/ldso/ldso/xtensa/dl-sysdep.h
-@@ -85,7 +85,7 @@ extern unsigned long _dl_linux_resolver (struct elf_resolve *, int);
-   (((type) == R_XTENSA_JMP_SLOT) * ELF_RTYPE_CLASS_PLT)
- 
- /* Return the link-time address of _DYNAMIC.  */
--static __inline__ Elf32_Addr
-+static __always_inline Elf32_Addr
- elf_machine_dynamic (void)
- {
-   /* This function is only used while bootstrapping the runtime linker.
-@@ -95,7 +95,7 @@ elf_machine_dynamic (void)
- }
- 
- /* Return the run-time load address of the shared object.  */
--static __inline__ Elf32_Addr
-+static __always_inline Elf32_Addr
- elf_machine_load_address (void)
- {
-   Elf32_Addr addr, tmp;
-@@ -116,7 +116,7 @@ elf_machine_load_address (void)
-   return addr - 3;
- }
- 
--static __inline__ void
-+static __always_inline void
- elf_machine_relative (Elf32_Addr load_off, const Elf32_Addr rel_addr,
- 		      Elf32_Word relative_count)
- {
--- 
-1.6.3.3.444.g4ecbc
-
diff --git a/meta/recipes-core/uclibc/uclibc-0.9.30.1/arm-linuxthreads.patch b/meta/recipes-core/uclibc/uclibc-0.9.30.1/arm-linuxthreads.patch
deleted file mode 100644
index e222668..0000000
--- a/meta/recipes-core/uclibc/uclibc-0.9.30.1/arm-linuxthreads.patch
+++ /dev/null
@@ -1,218 +0,0 @@
-Index: uClibc/libpthread/linuxthreads/sysdeps/unix/sysv/linux/arm/vfork.S
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ uClibc/libpthread/linuxthreads/sysdeps/unix/sysv/linux/arm/vfork.S	2008-08-28 00:22:06.278340855 +0200
-@@ -0,0 +1,78 @@
-+/* Copyright (C) 1999, 2002, 2003, 2005 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+   Contributed by Philip Blundell <philb@gnu.org>.
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
-+#include <sysdep-cancel.h>
-+#define _ERRNO_H	1
-+#include <bits/errno.h>
-+#include <kernel-features.h>
-+
-+/* Clone the calling process, but without copying the whole address space.
-+   The calling process is suspended until the new process exits or is
-+   replaced by a call to `execve'.  Return -1 for errors, 0 to the new process,
-+   and the process ID of the new process to the old process.  */
-+
-+ENTRY (__vfork)
-+
-+#ifdef __NR_vfork
-+
-+#ifdef SHARED
-+	ldr	ip, 1f
-+	ldr	r0, 2f
-+3:	add	ip, pc, ip
-+	ldr	r0, [ip, r0]
-+#else
-+	ldr	r0, 1f
-+#endif
-+	movs	r0, r0
-+	bne	HIDDEN_JUMPTARGET (__fork)
-+
-+	DO_CALL (vfork, 0)
-+	cmn	a1, #4096
-+	RETINSTR(cc, lr)
-+
-+#ifndef __ASSUME_VFORK_SYSCALL
-+	/* Check if vfork syscall is known at all.  */
-+	cmn	a1, #ENOSYS
-+	bne	PLTJMP(C_SYMBOL_NAME(__syscall_error))
-+#endif
-+
-+#endif
-+
-+#ifndef __ASSUME_VFORK_SYSCALL
-+	/* If we don't have vfork, fork is close enough.  */
-+	DO_CALL (fork, 0)
-+	cmn	a1, #4096
-+	RETINSTR(cc, lr)
-+#elif !defined __NR_vfork
-+# error "__NR_vfork not available and __ASSUME_VFORK_SYSCALL defined"
-+#endif
-+    	b	PLTJMP(C_SYMBOL_NAME(__syscall_error))
-+
-+#ifdef SHARED
-+1:	.word	_GLOBAL_OFFSET_TABLE_ - 3b - 8
-+2:	.word	__libc_pthread_functions(GOTOFF)
-+#else
-+	.weak	pthread_create
-+1:	.word	pthread_create
-+#endif
-+
-+PSEUDO_END (__vfork)
-+libc_hidden_def (__vfork)
-+
-+weak_alias (__vfork, vfork)
-Index: uClibc/libpthread/linuxthreads/sysdeps/unix/sysv/linux/arm/sysdep-cancel.h
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ uClibc/libpthread/linuxthreads/sysdeps/unix/sysv/linux/arm/sysdep-cancel.h	2008-08-28 00:28:04.301636993 +0200
-@@ -0,0 +1,130 @@
-+/* Copyright (C) 2003, 2005 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+   Contributed by Phil Blundell <pb@nexus.co.uk>, 2003.
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
-+#include <tls.h>
-+#include <pt-machine.h>
-+#ifndef __ASSEMBLER__
-+# include <linuxthreads/internals.h>
-+#endif
-+
-+#if !defined NOT_IN_libc || defined IS_IN_libpthread
-+
-+/* We push lr onto the stack, so we have to use ldmib instead of ldmia
-+   to find the saved arguments.  */
-+# ifdef PIC
-+#  undef DOARGS_5
-+#  undef DOARGS_6
-+#  undef DOARGS_7
-+#  define DOARGS_5 str r4, [sp, $-4]!; ldr r4, [sp, $8];
-+#  define DOARGS_6 mov ip, sp; stmfd sp!, {r4, r5}; ldmib ip, {r4, r5};
-+#  define DOARGS_7 mov ip, sp; stmfd sp!, {r4, r5, r6}; ldmib ip, {r4, r5, r6};
-+# endif
-+
-+# undef PSEUDO_RET
-+# define PSEUDO_RET						        \
-+    ldrcc pc, [sp], $4;						        \
-+    ldr	lr, [sp], $4;							\
-+    b PLTJMP(SYSCALL_ERROR)
-+
-+# undef PSEUDO
-+# define PSEUDO(name, syscall_name, args)				\
-+  .section ".text";							\
-+    PSEUDO_PROLOGUE;							\
-+  ENTRY (name);								\
-+    SINGLE_THREAD_P;							\
-+    bne .Lpseudo_cancel;						\
-+    DO_CALL (syscall_name, args);					\
-+    cmn r0, $4096;							\
-+    RETINSTR(cc, lr);							\
-+    b PLTJMP(SYSCALL_ERROR);						\
-+  .Lpseudo_cancel:							\
-+    str lr, [sp, $-4]!;							\
-+    DOCARGS_##args;	/* save syscall args around CENABLE.  */	\
-+    CENABLE;								\
-+    mov ip, r0;		/* put mask in safe place.  */			\
-+    UNDOCARGS_##args;	/* restore syscall args.  */			\
-+    swi SYS_ify (syscall_name);	/* do the call.  */			\
-+    str r0, [sp, $-4]!; /* save syscall return value.  */		\
-+    mov r0, ip;		/* get mask back.  */				\
-+    CDISABLE;								\
-+    ldr r0, [sp], $4;	/* retrieve return value.  */			\
-+    UNDOC2ARGS_##args;	/* fix register damage.  */			\
-+    cmn r0, $4096;
-+
-+# define DOCARGS_0
-+# define UNDOCARGS_0
-+# define UNDOC2ARGS_0
-+
-+# define DOCARGS_1	str r0, [sp, #-4]!;
-+# define UNDOCARGS_1	ldr r0, [sp], #4;
-+# define UNDOC2ARGS_1
-+
-+# define DOCARGS_2	str r1, [sp, #-4]!; str r0, [sp, #-4]!;
-+# define UNDOCARGS_2	ldr r0, [sp], #4; ldr r1, [sp], #4;
-+# define UNDOC2ARGS_2
-+
-+# define DOCARGS_3	str r2, [sp, #-4]!; str r1, [sp, #-4]!; str r0, [sp, #-4]!;
-+# define UNDOCARGS_3	ldr r0, [sp], #4; ldr r1, [sp], #4; ldr r2, [sp], #4
-+# define UNDOC2ARGS_3
-+
-+# define DOCARGS_4	stmfd sp!, {r0-r3}
-+# define UNDOCARGS_4	ldmfd sp!, {r0-r3}
-+# define UNDOC2ARGS_4
-+
-+# define DOCARGS_5	stmfd sp!, {r0-r3}
-+# define UNDOCARGS_5	ldmfd sp, {r0-r3}; str r4, [sp, #-4]!; ldr r4, [sp, #24]
-+# define UNDOC2ARGS_5   ldr r4, [sp], #20
-+
-+# ifdef IS_IN_libpthread
-+#  define CENABLE	bl PLTJMP(__pthread_enable_asynccancel)
-+#  define CDISABLE	bl PLTJMP(__pthread_disable_asynccancel)
-+#  define __local_multiple_threads __pthread_multiple_threads
-+# else
-+#  define CENABLE	bl PLTJMP(__libc_enable_asynccancel)
-+#  define CDISABLE	bl PLTJMP(__libc_disable_asynccancel)
-+#  define __local_multiple_threads __libc_multiple_threads
-+# endif
-+
-+# ifndef __ASSEMBLER__
-+extern int __local_multiple_threads attribute_hidden;
-+#  define SINGLE_THREAD_P __builtin_expect (__local_multiple_threads == 0, 1)
-+# else
-+#  if !defined PIC
-+#   define SINGLE_THREAD_P						\
-+  ldr ip, =__local_multiple_threads;					\
-+  ldr ip, [ip];								\
-+  teq ip, #0;
-+#   define PSEUDO_PROLOGUE
-+#  else
-+#   define SINGLE_THREAD_P						\
-+  ldr ip, 1b;								\
-+2:									\
-+  ldr ip, [pc, ip];							\
-+  teq ip, #0;
-+#   define PSEUDO_PROLOGUE						\
-+  1:  .word __local_multiple_threads - 2f - 8;
-+#  endif
-+# endif
-+
-+#elif !defined __ASSEMBLER__
-+
-+/* This code should never be used but we define it anyhow.  */
-+# define SINGLE_THREAD_P (1)
-+
-+#endif
diff --git a/meta/recipes-core/uclibc/uclibc-0.9.30.1/armv5te/uClibc.machine b/meta/recipes-core/uclibc/uclibc-0.9.30.1/armv5te/uClibc.machine
deleted file mode 100644
index ec0385b..0000000
--- a/meta/recipes-core/uclibc/uclibc-0.9.30.1/armv5te/uClibc.machine
+++ /dev/null
@@ -1,70 +0,0 @@
-#
-# Automatically generated make config: don't edit
-# Sun May 13 11:16:02 2007
-#
-# TARGET_alpha is not set
-TARGET_arm=y
-# TARGET_bfin is not set
-# TARGET_cris is not set
-# TARGET_e1 is not set
-# TARGET_frv is not set
-# TARGET_h8300 is not set
-# TARGET_hppa is not set
-# TARGET_i386 is not set
-# TARGET_i960 is not set
-# TARGET_ia64 is not set
-# TARGET_m68k is not set
-# TARGET_microblaze is not set
-# TARGET_mips is not set
-# TARGET_nios is not set
-# TARGET_nios2 is not set
-# TARGET_powerpc is not set
-# TARGET_sh is not set
-# TARGET_sh64 is not set
-# TARGET_sparc is not set
-# TARGET_v850 is not set
-# TARGET_vax is not set
-# TARGET_x86_64 is not set
-
-#
-# Target Architecture Features and Options
-#
-TARGET_ARCH="arm"
-FORCE_OPTIONS_FOR_ARCH=y
-# CONFIG_ARM_OABI is not set
-CONFIG_ARM_EABI=y
-USE_BX=y
-# CONFIG_GENERIC_ARM is not set
-# CONFIG_ARM610 is not set
-# CONFIG_ARM710 is not set
-# CONFIG_ARM7TDMI is not set
-# CONFIG_ARM720T is not set
-# CONFIG_ARM920T is not set
-# CONFIG_ARM922T is not set
-# CONFIG_ARM926T is not set
-# CONFIG_ARM10T is not set
-# CONFIG_ARM1136JF_S is not set
-# CONFIG_ARM1176JZ_S is not set
-# CONFIG_ARM1176JZF_S is not set
-# CONFIG_ARM_SA110 is not set
-# CONFIG_ARM_SA1100 is not set
-CONFIG_ARM_XSCALE=y
-# CONFIG_ARM_IWMMXT is not set
-TARGET_SUBARCH=""
-
-#
-# Using ELF file format
-#
-ARCH_ANY_ENDIAN=y
-ARCH_LITTLE_ENDIAN=y
-# ARCH_WANTS_BIG_ENDIAN is not set
-ARCH_WANTS_LITTLE_ENDIAN=y
-ARCH_HAS_MMU=y
-ARCH_USE_MMU=y
-UCLIBC_HAS_FLOATS=y
-# UCLIBC_HAS_FPU is not set
-UCLIBC_HAS_SOFT_FLOAT=y
-DO_C99_MATH=y
-KERNEL_HEADERS="/data/build/koen/OE/build/tmp/angstrom/cross/arm-angstrom-linux-uclibcgnueabi/include"
-HAVE_DOT_CONFIG=y
-
diff --git a/meta/recipes-core/uclibc/uclibc-0.9.30.1/armv6/uClibc.machine b/meta/recipes-core/uclibc/uclibc-0.9.30.1/armv6/uClibc.machine
deleted file mode 100644
index 85f70f7..0000000
--- a/meta/recipes-core/uclibc/uclibc-0.9.30.1/armv6/uClibc.machine
+++ /dev/null
@@ -1,70 +0,0 @@
-#
-# Automatically generated make config: don't edit
-# Sun May 13 11:16:02 2007
-#
-# TARGET_alpha is not set
-TARGET_arm=y
-# TARGET_bfin is not set
-# TARGET_cris is not set
-# TARGET_e1 is not set
-# TARGET_frv is not set
-# TARGET_h8300 is not set
-# TARGET_hppa is not set
-# TARGET_i386 is not set
-# TARGET_i960 is not set
-# TARGET_ia64 is not set
-# TARGET_m68k is not set
-# TARGET_microblaze is not set
-# TARGET_mips is not set
-# TARGET_nios is not set
-# TARGET_nios2 is not set
-# TARGET_powerpc is not set
-# TARGET_sh is not set
-# TARGET_sh64 is not set
-# TARGET_sparc is not set
-# TARGET_v850 is not set
-# TARGET_vax is not set
-# TARGET_x86_64 is not set
-
-#
-# Target Architecture Features and Options
-#
-TARGET_ARCH="arm"
-FORCE_OPTIONS_FOR_ARCH=y
-# CONFIG_ARM_OABI is not set
-CONFIG_ARM_EABI=y
-USE_BX=y
-# CONFIG_GENERIC_ARM is not set
-# CONFIG_ARM610 is not set
-# CONFIG_ARM710 is not set
-# CONFIG_ARM7TDMI is not set
-# CONFIG_ARM720T is not set
-# CONFIG_ARM920T is not set
-# CONFIG_ARM922T is not set
-# CONFIG_ARM926T is not set
-# CONFIG_ARM10T is not set
-# CONFIG_ARM1136JF_S is not set
-# CONFIG_ARM1176JZ_S is not set
-# CONFIG_ARM1176JZF_S is not set
-# CONFIG_ARM_SA110 is not set
-# CONFIG_ARM_SA1100 is not set
-CONFIG_ARM_XSCALE=y
-# CONFIG_ARM_IWMMXT is not set
-TARGET_SUBARCH=""
-
-#
-# Using ELF file format
-#
-ARCH_ANY_ENDIAN=y
-ARCH_LITTLE_ENDIAN=y
-# ARCH_WANTS_BIG_ENDIAN is not set
-ARCH_WANTS_LITTLE_ENDIAN=y
-ARCH_HAS_MMU=y
-ARCH_USE_MMU=y
-UCLIBC_HAS_FLOATS=y
-UCLIBC_HAS_FPU=y
-UCLIBC_HAS_SOFT_FLOAT=n
-DO_C99_MATH=y
-KERNEL_HEADERS="/data/build/koen/OE/build/tmp/angstrom/cross/arm-angstrom-linux-uclibcgnueabi/include"
-HAVE_DOT_CONFIG=y
-
diff --git a/meta/recipes-core/uclibc/uclibc-0.9.30.1/armv7a/uClibc.machine b/meta/recipes-core/uclibc/uclibc-0.9.30.1/armv7a/uClibc.machine
deleted file mode 100644
index 85f70f7..0000000
--- a/meta/recipes-core/uclibc/uclibc-0.9.30.1/armv7a/uClibc.machine
+++ /dev/null
@@ -1,70 +0,0 @@
-#
-# Automatically generated make config: don't edit
-# Sun May 13 11:16:02 2007
-#
-# TARGET_alpha is not set
-TARGET_arm=y
-# TARGET_bfin is not set
-# TARGET_cris is not set
-# TARGET_e1 is not set
-# TARGET_frv is not set
-# TARGET_h8300 is not set
-# TARGET_hppa is not set
-# TARGET_i386 is not set
-# TARGET_i960 is not set
-# TARGET_ia64 is not set
-# TARGET_m68k is not set
-# TARGET_microblaze is not set
-# TARGET_mips is not set
-# TARGET_nios is not set
-# TARGET_nios2 is not set
-# TARGET_powerpc is not set
-# TARGET_sh is not set
-# TARGET_sh64 is not set
-# TARGET_sparc is not set
-# TARGET_v850 is not set
-# TARGET_vax is not set
-# TARGET_x86_64 is not set
-
-#
-# Target Architecture Features and Options
-#
-TARGET_ARCH="arm"
-FORCE_OPTIONS_FOR_ARCH=y
-# CONFIG_ARM_OABI is not set
-CONFIG_ARM_EABI=y
-USE_BX=y
-# CONFIG_GENERIC_ARM is not set
-# CONFIG_ARM610 is not set
-# CONFIG_ARM710 is not set
-# CONFIG_ARM7TDMI is not set
-# CONFIG_ARM720T is not set
-# CONFIG_ARM920T is not set
-# CONFIG_ARM922T is not set
-# CONFIG_ARM926T is not set
-# CONFIG_ARM10T is not set
-# CONFIG_ARM1136JF_S is not set
-# CONFIG_ARM1176JZ_S is not set
-# CONFIG_ARM1176JZF_S is not set
-# CONFIG_ARM_SA110 is not set
-# CONFIG_ARM_SA1100 is not set
-CONFIG_ARM_XSCALE=y
-# CONFIG_ARM_IWMMXT is not set
-TARGET_SUBARCH=""
-
-#
-# Using ELF file format
-#
-ARCH_ANY_ENDIAN=y
-ARCH_LITTLE_ENDIAN=y
-# ARCH_WANTS_BIG_ENDIAN is not set
-ARCH_WANTS_LITTLE_ENDIAN=y
-ARCH_HAS_MMU=y
-ARCH_USE_MMU=y
-UCLIBC_HAS_FLOATS=y
-UCLIBC_HAS_FPU=y
-UCLIBC_HAS_SOFT_FLOAT=n
-DO_C99_MATH=y
-KERNEL_HEADERS="/data/build/koen/OE/build/tmp/angstrom/cross/arm-angstrom-linux-uclibcgnueabi/include"
-HAVE_DOT_CONFIG=y
-
diff --git a/meta/recipes-core/uclibc/uclibc-0.9.30.1/gcc-4.4-fixlet.patch b/meta/recipes-core/uclibc/uclibc-0.9.30.1/gcc-4.4-fixlet.patch
deleted file mode 100644
index b9ff671..0000000
--- a/meta/recipes-core/uclibc/uclibc-0.9.30.1/gcc-4.4-fixlet.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Index: uClibc-0.9.30.1/extra/scripts/unifdef.c
-===================================================================
---- uClibc-0.9.30.1.orig/extra/scripts/unifdef.c	2009-08-09 11:55:23.000000000 +0200
-+++ uClibc-0.9.30.1/extra/scripts/unifdef.c	2009-08-09 11:55:46.000000000 +0200
-@@ -206,7 +206,7 @@
- static void             error(const char *);
- static int              findsym(const char *);
- static void             flushline(bool);
--static Linetype         getline(void);
-+static Linetype         _getline(void);
- static Linetype         ifeval(const char **);
- static void             ignoreoff(void);
- static void             ignoreon(void);
-@@ -512,7 +512,7 @@
- 
- 	for (;;) {
- 		linenum++;
--		lineval = getline();
-+		lineval = _getline();
- 		trans_table[ifstate[depth]][lineval]();
- 		debug("process %s -> %s depth %d",
- 		    linetype_name[lineval],
-@@ -526,7 +526,7 @@
-  * help from skipcomment().
-  */
- static Linetype
--getline(void)
-+_getline(void)
- {
- 	const char *cp;
- 	int cursym;
diff --git a/meta/recipes-core/uclibc/uclibc-0.9.30.1/linuxthreads-changes.patch b/meta/recipes-core/uclibc/uclibc-0.9.30.1/linuxthreads-changes.patch
deleted file mode 100644
index f6f32cd..0000000
--- a/meta/recipes-core/uclibc/uclibc-0.9.30.1/linuxthreads-changes.patch
+++ /dev/null
@@ -1,291 +0,0 @@
-Index: uClibc/libpthread/linuxthreads/descr.h
-===================================================================
---- uClibc.orig/libpthread/linuxthreads/descr.h	2008-08-27 23:59:46.171809044 +0200
-+++ uClibc/libpthread/linuxthreads/descr.h	2008-08-28 00:00:35.435134759 +0200
-@@ -123,9 +123,9 @@
-       union dtv *dtvp;
-       pthread_descr self;	/* Pointer to this structure */
-       int multiple_threads;
--# ifdef NEED_DL_SYSINFO
-       uintptr_t sysinfo;
--# endif
-+      uintptr_t stack_guard;
-+      uintptr_t pointer_guard;
-     } data;
-     void *__padding[16];
-   } p_header;
-@@ -193,6 +193,13 @@
-   size_t p_alloca_cutoff;	/* Maximum size which should be allocated
- 				   using alloca() instead of malloc().  */
-   /* New elements must be added at the end.  */
-+
-+  /* This member must be last.  */
-+  char end_padding[];
-+
-+#define PTHREAD_STRUCT_END_PADDING \
-+  (sizeof (struct _pthread_descr_struct)			      \
-+   - offsetof (struct _pthread_descr_struct, end_padding))
- } __attribute__ ((aligned(32))); /* We need to align the structure so that
- 				    doubles are aligned properly.  This is 8
- 				    bytes on MIPS and 16 bytes on MIPS64.
-Index: uClibc/libpthread/linuxthreads/manager.c
-===================================================================
---- uClibc.orig/libpthread/linuxthreads/manager.c	2008-08-27 23:59:54.185140485 +0200
-+++ uClibc/libpthread/linuxthreads/manager.c	2008-08-28 00:00:35.435134759 +0200
-@@ -679,6 +679,17 @@
-   new_thread->p_inheritsched = attr ? attr->__inheritsched : 0;
-   new_thread->p_alloca_cutoff = stksize / 4 > __MAX_ALLOCA_CUTOFF
- 				 ? __MAX_ALLOCA_CUTOFF : stksize / 4;
-+
-+  /* Copy the stack guard canary.  */
-+#ifdef THREAD_COPY_STACK_GUARD
-+  THREAD_COPY_STACK_GUARD (new_thread);
-+#endif
-+
-+  /* Copy the pointer guard value.  */
-+#ifdef THREAD_COPY_POINTER_GUARD
-+  THREAD_COPY_POINTER_GUARD (new_thread);
-+#endif
-+
-   /* Initialize the thread handle */
-   __pthread_init_lock(&__pthread_handles[sseg].h_lock);
-   __pthread_handles[sseg].h_descr = new_thread;
-@@ -742,15 +753,15 @@
- 	  pid = __clone2(pthread_start_thread_event,
-   		 (void **)new_thread_bottom,
- 			 (char *)stack_addr - new_thread_bottom,
--			 CLONE_VM | CLONE_FS | CLONE_FILES | CLONE_SIGHAND |
-+			 CLONE_VM | CLONE_FS | CLONE_FILES | CLONE_SIGHAND | CLONE_SYSVSEM |
- 			 __pthread_sig_cancel, new_thread);
- #elif _STACK_GROWS_UP
- 	  pid = __clone(pthread_start_thread_event, (void *) new_thread_bottom,
--			CLONE_VM | CLONE_FS | CLONE_FILES | CLONE_SIGHAND |
-+			CLONE_VM | CLONE_FS | CLONE_FILES | CLONE_SIGHAND | CLONE_SYSVSEM |
- 			__pthread_sig_cancel, new_thread);
- #else
- 	  pid = __clone(pthread_start_thread_event, stack_addr,
--			CLONE_VM | CLONE_FS | CLONE_FILES | CLONE_SIGHAND |
-+			CLONE_VM | CLONE_FS | CLONE_FILES | CLONE_SIGHAND | CLONE_SYSVSEM |
- 			__pthread_sig_cancel, new_thread);
- #endif
- 	  saved_errno = errno;
-@@ -783,15 +794,15 @@
-       pid = __clone2(pthread_start_thread,
- 		     (void **)new_thread_bottom,
-                      (char *)stack_addr - new_thread_bottom,
--		     CLONE_VM | CLONE_FS | CLONE_FILES | CLONE_SIGHAND |
-+		     CLONE_VM | CLONE_FS | CLONE_FILES | CLONE_SIGHAND | CLONE_SYSVSEM |
- 		     __pthread_sig_cancel, new_thread);
- #elif _STACK_GROWS_UP
-       pid = __clone(pthread_start_thread, (void *) new_thread_bottom,
--		    CLONE_VM | CLONE_FS | CLONE_FILES | CLONE_SIGHAND |
-+		    CLONE_VM | CLONE_FS | CLONE_FILES | CLONE_SIGHAND | CLONE_SYSVSEM |
- 		    __pthread_sig_cancel, new_thread);
- #else
-       pid = __clone(pthread_start_thread, stack_addr,
--		    CLONE_VM | CLONE_FS | CLONE_FILES | CLONE_SIGHAND |
-+		    CLONE_VM | CLONE_FS | CLONE_FILES | CLONE_SIGHAND | CLONE_SYSVSEM |
- 		    __pthread_sig_cancel, new_thread);
- #endif /* !NEED_SEPARATE_REGISTER_STACK */
-       saved_errno = errno;
-@@ -892,10 +903,11 @@
- #ifdef _STACK_GROWS_UP
- # ifdef USE_TLS
-       size_t stacksize = guardaddr - th->p_stackaddr;
-+      guardaddr = th->p_stackaddr;
- # else
-       size_t stacksize = guardaddr - (char *)th;
--# endif
-       guardaddr = (char *)th;
-+# endif
- #else
-       /* Guardaddr is always set, even if guardsize is 0.  This allows
- 	 us to compute everything else.  */
-Index: uClibc/libpthread/linuxthreads/pthread.c
-===================================================================
---- uClibc.orig/libpthread/linuxthreads/pthread.c	2008-08-28 00:00:00.825141935 +0200
-+++ uClibc/libpthread/linuxthreads/pthread.c	2008-08-28 00:00:35.438472147 +0200
-@@ -698,6 +698,16 @@
-   mgr = &__pthread_manager_thread;
- #endif
- 
-+  /* Copy the stack guard canary.  */
-+#ifdef THREAD_COPY_STACK_GUARD
-+  THREAD_COPY_STACK_GUARD (mgr);
-+#endif
-+
-+  /* Copy the pointer guard value.  */
-+#ifdef THREAD_COPY_POINTER_GUARD
-+  THREAD_COPY_POINTER_GUARD (mgr);
-+#endif
-+
-   __pthread_manager_request = manager_pipe[1]; /* writing end */
-   __pthread_manager_reader = manager_pipe[0]; /* reading end */
- 
-@@ -738,17 +748,17 @@
- 	  pid = __clone2(__pthread_manager_event,
- 			 (void **) __pthread_manager_thread_bos,
- 			 THREAD_MANAGER_STACK_SIZE,
--			 CLONE_VM | CLONE_FS | CLONE_FILES | CLONE_SIGHAND,
-+			 CLONE_VM | CLONE_FS | CLONE_FILES | CLONE_SIGHAND | CLONE_SYSVSEM,
- 			 mgr);
- #elif _STACK_GROWS_UP
- 	  pid = __clone(__pthread_manager_event,
- 			(void **) __pthread_manager_thread_bos,
--			CLONE_VM | CLONE_FS | CLONE_FILES | CLONE_SIGHAND,
-+			CLONE_VM | CLONE_FS | CLONE_FILES | CLONE_SIGHAND | CLONE_SYSVSEM,
- 			mgr);
- #else
- 	  pid = __clone(__pthread_manager_event,
- 			(void **) __pthread_manager_thread_tos,
--			CLONE_VM | CLONE_FS | CLONE_FILES | CLONE_SIGHAND,
-+			CLONE_VM | CLONE_FS | CLONE_FILES | CLONE_SIGHAND | CLONE_SYSVSEM,
- 			mgr);
- #endif
- 
-@@ -778,13 +788,13 @@
- #ifdef NEED_SEPARATE_REGISTER_STACK
-       pid = __clone2(__pthread_manager, (void **) __pthread_manager_thread_bos,
- 		     THREAD_MANAGER_STACK_SIZE,
--		     CLONE_VM | CLONE_FS | CLONE_FILES | CLONE_SIGHAND, mgr);
-+		     CLONE_VM | CLONE_FS | CLONE_FILES | CLONE_SIGHAND | CLONE_SYSVSEM, mgr);
- #elif _STACK_GROWS_UP
-       pid = __clone(__pthread_manager, (void **) __pthread_manager_thread_bos,
--		    CLONE_VM | CLONE_FS | CLONE_FILES | CLONE_SIGHAND, mgr);
-+		    CLONE_VM | CLONE_FS | CLONE_FILES | CLONE_SIGHAND | CLONE_SYSVSEM, mgr);
- #else
-       pid = __clone(__pthread_manager, (void **) __pthread_manager_thread_tos,
--		    CLONE_VM | CLONE_FS | CLONE_FILES | CLONE_SIGHAND, mgr);
-+		    CLONE_VM | CLONE_FS | CLONE_FILES | CLONE_SIGHAND | CLONE_SYSVSEM, mgr);
- #endif
-     }
-   if (__builtin_expect (pid, 0) == -1) {
-@@ -971,6 +981,10 @@
-     struct pthread_request request;
-     pthread_descr self = thread_self();
- 
-+    /* Make sure we come back here after suspend(), in case we entered
-+       from a signal handler.  */
-+    THREAD_SETMEM(self, p_signal_jmp, NULL);
-+
-     request.req_thread = self;
-     request.req_kind = REQ_PROCESS_EXIT;
-     request.req_args.exit.code = retcode;
-@@ -1198,13 +1212,13 @@
- 
- void __pthread_restart_old(pthread_descr th)
- {
--  if (atomic_increment(&th->p_resume_count) == -1)
-+  if (pthread_atomic_increment(&th->p_resume_count) == -1)
-     kill(th->p_pid, __pthread_sig_restart);
- }
- 
- void __pthread_suspend_old(pthread_descr self)
- {
--  if (atomic_decrement(&self->p_resume_count) <= 0)
-+  if (pthread_atomic_decrement(&self->p_resume_count) <= 0)
-     __pthread_wait_for_restart_signal(self);
- }
- 
-@@ -1215,7 +1229,7 @@
-   int was_signalled = 0;
-   sigjmp_buf jmpbuf;
- 
--  if (atomic_decrement(&self->p_resume_count) == 0) {
-+  if (pthread_atomic_decrement(&self->p_resume_count) == 0) {
-     /* Set up a longjmp handler for the restart signal, unblock
-        the signal and sleep. */
- 
-@@ -1272,9 +1286,9 @@
-      being delivered. */
- 
-   if (!was_signalled) {
--    if (atomic_increment(&self->p_resume_count) != -1) {
-+    if (pthread_atomic_increment(&self->p_resume_count) != -1) {
-       __pthread_wait_for_restart_signal(self);
--      atomic_decrement(&self->p_resume_count); /* should be zero now! */
-+      pthread_atomic_decrement(&self->p_resume_count); /* should be zero now! */
-       /* woke spontaneously and consumed restart signal */
-       return 1;
-     }
-Index: uClibc/libpthread/linuxthreads/specific.c
-===================================================================
---- uClibc.orig/libpthread/linuxthreads/specific.c	2008-08-28 00:00:07.595139286 +0200
-+++ uClibc/libpthread/linuxthreads/specific.c	2008-08-28 00:00:35.438472147 +0200
-@@ -104,13 +104,14 @@
-      that if the key is reallocated later by pthread_key_create, its
-      associated values will be NULL in all threads.
- 
--     If no threads have been created yet, clear it just in the
--     current thread.  */
-+     If no threads have been created yet, or if we are exiting, clear
-+     it just in the current thread.  */
- 
-   struct pthread_key_delete_helper_args args;
-   args.idx1st = key / PTHREAD_KEY_2NDLEVEL_SIZE;
-   args.idx2nd = key % PTHREAD_KEY_2NDLEVEL_SIZE;
--  if (__pthread_manager_request != -1)
-+  if (__pthread_manager_request != -1
-+      && !(__builtin_expect (__pthread_exit_requested, 0)))
-     {
-       struct pthread_request request;
- 
-@@ -203,8 +204,9 @@
-   __pthread_lock(THREAD_GETMEM(self, p_lock), self);
-   for (i = 0; i < PTHREAD_KEY_1STLEVEL_SIZE; i++) {
-     if (THREAD_GETMEM_NC(self, p_specific[i]) != NULL) {
--      free(THREAD_GETMEM_NC(self, p_specific[i]));
-+      void *p = THREAD_GETMEM_NC(self, p_specific[i]);
-       THREAD_SETMEM_NC(self, p_specific[i], NULL);
-+      free(p);
-     }
-   }
-   __pthread_unlock(THREAD_GETMEM(self, p_lock));
-Index: uClibc/libpthread/linuxthreads/spinlock.c
-===================================================================
---- uClibc.orig/libpthread/linuxthreads/spinlock.c	2008-08-28 00:00:17.805140454 +0200
-+++ uClibc/libpthread/linuxthreads/spinlock.c	2008-08-28 00:00:35.438472147 +0200
-@@ -637,8 +637,20 @@
- #if defined HAS_COMPARE_AND_SWAP
- 	wait_node_dequeue(pp_head, pp_max_prio, p_max_prio);
- #endif
-+
-+      /* Release the spinlock before restarting.  */
-+#if defined TEST_FOR_COMPARE_AND_SWAP
-+      if (!__pthread_has_cas)
-+#endif
-+#if !defined HAS_COMPARE_AND_SWAP || defined TEST_FOR_COMPARE_AND_SWAP
-+	{
-+	  __pthread_release(&lock->__spinlock);
-+	}
-+#endif
-+
-       restart(p_max_prio->thr);
--      break;
-+
-+      return;
-     }
-   }
- 
-Index: uClibc/libpthread/linuxthreads/spinlock.h
-===================================================================
---- uClibc.orig/libpthread/linuxthreads/spinlock.h	2008-08-28 00:00:24.768471655 +0200
-+++ uClibc/libpthread/linuxthreads/spinlock.h	2008-08-28 00:02:42.971786951 +0200
-@@ -172,7 +172,7 @@
- 
- /* Operations on pthread_atomic, which is defined in internals.h */
- 
--static __inline__ long atomic_increment(struct pthread_atomic *pa)
-+static __inline__ long pthread_atomic_increment(struct pthread_atomic *pa)
- {
-     long oldval;
- 
-@@ -184,7 +184,7 @@
- }
- 
- 
--static __inline__ long atomic_decrement(struct pthread_atomic *pa)
-+static __inline__ long pthread_atomic_decrement(struct pthread_atomic *pa)
- {
-     long oldval;
- 
diff --git a/meta/recipes-core/uclibc/uclibc-0.9.30.1/pthread_atfork.patch b/meta/recipes-core/uclibc/uclibc-0.9.30.1/pthread_atfork.patch
deleted file mode 100644
index 92accc2..0000000
--- a/meta/recipes-core/uclibc/uclibc-0.9.30.1/pthread_atfork.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-Index: uClibc-0.9.30/libpthread/linuxthreads/Makefile.in
-===================================================================
---- uClibc-0.9.30.orig/libpthread/linuxthreads/Makefile.in	2009-01-11 01:09:27.008515954 +0100
-+++ uClibc-0.9.30/libpthread/linuxthreads/Makefile.in	2009-01-11 01:09:35.295181636 +0100
-@@ -45,7 +45,7 @@
- pthread_SRC := \
- 	attr barrier cancel condvar errno events join pthread \
- 	lockfile manager mutex pt-machine ptcleanup \
--	ptclock_gettime ptclock_settime ptfork pthandles \
-+	ptclock_gettime ptclock_settime ptfork pthandles pthread_atfork \
- 	pthread_setegid pthread_seteuid pthread_setgid pthread_setregid \
- 	pthread_setresgid pthread_setresuid pthread_setreuid pthread_setuid \
- 	rwlock semaphore sighandler signals specific spinlock
-Index: uClibc-0.9.30/libpthread/linuxthreads/pthread_atfork.c
-===================================================================
---- uClibc-0.9.30.orig/libpthread/linuxthreads/pthread_atfork.c	2009-01-11 01:09:44.931848926 +0100
-+++ uClibc-0.9.30/libpthread/linuxthreads/pthread_atfork.c	2009-01-11 01:12:49.926539743 +0100
-@@ -43,12 +43,8 @@
- 
- /* Hide the symbol so that no definition but the one locally in the
-    executable or DSO is used.  */
--int
--#ifndef __pthread_atfork
--/* Don't mark the compatibility function as hidden.  */
--attribute_hidden
--#endif
--__pthread_atfork (prepare, parent, child)
-+
-+int attribute_hidden __pthread_atfork (prepare, parent, child)
-      void (*prepare) (void);
-      void (*parent) (void);
-      void (*child) (void);
-@@ -56,8 +52,5 @@
-   return __register_atfork (prepare, parent, child,
- 			    &__dso_handle == NULL ? NULL : __dso_handle);
- }
--#ifndef __pthread_atfork
--extern int pthread_atfork (void (*prepare) (void), void (*parent) (void),
--			   void (*child) (void)) attribute_hidden;
-+
- strong_alias (__pthread_atfork, pthread_atfork)
--#endif
diff --git a/meta/recipes-core/uclibc/uclibc-0.9.30.1/uClibc.machine.armv4t b/meta/recipes-core/uclibc/uclibc-0.9.30.1/uClibc.machine.armv4t
deleted file mode 100644
index 898b73a..0000000
--- a/meta/recipes-core/uclibc/uclibc-0.9.30.1/uClibc.machine.armv4t
+++ /dev/null
@@ -1,69 +0,0 @@
-#
-# Automatically generated make config: don't edit
-# Mon May 14 10:23:14 2007
-#
-# TARGET_alpha is not set
-TARGET_arm=y
-# TARGET_bfin is not set
-# TARGET_cris is not set
-# TARGET_e1 is not set
-# TARGET_frv is not set
-# TARGET_h8300 is not set
-# TARGET_hppa is not set
-# TARGET_i386 is not set
-# TARGET_i960 is not set
-# TARGET_ia64 is not set
-# TARGET_m68k is not set
-# TARGET_microblaze is not set
-# TARGET_mips is not set
-# TARGET_nios is not set
-# TARGET_nios2 is not set
-# TARGET_powerpc is not set
-# TARGET_sh is not set
-# TARGET_sh64 is not set
-# TARGET_sparc is not set
-# TARGET_v850 is not set
-# TARGET_vax is not set
-# TARGET_x86_64 is not set
-
-#
-# Target Architecture Features and Options
-#
-TARGET_ARCH="arm"
-FORCE_OPTIONS_FOR_ARCH=y
-# CONFIG_ARM_OABI is not set
-CONFIG_ARM_EABI=y
-USE_BX=y
-# CONFIG_GENERIC_ARM is not set
-# CONFIG_ARM610 is not set
-# CONFIG_ARM710 is not set
-# CONFIG_ARM7TDMI is not set
-# CONFIG_ARM720T is not set
-CONFIG_ARM920T=y
-# CONFIG_ARM922T is not set
-# CONFIG_ARM926T is not set
-# CONFIG_ARM10T is not set
-# CONFIG_ARM1136JF_S is not set
-# CONFIG_ARM1176JZ_S is not set
-# CONFIG_ARM1176JZF_S is not set
-# CONFIG_ARM_SA110 is not set
-# CONFIG_ARM_SA1100 is not set
-# CONFIG_ARM_XSCALE is not set
-# CONFIG_ARM_IWMMXT is not set
-TARGET_SUBARCH=""
-
-#
-# Using ELF file format
-#
-ARCH_ANY_ENDIAN=y
-ARCH_LITTLE_ENDIAN=y
-# ARCH_WANTS_BIG_ENDIAN is not set
-ARCH_WANTS_LITTLE_ENDIAN=y
-ARCH_HAS_MMU=y
-ARCH_USE_MMU=y
-UCLIBC_HAS_FLOATS=y
-# UCLIBC_HAS_FPU is not set
-UCLIBC_HAS_SOFT_FLOAT=y
-KERNEL_HEADERS="/usr/include"
-HAVE_DOT_CONFIG=y
-
diff --git a/meta/recipes-core/uclibc/uclibc-0.9.30.1/uClibc.machine.armv5te b/meta/recipes-core/uclibc/uclibc-0.9.30.1/uClibc.machine.armv5te
deleted file mode 100644
index ec0385b..0000000
--- a/meta/recipes-core/uclibc/uclibc-0.9.30.1/uClibc.machine.armv5te
+++ /dev/null
@@ -1,70 +0,0 @@
-#
-# Automatically generated make config: don't edit
-# Sun May 13 11:16:02 2007
-#
-# TARGET_alpha is not set
-TARGET_arm=y
-# TARGET_bfin is not set
-# TARGET_cris is not set
-# TARGET_e1 is not set
-# TARGET_frv is not set
-# TARGET_h8300 is not set
-# TARGET_hppa is not set
-# TARGET_i386 is not set
-# TARGET_i960 is not set
-# TARGET_ia64 is not set
-# TARGET_m68k is not set
-# TARGET_microblaze is not set
-# TARGET_mips is not set
-# TARGET_nios is not set
-# TARGET_nios2 is not set
-# TARGET_powerpc is not set
-# TARGET_sh is not set
-# TARGET_sh64 is not set
-# TARGET_sparc is not set
-# TARGET_v850 is not set
-# TARGET_vax is not set
-# TARGET_x86_64 is not set
-
-#
-# Target Architecture Features and Options
-#
-TARGET_ARCH="arm"
-FORCE_OPTIONS_FOR_ARCH=y
-# CONFIG_ARM_OABI is not set
-CONFIG_ARM_EABI=y
-USE_BX=y
-# CONFIG_GENERIC_ARM is not set
-# CONFIG_ARM610 is not set
-# CONFIG_ARM710 is not set
-# CONFIG_ARM7TDMI is not set
-# CONFIG_ARM720T is not set
-# CONFIG_ARM920T is not set
-# CONFIG_ARM922T is not set
-# CONFIG_ARM926T is not set
-# CONFIG_ARM10T is not set
-# CONFIG_ARM1136JF_S is not set
-# CONFIG_ARM1176JZ_S is not set
-# CONFIG_ARM1176JZF_S is not set
-# CONFIG_ARM_SA110 is not set
-# CONFIG_ARM_SA1100 is not set
-CONFIG_ARM_XSCALE=y
-# CONFIG_ARM_IWMMXT is not set
-TARGET_SUBARCH=""
-
-#
-# Using ELF file format
-#
-ARCH_ANY_ENDIAN=y
-ARCH_LITTLE_ENDIAN=y
-# ARCH_WANTS_BIG_ENDIAN is not set
-ARCH_WANTS_LITTLE_ENDIAN=y
-ARCH_HAS_MMU=y
-ARCH_USE_MMU=y
-UCLIBC_HAS_FLOATS=y
-# UCLIBC_HAS_FPU is not set
-UCLIBC_HAS_SOFT_FLOAT=y
-DO_C99_MATH=y
-KERNEL_HEADERS="/data/build/koen/OE/build/tmp/angstrom/cross/arm-angstrom-linux-uclibcgnueabi/include"
-HAVE_DOT_CONFIG=y
-
diff --git a/meta/recipes-core/uclibc/uclibc-0.9.30.1/uClibc.machine.strongarm b/meta/recipes-core/uclibc/uclibc-0.9.30.1/uClibc.machine.strongarm
deleted file mode 100644
index 6e89444..0000000
--- a/meta/recipes-core/uclibc/uclibc-0.9.30.1/uClibc.machine.strongarm
+++ /dev/null
@@ -1,70 +0,0 @@
-#
-# Automatically generated make config: don't edit
-# Sun May 13 11:29:51 2007
-#
-# TARGET_alpha is not set
-TARGET_arm=y
-# TARGET_bfin is not set
-# TARGET_cris is not set
-# TARGET_e1 is not set
-# TARGET_frv is not set
-# TARGET_h8300 is not set
-# TARGET_hppa is not set
-# TARGET_i386 is not set
-# TARGET_i960 is not set
-# TARGET_ia64 is not set
-# TARGET_m68k is not set
-# TARGET_microblaze is not set
-# TARGET_mips is not set
-# TARGET_nios is not set
-# TARGET_nios2 is not set
-# TARGET_powerpc is not set
-# TARGET_sh is not set
-# TARGET_sh64 is not set
-# TARGET_sparc is not set
-# TARGET_v850 is not set
-# TARGET_vax is not set
-# TARGET_x86_64 is not set
-
-#
-# Target Architecture Features and Options
-#
-TARGET_ARCH="arm"
-FORCE_OPTIONS_FOR_ARCH=y
-CONFIG_ARM_OABI=y
-# CONFIG_ARM_EABI is not set
-# USE_BX is not set
-# CONFIG_GENERIC_ARM is not set
-# CONFIG_ARM610 is not set
-# CONFIG_ARM710 is not set
-# CONFIG_ARM7TDMI is not set
-# CONFIG_ARM720T is not set
-# CONFIG_ARM920T is not set
-# CONFIG_ARM922T is not set
-# CONFIG_ARM926T is not set
-# CONFIG_ARM10T is not set
-# CONFIG_ARM1136JF_S is not set
-# CONFIG_ARM1176JZ_S is not set
-# CONFIG_ARM1176JZF_S is not set
-# CONFIG_ARM_SA110 is not set
-CONFIG_ARM_SA1100=y
-# CONFIG_ARM_XSCALE is not set
-# CONFIG_ARM_IWMMXT is not set
-TARGET_SUBARCH=""
-
-#
-# Using ELF file format
-#
-ARCH_ANY_ENDIAN=y
-ARCH_LITTLE_ENDIAN=y
-# ARCH_WANTS_BIG_ENDIAN is not set
-ARCH_WANTS_LITTLE_ENDIAN=y
-ARCH_HAS_MMU=y
-ARCH_USE_MMU=y
-UCLIBC_HAS_FLOATS=y
-# UCLIBC_HAS_FPU is not set
-UCLIBC_HAS_SOFT_FLOAT=y
-DO_C99_MATH=y
-KERNEL_HEADERS="/usr/include"
-HAVE_DOT_CONFIG=y
-
diff --git a/meta/recipes-core/uclibc/uclibc-0.9.30.1/uclibc-c99-ldbl-math.patch b/meta/recipes-core/uclibc/uclibc-0.9.30.1/uclibc-c99-ldbl-math.patch
deleted file mode 100644
index f371843..0000000
--- a/meta/recipes-core/uclibc/uclibc-0.9.30.1/uclibc-c99-ldbl-math.patch
+++ /dev/null
@@ -1,474 +0,0 @@
-Index: uClibc-0.9.30.1/libm/ldouble_wrappers.c
-===================================================================
---- uClibc-0.9.30.1/libm/ldouble_wrappers.c	(revision 25552)
-+++ uClibc-0.9.30.1/libm/ldouble_wrappers.c	(working copy)
-@@ -13,6 +13,16 @@
- #include "math.h"
- #include <complex.h>
- 
-+#if defined __NO_LONG_DOUBLE_MATH
-+# define int_WRAPPER_C99(func) /* not needed */
-+# else
-+# define int_WRAPPER_C99(func) \
-+int func##l(long double x) \
-+{ \
-+    return func((double) x); \
-+} \
-+libm_hidden_def(func##l)
-+#endif
- 
- /* Implement the following, as defined by SuSv3 */
- #if 0
-@@ -543,46 +553,28 @@ long double truncl (long double x)
- #endif
- 
- 
--#ifdef __DO_C99_MATH__
-+#if defined __DO_C99_MATH__
- 
- #ifdef L_fpclassifyl
--int __fpclassifyl (long double x)
--{
--	return __fpclassify ( (double) x );
--}
--libm_hidden_def(__fpclassifyl)
-+int_WRAPPER_C99(__fpclassify)
- #endif
- 
- #ifdef L_finitel
--int __finitel (long double x)
--{
--	return __finite ( (double)x );
--}
--libm_hidden_def(__finitel)
-+int_WRAPPER_C99(__finite)
- #endif
- 
- #ifdef L_signbitl
--int __signbitl (long double x)
--{
--	return __signbitl ( (double)x );
--}
--libm_hidden_def(__signbitl)
-+int_WRAPPER_C99(__signbit)
- #endif
- 
- #ifdef L_isnanl
--int __isnanl (long double x)
--{
--	return __isnan ( (double)x );
--}
--libm_hidden_def(__isnanl)
-+int_WRAPPER_C99(__isnan)
- #endif
- 
- #ifdef L_isinfl
--int __isinfl (long double x)
--{
--	return __isinf ( (double)x );
--}
--libm_hidden_def(__isinfl)
-+int_WRAPPER_C99(__isinf)
- #endif
- 
--#endif
-+#endif /* DO_C99_MATH */
-+
-+#undef int_WRAPPER_C99
-Index: uClibc-0.9.30.1/libm/nan.c
-===================================================================
---- uClibc-0.9.30.1/libm/nan.c	(revision 25552)
-+++ uClibc-0.9.30.1/libm/nan.c	(working copy)
-@@ -45,7 +45,7 @@ float nanf (const char *tagp)
- }
- libm_hidden_def(nanf)
- 
--#if defined __UCLIBC_HAS_LONG_DOUBLE_MATH__
-+#if defined __UCLIBC_HAS_LONG_DOUBLE_MATH__ && !defined __NO_LONG_DOUBLE_MATH
- libm_hidden_proto(nanl)
- long double nanl (const char *tagp)
- {
-Index: uClibc-0.9.30.1/include/math.h
-===================================================================
---- uClibc-0.9.30.1/include/math.h	(revision 25552)
-+++ uClibc-0.9.30.1/include/math.h	(working copy)
-@@ -118,7 +118,7 @@ __BEGIN_DECLS
- # undef	__MATH_PRECNAME
- 
- # if (__STDC__ - 0 || __GNUC__ - 0) \
--     && (defined __UCLIBC_HAS_LONG_DOUBLE_MATH__ || defined __LDBL_COMPAT)
-+     && (!defined __NO_LONG_DOUBLE_MATH || defined __LDBL_COMPAT)
- #  ifdef __LDBL_COMPAT
- 
- #   ifdef __USE_ISOC99
-@@ -230,7 +230,7 @@ enum
-   };
- 
- /* Return number of classification appropriate for X.  */
--# ifndef __UCLIBC_HAS_LONG_DOUBLE_MATH__
-+# ifdef __NO_LONG_DOUBLE_MATH
- #  define fpclassify(x) \
-      (sizeof (x) == sizeof (float) ? __fpclassifyf (x) : __fpclassify (x))
- # else
-@@ -242,7 +242,7 @@ enum
- # endif
- 
- /* Return nonzero value if sign of X is negative.  */
--# ifndef __UCLIBC_HAS_LONG_DOUBLE_MATH__
-+# ifdef __NO_LONG_DOUBLE_MATH
- #  define signbit(x) \
-      (sizeof (x) == sizeof (float) ? __signbitf (x) : __signbit (x))
- # else
-@@ -254,7 +254,7 @@ enum
- # endif
- 
- /* Return nonzero value if X is not +-Inf or NaN.  */
--# ifndef __UCLIBC_HAS_LONG_DOUBLE_MATH__
-+# ifdef __NO_LONG_DOUBLE_MATH
- #  define isfinite(x) \
-      (sizeof (x) == sizeof (float) ? __finitef (x) : __finite (x))
- # else
-@@ -270,7 +270,7 @@ enum
- 
- /* Return nonzero value if X is a NaN.  We could use `fpclassify' but
-    we already have this functions `__isnan' and it is faster.  */
--# ifndef __UCLIBC_HAS_LONG_DOUBLE_MATH__
-+# ifdef __NO_LONG_DOUBLE_MATH
- #  define isnan(x) \
-      (sizeof (x) == sizeof (float) ? __isnanf (x) : __isnan (x))
- # else
-@@ -282,7 +282,7 @@ enum
- # endif
- 
- /* Return nonzero value is X is positive or negative infinity.  */
--# ifndef __UCLIBC_HAS_LONG_DOUBLE_MATH__
-+# ifdef __NO_LONG_DOUBLE_MATH
- #  define isinf(x) \
-      (sizeof (x) == sizeof (float) ? __isinff (x) : __isinf (x))
- # else
-Index: uClibc-0.9.30.1/include/tgmath.h
-===================================================================
---- uClibc-0.9.30.1/include/tgmath.h	(revision 25552)
-+++ uClibc-0.9.30.1/include/tgmath.h	(working copy)
-@@ -36,7 +36,7 @@
- 
- #if __GNUC_PREREQ (2, 7)
- 
--# ifndef __UCLIBC_HAS_LONG_DOUBLE_MATH__
-+# ifdef __NO_LONG_DOUBLE_MATH
- #  define __tgml(fct) fct
- # else
- #  define __tgml(fct) fct ## l
-Index: uClibc-0.9.30.1/libc/sysdeps/linux/powerpc/bits/wordsize.h
-===================================================================
---- uClibc-0.9.30.1/libc/sysdeps/linux/powerpc/bits/wordsize.h	(revision 25552)
-+++ uClibc-0.9.30.1/libc/sysdeps/linux/powerpc/bits/wordsize.h	(working copy)
-@@ -7,13 +7,13 @@
- # define __WORDSIZE	32
- #endif
- 
--#if defined __UCLIBC_HAS_LONG_DOUBLE_MATH__ && !defined __LONG_DOUBLE_MATH_OPTIONAL
-+#if !defined __NO_LONG_DOUBLE_MATH && !defined __LONG_DOUBLE_MATH_OPTIONAL
- 
- /* Signal the glibc ABI didn't used to have a `long double'.
-    The changes all the `long double' function variants to be redirects
-    to the double functions.  */
- # define __LONG_DOUBLE_MATH_OPTIONAL   1
- # ifndef __LONG_DOUBLE_128__
--#  undef __UCLIBC_HAS_LONG_DOUBLE_MATH__
-+#  define __NO_LONG_DOUBLE_MATH        1
- # endif
- #endif
-Index: uClibc-0.9.30.1/libc/sysdeps/linux/powerpc/bits/mathdef.h
-===================================================================
---- uClibc-0.9.30.1/libc/sysdeps/linux/powerpc/bits/mathdef.h	(revision 25552)
-+++ uClibc-0.9.30.1/libc/sysdeps/linux/powerpc/bits/mathdef.h	(working copy)
-@@ -65,11 +65,13 @@ typedef double double_t;
- 
- #endif	/* ISO C99 */
- 
--#ifdef __UCLIBC_HAS_LONG_DOUBLE_MATH__
-+#ifndef __NO_LONG_DOUBLE_MATH
- #include <bits/wordsize.h>
- /* Signal that we do not really have a `long double'.  The disables the
-    declaration of all the `long double' function variants.  */
- # if __WORDSIZE == 32
--#  undef __UCLIBC_HAS_LONG_DOUBLE_MATH__
-+#  define __NO_LONG_DOUBLE_MATH	1
-+# elif !defined __UCLIBC_HAS_LONG_DOUBLE_MATH__
-+#  define __NO_LONG_DOUBLE_MATH	1
- # endif  /* __WORDSIZE == 32 */
--#endif  /* __UCLIBC_HAS_LONG_DOUBLE_MATH__ */
-+#endif  /* __NO_LONG_DOUBLE_MATH */
-Index: uClibc-0.9.30.1/libc/sysdeps/linux/arm/bits/mathdef.h
-===================================================================
---- uClibc-0.9.30.1/libc/sysdeps/linux/arm/bits/mathdef.h	(revision 25552)
-+++ uClibc-0.9.30.1/libc/sysdeps/linux/arm/bits/mathdef.h	(working copy)
-@@ -34,3 +34,11 @@ typedef double double_t;	/* `double' exp
- # define FP_ILOGBNAN	(2147483647)
- 
- #endif	/* ISO C99 */
-+
-+#ifndef __NO_LONG_DOUBLE_MATH
-+/* Signal that we do not really have a `long double'.  This disables the
-+   declaration of all the `long double' function variants.  */
-+/* XXX The FPA does support this but the patterns in GCC are currently
-+   turned off.  */
-+# define __NO_LONG_DOUBLE_MATH	1
-+#endif
-Index: uClibc-0.9.30.1/libc/sysdeps/linux/m68k/bits/mathdef.h
-===================================================================
---- uClibc-0.9.30.1/libc/sysdeps/linux/m68k/bits/mathdef.h	(revision 25552)
-+++ uClibc-0.9.30.1/libc/sysdeps/linux/m68k/bits/mathdef.h	(working copy)
-@@ -36,3 +36,7 @@ typedef long double double_t;	/* `double
- # define FP_ILOGBNAN	(2147483647)
- 
- #endif	/* ISO C99 */
-+
-+#if !defined __NO_LONG_DOUBLE_MATH && !defined __UCLIBC_HAS_LONG_DOUBLE_MATH__
-+# define __NO_LONG_DOUBLE_MATH	1
-+#endif
-Index: uClibc-0.9.30.1/libc/sysdeps/linux/alpha/bits/wordsize.h
-===================================================================
---- uClibc-0.9.30.1/libc/sysdeps/linux/alpha/bits/wordsize.h	(revision 25552)
-+++ uClibc-0.9.30.1/libc/sysdeps/linux/alpha/bits/wordsize.h	(working copy)
-@@ -18,13 +18,13 @@
- 
- #define __WORDSIZE	64
- 
--#if defined __UCLIBC_HAS_LONG_DOUBLE_MATH__ && !defined __LONG_DOUBLE_MATH_OPTIONAL
-+#if !defined __NO_LONG_DOUBLE_MATH && !defined __LONG_DOUBLE_MATH_OPTIONAL
- 
- /* Signal that we didn't used to have a `long double'. The changes all
-    the `long double' function variants to be redirects to the double
-    functions.  */
- # define __LONG_DOUBLE_MATH_OPTIONAL	1
- # ifndef __LONG_DOUBLE_128__
--#  undef __UCLIBC_HAS_LONG_DOUBLE_MATH__
-+#  define __NO_LONG_DOUBLE_MATH		1
- # endif
- #endif
-Index: uClibc-0.9.30.1/libc/sysdeps/linux/alpha/bits/mathdef.h
-===================================================================
---- uClibc-0.9.30.1/libc/sysdeps/linux/alpha/bits/mathdef.h	(revision 25552)
-+++ uClibc-0.9.30.1/libc/sysdeps/linux/alpha/bits/mathdef.h	(working copy)
-@@ -78,3 +78,7 @@ typedef double double_t;
- 
- # endif /* GNUC before 3.4 */
- #endif /* COMPLEX_H */
-+
-+#if !defined __NO_LONG_DOUBLE_MATH && !defined __UCLIBC_HAS_LONG_DOUBLE_MATH__
-+# define __NO_LONG_DOUBLE_MATH	1
-+#endif
-Index: uClibc-0.9.30.1/libc/sysdeps/linux/common/bits/mathdef.h
-===================================================================
---- uClibc-0.9.30.1/libc/sysdeps/linux/common/bits/mathdef.h	(revision 25552)
-+++ uClibc-0.9.30.1/libc/sysdeps/linux/common/bits/mathdef.h	(working copy)
-@@ -35,3 +35,9 @@ typedef double double_t;	/* `double' exp
- # define FP_ILOGBNAN	2147483647
- 
- #endif	/* ISO C99 */
-+
-+#ifndef __NO_LONG_DOUBLE_MATH
-+/* Signal that we do not really have a `long double'.  The disables the
-+   declaration of all the `long double' function variants.  */
-+# define __NO_LONG_DOUBLE_MATH	1
-+#endif
-Index: uClibc-0.9.30.1/libc/sysdeps/linux/i386/bits/mathdef.h
-===================================================================
---- uClibc-0.9.30.1/libc/sysdeps/linux/i386/bits/mathdef.h	(revision 25552)
-+++ uClibc-0.9.30.1/libc/sysdeps/linux/i386/bits/mathdef.h	(working copy)
-@@ -44,3 +44,7 @@ typedef long double double_t;	/* `double
- # define FP_ILOGBNAN	(-2147483647 - 1)
- 
- #endif	/* ISO C99 */
-+
-+#if !defined __NO_LONG_DOUBLE_MATH && !defined __UCLIBC_HAS_LONG_DOUBLE_MATH__
-+# define __NO_LONG_DOUBLE_MATH	1
-+#endif
-Index: uClibc-0.9.30.1/libc/sysdeps/linux/nios2/bits/mathdef.h
-===================================================================
---- uClibc-0.9.30.1/libc/sysdeps/linux/nios2/bits/mathdef.h	(revision 25552)
-+++ uClibc-0.9.30.1/libc/sysdeps/linux/nios2/bits/mathdef.h	(working copy)
-@@ -34,3 +34,11 @@ typedef double double_t;	/* `double' exp
- # define FP_ILOGBNAN	(2147483647)
- 
- #endif	/* ISO C99 */
-+
-+#ifndef __NO_LONG_DOUBLE_MATH
-+/* Signal that we do not really have a `long double'.  This disables the
-+   declaration of all the `long double' function variants.  */
-+/* XXX The FPA does support this but the patterns in GCC are currently
-+   turned off.  */
-+# define __NO_LONG_DOUBLE_MATH	1
-+#endif
-Index: uClibc-0.9.30.1/libc/sysdeps/linux/x86_64/bits/mathdef.h
-===================================================================
---- uClibc-0.9.30.1/libc/sysdeps/linux/x86_64/bits/mathdef.h	(revision 25552)
-+++ uClibc-0.9.30.1/libc/sysdeps/linux/x86_64/bits/mathdef.h	(working copy)
-@@ -46,3 +46,7 @@ typedef long double double_t;	/* `double
- # define FP_ILOGBNAN	(-2147483647 - 1)
- 
- #endif	/* ISO C99 */
-+
-+#if !defined __NO_LONG_DOUBLE_MATH && !defined __UCLIBC_HAS_LONG_DOUBLE_MATH__
-+# define __NO_LONG_DOUBLE_MATH	1
-+#endif
-Index: uClibc-0.9.30.1/libc/sysdeps/linux/xtensa/bits/mathdef.h
-===================================================================
---- uClibc-0.9.30.1/libc/sysdeps/linux/xtensa/bits/mathdef.h	(revision 25552)
-+++ uClibc-0.9.30.1/libc/sysdeps/linux/xtensa/bits/mathdef.h	(working copy)
-@@ -36,8 +36,8 @@ typedef double double_t;	/* `double' exp
- 
- #endif	/* ISO C99 */
- 
--#if defined __UCLIBC_HAS_LONG_DOUBLE_MATH__
-+#ifndef __NO_LONG_DOUBLE_MATH
- /* Signal that we do not really have a `long double'.  The disables the
-    declaration of all the `long double' function variants.  */
--# undef __UCLIBC_HAS_LONG_DOUBLE_MATH__
-+# define __NO_LONG_DOUBLE_MATH	1
- #endif
-Index: uClibc-0.9.30.1/libc/sysdeps/linux/ia64/bits/mathdef.h
-===================================================================
---- uClibc-0.9.30.1/libc/sysdeps/linux/ia64/bits/mathdef.h	(revision 25552)
-+++ uClibc-0.9.30.1/libc/sysdeps/linux/ia64/bits/mathdef.h	(working copy)
-@@ -35,3 +35,7 @@ typedef double double_t;	/* `double' exp
- # define FP_ILOGBNAN	2147483647
- 
- #endif	/* ISO C99 */
-+
-+#if !defined __NO_LONG_DOUBLE_MATH && !defined __UCLIBC_HAS_LONG_DOUBLE_MATH__
-+# define __NO_LONG_DOUBLE_MATH	1
-+#endif
-Index: uClibc-0.9.30.1/libc/sysdeps/linux/mips/bits/mathdef.h
-===================================================================
---- uClibc-0.9.30.1/libc/sysdeps/linux/mips/bits/mathdef.h	(revision 25552)
-+++ uClibc-0.9.30.1/libc/sysdeps/linux/mips/bits/mathdef.h	(working copy)
-@@ -39,8 +39,10 @@ typedef double double_t;	/* `double' exp
- 
- #endif	/* ISO C99 */
- 
--#if defined __UCLIBC_HAS_LONG_DOUBLE_MATH__ && _MIPS_SIM == _ABIO32
-+#if ! defined __NO_LONG_DOUBLE_MATH && _MIPS_SIM == _ABIO32
- /* Signal that we do not really have a `long double'.  This disables the
-    declaration of all the `long double' function variants.  */
--# error defined __UCLIBC_HAS_LONG_DOUBLE_MATH__ and _MIPS_SIM == _ABIO32
-+# define __NO_LONG_DOUBLE_MATH	1
-+#elif !defined __NO_LONG_DOUBLE_MATH && !defined __UCLIBC_HAS_LONG_DOUBLE_MATH__
-+# define __NO_LONG_DOUBLE_MATH	1
- #endif
-Index: uClibc-0.9.30.1/libc/sysdeps/linux/nios/bits/mathdef.h
-===================================================================
---- uClibc-0.9.30.1/libc/sysdeps/linux/nios/bits/mathdef.h	(revision 25552)
-+++ uClibc-0.9.30.1/libc/sysdeps/linux/nios/bits/mathdef.h	(working copy)
-@@ -34,3 +34,11 @@ typedef double double_t;	/* `double' exp
- # define FP_ILOGBNAN	(2147483647)
- 
- #endif	/* ISO C99 */
-+
-+#ifndef __NO_LONG_DOUBLE_MATH
-+/* Signal that we do not really have a `long double'.  This disables the
-+   declaration of all the `long double' function variants.  */
-+/* XXX The FPA does support this but the patterns in GCC are currently
-+   turned off.  */
-+# define __NO_LONG_DOUBLE_MATH	1
-+#endif
-Index: uClibc-0.9.30.1/libc/sysdeps/linux/sparc/bits/wordsize.h
-===================================================================
---- uClibc-0.9.30.1/libc/sysdeps/linux/sparc/bits/wordsize.h	(revision 25552)
-+++ uClibc-0.9.30.1/libc/sysdeps/linux/sparc/bits/wordsize.h	(working copy)
-@@ -6,7 +6,7 @@
- # define __WORDSIZE	32
- #endif
- 
--#if 0 /* uClibc: done in mathdefs.h: defined __UCLIBC_HAS_LONG_DOUBLE_MATH__ && !defined __LONG_DOUBLE_MATH_OPTIONAL*/
-+#if 0 /* uClibc: done in mathdefs.h: !defined __NO_LONG_DOUBLE_MATH && !defined __LONG_DOUBLE_MATH_OPTIONAL*/
- 
- # if __WORDSIZE == 32
- /* Signal that in 32bit ABI we didn't used to have a `long double'.
-@@ -14,7 +14,7 @@
-    to the double functions.  */
- #  define __LONG_DOUBLE_MATH_OPTIONAL   1
- #  ifndef __LONG_DOUBLE_128__
--#   undef __UCLIBC_HAS_LONG_DOUBLE_MATH__
-+#   define __NO_LONG_DOUBLE_MATH        1
- #  endif
- # endif
- #endif
-Index: uClibc-0.9.30.1/libc/sysdeps/linux/sparc/bits/mathdef.h
-===================================================================
---- uClibc-0.9.30.1/libc/sysdeps/linux/sparc/bits/mathdef.h	(revision 25552)
-+++ uClibc-0.9.30.1/libc/sysdeps/linux/sparc/bits/mathdef.h	(working copy)
-@@ -57,13 +57,15 @@ typedef double double_t;
- 
- #endif	/* ISO C99 */
- 
--#ifdef __UCLIBC_HAS_LONG_DOUBLE_MATH__
-+#ifndef __NO_LONG_DOUBLE_MATH
- 
- # if __WORDSIZE == 32
- /* Signal that in 32bit ABI we do not really have a `long double'.
-    The disables the declaration of all the `long double' function
-    variants.  */
--#  undef __UCLIBC_HAS_LONG_DOUBLE_MATH__
-+#  define __NO_LONG_DOUBLE_MATH	1
-+# elif !defined __UCLIBC_HAS_LONG_DOUBLE_MATH__
-+#  define __NO_LONG_DOUBLE_MATH	1
- # endif
- 
- #endif
-Index: uClibc-0.9.30.1/libc/sysdeps/linux/sparc/bits/mathinline.h
-===================================================================
---- uClibc-0.9.30.1/libc/sysdeps/linux/sparc/bits/mathinline.h	(revision 25552)
-+++ uClibc-0.9.30.1/libc/sysdeps/linux/sparc/bits/mathinline.h	(working copy)
-@@ -37,7 +37,7 @@
- 
- # if __WORDSIZE == 32
- 
--#  ifdef __UCLIBC_HAS_LONG_DOUBLE_MATH__
-+#  ifndef __NO_LONG_DOUBLE_MATH
- 
- #   define __unordered_cmp(x, y) \
-   (__extension__							      \
-@@ -157,7 +157,7 @@ __NTH (__signbit (double __x))
-   return __u.__i[0] < 0;
- }
- 
--#    ifdef __UCLIBC_HAS_LONG_DOUBLE_MATH__
-+#    ifndef __NO_LONG_DOUBLE_MATH
- __MATH_INLINE int
- __NTH (__signbitl (long double __x))
- {
-@@ -219,7 +219,7 @@ __NTH (sqrtl (long double __x))
-   _Qp_sqrt (&__r, &__x);
-   return __r;
- }
--#   elif defined __UCLIBC_HAS_LONG_DOUBLE_MATH__
-+#   elif !defined __NO_LONG_DOUBLE_MATH
- __MATH_INLINE long double
- sqrtl (long double __x) __THROW
- {
-@@ -257,7 +257,7 @@ __ieee754_sqrtl (long double __x)
-   _Qp_sqrt(&__r, &__x);
-   return __r;
- }
--#   elif defined __UCLIBC_HAS_LONG_DOUBLE_MATH__
-+#   elif !defined __NO_LONG_DOUBLE_MATH
- __MATH_INLINE long double
- __ieee754_sqrtl (long double __x)
- {
-Index: uClibc-0.9.30.1/libc/sysdeps/linux/sh/bits/mathdef.h
-===================================================================
---- uClibc-0.9.30.1/libc/sysdeps/linux/sh/bits/mathdef.h	(revision 25552)
-+++ uClibc-0.9.30.1/libc/sysdeps/linux/sh/bits/mathdef.h	(working copy)
-@@ -61,3 +61,9 @@ typedef double double_t;
- # define FP_ILOGBNAN	0x7fffffff
- 
- #endif	/* ISO C99 */
-+
-+#ifndef __NO_LONG_DOUBLE_MATH
-+/* Signal that we do not really have a `long double'.  The disables the
-+   declaration of all the `long double' function variants.  */
-+# define __NO_LONG_DOUBLE_MATH	1
-+#endif
diff --git a/meta/recipes-core/uclibc/uclibc-0.9.30.1/uclibc_ldso_use_O0.patch b/meta/recipes-core/uclibc/uclibc-0.9.30.1/uclibc_ldso_use_O0.patch
deleted file mode 100644
index 7a89e66..0000000
--- a/meta/recipes-core/uclibc/uclibc-0.9.30.1/uclibc_ldso_use_O0.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: uClibc/ldso/ldso/Makefile.in
-===================================================================
---- uClibc.orig/ldso/ldso/Makefile.in	2009-02-03 17:27:55.000000000 -0800
-+++ uClibc/ldso/ldso/Makefile.in	2009-02-03 17:28:11.000000000 -0800
-@@ -8,7 +8,7 @@
- CFLAGS-ldso := -DNOT_IN_libc -DIS_IN_rtld $(SSP_DISABLE_FLAGS)
- 
- # This stuff will not work with -fomit-frame-pointer
--CFLAGS-ldso += -fno-omit-frame-pointer
-+CFLAGS-ldso += -O0 -fno-omit-frame-pointer
- 
- CFLAGS-ldso += -I$(top_srcdir)ldso/ldso/$(TARGET_ARCH) -I$(top_srcdir)ldso/include -I$(top_srcdir)ldso/ldso
- CFLAGS-ldso += -DUCLIBC_RUNTIME_PREFIX=\"$(RUNTIME_PREFIX)\" -DUCLIBC_LDSO=\"$(UCLIBC_LDSO)\"
diff --git a/meta/recipes-core/uclibc/uclibc-config.inc b/meta/recipes-core/uclibc/uclibc-config.inc
new file mode 100644
index 0000000..3679c10
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-config.inc
@@ -0,0 +1,116 @@
+#
+# Set the ARCH environment variable for uClibc compilation.
+# Return value must match one of the architectures known to uClibc:
+# libc/sysdeps/*/*
+#
+
+valid_archs = "\
+alpha \
+arm \
+avr32 \
+bfin \
+cris \
+e1 \
+frv \
+h8300 \
+hppa \
+i386 \
+i960 \
+ia64 \
+m68k \
+microblaze \
+mips \
+nios \
+nios2 \
+powerpc \
+sh \
+sh64 \
+sparc \
+v850 \
+vax \
+x86_64 \
+xtensa \
+"
+def map_uclibc_arch(a, d):
+	"""Return the uClibc architecture for the given TARGET_ARCH."""
+	import re
+
+	valid_archs = bb.data.getVar('valid_archs', d, 1).split()
+
+	if   re.match('^(arm|sa110).*', a):	return 'arm'
+	elif re.match('^(i.86|athlon)$', a):	return 'i386'
+	elif re.match('^mips.*', a):		return 'mips'
+	elif re.match('^parisc.*', a):		return 'hppa'
+	elif re.match('^ppc.*', a):		return 'powerpc'
+	elif re.match('^s390.*', a):		return 's390'
+	elif re.match('^sh.*', a):		return 'sh'
+	elif re.match('^(sun|sparc).*', a):	return 'sparc'
+	elif re.match('^xtensa.*', a):		return 'xtensa'
+        elif a in valid_archs:			return a
+	else:
+		bb.error("cannot map '%s' to a uClibc architecture" % a)
+
+export UCLIBC_ARCH = "${@map_uclibc_arch(bb.data.getVar('TARGET_ARCH', d, 1), d)}"
+
+def map_uclibc_abi(o, d):
+	"""Return the uClibc ABI for the given TARGET_OS."""
+	import re
+
+	arch = bb.data.getVar('TARGET_ARCH', d, 1)
+	if   map_uclibc_arch(bb.data.getVar('TARGET_ARCH', d, 1), d) == "arm":
+		if re.match('.*eabi$', o): return 'ARM_EABI'
+		else:                    return 'ARM_OABI'
+	# FIXME: This is inaccurate! Handle o32, n32, n64
+	elif re.match('^mips.*64$', arch):  return 'MIPS_N64_ABI'
+	elif re.match('^mips.*', arch):    return 'MIPS_O32_ABI'
+	return ""
+
+export UCLIBC_ABI = "${@map_uclibc_abi(bb.data.getVar('TARGET_OS', d, 1), d)}"
+
+def map_uclibc_endian(a, d):
+	"""Return the uClibc endianess for the given TARGET_ARCH."""
+	import re
+
+	# Always BE
+	if re.match('^(avr32|e1|frv|(parisc|hppa)|m68k|microblaze|powerpc.*|(sparc|sun).*)$', a):
+		return 'BIG'
+	# Possibly BE
+	elif re.match('^((arm|sa110|arm.*eb)|h8300.*eb|(parisc|hppa).*eb|mips|sh.*eb|xtensa.*eb)$', a):
+		return 'BIG'
+	return 'LITTLE'
+
+export UCLIBC_ENDIAN = "${@map_uclibc_endian(bb.data.getVar('TARGET_ARCH', d, 1), d)}"
+
+# internal helper
+def uclibc_cfg(feature, features, tokens, cnf, rem):
+	if type(tokens) == type(""):
+		tokens = [tokens]
+	rem.extend(['/^[# ]*' + token + '[ =]/d' for token in tokens])
+	if type(features) == type([]) and feature in features:
+		cnf.extend([token + '=y' for token in tokens])
+	else:
+		cnf.extend(['# ' + token + ' is not set' for token in tokens])
+
+# Map distro and machine features to config settings
+def features_to_uclibc_settings(d):
+	cnf, rem = ([], [])
+	distro_features = bb.data.getVar('DISTRO_FEATURES', d, True).split()
+	machine_features = bb.data.getVar('MACHINE_FEATURES', d, True).split()
+	uclibc_cfg('ipv4',      distro_features, 'UCLIBC_HAS_IPV4', cnf, rem)
+	uclibc_cfg('ipv6',      distro_features, 'UCLIBC_HAS_IPV6', cnf, rem)
+	uclibc_cfg('largefile', distro_features, 'UCLIBC_HAS_LFS', cnf, rem)
+	uclibc_cfg('nls',       distro_features, 'UCLIBC_HAS_LOCALE', cnf, rem)
+	uclibc_cfg('thumb-interwork', distro_features,'USE_BX', cnf, rem)
+	uclibc_cfg('xattr',     distro_features, 'UCLIBC_HAS_XATTR', cnf, rem)
+	uclibc_cfg('ssp',       distro_features, 'UCLIBC_HAS_SSP', cnf, rem)
+	uclibc_cfg('argp',       distro_features, 'UCLIBC_HAS_ARGP', cnf, rem)
+	uclibc_cfg('kernel24',  machine_features,'UCLIBC_LINUX_MODULE_24', cnf, rem)
+	return "\n".join(cnf), "\n".join(rem)
+# X, Y = ${@features_to_uclibc_settings(d)}
+# unfortunately doesn't seem to work with bitbake, workaround:
+def features_to_uclibc_conf(d):
+	cnf, rem = features_to_uclibc_settings(d)
+	return cnf
+def features_to_uclibc_del(d):
+	cnf, rem = features_to_uclibc_settings(d)
+	return rem
diff --git a/meta/recipes-core/uclibc/uclibc-git/argp-headers.patch b/meta/recipes-core/uclibc/uclibc-git/argp-headers.patch
new file mode 100644
index 0000000..7fd148f
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/argp-headers.patch
@@ -0,0 +1,581 @@
+Added headers file needed by argp sources.
+
+Signed-off-by: Salvatore Cro <salvatore.cro at st.com>
+---
+ include/argp.h             |  566 ++++++++++++++++++++++++++++++++++++++++++++
+ libc/argp/argp-fmtstream.h |  314 ++++++++++++++++++++++++
+ 2 files changed, 880 insertions(+), 0 deletions(-)
+ create mode 100644 include/argp.h
+ create mode 100644 libc/argp/argp-fmtstream.h
+
+Index: git/include/argp.h
+===================================================================
+--- /dev/null
++++ git/include/argp.h
+@@ -0,0 +1,566 @@
++/* Hierarchial argument parsing, layered over getopt.
++   Copyright (C) 1995-1999, 2003, 2004, 2005, 2006, 2007, 2009
++   Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++   Written by Miles Bader <miles at gnu.ai.mit.edu>.
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
++   02111-1307 USA.
++
++   Modified for uClibc by: Salvatore Cro <salvatore.cro at st.com>
++*/
++
++#ifndef _ARGP_H
++#define _ARGP_H
++
++#include <stdio.h>
++#include <ctype.h>
++#include <limits.h>
++
++#define __need_error_t
++#include <errno.h>
++
++#ifndef __const
++# define __const const
++#endif
++
++#ifndef __THROW
++# define __THROW
++#endif
++#ifndef __NTH
++# define __NTH(fct) fct __THROW
++#endif
++
++#ifndef __attribute__
++/* This feature is available in gcc versions 2.5 and later.  */
++# if __GNUC__ < 2 || (__GNUC__ == 2 && __GNUC_MINOR__ < 5) || defined(__STRICT_ANSI__)
++#  define __attribute__(Spec) /* empty */
++# endif
++/* The __-protected variants of `format' and `printf' attributes
++   are accepted by gcc versions 2.6.4 (effectively 2.7) and later.  */
++# if __GNUC__ < 2 || (__GNUC__ == 2 && __GNUC_MINOR__ < 7) || defined(__STRICT_ANSI__)
++#  define __format__ format
++#  define __printf__ printf
++# endif
++#endif
++
++/* GCC 2.95 and later have "__restrict"; C99 compilers have
++   "restrict", and "configure" may have defined "restrict".  */
++#ifndef __restrict
++# if ! (2 < __GNUC__ || (2 == __GNUC__ && 95 <= __GNUC_MINOR__))
++#  if defined restrict || 199901L <= __STDC_VERSION__
++#   define __restrict restrict
++#  else
++#   define __restrict
++#  endif
++# endif
++#endif
++
++#ifndef __error_t_defined
++typedef int error_t;
++# define __error_t_defined
++#endif
++
++#ifdef  __cplusplus
++extern "C" {
++#endif
++
++/* A description of a particular option.  A pointer to an array of
++   these is passed in the OPTIONS field of an argp structure.  Each option
++   entry can correspond to one long option and/or one short option; more
++   names for the same option can be added by following an entry in an option
++   array with options having the OPTION_ALIAS flag set.  */
++struct argp_option
++{
++  /* The long option name.  For more than one name for the same option, you
++     can use following options with the OPTION_ALIAS flag set.  */
++  __const char *name;
++
++  /* What key is returned for this option.  If > 0 and printable, then it's
++     also accepted as a short option.  */
++  int key;
++
++  /* If non-NULL, this is the name of the argument associated with this
++     option, which is required unless the OPTION_ARG_OPTIONAL flag is set. */
++  __const char *arg;
++
++  /* OPTION_ flags.  */
++  int flags;
++
++  /* The doc string for this option.  If both NAME and KEY are 0, This string
++     will be printed outdented from the normal option column, making it
++     useful as a group header (it will be the first thing printed in its
++     group); in this usage, it's conventional to end the string with a `:'.  */
++  __const char *doc;
++
++  /* The group this option is in.  In a long help message, options are sorted
++     alphabetically within each group, and the groups presented in the order
++     0, 1, 2, ..., n, -m, ..., -2, -1.  Every entry in an options array with
++     if this field 0 will inherit the group number of the previous entry, or
++     zero if it's the first one, unless its a group header (NAME and KEY both
++     0), in which case, the previous entry + 1 is the default.  Automagic
++     options such as --help are put into group -1.  */
++  int group;
++};
++
++/* The argument associated with this option is optional.  */
++#define OPTION_ARG_OPTIONAL	0x1
++
++/* This option isn't displayed in any help messages.  */
++#define OPTION_HIDDEN	       	0x2
++
++/* This option is an alias for the closest previous non-alias option.  This
++   means that it will be displayed in the same help entry, and will inherit
++   fields other than NAME and KEY from the aliased option.  */
++#define OPTION_ALIAS		0x4
++
++/* This option isn't actually an option (and so should be ignored by the
++   actual option parser), but rather an arbitrary piece of documentation that
++   should be displayed in much the same manner as the options.  If this flag
++   is set, then the option NAME field is displayed unmodified (e.g., no `--'
++   prefix is added) at the left-margin (where a *short* option would normally
++   be displayed), and the documentation string in the normal place.  For
++   purposes of sorting, any leading whitespace and punctuation is ignored,
++   except that if the first non-whitespace character is not `-', this entry
++   is displayed after all options (and OPTION_DOC entries with a leading `-')
++   in the same group.  */
++#define OPTION_DOC		0x8
++
++/* This option shouldn't be included in `long' usage messages (but is still
++   included in help messages).  This is mainly intended for options that are
++   completely documented in an argp's ARGS_DOC field, in which case including
++   the option in the generic usage list would be redundant.  For instance,
++   if ARGS_DOC is "FOO BAR\n-x BLAH", and the `-x' option's purpose is to
++   distinguish these two cases, -x should probably be marked
++   OPTION_NO_USAGE.  */
++#define OPTION_NO_USAGE		0x10
++
++struct argp;			/* fwd declare this type */
++struct argp_state;		/* " */
++struct argp_child;		/* " */
++
++/* The type of a pointer to an argp parsing function.  */
++typedef error_t (*argp_parser_t) (int __key, char *__arg,
++				  struct argp_state *__state);
++
++/* What to return for unrecognized keys.  For special ARGP_KEY_ keys, such
++   returns will simply be ignored.  For user keys, this error will be turned
++   into EINVAL (if the call to argp_parse is such that errors are propagated
++   back to the user instead of exiting); returning EINVAL itself would result
++   in an immediate stop to parsing in *all* cases.  */
++#define ARGP_ERR_UNKNOWN	E2BIG /* Hurd should never need E2BIG.  XXX */
++
++/* Special values for the KEY argument to an argument parsing function.
++   ARGP_ERR_UNKNOWN should be returned if they aren't understood.
++
++   The sequence of keys to a parsing function is either (where each
++   uppercased word should be prefixed by `ARGP_KEY_' and opt is a user key):
++
++       INIT opt... NO_ARGS END SUCCESS  -- No non-option arguments at all
++   or  INIT (opt | ARG)... END SUCCESS  -- All non-option args parsed
++   or  INIT (opt | ARG)... SUCCESS      -- Some non-option arg unrecognized
++
++   The third case is where every parser returned ARGP_KEY_UNKNOWN for an
++   argument, in which case parsing stops at that argument (returning the
++   unparsed arguments to the caller of argp_parse if requested, or stopping
++   with an error message if not).
++
++   If an error occurs (either detected by argp, or because the parsing
++   function returned an error value), then the parser is called with
++   ARGP_KEY_ERROR, and no further calls are made.  */
++
++/* This is not an option at all, but rather a command line argument.  If a
++   parser receiving this key returns success, the fact is recorded, and the
++   ARGP_KEY_NO_ARGS case won't be used.  HOWEVER, if while processing the
++   argument, a parser function decrements the NEXT field of the state it's
++   passed, the option won't be considered processed; this is to allow you to
++   actually modify the argument (perhaps into an option), and have it
++   processed again.  */
++#define ARGP_KEY_ARG		0
++/* There are remaining arguments not parsed by any parser, which may be found
++   starting at (STATE->argv + STATE->next).  If success is returned, but
++   STATE->next left untouched, it's assumed that all arguments were consume,
++   otherwise, the parser should adjust STATE->next to reflect any arguments
++   consumed.  */
++#define ARGP_KEY_ARGS		0x1000006
++/* There are no more command line arguments at all.  */
++#define ARGP_KEY_END		0x1000001
++/* Because it's common to want to do some special processing if there aren't
++   any non-option args, user parsers are called with this key if they didn't
++   successfully process any non-option arguments.  Called just before
++   ARGP_KEY_END (where more general validity checks on previously parsed
++   arguments can take place).  */
++#define ARGP_KEY_NO_ARGS	0x1000002
++/* Passed in before any parsing is done.  Afterwards, the values of each
++   element of the CHILD_INPUT field, if any, in the state structure is
++   copied to each child's state to be the initial value of the INPUT field.  */
++#define ARGP_KEY_INIT		0x1000003
++/* Use after all other keys, including SUCCESS & END.  */
++#define ARGP_KEY_FINI		0x1000007
++/* Passed in when parsing has successfully been completed (even if there are
++   still arguments remaining).  */
++#define ARGP_KEY_SUCCESS	0x1000004
++/* Passed in if an error occurs.  */
++#define ARGP_KEY_ERROR		0x1000005
++
++/* An argp structure contains a set of options declarations, a function to
++   deal with parsing one, documentation string, a possible vector of child
++   argp's, and perhaps a function to filter help output.  When actually
++   parsing options, getopt is called with the union of all the argp
++   structures chained together through their CHILD pointers, with conflicts
++   being resolved in favor of the first occurrence in the chain.  */
++struct argp
++{
++  /* An array of argp_option structures, terminated by an entry with both
++     NAME and KEY having a value of 0.  */
++  __const struct argp_option *options;
++
++  /* What to do with an option from this structure.  KEY is the key
++     associated with the option, and ARG is any associated argument (NULL if
++     none was supplied).  If KEY isn't understood, ARGP_ERR_UNKNOWN should be
++     returned.  If a non-zero, non-ARGP_ERR_UNKNOWN value is returned, then
++     parsing is stopped immediately, and that value is returned from
++     argp_parse().  For special (non-user-supplied) values of KEY, see the
++     ARGP_KEY_ definitions below.  */
++  argp_parser_t parser;
++
++  /* A string describing what other arguments are wanted by this program.  It
++     is only used by argp_usage to print the `Usage:' message.  If it
++     contains newlines, the strings separated by them are considered
++     alternative usage patterns, and printed on separate lines (lines after
++     the first are prefix by `  or: ' instead of `Usage:').  */
++  __const char *args_doc;
++
++  /* If non-NULL, a string containing extra text to be printed before and
++     after the options in a long help message (separated by a vertical tab
++     `\v' character).  */
++  __const char *doc;
++
++  /* A vector of argp_children structures, terminated by a member with a 0
++     argp field, pointing to child argps should be parsed with this one.  Any
++     conflicts are resolved in favor of this argp, or early argps in the
++     CHILDREN list.  This field is useful if you use libraries that supply
++     their own argp structure, which you want to use in conjunction with your
++     own.  */
++  __const struct argp_child *children;
++
++  /* If non-zero, this should be a function to filter the output of help
++     messages.  KEY is either a key from an option, in which case TEXT is
++     that option's help text, or a special key from the ARGP_KEY_HELP_
++     defines, below, describing which other help text TEXT is.  The function
++     should return either TEXT, if it should be used as-is, a replacement
++     string, which should be malloced, and will be freed by argp, or NULL,
++     meaning `print nothing'.  The value for TEXT is *after* any translation
++     has been done, so if any of the replacement text also needs translation,
++     that should be done by the filter function.  INPUT is either the input
++     supplied to argp_parse, or NULL, if argp_help was called directly.  */
++  char *(*help_filter) (int __key, __const char *__text, void *__input);
++
++  /* If non-zero the strings used in the argp library are translated using
++     the domain described by this string.  Otherwise the currently installed
++     default domain is used.  */
++  const char *argp_domain;
++};
++
++/* Possible KEY arguments to a help filter function.  */
++#define ARGP_KEY_HELP_PRE_DOC	0x2000001 /* Help text preceeding options. */
++#define ARGP_KEY_HELP_POST_DOC	0x2000002 /* Help text following options. */
++#define ARGP_KEY_HELP_HEADER	0x2000003 /* Option header string. */
++#define ARGP_KEY_HELP_EXTRA	0x2000004 /* After all other documentation;
++					     TEXT is NULL for this key.  */
++/* Explanatory note emitted when duplicate option arguments have been
++   suppressed.  */
++#define ARGP_KEY_HELP_DUP_ARGS_NOTE 0x2000005
++#define ARGP_KEY_HELP_ARGS_DOC	0x2000006 /* Argument doc string.  */
++
++/* When an argp has a non-zero CHILDREN field, it should point to a vector of
++   argp_child structures, each of which describes a subsidiary argp.  */
++struct argp_child
++{
++  /* The child parser.  */
++  __const struct argp *argp;
++
++  /* Flags for this child.  */
++  int flags;
++
++  /* If non-zero, an optional header to be printed in help output before the
++     child options.  As a side-effect, a non-zero value forces the child
++     options to be grouped together; to achieve this effect without actually
++     printing a header string, use a value of "".  */
++  __const char *header;
++
++  /* Where to group the child options relative to the other (`consolidated')
++     options in the parent argp; the values are the same as the GROUP field
++     in argp_option structs, but all child-groupings follow parent options at
++     a particular group level.  If both this field and HEADER are zero, then
++     they aren't grouped at all, but rather merged with the parent options
++     (merging the child's grouping levels with the parents).  */
++  int group;
++};
++
++/* Parsing state.  This is provided to parsing functions called by argp,
++   which may examine and, as noted, modify fields.  */
++struct argp_state
++{
++  /* The top level ARGP being parsed.  */
++  __const struct argp *root_argp;
++
++  /* The argument vector being parsed.  May be modified.  */
++  int argc;
++  char **argv;
++
++  /* The index in ARGV of the next arg that to be parsed.  May be modified. */
++  int next;
++
++  /* The flags supplied to argp_parse.  May be modified.  */
++  unsigned flags;
++
++  /* While calling a parsing function with a key of ARGP_KEY_ARG, this is the
++     number of the current arg, starting at zero, and incremented after each
++     such call returns.  At all other times, this is the number of such
++     arguments that have been processed.  */
++  unsigned arg_num;
++
++  /* If non-zero, the index in ARGV of the first argument following a special
++     `--' argument (which prevents anything following being interpreted as an
++     option).  Only set once argument parsing has proceeded past this point. */
++  int quoted;
++
++  /* An arbitrary pointer passed in from the user.  */
++  void *input;
++  /* Values to pass to child parsers.  This vector will be the same length as
++     the number of children for the current parser.  */
++  void **child_inputs;
++
++  /* For the parser's use.  Initialized to 0.  */
++  void *hook;
++
++  /* The name used when printing messages.  This is initialized to ARGV[0],
++     or PROGRAM_INVOCATION_NAME if that is unavailable.  */
++  char *name;
++
++  /* Streams used when argp prints something.  */
++  FILE *err_stream;		/* For errors; initialized to stderr. */
++  FILE *out_stream;		/* For information; initialized to stdout. */
++
++  void *pstate;			/* Private, for use by argp.  */
++};
++
++/* Flags for argp_parse (note that the defaults are those that are
++   convenient for program command line parsing): */
++
++/* Don't ignore the first element of ARGV.  Normally (and always unless
++   ARGP_NO_ERRS is set) the first element of the argument vector is
++   skipped for option parsing purposes, as it corresponds to the program name
++   in a command line.  */
++#define ARGP_PARSE_ARGV0  0x01
++
++/* Don't print error messages for unknown options to stderr; unless this flag
++   is set, ARGP_PARSE_ARGV0 is ignored, as ARGV[0] is used as the program
++   name in the error messages.  This flag implies ARGP_NO_EXIT (on the
++   assumption that silent exiting upon errors is bad behaviour).  */
++#define ARGP_NO_ERRS	0x02
++
++/* Don't parse any non-option args.  Normally non-option args are parsed by
++   calling the parse functions with a key of ARGP_KEY_ARG, and the actual arg
++   as the value.  Since it's impossible to know which parse function wants to
++   handle it, each one is called in turn, until one returns 0 or an error
++   other than ARGP_ERR_UNKNOWN; if an argument is handled by no one, the
++   argp_parse returns prematurely (but with a return value of 0).  If all
++   args have been parsed without error, all parsing functions are called one
++   last time with a key of ARGP_KEY_END.  This flag needn't normally be set,
++   as the normal behavior is to stop parsing as soon as some argument can't
++   be handled.  */
++#define ARGP_NO_ARGS	0x04
++
++/* Parse options and arguments in the same order they occur on the command
++   line -- normally they're rearranged so that all options come first. */
++#define ARGP_IN_ORDER	0x08
++
++/* Don't provide the standard long option --help, which causes usage and
++      option help information to be output to stdout, and exit (0) called. */
++#define ARGP_NO_HELP	0x10
++
++/* Don't exit on errors (they may still result in error messages).  */
++#define ARGP_NO_EXIT	0x20
++
++/* Use the gnu getopt `long-only' rules for parsing arguments.  */
++#define ARGP_LONG_ONLY	0x40
++
++/* Turns off any message-printing/exiting options.  */
++#define ARGP_SILENT    (ARGP_NO_EXIT | ARGP_NO_ERRS | ARGP_NO_HELP)
++
++/* Parse the options strings in ARGC & ARGV according to the options in ARGP.
++   FLAGS is one of the ARGP_ flags above.  If ARG_INDEX is non-NULL, the
++   index in ARGV of the first unparsed option is returned in it.  If an
++   unknown option is present, ARGP_ERR_UNKNOWN is returned; if some parser
++   routine returned a non-zero value, it is returned; otherwise 0 is
++   returned.  This function may also call exit unless the ARGP_NO_HELP flag
++   is set.  INPUT is a pointer to a value to be passed in to the parser.  */
++extern error_t argp_parse (__const struct argp *__restrict __argp,
++			   int __argc, char **__restrict __argv,
++			   unsigned __flags, int *__restrict __arg_index,
++			   void *__restrict __input);
++
++/* Global variables.  */
++
++/* If defined or set by the user program to a non-zero value, then a default
++   option --version is added (unless the ARGP_NO_HELP flag is used), which
++   will print this string followed by a newline and exit (unless the
++   ARGP_NO_EXIT flag is used).  Overridden by ARGP_PROGRAM_VERSION_HOOK.  */
++extern __const char *argp_program_version;
++
++/* If defined or set by the user program to a non-zero value, then a default
++   option --version is added (unless the ARGP_NO_HELP flag is used), which
++   calls this function with a stream to print the version to and a pointer to
++   the current parsing state, and then exits (unless the ARGP_NO_EXIT flag is
++   used).  This variable takes precedent over ARGP_PROGRAM_VERSION.  */
++extern void (*argp_program_version_hook) (FILE *__restrict __stream,
++					  struct argp_state *__restrict
++					  __state);
++
++/* If defined or set by the user program, it should point to string that is
++   the bug-reporting address for the program.  It will be printed by
++   argp_help if the ARGP_HELP_BUG_ADDR flag is set (as it is by various
++   standard help messages), embedded in a sentence that says something like
++   `Report bugs to ADDR.'.  */
++extern __const char *argp_program_bug_address;
++
++/* The exit status that argp will use when exiting due to a parsing error.
++   If not defined or set by the user program, this defaults to EX_USAGE from
++   <sysexits.h>.  */
++extern error_t argp_err_exit_status;
++
++/* Flags for argp_help.  */
++#define ARGP_HELP_USAGE		0x01 /* a Usage: message. */
++#define ARGP_HELP_SHORT_USAGE	0x02 /*  " but don't actually print options. */
++#define ARGP_HELP_SEE		0x04 /* a `Try ... for more help' message. */
++#define ARGP_HELP_LONG		0x08 /* a long help message. */
++#define ARGP_HELP_PRE_DOC	0x10 /* doc string preceding long help.  */
++#define ARGP_HELP_POST_DOC	0x20 /* doc string following long help.  */
++#define ARGP_HELP_DOC		(ARGP_HELP_PRE_DOC | ARGP_HELP_POST_DOC)
++#define ARGP_HELP_BUG_ADDR	0x40 /* bug report address */
++#define ARGP_HELP_LONG_ONLY	0x80 /* modify output appropriately to
++					reflect ARGP_LONG_ONLY mode.  */
++
++/* These ARGP_HELP flags are only understood by argp_state_help.  */
++#define ARGP_HELP_EXIT_ERR	0x100 /* Call exit(1) instead of returning.  */
++#define ARGP_HELP_EXIT_OK	0x200 /* Call exit(0) instead of returning.  */
++
++/* The standard thing to do after a program command line parsing error, if an
++   error message has already been printed.  */
++#define ARGP_HELP_STD_ERR \
++  (ARGP_HELP_SEE | ARGP_HELP_EXIT_ERR)
++/* The standard thing to do after a program command line parsing error, if no
++   more specific error message has been printed.  */
++#define ARGP_HELP_STD_USAGE \
++  (ARGP_HELP_SHORT_USAGE | ARGP_HELP_SEE | ARGP_HELP_EXIT_ERR)
++/* The standard thing to do in response to a --help option.  */
++#define ARGP_HELP_STD_HELP \
++  (ARGP_HELP_SHORT_USAGE | ARGP_HELP_LONG | ARGP_HELP_EXIT_OK \
++   | ARGP_HELP_DOC | ARGP_HELP_BUG_ADDR)
++
++/* Output a usage message for ARGP to STREAM.  FLAGS are from the set
++   ARGP_HELP_*.  */
++extern void argp_help (__const struct argp *__restrict __argp,
++		       FILE *__restrict __stream,
++		       unsigned __flags, char *__restrict __name);
++
++/* The following routines are intended to be called from within an argp
++   parsing routine (thus taking an argp_state structure as the first
++   argument).  They may or may not print an error message and exit, depending
++   on the flags in STATE -- in any case, the caller should be prepared for
++   them *not* to exit, and should return an appropiate error after calling
++   them.  [argp_usage & argp_error should probably be called argp_state_...,
++   but they're used often enough that they should be short]  */
++
++/* Output, if appropriate, a usage message for STATE to STREAM.  FLAGS are
++   from the set ARGP_HELP_*.  */
++extern void argp_state_help (__const struct argp_state *__restrict __state,
++			     FILE *__restrict __stream,
++			     unsigned int __flags);
++/* Possibly output the standard usage message for ARGP to stderr and exit.  */
++extern void argp_usage (__const struct argp_state *__state);
++
++/* If appropriate, print the printf string FMT and following args, preceded
++   by the program name and `:', to stderr, and followed by a `Try ... --help'
++   message, then exit (1).  */
++extern void argp_error (__const struct argp_state *__restrict __state,
++			__const char *__restrict __fmt, ...)
++     __attribute__ ((__format__ (__printf__, 2, 3)));
++/* Similar to the standard gnu error-reporting function error(), but will
++   respect the ARGP_NO_EXIT and ARGP_NO_ERRS flags in STATE, and will print
++   to STATE->err_stream.  This is useful for argument parsing code that is
++   shared between program startup (when exiting is desired) and runtime
++   option parsing (when typically an error code is returned instead).  The
++   difference between this function and argp_error is that the latter is for
++   *parsing errors*, and the former is for other problems that occur during
++   parsing but don't reflect a (syntactic) problem with the input.  */
++extern void argp_failure (__const struct argp_state *__restrict __state,
++			  int __status, int __errnum,
++			  __const char *__restrict __fmt, ...)
++     __attribute__ ((__format__ (__printf__, 4, 5)));
++/* Returns true if the option OPT is a valid short option.  */
++extern int _option_is_short (__const struct argp_option *__opt) __THROW;
++extern int __option_is_short (__const struct argp_option *__opt) __THROW;
++
++/* Returns true if the option OPT is in fact the last (unused) entry in an
++   options array.  */
++extern int _option_is_end (__const struct argp_option *__opt) __THROW;
++extern int __option_is_end (__const struct argp_option *__opt) __THROW;
++
++/* Return the input field for ARGP in the parser corresponding to STATE; used
++   by the help routines.  */
++/* We think this should not be exported */
++extern void *__argp_input (__const struct argp *__restrict __argp,
++			   __const struct argp_state *__restrict __state)
++     __THROW;
++
++#ifdef __USE_EXTERN_INLINES
++
++# ifndef ARGP_EI
++#  define ARGP_EI __extern_inline
++# endif
++
++ARGP_EI void
++argp_usage (__const struct argp_state *__state)
++{
++  argp_state_help (__state, stderr, ARGP_HELP_STD_USAGE);
++}
++
++ARGP_EI int
++__NTH (__option_is_short (__const struct argp_option *__opt))
++{
++  if (__opt->flags & OPTION_DOC)
++    return 0;
++  else
++    {
++      int __key = __opt->key;
++      return __key > 0 && __key <= UCHAR_MAX && isprint (__key);
++    }
++}
++
++ARGP_EI int
++__NTH (__option_is_end (__const struct argp_option *__opt))
++{
++  return !__opt->key && !__opt->name && !__opt->doc && !__opt->group;
++}
++#endif /* Use extern inlines.  */
++
++#ifdef  __cplusplus
++}
++#endif
++
++#endif /* argp.h */
diff --git a/meta/recipes-core/uclibc/uclibc-git/argp-support.patch b/meta/recipes-core/uclibc/uclibc-git/argp-support.patch
new file mode 100644
index 0000000..04a3c78
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/argp-support.patch
@@ -0,0 +1,5189 @@
+From: Salvatore Cro <salvatore.cro at st.com>
+
+Argp is an advanced support for parsing unix-style argument vectors.
+In addition to the common getopt interface, it provides automatic response
+to `--help' and `--version' options and use of custom parser in conjunction
+with argp native option parser, among others.
+Argp support is required by elfutils package and prelink.
+
+In uClibc argp functionalities has been moved from C library to libuargp.so
+Further the libc.so linker script contains an AS_NEEDED entry so that
+it doesn't need to link libuargp.so explicitely.
+
+Signed-off-by: Salvatore Cro <salvatore.cro at st.com>
+Signed-off-by: Filippo Arcidiacono <filippo.arcidiacono at st.com>
+Signed-off-by: Carmelo Amoroso <carmelo.amoroso at st.com>
+---
+ Makefile.in                                 |    8 +
+ Makerules                                   |    8 +-
+ Rules.mak                                   |    7 +
+ extra/Configs/Config.in                     |   17 +
+ libc/sysdeps/linux/common/bits/getopt_int.h |  136 ++
+ libc/unistd/getopt.c                        |   18 +-
+ libc/unistd/getopt_int.h                    |  134 --
+ libuargp/Makefile                           |   14 +
+ libuargp/Makefile.in                        |   76 ++
+ libuargp/argp-ba.c                          |   26 +
+ libuargp/argp-eexst.c                       |   32 +
+ libuargp/argp-fmtstream.c                   |  439 +++++++
+ libuargp/argp-fmtstream.h                   |  314 +++++
+ libuargp/argp-fs-xinl.c                     |   44 +
+ libuargp/argp-help.c                        | 1882 +++++++++++++++++++++++++++
+ libuargp/argp-parse.c                       |  949 ++++++++++++++
+ libuargp/argp-pv.c                          |   25 +
+ libuargp/argp-pvh.c                         |   32 +
+ libuargp/argp-xinl.c                        |   35 +
+ test/argp/Makefile                          |    7 +
+ test/argp/Makefile.in                       |   12 +
+ test/argp/argp-ex1.c                        |   15 +
+ test/argp/argp-ex2.c                        |   45 +
+ test/argp/argp-ex3.c                        |  153 +++
+ test/argp/argp-ex4.c                        |  167 +++
+ test/argp/argp-test.c                       |  209 +++
+ test/argp/bug-argp1.c                       |   26 +
+ test/argp/tst-argp1.c                       |  118 ++
+ test/argp/tst-argp2.c                       |  101 ++
+ 29 files changed, 4911 insertions(+), 138 deletions(-)
+ create mode 100644 libc/sysdeps/linux/common/bits/getopt_int.h
+ delete mode 100644 libc/unistd/getopt_int.h
+ create mode 100644 libuargp/Makefile
+ create mode 100644 libuargp/Makefile.in
+ create mode 100644 libuargp/argp-ba.c
+ create mode 100644 libuargp/argp-eexst.c
+ create mode 100644 libuargp/argp-fmtstream.c
+ create mode 100644 libuargp/argp-fmtstream.h
+ create mode 100644 libuargp/argp-fs-xinl.c
+ create mode 100644 libuargp/argp-help.c
+ create mode 100644 libuargp/argp-parse.c
+ create mode 100644 libuargp/argp-pv.c
+ create mode 100644 libuargp/argp-pvh.c
+ create mode 100644 libuargp/argp-xinl.c
+ create mode 100644 test/argp/Makefile
+ create mode 100644 test/argp/Makefile.in
+ create mode 100644 test/argp/argp-ex1.c
+ create mode 100644 test/argp/argp-ex2.c
+ create mode 100644 test/argp/argp-ex3.c
+ create mode 100644 test/argp/argp-ex4.c
+ create mode 100644 test/argp/argp-test.c
+ create mode 100644 test/argp/bug-argp1.c
+ create mode 100644 test/argp/tst-argp1.c
+ create mode 100644 test/argp/tst-argp2.c
+
+Index: git/Makefile.in
+===================================================================
+--- git.orig/Makefile.in
++++ git/Makefile.in
+@@ -48,6 +48,7 @@ include $(top_srcdir)libresolv/Makefile.
+ include $(top_srcdir)libutil/Makefile.in
+ include $(top_srcdir)libpthread/Makefile.in
+ include $(top_srcdir)librt/Makefile.in
++include $(top_srcdir)libuargp/Makefile.in
+ include $(top_srcdir)libubacktrace/Makefile.in
+ include $(top_srcdir)extra/locale/Makefile.in
+ 
+@@ -230,6 +231,7 @@ HEADERS_RM- += sgtty.h
+ endif
+ HEADERS_RM-$(HAVE_SHARED)                    += dlfcn.h bits/dlfcn.h
+ HEADERS_RM-$(PTHREADS_DEBUG_SUPPORT)         += thread_db.h
++HEADERS_RM-$(UCLIBC_HAS_ARGP)                += argp.h
+ HEADERS_RM-$(UCLIBC_HAS_BSD_ERR)             += err.h
+ HEADERS_RM-$(UCLIBC_HAS_CRYPT)               += crypt.h
+ HEADERS_RM-$(UCLIBC_HAS_EPOLL)               += sys/epoll.h
+@@ -340,6 +342,12 @@ ifeq ($(UCLIBC_HAS_BACKTRACE),y)
+ 		echo "GROUP ( $(UBACKTRACE_ASNEEDED) )" >> $(PREFIX)$(DEVEL_PREFIX)$(MULTILIB_DIR)/libc.so; \
+ 	fi
+ endif
++ifeq ($(UCLIBC_HAS_ARGP),y)
++# Add the AS_NEEDED entry for libuargp.so
++	if [ -f $(top_builddir)lib/libc.so -a -f $(PREFIX)$(RUNTIME_PREFIX)lib/$(SHARED_MAJORNAME) ] ; then \
++		echo "GROUP ( $(UARGP_ASNEEDED) )" >> $(PREFIX)$(DEVEL_PREFIX)lib/libc.so; \
++	fi
++endif
+ ifeq ($(UCLIBC_HAS_THREADS),y)
+ ifneq ($(LINUXTHREADS_OLD),y)
+ ifeq ($(HARDWIRED_ABSPATH),y)
+Index: git/Makerules
+===================================================================
+--- git.orig/Makerules
++++ git/Makerules
+@@ -32,12 +32,12 @@ shared_objs = $(libc-y:.o=.os) $(libc-sh
+ 	$(libpthread-so-y) $(libpthread-nonshared-y) $(libthread_db-so-y) \
+ 	$(libresolv-so-y) $(librt-so-y) \
+ 	$(ldso-y) \
+-	$(libutil-so-y) $(libubacktrace-so-y)
++	$(libutil-so-y) $(libubacktrace-so-y) $(libuargp-so-y)
+ 
+ ar_objs =  $(libc-y) $(libc-static-y) $(libcrypt-a-y) \
+ 	$(libdl-a-y) $(libintl-a-y) $(libm-a-y) $(libnsl-a-y) \
+ 	$(libpthread-a-y) $(libthread_db-a-y) \
+-	$(libresolv-a-y) $(librt-a-y) $(libutil-a-y) $(libubacktrace-a-y)
++	$(libresolv-a-y) $(librt-a-y) $(libutil-a-y) $(libubacktrace-a-y) $(libuargp-a-y)
+ ifeq ($(DOPIC),y)
+ ar_objs := $(ar_objs:.o=.os)
+ endif
+@@ -464,7 +464,7 @@ files.dep := $(libc-a-y) $(libc-so-y) $(
+ 	$(librt-a-y) $(librt-so-y)  $(libresolv-a-y) $(libresolv-so-y) \
+ 	$(libcrypt-a-y) $(libcrypt-so-y) $(libutil-a-y) $(libutil-so-y) \
+ 	$(libnsl-a-y) $(libnsl-so-y) $(ldso-y) $(libdl-a-y) $(libdl-so-y) \
+-	$(libubacktrace-a-y) $(libubacktrace-so-y)
++	$(libubacktrace-a-y) $(libubacktrace-so-y) $(libuargp-so-y) $(libuargp-a-y)
+ .depends.dep := \
+ 	$(patsubst %.s,%.s.dep,$(filter %.s,$(files.dep))) \
+ 	$(patsubst %.o,%.o.dep,$(filter %.o,$(files.dep))) \
+Index: git/Rules.mak
+===================================================================
+--- git.orig/Rules.mak
++++ git/Rules.mak
+@@ -525,6 +525,13 @@ export UBACKTRACE_ASNEEDED:=$(shell $(LD
+ else
+ export UBACKTRACE_ASNEEDED:=""
+ endif
++ifeq ($(UCLIBC_HAS_ARGP),y)
++# Only used in installed libc.so linker script
++UARGP_FULL_NAME := $(RUNTIME_PREFIX)lib/libuargp.so.$(MAJOR_VERSION)
++export UARGP_ASNEEDED:=$(shell $(LD) --help 2>/dev/null | grep -q -- --as-needed && echo "AS_NEEDED ( $(UARGP_FULL_NAME) )" || echo "$(UARGP_FULL_NAME)")
++else
++export UARGP_ASNEEDED:=""
++endif
+ endif
+ 
+ # Add a bunch of extra pedantic annoyingly strict checks
+Index: git/extra/Configs/Config.in
+===================================================================
+--- git.orig/extra/Configs/Config.in
++++ git/extra/Configs/Config.in
+@@ -1814,6 +1814,23 @@ config UCLIBC_HAS_GNU_GETSUBOPT
+ 	  smaller SUSv3 compatible getsubopt().
+ 
+ 	  Most people will answer Y.
++
++config UCLIBC_HAS_ARGP
++       bool "Support argp (as standalone shared object)"
++       default n
++       help
++         Argp is an interface for parsing unix-style argument vectors. Unlike
++         the common getopt interface, it provides many advanced features in
++         addition to parsing options, such as automatic output in response to
++         `--help' and `--version' options.
++         A library can export an argp option parser, which programs can easily
++         use in conjunction with their own option parser.
++         A new shared object "libuargp" is created. The "libc.so" linker script
++         contains the AS_NEEDED entry for getting the libuargp linked automatically.
++         Argp support is needed by elfutils libdw.
++
++         Most people can safely answer N.
++
+ endmenu
+ 
+ 
+Index: git/libc/sysdeps/linux/common/bits/getopt_int.h
+===================================================================
+--- /dev/null
++++ git/libc/sysdeps/linux/common/bits/getopt_int.h
+@@ -0,0 +1,136 @@
++/* Internal declarations for getopt.
++   Copyright (C) 1989-1994,1996-1999,2001,2003,2004
++   Free Software Foundation, Inc.
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
++#ifndef _GETOPT_INT_H
++#define _GETOPT_INT_H  1
++
++extern int _getopt_internal (int ___argc, char *const *___argv,
++                            const char *__shortopts,
++                            const struct option *__longopts, int *__longind,
++                            int __long_only) attribute_hidden;
++
++
++/* Reentrant versions which can handle parsing multiple argument
++   vectors at the same time.  */
++
++/* For __ordering member */
++enum {
++       REQUIRE_ORDER, PERMUTE, RETURN_IN_ORDER
++};
++
++/* Data type for reentrant functions.  */
++
++struct _getopt_data
++{
++  /* These have exactly the same meaning as the corresponding global
++     variables, except that they are used for the reentrant
++     versions of getopt.  */
++  int optind;
++  int opterr;
++  char *optarg;
++  smalluint optopt; /* we store characters here, a byte is enough */
++
++  /* Internal members.  */
++
++  /* True if the internal members have been initialized.  */
++  smallint __initialized;
++
++  /* Describe how to deal with options that follow non-option ARGV-elements.
++
++     If the caller did not specify anything,
++     the default is REQUIRE_ORDER if the environment variable
++     POSIXLY_CORRECT is defined, PERMUTE otherwise.
++
++     REQUIRE_ORDER means don't recognize them as options;
++     stop option processing when the first non-option is seen.
++     This is what Unix does.
++     This mode of operation is selected by either setting the environment
++     variable POSIXLY_CORRECT, or using `+' as the first character
++     of the list of option characters.
++
++     PERMUTE is the default.  We permute the contents of ARGV as we
++     scan, so that eventually all the non-options are at the end.
++     This allows options to be given in any order, even with programs
++     that were not written to expect this.
++
++     RETURN_IN_ORDER is an option available to programs that were
++     written to expect options and other ARGV-elements in any order
++     and that care about the ordering of the two.  We describe each
++     non-option ARGV-element as if it were the argument of an option
++     with character code 1.  Using `-' as the first character of the
++     list of option characters selects this mode of operation.
++
++     The special argument `--' forces an end of option-scanning regardless
++     of the value of `ordering'.  In the case of RETURN_IN_ORDER, only
++     `--' can cause `getopt' to return -1 with `optind' != ARGC.  */
++  smallint __ordering;
++
++  /* If the POSIXLY_CORRECT environment variable is set.  */
++  smallint __posixly_correct;
++
++  /* The next char to be scanned in the option-element
++     in which the last option character we returned was found.
++     This allows us to pick up the scan where we left off.
++
++     If this is zero, or a null string, it means resume the scan
++     by advancing to the next ARGV-element.  */
++  char *__nextchar;
++
++
++  /* Handle permutation of arguments.  */
++
++  /* Describe the part of ARGV that contains non-options that have
++     been skipped.  `first_nonopt' is the index in ARGV of the first
++     of them; `last_nonopt' is the index after the last of them.  */
++
++  int __first_nonopt;
++  int __last_nonopt;
++
++#if defined _LIBC && defined USE_NONOPTION_FLAGS
++  int __nonoption_flags_max_len;
++  int __nonoption_flags_len;
++# endif
++};
++
++/* The initializer is necessary to set OPTIND and OPTERR to their
++   default values and to clear the initialization flag.  */
++#define _GETOPT_DATA_INITIALIZER       { 1, 1 }
++
++#if 0 /* first is static on uClibc, the others not used */
++extern int _getopt_internal_r (int ___argc, char *const *___argv,
++                              const char *__shortopts,
++                              const struct option *__longopts, int *__longind,
++                              int __long_only, struct _getopt_data *__data);
++#endif
++#if defined __UCLIBC_HAS_GNU_GETOPT__ || defined __UCLIBC_HAS_GETOPT_LONG__
++#ifndef __need_getopt
++extern int _getopt_long_r (int ___argc, char *const *___argv,
++                          const char *__shortopts,
++                          const struct option *__longopts, int *__longind,
++                          struct _getopt_data *__data);
++
++extern int _getopt_long_only_r (int ___argc, char *const *___argv,
++                               const char *__shortopts,
++                               const struct option *__longopts,
++                               int *__longind,
++                               struct _getopt_data *__data);
++#endif
++#endif
++#endif /* getopt_int.h */
+Index: git/libc/unistd/getopt.c
+===================================================================
+--- git.orig/libc/unistd/getopt.c
++++ git/libc/unistd/getopt.c
+@@ -119,7 +119,7 @@
+    they can distinguish the relative order of options and other arguments.  */
+ 
+ #include <getopt.h>
+-#include "getopt_int.h"
++#include <bits/getopt_int.h>
+ 
+ 
+ /* For communication from `getopt' to the caller.
+@@ -1183,6 +1183,15 @@ getopt_long (int argc, char *const *argv
+   return _getopt_internal (argc, argv, options, long_options, opt_index, 0);
+ }
+ 
++int
++_getopt_long_r (int argc, char *const *argv, const char *options,
++               const struct option *long_options, int *opt_index,
++               struct _getopt_data *d)
++{
++  return _getopt_internal_r (argc, argv, options, long_options, opt_index,
++                            0, d);
++}
++
+ /* Like getopt_long, but '-' as well as '--' can indicate a long option.
+    If an option that starts with '-' (not '--') doesn't match a long option,
+    but does match a short option, it is parsed as a short option
+@@ -1195,4 +1204,12 @@ getopt_long_only (int argc, char *const
+   return _getopt_internal (argc, argv, options, long_options, opt_index, 1);
+ }
+ 
++int
++_getopt_long_only_r (int argc, char *const *argv, const char *options,
++                    const struct option *long_options, int *opt_index,
++                    struct _getopt_data *d)
++{
++  return _getopt_internal_r (argc, argv, options, long_options, opt_index, 1, d);
++}
++
+ #endif	/* Not ELIDE_CODE.  */
+Index: git/libuargp/Makefile
+===================================================================
+--- /dev/null
++++ git/libuargp/Makefile
+@@ -0,0 +1,14 @@
++# Makefile for uClibc (libuargp)
++#
++# Copyright (C) 2010 STMicroelectronics Ltd
++# Author(s): Filippo Arcidiacono <filippo.arcidiacono at st.com>
++#
++# Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
++#
++
++top_srcdir=../
++top_builddir=../
++include $(top_builddir)Rules.mak
++all: libs
++include Makefile.in
++include $(top_srcdir)Makerules
+Index: git/libuargp/Makefile.in
+===================================================================
+--- /dev/null
++++ git/libuargp/Makefile.in
+@@ -0,0 +1,73 @@
++# Makefile for uClibc (libuargp)
++#
++# Copyright (C) 2009, 2010  STMicroelectronics Ltd.
++# Author(s): Salvatore Cro <salvatore.cro at st.com>
++#            - First implementation, embedded into libc
++#            Filippo Arcidiacono <filippo.arcidiacono at st.com>
++#            - Reworked for stand-alone libuargp implementation
++
++# Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
++#
++
++CFLAGS-libuargp := -DNOT_IN_libc -DIS_IN_libuargp $(SSP_ALL_CFLAGS)
++
++LDFLAGS-libuargp.so := $(LDFLAGS)
++
++LIBS-libuargp.so := $(LIBS)
++
++libuargp_FULL_NAME := libuargp-$(VERSION).so
++
++libuargp_DIR := $(top_srcdir)libuargp
++libuargp_OUT := $(top_builddir)libuargp
++
++libuargp_SRC-y :=
++libuargp_SRC-$(UCLIBC_HAS_ARGP) := $(addsuffix .c,$(addprefix argp-, ba \
++			eexst fmtstream fs-xinl help parse pv pvh xinl))
++
++CFLAGS-argp-xinl.c = -fgnu89-inline
++
++libuargp_SRC := $(addprefix $(libuargp_DIR)/,$(libuargp_SRC-y))
++libuargp_OBJ := $(patsubst $(libuargp_DIR)/%.c,$(libuargp_OUT)/%.o,$(libuargp_SRC))
++
++libuargp_SRCS := $(libuargp_SRC)
++libuargp_OBJS := $(libuargp_OBJ)
++
++ifeq ($(DOPIC),y)
++libuargp-a-y := $(libuargp_OBJS:.o=.os)
++else
++libuargp-a-y := $(libuargp_OBJS)
++endif
++libuargp-so-y := $(libuargp_OBJS:.o=.os)
++
++lib-a-$(UCLIBC_HAS_ARGP) += $(top_builddir)lib/libuargp.a
++lib-so-$(UCLIBC_HAS_ARGP) += $(top_builddir)lib/libuargp.so
++
++objclean-y += CLEAN_libuargp
++
++ifeq ($(DOMULTI),n)
++ifeq ($(DOPIC),y)
++$(top_builddir)lib/libuargp.so: $(top_builddir)lib/libuargp.a $(libc.depend)
++else
++$(top_builddir)lib/libuargp.so: $(libuargp_OUT)/libuargp_so.a $(libc.depend)
++endif
++	$(call link.so,$(libuargp_FULL_NAME),$(MAJOR_VERSION))
++else
++$(top_builddir)lib/libuargp.so: $(libuargp_OUT)/libuargp.oS $(libc.depend)
++	$(call linkm.so,$(libuargp_FULL_NAME),$(MAJOR_VERSION))
++endif
++
++$(libuargp_OUT)/libuargp_so.a: $(libuargp-so-y)
++	$(Q)$(RM) $@
++	$(do_ar)
++
++$(libuargp_OUT)/libuargp.oS: $(libuargp_SRCS)
++	$(Q)$(RM) $@
++	$(compile-m)
++
++$(top_builddir)lib/libuargp.a: $(libuargp-a-y)
++	$(Q)$(INSTALL) -d $(dir $@)
++	$(Q)$(RM) $@
++	$(do_ar)
++
++CLEAN_libuargp:
++	$(do_rm) $(addprefix $(libuargp_OUT)/*., o os oS a)
+Index: git/libuargp/argp-ba.c
+===================================================================
+--- /dev/null
++++ git/libuargp/argp-ba.c
+@@ -0,0 +1,26 @@
++/* Default definition for ARGP_PROGRAM_BUG_ADDRESS.
++   Copyright (C) 1996, 1997, 1999 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++   Written by Miles Bader <miles at gnu.ai.mit.edu>.
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
++/* If set by the user program, it should point to string that is the
++   bug-reporting address for the program.  It will be printed by argp_help if
++   the ARGP_HELP_BUG_ADDR flag is set (as it is by various standard help
++   messages), embedded in a sentence that says something like `Report bugs to
++   ADDR.'.  */
++const char *argp_program_bug_address;
+Index: git/libuargp/argp-eexst.c
+===================================================================
+--- /dev/null
++++ git/libuargp/argp-eexst.c
+@@ -0,0 +1,32 @@
++/* Default definition for ARGP_ERR_EXIT_STATUS
++   Copyright (C) 1997 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++   Written by Miles Bader <miles at gnu.ai.mit.edu>.
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
++#ifdef HAVE_CONFIG_H
++# include <config.h>
++#endif
++
++#include <sysexits.h>
++
++#include <argp.h>
++
++/* The exit status that argp will use when exiting due to a parsing error.
++   If not defined or set by the user program, this defaults to EX_USAGE from
++   <sysexits.h>.  */
++error_t argp_err_exit_status = EX_USAGE;
+Index: git/libuargp/argp-fmtstream.c
+===================================================================
+--- /dev/null
++++ git/libuargp/argp-fmtstream.c
+@@ -0,0 +1,439 @@
++/* Word-wrapping and line-truncating streams
++   Copyright (C) 1997-1999,2001,2002,2003,2005 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++   Written by Miles Bader <miles at gnu.ai.mit.edu>.
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
++   02111-1307 USA.
++
++   Modified for uClibc by: Salvatore Cro <salvatore.cro at st.com>
++*/
++
++/* This package emulates glibc `line_wrap_stream' semantics for systems that
++   don't have that.  */
++
++#ifdef HAVE_CONFIG_H
++# include <config.h>
++#endif
++
++#include <stdlib.h>
++#include <string.h>
++#include <errno.h>
++#include <stdarg.h>
++#include <ctype.h>
++
++#include "argp-fmtstream.h"
++
++#ifndef ARGP_FMTSTREAM_USE_LINEWRAP
++
++#ifndef isblank
++#define isblank(ch) ((ch)==' ' || (ch)=='\t')
++#endif
++
++#if defined _LIBC && defined USE_IN_LIBIO
++# include <wchar.h>
++# include <libio/libioP.h>
++# define __vsnprintf(s, l, f, a) _IO_vsnprintf (s, l, f, a)
++#else
++# define __vsnprintf(s, l, f, a) vsnprintf (s, l, f, a)
++#endif
++
++#define INIT_BUF_SIZE 200
++#define PRINTF_SIZE_GUESS 150
++
++/* Return an argp_fmtstream that outputs to STREAM, and which prefixes lines
++   written on it with LMARGIN spaces and limits them to RMARGIN columns
++   total.  If WMARGIN >= 0, words that extend past RMARGIN are wrapped by
++   replacing the whitespace before them with a newline and WMARGIN spaces.
++   Otherwise, chars beyond RMARGIN are simply dropped until a newline.
++   Returns NULL if there was an error.  */
++argp_fmtstream_t
++__argp_make_fmtstream (FILE *stream,
++                      size_t lmargin, size_t rmargin, ssize_t wmargin)
++{
++  argp_fmtstream_t fs;
++
++  fs = (struct argp_fmtstream *) malloc (sizeof (struct argp_fmtstream));
++  if (fs != NULL)
++    {
++      fs->stream = stream;
++
++      fs->lmargin = lmargin;
++      fs->rmargin = rmargin;
++      fs->wmargin = wmargin;
++      fs->point_col = 0;
++      fs->point_offs = 0;
++
++      fs->buf = (char *) malloc (INIT_BUF_SIZE);
++      if (! fs->buf)
++       {
++         free (fs);
++         fs = 0;
++       }
++      else
++       {
++         fs->p = fs->buf;
++         fs->end = fs->buf + INIT_BUF_SIZE;
++       }
++    }
++
++  return fs;
++}
++#if 0
++/* Not exported.  */
++#ifdef weak_alias
++weak_alias (__argp_make_fmtstream, argp_make_fmtstream)
++#endif
++#endif
++
++/* Flush FS to its stream, and free it (but don't close the stream).  */
++void
++__argp_fmtstream_free (argp_fmtstream_t fs)
++{
++  __argp_fmtstream_update (fs);
++  if (fs->p > fs->buf)
++    {
++#ifdef USE_IN_LIBIO
++      __fxprintf (fs->stream, "%.*s", (int) (fs->p - fs->buf), fs->buf);
++#else
++      fwrite_unlocked (fs->buf, 1, fs->p - fs->buf, fs->stream);
++#endif
++    }
++  free (fs->buf);
++  free (fs);
++}
++#if 0
++/* Not exported.  */
++#ifdef weak_alias
++weak_alias (__argp_fmtstream_free, argp_fmtstream_free)
++#endif
++#endif
++
++/* Process FS's buffer so that line wrapping is done from POINT_OFFS to the
++   end of its buffer.  This code is mostly from glibc stdio/linewrap.c.  */
++void
++__argp_fmtstream_update (argp_fmtstream_t fs)
++{
++  char *buf, *nl;
++  size_t len;
++
++  /* Scan the buffer for newlines.  */
++  buf = fs->buf + fs->point_offs;
++  while (buf < fs->p)
++    {
++      size_t r;
++
++      if (fs->point_col == 0 && fs->lmargin != 0)
++       {
++         /* We are starting a new line.  Print spaces to the left margin.  */
++         const size_t pad = fs->lmargin;
++         if (fs->p + pad < fs->end)
++           {
++             /* We can fit in them in the buffer by moving the
++                buffer text up and filling in the beginning.  */
++             memmove (buf + pad, buf, fs->p - buf);
++             fs->p += pad; /* Compensate for bigger buffer. */
++             memset (buf, ' ', pad); /* Fill in the spaces.  */
++             buf += pad; /* Don't bother searching them.  */
++           }
++         else
++           {
++             /* No buffer space for spaces.  Must flush.  */
++             size_t i;
++             for (i = 0; i < pad; i++)
++               {
++#ifdef USE_IN_LIBIO
++                 if (_IO_fwide (fs->stream, 0) > 0)
++                   putwc_unlocked (L' ', fs->stream);
++                 else
++#endif
++                   putc_unlocked (' ', fs->stream);
++               }
++           }
++         fs->point_col = pad;
++       }
++
++      len = fs->p - buf;
++      nl = memchr (buf, '\n', len);
++
++      if (fs->point_col < 0)
++       fs->point_col = 0;
++
++      if (!nl)
++       {
++         /* The buffer ends in a partial line.  */
++
++         if (fs->point_col + len < fs->rmargin)
++           {
++             /* The remaining buffer text is a partial line and fits
++                within the maximum line width.  Advance point for the
++                characters to be written and stop scanning.  */
++             fs->point_col += len;
++             break;
++           }
++         else
++           /* Set the end-of-line pointer for the code below to
++              the end of the buffer.  */
++           nl = fs->p;
++       }
++      else if (fs->point_col + (nl - buf) < (ssize_t) fs->rmargin)
++       {
++         /* The buffer contains a full line that fits within the maximum
++            line width.  Reset point and scan the next line.  */
++         fs->point_col = 0;
++         buf = nl + 1;
++         continue;
++       }
++
++      /* This line is too long.  */
++      r = fs->rmargin - 1;
++
++      if (fs->wmargin < 0)
++       {
++         /* Truncate the line by overwriting the excess with the
++            newline and anything after it in the buffer.  */
++         if (nl < fs->p)
++           {
++             memmove (buf + (r - fs->point_col), nl, fs->p - nl);
++             fs->p -= buf + (r - fs->point_col) - nl;
++             /* Reset point for the next line and start scanning it.  */
++             fs->point_col = 0;
++             buf += r + 1; /* Skip full line plus \n. */
++           }
++         else
++           {
++             /* The buffer ends with a partial line that is beyond the
++                maximum line width.  Advance point for the characters
++                written, and discard those past the max from the buffer.  */
++             fs->point_col += len;
++             fs->p -= fs->point_col - r;
++             break;
++           }
++       }
++      else
++       {
++         /* Do word wrap.  Go to the column just past the maximum line
++            width and scan back for the beginning of the word there.
++            Then insert a line break.  */
++
++         char *p, *nextline;
++         int i;
++
++         p = buf + (r + 1 - fs->point_col);
++         while (p >= buf && !isblank (*p))
++           --p;
++         nextline = p + 1;     /* This will begin the next line.  */
++
++         if (nextline > buf)
++           {
++             /* Swallow separating blanks.  */
++             if (p >= buf)
++               do
++                 --p;
++               while (p >= buf && isblank (*p));
++             nl = p + 1;       /* The newline will replace the first blank. */
++           }
++         else
++           {
++             /* A single word that is greater than the maximum line width.
++                Oh well.  Put it on an overlong line by itself.  */
++             p = buf + (r + 1 - fs->point_col);
++             /* Find the end of the long word.  */
++             do
++               ++p;
++             while (p < nl && !isblank (*p));
++             if (p == nl)
++               {
++                 /* It already ends a line.  No fussing required.  */
++                 fs->point_col = 0;
++                 buf = nl + 1;
++                 continue;
++               }
++             /* We will move the newline to replace the first blank.  */
++             nl = p;
++             /* Swallow separating blanks.  */
++             do
++               ++p;
++             while (isblank (*p));
++             /* The next line will start here.  */
++             nextline = p;
++           }
++
++         /* Note: There are a bunch of tests below for
++            NEXTLINE == BUF + LEN + 1; this case is where NL happens to fall
++            at the end of the buffer, and NEXTLINE is in fact empty (and so
++            we need not be careful to maintain its contents).  */
++
++         if ((nextline == buf + len + 1
++              ? fs->end - nl < fs->wmargin + 1
++              : nextline - (nl + 1) < fs->wmargin)
++             && fs->p > nextline)
++           {
++             /* The margin needs more blanks than we removed.  */
++             if (fs->end - fs->p > fs->wmargin + 1)
++               /* Make some space for them.  */
++               {
++                 size_t mv = fs->p - nextline;
++                 memmove (nl + 1 + fs->wmargin, nextline, mv);
++                 nextline = nl + 1 + fs->wmargin;
++                 len = nextline + mv - buf;
++                 *nl++ = '\n';
++               }
++             else
++               /* Output the first line so we can use the space.  */
++               {
++#if defined _LIBC && defined USE_IN_LIBIO
++                 __fxprintf (fs->stream, "%.*s\n",
++                             (int) (nl - fs->buf), fs->buf);
++#else
++                 if (nl > fs->buf)
++                   fwrite_unlocked (fs->buf, 1, nl - fs->buf, fs->stream);
++                 putc_unlocked ('\n', fs->stream);
++#endif
++
++                 len += buf - fs->buf;
++                 nl = buf = fs->buf;
++               }
++           }
++         else
++           /* We can fit the newline and blanks in before
++              the next word.  */
++           *nl++ = '\n';
++
++         if (nextline - nl >= fs->wmargin
++             || (nextline == buf + len + 1 && fs->end - nextline >= fs->wmargin))
++           /* Add blanks up to the wrap margin column.  */
++           for (i = 0; i < fs->wmargin; ++i)
++             *nl++ = ' ';
++         else
++           for (i = 0; i < fs->wmargin; ++i)
++#ifdef USE_IN_LIBIO
++             if (_IO_fwide (fs->stream, 0) > 0)
++               putwc_unlocked (L' ', fs->stream);
++             else
++#endif
++               putc_unlocked (' ', fs->stream);
++
++         /* Copy the tail of the original buffer into the current buffer
++            position.  */
++         if (nl < nextline)
++           memmove (nl, nextline, buf + len - nextline);
++         len -= nextline - buf;
++
++         /* Continue the scan on the remaining lines in the buffer.  */
++         buf = nl;
++
++         /* Restore bufp to include all the remaining text.  */
++         fs->p = nl + len;
++
++         /* Reset the counter of what has been output this line.  If wmargin
++            is 0, we want to avoid the lmargin getting added, so we set
++            point_col to a magic value of -1 in that case.  */
++         fs->point_col = fs->wmargin ? fs->wmargin : -1;
++       }
++    }
++
++  /* Remember that we've scanned as far as the end of the buffer.  */
++  fs->point_offs = fs->p - fs->buf;
++}
++
++/* Ensure that FS has space for AMOUNT more bytes in its buffer, either by
++   growing the buffer, or by flushing it.  True is returned iff we succeed. */
++int
++__argp_fmtstream_ensure (struct argp_fmtstream *fs, size_t amount)
++{
++  if ((size_t) (fs->end - fs->p) < amount)
++    {
++      ssize_t wrote;
++
++      /* Flush FS's buffer.  */
++      __argp_fmtstream_update (fs);
++
++#if defined _LIBC && defined USE_IN_LIBIO
++      __fxprintf (fs->stream, "%.*s", (int) (fs->p - fs->buf), fs->buf);
++      wrote = fs->p - fs->buf;
++#else
++      wrote = fwrite_unlocked (fs->buf, 1, fs->p - fs->buf, fs->stream);
++#endif
++      if (wrote == fs->p - fs->buf)
++       {
++         fs->p = fs->buf;
++         fs->point_offs = 0;
++       }
++      else
++       {
++         fs->p -= wrote;
++         fs->point_offs -= wrote;
++         memmove (fs->buf, fs->buf + wrote, fs->p - fs->buf);
++         return 0;
++       }
++
++      if ((size_t) (fs->end - fs->buf) < amount)
++       /* Gotta grow the buffer.  */
++       {
++         size_t old_size = fs->end - fs->buf;
++         size_t new_size = old_size + amount;
++         char *new_buf;
++
++         if (new_size < old_size || ! (new_buf = realloc (fs->buf, new_size)))
++           {
++             __set_errno (ENOMEM);
++             return 0;
++           }
++
++         fs->buf = new_buf;
++         fs->end = new_buf + new_size;
++         fs->p = fs->buf;
++       }
++    }
++
++  return 1;
++}
++
++ssize_t
++__argp_fmtstream_printf (struct argp_fmtstream *fs, const char *fmt, ...)
++{
++  int out;
++  size_t avail;
++  size_t size_guess = PRINTF_SIZE_GUESS; /* How much space to reserve. */
++
++  do
++    {
++      va_list args;
++
++      if (! __argp_fmtstream_ensure (fs, size_guess))
++       return -1;
++
++      va_start (args, fmt);
++      avail = fs->end - fs->p;
++      out = __vsnprintf (fs->p, avail, fmt, args);
++      va_end (args);
++      if ((size_t) out >= avail)
++       size_guess = out + 1;
++    }
++  while ((size_t) out >= avail);
++
++  fs->p += out;
++
++  return out;
++}
++#if 0
++/* Not exported.  */
++#ifdef weak_alias
++weak_alias (__argp_fmtstream_printf, argp_fmtstream_printf)
++#endif
++#endif
++
++#endif /* !ARGP_FMTSTREAM_USE_LINEWRAP */
+Index: git/libuargp/argp-fmtstream.h
+===================================================================
+--- /dev/null
++++ git/libuargp/argp-fmtstream.h
+@@ -0,0 +1,314 @@
++/* Word-wrapping and line-truncating streams.
++   Copyright (C) 1997 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++   Written by Miles Bader <miles at gnu.ai.mit.edu>.
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
++   02111-1307 USA.
++
++   Modified for uClibc by: Salvatore Cro <salvatore.cro at st.com>
++*/
++
++/* This package emulates glibc `line_wrap_stream' semantics for systems that
++   don't have that.  If the system does have it, it is just a wrapper for
++   that.  This header file is only used internally while compiling argp, and
++   shouldn't be installed.  */
++
++#ifndef _ARGP_FMTSTREAM_H
++#define _ARGP_FMTSTREAM_H
++
++#include <stdio.h>
++#include <string.h>
++#include <unistd.h>
++
++#ifndef __attribute__
++/* This feature is available in gcc versions 2.5 and later.  */
++# if __GNUC__ < 2 || (__GNUC__ == 2 && __GNUC_MINOR__ < 5) || defined(__STRICT_ANSI__)
++#  define __attribute__(Spec) /* empty */
++# endif
++/* The __-protected variants of `format' and `printf' attributes
++   are accepted by gcc versions 2.6.4 (effectively 2.7) and later.  */
++# if __GNUC__ < 2 || (__GNUC__ == 2 && __GNUC_MINOR__ < 7) || defined(__STRICT_ANSI__)
++#  define __format__ format
++#  define __printf__ printf
++# endif
++#endif
++
++#if 0 /* uClibc: disabled */
++#if    (_LIBC - 0 && !defined (USE_IN_LIBIO)) \
++    || (defined (__GNU_LIBRARY__) && defined (HAVE_LINEWRAP_H))
++/* line_wrap_stream is available, so use that.  */
++#define ARGP_FMTSTREAM_USE_LINEWRAP
++#endif
++#else
++/* line_wrap stream NOT available */
++# undef ARGP_FMTSTREAM_USE_LINEWRAP
++#endif
++
++#ifdef ARGP_FMTSTREAM_USE_LINEWRAP
++/* Just be a simple wrapper for line_wrap_stream; the semantics are
++   *slightly* different, as line_wrap_stream doesn't actually make a new
++   object, it just modifies the given stream (reversibly) to do
++   line-wrapping.  Since we control who uses this code, it doesn't matter.  */
++
++#include <linewrap.h>
++
++typedef FILE *argp_fmtstream_t;
++
++#define argp_make_fmtstream line_wrap_stream
++#define __argp_make_fmtstream line_wrap_stream
++#define argp_fmtstream_free line_unwrap_stream
++#define __argp_fmtstream_free line_unwrap_stream
++
++#define __argp_fmtstream_putc(fs,ch) putc(ch,fs)
++#define argp_fmtstream_putc(fs,ch) putc(ch,fs)
++#define __argp_fmtstream_puts(fs,str) fputs(str,fs)
++#define argp_fmtstream_puts(fs,str) fputs(str,fs)
++#define __argp_fmtstream_write(fs,str,len) fwrite(str,1,len,fs)
++#define argp_fmtstream_write(fs,str,len) fwrite(str,1,len,fs)
++#define __argp_fmtstream_printf fprintf
++#define argp_fmtstream_printf fprintf
++
++#define __argp_fmtstream_lmargin line_wrap_lmargin
++#define argp_fmtstream_lmargin line_wrap_lmargin
++#define __argp_fmtstream_set_lmargin line_wrap_set_lmargin
++#define argp_fmtstream_set_lmargin line_wrap_set_lmargin
++#define __argp_fmtstream_rmargin line_wrap_rmargin
++#define argp_fmtstream_rmargin line_wrap_rmargin
++#define __argp_fmtstream_set_rmargin line_wrap_set_rmargin
++#define argp_fmtstream_set_rmargin line_wrap_set_rmargin
++#define __argp_fmtstream_wmargin line_wrap_wmargin
++#define argp_fmtstream_wmargin line_wrap_wmargin
++#define __argp_fmtstream_set_wmargin line_wrap_set_wmargin
++#define argp_fmtstream_set_wmargin line_wrap_set_wmargin
++#define __argp_fmtstream_point line_wrap_point
++#define argp_fmtstream_point line_wrap_point
++
++#else /* !ARGP_FMTSTREAM_USE_LINEWRAP */
++/* Guess we have to define our own version.  */
++
++#ifndef __const
++#define __const const
++#endif
++
++struct argp_fmtstream
++{
++  FILE *stream;                        /* The stream we're outputting to.  */
++
++  size_t lmargin, rmargin;     /* Left and right margins.  */
++  ssize_t wmargin;             /* Margin to wrap to, or -1 to truncate.  */
++
++  /* Point in buffer to which we've processed for wrapping, but not output.  */
++  size_t point_offs;
++  /* Output column at POINT_OFFS, or -1 meaning 0 but don't add lmargin.  */
++  ssize_t point_col;
++
++  char *buf;                   /* Output buffer.  */
++  char *p;                     /* Current end of text in BUF. */
++  char *end;                   /* Absolute end of BUF.  */
++};
++
++typedef struct argp_fmtstream *argp_fmtstream_t;
++
++/* Return an argp_fmtstream that outputs to STREAM, and which prefixes lines
++   written on it with LMARGIN spaces and limits them to RMARGIN columns
++   total.  If WMARGIN >= 0, words that extend past RMARGIN are wrapped by
++   replacing the whitespace before them with a newline and WMARGIN spaces.
++   Otherwise, chars beyond RMARGIN are simply dropped until a newline.
++   Returns NULL if there was an error.  */
++extern argp_fmtstream_t __argp_make_fmtstream (FILE *__stream,
++                                              size_t __lmargin,
++                                              size_t __rmargin,
++                                              ssize_t __wmargin);
++extern argp_fmtstream_t argp_make_fmtstream (FILE *__stream,
++                                            size_t __lmargin,
++                                            size_t __rmargin,
++                                            ssize_t __wmargin);
++
++/* Flush __FS to its stream, and free it (but don't close the stream).  */
++extern void __argp_fmtstream_free (argp_fmtstream_t __fs);
++extern void argp_fmtstream_free (argp_fmtstream_t __fs);
++
++extern ssize_t __argp_fmtstream_printf (argp_fmtstream_t __fs,
++                                      __const char *__fmt, ...)
++     __attribute__ ((__format__ (printf, 2, 3)));
++extern ssize_t argp_fmtstream_printf (argp_fmtstream_t __fs,
++                                     __const char *__fmt, ...)
++     __attribute__ ((__format__ (printf, 2, 3)));
++
++extern int __argp_fmtstream_putc (argp_fmtstream_t __fs, int __ch);
++extern int argp_fmtstream_putc (argp_fmtstream_t __fs, int __ch);
++
++extern int __argp_fmtstream_puts (argp_fmtstream_t __fs, __const char *__str);
++extern int argp_fmtstream_puts (argp_fmtstream_t __fs, __const char *__str);
++
++extern size_t __argp_fmtstream_write (argp_fmtstream_t __fs,
++                                     __const char *__str, size_t __len);
++extern size_t argp_fmtstream_write (argp_fmtstream_t __fs,
++                                   __const char *__str, size_t __len);
++
++/* Access macros for various bits of state.  */
++#define argp_fmtstream_lmargin(__fs) ((__fs)->lmargin)
++#define argp_fmtstream_rmargin(__fs) ((__fs)->rmargin)
++#define argp_fmtstream_wmargin(__fs) ((__fs)->wmargin)
++#define __argp_fmtstream_lmargin argp_fmtstream_lmargin
++#define __argp_fmtstream_rmargin argp_fmtstream_rmargin
++#define __argp_fmtstream_wmargin argp_fmtstream_wmargin
++
++/* Set __FS's left margin to LMARGIN and return the old value.  */
++extern size_t argp_fmtstream_set_lmargin (argp_fmtstream_t __fs,
++                                         size_t __lmargin);
++extern size_t __argp_fmtstream_set_lmargin (argp_fmtstream_t __fs,
++                                           size_t __lmargin);
++
++/* Set __FS's right margin to __RMARGIN and return the old value.  */
++extern size_t argp_fmtstream_set_rmargin (argp_fmtstream_t __fs,
++                                         size_t __rmargin);
++extern size_t __argp_fmtstream_set_rmargin (argp_fmtstream_t __fs,
++                                           size_t __rmargin);
++
++/* Set __FS's wrap margin to __WMARGIN and return the old value.  */
++extern size_t argp_fmtstream_set_wmargin (argp_fmtstream_t __fs,
++                                         size_t __wmargin);
++extern size_t __argp_fmtstream_set_wmargin (argp_fmtstream_t __fs,
++                                           size_t __wmargin);
++
++/* Return the column number of the current output point in __FS.  */
++extern size_t argp_fmtstream_point (argp_fmtstream_t __fs);
++extern size_t __argp_fmtstream_point (argp_fmtstream_t __fs);
++
++/* Internal routines.  */
++extern void _argp_fmtstream_update (argp_fmtstream_t __fs);
++extern void __argp_fmtstream_update (argp_fmtstream_t __fs);
++extern int _argp_fmtstream_ensure (argp_fmtstream_t __fs, size_t __amount);
++extern int __argp_fmtstream_ensure (argp_fmtstream_t __fs, size_t __amount);
++
++#ifdef __OPTIMIZE__
++/* Inline versions of above routines.  */
++
++#if !_LIBC
++#define __argp_fmtstream_putc argp_fmtstream_putc
++#define __argp_fmtstream_puts argp_fmtstream_puts
++#define __argp_fmtstream_write argp_fmtstream_write
++#define __argp_fmtstream_set_lmargin argp_fmtstream_set_lmargin
++#define __argp_fmtstream_set_rmargin argp_fmtstream_set_rmargin
++#define __argp_fmtstream_set_wmargin argp_fmtstream_set_wmargin
++#define __argp_fmtstream_point argp_fmtstream_point
++#define __argp_fmtstream_update _argp_fmtstream_update
++#define __argp_fmtstream_ensure _argp_fmtstream_ensure
++#endif
++
++#ifndef ARGP_FS_EI
++#define ARGP_FS_EI __extern_inline
++#endif
++
++ARGP_FS_EI size_t
++__argp_fmtstream_write (argp_fmtstream_t __fs,
++                       __const char *__str, size_t __len)
++{
++  if (__fs->p + __len <= __fs->end || __argp_fmtstream_ensure (__fs, __len))
++    {
++      memcpy (__fs->p, __str, __len);
++      __fs->p += __len;
++      return __len;
++    }
++  else
++    return 0;
++}
++
++ARGP_FS_EI int
++__argp_fmtstream_puts (argp_fmtstream_t __fs, __const char *__str)
++{
++  size_t __len = strlen (__str);
++  if (__len)
++    {
++      size_t __wrote = __argp_fmtstream_write (__fs, __str, __len);
++      return __wrote == __len ? 0 : -1;
++    }
++  else
++    return 0;
++}
++
++ARGP_FS_EI int
++__argp_fmtstream_putc (argp_fmtstream_t __fs, int __ch)
++{
++  if (__fs->p < __fs->end || __argp_fmtstream_ensure (__fs, 1))
++    return *__fs->p++ = __ch;
++  else
++    return EOF;
++}
++
++/* Set __FS's left margin to __LMARGIN and return the old value.  */
++ARGP_FS_EI size_t
++__argp_fmtstream_set_lmargin (argp_fmtstream_t __fs, size_t __lmargin)
++{
++  size_t __old;
++  if ((size_t) (__fs->p - __fs->buf) > __fs->point_offs)
++    __argp_fmtstream_update (__fs);
++  __old = __fs->lmargin;
++  __fs->lmargin = __lmargin;
++  return __old;
++}
++
++/* Set __FS's right margin to __RMARGIN and return the old value.  */
++ARGP_FS_EI size_t
++__argp_fmtstream_set_rmargin (argp_fmtstream_t __fs, size_t __rmargin)
++{
++  size_t __old;
++  if ((size_t) (__fs->p - __fs->buf) > __fs->point_offs)
++    __argp_fmtstream_update (__fs);
++  __old = __fs->rmargin;
++  __fs->rmargin = __rmargin;
++  return __old;
++}
++
++/* Set FS's wrap margin to __WMARGIN and return the old value.  */
++ARGP_FS_EI size_t
++__argp_fmtstream_set_wmargin (argp_fmtstream_t __fs, size_t __wmargin)
++{
++  size_t __old;
++  if ((size_t) (__fs->p - __fs->buf) > __fs->point_offs)
++    __argp_fmtstream_update (__fs);
++  __old = __fs->wmargin;
++  __fs->wmargin = __wmargin;
++  return __old;
++}
++
++/* Return the column number of the current output point in __FS.  */
++ARGP_FS_EI size_t
++__argp_fmtstream_point (argp_fmtstream_t __fs)
++{
++  if ((size_t) (__fs->p - __fs->buf) > __fs->point_offs)
++    __argp_fmtstream_update (__fs);
++  return __fs->point_col >= 0 ? __fs->point_col : 0;
++}
++
++#if !_LIBC
++#undef __argp_fmtstream_putc
++#undef __argp_fmtstream_puts
++#undef __argp_fmtstream_write
++#undef __argp_fmtstream_set_lmargin
++#undef __argp_fmtstream_set_rmargin
++#undef __argp_fmtstream_set_wmargin
++#undef __argp_fmtstream_point
++#undef __argp_fmtstream_update
++#undef __argp_fmtstream_ensure
++#endif
++
++#endif /* __OPTIMIZE__ */
++
++#endif /* ARGP_FMTSTREAM_USE_LINEWRAP */
++
++#endif /* argp-fmtstream.h */
+Index: git/libuargp/argp-fs-xinl.c
+===================================================================
+--- /dev/null
++++ git/libuargp/argp-fs-xinl.c
+@@ -0,0 +1,44 @@
++/* Real definitions for extern inline functions in argp-fmtstream.h
++   Copyright (C) 1997, 2003, 2004 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++   Written by Miles Bader <miles at gnu.ai.mit.edu>.
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
++#ifdef HAVE_CONFIG_H
++# include <config.h>
++#endif
++
++#define ARGP_FS_EI
++#undef __OPTIMIZE__
++#define __OPTIMIZE__ 1
++#include "argp-fmtstream.h"
++
++#if 0
++/* Not exported.  */
++/* Add weak aliases.  */
++#if _LIBC - 0 && !defined (ARGP_FMTSTREAM_USE_LINEWRAP) && defined (weak_alias)
++
++weak_alias (__argp_fmtstream_putc, argp_fmtstream_putc)
++weak_alias (__argp_fmtstream_puts, argp_fmtstream_puts)
++weak_alias (__argp_fmtstream_write, argp_fmtstream_write)
++weak_alias (__argp_fmtstream_set_lmargin, argp_fmtstream_set_lmargin)
++weak_alias (__argp_fmtstream_set_rmargin, argp_fmtstream_set_rmargin)
++weak_alias (__argp_fmtstream_set_wmargin, argp_fmtstream_set_wmargin)
++weak_alias (__argp_fmtstream_point, argp_fmtstream_point)
++
++#endif
++#endif
+Index: git/libuargp/argp-help.c
+===================================================================
+--- /dev/null
++++ git/libuargp/argp-help.c
+@@ -0,0 +1,1882 @@
++/* Hierarchial argument parsing help output
++   Copyright (C) 1995-2003, 2004, 2005, 2006, 2007
++   Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++   Written by Miles Bader <miles at gnu.ai.mit.edu>.
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
++   02111-1307 USA.
++
++   Modified for uClibc by: Salvatore Cro <salvatore.cro at st.com>
++*/
++
++#ifndef _GNU_SOURCE
++# define _GNU_SOURCE   1
++#endif
++
++#ifdef HAVE_CONFIG_H
++#include <config.h>
++#endif
++
++/* AIX requires this to be the first thing in the file.  */
++#ifndef __GNUC__
++# if HAVE_ALLOCA_H || defined _LIBC
++#  include <alloca.h>
++# else
++#  ifdef _AIX
++#pragma alloca
++#  else
++#   ifndef alloca /* predefined by HP cc +Olibcalls */
++char *alloca ();
++#   endif
++#  endif
++# endif
++#endif
++
++#include <stddef.h>
++#include <stdlib.h>
++#include <string.h>
++#include <assert.h>
++#include <stdarg.h>
++#include <ctype.h>
++#include <limits.h>
++#ifdef _LIBC
++# include <wchar.h>
++#endif
++
++#include <features.h>
++#ifndef _
++/* This is for other GNU distributions with internationalized messages.  */
++# if (defined HAVE_LIBINTL_H || defined _LIBC) && defined __UCLIBC_HAS_GETTEXT_AWARENESS__
++#  include <libintl.h>
++#  ifdef _LIBC
++#   undef dgettext
++#   define dgettext(domain, msgid) \
++  INTUSE(__dcgettext) (domain, msgid, LC_MESSAGES)
++#  endif
++# else
++#  define dgettext(domain, msgid) (msgid)
++# endif
++#endif
++
++#ifndef _LIBC
++# if HAVE_STRERROR_R
++#  if !HAVE_DECL_STRERROR_R
++char *strerror_r (int errnum, char *buf, size_t buflen);
++#  endif
++# else
++#  if !HAVE_DECL_STRERROR
++char *strerror (int errnum);
++#  endif
++# endif
++#endif
++
++#include <argp.h>
++#include "argp-fmtstream.h"
++#include <stdbool.h>
++#include <stdint.h>
++
++#ifndef SIZE_MAX
++# define SIZE_MAX ((size_t) -1)
++#endif
++
++/* User-selectable (using an environment variable) formatting parameters.
++
++   These may be specified in an environment variable called `ARGP_HELP_FMT',
++   with a contents like:  VAR1=VAL1,VAR2=VAL2,BOOLVAR2,no-BOOLVAR2
++   Where VALn must be a positive integer.  The list of variables is in the
++   UPARAM_NAMES vector, below.  */
++
++/* Default parameters.  */
++#define DUP_ARGS      0                /* True if option argument can be duplicated. */
++#define DUP_ARGS_NOTE 1                /* True to print a note about duplicate args. */
++#define SHORT_OPT_COL 2                /* column in which short options start */
++#define LONG_OPT_COL  6                /* column in which long options start */
++#define DOC_OPT_COL   2                /* column in which doc options start */
++#define OPT_DOC_COL  29                /* column in which option text starts */
++#define HEADER_COL    1                /* column in which group headers are printed */
++#define USAGE_INDENT 12                /* indentation of wrapped usage lines */
++#define RMARGIN      79                /* right margin used for wrapping */
++
++/* User-selectable (using an environment variable) formatting parameters.
++   They must all be of type `int' for the parsing code to work.  */
++struct uparams
++{
++  /* If true, arguments for an option are shown with both short and long
++     options, even when a given option has both, e.g. `-x ARG, --longx=ARG'.
++     If false, then if an option has both, the argument is only shown with
++     the long one, e.g., `-x, --longx=ARG', and a message indicating that
++     this really means both is printed below the options.  */
++  int dup_args;
++
++  /* This is true if when DUP_ARGS is false, and some duplicate arguments have
++     been suppressed, an explanatory message should be printed.  */
++  int dup_args_note;
++
++  /* Various output columns.  */
++  int short_opt_col;
++  int long_opt_col;
++  int doc_opt_col;
++  int opt_doc_col;
++  int header_col;
++  int usage_indent;
++  int rmargin;
++};
++
++/* This is a global variable, as user options are only ever read once.  */
++static struct uparams uparams = {
++  DUP_ARGS, DUP_ARGS_NOTE,
++  SHORT_OPT_COL, LONG_OPT_COL, DOC_OPT_COL, OPT_DOC_COL, HEADER_COL,
++  USAGE_INDENT, RMARGIN
++};
++
++/* A particular uparam, and what the user name is.  */
++struct uparam_name
++{
++  const char name[14];         /* User name.  */
++  bool is_bool;                        /* Whether it's `boolean'.  */
++  uint8_t uparams_offs;                /* Location of the (int) field in UPARAMS.  */
++};
++
++/* The name-field mappings we know about.  */
++static const struct uparam_name uparam_names[] =
++{
++  { "dup-args",       true, offsetof (struct uparams, dup_args) },
++  { "dup-args-note",  true, offsetof (struct uparams, dup_args_note) },
++  { "short-opt-col",  false, offsetof (struct uparams, short_opt_col) },
++  { "long-opt-col",   false, offsetof (struct uparams, long_opt_col) },
++  { "doc-opt-col",    false, offsetof (struct uparams, doc_opt_col) },
++  { "opt-doc-col",    false, offsetof (struct uparams, opt_doc_col) },
++  { "header-col",     false, offsetof (struct uparams, header_col) },
++  { "usage-indent",   false, offsetof (struct uparams, usage_indent) },
++  { "rmargin",        false, offsetof (struct uparams, rmargin) }
++};
++#define nuparam_names (sizeof (uparam_names) / sizeof (uparam_names[0]))
++
++/* Read user options from the environment, and fill in UPARAMS appropiately.  */
++static void
++fill_in_uparams (const struct argp_state *state)
++{
++  const char *var = getenv ("ARGP_HELP_FMT");
++
++#define SKIPWS(p) do { while (isspace (*p)) p++; } while (0);
++
++  if (var)
++    /* Parse var. */
++    while (*var)
++      {
++       SKIPWS (var);
++
++       if (isalpha (*var))
++         {
++           size_t var_len;
++           const struct uparam_name *un;
++           int unspec = 0, val = 0;
++           const char *arg = var;
++
++           while (isalnum (*arg) || *arg == '-' || *arg == '_')
++             arg++;
++           var_len = arg - var;
++
++           SKIPWS (arg);
++
++           if (*arg == '\0' || *arg == ',')
++             unspec = 1;
++           else if (*arg == '=')
++             {
++               arg++;
++               SKIPWS (arg);
++             }
++
++           if (unspec)
++             {
++               if (var[0] == 'n' && var[1] == 'o' && var[2] == '-')
++                 {
++                   val = 0;
++                   var += 3;
++                   var_len -= 3;
++                 }
++               else
++                 val = 1;
++             }
++           else if (isdigit (*arg))
++             {
++               val = atoi (arg);
++               while (isdigit (*arg))
++                 arg++;
++               SKIPWS (arg);
++             }
++
++           un = uparam_names;
++           size_t u;
++           for (u = 0; u < nuparam_names; ++un, ++u)
++             if (strlen (un->name) == var_len
++                 && strncmp (var, un->name, var_len) == 0)
++               {
++                 if (unspec && !un->is_bool)
++                   argp_failure (state, 0, 0,
++                                   dgettext (state == NULL ? NULL
++                                             : state->root_argp->argp_domain,
++                                             "\
++%.*s: ARGP_HELP_FMT parameter requires a value"),
++                                   (int) var_len, var);
++                 else
++                   *(int *)((char *)&uparams + un->uparams_offs) = val;
++                 break;
++               }
++           if (u == nuparam_names)
++             argp_failure (state, 0, 0,
++                             dgettext (state == NULL ? NULL
++                                       : state->root_argp->argp_domain, "\
++%.*s: Unknown ARGP_HELP_FMT parameter"),
++                             (int) var_len, var);
++
++           var = arg;
++           if (*var == ',')
++             var++;
++         }
++       else if (*var)
++         {
++           argp_failure (state, 0, 0,
++                           dgettext (state == NULL ? NULL
++                                     : state->root_argp->argp_domain,
++                                     "Garbage in ARGP_HELP_FMT: %s"), var);
++           break;
++         }
++      }
++}
++
++/* Returns true if OPT hasn't been marked invisible.  Visibility only affects
++   whether OPT is displayed or used in sorting, not option shadowing.  */
++#define ovisible(opt) (! ((opt)->flags & OPTION_HIDDEN))
++
++/* Returns true if OPT is an alias for an earlier option.  */
++#define oalias(opt) ((opt)->flags & OPTION_ALIAS)
++
++/* Returns true if OPT is an documentation-only entry.  */
++#define odoc(opt) ((opt)->flags & OPTION_DOC)
++
++/* Returns true if OPT is the end-of-list marker for a list of options.  */
++#define oend(opt) __option_is_end (opt)
++
++/* Returns true if OPT has a short option.  */
++#define oshort(opt) __option_is_short (opt)
++
++/*
++   The help format for a particular option is like:
++
++     -xARG, -yARG, --long1=ARG, --long2=ARG        Documentation...
++
++   Where ARG will be omitted if there's no argument, for this option, or
++   will be surrounded by "[" and "]" appropiately if the argument is
++   optional.  The documentation string is word-wrapped appropiately, and if
++   the list of options is long enough, it will be started on a separate line.
++   If there are no short options for a given option, the first long option is
++   indented slighly in a way that's supposed to make most long options appear
++   to be in a separate column.
++
++   For example, the following output (from ps):
++
++     -p PID, --pid=PID          List the process PID
++        --pgrp=PGRP            List processes in the process group PGRP
++     -P, -x, --no-parent        Include processes without parents
++     -Q, --all-fields           Don't elide unusable fields (normally if there's
++                               some reason ps can't print a field for any
++                               process, it's removed from the output entirely)
++     -r, --reverse, --gratuitously-long-reverse-option
++                               Reverse the order of any sort
++        --session[=SID]        Add the processes from the session SID (which
++                               defaults to the sid of the current process)
++
++    Here are some more options:
++     -f ZOT, --foonly=ZOT       Glork a foonly
++     -z, --zaza                 Snit a zar
++
++     -?, --help                 Give this help list
++        --usage                Give a short usage message
++     -V, --version              Print program version
++
++   The struct argp_option array for the above could look like:
++
++   {
++     {"pid",       'p',      "PID",  0, "List the process PID"},
++     {"pgrp",      OPT_PGRP, "PGRP", 0, "List processes in the process group PGRP"},
++     {"no-parent", 'P',              0,     0, "Include processes without parents"},
++     {0,           'x',       0,     OPTION_ALIAS},
++     {"all-fields",'Q',       0,     0, "Don't elide unusable fields (normally"
++                                        " if there's some reason ps can't"
++                                       " print a field for any process, it's"
++                                        " removed from the output entirely)" },
++     {"reverse",   'r',       0,     0, "Reverse the order of any sort"},
++     {"gratuitously-long-reverse-option", 0, 0, OPTION_ALIAS},
++     {"session",   OPT_SESS,  "SID", OPTION_ARG_OPTIONAL,
++                                        "Add the processes from the session"
++                                       " SID (which defaults to the sid of"
++                                       " the current process)" },
++
++     {0,0,0,0, "Here are some more options:"},
++     {"foonly", 'f', "ZOT", 0, "Glork a foonly"},
++     {"zaza", 'z', 0, 0, "Snit a zar"},
++
++     {0}
++   }
++
++   Note that the last three options are automatically supplied by argp_parse,
++   unless you tell it not to with ARGP_NO_HELP.
++
++*/
++
++/* Returns true if CH occurs between BEG and END.  */
++static int
++find_char (char ch, char *beg, char *end)
++{
++  while (beg < end)
++    if (*beg == ch)
++      return 1;
++    else
++      beg++;
++  return 0;
++}
++
++struct hol_cluster;            /* fwd decl */
++
++struct hol_entry
++{
++  /* First option.  */
++  const struct argp_option *opt;
++  /* Number of options (including aliases).  */
++  unsigned num;
++
++  /* A pointers into the HOL's short_options field, to the first short option
++     letter for this entry.  The order of the characters following this point
++     corresponds to the order of options pointed to by OPT, and there are at
++     most NUM.  A short option recorded in a option following OPT is only
++     valid if it occurs in the right place in SHORT_OPTIONS (otherwise it's
++     probably been shadowed by some other entry).  */
++  char *short_options;
++
++  /* Entries are sorted by their group first, in the order:
++       1, 2, ..., n, 0, -m, ..., -2, -1
++     and then alphabetically within each group.  The default is 0.  */
++  int group;
++
++  /* The cluster of options this entry belongs to, or 0 if none.  */
++  struct hol_cluster *cluster;
++
++  /* The argp from which this option came.  */
++  const struct argp *argp;
++};
++
++/* A cluster of entries to reflect the argp tree structure.  */
++struct hol_cluster
++{
++  /* A descriptive header printed before options in this cluster.  */
++  const char *header;
++
++  /* Used to order clusters within the same group with the same parent,
++     according to the order in which they occurred in the parent argp's child
++     list.  */
++  int index;
++
++  /* How to sort this cluster with respect to options and other clusters at the
++     same depth (clusters always follow options in the same group).  */
++  int group;
++
++  /* The cluster to which this cluster belongs, or 0 if it's at the base
++     level.  */
++  struct hol_cluster *parent;
++
++  /* The argp from which this cluster is (eventually) derived.  */
++  const struct argp *argp;
++
++  /* The distance this cluster is from the root.  */
++  int depth;
++
++  /* Clusters in a given hol are kept in a linked list, to make freeing them
++     possible.  */
++  struct hol_cluster *next;
++};
++
++/* A list of options for help.  */
++struct hol
++{
++  /* An array of hol_entry's.  */
++  struct hol_entry *entries;
++  /* The number of entries in this hol.  If this field is zero, the others
++     are undefined.  */
++  unsigned num_entries;
++
++  /* A string containing all short options in this HOL.  Each entry contains
++     pointers into this string, so the order can't be messed with blindly.  */
++  char *short_options;
++
++  /* Clusters of entries in this hol.  */
++  struct hol_cluster *clusters;
++};
++
++/* Create a struct hol from the options in ARGP.  CLUSTER is the
++   hol_cluster in which these entries occur, or 0, if at the root.  */
++static struct hol *
++make_hol (const struct argp *argp, struct hol_cluster *cluster)
++{
++  char *so;
++  const struct argp_option *o;
++  const struct argp_option *opts = argp->options;
++  struct hol_entry *entry;
++  unsigned num_short_options = 0;
++  struct hol *hol = malloc (sizeof (struct hol));
++
++  assert (hol);
++
++  hol->num_entries = 0;
++  hol->clusters = 0;
++
++  if (opts)
++    {
++      int cur_group = 0;
++
++      /* The first option must not be an alias.  */
++      assert (! oalias (opts));
++
++      /* Calculate the space needed.  */
++      for (o = opts; ! oend (o); o++)
++       {
++         if (! oalias (o))
++           hol->num_entries++;
++         if (oshort (o))
++           num_short_options++;        /* This is an upper bound.  */
++       }
++
++      hol->entries = malloc (sizeof (struct hol_entry) * hol->num_entries);
++      hol->short_options = malloc (num_short_options + 1);
++
++      assert (hol->entries && hol->short_options);
++#if SIZE_MAX <= UINT_MAX
++      assert (hol->num_entries <= SIZE_MAX / sizeof (struct hol_entry));
++#endif
++
++      /* Fill in the entries.  */
++      so = hol->short_options;
++      for (o = opts, entry = hol->entries; ! oend (o); entry++)
++       {
++         entry->opt = o;
++         entry->num = 0;
++         entry->short_options = so;
++         entry->group = cur_group =
++           o->group
++           ? o->group
++           : ((!o->name && !o->key)
++              ? cur_group + 1
++              : cur_group);
++         entry->cluster = cluster;
++         entry->argp = argp;
++
++         do
++           {
++             entry->num++;
++             if (oshort (o) && ! find_char (o->key, hol->short_options, so))
++               /* O has a valid short option which hasn't already been used.*/
++               *so++ = o->key;
++             o++;
++           }
++         while (! oend (o) && oalias (o));
++       }
++      *so = '\0';              /* null terminated so we can find the length */
++    }
++
++  return hol;
++}
++
++/* Add a new cluster to HOL, with the given GROUP and HEADER (taken from the
++   associated argp child list entry), INDEX, and PARENT, and return a pointer
++   to it.  ARGP is the argp that this cluster results from.  */
++static struct hol_cluster *
++hol_add_cluster (struct hol *hol, int group, const char *header, int index,
++                struct hol_cluster *parent, const struct argp *argp)
++{
++  struct hol_cluster *cl = malloc (sizeof (struct hol_cluster));
++  if (cl)
++    {
++      cl->group = group;
++      cl->header = header;
++
++      cl->index = index;
++      cl->parent = parent;
++      cl->argp = argp;
++      cl->depth = parent ? parent->depth + 1 : 0;
++
++      cl->next = hol->clusters;
++      hol->clusters = cl;
++    }
++  return cl;
++}
++
++/* Free HOL and any resources it uses.  */
++static void
++hol_free (struct hol *hol)
++{
++  struct hol_cluster *cl = hol->clusters;
++
++  while (cl)
++    {
++      struct hol_cluster *next = cl->next;
++      free (cl);
++      cl = next;
++    }
++
++  if (hol->num_entries > 0)
++    {
++      free (hol->entries);
++      free (hol->short_options);
++    }
++
++  free (hol);
++}
++
++static int
++hol_entry_short_iterate (const struct hol_entry *entry,
++                        int (*func)(const struct argp_option *opt,
++                                    const struct argp_option *real,
++                                    const char *domain, void *cookie),
++                        const char *domain, void *cookie)
++{
++  unsigned nopts;
++  int val = 0;
++  const struct argp_option *opt, *real = entry->opt;
++  char *so = entry->short_options;
++
++  for (opt = real, nopts = entry->num; nopts > 0 && !val; opt++, nopts--)
++    if (oshort (opt) && *so == opt->key)
++      {
++       if (!oalias (opt))
++         real = opt;
++       if (ovisible (opt))
++         val = (*func)(opt, real, domain, cookie);
++       so++;
++      }
++
++  return val;
++}
++
++static __inline__ int
++__attribute__ ((always_inline))
++hol_entry_long_iterate (const struct hol_entry *entry,
++                       int (*func)(const struct argp_option *opt,
++                                   const struct argp_option *real,
++                                   const char *domain, void *cookie),
++                       const char *domain, void *cookie)
++{
++  unsigned nopts;
++  int val = 0;
++  const struct argp_option *opt, *real = entry->opt;
++
++  for (opt = real, nopts = entry->num; nopts > 0 && !val; opt++, nopts--)
++    if (opt->name)
++      {
++       if (!oalias (opt))
++         real = opt;
++       if (ovisible (opt))
++         val = (*func)(opt, real, domain, cookie);
++      }
++
++  return val;
++}
++
++/* Iterator that returns true for the first short option.  */
++static __inline__ int
++until_short (const struct argp_option *opt, const struct argp_option *real,
++            const char *domain, void *cookie)
++{
++  return oshort (opt) ? opt->key : 0;
++}
++
++/* Returns the first valid short option in ENTRY, or 0 if there is none.  */
++static char
++hol_entry_first_short (const struct hol_entry *entry)
++{
++  return hol_entry_short_iterate (entry, until_short,
++                                 entry->argp->argp_domain, 0);
++}
++
++/* Returns the first valid long option in ENTRY, or 0 if there is none.  */
++static const char *
++hol_entry_first_long (const struct hol_entry *entry)
++{
++  const struct argp_option *opt;
++  unsigned num;
++  for (opt = entry->opt, num = entry->num; num > 0; opt++, num--)
++    if (opt->name && ovisible (opt))
++      return opt->name;
++  return 0;
++}
++
++/* Returns the entry in HOL with the long option name NAME, or 0 if there is
++   none.  */
++static struct hol_entry *
++hol_find_entry (struct hol *hol, const char *name)
++{
++  struct hol_entry *entry = hol->entries;
++  unsigned num_entries = hol->num_entries;
++
++  while (num_entries-- > 0)
++    {
++      const struct argp_option *opt = entry->opt;
++      unsigned num_opts = entry->num;
++
++      while (num_opts-- > 0)
++       if (opt->name && ovisible (opt) && strcmp (opt->name, name) == 0)
++         return entry;
++       else
++         opt++;
++
++      entry++;
++    }
++
++  return 0;
++}
++
++/* If an entry with the long option NAME occurs in HOL, set it's special
++   sort position to GROUP.  */
++static void
++hol_set_group (struct hol *hol, const char *name, int group)
++{
++  struct hol_entry *entry = hol_find_entry (hol, name);
++  if (entry)
++    entry->group = group;
++}
++
++/* Order by group:  0, 1, 2, ..., n, -m, ..., -2, -1.
++   EQ is what to return if GROUP1 and GROUP2 are the same.  */
++static int
++group_cmp (int group1, int group2, int eq)
++{
++  if (group1 == group2)
++    return eq;
++  else if ((group1 < 0 && group2 < 0) || (group1 >= 0 && group2 >= 0))
++    return group1 - group2;
++  else
++    return group2 - group1;
++}
++
++/* Compare clusters CL1 & CL2 by the order that they should appear in
++   output.  */
++static int
++hol_cluster_cmp (const struct hol_cluster *cl1, const struct hol_cluster *cl2)
++{
++  /* If one cluster is deeper than the other, use its ancestor at the same
++     level, so that finding the common ancestor is straightforward.  */
++  while (cl1->depth > cl2->depth)
++    cl1 = cl1->parent;
++  while (cl2->depth > cl1->depth)
++    cl2 = cl2->parent;
++
++  /* Now reduce both clusters to their ancestors at the point where both have
++     a common parent; these can be directly compared.  */
++  while (cl1->parent != cl2->parent)
++    cl1 = cl1->parent, cl2 = cl2->parent;
++
++  return group_cmp (cl1->group, cl2->group, cl2->index - cl1->index);
++}
++
++/* Return the ancestor of CL that's just below the root (i.e., has a parent
++   of 0).  */
++static struct hol_cluster *
++hol_cluster_base (struct hol_cluster *cl)
++{
++  while (cl->parent)
++    cl = cl->parent;
++  return cl;
++}
++
++/* Return true if CL1 is a child of CL2.  */
++static int
++hol_cluster_is_child (const struct hol_cluster *cl1,
++                     const struct hol_cluster *cl2)
++{
++  while (cl1 && cl1 != cl2)
++    cl1 = cl1->parent;
++  return cl1 == cl2;
++}
++
++/* Given the name of a OPTION_DOC option, modifies NAME to start at the tail
++   that should be used for comparisons, and returns true iff it should be
++   treated as a non-option.  */
++static int
++canon_doc_option (const char **name)
++{
++  int non_opt;
++  /* Skip initial whitespace.  */
++  while (isspace (**name))
++    (*name)++;
++  /* Decide whether this looks like an option (leading `-') or not.  */
++  non_opt = (**name != '-');
++  /* Skip until part of name used for sorting.  */
++  while (**name && !isalnum (**name))
++    (*name)++;
++  return non_opt;
++}
++
++/* Order ENTRY1 & ENTRY2 by the order which they should appear in a help
++   listing.  */
++static int
++hol_entry_cmp (const struct hol_entry *entry1,
++              const struct hol_entry *entry2)
++{
++  /* The group numbers by which the entries should be ordered; if either is
++     in a cluster, then this is just the group within the cluster.  */
++  int group1 = entry1->group, group2 = entry2->group;
++
++  if (entry1->cluster != entry2->cluster)
++    {
++      /* The entries are not within the same cluster, so we can't compare them
++        directly, we have to use the appropiate clustering level too.  */
++      if (! entry1->cluster)
++       /* ENTRY1 is at the `base level', not in a cluster, so we have to
++          compare it's group number with that of the base cluster in which
++          ENTRY2 resides.  Note that if they're in the same group, the
++          clustered option always comes laster.  */
++       return group_cmp (group1, hol_cluster_base (entry2->cluster)->group, -1);
++      else if (! entry2->cluster)
++       /* Likewise, but ENTRY2's not in a cluster.  */
++       return group_cmp (hol_cluster_base (entry1->cluster)->group, group2, 1);
++      else
++       /* Both entries are in clusters, we can just compare the clusters.  */
++       return hol_cluster_cmp (entry1->cluster, entry2->cluster);
++    }
++  else if (group1 == group2)
++    /* The entries are both in the same cluster and group, so compare them
++       alphabetically.  */
++    {
++      int short1 = hol_entry_first_short (entry1);
++      int short2 = hol_entry_first_short (entry2);
++      int doc1 = odoc (entry1->opt);
++      int doc2 = odoc (entry2->opt);
++      const char *long1 = hol_entry_first_long (entry1);
++      const char *long2 = hol_entry_first_long (entry2);
++
++      if (doc1)
++       doc1 = long1 != NULL && canon_doc_option (&long1);
++      if (doc2)
++       doc2 = long2 != NULL && canon_doc_option (&long2);
++
++      if (doc1 != doc2)
++       /* `documentation' options always follow normal options (or
++          documentation options that *look* like normal options).  */
++       return doc1 - doc2;
++      else if (!short1 && !short2 && long1 && long2)
++       /* Only long options.  */
++       return strcasecmp (long1, long2);
++      else
++       /* Compare short/short, long/short, short/long, using the first
++          character of long options.  Entries without *any* valid
++          options (such as options with OPTION_HIDDEN set) will be put
++          first, but as they're not displayed, it doesn't matter where
++          they are.  */
++       {
++         char first1 = short1 ? short1 : long1 ? *long1 : 0;
++         char first2 = short2 ? short2 : long2 ? *long2 : 0;
++#ifdef _tolower
++         int lower_cmp = _tolower (first1) - _tolower (first2);
++#else
++         int lower_cmp = tolower (first1) - tolower (first2);
++#endif
++         /* Compare ignoring case, except when the options are both the
++            same letter, in which case lower-case always comes first.  */
++         return lower_cmp ? lower_cmp : first2 - first1;
++       }
++    }
++  else
++    /* Within the same cluster, but not the same group, so just compare
++       groups.  */
++    return group_cmp (group1, group2, 0);
++}
++
++/* Version of hol_entry_cmp with correct signature for qsort.  */
++static int
++hol_entry_qcmp (const void *entry1_v, const void *entry2_v)
++{
++  return hol_entry_cmp (entry1_v, entry2_v);
++}
++
++/* Sort HOL by group and alphabetically by option name (with short options
++   taking precedence over long).  Since the sorting is for display purposes
++   only, the shadowing of options isn't effected.  */
++static void
++hol_sort (struct hol *hol)
++{
++  if (hol->num_entries > 0)
++    qsort (hol->entries, hol->num_entries, sizeof (struct hol_entry),
++          hol_entry_qcmp);
++}
++
++/* Append MORE to HOL, destroying MORE in the process.  Options in HOL shadow
++   any in MORE with the same name.  */
++static void
++hol_append (struct hol *hol, struct hol *more)
++{
++  struct hol_cluster **cl_end = &hol->clusters;
++
++  /* Steal MORE's cluster list, and add it to the end of HOL's.  */
++  while (*cl_end)
++    cl_end = &(*cl_end)->next;
++  *cl_end = more->clusters;
++  more->clusters = 0;
++
++  /* Merge entries.  */
++  if (more->num_entries > 0)
++    {
++      if (hol->num_entries == 0)
++       {
++         hol->num_entries = more->num_entries;
++         hol->entries = more->entries;
++         hol->short_options = more->short_options;
++         more->num_entries = 0;        /* Mark MORE's fields as invalid.  */
++       }
++      else
++       /* Append the entries in MORE to those in HOL, taking care to only add
++          non-shadowed SHORT_OPTIONS values.  */
++       {
++         unsigned left;
++         char *so, *more_so;
++         struct hol_entry *e;
++         unsigned num_entries = hol->num_entries + more->num_entries;
++         struct hol_entry *entries =
++           malloc (num_entries * sizeof (struct hol_entry));
++         unsigned hol_so_len = strlen (hol->short_options);
++         char *short_options =
++           malloc (hol_so_len + strlen (more->short_options) + 1);
++
++         assert (entries && short_options);
++#if SIZE_MAX <= UINT_MAX
++         assert (num_entries <= SIZE_MAX / sizeof (struct hol_entry));
++#endif
++
++         mempcpy (mempcpy (entries, hol->entries,
++                               hol->num_entries * sizeof (struct hol_entry)),
++                    more->entries,
++                    more->num_entries * sizeof (struct hol_entry));
++
++         mempcpy (short_options, hol->short_options, hol_so_len);
++
++         /* Fix up the short options pointers from HOL.  */
++         for (e = entries, left = hol->num_entries; left > 0; e++, left--)
++           e->short_options += (short_options - hol->short_options);
++
++         /* Now add the short options from MORE, fixing up its entries
++            too.  */
++         so = short_options + hol_so_len;
++         more_so = more->short_options;
++         for (left = more->num_entries; left > 0; e++, left--)
++           {
++             int opts_left;
++             const struct argp_option *opt;
++
++             e->short_options = so;
++
++             for (opts_left = e->num, opt = e->opt; opts_left; opt++, opts_left--)
++               {
++                 int ch = *more_so;
++                 if (oshort (opt) && ch == opt->key)
++                   /* The next short option in MORE_SO, CH, is from OPT.  */
++                   {
++                     if (! find_char (ch, short_options,
++                                      short_options + hol_so_len))
++                       /* The short option CH isn't shadowed by HOL's options,
++                          so add it to the sum.  */
++                       *so++ = ch;
++                     more_so++;
++                   }
++               }
++           }
++
++         *so = '\0';
++
++         free (hol->entries);
++         free (hol->short_options);
++
++         hol->entries = entries;
++         hol->num_entries = num_entries;
++         hol->short_options = short_options;
++       }
++    }
++
++  hol_free (more);
++}
++
++/* Inserts enough spaces to make sure STREAM is at column COL.  */
++static void
++indent_to (argp_fmtstream_t stream, unsigned col)
++{
++  int needed = col - __argp_fmtstream_point (stream);
++  while (needed-- > 0)
++    __argp_fmtstream_putc (stream, ' ');
++}
++
++/* Output to STREAM either a space, or a newline if there isn't room for at
++   least ENSURE characters before the right margin.  */
++static void
++space (argp_fmtstream_t stream, size_t ensure)
++{
++  if (__argp_fmtstream_point (stream) + ensure
++      >= __argp_fmtstream_rmargin (stream))
++    __argp_fmtstream_putc (stream, '\n');
++  else
++    __argp_fmtstream_putc (stream, ' ');
++}
++
++/* If the option REAL has an argument, we print it in using the printf
++   format REQ_FMT or OPT_FMT depending on whether it's a required or
++   optional argument.  */
++static void
++arg (const struct argp_option *real, const char *req_fmt, const char *opt_fmt,
++     const char *domain, argp_fmtstream_t stream)
++{
++  if (real->arg)
++    {
++      if (real->flags & OPTION_ARG_OPTIONAL)
++       __argp_fmtstream_printf (stream, opt_fmt,
++                                dgettext (domain, real->arg));
++      else
++       __argp_fmtstream_printf (stream, req_fmt,
++                                dgettext (domain, real->arg));
++    }
++}
++
++/* Helper functions for hol_entry_help.  */
++
++/* State used during the execution of hol_help.  */
++struct hol_help_state
++{
++  /* PREV_ENTRY should contain the previous entry printed, or 0.  */
++  struct hol_entry *prev_entry;
++
++  /* If an entry is in a different group from the previous one, and SEP_GROUPS
++     is true, then a blank line will be printed before any output. */
++  int sep_groups;
++
++  /* True if a duplicate option argument was suppressed (only ever set if
++     UPARAMS.dup_args is false).  */
++  int suppressed_dup_arg;
++};
++
++/* Some state used while printing a help entry (used to communicate with
++   helper functions).  See the doc for hol_entry_help for more info, as most
++   of the fields are copied from its arguments.  */
++struct pentry_state
++{
++  const struct hol_entry *entry;
++  argp_fmtstream_t stream;
++  struct hol_help_state *hhstate;
++
++  /* True if nothing's been printed so far.  */
++  int first;
++
++  /* If non-zero, the state that was used to print this help.  */
++  const struct argp_state *state;
++};
++
++/* If a user doc filter should be applied to DOC, do so.  */
++static const char *
++filter_doc (const char *doc, int key, const struct argp *argp,
++           const struct argp_state *state)
++{
++  if (argp && argp->help_filter)
++    /* We must apply a user filter to this output.  */
++    {
++      void *input = __argp_input (argp, state);
++      return (*argp->help_filter) (key, doc, input);
++    }
++  else
++    /* No filter.  */
++    return doc;
++}
++
++/* Prints STR as a header line, with the margin lines set appropiately, and
++   notes the fact that groups should be separated with a blank line.  ARGP is
++   the argp that should dictate any user doc filtering to take place.  Note
++   that the previous wrap margin isn't restored, but the left margin is reset
++   to 0.  */
++static void
++print_header (const char *str, const struct argp *argp,
++             struct pentry_state *pest)
++{
++  const char *tstr = dgettext (argp->argp_domain, str);
++  const char *fstr = filter_doc (tstr, ARGP_KEY_HELP_HEADER, argp, pest->state);
++
++  if (fstr)
++    {
++      if (*fstr)
++       {
++         if (pest->hhstate->prev_entry)
++           /* Precede with a blank line.  */
++           __argp_fmtstream_putc (pest->stream, '\n');
++         indent_to (pest->stream, uparams.header_col);
++         __argp_fmtstream_set_lmargin (pest->stream, uparams.header_col);
++         __argp_fmtstream_set_wmargin (pest->stream, uparams.header_col);
++         __argp_fmtstream_puts (pest->stream, fstr);
++         __argp_fmtstream_set_lmargin (pest->stream, 0);
++         __argp_fmtstream_putc (pest->stream, '\n');
++       }
++
++      pest->hhstate->sep_groups = 1; /* Separate subsequent groups. */
++    }
++
++  if (fstr != tstr)
++    free ((char *) fstr);
++}
++
++/* Inserts a comma if this isn't the first item on the line, and then makes
++   sure we're at least to column COL.  If this *is* the first item on a line,
++   prints any pending whitespace/headers that should precede this line. Also
++   clears FIRST.  */
++static void
++comma (unsigned col, struct pentry_state *pest)
++{
++  if (pest->first)
++    {
++      const struct hol_entry *pe = pest->hhstate->prev_entry;
++      const struct hol_cluster *cl = pest->entry->cluster;
++
++      if (pest->hhstate->sep_groups && pe && pest->entry->group != pe->group)
++       __argp_fmtstream_putc (pest->stream, '\n');
++
++      if (cl && cl->header && *cl->header
++         && (!pe
++             || (pe->cluster != cl
++                 && !hol_cluster_is_child (pe->cluster, cl))))
++       /* If we're changing clusters, then this must be the start of the
++          ENTRY's cluster unless that is an ancestor of the previous one
++          (in which case we had just popped into a sub-cluster for a bit).
++          If so, then print the cluster's header line.  */
++       {
++         int old_wm = __argp_fmtstream_wmargin (pest->stream);
++         print_header (cl->header, cl->argp, pest);
++         __argp_fmtstream_set_wmargin (pest->stream, old_wm);
++       }
++
++      pest->first = 0;
++    }
++  else
++    __argp_fmtstream_puts (pest->stream, ", ");
++
++  indent_to (pest->stream, col);
++}
++
++/* Print help for ENTRY to STREAM.  */
++static void
++hol_entry_help (struct hol_entry *entry, const struct argp_state *state,
++               argp_fmtstream_t stream, struct hol_help_state *hhstate)
++{
++  unsigned num;
++  const struct argp_option *real = entry->opt, *opt;
++  char *so = entry->short_options;
++  int have_long_opt = 0;       /* We have any long options.  */
++  /* Saved margins.  */
++  int old_lm = __argp_fmtstream_set_lmargin (stream, 0);
++  int old_wm = __argp_fmtstream_wmargin (stream);
++  /* PEST is a state block holding some of our variables that we'd like to
++     share with helper functions.  */
++  struct pentry_state pest = { entry, stream, hhstate, 1, state };
++
++  if (! odoc (real))
++    for (opt = real, num = entry->num; num > 0; opt++, num--)
++      if (opt->name && ovisible (opt))
++       {
++         have_long_opt = 1;
++         break;
++       }
++
++  /* First emit short options.  */
++  __argp_fmtstream_set_wmargin (stream, uparams.short_opt_col); /* For truly bizarre cases. */
++  for (opt = real, num = entry->num; num > 0; opt++, num--)
++    if (oshort (opt) && opt->key == *so)
++      /* OPT has a valid (non shadowed) short option.  */
++      {
++       if (ovisible (opt))
++         {
++           comma (uparams.short_opt_col, &pest);
++           __argp_fmtstream_putc (stream, '-');
++           __argp_fmtstream_putc (stream, *so);
++           if (!have_long_opt || uparams.dup_args)
++             arg (real, " %s", "[%s]",
++                  state == NULL ? NULL : state->root_argp->argp_domain,
++                  stream);
++           else if (real->arg)
++             hhstate->suppressed_dup_arg = 1;
++         }
++       so++;
++      }
++
++  /* Now, long options.  */
++  if (odoc (real))
++    /* A `documentation' option.  */
++    {
++      __argp_fmtstream_set_wmargin (stream, uparams.doc_opt_col);
++      for (opt = real, num = entry->num; num > 0; opt++, num--)
++       if (opt->name && ovisible (opt))
++         {
++           comma (uparams.doc_opt_col, &pest);
++           /* Calling gettext here isn't quite right, since sorting will
++              have been done on the original; but documentation options
++              should be pretty rare anyway...  */
++           __argp_fmtstream_puts (stream,
++                                  dgettext (state == NULL ? NULL
++                                            : state->root_argp->argp_domain,
++                                            opt->name));
++         }
++    }
++  else
++    /* A real long option.  */
++    {
++      __argp_fmtstream_set_wmargin (stream, uparams.long_opt_col);
++      for (opt = real, num = entry->num; num > 0; opt++, num--)
++       if (opt->name && ovisible (opt))
++         {
++           comma (uparams.long_opt_col, &pest);
++           __argp_fmtstream_printf (stream, "--%s", opt->name);
++           arg (real, "=%s", "[=%s]",
++                state == NULL ? NULL : state->root_argp->argp_domain, stream);
++         }
++    }
++
++  /* Next, documentation strings.  */
++  __argp_fmtstream_set_lmargin (stream, 0);
++
++  if (pest.first)
++    {
++      /* Didn't print any switches, what's up?  */
++      if (!oshort (real) && !real->name)
++       /* This is a group header, print it nicely.  */
++       print_header (real->doc, entry->argp, &pest);
++      else
++       /* Just a totally shadowed option or null header; print nothing.  */
++       goto cleanup;           /* Just return, after cleaning up.  */
++    }
++  else
++    {
++      const char *tstr = real->doc ? dgettext (state == NULL ? NULL
++                                              : state->root_argp->argp_domain,
++                                              real->doc) : 0;
++      const char *fstr = filter_doc (tstr, real->key, entry->argp, state);
++      if (fstr && *fstr)
++       {
++         unsigned int col = __argp_fmtstream_point (stream);
++
++         __argp_fmtstream_set_lmargin (stream, uparams.opt_doc_col);
++         __argp_fmtstream_set_wmargin (stream, uparams.opt_doc_col);
++
++         if (col > (unsigned int) (uparams.opt_doc_col + 3))
++           __argp_fmtstream_putc (stream, '\n');
++         else if (col >= (unsigned int) uparams.opt_doc_col)
++           __argp_fmtstream_puts (stream, "   ");
++         else
++           indent_to (stream, uparams.opt_doc_col);
++
++         __argp_fmtstream_puts (stream, fstr);
++       }
++      if (fstr && fstr != tstr)
++       free ((char *) fstr);
++
++      /* Reset the left margin.  */
++      __argp_fmtstream_set_lmargin (stream, 0);
++      __argp_fmtstream_putc (stream, '\n');
++    }
++
++  hhstate->prev_entry = entry;
++
++cleanup:
++  __argp_fmtstream_set_lmargin (stream, old_lm);
++  __argp_fmtstream_set_wmargin (stream, old_wm);
++}
++
++/* Output a long help message about the options in HOL to STREAM.  */
++static void
++hol_help (struct hol *hol, const struct argp_state *state,
++         argp_fmtstream_t stream)
++{
++  unsigned num;
++  struct hol_entry *entry;
++  struct hol_help_state hhstate = { 0, 0, 0 };
++
++  for (entry = hol->entries, num = hol->num_entries; num > 0; entry++, num--)
++    hol_entry_help (entry, state, stream, &hhstate);
++
++  if (hhstate.suppressed_dup_arg && uparams.dup_args_note)
++    {
++      const char *tstr = dgettext (state == NULL ? NULL
++                                  : state->root_argp->argp_domain, "\
++Mandatory or optional arguments to long options are also mandatory or \
++optional for any corresponding short options.");
++      const char *fstr = filter_doc (tstr, ARGP_KEY_HELP_DUP_ARGS_NOTE,
++                                    state ? state->root_argp : 0, state);
++      if (fstr && *fstr)
++       {
++         __argp_fmtstream_putc (stream, '\n');
++         __argp_fmtstream_puts (stream, fstr);
++         __argp_fmtstream_putc (stream, '\n');
++       }
++      if (fstr && fstr != tstr)
++       free ((char *) fstr);
++    }
++}
++
++/* Helper functions for hol_usage.  */
++
++/* If OPT is a short option without an arg, append its key to the string
++   pointer pointer to by COOKIE, and advance the pointer.  */
++static int
++add_argless_short_opt (const struct argp_option *opt,
++                      const struct argp_option *real,
++                      const char *domain, void *cookie)
++{
++  char **snao_end = cookie;
++  if (!(opt->arg || real->arg)
++      && !((opt->flags | real->flags) & OPTION_NO_USAGE))
++    *(*snao_end)++ = opt->key;
++  return 0;
++}
++
++/* If OPT is a short option with an arg, output a usage entry for it to the
++   stream pointed at by COOKIE.  */
++static int
++usage_argful_short_opt (const struct argp_option *opt,
++                       const struct argp_option *real,
++                       const char *domain, void *cookie)
++{
++  argp_fmtstream_t stream = cookie;
++  const char *arg = opt->arg;
++  int flags = opt->flags | real->flags;
++
++  if (! arg)
++    arg = real->arg;
++
++  if (arg && !(flags & OPTION_NO_USAGE))
++    {
++      arg = dgettext (domain, arg);
++
++      if (flags & OPTION_ARG_OPTIONAL)
++       __argp_fmtstream_printf (stream, " [-%c[%s]]", opt->key, arg);
++      else
++       {
++         /* Manually do line wrapping so that it (probably) won't
++            get wrapped at the embedded space.  */
++         space (stream, 6 + strlen (arg));
++         __argp_fmtstream_printf (stream, "[-%c %s]", opt->key, arg);
++       }
++    }
++
++  return 0;
++}
++
++/* Output a usage entry for the long option opt to the stream pointed at by
++   COOKIE.  */
++static int
++usage_long_opt (const struct argp_option *opt,
++               const struct argp_option *real,
++               const char *domain, void *cookie)
++{
++  argp_fmtstream_t stream = cookie;
++  const char *arg = opt->arg;
++  int flags = opt->flags | real->flags;
++
++  if (! arg)
++    arg = real->arg;
++
++  if (! (flags & OPTION_NO_USAGE))
++    {
++      if (arg)
++       {
++         arg = dgettext (domain, arg);
++         if (flags & OPTION_ARG_OPTIONAL)
++           __argp_fmtstream_printf (stream, " [--%s[=%s]]", opt->name, arg);
++         else
++           __argp_fmtstream_printf (stream, " [--%s=%s]", opt->name, arg);
++       }
++      else
++       __argp_fmtstream_printf (stream, " [--%s]", opt->name);
++    }
++
++  return 0;
++}
++
++/* Print a short usage description for the arguments in HOL to STREAM.  */
++static void
++hol_usage (struct hol *hol, argp_fmtstream_t stream)
++{
++  if (hol->num_entries > 0)
++    {
++      unsigned nentries;
++      struct hol_entry *entry;
++      char *short_no_arg_opts = alloca (strlen (hol->short_options) + 1);
++      char *snao_end = short_no_arg_opts;
++
++      /* First we put a list of short options without arguments.  */
++      for (entry = hol->entries, nentries = hol->num_entries
++          ; nentries > 0
++          ; entry++, nentries--)
++       hol_entry_short_iterate (entry, add_argless_short_opt,
++                                entry->argp->argp_domain, &snao_end);
++      if (snao_end > short_no_arg_opts)
++       {
++         *snao_end++ = 0;
++         __argp_fmtstream_printf (stream, " [-%s]", short_no_arg_opts);
++       }
++
++      /* Now a list of short options *with* arguments.  */
++      for (entry = hol->entries, nentries = hol->num_entries
++          ; nentries > 0
++          ; entry++, nentries--)
++       hol_entry_short_iterate (entry, usage_argful_short_opt,
++                                entry->argp->argp_domain, stream);
++
++      /* Finally, a list of long options (whew!).  */
++      for (entry = hol->entries, nentries = hol->num_entries
++          ; nentries > 0
++          ; entry++, nentries--)
++       hol_entry_long_iterate (entry, usage_long_opt,
++                               entry->argp->argp_domain, stream);
++    }
++}
++
++/* Make a HOL containing all levels of options in ARGP.  CLUSTER is the
++   cluster in which ARGP's entries should be clustered, or 0.  */
++static struct hol *
++argp_hol (const struct argp *argp, struct hol_cluster *cluster)
++{
++  const struct argp_child *child = argp->children;
++  struct hol *hol = make_hol (argp, cluster);
++  if (child)
++    while (child->argp)
++      {
++       struct hol_cluster *child_cluster =
++         ((child->group || child->header)
++          /* Put CHILD->argp within its own cluster.  */
++          ? hol_add_cluster (hol, child->group, child->header,
++                             child - argp->children, cluster, argp)
++          /* Just merge it into the parent's cluster.  */
++          : cluster);
++       hol_append (hol, argp_hol (child->argp, child_cluster)) ;
++       child++;
++      }
++  return hol;
++}
++
++/* Calculate how many different levels with alternative args strings exist in
++   ARGP.  */
++static size_t
++argp_args_levels (const struct argp *argp)
++{
++  size_t levels = 0;
++  const struct argp_child *child = argp->children;
++
++  if (argp->args_doc && strchr (argp->args_doc, '\n'))
++    levels++;
++
++  if (child)
++    while (child->argp)
++      levels += argp_args_levels ((child++)->argp);
++
++  return levels;
++}
++
++/* Print all the non-option args documented in ARGP to STREAM.  Any output is
++   preceded by a space.  LEVELS is a pointer to a byte vector the length
++   returned by argp_args_levels; it should be initialized to zero, and
++   updated by this routine for the next call if ADVANCE is true.  True is
++   returned as long as there are more patterns to output.  */
++static int
++argp_args_usage (const struct argp *argp, const struct argp_state *state,
++                char **levels, int advance, argp_fmtstream_t stream)
++{
++  char *our_level = *levels;
++  int multiple = 0;
++  const struct argp_child *child = argp->children;
++  const char *tdoc = dgettext (argp->argp_domain, argp->args_doc), *nl = 0;
++  const char *fdoc = filter_doc (tdoc, ARGP_KEY_HELP_ARGS_DOC, argp, state);
++
++  if (fdoc)
++    {
++      const char *cp = fdoc;
++      nl = strchrnul (cp, '\n');
++      if (*nl != '\0')
++       /* This is a `multi-level' args doc; advance to the correct position
++          as determined by our state in LEVELS, and update LEVELS.  */
++       {
++         int i;
++         multiple = 1;
++         for (i = 0; i < *our_level; i++)
++           cp = nl + 1, nl = strchrnul (cp, '\n');
++         (*levels)++;
++       }
++
++      /* Manually do line wrapping so that it (probably) won't get wrapped at
++        any embedded spaces.  */
++      space (stream, 1 + nl - cp);
++
++      __argp_fmtstream_write (stream, cp, nl - cp);
++    }
++  if (fdoc && fdoc != tdoc)
++    free ((char *)fdoc);       /* Free user's modified doc string.  */
++
++  if (child)
++    while (child->argp)
++      advance = !argp_args_usage ((child++)->argp, state, levels, advance, stream);
++
++  if (advance && multiple)
++    {
++      /* Need to increment our level.  */
++      if (*nl)
++       /* There's more we can do here.  */
++       {
++         (*our_level)++;
++         advance = 0;          /* Our parent shouldn't advance also. */
++       }
++      else if (*our_level > 0)
++       /* We had multiple levels, but used them up; reset to zero.  */
++       *our_level = 0;
++    }
++
++  return !advance;
++}
++
++/* Print the documentation for ARGP to STREAM; if POST is false, then
++   everything preceeding a `\v' character in the documentation strings (or
++   the whole string, for those with none) is printed, otherwise, everything
++   following the `\v' character (nothing for strings without).  Each separate
++   bit of documentation is separated a blank line, and if PRE_BLANK is true,
++   then the first is as well.  If FIRST_ONLY is true, only the first
++   occurrence is output.  Returns true if anything was output.  */
++static int
++argp_doc (const struct argp *argp, const struct argp_state *state,
++         int post, int pre_blank, int first_only,
++         argp_fmtstream_t stream)
++{
++  const char *text;
++  const char *inp_text;
++  void *input = 0;
++  int anything = 0;
++  size_t inp_text_limit = 0;
++  const char *doc = dgettext (argp->argp_domain, argp->doc);
++  const struct argp_child *child = argp->children;
++
++  if (doc)
++    {
++      char *vt = strchr (doc, '\v');
++      inp_text = post ? (vt ? vt + 1 : 0) : doc;
++      inp_text_limit = (!post && vt) ? (vt - doc) : 0;
++    }
++  else
++    inp_text = 0;
++
++  if (argp->help_filter)
++    /* We have to filter the doc strings.  */
++    {
++      if (inp_text_limit)
++       /* Copy INP_TEXT so that it's nul-terminated.  */
++       inp_text = strndup (inp_text, inp_text_limit);
++      input = __argp_input (argp, state);
++      text =
++       (*argp->help_filter) (post
++                             ? ARGP_KEY_HELP_POST_DOC
++                             : ARGP_KEY_HELP_PRE_DOC,
++                             inp_text, input);
++    }
++  else
++    text = (const char *) inp_text;
++
++  if (text)
++    {
++      if (pre_blank)
++       __argp_fmtstream_putc (stream, '\n');
++
++      if (text == inp_text && inp_text_limit)
++       __argp_fmtstream_write (stream, inp_text, inp_text_limit);
++      else
++       __argp_fmtstream_puts (stream, text);
++
++      if (__argp_fmtstream_point (stream) > __argp_fmtstream_lmargin (stream))
++       __argp_fmtstream_putc (stream, '\n');
++
++      anything = 1;
++    }
++
++  if (text && text != inp_text)
++    free ((char *) text);      /* Free TEXT returned from the help filter.  */
++  if (inp_text && inp_text_limit && argp->help_filter)
++    free ((char *) inp_text);  /* We copied INP_TEXT, so free it now.  */
++
++  if (post && argp->help_filter)
++    /* Now see if we have to output a ARGP_KEY_HELP_EXTRA text.  */
++    {
++      text = (*argp->help_filter) (ARGP_KEY_HELP_EXTRA, 0, input);
++      if (text)
++       {
++         if (anything || pre_blank)
++           __argp_fmtstream_putc (stream, '\n');
++         __argp_fmtstream_puts (stream, text);
++         free ((char *) text);
++         if (__argp_fmtstream_point (stream)
++             > __argp_fmtstream_lmargin (stream))
++           __argp_fmtstream_putc (stream, '\n');
++         anything = 1;
++       }
++    }
++
++  if (child)
++    while (child->argp && !(first_only && anything))
++      anything |=
++       argp_doc ((child++)->argp, state,
++                 post, anything || pre_blank, first_only,
++                 stream);
++
++  return anything;
++}
++
++/* Output a usage message for ARGP to STREAM.  If called from
++   argp_state_help, STATE is the relevent parsing state.  FLAGS are from the
++   set ARGP_HELP_*.  NAME is what to use wherever a `program name' is
++   needed. */
++static void
++_help (const struct argp *argp, const struct argp_state *state, FILE *stream,
++       unsigned flags, char *name)
++{
++  int anything = 0;            /* Whether we've output anything.  */
++  struct hol *hol = 0;
++  argp_fmtstream_t fs;
++
++  if (! stream)
++    return;
++
++#if _LIBC || (HAVE_FLOCKFILE && HAVE_FUNLOCKFILE)
++  flockfile (stream);
++#endif
++
++  fill_in_uparams (state);
++
++  fs = __argp_make_fmtstream (stream, 0, uparams.rmargin, 0);
++  if (! fs)
++    {
++#if _LIBC || (HAVE_FLOCKFILE && HAVE_FUNLOCKFILE)
++      funlockfile (stream);
++#endif
++      return;
++    }
++
++  if (flags & (ARGP_HELP_USAGE | ARGP_HELP_SHORT_USAGE | ARGP_HELP_LONG))
++    {
++      hol = argp_hol (argp, 0);
++
++      /* If present, these options always come last.  */
++      hol_set_group (hol, "help", -1);
++      hol_set_group (hol, "version", -1);
++
++      hol_sort (hol);
++    }
++
++  if (flags & (ARGP_HELP_USAGE | ARGP_HELP_SHORT_USAGE))
++    /* Print a short `Usage:' message.  */
++    {
++      int first_pattern = 1, more_patterns;
++      size_t num_pattern_levels = argp_args_levels (argp);
++      char *pattern_levels = alloca (num_pattern_levels);
++
++      memset (pattern_levels, 0, num_pattern_levels);
++
++      do
++       {
++         int old_lm;
++         int old_wm = __argp_fmtstream_set_wmargin (fs, uparams.usage_indent);
++         char *levels = pattern_levels;
++
++         if (first_pattern)
++           __argp_fmtstream_printf (fs, "%s %s",
++                                    dgettext (argp->argp_domain, "Usage:"),
++                                    name);
++         else
++           __argp_fmtstream_printf (fs, "%s %s",
++                                    dgettext (argp->argp_domain, "  or: "),
++                                    name);
++
++         /* We set the lmargin as well as the wmargin, because hol_usage
++            manually wraps options with newline to avoid annoying breaks.  */
++         old_lm = __argp_fmtstream_set_lmargin (fs, uparams.usage_indent);
++
++         if (flags & ARGP_HELP_SHORT_USAGE)
++           /* Just show where the options go.  */
++           {
++             if (hol->num_entries > 0)
++               __argp_fmtstream_puts (fs, dgettext (argp->argp_domain,
++                                                    " [OPTION...]"));
++           }
++         else
++           /* Actually print the options.  */
++           {
++             hol_usage (hol, fs);
++             flags |= ARGP_HELP_SHORT_USAGE; /* But only do so once.  */
++           }
++
++         more_patterns = argp_args_usage (argp, state, &levels, 1, fs);
++
++         __argp_fmtstream_set_wmargin (fs, old_wm);
++         __argp_fmtstream_set_lmargin (fs, old_lm);
++
++         __argp_fmtstream_putc (fs, '\n');
++         anything = 1;
++
++         first_pattern = 0;
++       }
++      while (more_patterns);
++    }
++
++  if (flags & ARGP_HELP_PRE_DOC)
++    anything |= argp_doc (argp, state, 0, 0, 1, fs);
++
++  if (flags & ARGP_HELP_SEE)
++    {
++      __argp_fmtstream_printf (fs, dgettext (argp->argp_domain, "\
++Try `%s --help' or `%s --usage' for more information.\n"),
++                              name, name);
++      anything = 1;
++    }
++
++  if (flags & ARGP_HELP_LONG)
++    /* Print a long, detailed help message.  */
++    {
++      /* Print info about all the options.  */
++      if (hol->num_entries > 0)
++       {
++         if (anything)
++           __argp_fmtstream_putc (fs, '\n');
++         hol_help (hol, state, fs);
++         anything = 1;
++       }
++    }
++
++  if (flags & ARGP_HELP_POST_DOC)
++    /* Print any documentation strings at the end.  */
++    anything |= argp_doc (argp, state, 1, anything, 0, fs);
++
++  if ((flags & ARGP_HELP_BUG_ADDR) && argp_program_bug_address)
++    {
++      if (anything)
++       __argp_fmtstream_putc (fs, '\n');
++      __argp_fmtstream_printf (fs, dgettext (argp->argp_domain,
++                                            "Report bugs to %s.\n"),
++                              argp_program_bug_address);
++      anything = 1;
++    }
++
++#if _LIBC || (HAVE_FLOCKFILE && HAVE_FUNLOCKFILE)
++  funlockfile (stream);
++#endif
++
++  if (hol)
++    hol_free (hol);
++
++  __argp_fmtstream_free (fs);
++}
++
++/* Output a usage message for ARGP to STREAM.  FLAGS are from the set
++   ARGP_HELP_*.  NAME is what to use wherever a `program name' is needed. */
++void argp_help (const struct argp *argp, FILE *stream,
++                 unsigned flags, char *name)
++{
++  _help (argp, 0, stream, flags, name);
++}
++
++char *
++__argp_short_program_name (void)
++{
++# ifdef __UCLIBC_HAS_PROGRAM_INVOCATION_NAME__
++/*
++ * uClibc provides both program_invocation_name and
++ * program_invocation_short_name
++ */
++ return (char *) program_invocation_short_name;
++# else
++  /* FIXME: What now? Miles suggests that it is better to use NULL,
++     but currently the value is passed on directly to fputs_unlocked,
++     so that requires more changes. */
++# if __GNUC__
++#  warning No reasonable value to return
++# endif /* __GNUC__ */
++  return "";
++# endif
++}
++
++/* Output, if appropriate, a usage message for STATE to STREAM.  FLAGS are
++   from the set ARGP_HELP_*.  */
++void
++argp_state_help (const struct argp_state *state, FILE *stream, unsigned flags)
++{
++  if ((!state || ! (state->flags & ARGP_NO_ERRS)) && stream)
++    {
++      if (state && (state->flags & ARGP_LONG_ONLY))
++       flags |= ARGP_HELP_LONG_ONLY;
++
++      _help (state ? state->root_argp : 0, state, stream, flags,
++            state ? state->name : __argp_short_program_name ());
++
++      if (!state || ! (state->flags & ARGP_NO_EXIT))
++       {
++         if (flags & ARGP_HELP_EXIT_ERR)
++           exit (argp_err_exit_status);
++         if (flags & ARGP_HELP_EXIT_OK)
++           exit (0);
++       }
++  }
++}
++
++/* If appropriate, print the printf string FMT and following args, preceded
++   by the program name and `:', to stderr, and followed by a `Try ... --help'
++   message, then exit (1).  */
++void
++argp_error (const struct argp_state *state, const char *fmt, ...)
++{
++  if (!state || !(state->flags & ARGP_NO_ERRS))
++    {
++      FILE *stream = state ? state->err_stream : stderr;
++
++      if (stream)
++       {
++         va_list ap;
++
++#if _LIBC || (HAVE_FLOCKFILE && HAVE_FUNLOCKFILE)
++         flockfile (stream);
++#endif
++
++         va_start (ap, fmt);
++
++#if defined _LIBC && defined USE_IN_LIBIO
++         char *buf;
++
++         if (_IO_vasprintf (&buf, fmt, ap) < 0)
++           buf = NULL;
++
++         __fxprintf (stream, "%s: %s\n",
++                     state ? state->name : __argp_short_program_name (), buf);
++
++         free (buf);
++#else
++         fputs_unlocked (state ? state->name : __argp_short_program_name (),
++                         stream);
++         putc_unlocked (':', stream);
++         putc_unlocked (' ', stream);
++
++         vfprintf (stream, fmt, ap);
++
++         putc_unlocked ('\n', stream);
++#endif
++
++         argp_state_help (state, stream, ARGP_HELP_STD_ERR);
++
++         va_end (ap);
++
++#if _LIBC || (HAVE_FLOCKFILE && HAVE_FUNLOCKFILE)
++         funlockfile (stream);
++#endif
++       }
++    }
++}
++
++/* Similar to the standard gnu error-reporting function error(), but will
++   respect the ARGP_NO_EXIT and ARGP_NO_ERRS flags in STATE, and will print
++   to STATE->err_stream.  This is useful for argument parsing code that is
++   shared between program startup (when exiting is desired) and runtime
++   option parsing (when typically an error code is returned instead).  The
++   difference between this function and argp_error is that the latter is for
++   *parsing errors*, and the former is for other problems that occur during
++   parsing but don't reflect a (syntactic) problem with the input.  */
++void
++argp_failure (const struct argp_state *state, int status, int errnum,
++               const char *fmt, ...)
++{
++  if (!state || !(state->flags & ARGP_NO_ERRS))
++    {
++      FILE *stream = state ? state->err_stream : stderr;
++
++      if (stream)
++       {
++#if _LIBC || (HAVE_FLOCKFILE && HAVE_FUNLOCKFILE)
++         flockfile (stream);
++#endif
++
++#if defined _LIBC && defined USE_IN_LIBIO
++         __fxprintf (stream, "%s",
++                     state ? state->name : __argp_short_program_name ());
++#else
++         fputs_unlocked (state ? state->name : __argp_short_program_name (),
++                         stream);
++#endif
++
++         if (fmt)
++           {
++             va_list ap;
++
++             va_start (ap, fmt);
++#if defined _LIBC && defined USE_IN_LIBIO
++             char *buf;
++
++             if (_IO_vasprintf (&buf, fmt, ap) < 0)
++               buf = NULL;
++
++             __fxprintf (stream, ": %s", buf);
++
++             free (buf);
++#else
++             putc_unlocked (':', stream);
++             putc_unlocked (' ', stream);
++
++             vfprintf (stream, fmt, ap);
++#endif
++
++             va_end (ap);
++           }
++
++         if (errnum)
++           {
++#if (defined _LIBC && defined USE_IN_LIBIO) || defined HAVE_STRERROR_R
++             char buf[200];
++#endif
++#if defined _LIBC && defined USE_IN_LIBIO
++             __fxprintf (stream, ": %s",
++                         strerror_r (errnum, buf, sizeof (buf)));
++#else
++             putc_unlocked (':', stream);
++             putc_unlocked (' ', stream);
++# ifdef HAVE_STRERROR_R
++             fputs (strerror_r (errnum, buf, sizeof (buf)), stream);
++# else
++             fputs (strerror (errnum), stream);
++# endif
++#endif
++           }
++
++#ifdef USE_IN_LIBIO
++         if (_IO_fwide (stream, 0) > 0)
++           putwc_unlocked (L'\n', stream);
++         else
++#endif
++           putc_unlocked ('\n', stream);
++
++#if _LIBC || (HAVE_FLOCKFILE && HAVE_FUNLOCKFILE)
++         funlockfile (stream);
++#endif
++
++         if (status && (!state || !(state->flags & ARGP_NO_EXIT)))
++           exit (status);
++       }
++    }
++}
+Index: git/libuargp/argp-parse.c
+===================================================================
+--- /dev/null
++++ git/libuargp/argp-parse.c
+@@ -0,0 +1,949 @@
++/* Hierarchial argument parsing, layered over getopt
++   Copyright (C) 1995-2000, 2002, 2003, 2004 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++   Written by Miles Bader <miles at gnu.ai.mit.edu>.
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
++   02111-1307 USA.
++
++   Modified for uClibc by: Salvatore Cro <salvatore.cro at st.com>
++*/
++
++#ifdef HAVE_CONFIG_H
++#include <config.h>
++#endif
++
++/* AIX requires this to be the first thing in the file.  */
++#ifndef __GNUC__
++# if HAVE_ALLOCA_H || defined _LIBC
++#  include <alloca.h>
++# else
++#  ifdef _AIX
++#pragma alloca
++#  else
++#   ifndef alloca /* predefined by HP cc +Olibcalls */
++char *alloca ();
++#   endif
++#  endif
++# endif
++#endif
++
++#include <stdlib.h>
++#include <string.h>
++#include <unistd.h>
++#include <limits.h>
++#include <getopt.h>
++#include <bits/getopt_int.h>
++
++#include <features.h>
++#ifndef _
++/* This is for other GNU distributions with internationalized messages.
++   When compiling libc, the _ macro is predefined.  */
++# if (defined HAVE_LIBINTL_H || defined _LIBC) && defined __UCLIBC_HAS_GETTEXT_AWARENESS__
++#  include <libintl.h>
++#  ifdef _LIBC
++#   undef dgettext
++#   define dgettext(domain, msgid) \
++  INTUSE(__dcgettext) (domain, msgid, LC_MESSAGES)
++#  endif
++# else
++#  define dgettext(domain, msgid) (msgid)
++#  define gettext(msgid) (msgid)
++# endif
++#endif
++#ifndef N_
++# define N_(msgid) (msgid)
++#endif
++
++#include <argp.h>
++
++/* Getopt return values.  */
++#define KEY_END (-1)           /* The end of the options.  */
++#define KEY_ARG 1              /* A non-option argument.  */
++#define KEY_ERR '?'            /* An error parsing the options.  */
++
++/* The meta-argument used to prevent any further arguments being interpreted
++   as options.  */
++#define QUOTE "--"
++
++/* The number of bits we steal in a long-option value for our own use.  */
++#define GROUP_BITS CHAR_BIT
++
++/* The number of bits available for the user value.  */
++#define USER_BITS ((sizeof ((struct option *)0)->val * CHAR_BIT) - GROUP_BITS)
++#define USER_MASK ((1 << USER_BITS) - 1)
++
++/* EZ alias for ARGP_ERR_UNKNOWN.  */
++#define EBADKEY ARGP_ERR_UNKNOWN
++
++/* Default options.  */
++
++/* When argp is given the --HANG switch, _ARGP_HANG is set and argp will sleep
++   for one second intervals, decrementing _ARGP_HANG until it's zero.  Thus
++   you can force the program to continue by attaching a debugger and setting
++   it to 0 yourself.  */
++static volatile int _argp_hang;
++
++#define OPT_PROGNAME   -2
++#define OPT_USAGE      -3
++#define OPT_HANG       -4
++
++static const struct argp_option argp_default_options[] =
++{
++  {"help",       '?',          0, 0,  N_("Give this help list"), -1},
++  {"usage",      OPT_USAGE,    0, 0,  N_("Give a short usage message")},
++  {"program-name",OPT_PROGNAME,"NAME", OPTION_HIDDEN, N_("Set the program name")},
++  {"HANG",       OPT_HANG,    "SECS", OPTION_ARG_OPTIONAL | OPTION_HIDDEN,
++     N_("Hang for SECS seconds (default 3600)")},
++  {0, 0}
++};
++
++static error_t
++argp_default_parser (int key, char *arg, struct argp_state *state)
++{
++  switch (key)
++    {
++    case '?':
++      argp_state_help (state, state->out_stream, ARGP_HELP_STD_HELP);
++      break;
++    case OPT_USAGE:
++      argp_state_help (state, state->out_stream,
++                      ARGP_HELP_USAGE | ARGP_HELP_EXIT_OK);
++      break;
++
++    case OPT_PROGNAME:         /* Set the program name.  */
++#if defined _LIBC || HAVE_DECL_PROGRAM_INVOCATION_NAME
++      program_invocation_name = arg;
++#endif
++      /* [Note that some systems only have PROGRAM_INVOCATION_SHORT_NAME (aka
++        __PROGNAME), in which case, PROGRAM_INVOCATION_NAME is just defined
++        to be that, so we have to be a bit careful here.]  */
++
++      /* Update what we use for messages.  */
++      state->name = strrchr (arg, '/');
++      if (state->name)
++       state->name++;
++      else
++       state->name = arg;
++
++#if defined _LIBC || HAVE_DECL_PROGRAM_INVOCATION_SHORT_NAME
++      program_invocation_short_name = state->name;
++#endif
++
++      if ((state->flags & (ARGP_PARSE_ARGV0 | ARGP_NO_ERRS))
++         == ARGP_PARSE_ARGV0)
++       /* Update what getopt uses too.  */
++       state->argv[0] = arg;
++
++      break;
++
++    case OPT_HANG:
++      _argp_hang = atoi (arg ? arg : "3600");
++      while (_argp_hang-- > 0)
++       sleep (1);
++      break;
++
++    default:
++      return EBADKEY;
++    }
++  return 0;
++}
++
++static const struct argp argp_default_argp =
++  {argp_default_options, &argp_default_parser, NULL, NULL, NULL, NULL, "libc"};
++
++
++static const struct argp_option argp_version_options[] =
++{
++  {"version",    'V',          0, 0,  N_("Print program version"), -1},
++  {0, 0}
++};
++
++static error_t
++argp_version_parser (int key, char *arg, struct argp_state *state)
++{
++  switch (key)
++    {
++    case 'V':
++      if (argp_program_version_hook)
++       (*argp_program_version_hook) (state->out_stream, state);
++      else if (argp_program_version)
++       fprintf (state->out_stream, "%s\n", argp_program_version);
++      else
++       argp_error (state, dgettext (state->root_argp->argp_domain,
++                                      "(PROGRAM ERROR) No version known!?"));
++      if (! (state->flags & ARGP_NO_EXIT))
++       exit (0);
++      break;
++    default:
++      return EBADKEY;
++    }
++  return 0;
++}
++
++static const struct argp argp_version_argp =
++  {argp_version_options, &argp_version_parser, NULL, NULL, NULL, NULL, "libc"};
++
++/* Returns the offset into the getopt long options array LONG_OPTIONS of a
++   long option with called NAME, or -1 if none is found.  Passing NULL as
++   NAME will return the number of options.  */
++static int
++find_long_option (struct option *long_options, const char *name)
++{
++  struct option *l = long_options;
++  while (l->name != NULL)
++    if (name != NULL && strcmp (l->name, name) == 0)
++      return l - long_options;
++    else
++      l++;
++  if (name == NULL)
++    return l - long_options;
++  else
++    return -1;
++}
++
++
++/* The state of a `group' during parsing.  Each group corresponds to a
++   particular argp structure from the tree of such descending from the top
++   level argp passed to argp_parse.  */
++struct group
++{
++  /* This group's parsing function.  */
++  argp_parser_t parser;
++
++  /* Which argp this group is from.  */
++  const struct argp *argp;
++
++  /* Points to the point in SHORT_OPTS corresponding to the end of the short
++     options for this group.  We use it to determine from which group a
++     particular short options is from.  */
++  char *short_end;
++
++  /* The number of non-option args sucessfully handled by this parser.  */
++  unsigned args_processed;
++
++  /* This group's parser's parent's group.  */
++  struct group *parent;
++  unsigned parent_index;       /* And the our position in the parent.   */
++
++  /* These fields are swapped into and out of the state structure when
++     calling this group's parser.  */
++  void *input, **child_inputs;
++  void *hook;
++};
++
++/* Call GROUP's parser with KEY and ARG, swapping any group-specific info
++   from STATE before calling, and back into state afterwards.  If GROUP has
++   no parser, EBADKEY is returned.  */
++static error_t
++group_parse (struct group *group, struct argp_state *state, int key, char *arg)
++{
++  if (group->parser)
++    {
++      error_t err;
++      state->hook = group->hook;
++      state->input = group->input;
++      state->child_inputs = group->child_inputs;
++      state->arg_num = group->args_processed;
++      err = (*group->parser)(key, arg, state);
++      group->hook = state->hook;
++      return err;
++    }
++  else
++    return EBADKEY;
++}
++
++struct parser
++{
++  const struct argp *argp;
++
++  /* SHORT_OPTS is the getopt short options string for the union of all the
++     groups of options.  */
++  char *short_opts;
++  /* LONG_OPTS is the array of getop long option structures for the union of
++     all the groups of options.  */
++  struct option *long_opts;
++  /* OPT_DATA is the getopt data used for the re-entrant getopt.  */
++  struct _getopt_data opt_data;
++
++  /* States of the various parsing groups.  */
++  struct group *groups;
++  /* The end of the GROUPS array.  */
++  struct group *egroup;
++  /* An vector containing storage for the CHILD_INPUTS field in all groups.  */
++  void **child_inputs;
++
++  /* True if we think using getopt is still useful; if false, then
++     remaining arguments are just passed verbatim with ARGP_KEY_ARG.  This is
++     cleared whenever getopt returns KEY_END, but may be set again if the user
++     moves the next argument pointer backwards.  */
++  int try_getopt;
++
++  /* State block supplied to parsing routines.  */
++  struct argp_state state;
++
++  /* Memory used by this parser.  */
++  void *storage;
++};
++
++/* The next usable entries in the various parser tables being filled in by
++   convert_options.  */
++struct parser_convert_state
++{
++  struct parser *parser;
++  char *short_end;
++  struct option *long_end;
++  void **child_inputs_end;
++};
++
++/* Converts all options in ARGP (which is put in GROUP) and ancestors
++   into getopt options stored in SHORT_OPTS and LONG_OPTS; SHORT_END and
++   CVT->LONG_END are the points at which new options are added.  Returns the
++   next unused group entry.  CVT holds state used during the conversion.  */
++static struct group *
++convert_options (const struct argp *argp,
++                struct group *parent, unsigned parent_index,
++                struct group *group, struct parser_convert_state *cvt)
++{
++  /* REAL is the most recent non-alias value of OPT.  */
++  const struct argp_option *real = argp->options;
++  const struct argp_child *children = argp->children;
++
++  if (real || argp->parser)
++    {
++      const struct argp_option *opt;
++
++      if (real)
++       for (opt = real; !__option_is_end (opt); opt++)
++         {
++           if (! (opt->flags & OPTION_ALIAS))
++             /* OPT isn't an alias, so we can use values from it.  */
++             real = opt;
++
++           if (! (real->flags & OPTION_DOC))
++             /* A real option (not just documentation).  */
++             {
++               if (__option_is_short (opt))
++                 /* OPT can be used as a short option.  */
++                 {
++                   *cvt->short_end++ = opt->key;
++                   if (real->arg)
++                     {
++                       *cvt->short_end++ = ':';
++                       if (real->flags & OPTION_ARG_OPTIONAL)
++                         *cvt->short_end++ = ':';
++                     }
++                   *cvt->short_end = '\0'; /* keep 0 terminated */
++                 }
++
++               if (opt->name
++                   && find_long_option (cvt->parser->long_opts, opt->name) < 0)
++                 /* OPT can be used as a long option.  */
++                 {
++                   cvt->long_end->name = opt->name;
++                   cvt->long_end->has_arg =
++                     (real->arg
++                      ? (real->flags & OPTION_ARG_OPTIONAL
++                         ? optional_argument
++                         : required_argument)
++                      : no_argument);
++                   cvt->long_end->flag = 0;
++                   /* we add a disambiguating code to all the user's
++                      values (which is removed before we actually call
++                      the function to parse the value); this means that
++                      the user loses use of the high 8 bits in all his
++                      values (the sign of the lower bits is preserved
++                      however)...  */
++                   cvt->long_end->val =
++                     ((opt->key | real->key) & USER_MASK)
++                     + (((group - cvt->parser->groups) + 1) << USER_BITS);
++
++                   /* Keep the LONG_OPTS list terminated.  */
++                   (++cvt->long_end)->name = NULL;
++                 }
++             }
++           }
++
++      group->parser = argp->parser;
++      group->argp = argp;
++      group->short_end = cvt->short_end;
++      group->args_processed = 0;
++      group->parent = parent;
++      group->parent_index = parent_index;
++      group->input = 0;
++      group->hook = 0;
++      group->child_inputs = 0;
++
++      if (children)
++       /* Assign GROUP's CHILD_INPUTS field some space from
++           CVT->child_inputs_end.*/
++       {
++         unsigned num_children = 0;
++         while (children[num_children].argp)
++           num_children++;
++         group->child_inputs = cvt->child_inputs_end;
++         cvt->child_inputs_end += num_children;
++       }
++
++      parent = group++;
++    }
++  else
++    parent = 0;
++
++  if (children)
++    {
++      unsigned index = 0;
++      while (children->argp)
++       group =
++         convert_options (children++->argp, parent, index++, group, cvt);
++    }
++
++  return group;
++}
++
++/* Find the merged set of getopt options, with keys appropiately prefixed. */
++static void
++parser_convert (struct parser *parser, const struct argp *argp, int flags)
++{
++  struct parser_convert_state cvt;
++
++  cvt.parser = parser;
++  cvt.short_end = parser->short_opts;
++  cvt.long_end = parser->long_opts;
++  cvt.child_inputs_end = parser->child_inputs;
++
++  if (flags & ARGP_IN_ORDER)
++    *cvt.short_end++ = '-';
++  else if (flags & ARGP_NO_ARGS)
++    *cvt.short_end++ = '+';
++  *cvt.short_end = '\0';
++
++  cvt.long_end->name = NULL;
++
++  parser->argp = argp;
++
++  if (argp)
++    parser->egroup = convert_options (argp, 0, 0, parser->groups, &cvt);
++  else
++    parser->egroup = parser->groups; /* No parsers at all! */
++}
++
++/* Lengths of various parser fields which we will allocated.  */
++struct parser_sizes
++{
++  size_t short_len;            /* Getopt short options string.  */
++  size_t long_len;             /* Getopt long options vector.  */
++  size_t num_groups;           /* Group structures we allocate.  */
++  size_t num_child_inputs;     /* Child input slots.  */
++};
++
++/* For ARGP, increments the NUM_GROUPS field in SZS by the total number of
++ argp structures descended from it, and the SHORT_LEN & LONG_LEN fields by
++ the maximum lengths of the resulting merged getopt short options string and
++ long-options array, respectively.  */
++static void
++calc_sizes (const struct argp *argp,  struct parser_sizes *szs)
++{
++  const struct argp_child *child = argp->children;
++  const struct argp_option *opt = argp->options;
++
++  if (opt || argp->parser)
++    {
++      szs->num_groups++;
++      if (opt)
++       {
++         int num_opts = 0;
++         while (!__option_is_end (opt++))
++           num_opts++;
++         szs->short_len += num_opts * 3; /* opt + up to 2 `:'s */
++         szs->long_len += num_opts;
++       }
++    }
++
++  if (child)
++    while (child->argp)
++      {
++       calc_sizes ((child++)->argp, szs);
++       szs->num_child_inputs++;
++      }
++}
++
++
++extern char * __argp_short_program_name (void);
++/* Initializes PARSER to parse ARGP in a manner described by FLAGS.  */
++static error_t
++parser_init (struct parser *parser, const struct argp *argp,
++            int argc, char **argv, int flags, void *input)
++{
++  error_t err = 0;
++  struct group *group;
++  struct parser_sizes szs;
++  struct _getopt_data opt_data = _GETOPT_DATA_INITIALIZER;
++
++  szs.short_len = (flags & ARGP_NO_ARGS) ? 0 : 1;
++  szs.long_len = 0;
++  szs.num_groups = 0;
++  szs.num_child_inputs = 0;
++
++  if (argp)
++    calc_sizes (argp, &szs);
++
++  /* Lengths of the various bits of storage used by PARSER.  */
++#define GLEN (szs.num_groups + 1) * sizeof (struct group)
++#define CLEN (szs.num_child_inputs * sizeof (void *))
++#define LLEN ((szs.long_len + 1) * sizeof (struct option))
++#define SLEN (szs.short_len + 1)
++
++  parser->storage = malloc (GLEN + CLEN + LLEN + SLEN);
++  if (! parser->storage)
++    return ENOMEM;
++
++  parser->groups = parser->storage;
++  parser->child_inputs = parser->storage + GLEN;
++  parser->long_opts = parser->storage + GLEN + CLEN;
++  parser->short_opts = parser->storage + GLEN + CLEN + LLEN;
++  parser->opt_data = opt_data;
++
++  memset (parser->child_inputs, 0, szs.num_child_inputs * sizeof (void *));
++  parser_convert (parser, argp, flags);
++
++  memset (&parser->state, 0, sizeof (struct argp_state));
++  parser->state.root_argp = parser->argp;
++  parser->state.argc = argc;
++  parser->state.argv = argv;
++  parser->state.flags = flags;
++  parser->state.err_stream = stderr;
++  parser->state.out_stream = stdout;
++  parser->state.next = 0;      /* Tell getopt to initialize.  */
++  parser->state.pstate = parser;
++
++  parser->try_getopt = 1;
++
++  /* Call each parser for the first time, giving it a chance to propagate
++     values to child parsers.  */
++  if (parser->groups < parser->egroup)
++    parser->groups->input = input;
++  for (group = parser->groups;
++       group < parser->egroup && (!err || err == EBADKEY);
++       group++)
++    {
++      if (group->parent)
++       /* If a child parser, get the initial input value from the parent. */
++       group->input = group->parent->child_inputs[group->parent_index];
++
++      if (!group->parser
++         && group->argp->children && group->argp->children->argp)
++       /* For the special case where no parsing function is supplied for an
++          argp, propagate its input to its first child, if any (this just
++          makes very simple wrapper argps more convenient).  */
++       group->child_inputs[0] = group->input;
++
++      err = group_parse (group, &parser->state, ARGP_KEY_INIT, 0);
++    }
++  if (err == EBADKEY)
++    err = 0;                   /* Some parser didn't understand.  */
++
++  if (err)
++    return err;
++
++  if (parser->state.flags & ARGP_NO_ERRS)
++    {
++      parser->opt_data.opterr = 0;
++      if (parser->state.flags & ARGP_PARSE_ARGV0)
++       /* getopt always skips ARGV[0], so we have to fake it out.  As long
++          as OPTERR is 0, then it shouldn't actually try to access it.  */
++       parser->state.argv--, parser->state.argc++;
++    }
++  else
++    parser->opt_data.opterr = 1;       /* Print error messages.  */
++
++  if (parser->state.argv == argv && argv[0])
++    /* There's an argv[0]; use it for messages.  */
++    {
++      char *short_name = strrchr (argv[0], '/');
++      parser->state.name = short_name ? short_name + 1 : argv[0];
++    }
++  else
++    parser->state.name = __argp_short_program_name ();
++
++  return 0;
++}
++
++/* Free any storage consumed by PARSER (but not PARSER itself).  */
++static error_t
++parser_finalize (struct parser *parser,
++                error_t err, int arg_ebadkey, int *end_index)
++{
++  struct group *group;
++
++  if (err == EBADKEY && arg_ebadkey)
++    /* Suppress errors generated by unparsed arguments.  */
++    err = 0;
++
++  if (! err)
++    {
++      if (parser->state.next == parser->state.argc)
++       /* We successfully parsed all arguments!  Call all the parsers again,
++          just a few more times... */
++       {
++         for (group = parser->groups;
++              group < parser->egroup && (!err || err==EBADKEY);
++              group++)
++           if (group->args_processed == 0)
++             err = group_parse (group, &parser->state, ARGP_KEY_NO_ARGS, 0);
++         for (group = parser->egroup - 1;
++              group >= parser->groups && (!err || err==EBADKEY);
++              group--)
++           err = group_parse (group, &parser->state, ARGP_KEY_END, 0);
++
++         if (err == EBADKEY)
++           err = 0;            /* Some parser didn't understand.  */
++
++         /* Tell the user that all arguments are parsed.  */
++         if (end_index)
++           *end_index = parser->state.next;
++       }
++      else if (end_index)
++       /* Return any remaining arguments to the user.  */
++       *end_index = parser->state.next;
++      else
++       /* No way to return the remaining arguments, they must be bogus. */
++       {
++         if (!(parser->state.flags & ARGP_NO_ERRS)
++             && parser->state.err_stream)
++           fprintf (parser->state.err_stream,
++                    dgettext (parser->argp->argp_domain,
++                              "%s: Too many arguments\n"),
++                    parser->state.name);
++         err = EBADKEY;
++       }
++    }
++
++  /* Okay, we're all done, with either an error or success; call the parsers
++     to indicate which one.  */
++
++  if (err)
++    {
++      /* Maybe print an error message.  */
++      if (err == EBADKEY)
++       /* An appropriate message describing what the error was should have
++          been printed earlier.  */
++       argp_state_help (&parser->state, parser->state.err_stream,
++                          ARGP_HELP_STD_ERR);
++
++      /* Since we didn't exit, give each parser an error indication.  */
++      for (group = parser->groups; group < parser->egroup; group++)
++       group_parse (group, &parser->state, ARGP_KEY_ERROR, 0);
++    }
++  else
++    /* Notify parsers of success, and propagate back values from parsers.  */
++    {
++      /* We pass over the groups in reverse order so that child groups are
++        given a chance to do there processing before passing back a value to
++        the parent.  */
++      for (group = parser->egroup - 1
++          ; group >= parser->groups && (!err || err == EBADKEY)
++          ; group--)
++       err = group_parse (group, &parser->state, ARGP_KEY_SUCCESS, 0);
++      if (err == EBADKEY)
++       err = 0;                /* Some parser didn't understand.  */
++    }
++
++  /* Call parsers once more, to do any final cleanup.  Errors are ignored.  */
++  for (group = parser->egroup - 1; group >= parser->groups; group--)
++    group_parse (group, &parser->state, ARGP_KEY_FINI, 0);
++
++  if (err == EBADKEY)
++    err = EINVAL;
++
++  free (parser->storage);
++
++  return err;
++}
++
++/* Call the user parsers to parse the non-option argument VAL, at the current
++   position, returning any error.  The state NEXT pointer is assumed to have
++   been adjusted (by getopt) to point after this argument; this function will
++   adjust it correctly to reflect however many args actually end up being
++   consumed.  */
++static error_t
++parser_parse_arg (struct parser *parser, char *val)
++{
++  /* Save the starting value of NEXT, first adjusting it so that the arg
++     we're parsing is again the front of the arg vector.  */
++  int index = --parser->state.next;
++  error_t err = EBADKEY;
++  struct group *group;
++  int key = 0;                 /* Which of ARGP_KEY_ARG[S] we used.  */
++
++  /* Try to parse the argument in each parser.  */
++  for (group = parser->groups
++       ; group < parser->egroup && err == EBADKEY
++       ; group++)
++    {
++      parser->state.next++;    /* For ARGP_KEY_ARG, consume the arg.  */
++      key = ARGP_KEY_ARG;
++      err = group_parse (group, &parser->state, key, val);
++
++      if (err == EBADKEY)
++       /* This parser doesn't like ARGP_KEY_ARG; try ARGP_KEY_ARGS instead. */
++       {
++         parser->state.next--; /* For ARGP_KEY_ARGS, put back the arg.  */
++         key = ARGP_KEY_ARGS;
++         err = group_parse (group, &parser->state, key, 0);
++       }
++    }
++
++  if (! err)
++    {
++      if (key == ARGP_KEY_ARGS)
++       /* The default for ARGP_KEY_ARGS is to assume that if NEXT isn't
++          changed by the user, *all* arguments should be considered
++          consumed.  */
++       parser->state.next = parser->state.argc;
++
++      if (parser->state.next > index)
++       /* Remember that we successfully processed a non-option
++          argument -- but only if the user hasn't gotten tricky and set
++          the clock back.  */
++       (--group)->args_processed += (parser->state.next - index);
++      else
++       /* The user wants to reparse some args, give getopt another try.  */
++       parser->try_getopt = 1;
++    }
++
++  return err;
++}
++
++/* Call the user parsers to parse the option OPT, with argument VAL, at the
++   current position, returning any error.  */
++static error_t
++parser_parse_opt (struct parser *parser, int opt, char *val)
++{
++  /* The group key encoded in the high bits; 0 for short opts or
++     group_number + 1 for long opts.  */
++  int group_key = opt >> USER_BITS;
++  error_t err = EBADKEY;
++
++  if (group_key == 0)
++    /* A short option.  By comparing OPT's position in SHORT_OPTS to the
++       various starting positions in each group's SHORT_END field, we can
++       determine which group OPT came from.  */
++    {
++      struct group *group;
++      char *short_index = strchr (parser->short_opts, opt);
++
++      if (short_index)
++       for (group = parser->groups; group < parser->egroup; group++)
++         if (group->short_end > short_index)
++           {
++             err = group_parse (group, &parser->state, opt,
++                                parser->opt_data.optarg);
++             break;
++           }
++    }
++  else
++    /* A long option.  We use shifts instead of masking for extracting
++       the user value in order to preserve the sign.  */
++    err =
++      group_parse (&parser->groups[group_key - 1], &parser->state,
++                  (opt << GROUP_BITS) >> GROUP_BITS,
++                  parser->opt_data.optarg);
++
++  if (err == EBADKEY)
++    /* At least currently, an option not recognized is an error in the
++       parser, because we pre-compute which parser is supposed to deal
++       with each option.  */
++    {
++      static const char bad_key_err[] =
++       N_("(PROGRAM ERROR) Option should have been recognized!?");
++      if (group_key == 0)
++       argp_error (&parser->state, "-%c: %s", opt,
++                     dgettext (parser->argp->argp_domain, bad_key_err));
++      else
++       {
++         struct option *long_opt = parser->long_opts;
++         while (long_opt->val != opt && long_opt->name)
++           long_opt++;
++         argp_error (&parser->state, "--%s: %s",
++                       long_opt->name ? long_opt->name : "???",
++                       dgettext (parser->argp->argp_domain, bad_key_err));
++       }
++    }
++
++  return err;
++}
++
++/* Parse the next argument in PARSER (as indicated by PARSER->state.next).
++   Any error from the parsers is returned, and *ARGP_EBADKEY indicates
++   whether a value of EBADKEY is due to an unrecognized argument (which is
++   generally not fatal).  */
++static error_t
++parser_parse_next (struct parser *parser, int *arg_ebadkey)
++{
++  int opt;
++  error_t err = 0;
++
++  if (parser->state.quoted && parser->state.next < parser->state.quoted)
++    /* The next argument pointer has been moved to before the quoted
++       region, so pretend we never saw the quoting `--', and give getopt
++       another chance.  If the user hasn't removed it, getopt will just
++       process it again.  */
++    parser->state.quoted = 0;
++
++  if (parser->try_getopt && !parser->state.quoted)
++    /* Give getopt a chance to parse this.  */
++    {
++      /* Put it back in OPTIND for getopt.  */
++      parser->opt_data.optind = parser->state.next;
++      /* Distinguish KEY_ERR from a real option.  */
++      parser->opt_data.optopt = KEY_END;
++      if (parser->state.flags & ARGP_LONG_ONLY)
++       opt = _getopt_long_only_r (parser->state.argc, parser->state.argv,
++                                  parser->short_opts, parser->long_opts, 0,
++                                  &parser->opt_data);
++      else
++       opt = _getopt_long_r (parser->state.argc, parser->state.argv,
++                             parser->short_opts, parser->long_opts, 0,
++                             &parser->opt_data);
++      /* And see what getopt did.  */
++      parser->state.next = parser->opt_data.optind;
++
++      if (opt == KEY_END)
++       /* Getopt says there are no more options, so stop using
++          getopt; we'll continue if necessary on our own.  */
++       {
++         parser->try_getopt = 0;
++         if (parser->state.next > 1
++             && strcmp (parser->state.argv[parser->state.next - 1], QUOTE)
++                  == 0)
++           /* Not only is this the end of the options, but it's a
++              `quoted' region, which may have args that *look* like
++              options, so we definitely shouldn't try to use getopt past
++              here, whatever happens.  */
++           parser->state.quoted = parser->state.next;
++       }
++      else if (opt == KEY_ERR && parser->opt_data.optopt != KEY_END)
++       /* KEY_ERR can have the same value as a valid user short
++          option, but in the case of a real error, getopt sets OPTOPT
++          to the offending character, which can never be KEY_END.  */
++       {
++         *arg_ebadkey = 0;
++         return EBADKEY;
++       }
++    }
++  else
++    opt = KEY_END;
++
++  if (opt == KEY_END)
++    {
++      /* We're past what getopt considers the options.  */
++      if (parser->state.next >= parser->state.argc
++         || (parser->state.flags & ARGP_NO_ARGS))
++       /* Indicate that we're done.  */
++       {
++         *arg_ebadkey = 1;
++         return EBADKEY;
++       }
++      else
++       /* A non-option arg; simulate what getopt might have done.  */
++       {
++         opt = KEY_ARG;
++         parser->opt_data.optarg = parser->state.argv[parser->state.next++];
++       }
++    }
++
++  if (opt == KEY_ARG)
++    /* A non-option argument; try each parser in turn.  */
++    err = parser_parse_arg (parser, parser->opt_data.optarg);
++  else
++    err = parser_parse_opt (parser, opt, parser->opt_data.optarg);
++
++  if (err == EBADKEY)
++    *arg_ebadkey = (opt == KEY_END || opt == KEY_ARG);
++
++  return err;
++}
++
++/* Parse the options strings in ARGC & ARGV according to the argp in ARGP.
++   FLAGS is one of the ARGP_ flags above.  If END_INDEX is non-NULL, the
++   index in ARGV of the first unparsed option is returned in it.  If an
++   unknown option is present, EINVAL is returned; if some parser routine
++   returned a non-zero value, it is returned; otherwise 0 is returned.  */
++error_t
++argp_parse (const struct argp *argp, int argc, char **argv, unsigned flags,
++             int *end_index, void *input)
++{
++  error_t err;
++  struct parser parser;
++
++  /* If true, then err == EBADKEY is a result of a non-option argument failing
++     to be parsed (which in some cases isn't actually an error).  */
++  int arg_ebadkey = 0;
++
++  if (! (flags & ARGP_NO_HELP))
++    /* Add our own options.  */
++    {
++      struct argp_child *child = alloca (4 * sizeof (struct argp_child));
++      struct argp *top_argp = alloca (sizeof (struct argp));
++
++      /* TOP_ARGP has no options, it just serves to group the user & default
++        argps.  */
++      memset (top_argp, 0, sizeof (*top_argp));
++      top_argp->children = child;
++
++      memset (child, 0, 4 * sizeof (struct argp_child));
++
++      if (argp)
++       (child++)->argp = argp;
++      (child++)->argp = &argp_default_argp;
++      if (argp_program_version || argp_program_version_hook)
++       (child++)->argp = &argp_version_argp;
++      child->argp = 0;
++
++      argp = top_argp;
++    }
++
++  /* Construct a parser for these arguments.  */
++  err = parser_init (&parser, argp, argc, argv, flags, input);
++
++  if (! err)
++    /* Parse! */
++    {
++      while (! err)
++       err = parser_parse_next (&parser, &arg_ebadkey);
++      err = parser_finalize (&parser, err, arg_ebadkey, end_index);
++    }
++
++  return err;
++}
++
++/* Return the input field for ARGP in the parser corresponding to STATE; used
++   by the help routines.  */
++void *
++__argp_input (const struct argp *argp, const struct argp_state *state)
++{
++  if (state)
++    {
++      struct group *group;
++      struct parser *parser = state->pstate;
++
++      for (group = parser->groups; group < parser->egroup; group++)
++       if (group->argp == argp)
++         return group->input;
++    }
++
++  return 0;
++}
+Index: git/libuargp/argp-pv.c
+===================================================================
+--- /dev/null
++++ git/libuargp/argp-pv.c
+@@ -0,0 +1,25 @@
++/* Default definition for ARGP_PROGRAM_VERSION.
++   Copyright (C) 1996, 1997, 1999 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++   Written by Miles Bader <miles at gnu.ai.mit.edu>.
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
++/* If set by the user program to a non-zero value, then a default option
++   --version is added (unless the ARGP_NO_HELP flag is used), which will
++   print this this string followed by a newline and exit (unless the
++   ARGP_NO_EXIT flag is used).  Overridden by ARGP_PROGRAM_VERSION_HOOK.  */
++const char *argp_program_version;
+Index: git/libuargp/argp-pvh.c
+===================================================================
+--- /dev/null
++++ git/libuargp/argp-pvh.c
+@@ -0,0 +1,32 @@
++/* Default definition for ARGP_PROGRAM_VERSION_HOOK.
++   Copyright (C) 1996, 1997, 1999 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++   Written by Miles Bader <miles at gnu.ai.mit.edu>.
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
++#ifdef HAVE_CONFIG_H
++#include <config.h>
++#endif
++
++#include <argp.h>
++
++/* If set by the user program to a non-zero value, then a default option
++   --version is added (unless the ARGP_NO_HELP flag is used), which calls
++   this function with a stream to print the version to and a pointer to the
++   current parsing state, and then exits (unless the ARGP_NO_EXIT flag is
++   used).  This variable takes precedent over ARGP_PROGRAM_VERSION.  */
++void (*argp_program_version_hook) (FILE *stream, struct argp_state *state);
+Index: git/libuargp/argp-xinl.c
+===================================================================
+--- /dev/null
++++ git/libuargp/argp-xinl.c
+@@ -0,0 +1,35 @@
++/* Real definitions for extern inline functions in argp.h
++   Copyright (C) 1997, 1998, 2004 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++   Written by Miles Bader <miles at gnu.ai.mit.edu>.
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
++#ifdef HAVE_CONFIG_H
++# include <config.h>
++#endif
++
++#if defined _LIBC || defined HAVE_FEATURES_H
++# include <features.h>
++#endif
++
++#ifndef __USE_EXTERN_INLINES
++# define __USE_EXTERN_INLINES  1
++#endif
++#define ARGP_EI
++#undef __OPTIMIZE__
++#define __OPTIMIZE__ 1
++#include <argp.h>
+Index: git/test/argp/Makefile
+===================================================================
+--- /dev/null
++++ git/test/argp/Makefile
+@@ -0,0 +1,7 @@
++# uClibc argp tests
++# Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
++
++top_builddir=../../
++include ../Rules.mak
++-include Makefile.in
++include ../Test.mak
+Index: git/test/argp/Makefile.in
+===================================================================
+--- /dev/null
++++ git/test/argp/Makefile.in
+@@ -0,0 +1,12 @@
++# uClibc argp tests
++# Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
++
++TESTS := $(addprefix argp-, ex1 ex2 ex3 ex4 test) \
++         bug-argp1 tst-argp1 tst-argp2
++
++EXTRA_LDFLAGS = -luargp
++
++OPTS_argp-ex3 = ARG1 ARG2
++OPTS_argp-ex4 = ARG1 string1 string2 string3
++OPTS_bug-argp1 = -- --help
++
+Index: git/test/argp/argp-ex1.c
+===================================================================
+--- /dev/null
++++ git/test/argp/argp-ex1.c
+@@ -0,0 +1,15 @@
++/* Argp example #1 -- a minimal program using argp */
++
++/* This is (probably) the smallest possible program that
++   uses argp.  It won't do much except give an error
++   messages and exit when there are any arguments, and print
++   a (rather pointless) messages for --help.  */
++
++#include <stdlib.h>
++#include <argp.h>
++
++int main (int argc, char **argv)
++{
++  argp_parse (0, argc, argv, 0, 0, 0);
++  exit (0);
++}
+Index: git/test/argp/argp-ex2.c
+===================================================================
+--- /dev/null
++++ git/test/argp/argp-ex2.c
+@@ -0,0 +1,45 @@
++/* Argp example #2 -- a pretty minimal program using argp */
++
++/* This program doesn't use any options or arguments, but uses
++   argp to be compliant with the GNU standard command line
++   format.
++
++   In addition to making sure no arguments are given, and
++   implementing a --help option, this example will have a
++   --version option, and will put the given documentation string
++   and bug address in the --help output, as per GNU standards.
++
++   The variable ARGP contains the argument parser specification;
++   adding fields to this structure is the way most parameters are
++   passed to argp_parse (the first three fields are usually used,
++   but not in this small program).  There are also two global
++   variables that argp knows about defined here,
++   ARGP_PROGRAM_VERSION and ARGP_PROGRAM_BUG_ADDRESS (they are
++   global variables because they will almost always be constant
++   for a given program, even if it uses different argument
++   parsers for various tasks).  */
++
++#include <stdlib.h>
++#include <argp.h>
++
++const char *argp_program_version =
++  "argp-ex2 1.0";
++const char *argp_program_bug_address =
++  "<bug-gnu-utils@@gnu.org>";
++
++/* Program documentation.  */
++static char doc[] =
++  "Argp example #2 -- a pretty minimal program using argp";
++
++/* Our argument parser.  The @code{options}, @code{parser}, and
++   @code{args_doc} fields are zero because we have neither options or
++   arguments; @code{doc} and @code{argp_program_bug_address} will be
++   used in the output for @samp{--help}, and the @samp{--version}
++   option will print out @code{argp_program_version}.  */
++static struct argp argp = { 0, 0, 0, doc };
++
++int main (int argc, char **argv)
++{
++  argp_parse (&argp, argc, argv, 0, 0, 0);
++  exit (0);
++}
+Index: git/test/argp/argp-ex3.c
+===================================================================
+--- /dev/null
++++ git/test/argp/argp-ex3.c
+@@ -0,0 +1,153 @@
++/* Argp example #3 -- a program with options and arguments using argp */
++
++/* This program uses the same features as example 2, and uses options and
++   arguments.
++
++   We now use the first four fields in ARGP, so here's a description of them:
++     OPTIONS  -- A pointer to a vector of struct argp_option (see below)
++     PARSER   -- A function to parse a single option, called by argp
++     ARGS_DOC -- A string describing how the non-option arguments should look
++     DOC      -- A descriptive string about this program; if it contains a
++                 vertical tab character (\v), the part after it will be
++                 printed *following* the options
++
++   The function PARSER takes the following arguments:
++     KEY  -- An integer specifying which option this is (taken
++             from the KEY field in each struct argp_option), or
++             a special key specifying something else; the only
++             special keys we use here are ARGP_KEY_ARG, meaning
++             a non-option argument, and ARGP_KEY_END, meaning
++             that all arguments have been parsed
++     ARG  -- For an option KEY, the string value of its
++             argument, or NULL if it has none
++     STATE-- A pointer to a struct argp_state, containing
++             various useful information about the parsing state; used here
++             are the INPUT field, which reflects the INPUT argument to
++             argp_parse, and the ARG_NUM field, which is the number of the
++             current non-option argument being parsed
++   It should return either 0, meaning success, ARGP_ERR_UNKNOWN, meaning the
++   given KEY wasn't recognized, or an errno value indicating some other
++   error.
++
++   Note that in this example, main uses a structure to communicate with the
++   parse_opt function, a pointer to which it passes in the INPUT argument to
++   argp_parse.  Of course, it's also possible to use global variables
++   instead, but this is somewhat more flexible.
++
++   The OPTIONS field contains a pointer to a vector of struct argp_option's;
++   that structure has the following fields (if you assign your option
++   structures using array initialization like this example, unspecified
++   fields will be defaulted to 0, and need not be specified):
++     NAME   -- The name of this option's long option (may be zero)
++     KEY    -- The KEY to pass to the PARSER function when parsing this option,
++               *and* the name of this option's short option, if it is a
++               printable ascii character
++     ARG    -- The name of this option's argument, if any
++     FLAGS  -- Flags describing this option; some of them are:
++                 OPTION_ARG_OPTIONAL -- The argument to this option is optional
++                 OPTION_ALIAS        -- This option is an alias for the
++                                        previous option
++                 OPTION_HIDDEN       -- Don't show this option in --help output
++     DOC    -- A documentation string for this option, shown in --help output
++
++   An options vector should be terminated by an option with all fields zero. */
++
++#include <stdlib.h>
++#include <argp.h>
++
++const char *argp_program_version =
++  "argp-ex3 1.0";
++const char *argp_program_bug_address =
++  "<bug-gnu-utils@@gnu.org>";
++
++/* Program documentation.  */
++static char doc[] =
++  "Argp example #3 -- a program with options and arguments using argp";
++
++/* A description of the arguments we accept.  */
++static char args_doc[] = "ARG1 ARG2";
++
++/* The options we understand.  */
++static struct argp_option options[] = {
++  {"verbose",  'v', 0,      0,  "Produce verbose output" },
++  {"quiet",    'q', 0,      0,  "Don't produce any output" },
++  {"silent",   's', 0,      OPTION_ALIAS },
++  {"output",   'o', "FILE", 0,
++   "Output to FILE instead of standard output" },
++  { 0 }
++};
++
++/* Used by @code{main} to communicate with @code{parse_opt}.  */
++struct arguments
++{
++  char *args[2];               /* @var{arg1} & @var{arg2} */
++  int silent, verbose;
++  char *output_file;
++};
++
++/* Parse a single option.  */
++static error_t
++parse_opt (int key, char *arg, struct argp_state *state)
++{
++  /* Get the @var{input} argument from @code{argp_parse}, which we
++     know is a pointer to our arguments structure.  */
++  struct arguments *arguments = state->input;
++
++  switch (key)
++    {
++    case 'q': case 's':
++      arguments->silent = 1;
++      break;
++    case 'v':
++      arguments->verbose = 1;
++      break;
++    case 'o':
++      arguments->output_file = arg;
++      break;
++
++    case ARGP_KEY_ARG:
++      if (state->arg_num >= 2)
++       /* Too many arguments.  */
++       argp_usage (state);
++
++      arguments->args[state->arg_num] = arg;
++
++      break;
++
++    case ARGP_KEY_END:
++      if (state->arg_num < 2)
++       /* Not enough arguments.  */
++       argp_usage (state);
++      break;
++
++    default:
++      return ARGP_ERR_UNKNOWN;
++    }
++  return 0;
++}
++
++/* Our argp parser.  */
++static struct argp argp = { options, parse_opt, args_doc, doc };
++
++int main (int argc, char **argv)
++{
++  struct arguments arguments;
++
++  /* Default values.  */
++  arguments.silent = 0;
++  arguments.verbose = 0;
++  arguments.output_file = "-";
++
++  /* Parse our arguments; every option seen by @code{parse_opt} will
++     be reflected in @code{arguments}.  */
++  argp_parse (&argp, argc, argv, 0, 0, &arguments);
++
++  printf ("ARG1 = %s\nARG2 = %s\nOUTPUT_FILE = %s\n"
++         "VERBOSE = %s\nSILENT = %s\n",
++         arguments.args[0], arguments.args[1],
++         arguments.output_file,
++         arguments.verbose ? "yes" : "no",
++         arguments.silent ? "yes" : "no");
++
++  exit (0);
++}
+Index: git/test/argp/argp-ex4.c
+===================================================================
+--- /dev/null
++++ git/test/argp/argp-ex4.c
+@@ -0,0 +1,167 @@
++/* Argp example #4 -- a program with somewhat more complicated options */
++
++/* This program uses the same features as example 3, but has more
++   options, and somewhat more structure in the -help output.  It
++   also shows how you can `steal' the remainder of the input
++   arguments past a certain point, for programs that accept a
++   list of items.  It also shows the special argp KEY value
++   ARGP_KEY_NO_ARGS, which is only given if no non-option
++   arguments were supplied to the program.
++
++   For structuring the help output, two features are used,
++   *headers* which are entries in the options vector with the
++   first four fields being zero, and a two part documentation
++   string (in the variable DOC), which allows documentation both
++   before and after the options; the two parts of DOC are
++   separated by a vertical-tab character ('\v', or '\013').  By
++   convention, the documentation before the options is just a
++   short string saying what the program does, and that afterwards
++   is longer, describing the behavior in more detail.  All
++   documentation strings are automatically filled for output,
++   although newlines may be included to force a line break at a
++   particular point.  All documentation strings are also passed to
++   the `gettext' function, for possible translation into the
++   current locale.  */
++
++#include <stdlib.h>
++#include <error.h>
++#include <argp.h>
++
++const char *argp_program_version =
++  "argp-ex4 1.0";
++const char *argp_program_bug_address =
++  "<bug-gnu-utils@@prep.ai.mit.edu>";
++
++/* Program documentation.  */
++static char doc[] =
++  "Argp example #4 -- a program with somewhat more complicated\
++options\
++\vThis part of the documentation comes *after* the options;\
++ note that the text is automatically filled, but it's possible\
++ to force a line-break, e.g.\n<-- here.";
++
++/* A description of the arguments we accept.  */
++static char args_doc[] = "ARG1 [STRING...]";
++
++/* Keys for options without short-options.  */
++#define OPT_ABORT  1           /* --abort */
++
++/* The options we understand.  */
++static struct argp_option options[] = {
++  {"verbose",  'v', 0,       0, "Produce verbose output" },
++  {"quiet",    'q', 0,       0, "Don't produce any output" },
++  {"silent",   's', 0,       OPTION_ALIAS },
++  {"output",   'o', "FILE",  0,
++   "Output to FILE instead of standard output" },
++
++  {0,0,0,0, "The following options should be grouped together:" },
++  {"repeat",   'r', "COUNT", OPTION_ARG_OPTIONAL,
++   "Repeat the output COUNT (default 10) times"},
++  {"abort",    OPT_ABORT, 0, 0, "Abort before showing any output"},
++
++  { 0 }
++};
++
++/* Used by @code{main} to communicate with @code{parse_opt}.  */
++struct arguments
++{
++  char *arg1;                  /* @var{arg1} */
++  char **strings;              /* [@var{string}@dots{}] */
++  int silent, verbose, abort;  /* @samp{-s}, @samp{-v}, @samp{--abort} */
++  char *output_file;           /* @var{file} arg to @samp{--output} */
++  int repeat_count;            /* @var{count} arg to @samp{--repeat} */
++};
++
++/* Parse a single option.  */
++static error_t
++parse_opt (int key, char *arg, struct argp_state *state)
++{
++  /* Get the @code{input} argument from @code{argp_parse}, which we
++     know is a pointer to our arguments structure.  */
++  struct arguments *arguments = state->input;
++
++  switch (key)
++    {
++    case 'q': case 's':
++      arguments->silent = 1;
++      break;
++    case 'v':
++      arguments->verbose = 1;
++      break;
++    case 'o':
++      arguments->output_file = arg;
++      break;
++    case 'r':
++      arguments->repeat_count = arg ? atoi (arg) : 10;
++      break;
++    case OPT_ABORT:
++      arguments->abort = 1;
++      break;
++
++    case ARGP_KEY_NO_ARGS:
++      argp_usage (state);
++
++    case ARGP_KEY_ARG:
++      /* Here we know that @code{state->arg_num == 0}, since we
++        force argument parsing to end before any more arguments can
++        get here.  */
++      arguments->arg1 = arg;
++
++      /* Now we consume all the rest of the arguments.
++        @code{state->next} is the index in @code{state->argv} of the
++        next argument to be parsed, which is the first @var{string}
++        we're interested in, so we can just use
++        @code{&state->argv[state->next]} as the value for
++        arguments->strings.
++
++        @emph{In addition}, by setting @code{state->next} to the end
++        of the arguments, we can force argp to stop parsing here and
++        return.  */
++      arguments->strings = &state->argv[state->next];
++      state->next = state->argc;
++
++      break;
++
++    default:
++      return ARGP_ERR_UNKNOWN;
++    }
++  return 0;
++}
++
++/* Our argp parser.  */
++static struct argp argp = { options, parse_opt, args_doc, doc };
++
++int main (int argc, char **argv)
++{
++  int i, j;
++  struct arguments arguments;
++
++  /* Default values.  */
++  arguments.silent = 0;
++  arguments.verbose = 0;
++  arguments.output_file = "-";
++  arguments.repeat_count = 1;
++  arguments.abort = 0;
++
++  /* Parse our arguments; every option seen by @code{parse_opt} will be
++     reflected in @code{arguments}.  */
++  argp_parse (&argp, argc, argv, 0, 0, &arguments);
++
++  if (arguments.abort)
++    error (10, 0, "ABORTED");
++
++  for (i = 0; i < arguments.repeat_count; i++)
++    {
++      printf ("ARG1 = %s\n", arguments.arg1);
++      printf ("STRINGS = ");
++      for (j = 0; arguments.strings[j]; j++)
++       printf (j == 0 ? "%s" : ", %s", arguments.strings[j]);
++      printf ("\n");
++      printf ("OUTPUT_FILE = %s\nVERBOSE = %s\nSILENT = %s\n",
++             arguments.output_file,
++             arguments.verbose ? "yes" : "no",
++             arguments.silent ? "yes" : "no");
++    }
++
++  exit (0);
++}
+Index: git/test/argp/argp-test.c
+===================================================================
+--- /dev/null
++++ git/test/argp/argp-test.c
+@@ -0,0 +1,209 @@
++/* Test program for argp argument parser
++   Copyright (C) 1997 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++   Written by Miles Bader <miles at gnu.ai.mit.edu>.
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
++#ifdef HAVE_CONFIG_H
++#include <config.h>
++#endif
++
++#include <stdlib.h>
++#include <time.h>
++#include <string.h>
++#include <argp.h>
++
++const char *argp_program_version = "argp-test 1.0";
++
++struct argp_option sub_options[] =
++{
++  {"subopt1",       's',     0,  0, "Nested option 1"},
++  {"subopt2",       'S',     0,  0, "Nested option 2"},
++
++  { 0, 0, 0, 0, "Some more nested options:", 10},
++  {"subopt3",       'p',     0,  0, "Nested option 3"},
++
++  {"subopt4",       'q',     0,  0, "Nested option 4", 1},
++
++  {0}
++};
++
++static const char sub_args_doc[] = "STRING...\n-";
++static const char sub_doc[] = "\vThis is the doc string from the sub-arg-parser.";
++
++static error_t
++sub_parse_opt (int key, char *arg, struct argp_state *state)
++{
++  switch (key)
++    {
++    case ARGP_KEY_NO_ARGS:
++      printf ("NO SUB ARGS\n");
++      break;
++    case ARGP_KEY_ARG:
++      printf ("SUB ARG: %s\n", arg);
++      break;
++
++    case 's' : case 'S': case 'p': case 'q':
++      printf ("SUB KEY %c\n", key);
++      break;
++
++    default:
++      return ARGP_ERR_UNKNOWN;
++    }
++  return 0;
++}
++
++static char *
++sub_help_filter (int key, const char *text, void *input)
++{
++  if (key == ARGP_KEY_HELP_EXTRA)
++    return strdup ("This is some extra text from the sub parser (note that it \
++is preceded by a blank line).");
++  else
++    return (char *)text;
++}
++
++static struct argp sub_argp = {
++  sub_options, sub_parse_opt, sub_args_doc, sub_doc, 0, sub_help_filter
++};
++
++/* Structure used to communicate with the parsing functions.  */
++struct params
++{
++  unsigned foonly;             /* Value parsed for foonly.  */
++  unsigned foonly_default;     /* Default value for it.  */
++};
++
++#define OPT_PGRP 1
++#define OPT_SESS 2
++
++struct argp_option options[] =
++{
++  {"pid",       'p',     "PID", 0, "List the process PID"},
++  {"pgrp",      OPT_PGRP,"PGRP",0, "List processes in the process group PGRP"},
++  {"no-parent", 'P',    0,     0, "Include processes without parents"},
++  {0,           'x',     0,     OPTION_ALIAS},
++  {"all-fields",'Q',     0,     0, "Don't elide unusable fields (normally"
++                                  " if there's some reason ps can't"
++                                  " print a field for any process, it's"
++                                  " removed from the output entirely)" },
++  {"reverse",   'r',    0,      0, "Reverse the order of any sort"},
++  {"gratuitously-long-reverse-option", 0, 0, OPTION_ALIAS},
++  {"session",  OPT_SESS,"SID",  OPTION_ARG_OPTIONAL,
++                                  "Add the processes from the session"
++                                  " SID (which defaults to the sid of"
++                                  " the current process)" },
++
++  {0,0,0,0, "Here are some more options:"},
++  {"foonly", 'f', "ZOT", OPTION_ARG_OPTIONAL, "Glork a foonly"},
++  {"zaza", 'z', 0, 0, "Snit a zar"},
++
++  {0}
++};
++
++static const char args_doc[] = "STRING";
++static const char doc[] = "Test program for argp."
++ "\vThis doc string comes after the options."
++ "\nHey!  Some manual formatting!"
++ "\nThe current time is: %s";
++
++static void
++popt (int key, char *arg)
++{
++  char buf[10];
++  if (isprint (key))
++    sprintf (buf, "%c", key);
++  else
++    sprintf (buf, "%d", key);
++  if (arg)
++    printf ("KEY %s: %s\n", buf, arg);
++  else
++    printf ("KEY %s\n", buf);
++}
++
++static error_t
++parse_opt (int key, char *arg, struct argp_state *state)
++{
++  struct params *params = state->input;
++
++  switch (key)
++    {
++    case ARGP_KEY_NO_ARGS:
++      printf ("NO ARGS\n");
++      break;
++
++    case ARGP_KEY_ARG:
++      if (state->arg_num > 0)
++       return ARGP_ERR_UNKNOWN; /* Leave it for the sub-arg parser.  */
++      printf ("ARG: %s\n", arg);
++      break;
++
++    case 'f':
++      if (arg)
++       params->foonly = atoi (arg);
++      else
++       params->foonly = params->foonly_default;
++      popt (key, arg);
++      break;
++
++    case 'p': case 'P': case OPT_PGRP: case 'x': case 'Q':
++    case 'r': case OPT_SESS: case 'z':
++      popt (key, arg);
++      break;
++
++    default:
++      return ARGP_ERR_UNKNOWN;
++    }
++  return 0;
++}
++
++static char *
++help_filter (int key, const char *text, void *input)
++{
++  char *new_text;
++  struct params *params = input;
++
++  if (key == ARGP_KEY_HELP_POST_DOC && text)
++    {
++      time_t now = time (0);
++      asprintf (&new_text, text, ctime (&now));
++    }
++  else if (key == 'f')
++    /* Show the default for the --foonly option.  */
++    asprintf (&new_text, "%s (ZOT defaults to %x)",
++             text, params->foonly_default);
++  else
++    new_text = (char *)text;
++
++  return new_text;
++}
++
++static struct argp_child argp_children[] = { { &sub_argp }, { 0 } };
++static struct argp argp = {
++  options, parse_opt, args_doc, doc, argp_children, help_filter
++};
++
++int
++main (int argc, char **argv)
++{
++  struct params params;
++  params.foonly = 0;
++  params.foonly_default = random ();
++  argp_parse (&argp, argc, argv, 0, 0, &params);
++  printf ("After parsing: foonly = %x\n", params.foonly);
++  return 0;
++}
+Index: git/test/argp/bug-argp1.c
+===================================================================
+--- /dev/null
++++ git/test/argp/bug-argp1.c
+@@ -0,0 +1,26 @@
++#include <argp.h>
++
++
++static const struct argp_option test_options[] =
++{
++  { NULL, 'a', NULL, OPTION_DOC, NULL },
++  { NULL, 'b', NULL, OPTION_DOC, NULL },
++  { NULL, 0, NULL, 0, NULL }
++};
++
++static struct argp test_argp =
++{
++  test_options
++};
++
++
++static int
++do_test (int argc, char *argv[])
++{
++  int i;
++  argp_parse (&test_argp, argc, argv, 0, &i, NULL);
++  return 0;
++}
++
++#define TEST_FUNCTION do_test (argc, argv)
++#include "../test-skeleton.c"
+Index: git/test/argp/tst-argp1.c
+===================================================================
+--- /dev/null
++++ git/test/argp/tst-argp1.c
+@@ -0,0 +1,118 @@
++/* Copyright (C) 2002, 2003 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++   Contributed by Ulrich Drepper <drepper at redhat.com>, 2002.
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
++#include <argp.h>
++
++
++
++
++#define OPT_TO_THREAD          300
++#define OPT_TO_PROCESS         301
++#define OPT_SYNC_SIGNAL                302
++#define OPT_SYNC_JOIN          303
++#define OPT_TOPLEVEL           304
++
++
++static const struct argp_option test_options[] =
++  {
++    { NULL, 0, NULL, 0, "\
++This is a test for threads so we allow ther user to selection the number of \
++threads which are used at any one time.  Independently the total number of \
++rounds can be selected.  This is the total number of threads which will have \
++run when the process terminates:" },
++    { "threads", 't', "NUMBER", 0, "Number of threads used at once" },
++    { "starts", 's', "NUMBER", 0, "Total number of working threads" },
++    { "toplevel", OPT_TOPLEVEL, "NUMBER", 0,
++      "Number of toplevel threads which start the other threads; this \
++implies --sync-join" },
++
++    { NULL, 0, NULL, 0, "\
++Each thread can do one of two things: sleep or do work.  The latter is 100% \
++CPU bound.  The work load is the probability a thread does work.  All values \
++from zero to 100 (inclusive) are valid.  How often each thread repeats this \
++can be determined by the number of rounds.  The work cost determines how long \
++each work session (not sleeping) takes.  If it is zero a thread would \
++effectively nothing.  By setting the number of rounds to zero the thread \
++does no work at all and pure thread creation times can be measured." },
++    { "workload", 'w', "PERCENT", 0, "Percentage of time spent working" },
++    { "workcost", 'c', "NUMBER", 0,
++      "Factor in the cost of each round of working" },
++    { "rounds", 'r', "NUMBER", 0, "Number of rounds each thread runs" },
++
++    { NULL, 0, NULL, 0, "\
++There are a number of different methods how thread creation can be \
++synchronized.  Synchronization is necessary since the number of concurrently \
++running threads is limited." },
++    { "sync-signal", OPT_SYNC_SIGNAL, NULL, 0,
++      "Synchronize using a signal (default)" },
++    { "sync-join", OPT_SYNC_JOIN, NULL, 0, "Synchronize using pthread_join" },
++
++    { NULL, 0, NULL, 0, "\
++One parameter for each threads execution is the size of the stack.  If this \
++parameter is not used the system's default stack size is used.  If many \
++threads are used the stack size should be chosen quite small." },
++    { "stacksize", 'S', "BYTES", 0, "Size of threads stack" },
++    { "guardsize", 'g', "BYTES", 0,
++      "Size of stack guard area; must fit into the stack" },
++
++    { NULL, 0, NULL, 0, "Signal options:" },
++    { "to-thread", OPT_TO_THREAD, NULL, 0, "Send signal to main thread" },
++    { "to-process", OPT_TO_PROCESS, NULL, 0,
++      "Send signal to process (default)" },
++
++    { NULL, 0, NULL, 0, "Administrative options:" },
++    { "progress", 'p', NULL, 0, "Show signs of progress" },
++    { "timing", 'T', NULL, 0,
++      "Measure time from startup to the last thread finishing" },
++    { NULL, 0, NULL, 0, NULL }
++  };
++
++/* Prototype for option handler.  */
++static error_t parse_opt (int key, char *arg, struct argp_state *state);
++
++/* Data structure to communicate with argp functions.  */
++static struct argp argp =
++{
++  test_options, parse_opt
++};
++
++
++static int
++do_test (void)
++{
++  int argc = 2;
++  char *argv[3] = { (char *) "tst-argp1", (char *) "--help", NULL };
++  int remaining;
++
++  /* Parse and process arguments.  */
++  argp_parse (&argp, argc, argv, 0, &remaining, NULL);
++
++  return 0;
++}
++
++
++/* Handle program arguments.  */
++static error_t
++parse_opt (int key, char *arg, struct argp_state *state)
++{
++  return ARGP_ERR_UNKNOWN;
++}
++
++#define TEST_FUNCTION do_test ()
++#include "../test-skeleton.c"
+Index: git/test/argp/tst-argp2.c
+===================================================================
+--- /dev/null
++++ git/test/argp/tst-argp2.c
+@@ -0,0 +1,101 @@
++/* Copyright (C) 2007 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++   Contributed by Jakub Jelinek <jakub at redhat.com>, 2007.
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
++#include <argp.h>
++
++static const struct argp_option opt1[] =
++  {
++    { "opt1", '1', "NUMBER", 0, "Option 1" },
++    { NULL, 0, NULL, 0, NULL }
++  };
++
++static const struct argp_option opt2[] =
++  {
++    { "opt2", '2', "NUMBER", 0, "Option 2" },
++    { NULL, 0, NULL, 0, NULL }
++  };
++
++static const struct argp_option opt3[] =
++  {
++    { "opt3", '3', "NUMBER", 0, "Option 3" },
++    { NULL, 0, NULL, 0, NULL }
++  };
++
++static const struct argp_option opt4[] =
++  {
++    { "opt4", '4', "NUMBER", 0, "Option 4" },
++    { NULL, 0, NULL, 0, NULL }
++  };
++
++static const struct argp_option opt5[] =
++  {
++    { "opt5", '5', "NUMBER", 0, "Option 5" },
++    { NULL, 0, NULL, 0, NULL }
++  };
++
++static struct argp argp5 =
++  {
++    opt5, NULL, "args doc5", "doc5", NULL, NULL, NULL
++  };
++
++static struct argp argp4 =
++  {
++    opt4, NULL, "args doc4", "doc4", NULL, NULL, NULL
++  };
++
++static struct argp argp3 =
++  {
++    opt3, NULL, "args doc3", "doc3", NULL, NULL, NULL
++  };
++
++static struct argp_child children2[] =
++  {
++    { &argp4, 0, "child3", 3 },
++    { &argp5, 0, "child4", 4 },
++    { NULL, 0, NULL, 0 }
++  };
++
++static struct argp argp2 =
++  {
++    opt2, NULL, "args doc2", "doc2", children2, NULL, NULL
++  };
++
++static struct argp_child children1[] =
++  {
++    { &argp2, 0, "child1", 1 },
++    { &argp3, 0, "child2", 2 },
++    { NULL, 0, NULL, 0 }
++  };
++
++static struct argp argp1 =
++  {
++    opt1, NULL, "args doc1", "doc1", children1, NULL, NULL
++  };
++
++
++static int
++do_test (void)
++{
++  argp_help (&argp1, stdout, ARGP_HELP_LONG, (char *) "tst-argp2");
++  return 0;
++}
++
++
++#define TEST_FUNCTION do_test ()
++#include "../test-skeleton.c"
diff --git a/meta/recipes-core/uclibc/uclibc-0.9.30.1/arm/uClibc.machine b/meta/recipes-core/uclibc/uclibc-git/arm/uClibc.machine
similarity index 96%
rename from meta/recipes-core/uclibc/uclibc-0.9.30.1/arm/uClibc.machine
rename to meta/recipes-core/uclibc/uclibc-git/arm/uClibc.machine
index 898b73a..293f384 100644
--- a/meta/recipes-core/uclibc/uclibc-0.9.30.1/arm/uClibc.machine
+++ b/meta/recipes-core/uclibc/uclibc-git/arm/uClibc.machine
@@ -34,12 +34,12 @@ FORCE_OPTIONS_FOR_ARCH=y
 # CONFIG_ARM_OABI is not set
 CONFIG_ARM_EABI=y
 USE_BX=y
-# CONFIG_GENERIC_ARM is not set
+CONFIG_GENERIC_ARM=y
 # CONFIG_ARM610 is not set
 # CONFIG_ARM710 is not set
 # CONFIG_ARM7TDMI is not set
 # CONFIG_ARM720T is not set
-CONFIG_ARM920T=y
+# CONFIG_ARM920T is not set
 # CONFIG_ARM922T is not set
 # CONFIG_ARM926T is not set
 # CONFIG_ARM10T is not set
diff --git a/meta/recipes-core/uclibc/uclibc-0.9.30.1/uClibc.machine.iwmmxt b/meta/recipes-core/uclibc/uclibc-git/armeb/uClibc.machine
similarity index 65%
rename from meta/recipes-core/uclibc/uclibc-0.9.30.1/uClibc.machine.iwmmxt
rename to meta/recipes-core/uclibc/uclibc-git/armeb/uClibc.machine
index e27931c..7a6ad8b 100644
--- a/meta/recipes-core/uclibc/uclibc-0.9.30.1/uClibc.machine.iwmmxt
+++ b/meta/recipes-core/uclibc/uclibc-git/armeb/uClibc.machine
@@ -1,6 +1,5 @@
 #
 # Automatically generated make config: don't edit
-# Sat May 12 23:18:41 2007
 #
 # TARGET_alpha is not set
 TARGET_arm=y
@@ -12,7 +11,6 @@ TARGET_arm=y
 # TARGET_hppa is not set
 # TARGET_i386 is not set
 # TARGET_i960 is not set
-# TARGET_ia64 is not set
 # TARGET_m68k is not set
 # TARGET_microblaze is not set
 # TARGET_mips is not set
@@ -23,48 +21,33 @@ TARGET_arm=y
 # TARGET_sh64 is not set
 # TARGET_sparc is not set
 # TARGET_v850 is not set
-# TARGET_vax is not set
 # TARGET_x86_64 is not set
 
 #
 # Target Architecture Features and Options
 #
 TARGET_ARCH="arm"
+ARCH_SUPPORTS_BIG_ENDIAN=y
+ARCH_SUPPORTS_LITTLE_ENDIAN=y
 FORCE_OPTIONS_FOR_ARCH=y
-# CONFIG_ARM_OABI is not set
-CONFIG_ARM_EABI=y
-USE_BX=y
-# CONFIG_GENERIC_ARM is not set
+CONFIG_GENERIC_ARM=y
 # CONFIG_ARM610 is not set
 # CONFIG_ARM710 is not set
-# CONFIG_ARM7TDMI is not set
 # CONFIG_ARM720T is not set
 # CONFIG_ARM920T is not set
 # CONFIG_ARM922T is not set
 # CONFIG_ARM926T is not set
-# CONFIG_ARM10T is not set
 # CONFIG_ARM1136JF_S is not set
-# CONFIG_ARM1176JZ_S is not set
-# CONFIG_ARM1176JZF_S is not set
 # CONFIG_ARM_SA110 is not set
 # CONFIG_ARM_SA1100 is not set
 # CONFIG_ARM_XSCALE is not set
-CONFIG_ARM_IWMMXT=y
-TARGET_SUBARCH=""
-
-#
-# Using ELF file format
-#
-ARCH_ANY_ENDIAN=y
-ARCH_LITTLE_ENDIAN=y
-# ARCH_WANTS_BIG_ENDIAN is not set
-ARCH_WANTS_LITTLE_ENDIAN=y
+# ARCH_LITTLE_ENDIAN is not set
+ARCH_BIG_ENDIAN=y
+# ARCH_HAS_NO_MMU is not set
 ARCH_HAS_MMU=y
-ARCH_USE_MMU=y
 UCLIBC_HAS_FLOATS=y
-# UCLIBC_HAS_FPU is not set
-UCLIBC_HAS_SOFT_FLOAT=y
+UCLIBC_HAS_FPU=y
 DO_C99_MATH=y
-KERNEL_HEADERS="/usr/include"
+# UCLIBC_HAS_FENV is not set
+KERNEL_HEADERS="<path/to/kernel/headers>" 
 HAVE_DOT_CONFIG=y
-
diff --git a/meta/recipes-core/uclibc/uclibc-0.9.30.1/iwmmxt/uClibc.machine b/meta/recipes-core/uclibc/uclibc-git/armv5te/uClibc.machine
similarity index 84%
rename from meta/recipes-core/uclibc/uclibc-0.9.30.1/iwmmxt/uClibc.machine
rename to meta/recipes-core/uclibc/uclibc-git/armv5te/uClibc.machine
index e27931c..eb76f34 100644
--- a/meta/recipes-core/uclibc/uclibc-0.9.30.1/iwmmxt/uClibc.machine
+++ b/meta/recipes-core/uclibc/uclibc-git/armv5te/uClibc.machine
@@ -1,9 +1,11 @@
 #
 # Automatically generated make config: don't edit
-# Sat May 12 23:18:41 2007
+# Version: 0.9.32-git
+# Mon Jul 19 01:34:29 2010
 #
 # TARGET_alpha is not set
 TARGET_arm=y
+# TARGET_avr32 is not set
 # TARGET_bfin is not set
 # TARGET_cris is not set
 # TARGET_e1 is not set
@@ -25,6 +27,7 @@ TARGET_arm=y
 # TARGET_v850 is not set
 # TARGET_vax is not set
 # TARGET_x86_64 is not set
+# TARGET_xtensa is not set
 
 #
 # Target Architecture Features and Options
@@ -34,7 +37,7 @@ FORCE_OPTIONS_FOR_ARCH=y
 # CONFIG_ARM_OABI is not set
 CONFIG_ARM_EABI=y
 USE_BX=y
-# CONFIG_GENERIC_ARM is not set
+CONFIG_GENERIC_ARM=y
 # CONFIG_ARM610 is not set
 # CONFIG_ARM710 is not set
 # CONFIG_ARM7TDMI is not set
@@ -46,10 +49,12 @@ USE_BX=y
 # CONFIG_ARM1136JF_S is not set
 # CONFIG_ARM1176JZ_S is not set
 # CONFIG_ARM1176JZF_S is not set
+# CONFIG_ARM_CORTEX_M3 is not set
+# CONFIG_ARM_CORTEX_M1 is not set
 # CONFIG_ARM_SA110 is not set
 # CONFIG_ARM_SA1100 is not set
 # CONFIG_ARM_XSCALE is not set
-CONFIG_ARM_IWMMXT=y
+# CONFIG_ARM_IWMMXT is not set
 TARGET_SUBARCH=""
 
 #
@@ -65,6 +70,7 @@ UCLIBC_HAS_FLOATS=y
 # UCLIBC_HAS_FPU is not set
 UCLIBC_HAS_SOFT_FLOAT=y
 DO_C99_MATH=y
+# DO_XSI_MATH is not set
+# UCLIBC_HAS_FENV is not set
 KERNEL_HEADERS="/usr/include"
 HAVE_DOT_CONFIG=y
-
diff --git a/meta/recipes-core/uclibc/uclibc-git/detect-bx-availibility.patch b/meta/recipes-core/uclibc/uclibc-git/detect-bx-availibility.patch
new file mode 100644
index 0000000..43d19fc
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/detect-bx-availibility.patch
@@ -0,0 +1,75 @@
+Delivered-To: raj.khem@gmail.com
+Received: by 10.90.86.4 with SMTP id j4cs313307agb;
+        Sat, 8 Jan 2011 16:45:20 -0800 (PST)
+Received: by 10.227.141.78 with SMTP id l14mr16920947wbu.128.1294533919168;
+        Sat, 08 Jan 2011 16:45:19 -0800 (PST)
+Return-Path: <yann.morin.1998@anciens.enib.fr>
+Received: from smtp.smtpout.orange.fr (smtp01.smtpout.orange.fr [80.12.242.123])
+        by mx.google.com with ESMTP id w30si33755908wbd.17.2011.01.08.16.45.18;
+        Sat, 08 Jan 2011 16:45:19 -0800 (PST)
+Received-SPF: neutral (google.com: 80.12.242.123 is neither permitted nor denied by best guess record for domain of yann.morin.1998@anciens.enib.fr) client-ip=80.12.242.123;
+Authentication-Results: mx.google.com; spf=neutral (google.com: 80.12.242.123 is neither permitted nor denied by best guess record for domain of yann.morin.1998@anciens.enib.fr) smtp.mail=yann.morin.1998@anciens.enib.fr
+Received: from roazhon.bzh.lan ([90.32.245.227])
+	by mwinf5d24 with ME
+	id tClC1f0024v5z3u03ClHDo; Sun, 09 Jan 2011 01:45:18 +0100
+From: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
+To: uclibc@uclibc.org
+Cc: Khem Raj <raj.khem@gmail.com>,
+	Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>,
+	Carmelo AMOROSO <carmelo.amoroso@st.com>
+Subject: [PATCH 6/7] ARM: detect BX availibility at build time
+Date: Sun,  9 Jan 2011 01:45:09 +0100
+Message-Id: <1294533910-19305-7-git-send-email-yann.morin.1998@anciens.enib.fr>
+X-Mailer: git-send-email 1.7.1
+In-Reply-To: <1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
+References: <1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
+
+The "use BX" option is now a suggestion that BX be used if available.
+Use a macro to detect if BX is available at build time. If so, and
+the user requested it be used, then use it. Otherwise, error out.
+
+Macro courtesy Khem RAJ:
+  http://lists.uclibc.org/pipermail/uclibc/2009-April/042301.html
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
+Cc: Khem Raj <raj.khem@gmail.com>
+Cc: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+Cc: Carmelo AMOROSO <carmelo.amoroso@st.com>
+---
+ extra/Configs/Config.arm              |    4 +++-
+ libc/sysdeps/linux/arm/bits/arm_asm.h |    9 ++++++++-
+ 2 files changed, 11 insertions(+), 2 deletions(-)
+
+diff --git a/extra/Configs/Config.arm b/extra/Configs/Config.arm
+index 227b90c..9aa9e56 100644
+--- a/extra/Configs/Config.arm
++++ b/extra/Configs/Config.arm
+@@ -33,4 +33,6 @@ config COMPILE_IN_THUMB_MODE
+ config USE_BX
+ 	bool "Use BX in function return"
+ 	help
+-	  Use BX instruction for THUMB aware architectures.
++	  Say 'y' to use BX to return from functions on your thumb-aware
++	  processor. Say 'y' if you need to use interworking. Say 'n' if not.
++	  It is safe to say 'y' even if you're not doing interworking.
+diff --git a/libc/sysdeps/linux/arm/bits/arm_asm.h b/libc/sysdeps/linux/arm/bits/arm_asm.h
+index 1d87df6..921c9a3 100644
+--- a/libc/sysdeps/linux/arm/bits/arm_asm.h
++++ b/libc/sysdeps/linux/arm/bits/arm_asm.h
+@@ -24,5 +24,12 @@
+ #define THUMB1_ONLY 1
+ #endif
+ 
+-#endif /* _ARM_ASM_H */
++#if defined(__USE_BX__)
++# if (   defined (__ARM_ARCH_2__)  || defined (__ARM_ARCH_3__) \
++      || defined (__ARM_ARCH_3M__) || defined (__ARM_ARCH_4__) \
++     )
++#  error Use of BX was requested, but is not available on the target processor.
++# endif /* ARCH level */
++#endif /* __USE_BX__ */
+ 
++#endif /* _ARM_ASM_H */
+-- 
+1.7.1
+
diff --git a/meta/recipes-core/uclibc/uclibc-git/efika/uClibc.machine b/meta/recipes-core/uclibc/uclibc-git/efika/uClibc.machine
new file mode 100644
index 0000000..5ed7b51
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/efika/uClibc.machine
@@ -0,0 +1,45 @@
+#
+# Automatically generated make config: don't edit
+# Wed Dec 20 11:05:48 2006
+#
+# TARGET_alpha is not set
+# TARGET_arm is not set
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+TARGET_powerpc=y
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="powerpc"
+FORCE_OPTIONS_FOR_ARCH=y
+ARCH_BIG_ENDIAN=y
+
+#
+# Using Big Endian
+#
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+UCLIBC_HAS_FPU=y
+DO_C99_MATH=y
+KERNEL_HEADERS="<path/to/kernel/headers>" 
+HAVE_DOT_CONFIG=y
diff --git a/meta/recipes-core/uclibc/uclibc-0.9.30.1/x86/uClibc.machine b/meta/recipes-core/uclibc/uclibc-git/i386/uClibc.machine
similarity index 77%
rename from meta/recipes-core/uclibc/uclibc-0.9.30.1/x86/uClibc.machine
rename to meta/recipes-core/uclibc/uclibc-git/i386/uClibc.machine
index 6cd19e8..3909ccc 100644
--- a/meta/recipes-core/uclibc/uclibc-0.9.30.1/x86/uClibc.machine
+++ b/meta/recipes-core/uclibc/uclibc-git/i386/uClibc.machine
@@ -1,11 +1,8 @@
 #
 # Automatically generated make config: don't edit
-# Version: 0.9.30.1
-# Wed Jul  1 17:04:32 2009
 #
 # TARGET_alpha is not set
 # TARGET_arm is not set
-# TARGET_avr32 is not set
 # TARGET_bfin is not set
 # TARGET_cris is not set
 # TARGET_e1 is not set
@@ -14,7 +11,6 @@
 # TARGET_hppa is not set
 TARGET_i386=y
 # TARGET_i960 is not set
-# TARGET_ia64 is not set
 # TARGET_m68k is not set
 # TARGET_microblaze is not set
 # TARGET_mips is not set
@@ -25,16 +21,16 @@ TARGET_i386=y
 # TARGET_sh64 is not set
 # TARGET_sparc is not set
 # TARGET_v850 is not set
-# TARGET_vax is not set
 # TARGET_x86_64 is not set
-# TARGET_xtensa is not set
 
 #
 # Target Architecture Features and Options
 #
 TARGET_ARCH="i386"
+# ARCH_SUPPORTS_BIG_ENDIAN is not set
+ARCH_SUPPORTS_LITTLE_ENDIAN=y
 FORCE_OPTIONS_FOR_ARCH=y
-CONFIG_GENERIC_386=y
+# CONFIG_GENERIC_386 is not set
 # CONFIG_386 is not set
 # CONFIG_486 is not set
 # CONFIG_586 is not set
@@ -42,7 +38,7 @@ CONFIG_GENERIC_386=y
 # CONFIG_686 is not set
 # CONFIG_PENTIUMII is not set
 # CONFIG_PENTIUMIII is not set
-# CONFIG_PENTIUM4 is not set
+CONFIG_PENTIUM4=y
 # CONFIG_K6 is not set
 # CONFIG_K7 is not set
 # CONFIG_ELAN is not set
@@ -51,22 +47,13 @@ CONFIG_GENERIC_386=y
 # CONFIG_WINCHIP2 is not set
 # CONFIG_CYRIXIII is not set
 # CONFIG_NEHEMIAH is not set
-TARGET_SUBARCH=""
-
-#
-# Using ELF file format
-#
 ARCH_LITTLE_ENDIAN=y
-
-#
-# Using Little Endian
-#
+# ARCH_BIG_ENDIAN is not set
+# ARCH_HAS_NO_MMU is not set
 ARCH_HAS_MMU=y
-ARCH_USE_MMU=y
 UCLIBC_HAS_FLOATS=y
 UCLIBC_HAS_FPU=y
 DO_C99_MATH=y
 # UCLIBC_HAS_FENV is not set
-UCLIBC_HAS_LONG_DOUBLE_MATH=y
-KERNEL_HEADERS="/bla"
+KERNEL_HEADERS="<path/to/kernel/headers>"
 HAVE_DOT_CONFIG=y
diff --git a/meta/recipes-core/uclibc/uclibc-0.9.30.1/qemumips/uClibc.machine b/meta/recipes-core/uclibc/uclibc-git/i486/uClibc.machine
similarity index 89%
copy from meta/recipes-core/uclibc/uclibc-0.9.30.1/qemumips/uClibc.machine
copy to meta/recipes-core/uclibc/uclibc-git/i486/uClibc.machine
index 44fec16..776e00d 100644
--- a/meta/recipes-core/uclibc/uclibc-0.9.30.1/qemumips/uClibc.machine
+++ b/meta/recipes-core/uclibc/uclibc-git/i486/uClibc.machine
@@ -1,6 +1,6 @@
 #
 # Automatically generated make config: don't edit
-# Fri Nov 23 15:49:33 2007
+# Fri Dec 22 23:09:11 2006
 #
 # TARGET_alpha is not set
 # TARGET_arm is not set
@@ -31,9 +31,9 @@ TARGET_i386=y
 #
 TARGET_ARCH="i386"
 FORCE_OPTIONS_FOR_ARCH=y
-CONFIG_GENERIC_386=y
+# CONFIG_GENERIC_386 is not set
 # CONFIG_386 is not set
-# CONFIG_486 is not set
+CONFIG_486=y
 # CONFIG_586 is not set
 # CONFIG_586MMX is not set
 # CONFIG_686 is not set
@@ -48,11 +48,6 @@ CONFIG_GENERIC_386=y
 # CONFIG_WINCHIP2 is not set
 # CONFIG_CYRIXIII is not set
 # CONFIG_NEHEMIAH is not set
-TARGET_SUBARCH=""
-
-#
-# Using ELF file format
-#
 ARCH_LITTLE_ENDIAN=y
 
 #
@@ -63,6 +58,5 @@ ARCH_USE_MMU=y
 UCLIBC_HAS_FLOATS=y
 UCLIBC_HAS_FPU=y
 DO_C99_MATH=y
-KERNEL_HEADERS="/usr/include"
+KERNEL_HEADERS="<path/to/kernel/headers>" 
 HAVE_DOT_CONFIG=y
-
diff --git a/meta/recipes-core/uclibc/uclibc-0.9.30.1/qemux86/uClibc.machine b/meta/recipes-core/uclibc/uclibc-git/i586/uClibc.machine
similarity index 88%
copy from meta/recipes-core/uclibc/uclibc-0.9.30.1/qemux86/uClibc.machine
copy to meta/recipes-core/uclibc/uclibc-git/i586/uClibc.machine
index 44fec16..2e98e5c 100644
--- a/meta/recipes-core/uclibc/uclibc-0.9.30.1/qemux86/uClibc.machine
+++ b/meta/recipes-core/uclibc/uclibc-git/i586/uClibc.machine
@@ -1,6 +1,6 @@
 #
 # Automatically generated make config: don't edit
-# Fri Nov 23 15:49:33 2007
+# Sat Feb 24 08:24:11 2007
 #
 # TARGET_alpha is not set
 # TARGET_arm is not set
@@ -31,14 +31,14 @@ TARGET_i386=y
 #
 TARGET_ARCH="i386"
 FORCE_OPTIONS_FOR_ARCH=y
-CONFIG_GENERIC_386=y
+# CONFIG_GENERIC_386 is not set
 # CONFIG_386 is not set
 # CONFIG_486 is not set
 # CONFIG_586 is not set
 # CONFIG_586MMX is not set
 # CONFIG_686 is not set
 # CONFIG_PENTIUMII is not set
-# CONFIG_PENTIUMIII is not set
+CONFIG_PENTIUMIII=y
 # CONFIG_PENTIUM4 is not set
 # CONFIG_K6 is not set
 # CONFIG_K7 is not set
@@ -48,11 +48,6 @@ CONFIG_GENERIC_386=y
 # CONFIG_WINCHIP2 is not set
 # CONFIG_CYRIXIII is not set
 # CONFIG_NEHEMIAH is not set
-TARGET_SUBARCH=""
-
-#
-# Using ELF file format
-#
 ARCH_LITTLE_ENDIAN=y
 
 #
@@ -63,6 +58,5 @@ ARCH_USE_MMU=y
 UCLIBC_HAS_FLOATS=y
 UCLIBC_HAS_FPU=y
 DO_C99_MATH=y
-KERNEL_HEADERS="/usr/include"
+KERNEL_HEADERS="<path/to/kernel/headers>" 
 HAVE_DOT_CONFIG=y
-
diff --git a/meta/recipes-core/uclibc/uclibc-0.9.30.1/qemumips/uClibc.machine b/meta/recipes-core/uclibc/uclibc-git/i686/uClibc.machine
similarity index 82%
copy from meta/recipes-core/uclibc/uclibc-0.9.30.1/qemumips/uClibc.machine
copy to meta/recipes-core/uclibc/uclibc-git/i686/uClibc.machine
index 44fec16..3909ccc 100644
--- a/meta/recipes-core/uclibc/uclibc-0.9.30.1/qemumips/uClibc.machine
+++ b/meta/recipes-core/uclibc/uclibc-git/i686/uClibc.machine
@@ -1,6 +1,5 @@
 #
 # Automatically generated make config: don't edit
-# Fri Nov 23 15:49:33 2007
 #
 # TARGET_alpha is not set
 # TARGET_arm is not set
@@ -12,7 +11,6 @@
 # TARGET_hppa is not set
 TARGET_i386=y
 # TARGET_i960 is not set
-# TARGET_ia64 is not set
 # TARGET_m68k is not set
 # TARGET_microblaze is not set
 # TARGET_mips is not set
@@ -23,15 +21,16 @@ TARGET_i386=y
 # TARGET_sh64 is not set
 # TARGET_sparc is not set
 # TARGET_v850 is not set
-# TARGET_vax is not set
 # TARGET_x86_64 is not set
 
 #
 # Target Architecture Features and Options
 #
 TARGET_ARCH="i386"
+# ARCH_SUPPORTS_BIG_ENDIAN is not set
+ARCH_SUPPORTS_LITTLE_ENDIAN=y
 FORCE_OPTIONS_FOR_ARCH=y
-CONFIG_GENERIC_386=y
+# CONFIG_GENERIC_386 is not set
 # CONFIG_386 is not set
 # CONFIG_486 is not set
 # CONFIG_586 is not set
@@ -39,7 +38,7 @@ CONFIG_GENERIC_386=y
 # CONFIG_686 is not set
 # CONFIG_PENTIUMII is not set
 # CONFIG_PENTIUMIII is not set
-# CONFIG_PENTIUM4 is not set
+CONFIG_PENTIUM4=y
 # CONFIG_K6 is not set
 # CONFIG_K7 is not set
 # CONFIG_ELAN is not set
@@ -48,21 +47,13 @@ CONFIG_GENERIC_386=y
 # CONFIG_WINCHIP2 is not set
 # CONFIG_CYRIXIII is not set
 # CONFIG_NEHEMIAH is not set
-TARGET_SUBARCH=""
-
-#
-# Using ELF file format
-#
 ARCH_LITTLE_ENDIAN=y
-
-#
-# Using Little Endian
-#
+# ARCH_BIG_ENDIAN is not set
+# ARCH_HAS_NO_MMU is not set
 ARCH_HAS_MMU=y
-ARCH_USE_MMU=y
 UCLIBC_HAS_FLOATS=y
 UCLIBC_HAS_FPU=y
 DO_C99_MATH=y
-KERNEL_HEADERS="/usr/include"
+# UCLIBC_HAS_FENV is not set
+KERNEL_HEADERS="<path/to/kernel/headers>"
 HAVE_DOT_CONFIG=y
-
diff --git a/meta/recipes-core/uclibc/uclibc-git/include-arm-asm.h.patch b/meta/recipes-core/uclibc/uclibc-git/include-arm-asm.h.patch
new file mode 100644
index 0000000..55c312e
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/include-arm-asm.h.patch
@@ -0,0 +1,65 @@
+Delivered-To: raj.khem@gmail.com
+Received: by 10.90.86.4 with SMTP id j4cs313304agb;
+        Sat, 8 Jan 2011 16:45:19 -0800 (PST)
+Received: by 10.227.155.75 with SMTP id r11mr17188266wbw.3.1294533918432;
+        Sat, 08 Jan 2011 16:45:18 -0800 (PST)
+Return-Path: <yann.morin.1998@anciens.enib.fr>
+Received: from smtp.smtpout.orange.fr (smtp01.smtpout.orange.fr [80.12.242.123])
+        by mx.google.com with ESMTP id k3si33753340wbx.29.2011.01.08.16.45.17;
+        Sat, 08 Jan 2011 16:45:18 -0800 (PST)
+Received-SPF: neutral (google.com: 80.12.242.123 is neither permitted nor denied by best guess record for domain of yann.morin.1998@anciens.enib.fr) client-ip=80.12.242.123;
+Authentication-Results: mx.google.com; spf=neutral (google.com: 80.12.242.123 is neither permitted nor denied by best guess record for domain of yann.morin.1998@anciens.enib.fr) smtp.mail=yann.morin.1998@anciens.enib.fr
+Received: from roazhon.bzh.lan ([90.32.245.227])
+	by mwinf5d24 with ME
+	id tClC1f0024v5z3u03ClHDf; Sun, 09 Jan 2011 01:45:17 +0100
+From: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
+To: uclibc@uclibc.org
+Cc: Khem Raj <raj.khem@gmail.com>,
+	Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>,
+	Carmelo AMOROSO <carmelo.amoroso@st.com>
+Subject: [PATCH 5/7] ARM: #include <bits/arm_asm.h> where __USE_BX__ is used
+Date: Sun,  9 Jan 2011 01:45:08 +0100
+Message-Id: <1294533910-19305-6-git-send-email-yann.morin.1998@anciens.enib.fr>
+X-Mailer: git-send-email 1.7.1
+In-Reply-To: <1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
+References: <1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
+
+The check for __USE_BX__ will be available in bits/arm_asm.h,
+so the latter must be included wherever the former is used.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
+Cc: Khem Raj <raj.khem@gmail.com>
+Cc: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+Cc: Carmelo AMOROSO <carmelo.amoroso@st.com>
+---
+ ldso/ldso/arm/dl-startup.h      |    1 +
+ libc/sysdeps/linux/arm/sysdep.h |    1 +
+ 2 files changed, 2 insertions(+), 0 deletions(-)
+
+diff --git a/ldso/ldso/arm/dl-startup.h b/ldso/ldso/arm/dl-startup.h
+index a95389d..2dfdaff 100644
+--- a/ldso/ldso/arm/dl-startup.h
++++ b/ldso/ldso/arm/dl-startup.h
+@@ -7,6 +7,7 @@
+  */
+ 
+ #include <features.h>
++#include <bits/arm_asm.h>
+ 
+ #if !defined(__thumb__)
+ __asm__(
+diff --git a/libc/sysdeps/linux/arm/sysdep.h b/libc/sysdeps/linux/arm/sysdep.h
+index 013f88c..e498695 100644
+--- a/libc/sysdeps/linux/arm/sysdep.h
++++ b/libc/sysdeps/linux/arm/sysdep.h
+@@ -21,6 +21,7 @@
+ #define _LINUX_ARM_SYSDEP_H 1
+ 
+ #include <common/sysdep.h>
++#include <bits/arm_asm.h>
+ 
+ #include <sys/syscall.h>
+ /* For Linux we can use the system call table in the header file
+-- 
+1.7.1
+
diff --git a/meta/recipes-core/uclibc/uclibc-0.9.30.1/ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch b/meta/recipes-core/uclibc/uclibc-git/ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch
similarity index 100%
rename from meta/recipes-core/uclibc/uclibc-0.9.30.1/ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch
rename to meta/recipes-core/uclibc/uclibc-git/ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch
diff --git a/meta/recipes-core/uclibc/uclibc-0.9.30.1/qemux86/uClibc.machine b/meta/recipes-core/uclibc/uclibc-git/mips64/uClibc.machine
similarity index 57%
copy from meta/recipes-core/uclibc/uclibc-0.9.30.1/qemux86/uClibc.machine
copy to meta/recipes-core/uclibc/uclibc-git/mips64/uClibc.machine
index 44fec16..a68c7af 100644
--- a/meta/recipes-core/uclibc/uclibc-0.9.30.1/qemux86/uClibc.machine
+++ b/meta/recipes-core/uclibc/uclibc-git/mips64/uClibc.machine
@@ -1,21 +1,22 @@
 #
 # Automatically generated make config: don't edit
-# Fri Nov 23 15:49:33 2007
+# Wed Jul  9 13:37:36 2008
 #
 # TARGET_alpha is not set
 # TARGET_arm is not set
+# TARGET_avr32 is not set
 # TARGET_bfin is not set
 # TARGET_cris is not set
 # TARGET_e1 is not set
 # TARGET_frv is not set
 # TARGET_h8300 is not set
 # TARGET_hppa is not set
-TARGET_i386=y
+# TARGET_i386 is not set
 # TARGET_i960 is not set
 # TARGET_ia64 is not set
 # TARGET_m68k is not set
 # TARGET_microblaze is not set
-# TARGET_mips is not set
+TARGET_mips=y
 # TARGET_nios is not set
 # TARGET_nios2 is not set
 # TARGET_powerpc is not set
@@ -25,44 +26,38 @@ TARGET_i386=y
 # TARGET_v850 is not set
 # TARGET_vax is not set
 # TARGET_x86_64 is not set
+# TARGET_xtensa is not set
 
 #
 # Target Architecture Features and Options
 #
-TARGET_ARCH="i386"
+TARGET_ARCH="mips"
 FORCE_OPTIONS_FOR_ARCH=y
-CONFIG_GENERIC_386=y
-# CONFIG_386 is not set
-# CONFIG_486 is not set
-# CONFIG_586 is not set
-# CONFIG_586MMX is not set
-# CONFIG_686 is not set
-# CONFIG_PENTIUMII is not set
-# CONFIG_PENTIUMIII is not set
-# CONFIG_PENTIUM4 is not set
-# CONFIG_K6 is not set
-# CONFIG_K7 is not set
-# CONFIG_ELAN is not set
-# CONFIG_CRUSOE is not set
-# CONFIG_WINCHIPC6 is not set
-# CONFIG_WINCHIP2 is not set
-# CONFIG_CYRIXIII is not set
-# CONFIG_NEHEMIAH is not set
+ARCH_CFLAGS="-mno-split-addresses"
+# CONFIG_MIPS_O32_ABI is not set
+# CONFIG_MIPS_N32_ABI is not set
+CONFIG_MIPS_N64_ABI=y
+# CONFIG_MIPS_ISA_1 is not set
+# CONFIG_MIPS_ISA_2 is not set
+# CONFIG_MIPS_ISA_3 is not set
+# CONFIG_MIPS_ISA_4 is not set
+# CONFIG_MIPS_ISA_MIPS32 is not set
+CONFIG_MIPS_ISA_MIPS64=y
 TARGET_SUBARCH=""
 
 #
 # Using ELF file format
 #
-ARCH_LITTLE_ENDIAN=y
-
-#
-# Using Little Endian
-#
+ARCH_ANY_ENDIAN=y
+# ARCH_BIG_ENDIAN is not set
+ARCH_WANTS_BIG_ENDIAN=y
+# ARCH_WANTS_LITTLE_ENDIAN=y
 ARCH_HAS_MMU=y
 ARCH_USE_MMU=y
 UCLIBC_HAS_FLOATS=y
 UCLIBC_HAS_FPU=y
-DO_C99_MATH=y
+# DO_C99_MATH is not set
+# UCLIBC_HAS_FENV is not set
 KERNEL_HEADERS="/usr/include"
 HAVE_DOT_CONFIG=y
 
diff --git a/meta/recipes-core/uclibc/uclibc-0.9.30.1/armv4t/uClibc.machine b/meta/recipes-core/uclibc/uclibc-git/mipsel/uClibc.machine
similarity index 56%
rename from meta/recipes-core/uclibc/uclibc-0.9.30.1/armv4t/uClibc.machine
rename to meta/recipes-core/uclibc/uclibc-git/mipsel/uClibc.machine
index 898b73a..e148451 100644
--- a/meta/recipes-core/uclibc/uclibc-0.9.30.1/armv4t/uClibc.machine
+++ b/meta/recipes-core/uclibc/uclibc-git/mipsel/uClibc.machine
@@ -1,9 +1,10 @@
 #
 # Automatically generated make config: don't edit
-# Mon May 14 10:23:14 2007
+# Wed Jul  9 13:37:36 2008
 #
 # TARGET_alpha is not set
-TARGET_arm=y
+# TARGET_arm is not set
+# TARGET_avr32 is not set
 # TARGET_bfin is not set
 # TARGET_cris is not set
 # TARGET_e1 is not set
@@ -15,7 +16,7 @@ TARGET_arm=y
 # TARGET_ia64 is not set
 # TARGET_m68k is not set
 # TARGET_microblaze is not set
-# TARGET_mips is not set
+TARGET_mips=y
 # TARGET_nios is not set
 # TARGET_nios2 is not set
 # TARGET_powerpc is not set
@@ -25,45 +26,38 @@ TARGET_arm=y
 # TARGET_v850 is not set
 # TARGET_vax is not set
 # TARGET_x86_64 is not set
+# TARGET_xtensa is not set
 
 #
 # Target Architecture Features and Options
 #
-TARGET_ARCH="arm"
+TARGET_ARCH="mips"
 FORCE_OPTIONS_FOR_ARCH=y
-# CONFIG_ARM_OABI is not set
-CONFIG_ARM_EABI=y
-USE_BX=y
-# CONFIG_GENERIC_ARM is not set
-# CONFIG_ARM610 is not set
-# CONFIG_ARM710 is not set
-# CONFIG_ARM7TDMI is not set
-# CONFIG_ARM720T is not set
-CONFIG_ARM920T=y
-# CONFIG_ARM922T is not set
-# CONFIG_ARM926T is not set
-# CONFIG_ARM10T is not set
-# CONFIG_ARM1136JF_S is not set
-# CONFIG_ARM1176JZ_S is not set
-# CONFIG_ARM1176JZF_S is not set
-# CONFIG_ARM_SA110 is not set
-# CONFIG_ARM_SA1100 is not set
-# CONFIG_ARM_XSCALE is not set
-# CONFIG_ARM_IWMMXT is not set
+ARCH_CFLAGS="-mno-split-addresses"
+CONFIG_MIPS_O32_ABI=y
+# CONFIG_MIPS_N32_ABI is not set
+# CONFIG_MIPS_N64_ABI is not set
+# CONFIG_MIPS_ISA_1 is not set
+# CONFIG_MIPS_ISA_2 is not set
+# CONFIG_MIPS_ISA_3 is not set
+# CONFIG_MIPS_ISA_4 is not set
+CONFIG_MIPS_ISA_MIPS32=y
+# CONFIG_MIPS_ISA_MIPS64 is not set
 TARGET_SUBARCH=""
 
 #
 # Using ELF file format
 #
 ARCH_ANY_ENDIAN=y
-ARCH_LITTLE_ENDIAN=y
+# ARCH_BIG_ENDIAN is not set
 # ARCH_WANTS_BIG_ENDIAN is not set
 ARCH_WANTS_LITTLE_ENDIAN=y
 ARCH_HAS_MMU=y
 ARCH_USE_MMU=y
 UCLIBC_HAS_FLOATS=y
-# UCLIBC_HAS_FPU is not set
-UCLIBC_HAS_SOFT_FLOAT=y
+UCLIBC_HAS_FPU=y
+# DO_C99_MATH is not set
+# UCLIBC_HAS_FENV is not set
 KERNEL_HEADERS="/usr/include"
 HAVE_DOT_CONFIG=y
 
diff --git a/meta/recipes-core/uclibc/uclibc-0.9.30.1/armeb/uClibc.machine b/meta/recipes-core/uclibc/uclibc-git/nslu2be/uClibc.machine
similarity index 92%
rename from meta/recipes-core/uclibc/uclibc-0.9.30.1/armeb/uClibc.machine
rename to meta/recipes-core/uclibc/uclibc-git/nslu2be/uClibc.machine
index 2d9f63e..f5aa134 100644
--- a/meta/recipes-core/uclibc/uclibc-0.9.30.1/armeb/uClibc.machine
+++ b/meta/recipes-core/uclibc/uclibc-git/nslu2be/uClibc.machine
@@ -49,6 +49,8 @@ USE_BX=y
 # CONFIG_ARM_SA110 is not set
 # CONFIG_ARM_SA1100 is not set
 CONFIG_ARM_XSCALE=y
+# CONFIG_ARM_CORTEX_M3 is not set
+# CONFIG_ARM_CORTEX_M1 is not set
 # CONFIG_ARM_IWMMXT is not set
 TARGET_SUBARCH=""
 
@@ -65,6 +67,7 @@ UCLIBC_HAS_FLOATS=y
 # UCLIBC_HAS_FPU is not set
 UCLIBC_HAS_SOFT_FLOAT=y
 DO_C99_MATH=y
+# DO_XSI_MATH is not set
+# UCLIBC_HAS_FENV is not set
 KERNEL_HEADERS="/usr/include"
 HAVE_DOT_CONFIG=y
-
diff --git a/meta/recipes-core/uclibc/uclibc-git/powerpc/uClibc.machine b/meta/recipes-core/uclibc/uclibc-git/powerpc/uClibc.machine
new file mode 100644
index 0000000..d49bf6a
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/powerpc/uClibc.machine
@@ -0,0 +1,46 @@
+#
+# Automatically generated make config: don't edit
+# Tue Feb  6 19:17:06 2007
+#
+# TARGET_alpha is not set
+# TARGET_arm is not set
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+TARGET_powerpc=y
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="powerpc"
+FORCE_OPTIONS_FOR_ARCH=y
+ARCH_BIG_ENDIAN=y
+
+#
+# Using Big Endian
+#
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+UCLIBC_HAS_FPU=y
+DO_C99_MATH=y
+KERNEL_HEADERS="/usr/include"
+HAVE_DOT_CONFIG=y
+
diff --git a/meta/recipes-core/uclibc/uclibc-git/powerpc_copysignl.patch b/meta/recipes-core/uclibc/uclibc-git/powerpc_copysignl.patch
new file mode 100644
index 0000000..339ce7f
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/powerpc_copysignl.patch
@@ -0,0 +1,107 @@
+Index: git/libc/sysdeps/linux/powerpc/Makefile.arch
+===================================================================
+--- git.orig/libc/sysdeps/linux/powerpc/Makefile.arch
++++ git/libc/sysdeps/linux/powerpc/Makefile.arch
+@@ -5,7 +5,7 @@
+ # Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
+ #
+ 
+-CSRC := __syscall_error.c pread_write.c ioctl.c
++CSRC := __syscall_error.c pread_write.c ioctl.c copysignl.c
+ 
+ ifeq ($(UCLIBC_HAS_ADVANCED_REALTIME),y)
+ CSRC += posix_fadvise.c posix_fadvise64.c
+Index: git/libc/sysdeps/linux/powerpc/copysignl.c
+===================================================================
+--- /dev/null
++++ git/libc/sysdeps/linux/powerpc/copysignl.c
+@@ -0,0 +1,89 @@
++/* s_copysignl.c -- long double version of s_copysign.c.
++ * Conversion to long double by Ulrich Drepper,
++ * Cygnus Support, drepper@cygnus.com.
++ */
++
++/*
++ * ====================================================
++ * Copyright (C) 1993 by Sun Microsystems, Inc. All rights reserved.
++ *
++ * Developed at SunPro, a Sun Microsystems, Inc. business.
++ * Permission to use, copy, modify, and distribute this
++ * software is freely granted, provided that this notice
++ * is preserved.
++ * ====================================================
++ */
++
++/*
++ * copysignl(long double x, long double y)
++ * copysignl(x,y) returns a value with the magnitude of x and
++ * with the sign bit of y.
++ */
++
++#include <endian.h>
++#include <stdint.h>
++
++#if __FLOAT_WORD_ORDER == BIG_ENDIAN
++
++typedef union
++{
++  long double value;
++  struct
++  {
++    int sign_exponent:16;
++    unsigned int empty:16;
++    uint32_t msw;
++    uint32_t lsw;
++  } parts;
++} ieee_long_double_shape_type;
++
++#endif
++
++#if __FLOAT_WORD_ORDER == LITTLE_ENDIAN
++
++typedef union
++{
++  long double value;
++  struct
++  {
++    uint32_t lsw;
++    uint32_t msw;
++    int sign_exponent:16;
++    unsigned int empty:16;
++  } parts;
++} ieee_long_double_shape_type;
++
++#endif
++
++/* Get int from the exponent of a long double.  */
++
++#define GET_LDOUBLE_EXP(exp,d)					\
++do {								\
++  ieee_long_double_shape_type ge_u;				\
++  ge_u.value = (d);						\
++  (exp) = ge_u.parts.sign_exponent;				\
++} while (0)
++
++/* Set exponent of a long double from an int.  */
++
++#define SET_LDOUBLE_EXP(d,exp)					\
++do {								\
++  ieee_long_double_shape_type se_u;				\
++  se_u.value = (d);						\
++  se_u.parts.sign_exponent = (exp);				\
++  (d) = se_u.value;						\
++} while (0)
++
++long double copysignl(long double x, long double y);
++libc_hidden_proto(copysignl);
++
++long double copysignl(long double x, long double y)
++{
++	uint32_t es1,es2;
++	GET_LDOUBLE_EXP(es1,x);
++	GET_LDOUBLE_EXP(es2,y);
++	SET_LDOUBLE_EXP(x,(es1&0x7fff)|(es2&0x8000));
++        return x;
++}
++
++libc_hidden_def(copysignl);
diff --git a/meta/recipes-core/uclibc/uclibc-0.9.30.1/qemuarm/uClibc.machine b/meta/recipes-core/uclibc/uclibc-git/qemuarm/uClibc.machine
similarity index 85%
rename from meta/recipes-core/uclibc/uclibc-0.9.30.1/qemuarm/uClibc.machine
rename to meta/recipes-core/uclibc/uclibc-git/qemuarm/uClibc.machine
index fafdd75..7154278 100644
--- a/meta/recipes-core/uclibc/uclibc-0.9.30.1/qemuarm/uClibc.machine
+++ b/meta/recipes-core/uclibc/uclibc-git/qemuarm/uClibc.machine
@@ -1,9 +1,11 @@
 #
 # Automatically generated make config: don't edit
-# Sun May 13 11:16:02 2007
+# Version: 0.9.32-git
+# Mon Jul 19 01:34:29 2010
 #
 # TARGET_alpha is not set
 TARGET_arm=y
+# TARGET_avr32 is not set
 # TARGET_bfin is not set
 # TARGET_cris is not set
 # TARGET_e1 is not set
@@ -25,6 +27,7 @@ TARGET_arm=y
 # TARGET_v850 is not set
 # TARGET_vax is not set
 # TARGET_x86_64 is not set
+# TARGET_xtensa is not set
 
 #
 # Target Architecture Features and Options
@@ -46,6 +49,8 @@ CONFIG_ARM926T=y
 # CONFIG_ARM1136JF_S is not set
 # CONFIG_ARM1176JZ_S is not set
 # CONFIG_ARM1176JZF_S is not set
+# CONFIG_ARM_CORTEX_M3 is not set
+# CONFIG_ARM_CORTEX_M1 is not set
 # CONFIG_ARM_SA110 is not set
 # CONFIG_ARM_SA1100 is not set
 # CONFIG_ARM_XSCALE is not set
@@ -65,6 +70,7 @@ UCLIBC_HAS_FLOATS=y
 # UCLIBC_HAS_FPU is not set
 UCLIBC_HAS_SOFT_FLOAT=y
 DO_C99_MATH=y
-KERNEL_HEADERS="/bad/path/to/include"
+# DO_XSI_MATH is not set
+# UCLIBC_HAS_FENV is not set
+KERNEL_HEADERS="/usr/include"
 HAVE_DOT_CONFIG=y
-
diff --git a/meta/recipes-core/uclibc/uclibc-0.9.30.1/qemux86/uClibc.machine b/meta/recipes-core/uclibc/uclibc-git/qemumips/uClibc.machine
similarity index 57%
rename from meta/recipes-core/uclibc/uclibc-0.9.30.1/qemux86/uClibc.machine
rename to meta/recipes-core/uclibc/uclibc-git/qemumips/uClibc.machine
index 44fec16..1cf1add 100644
--- a/meta/recipes-core/uclibc/uclibc-0.9.30.1/qemux86/uClibc.machine
+++ b/meta/recipes-core/uclibc/uclibc-git/qemumips/uClibc.machine
@@ -1,21 +1,22 @@
 #
 # Automatically generated make config: don't edit
-# Fri Nov 23 15:49:33 2007
+# Wed Jul  9 13:37:36 2008
 #
 # TARGET_alpha is not set
 # TARGET_arm is not set
+# TARGET_avr32 is not set
 # TARGET_bfin is not set
 # TARGET_cris is not set
 # TARGET_e1 is not set
 # TARGET_frv is not set
 # TARGET_h8300 is not set
 # TARGET_hppa is not set
-TARGET_i386=y
+# TARGET_i386 is not set
 # TARGET_i960 is not set
 # TARGET_ia64 is not set
 # TARGET_m68k is not set
 # TARGET_microblaze is not set
-# TARGET_mips is not set
+TARGET_mips=y
 # TARGET_nios is not set
 # TARGET_nios2 is not set
 # TARGET_powerpc is not set
@@ -25,44 +26,38 @@ TARGET_i386=y
 # TARGET_v850 is not set
 # TARGET_vax is not set
 # TARGET_x86_64 is not set
+# TARGET_xtensa is not set
 
 #
 # Target Architecture Features and Options
 #
-TARGET_ARCH="i386"
+TARGET_ARCH="mips"
 FORCE_OPTIONS_FOR_ARCH=y
-CONFIG_GENERIC_386=y
-# CONFIG_386 is not set
-# CONFIG_486 is not set
-# CONFIG_586 is not set
-# CONFIG_586MMX is not set
-# CONFIG_686 is not set
-# CONFIG_PENTIUMII is not set
-# CONFIG_PENTIUMIII is not set
-# CONFIG_PENTIUM4 is not set
-# CONFIG_K6 is not set
-# CONFIG_K7 is not set
-# CONFIG_ELAN is not set
-# CONFIG_CRUSOE is not set
-# CONFIG_WINCHIPC6 is not set
-# CONFIG_WINCHIP2 is not set
-# CONFIG_CYRIXIII is not set
-# CONFIG_NEHEMIAH is not set
+ARCH_CFLAGS="-mno-split-addresses"
+CONFIG_MIPS_O32_ABI=y
+# CONFIG_MIPS_N32_ABI is not set
+# CONFIG_MIPS_N64_ABI is not set
+# CONFIG_MIPS_ISA_1 is not set
+# CONFIG_MIPS_ISA_2 is not set
+# CONFIG_MIPS_ISA_3 is not set
+# CONFIG_MIPS_ISA_4 is not set
+CONFIG_MIPS_ISA_MIPS32=y
+# CONFIG_MIPS_ISA_MIPS64 is not set
 TARGET_SUBARCH=""
 
 #
 # Using ELF file format
 #
-ARCH_LITTLE_ENDIAN=y
-
-#
-# Using Little Endian
-#
+ARCH_ANY_ENDIAN=y
+# ARCH_BIG_ENDIAN is not set
+ARCH_WANTS_BIG_ENDIAN=y
+# ARCH_WANTS_LITTLE_ENDIAN=y
 ARCH_HAS_MMU=y
 ARCH_USE_MMU=y
 UCLIBC_HAS_FLOATS=y
 UCLIBC_HAS_FPU=y
-DO_C99_MATH=y
+# DO_C99_MATH is not set
+# UCLIBC_HAS_FENV is not set
 KERNEL_HEADERS="/usr/include"
 HAVE_DOT_CONFIG=y
 
diff --git a/meta/recipes-core/uclibc/uclibc-0.9.30.1/qemumips/uClibc.machine b/meta/recipes-core/uclibc/uclibc-git/qemux86/uClibc.machine
similarity index 82%
copy from meta/recipes-core/uclibc/uclibc-0.9.30.1/qemumips/uClibc.machine
copy to meta/recipes-core/uclibc/uclibc-git/qemux86/uClibc.machine
index 44fec16..3909ccc 100644
--- a/meta/recipes-core/uclibc/uclibc-0.9.30.1/qemumips/uClibc.machine
+++ b/meta/recipes-core/uclibc/uclibc-git/qemux86/uClibc.machine
@@ -1,6 +1,5 @@
 #
 # Automatically generated make config: don't edit
-# Fri Nov 23 15:49:33 2007
 #
 # TARGET_alpha is not set
 # TARGET_arm is not set
@@ -12,7 +11,6 @@
 # TARGET_hppa is not set
 TARGET_i386=y
 # TARGET_i960 is not set
-# TARGET_ia64 is not set
 # TARGET_m68k is not set
 # TARGET_microblaze is not set
 # TARGET_mips is not set
@@ -23,15 +21,16 @@ TARGET_i386=y
 # TARGET_sh64 is not set
 # TARGET_sparc is not set
 # TARGET_v850 is not set
-# TARGET_vax is not set
 # TARGET_x86_64 is not set
 
 #
 # Target Architecture Features and Options
 #
 TARGET_ARCH="i386"
+# ARCH_SUPPORTS_BIG_ENDIAN is not set
+ARCH_SUPPORTS_LITTLE_ENDIAN=y
 FORCE_OPTIONS_FOR_ARCH=y
-CONFIG_GENERIC_386=y
+# CONFIG_GENERIC_386 is not set
 # CONFIG_386 is not set
 # CONFIG_486 is not set
 # CONFIG_586 is not set
@@ -39,7 +38,7 @@ CONFIG_GENERIC_386=y
 # CONFIG_686 is not set
 # CONFIG_PENTIUMII is not set
 # CONFIG_PENTIUMIII is not set
-# CONFIG_PENTIUM4 is not set
+CONFIG_PENTIUM4=y
 # CONFIG_K6 is not set
 # CONFIG_K7 is not set
 # CONFIG_ELAN is not set
@@ -48,21 +47,13 @@ CONFIG_GENERIC_386=y
 # CONFIG_WINCHIP2 is not set
 # CONFIG_CYRIXIII is not set
 # CONFIG_NEHEMIAH is not set
-TARGET_SUBARCH=""
-
-#
-# Using ELF file format
-#
 ARCH_LITTLE_ENDIAN=y
-
-#
-# Using Little Endian
-#
+# ARCH_BIG_ENDIAN is not set
+# ARCH_HAS_NO_MMU is not set
 ARCH_HAS_MMU=y
-ARCH_USE_MMU=y
 UCLIBC_HAS_FLOATS=y
 UCLIBC_HAS_FPU=y
 DO_C99_MATH=y
-KERNEL_HEADERS="/usr/include"
+# UCLIBC_HAS_FENV is not set
+KERNEL_HEADERS="<path/to/kernel/headers>"
 HAVE_DOT_CONFIG=y
-
diff --git a/meta/recipes-core/uclibc/uclibc-git/remove-eabi-oabi-selection.patch b/meta/recipes-core/uclibc/uclibc-git/remove-eabi-oabi-selection.patch
new file mode 100644
index 0000000..8f3464e
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/remove-eabi-oabi-selection.patch
@@ -0,0 +1,91 @@
+Delivered-To: raj.khem@gmail.com
+Received: by 10.90.86.4 with SMTP id j4cs313309agb;
+        Sat, 8 Jan 2011 16:45:20 -0800 (PST)
+Received: by 10.216.173.7 with SMTP id u7mr612034wel.50.1294533919433;
+        Sat, 08 Jan 2011 16:45:19 -0800 (PST)
+Return-Path: <yann.morin.1998@anciens.enib.fr>
+Received: from smtp.smtpout.orange.fr (smtp01.smtpout.orange.fr [80.12.242.123])
+        by mx.google.com with ESMTP id e10si33752027wer.68.2011.01.08.16.45.19;
+        Sat, 08 Jan 2011 16:45:19 -0800 (PST)
+Received-SPF: neutral (google.com: 80.12.242.123 is neither permitted nor denied by best guess record for domain of yann.morin.1998@anciens.enib.fr) client-ip=80.12.242.123;
+Authentication-Results: mx.google.com; spf=neutral (google.com: 80.12.242.123 is neither permitted nor denied by best guess record for domain of yann.morin.1998@anciens.enib.fr) smtp.mail=yann.morin.1998@anciens.enib.fr
+Received: from roazhon.bzh.lan ([90.32.245.227])
+	by mwinf5d24 with ME
+	id tClC1f0024v5z3u03ClJDu; Sun, 09 Jan 2011 01:45:18 +0100
+From: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
+To: uclibc@uclibc.org
+Cc: Khem Raj <raj.khem@gmail.com>,
+	Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>,
+	Carmelo AMOROSO <carmelo.amoroso@st.com>
+Subject: [PATCH 7/7] ARM: remove EABI/OABI selection
+Date: Sun,  9 Jan 2011 01:45:10 +0100
+Message-Id: <1294533910-19305-8-git-send-email-yann.morin.1998@anciens.enib.fr>
+X-Mailer: git-send-email 1.7.1
+In-Reply-To: <1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
+References: <1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
+
+Rely on the compiler to be properly setup for the default ABI.
+
+When installing-headers, there are two cases:
+- NPTL: no issue, a cross-compiler is already expected
+- LinuxThreads: no issue, EABI/OABI has no impact on installed headers.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
+Cc: Khem Raj <raj.khem@gmail.com>
+Cc: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+Cc: Carmelo AMOROSO <carmelo.amoroso@st.com>
+---
+ extra/Configs/Config.arm               |   11 -----------
+ libc/sysdeps/linux/arm/Makefile.arch   |    9 +++++++--
+ libc/sysdeps/linux/arm/bits/huge_val.h |    4 ++--
+ 3 files changed, 9 insertions(+), 15 deletions(-)
+
+Index: git/libc/sysdeps/linux/arm/Makefile.arch
+===================================================================
+--- git.orig/libc/sysdeps/linux/arm/Makefile.arch
++++ git/libc/sysdeps/linux/arm/Makefile.arch
+@@ -24,7 +24,12 @@ ifeq ($(UCLIBC_HAS_ADVANCED_REALTIME),y)
+ CSRC += posix_fadvise.c posix_fadvise64.c
+ endif
+ 
+-ifeq ($(CONFIG_ARM_EABI),y)
++# Is our compiler set up for EABI ?
++IS_EABI:=$(shell $(CC) $(CFLAGS) -x c - -E -dM </dev/null 2>/dev/null \
++                 |sed -r -e '/^\#[[:space:]]*define[[:space:]]+__ARM_EABI__([[:space:]]+1)?$$/!d; s/.+/y/;' \
++          )
++
++ifeq ($(IS_EABI),y)
+ CSRC += aeabi_assert.c aeabi_atexit.c aeabi_errno_addr.c \
+ 	aeabi_localeconv.c aeabi_memclr.c aeabi_memcpy.c \
+ 	aeabi_memmove.c aeabi_memset.c find_exidx.c
+@@ -37,7 +42,7 @@ else
+ CSRC += syscall.c
+ endif
+ 
+-ifeq ($(CONFIG_ARM_EABI),y)
++ifeq ($(IS_EABI),y)
+ libc-static-y += $(ARCH_OUT)/aeabi_lcsts.o $(ARCH_OUT)/aeabi_math.o \
+ 	$(ARCH_OUT)/aeabi_sighandlers.o
+ libc-nonshared-y += $(ARCH_OUT)/aeabi_lcsts.os $(ARCH_OUT)/aeabi_math.os \
+Index: git/libc/sysdeps/linux/arm/bits/huge_val.h
+===================================================================
+--- git.orig/libc/sysdeps/linux/arm/bits/huge_val.h
++++ git/libc/sysdeps/linux/arm/bits/huge_val.h
+@@ -32,7 +32,7 @@
+ # define HUGE_VAL (__extension__ 0x1.0p2047)
+ #elif defined __GNUC__
+ 
+-#ifndef __CONFIG_ARM_EABI__
++#ifndef __ARM_EABI__
+ # define HUGE_VAL \
+   (__extension__							      \
+    ((union { unsigned __l __attribute__((__mode__(__DI__))); double __d; })   \
+@@ -50,7 +50,7 @@
+ 
+ typedef union { unsigned char __c[8]; double __d; } __huge_val_t;
+ 
+-#ifndef __CONFIG_ARM_EABI__
++#ifndef __ARM_EABI__
+ # if __BYTE_ORDER == __BIG_ENDIAN
+ #  define __HUGE_VAL_bytes	{ 0, 0, 0, 0, 0x7f, 0xf0, 0, 0 }
+ # endif
diff --git a/meta/recipes-core/uclibc/uclibc-git/remove-sub-arch-variants.patch b/meta/recipes-core/uclibc/uclibc-git/remove-sub-arch-variants.patch
new file mode 100644
index 0000000..920a669
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/remove-sub-arch-variants.patch
@@ -0,0 +1,215 @@
+Delivered-To: raj.khem@gmail.com
+Received: by 10.90.86.4 with SMTP id j4cs313303agb;
+        Sat, 8 Jan 2011 16:45:18 -0800 (PST)
+Received: by 10.227.98.158 with SMTP id q30mr1255804wbn.151.1294533917314;
+        Sat, 08 Jan 2011 16:45:17 -0800 (PST)
+Return-Path: <yann.morin.1998@anciens.enib.fr>
+Received: from smtp.smtpout.orange.fr (smtp01.smtpout.orange.fr [80.12.242.123])
+        by mx.google.com with ESMTP id r3si33749838wbr.54.2011.01.08.16.45.16;
+        Sat, 08 Jan 2011 16:45:17 -0800 (PST)
+Received-SPF: neutral (google.com: 80.12.242.123 is neither permitted nor denied by best guess record for domain of yann.morin.1998@anciens.enib.fr) client-ip=80.12.242.123;
+Authentication-Results: mx.google.com; spf=neutral (google.com: 80.12.242.123 is neither permitted nor denied by best guess record for domain of yann.morin.1998@anciens.enib.fr) smtp.mail=yann.morin.1998@anciens.enib.fr
+Received: from roazhon.bzh.lan ([90.32.245.227])
+	by mwinf5d24 with ME
+	id tClC1f0024v5z3u03ClGDS; Sun, 09 Jan 2011 01:45:16 +0100
+From: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
+To: uclibc@uclibc.org
+Cc: Khem Raj <raj.khem@gmail.com>,
+	Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>,
+	Carmelo AMOROSO <carmelo.amoroso@st.com>
+Subject: [PATCH 3/7] ARM: remove sub-arch/variants selection from menuconfig
+Date: Sun,  9 Jan 2011 01:45:06 +0100
+Message-Id: <1294533910-19305-4-git-send-email-yann.morin.1998@anciens.enib.fr>
+X-Mailer: git-send-email 1.7.1
+In-Reply-To: <1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
+References: <1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
+
+Rely on the compiler to be correctly set up to generate
+appropriate code for the target variant.
+
+This exposes the Thumb option, as it is no longer auto-selected.
+The "Use BX" no longer depends on supported CPU to be selected,
+so it now defaults to 'n' as it shall work by default on CPUs
+that do not have BX.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
+Cc: Khem Raj <raj.khem@gmail.com>
+Cc: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+Cc: Carmelo AMOROSO <carmelo.amoroso@st.com>
+---
+ Rules.mak                |   19 -------
+ extra/Configs/Config.arm |  125 ++--------------------------------------------
+ 2 files changed, 5 insertions(+), 139 deletions(-)
+
+diff --git a/Rules.mak b/Rules.mak
+index 2a16908..09741a6 100644
+--- a/Rules.mak
++++ b/Rules.mak
+@@ -332,25 +332,6 @@ ifeq ($(TARGET_ARCH),arm)
+ 	OPTIMIZATION+=-fstrict-aliasing
+ 	CPU_CFLAGS-$(ARCH_LITTLE_ENDIAN)+=-mlittle-endian
+ 	CPU_CFLAGS-$(ARCH_BIG_ENDIAN)+=-mbig-endian
+-	CPU_CFLAGS-$(CONFIG_GENERIC_ARM)+=
+-	CPU_CFLAGS-$(CONFIG_ARM610)+=-mtune=arm610 -march=armv3
+-	CPU_CFLAGS-$(CONFIG_ARM710)+=-mtune=arm710 -march=armv3
+-	CPU_CFLAGS-$(CONFIG_ARM7TDMI)+=-mtune=arm7tdmi -march=armv4t
+-	CPU_CFLAGS-$(CONFIG_ARM720T)+=-mtune=arm7tdmi -march=armv4t
+-	CPU_CFLAGS-$(CONFIG_ARM920T)+=-mtune=arm9tdmi -march=armv4t
+-	CPU_CFLAGS-$(CONFIG_ARM922T)+=-mtune=arm9tdmi -march=armv4t
+-	CPU_CFLAGS-$(CONFIG_ARM926T)+=-mtune=arm9e -march=armv5te
+-	CPU_CFLAGS-$(CONFIG_ARM10T)+=-mtune=arm10tdmi -march=armv5t
+-	CPU_CFLAGS-$(CONFIG_ARM1136JF_S)+=-mtune=arm1136jf-s -march=armv6
+-	CPU_CFLAGS-$(CONFIG_ARM1176JZ_S)+=-mtune=arm1176jz-s -march=armv6
+-	CPU_CFLAGS-$(CONFIG_ARM1176JZF_S)+=-mtune=arm1176jzf-s -march=armv6
+-	CPU_CFLAGS-$(CONFIG_ARM_SA110)+=-mtune=strongarm110 -march=armv4
+-	CPU_CFLAGS-$(CONFIG_ARM_SA1100)+=-mtune=strongarm1100 -march=armv4
+-	CPU_CFLAGS-$(CONFIG_ARM_XSCALE)+=$(call check_gcc,-mtune=xscale,-mtune=strongarm110)
+-	CPU_CFLAGS-$(CONFIG_ARM_XSCALE)+=-march=armv5te -Wa,-mcpu=xscale
+-	CPU_CFLAGS-$(CONFIG_ARM_IWMMXT)+=-march=iwmmxt -Wa,-mcpu=iwmmxt -mabi=iwmmxt
+-	CPU_CFLAGS-$(CONFIG_ARM_CORTEX_M3)+=-mcpu=cortex-m3
+-	CPU_CFLAGS-$(CONFIG_ARM_CORTEX_M1)+=-mcpu=cortex-m1
+ 	CPU_CFLAGS-$(COMPILE_IN_THUMB_MODE)+=-mthumb
+ endif
+ 
+diff --git a/extra/Configs/Config.arm b/extra/Configs/Config.arm
+index c9c40d4..6c75a00 100644
+--- a/extra/Configs/Config.arm
++++ b/extra/Configs/Config.arm
+@@ -30,129 +30,14 @@ config CONFIG_ARM_EABI
+ 
+ endchoice
+ 
+-choice
+-	prompt "Target Processor Type"
+-	default CONFIG_GENERIC_ARM
+-	help
+-	  This is the processor type of your CPU. This information is used for
+-	  optimizing purposes.  To build a library that will run on all ARMCPU
+-	  types (albeit not optimally fast), you can specify "Generic Arm" here.
+-	  If you pick anything other than "Generic Arm", there is no guarantee 
+-	  that uClibc will even run on anything other than the selected
+-	  processor type.
+-
+-	  Here are the settings recommended for greatest speed:
+-	  - "Generic Arm" select this if your compiler is already setup to
+-	    optimize things properly, or if you want to run on pretty much
+-	    everything, or you just don't much care.
+-	  - For anything else, pick the ARM core type that best matches the
+-	    cpu you will be using on your device.
+-
+-	  If you don't know what to do, choose "Generic Arm".
+-
+-config CONFIG_GENERIC_ARM
+-	bool "Generic Arm"
+-
+-config CONFIG_ARM610
+-	bool "Arm 610"
+-	select ARCH_HAS_MMU
+-
+-config CONFIG_ARM710
+-	bool "Arm 710"
+-	select ARCH_HAS_MMU
+-
+-config CONFIG_ARM7TDMI
+-	bool "Arm 7TDMI"
+-	select ARCH_HAS_NO_MMU
+-	select HAS_THUMB
+-
+-config CONFIG_ARM720T
+-	bool "Arm 720T"
+-	select ARCH_HAS_MMU
+-	select HAS_THUMB
+-
+-config CONFIG_ARM920T
+-	bool "Arm 920T"
+-	select ARCH_HAS_MMU
+-	select HAS_THUMB
+-
+-config CONFIG_ARM922T
+-	bool "Arm 922T"
+-	select ARCH_HAS_MMU
+-	select HAS_THUMB
+-
+-config CONFIG_ARM926T
+-	bool "Arm 926T"
+-	select ARCH_HAS_MMU
+-	select HAS_THUMB
+-
+-config CONFIG_ARM10T
+-	bool "Arm 10T"
+-	select ARCH_HAS_MMU
+-	select HAS_THUMB
+-
+-config CONFIG_ARM1136JF_S
+-	bool "Arm 1136JF-S"
+-	select ARCH_HAS_MMU
+-	select HAS_THUMB
+-
+-config CONFIG_ARM1176JZ_S
+-	bool "Arm 1176JZ-S"
+-	select ARCH_HAS_MMU
+-	select HAS_THUMB
+-
+-config CONFIG_ARM1176JZF_S
+-	bool "Arm 1176JZF-S"
+-	select ARCH_HAS_MMU
+-	select HAS_THUMB
+-
+-config CONFIG_ARM_CORTEX_M3
+-	bool "Arm Cortex-M3"
+-	select ARCH_HAS_NO_MMU
+-	select FORCE_THUMB
+-
+-config CONFIG_ARM_CORTEX_M1
+-	bool "Arm Cortex-M1"
+-	select ARCH_HAS_NO_MMU
+-	select FORCE_THUMB
+-
+-config CONFIG_ARM_SA110
+-	bool "Intel StrongArm SA-110"
+-	select ARCH_HAS_MMU
+-	select HAS_THUMB
+-
+-config CONFIG_ARM_SA1100
+-	bool "Intel StrongArm SA-1100"
+-	select ARCH_HAS_MMU
+-	select HAS_THUMB
+-
+-config CONFIG_ARM_XSCALE
+-	bool "Intel Xscale"
+-	select ARCH_HAS_MMU
+-	select HAS_THUMB
+-
+-config CONFIG_ARM_IWMMXT
+-	bool "Intel Xscale With WMMX PXA27x"
+-	select ARCH_HAS_MMU
+-	select HAS_THUMB
+-
+-endchoice
+-
+-config HAS_THUMB
+-	bool
+-
+-config FORCE_THUMB
+-	bool
+-	select HAS_THUMB
+-	select COMPILE_IN_THUMB_MODE
+-	select USE_BX
+-
+ config COMPILE_IN_THUMB_MODE
+-	bool
++	bool "Build using Thumb mode"
++	select USE_BX
++	help
++	  Say 'y' here to force building uClibc in thumb mode.
++	  Say 'n' to use your compiler's default mode.
+ 
+ config USE_BX
+ 	bool "Use BX in function return"
+-	default y
+-	depends on HAS_THUMB
+ 	help
+ 	  Use BX instruction for THUMB aware architectures.
+-- 
+1.7.1
+
diff --git a/meta/recipes-core/uclibc/uclibc-git/remove_attribute_optimize_Os.patch b/meta/recipes-core/uclibc/uclibc-git/remove_attribute_optimize_Os.patch
new file mode 100644
index 0000000..1930383
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/remove_attribute_optimize_Os.patch
@@ -0,0 +1,186 @@
+Index: git/include/features.h
+===================================================================
+--- git.orig/include/features.h
++++ git/include/features.h
+@@ -186,7 +186,6 @@
+ # define __need_uClibc_config_h
+ # include <bits/uClibc_config.h>
+ # undef __need_uClibc_config_h
+-
+ /* For uClibc, always optimize for size -- this should disable
+  * a lot of expensive inlining...
+  * TODO: this is wrong! __OPTIMIZE_SIZE__ is an indicator of
+Index: git/libpthread/nptl/pthread_mutex_timedlock.c
+===================================================================
+--- git.orig/libpthread/nptl/pthread_mutex_timedlock.c
++++ git/libpthread/nptl/pthread_mutex_timedlock.c
+@@ -29,7 +29,9 @@
+  * error: can't find a register in class ‘GENERAL_REGS’ while reloading ‘asm’
+  */
+ int
++#ifndef  __OPTIMIZE__
+ attribute_optimize("Os")
++#endif
+ pthread_mutex_timedlock (
+      pthread_mutex_t *mutex,
+      const struct timespec *abstime)
+Index: git/libc/sysdeps/linux/powerpc/bits/mathinline.h
+===================================================================
+--- git.orig/libc/sysdeps/linux/powerpc/bits/mathinline.h
++++ git/libc/sysdeps/linux/powerpc/bits/mathinline.h
+@@ -27,7 +27,7 @@
+ #ifdef __cplusplus
+ # define __MATH_INLINE __inline
+ #else
+-# define __MATH_INLINE extern __inline
++# define __MATH_INLINE __extern_inline
+ #endif  /* __cplusplus */
+ 
+ #if defined __GNUC__ && !defined _SOFT_FLOAT
+Index: git/libc/sysdeps/linux/alpha/bits/mathinline.h
+===================================================================
+--- git.orig/libc/sysdeps/linux/alpha/bits/mathinline.h
++++ git/libc/sysdeps/linux/alpha/bits/mathinline.h
+@@ -25,7 +25,7 @@
+ #ifdef __cplusplus
+ # define __MATH_INLINE __inline
+ #else
+-# define __MATH_INLINE extern __inline
++# define __MATH_INLINE __extern_inline
+ #endif
+ 
+ #if defined __USE_ISOC99 && defined __GNUC__ && !__GNUC_PREREQ(3,0)
+Index: git/libc/sysdeps/linux/common/bits/socket.h
+===================================================================
+--- git.orig/libc/sysdeps/linux/common/bits/socket.h
++++ git/libc/sysdeps/linux/common/bits/socket.h
+@@ -302,7 +302,7 @@ extern struct cmsghdr *__cmsg_nxthdr (st
+ libc_hidden_proto(__cmsg_nxthdr)
+ #ifdef __USE_EXTERN_INLINES
+ # ifndef _EXTERN_INLINE
+-#  define _EXTERN_INLINE extern __inline
++#  define _EXTERN_INLINE __extern_inline
+ # endif
+ _EXTERN_INLINE struct cmsghdr *
+ __NTH (__cmsg_nxthdr (struct msghdr *__mhdr, struct cmsghdr *__cmsg))
+Index: git/libc/sysdeps/linux/i386/bits/mathinline.h
+===================================================================
+--- git.orig/libc/sysdeps/linux/i386/bits/mathinline.h
++++ git/libc/sysdeps/linux/i386/bits/mathinline.h
+@@ -26,7 +26,7 @@
+ #ifdef __cplusplus
+ # define __MATH_INLINE __inline
+ #else
+-# define __MATH_INLINE extern __inline
++# define __MATH_INLINE __extern_inline
+ #endif
+ 
+ 
+Index: git/libc/sysdeps/linux/ia64/bits/mathinline.h
+===================================================================
+--- git.orig/libc/sysdeps/linux/ia64/bits/mathinline.h
++++ git/libc/sysdeps/linux/ia64/bits/mathinline.h
+@@ -24,7 +24,7 @@
+ #ifdef __cplusplus
+ # define __MATH_INLINE __inline
+ #else
+-# define __MATH_INLINE extern __inline
++# define __MATH_INLINE __extern_inline
+ #endif
+ 
+ #if defined __USE_ISOC99 && defined __GNUC__ && __GNUC__ >= 2
+Index: git/libc/sysdeps/linux/m68k/bits/mathinline.h
+===================================================================
+--- git.orig/libc/sysdeps/linux/m68k/bits/mathinline.h
++++ git/libc/sysdeps/linux/m68k/bits/mathinline.h
+@@ -92,7 +92,7 @@
+ # ifdef __cplusplus
+ #  define __m81_inline		__inline
+ # else
+-#  define __m81_inline		extern __inline
++#  define __m81_inline		__extern_inline
+ # endif
+ # define __M81_MATH_INLINES	1
+ #endif
+@@ -351,14 +351,14 @@ __inline_functions (long double,l)
+ /* Note that there must be no whitespace before the argument passed for
+    NAME, to make token pasting work correctly with -traditional.  */
+ # define __inline_forward_c(rettype, name, args1, args2)	\
+-extern __inline rettype __attribute__((__const__))		\
++__extern_inline rettype __attribute__((__const__))		\
+   name args1							\
+ {								\
+   return __CONCAT(__,name) args2;				\
+ }
+ 
+ # define __inline_forward(rettype, name, args1, args2)	\
+-extern __inline rettype name args1			\
++__extern_inline rettype name args1			\
+ {							\
+   return __CONCAT(__,name) args2;			\
+ }
+Index: git/libc/sysdeps/linux/mips/bits/socket.h
+===================================================================
+--- git.orig/libc/sysdeps/linux/mips/bits/socket.h
++++ git/libc/sysdeps/linux/mips/bits/socket.h
+@@ -307,7 +307,7 @@ extern struct cmsghdr *__cmsg_nxthdr (st
+ libc_hidden_proto(__cmsg_nxthdr)
+ #ifdef __USE_EXTERN_INLINES
+ # ifndef _EXTERN_INLINE
+-#  define _EXTERN_INLINE extern __inline
++#  define _EXTERN_INLINE __extern_inline
+ # endif
+ _EXTERN_INLINE struct cmsghdr *
+ __NTH (__cmsg_nxthdr (struct msghdr *__mhdr, struct cmsghdr *__cmsg))
+Index: git/libc/sysdeps/linux/mips/sys/tas.h
+===================================================================
+--- git.orig/libc/sysdeps/linux/mips/sys/tas.h
++++ git/libc/sysdeps/linux/mips/sys/tas.h
+@@ -30,7 +30,7 @@ extern int _test_and_set (int *p, int v)
+ #ifdef __USE_EXTERN_INLINES
+ 
+ # ifndef _EXTERN_INLINE
+-#  define _EXTERN_INLINE extern __inline
++#  define _EXTERN_INLINE __extern_inline
+ # endif
+ 
+ _EXTERN_INLINE int
+Index: git/libc/sysdeps/linux/sparc/bits/mathinline.h
+===================================================================
+--- git.orig/libc/sysdeps/linux/sparc/bits/mathinline.h
++++ git/libc/sysdeps/linux/sparc/bits/mathinline.h
+@@ -131,7 +131,7 @@
+ # ifdef __cplusplus
+ #  define __MATH_INLINE __inline
+ # else
+-#  define __MATH_INLINE extern __inline
++#  define __MATH_INLINE __extern_inline
+ # endif  /* __cplusplus */
+ 
+ /* The gcc, version 2.7 or below, has problems with all this inlining
+Index: git/libc/sysdeps/linux/sparc/bits/socket.h
+===================================================================
+--- git.orig/libc/sysdeps/linux/sparc/bits/socket.h
++++ git/libc/sysdeps/linux/sparc/bits/socket.h
+@@ -292,7 +292,7 @@ extern struct cmsghdr *__cmsg_nxthdr (st
+ libc_hidden_proto(__cmsg_nxthdr)
+ #ifdef __USE_EXTERN_INLINES
+ # ifndef _EXTERN_INLINE
+-#  define _EXTERN_INLINE extern __inline
++#  define _EXTERN_INLINE __extern_inline
+ # endif
+ _EXTERN_INLINE struct cmsghdr *
+ __NTH (__cmsg_nxthdr (struct msghdr *__mhdr, struct cmsghdr *__cmsg))
+Index: git/libc/sysdeps/linux/x86_64/bits/mathinline.h
+===================================================================
+--- git.orig/libc/sysdeps/linux/x86_64/bits/mathinline.h
++++ git/libc/sysdeps/linux/x86_64/bits/mathinline.h
+@@ -25,7 +25,7 @@
+ #ifdef __cplusplus
+ # define __MATH_INLINE __inline
+ #else
+-# define __MATH_INLINE extern __inline
++# define __MATH_INLINE __extern_inline
+ #endif
+ 
+ 
diff --git a/meta/recipes-core/uclibc/uclibc-git/reorder-use-BX.patch b/meta/recipes-core/uclibc/uclibc-git/reorder-use-BX.patch
new file mode 100644
index 0000000..d780b4c
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/reorder-use-BX.patch
@@ -0,0 +1,72 @@
+Delivered-To: raj.khem@gmail.com
+Received: by 10.90.86.4 with SMTP id j4cs313299agb;
+        Sat, 8 Jan 2011 16:45:16 -0800 (PST)
+Received: by 10.227.134.5 with SMTP id h5mr1312651wbt.75.1294533915992;
+        Sat, 08 Jan 2011 16:45:15 -0800 (PST)
+Return-Path: <yann.morin.1998@anciens.enib.fr>
+Received: from smtp.smtpout.orange.fr (smtp01.smtpout.orange.fr [80.12.242.123])
+        by mx.google.com with ESMTP id m42si33753731wej.65.2011.01.08.16.45.15;
+        Sat, 08 Jan 2011 16:45:15 -0800 (PST)
+Received-SPF: neutral (google.com: 80.12.242.123 is neither permitted nor denied by best guess record for domain of yann.morin.1998@anciens.enib.fr) client-ip=80.12.242.123;
+Authentication-Results: mx.google.com; spf=neutral (google.com: 80.12.242.123 is neither permitted nor denied by best guess record for domain of yann.morin.1998@anciens.enib.fr) smtp.mail=yann.morin.1998@anciens.enib.fr
+Received: from roazhon.bzh.lan ([90.32.245.227])
+	by mwinf5d24 with ME
+	id tClC1f0024v5z3u03ClEDA; Sun, 09 Jan 2011 01:45:15 +0100
+From: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
+To: uclibc@uclibc.org
+Cc: Khem Raj <raj.khem@gmail.com>,
+	Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>,
+	Carmelo AMOROSO <carmelo.amoroso@st.com>
+Subject: [PATCH 1/7] ARM: reorder "Use BX" option
+Date: Sun,  9 Jan 2011 01:45:04 +0100
+Message-Id: <1294533910-19305-2-git-send-email-yann.morin.1998@anciens.enib.fr>
+X-Mailer: git-send-email 1.7.1
+In-Reply-To: <1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
+References: <1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
+
+"Use BX" is not available on all CPUs, so the option depends on
+a correct CPU to be chosen . It is weird that e BX" then appears
+_above_ the CPU selection, not below.
+
+Move the "Use BX" after the CPU selection.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
+Cc: Khem Raj <raj.khem@gmail.com>
+Cc: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+Cc: Carmelo AMOROSO <carmelo.amoroso@st.com>
+---
+ extra/Configs/Config.arm |   14 +++++++-------
+ 1 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/extra/Configs/Config.arm b/extra/Configs/Config.arm
+index b060ace..3b90e67 100644
+--- a/extra/Configs/Config.arm
++++ b/extra/Configs/Config.arm
+@@ -30,13 +30,6 @@ config CONFIG_ARM_EABI
+ 
+ endchoice
+ 
+-config USE_BX
+-	bool "Use BX in function return"
+-	default y
+-	depends on !CONFIG_GENERIC_ARM && !CONFIG_ARM610 && !CONFIG_ARM710
+-	help
+-	  Use BX instruction for THUMB aware architectures.
+-
+ choice
+ 	prompt "Target Processor Type"
+ 	default CONFIG_GENERIC_ARM
+@@ -131,3 +124,10 @@ config CONFIG_ARM_IWMMXT
+ 	select ARCH_HAS_MMU
+ 
+ endchoice
++
++config USE_BX
++	bool "Use BX in function return"
++	default y
++	depends on !CONFIG_GENERIC_ARM && !CONFIG_ARM610 && !CONFIG_ARM710
++	help
++	  Use BX instruction for THUMB aware architectures.
+-- 
+1.7.1
+
diff --git a/meta/recipes-core/uclibc/uclibc-git/select-force-thumb.patch b/meta/recipes-core/uclibc/uclibc-git/select-force-thumb.patch
new file mode 100644
index 0000000..b19408f
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/select-force-thumb.patch
@@ -0,0 +1,172 @@
+Delivered-To: raj.khem@gmail.com
+Received: by 10.90.86.4 with SMTP id j4cs313301agb;
+        Sat, 8 Jan 2011 16:45:17 -0800 (PST)
+Received: by 10.216.186.82 with SMTP id v60mr20017574wem.56.1294533916559;
+        Sat, 08 Jan 2011 16:45:16 -0800 (PST)
+Return-Path: <yann.morin.1998@anciens.enib.fr>
+Received: from smtp.smtpout.orange.fr (smtp01.smtpout.orange.fr [80.12.242.123])
+        by mx.google.com with ESMTP id o13si33755824wee.56.2011.01.08.16.45.16;
+        Sat, 08 Jan 2011 16:45:16 -0800 (PST)
+Received-SPF: neutral (google.com: 80.12.242.123 is neither permitted nor denied by best guess record for domain of yann.morin.1998@anciens.enib.fr) client-ip=80.12.242.123;
+Authentication-Results: mx.google.com; spf=neutral (google.com: 80.12.242.123 is neither permitted nor denied by best guess record for domain of yann.morin.1998@anciens.enib.fr) smtp.mail=yann.morin.1998@anciens.enib.fr
+Received: from roazhon.bzh.lan ([90.32.245.227])
+	by mwinf5d24 with ME
+	id tClC1f0024v5z3u03ClFDL; Sun, 09 Jan 2011 01:45:16 +0100
+From: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
+To: uclibc@uclibc.org
+Cc: Khem Raj <raj.khem@gmail.com>,
+	Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>,
+	Carmelo AMOROSO <carmelo.amoroso@st.com>
+Subject: [PATCH 2/7] ARM: introduce blind options to select & force THUMB mode
+Date: Sun,  9 Jan 2011 01:45:05 +0100
+Message-Id: <1294533910-19305-3-git-send-email-yann.morin.1998@anciens.enib.fr>
+X-Mailer: git-send-email 1.7.1
+In-Reply-To: <1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
+References: <1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
+
+Add three new blind options to set use of Thumb mode:
+- COMPILE_IN_THUMB_MODE
+  - if set, CFLAGS will contain -mthumb
+  - if unset, the compiler's default is used
+- HAS_THUMB
+  - CPUS with Thumb instruction set can select this
+  - use of BX depends on this
+- FORCE_THUMB
+  - CPUs that are Thumb-only must select this
+  - this selects: HAS_THUMB, COMPILE_IN_THUMB_MODE and USE_BX
+
+Also, remove leading space in Rules.mak.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
+Cc: Khem Raj <raj.khem@gmail.com>
+Cc: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+Cc: Carmelo AMOROSO <carmelo.amoroso@st.com>
+---
+ Rules.mak                |    7 ++++---
+ extra/Configs/Config.arm |   31 ++++++++++++++++++++++++++++---
+ 2 files changed, 32 insertions(+), 6 deletions(-)
+
+diff --git a/Rules.mak b/Rules.mak
+index eecdc64..2a16908 100644
+--- a/Rules.mak
++++ b/Rules.mak
+@@ -348,9 +348,10 @@ ifeq ($(TARGET_ARCH),arm)
+ 	CPU_CFLAGS-$(CONFIG_ARM_SA1100)+=-mtune=strongarm1100 -march=armv4
+ 	CPU_CFLAGS-$(CONFIG_ARM_XSCALE)+=$(call check_gcc,-mtune=xscale,-mtune=strongarm110)
+ 	CPU_CFLAGS-$(CONFIG_ARM_XSCALE)+=-march=armv5te -Wa,-mcpu=xscale
+- 	CPU_CFLAGS-$(CONFIG_ARM_IWMMXT)+=-march=iwmmxt -Wa,-mcpu=iwmmxt -mabi=iwmmxt
+- 	CPU_CFLAGS-$(CONFIG_ARM_CORTEX_M3)+=-mcpu=cortex-m3 -mthumb
+- 	CPU_CFLAGS-$(CONFIG_ARM_CORTEX_M1)+=-mcpu=cortex-m1 -mthumb
++	CPU_CFLAGS-$(CONFIG_ARM_IWMMXT)+=-march=iwmmxt -Wa,-mcpu=iwmmxt -mabi=iwmmxt
++	CPU_CFLAGS-$(CONFIG_ARM_CORTEX_M3)+=-mcpu=cortex-m3
++	CPU_CFLAGS-$(CONFIG_ARM_CORTEX_M1)+=-mcpu=cortex-m1
++	CPU_CFLAGS-$(COMPILE_IN_THUMB_MODE)+=-mthumb
+ endif
+ 
+ ifeq ($(TARGET_ARCH),mips)
+diff --git a/extra/Configs/Config.arm b/extra/Configs/Config.arm
+index 3b90e67..c9c40d4 100644
+--- a/extra/Configs/Config.arm
++++ b/extra/Configs/Config.arm
+@@ -64,70 +64,95 @@ config CONFIG_ARM710
+ config CONFIG_ARM7TDMI
+ 	bool "Arm 7TDMI"
+ 	select ARCH_HAS_NO_MMU
++	select HAS_THUMB
+ 
+ config CONFIG_ARM720T
+ 	bool "Arm 720T"
+ 	select ARCH_HAS_MMU
++	select HAS_THUMB
+ 
+ config CONFIG_ARM920T
+ 	bool "Arm 920T"
+ 	select ARCH_HAS_MMU
++	select HAS_THUMB
+ 
+ config CONFIG_ARM922T
+ 	bool "Arm 922T"
+ 	select ARCH_HAS_MMU
++	select HAS_THUMB
+ 
+ config CONFIG_ARM926T
+ 	bool "Arm 926T"
+ 	select ARCH_HAS_MMU
++	select HAS_THUMB
+ 
+ config CONFIG_ARM10T
+ 	bool "Arm 10T"
+ 	select ARCH_HAS_MMU
++	select HAS_THUMB
+ 
+ config CONFIG_ARM1136JF_S
+ 	bool "Arm 1136JF-S"
+ 	select ARCH_HAS_MMU
++	select HAS_THUMB
+ 
+ config CONFIG_ARM1176JZ_S
+ 	bool "Arm 1176JZ-S"
+ 	select ARCH_HAS_MMU
++	select HAS_THUMB
+ 
+ config CONFIG_ARM1176JZF_S
+ 	bool "Arm 1176JZF-S"
+ 	select ARCH_HAS_MMU
++	select HAS_THUMB
+ 
+ config CONFIG_ARM_CORTEX_M3
+ 	bool "Arm Cortex-M3"
+ 	select ARCH_HAS_NO_MMU
+-	select USE_BX
++	select FORCE_THUMB
+ 
+ config CONFIG_ARM_CORTEX_M1
+ 	bool "Arm Cortex-M1"
+ 	select ARCH_HAS_NO_MMU
+-	select USE_BX
++	select FORCE_THUMB
+ 
+ config CONFIG_ARM_SA110
+ 	bool "Intel StrongArm SA-110"
+ 	select ARCH_HAS_MMU
++	select HAS_THUMB
+ 
+ config CONFIG_ARM_SA1100
+ 	bool "Intel StrongArm SA-1100"
+ 	select ARCH_HAS_MMU
++	select HAS_THUMB
+ 
+ config CONFIG_ARM_XSCALE
+ 	bool "Intel Xscale"
+ 	select ARCH_HAS_MMU
++	select HAS_THUMB
+ 
+ config CONFIG_ARM_IWMMXT
+ 	bool "Intel Xscale With WMMX PXA27x"
+ 	select ARCH_HAS_MMU
++	select HAS_THUMB
+ 
+ endchoice
+ 
++config HAS_THUMB
++	bool
++
++config FORCE_THUMB
++	bool
++	select HAS_THUMB
++	select COMPILE_IN_THUMB_MODE
++	select USE_BX
++
++config COMPILE_IN_THUMB_MODE
++	bool
++
+ config USE_BX
+ 	bool "Use BX in function return"
+ 	default y
+-	depends on !CONFIG_GENERIC_ARM && !CONFIG_ARM610 && !CONFIG_ARM710
++	depends on HAS_THUMB
+ 	help
+ 	  Use BX instruction for THUMB aware architectures.
+-- 
+1.7.1
+
diff --git a/meta/recipes-core/uclibc/uclibc-0.9.30.1/qemumips/uClibc.machine b/meta/recipes-core/uclibc/uclibc-git/sh4/uClibc.machine
similarity index 50%
copy from meta/recipes-core/uclibc/uclibc-0.9.30.1/qemumips/uClibc.machine
copy to meta/recipes-core/uclibc/uclibc-git/sh4/uClibc.machine
index 44fec16..65f1c4c 100644
--- a/meta/recipes-core/uclibc/uclibc-0.9.30.1/qemumips/uClibc.machine
+++ b/meta/recipes-core/uclibc/uclibc-git/sh4/uClibc.machine
@@ -1,6 +1,5 @@
 #
 # Automatically generated make config: don't edit
-# Fri Nov 23 15:49:33 2007
 #
 # TARGET_alpha is not set
 # TARGET_arm is not set
@@ -10,59 +9,40 @@
 # TARGET_frv is not set
 # TARGET_h8300 is not set
 # TARGET_hppa is not set
-TARGET_i386=y
+# TARGET_i386 is not set
 # TARGET_i960 is not set
-# TARGET_ia64 is not set
 # TARGET_m68k is not set
 # TARGET_microblaze is not set
 # TARGET_mips is not set
 # TARGET_nios is not set
 # TARGET_nios2 is not set
 # TARGET_powerpc is not set
-# TARGET_sh is not set
+TARGET_sh=y
 # TARGET_sh64 is not set
 # TARGET_sparc is not set
 # TARGET_v850 is not set
-# TARGET_vax is not set
 # TARGET_x86_64 is not set
 
 #
 # Target Architecture Features and Options
 #
-TARGET_ARCH="i386"
+TARGET_ARCH="sh"
+ARCH_SUPPORTS_BIG_ENDIAN=y
+ARCH_SUPPORTS_LITTLE_ENDIAN=y
 FORCE_OPTIONS_FOR_ARCH=y
-CONFIG_GENERIC_386=y
-# CONFIG_386 is not set
-# CONFIG_486 is not set
-# CONFIG_586 is not set
-# CONFIG_586MMX is not set
-# CONFIG_686 is not set
-# CONFIG_PENTIUMII is not set
-# CONFIG_PENTIUMIII is not set
-# CONFIG_PENTIUM4 is not set
-# CONFIG_K6 is not set
-# CONFIG_K7 is not set
-# CONFIG_ELAN is not set
-# CONFIG_CRUSOE is not set
-# CONFIG_WINCHIPC6 is not set
-# CONFIG_WINCHIP2 is not set
-# CONFIG_CYRIXIII is not set
-# CONFIG_NEHEMIAH is not set
-TARGET_SUBARCH=""
-
-#
-# Using ELF file format
-#
+# CONFIG_SH2A is not set
+# CONFIG_SH2 is not set
+# CONFIG_SH3 is not set
+CONFIG_SH4=y
 ARCH_LITTLE_ENDIAN=y
-
-#
-# Using Little Endian
-#
+# ARCH_BIG_ENDIAN is not set
+ARCH_WANTS_LITTLE_ENDIAN=y
+# ARCH_WANTS_BIG_ENDIAN is not set
+# ARCH_HAS_NO_MMU is not set
 ARCH_HAS_MMU=y
-ARCH_USE_MMU=y
 UCLIBC_HAS_FLOATS=y
 UCLIBC_HAS_FPU=y
 DO_C99_MATH=y
-KERNEL_HEADERS="/usr/include"
+# UCLIBC_HAS_FENV is not set
+KERNEL_HEADERS="<path/to/kernel/headers>"
 HAVE_DOT_CONFIG=y
-
diff --git a/meta/recipes-core/uclibc/uclibc-git/transform-eabi-oabi-choice.patch b/meta/recipes-core/uclibc/uclibc-git/transform-eabi-oabi-choice.patch
new file mode 100644
index 0000000..82970ca
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/transform-eabi-oabi-choice.patch
@@ -0,0 +1,71 @@
+Delivered-To: raj.khem@gmail.com
+Received: by 10.90.86.4 with SMTP id j4cs313305agb;
+        Sat, 8 Jan 2011 16:45:19 -0800 (PST)
+Received: by 10.216.153.210 with SMTP id f60mr573848wek.114.1294533918335;
+        Sat, 08 Jan 2011 16:45:18 -0800 (PST)
+Return-Path: <yann.morin.1998@anciens.enib.fr>
+Received: from smtp.smtpout.orange.fr (smtp01.smtpout.orange.fr [80.12.242.123])
+        by mx.google.com with ESMTP id n4si33737071wej.152.2011.01.08.16.45.17;
+        Sat, 08 Jan 2011 16:45:18 -0800 (PST)
+Received-SPF: neutral (google.com: 80.12.242.123 is neither permitted nor denied by best guess record for domain of yann.morin.1998@anciens.enib.fr) client-ip=80.12.242.123;
+Authentication-Results: mx.google.com; spf=neutral (google.com: 80.12.242.123 is neither permitted nor denied by best guess record for domain of yann.morin.1998@anciens.enib.fr) smtp.mail=yann.morin.1998@anciens.enib.fr
+Received: from roazhon.bzh.lan ([90.32.245.227])
+	by mwinf5d24 with ME
+	id tClC1f0024v5z3u03ClGDX; Sun, 09 Jan 2011 01:45:17 +0100
+From: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
+To: uclibc@uclibc.org
+Cc: Khem Raj <raj.khem@gmail.com>,
+	Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>,
+	Carmelo AMOROSO <carmelo.amoroso@st.com>
+Subject: [PATCH 4/7] ARM: transform the EABI/OABI choice into a boolean
+Date: Sun,  9 Jan 2011 01:45:07 +0100
+Message-Id: <1294533910-19305-5-git-send-email-yann.morin.1998@anciens.enib.fr>
+X-Mailer: git-send-email 1.7.1
+In-Reply-To: <1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
+References: <1294533910-19305-1-git-send-email-yann.morin.1998@anciens.enib.fr>
+
+The CONFIG_ARM_OABI option is never used.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
+Cc: Khem Raj <raj.khem@gmail.com>
+Cc: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+Cc: Carmelo AMOROSO <carmelo.amoroso@st.com>
+---
+ extra/Configs/Config.arm |   23 ++++++++---------------
+ 1 files changed, 8 insertions(+), 15 deletions(-)
+
+Index: git/extra/Configs/Config.arm
+===================================================================
+--- git.orig/extra/Configs/Config.arm
++++ git/extra/Configs/Config.arm
+@@ -12,23 +12,16 @@ config FORCE_OPTIONS_FOR_ARCH
+ 	default y
+ 	select ARCH_ANY_ENDIAN
+ 
+-choice
+-	prompt "Target ABI"
+-	default CONFIG_ARM_EABI
++config CONFIG_ARM_EABI
++	bool "Build for EABI"
+ 	help
+-	  If you choose "EABI" here, functions and constants required by the
+-	  ARM EABI will be built into the library.  You should choose "EABI"
++	  If you say 'y' here, functions and constants required by the
++	  ARM EABI will be built into the library.  You should say 'y'
+ 	  if your compiler uses the ARM EABI, in which case you will also
+-	  need a kernel supporting the EABI system call interface, or "OABI"
+-	  for a compiler using the old Linux ABI.
+-
+-config CONFIG_ARM_OABI
+-	bool "OABI"
+-
+-config CONFIG_ARM_EABI
+-	bool "EABI"
++	  need a kernel supporting the EABI system call interface.
+ 
+-endchoice
++	  If you say 'n' here, then the library will be built for the
++	  old Linux ABI.
+ 
+ config COMPILE_IN_THUMB_MODE
+ 	bool "Build using Thumb mode"
diff --git a/meta/recipes-core/uclibc/uclibc-0.9.30.1/uClibc.config b/meta/recipes-core/uclibc/uclibc-git/uClibc.config
similarity index 100%
rename from meta/recipes-core/uclibc/uclibc-0.9.30.1/uClibc.config
rename to meta/recipes-core/uclibc/uclibc-git/uClibc.config
diff --git a/meta/recipes-core/uclibc/uclibc-0.9.30.1/uClibc.distro b/meta/recipes-core/uclibc/uclibc-git/uClibc.distro
similarity index 88%
rename from meta/recipes-core/uclibc/uclibc-0.9.30.1/uClibc.distro
rename to meta/recipes-core/uclibc/uclibc-git/uClibc.distro
index 042ea4c..a1b7813 100644
--- a/meta/recipes-core/uclibc/uclibc-0.9.30.1/uClibc.distro
+++ b/meta/recipes-core/uclibc/uclibc-git/uClibc.distro
@@ -17,8 +17,9 @@ UCLIBC_CTOR_DTOR=y
 LDSO_GNU_HASH_SUPPORT=y
 # HAS_NO_THREADS is not set
 UCLIBC_HAS_THREADS=y
+UCLIBC_HAS_THREADS_NATIVE=y
 PTHREADS_DEBUG_SUPPORT=y
-LINUXTHREADS_OLD=y
+# LINUXTHREADS_OLD is not set
 UCLIBC_HAS_LFS=y
 # MALLOC is not set
 # MALLOC_SIMPLE is not set
@@ -28,12 +29,13 @@ UCLIBC_DYNAMIC_ATEXIT=y
 COMPAT_ATEXIT=y
 UCLIBC_SUSV3_LEGACY=y
 UCLIBC_SUSV3_LEGACY_MACROS=y
+UCLIBC_SUSV4_LEGACY=y
 UCLIBC_HAS_SHADOW=y
 UCLIBC_HAS_PROGRAM_INVOCATION_NAME=y
 UCLIBC_HAS___PROGNAME=y
 UNIX98PTY_ONLY=y
-UCLIBC_HAS_GETPT=y
 ASSUME_DEVPTS=y
+UCLIBC_HAS_LIBUTIL=y
 UCLIBC_HAS_TM_EXTENSIONS=y
 UCLIBC_HAS_TZ_CACHING=y
 UCLIBC_HAS_TZ_FILE=y
@@ -53,8 +55,12 @@ UCLIBC_HAS_IPV6=y
 UCLIBC_HAS_RPC=y
 UCLIBC_HAS_FULL_RPC=y
 # UCLIBC_HAS_REENTRANT_RPC is not set
-# UCLIBC_USE_NETLINK is not set
-# UCLIBC_HAS_BSD_RES_CLOSE is not set
+UCLIBC_USE_NETLINK=y
+UCLIBC_SUPPORT_AI_ADDRCONFIG=y
+
+UCLIBC_HAS_BSD_RES_CLOSE=y
+UCLIBC_HAS_LIBRESOLV_STUB=y
+UCLIBC_HAS_LIBNSL_STUB=y
 
 #
 # String and Stdio Support
@@ -83,8 +89,8 @@ UCLIBC_HAS_STDIO_BUILTIN_BUFFER_NONE=y
 # UCLIBC_HAS_STDIO_BUILTIN_BUFFER_4 is not set
 # UCLIBC_HAS_STDIO_BUILTIN_BUFFER_8 is not set
 # UCLIBC_HAS_STDIO_SHUTDOWN_ON_ABORT is not set
-# UCLIBC_HAS_STDIO_GETC_MACRO is not set
-# UCLIBC_HAS_STDIO_PUTC_MACRO is not set
+UCLIBC_HAS_STDIO_GETC_MACRO=y
+UCLIBC_HAS_STDIO_PUTC_MACRO=y
 UCLIBC_HAS_STDIO_AUTO_RW_TRANSITION=y
 # UCLIBC_HAS_FOPEN_LARGEFILE_MODE is not set
 UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE=y
@@ -105,7 +111,9 @@ UCLIBC_HAS_REGEX=y
 UCLIBC_HAS_FNMATCH=y
 # UCLIBC_HAS_FNMATCH_OLD is not set
 UCLIBC_HAS_WORDEXP=y
+UCLIBC_HAS_NFTW=y
 UCLIBC_HAS_FTW=y
+UCLIBC_HAS_FTS=y
 UCLIBC_HAS_GLOB=y
 UCLIBC_HAS_GNU_GLOB=y
 
@@ -134,11 +142,12 @@ CROSS_COMPILER_PREFIX=""
 UCLIBC_EXTRA_CFLAGS=""
 # DODEBUG is not set
 # DODEBUG_PT is not set
-DOSTRIP=n
+# DOSTRIP is not set
 # DOASSERTS is not set
 # SUPPORT_LD_DEBUG is not set
 # SUPPORT_LD_DEBUG_EARLY is not set
 # UCLIBC_MALLOC_DEBUGGING is not set
+UCLIBC_HAS_BACKTRACE=y
 WARNINGS="-Wall"
 # EXTRA_WARNINGS is not set
 # DOMULTI is not set
@@ -146,3 +155,6 @@ WARNINGS="-Wall"
 
 # math stuff for perl
 DO_C99_MATH=y
+UCLIBC_HAS_LONG_DOUBLE_MATH=y
+UCLIBC_HAS_FENV=y
+
diff --git a/meta/recipes-core/uclibc/uclibc-git/uclibc-arm-ftruncate64.patch b/meta/recipes-core/uclibc/uclibc-git/uclibc-arm-ftruncate64.patch
new file mode 100644
index 0000000..504d37b
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/uclibc-arm-ftruncate64.patch
@@ -0,0 +1,13 @@
+Index: uclibc-0.9.29/libc/sysdeps/linux/arm/bits/uClibc_arch_features.h
+===================================================================
+--- uclibc-0.9.29.orig/libc/sysdeps/linux/arm/bits/uClibc_arch_features.h
++++ uclibc-0.9.29/libc/sysdeps/linux/arm/bits/uClibc_arch_features.h
+@@ -38,4 +38,8 @@
+ /* define if target supports IEEE signed zero floats */
+ #define __UCLIBC_HAVE_SIGNED_ZERO__
+ 
++#ifdef __ARM_EABI__
++# define __UCLIBC_TRUNCATE64_HAS_4_ARGS__
++#endif
++
+ #endif /* _BITS_UCLIBC_ARCH_FEATURES_H */
diff --git a/meta/recipes-core/uclibc/uclibc-git/uclibc_enable_log2_test.patch b/meta/recipes-core/uclibc/uclibc-git/uclibc_enable_log2_test.patch
new file mode 100644
index 0000000..f8f3a7d
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/uclibc_enable_log2_test.patch
@@ -0,0 +1,30 @@
+Index: uClibc/test/math/libm-test.inc
+===================================================================
+--- uClibc/test/math/libm-test.inc	(revision 23784)
++++ uClibc/test/math/libm-test.inc	(working copy)
+@@ -3414,7 +3414,6 @@
+ }
+ 
+ 
+-#if 0
+ static void
+ log2_test (void)
+ {
+@@ -3444,7 +3443,6 @@
+ 
+   END (log2);
+ }
+-#endif
+ 
+ 
+ static void
+@@ -4967,9 +4965,7 @@
+   log_test ();
+   log10_test ();
+   log1p_test ();
+-#if 0
+   log2_test ();
+-#endif
+   logb_test ();
+   modf_test ();
+   ilogb_test ();
diff --git a/meta/recipes-core/uclibc/uclibc-0.9.30.1/qemumips/uClibc.machine b/meta/recipes-core/uclibc/uclibc-git/x86_64/uClibc.machine
similarity index 50%
rename from meta/recipes-core/uclibc/uclibc-0.9.30.1/qemumips/uClibc.machine
rename to meta/recipes-core/uclibc/uclibc-git/x86_64/uClibc.machine
index 44fec16..ac50da0 100644
--- a/meta/recipes-core/uclibc/uclibc-0.9.30.1/qemumips/uClibc.machine
+++ b/meta/recipes-core/uclibc/uclibc-git/x86_64/uClibc.machine
@@ -1,6 +1,5 @@
 #
 # Automatically generated make config: don't edit
-# Fri Nov 23 15:49:33 2007
 #
 # TARGET_alpha is not set
 # TARGET_arm is not set
@@ -10,9 +9,8 @@
 # TARGET_frv is not set
 # TARGET_h8300 is not set
 # TARGET_hppa is not set
-TARGET_i386=y
+# TARGET_i386 is not set
 # TARGET_i960 is not set
-# TARGET_ia64 is not set
 # TARGET_m68k is not set
 # TARGET_microblaze is not set
 # TARGET_mips is not set
@@ -23,46 +21,22 @@ TARGET_i386=y
 # TARGET_sh64 is not set
 # TARGET_sparc is not set
 # TARGET_v850 is not set
-# TARGET_vax is not set
-# TARGET_x86_64 is not set
+TARGET_x86_64=y
 
 #
 # Target Architecture Features and Options
 #
-TARGET_ARCH="i386"
+TARGET_ARCH="x86_64"
+# ARCH_SUPPORTS_BIG_ENDIAN is not set
+ARCH_SUPPORTS_LITTLE_ENDIAN=y
 FORCE_OPTIONS_FOR_ARCH=y
-CONFIG_GENERIC_386=y
-# CONFIG_386 is not set
-# CONFIG_486 is not set
-# CONFIG_586 is not set
-# CONFIG_586MMX is not set
-# CONFIG_686 is not set
-# CONFIG_PENTIUMII is not set
-# CONFIG_PENTIUMIII is not set
-# CONFIG_PENTIUM4 is not set
-# CONFIG_K6 is not set
-# CONFIG_K7 is not set
-# CONFIG_ELAN is not set
-# CONFIG_CRUSOE is not set
-# CONFIG_WINCHIPC6 is not set
-# CONFIG_WINCHIP2 is not set
-# CONFIG_CYRIXIII is not set
-# CONFIG_NEHEMIAH is not set
-TARGET_SUBARCH=""
-
-#
-# Using ELF file format
-#
 ARCH_LITTLE_ENDIAN=y
-
-#
-# Using Little Endian
-#
+# ARCH_BIG_ENDIAN is not set
+# ARCH_HAS_NO_MMU is not set
 ARCH_HAS_MMU=y
-ARCH_USE_MMU=y
 UCLIBC_HAS_FLOATS=y
 UCLIBC_HAS_FPU=y
 DO_C99_MATH=y
-KERNEL_HEADERS="/usr/include"
+# UCLIBC_HAS_FENV is not set
+KERNEL_HEADERS="<path/to/kernel/headers>"
 HAVE_DOT_CONFIG=y
-
diff --git a/meta/recipes-core/uclibc/uclibc-initial_0.9.30.1.bb b/meta/recipes-core/uclibc/uclibc-initial_0.9.30.1.bb
deleted file mode 100644
index 71a2f0c..0000000
--- a/meta/recipes-core/uclibc/uclibc-initial_0.9.30.1.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-SECTION = "base"
-require uclibc_${PV}.bb
-
-DEPENDS = "linux-libc-headers ncurses-native virtual/${TARGET_PREFIX}gcc-initial"
-PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
-PACKAGES = ""
-
-do_install() {
-	# Install initial headers into the cross dir
-	make V=1 CC="${CC}" PREFIX=${D} DEVEL_PREFIX=${prefix}/ RUNTIME_PREFIX=/ \
-		install_headers
-	#ln -sf include ${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/sys-include
-
-	# This conflicts with the c++ version of this header
-	rm -f ${D}${includedir}/bits/atomicity.h
-	install -d ${D}${libdir}/
-	install -m 644 lib/crt[1in].o ${D}${libdir}/
-	install -d ${D}${libdir}/
-	install -m 644 lib/libc.so ${D}${libdir}/
-}
-
-do_compile () {
-	make V=1 CC="${CC}" PREFIX=${D} DEVEL_PREFIX=${prefix}/ RUNTIME_PREFIX=/ \
-		lib/crt1.o lib/crti.o lib/crtn.o
-	${CC} -nostdlib -nostartfiles -shared -x c /dev/null \
-		-o lib/libc.so
-}
-
-do_siteconfig () {
-	:
-}
diff --git a/meta/recipes-core/uclibc/uclibc-initial_git.bb b/meta/recipes-core/uclibc/uclibc-initial_git.bb
new file mode 100644
index 0000000..8e5c251
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-initial_git.bb
@@ -0,0 +1,39 @@
+SECTION = "base"
+require uclibc_git.bb
+
+DEPENDS = "linux-libc-headers ncurses-native virtual/${TARGET_PREFIX}gcc-initial"
+PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
+
+PACKAGES = ""
+PACKAGES_DYNAMIC = ""
+
+STAGINGCC = "gcc-cross-initial"
+STAGINGCC_virtclass-nativesdk = "gcc-crosssdk-initial"
+
+do_install() {
+	# Install initial headers into the cross dir
+	make PREFIX=${D} DEVEL_PREFIX=${prefix}/ RUNTIME_PREFIX=/ \
+		install_headers install_startfiles
+	${CC} -nostdlib -nostartfiles -shared -x c /dev/null \
+		-o lib/libc.so
+	${CC} -nostdlib -nostartfiles -shared -x c /dev/null \
+		-o lib/libm.so
+	install -d ${D}${libdir}
+	install -m 755 lib/lib[cm].so ${D}${libdir}
+	# add links to linux-libc-headers: gcc-{cross,crossdk}-intermediate need this.
+        for t in linux asm asm-generic; do
+                if [ -d ${D}${includedir}/$t ]; then
+                    rm -rf ${D}${includedir}/$t
+                fi
+                ln -sf ${STAGING_DIR_TARGET}${includedir}/$t ${D}${includedir}/
+        done
+}
+do_compile() {
+	:
+}
+
+do_siteconfig () {
+        :
+}
+
+do_populate_sysroot[sstate-outputdirs] = "${STAGING_DIR_TCBOOTSTRAP}"
diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index 5e87cf9..e7d8846 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -1,6 +1,6 @@
 SUMMARY = "C library for embedded systems"
-DESCRIPTION = "The name uClibc is an abbreviation for 'the \ 
-microcontroller C library'. For simplicity, uClibc is pronounced \ 
+DESCRIPTION = "The name uClibc is an abbreviation for 'the \
+microcontroller C library'. For simplicity, uClibc is pronounced \
 'yew-see-lib-see'.  The goal of uClibc is to provide as much \
 functionality as possible in a small amount of space, and it is intended \
 primarily for embedded use. It is also highly configurable in supported \
@@ -11,6 +11,30 @@ embedded Linux.  It is NOT compatible with binaries linked against glibc."
 LICENSE = "LGPL"
 SECTION = "libs"
 PRIORITY = "required"
+LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
+		    file://COPYING.LIB.boilerplate;md5=aaddeadcddeb918297e0e4afc52ce46f \
+file://${S}/test/regex/testregex.c;startline=1;endline=31;md5=234efb227d0a40677f895e4a1e26e960"
+INC_PR = "r2"
+
+require uclibc-config.inc
+STAGINGCC = "gcc-cross-intermediate"
+STAGINGCC_virtclass-nativesdk = "gcc-crosssdk-intermediate"
+PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.${STAGINGCC}:"
+
+TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TCBOOTSTRAP}"
+
+# siteconfig.bbclass runs configure which needs a working compiler
+# For the compiler to work we need a working libc yet libc isn't 
+# in the sysroots directory at this point. This means the libc.so
+# linker script won't work as the --sysroot setting isn't correct.
+# Here we create a hacked up libc linker script and pass in the right
+# flags to let configure work. Ugly.
+EXTRASITECONFIG = "CFLAGS='${CFLAGS} -Wl,-L${WORKDIR}/site_config_libc -L${WORKDIR}/site_config_libc -L${SYSROOT_DESTDIR}${libdir} -L${SYSROOT_DESTDIR}${base_libdir} -Wl,-L${SYSROOT_DESTDIR}${libdir} -Wl,-L${SYSROOT_DESTDIR}${base_libdir}'"
+siteconfig_do_siteconfig_gencache_prepend = " \
+mkdir -p ${WORKDIR}/site_config_libc; \
+cp ${SYSROOT_DESTDIR}${libdir}/libc.so ${WORKDIR}/site_config_libc; \
+sed -i -e 's# ${base_libdir}# ${SYSROOT_DESTDIR}${base_libdir}#g' -e 's# ${libdir}# ${SYSROOT_DESTDIR}${libdir}#g' ${WORKDIR}/site_config_libc/libc.so; \
+"
 
 #
 # For now, we will skip building of a gcc package if it is a uclibc one
@@ -27,165 +51,165 @@ python __anonymous () {
         raise bb.parse.SkipPackage("incompatible with target %s" %
                                    bb.data.getVar('TARGET_OS', d, 1))
 }
-
 PROVIDES += "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
-PROVIDES += "${@['virtual/libiconv', ''][bb.data.getVar('USE_NLS', d, 1) != 'yes']}"
 DEPENDS = "virtual/${TARGET_PREFIX}binutils \
-	   virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-headers ncurses-native pax-utils-native"
+           virtual/${TARGET_PREFIX}gcc-intermediate \
+           linux-libc-headers ncurses-native"
 RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
 
-# Blackfin needs a wrapper around ld
-#DEPENDS_append_bfin = " elf2flt "
-
 INHIBIT_DEFAULT_DEPS = "1"
-PARALLEL_MAKE = ""
 
-PACKAGES =+ "ldd uclibc-utils-dbg uclibc-utils uclibc-gconv uclibc-thread-db"
+PACKAGES =+ "ldd uclibc-utils-dbg uclibc-utils uclibc-gconv uclibc-thread-db uclibc-argp uclibc-backtrace"
 
 LEAD_SONAME = "libc.so"
 
-# The last line (gdb and lib1) is for uclinux-uclibc builds 
+# The last line (gdb and lib1) is for uclinux-uclibc builds
 uclibc_baselibs = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so \
-		   ${base_libdir}/libintl*.so.* ${base_libdir}/libintl-*.so \
-		   ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so \
-		   ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so \
-                   ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so \
-		   ${base_libdir}/libc*.so.* ${base_libdir}/libuClibc-*.so \
+                   ${base_libdir}/libintl*.so.* ${base_libdir}/libintl-*.so \
+                   ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so \
+                   ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so \
+                   ${base_libdir}/ld*.so.* ${base_libdir}/ld*.so \
+                   ${base_libdir}/libc*.so.* ${base_libdir}/libuClibc-*.so \
                    ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so \
-		   ${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so \
+                   ${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so \
                    ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so \
-		   ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so \
+                   ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so \
                    ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so \
                    ${libdir}/libc.gdb ${libdir}/libc ${base_libdir}/lib1.so \
-                   "
+                  "
 FILES_${PN} = "${sysconfdir} ${uclibc_baselibs} /sbin/ldconfig \
-	       ${libexecdir} ${datadir}/zoneinfo ${libdir}/locale"
+               ${libexecdir} ${datadir}/zoneinfo ${libdir}/locale"
 FILES_ldd = "${bindir}/ldd"
-FILES_uclibc-dev += "${libdir}/*.o"
+FILES_uclibc-dev_append = "\
+        ${libdir}/lib*.so \
+        ${libdir}/*_nonshared.a \
+        ${libdir}/[S]*crt[1in].o \
+        ${libdir}/crtreloc*.o \
+        ${libdir}/lib*.a \
+        ${includedir}/*.h ${includedir}/*/*.h \
+       "
 FILES_uclibc-utils = "${bindir} ${sbindir}"
 FILES_uclibc-utils-dbg += "${bindir}/.debug ${sbindir}/.debug"
 FILES_uclibc-gconv = "${libdir}/gconv"
-FILES_uclibc-thread-db = "/lib/libthread_db*"
-RPROVIDES_uclibc-dev += "libc-dev"
+FILES_uclibc-thread-db = "${base_libdir}/libthread_db*"
+FILES_uclibc-argp = "${base_libdir}/libuargp-*.so ${base_libdir}/libuargp*.so.*"
+FILES_uclibc-backtrace = "${base_libdir}/libubacktrace-*.so ${base_libdir}/libubacktrace*.so.*"
+
+RPROVIDES_uclibc-dev += "libc-dev virtual-libc-dev"
+# uclibc does not really have libsegfault but then using the one from glibc is also not
+# going to work. So we pretend that we have it to make bitbake not pull other recipes
+# to satisfy this dependency for the images/tasks
+RPROVIDES_${PN} += "libsegfault"
+
+SRC_URI = "\
+        http://www.uclibc.org/downloads/uClibc-${PV}.tar.bz2;name=uClibc-${PV} \
+        "
+
+# do_stage barfs on a CC with whitespace, therefore put the 'HOST_CC_ARCH' in
+# the CFLAGS (when building the utils).
+OEMAKE_NO_CC = "'STRIPTOOL=true' 'LD=${LD}'"
+EXTRA_OEMAKE = "${OEMAKE_NO_CC} \
+                'HOSTCC=${BUILD_CC}' \
+                'HOST_CFLAGS=${BUILD_CFLAGS}' \
+                'CC=${CC}' \
+                ARCH=${UCLIBC_ARCH}"
 
-#
-# This locale file gets copied into uClibc-${PV}/extra/locale/ prior to
-# build, it does not need to be unpacked, but we can't inhibit the unpacking
-# in the current build system.
-#
-UCLIBC_LOCALE_FILE = "uClibc-locale-030818.tgz"
-UCLIBC_LOCALE_FILE_arm = "uClibc-locale-030818.arm.tgz"
-UCLIBC_LOCALE_URI = "http://www.uclibc.org/downloads/${UCLIBC_LOCALE_FILE}"
-UCLIBC_LOCALE_URI_arm = "http://wiki.openembedded.net/dl/uclibc-locale/${UCLIBC_LOCALE_FILE}"
-
-SRC_URI = "${@['${UCLIBC_LOCALE_URI}', ''][bb.data.getVar('USE_NLS', d, 1) != 'yes']} \
-	   file://uClibc.config \
-           http://www.uclibc.org/downloads/uClibc-${PV}.tar.bz2 \
-          "
-
-# do_stage barfs on a CC with whitepspace, therefore put the 'HOST_CC_ARCH' in
-# the CFLAGS (for when building the utils).
-OEMAKE_NO_CC = "'STRIPTOOL=true' 'LD=${LD}' \
-		'LOCALE_DATA_FILENAME=${UCLIBC_LOCALE_FILE}'"
-EXTRA_OEMAKE = "${OEMAKE_NO_CC} 'CC=${CC}' \
-		'HOSTCFLAGS=-I${STAGING_INCDIR_NATIVE}' \
-		ARCH=`grep TARGET_ARCH ${S}/.config|sed -e 's/TARGET_ARCH=//g'`"
 EXTRA_OEMAKE_task_do_package = "${OEMAKE_NO_CC}"
 
-KERNEL_SOURCE = "${STAGING_INCDIR}"
-KERNEL_HEADERS = "${STAGING_INCDIR}"
-
-# Lets munge this via siteinfo.bbclass as well:
-# ARCH_BIG_ENDIAN=y
-# ARCH_WANTS_BIG_ENDIAN=y
-# ARCH_WANTS_LITTLE_ENDIAN is not set
-
-# How to enable verbose logs:
-#export VERBOSE="1"
-
-configmangle = 's,^KERNEL_SOURCE=.*,KERNEL_SOURCE="${KERNEL_SOURCE}",g; \
-		s,^KERNEL_HEADERS=.*,KERNEL_HEADERS="${KERNEL_HEADERS}",g; \
-		s,^RUNTIME_PREFIX=.*,RUNTIME_PREFIX="/",g; \
-		s,^DEVEL_PREFIX=.*,DEVEL_PREFIX="/${prefix}",g; \
-		s,^SHARED_LIB_LOADER_PATH=.*,SHARED_LIB_LOADER_PATH="/lib",; \
-		s,^SHARED_LIB_LOADER_PREFIX=.*,SHARED_LIB_LOADER_PREFIX="/lib",; \
-		s,.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=y,g; \
-		${@["","s,.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=y,;"][bb.data.getVar("USE_NLS", d, 1) == "yes"]} \
-		${@["","s,.*LDSO_GNU_HASH_SUPPORT.*,# LDSO_GNU_HASH_SUPPORT is not set,;"][bb.data.getVar("TARGET_ARCH", d, 1) in ['mips', 'mipsel', 'avr32']]} \
-               '
-
-CFLAGS := "${@oe_filter_out('-I\S+', '${CFLAGS}', d)}"
+# enable verbose output:
+export V="2"
 
-python () {
-	if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
-		bb.data.setVar('configmangle_append', ' s,^HAS_FPU=y,# HAS_FPU is not set,;', d)
+# -O<n> -fno-omit-frame-pointer ends up with GCC ICE on thumb as reported
+# http://gcc.gnu.org/bugzilla/show_bug.cgi?id=44860
+#
+CFLAGS_arm := "${@oe_filter_out('-fno-omit-frame-pointer', '${CFLAGS}', d)}"
+UCLIBC_EXTRA_CFLAGS  := "${@oe_filter_out('(-I\S+|-i\S+)', '${CFLAGS}', d)}"
+UCLIBC_EXTRA_LDFLAGS := "${@oe_filter_out('(-L\S+|-l\S+)', '${LDFLAGS}', d)}"
+do_compile_prepend () {
+  unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
 }
 
-uclibcbuild_do_patch() {
-	ln -sf ${STAGING_INCDIR}/linux ${S}/include/linux
-	ln -sf ${STAGING_INCDIR}/asm ${S}/include/asm
-	
-	${@['cp %s/%s extra/locale' % (bb.data.getVar('DL_DIR', d, 1) or '', bb.data.getVar('UCLIBC_LOCALE_FILE', d, 1) or ''), ''][bb.data.getVar('USE_NLS', d, 1) != 'yes']}
+configmangle = '/^KERNEL_HEADERS/d; \
+                /^RUNTIME_PREFIX/d; \
+                /^DEVEL_PREFIX/d; \
+                /^SHARED_LIB_LOADER_PREFIX/d; \
+                /^UCLIBC_EXTRA_CFLAGS/d; \
+                s,.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=y,g; \
+                ${@["","s,.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=y,;"][bb.data.getVar("USE_NLS", d, 1) == "yes"]} \
+                ${@["","s,.*LDSO_GNU_HASH_SUPPORT.*,# LDSO_GNU_HASH_SUPPORT is not set,;"][bb.data.getVar("TARGET_ARCH", d, 1) in ['mips', 'mipsel', 'mips64', 'mips64el', 'avr32']]} \
+                /^CROSS/d; \
+                /^TARGET_ARCH=/d; \
+                /^TARGET_/s,^\([^=]*\).*,# \1 is not set,g; \
+                s,^DOSTRIP.*,# DOSTRIP is not set,g; \
+                /_[EO]*ABI/d; \
+                /HAS_FPU/d; \
+               '
+OE_FEATURES := "${@features_to_uclibc_conf(d)}"
+OE_DEL      := "${@features_to_uclibc_del(d)}"
+python () {
+  if "${OE_DEL}":
+    bb.data.setVar('configmangle_append', "${OE_DEL}" + "\n", d)
+  if "${OE_FEATURES}":
+    bb.data.setVar('configmangle_append',
+                   "/^### DISTRO FEATURES$/a\\\n%s\n\n" %
+                   ("\\n".join((bb.data.expand("${OE_FEATURES}", d).split("\n")))),
+                   d)
+  bb.data.setVar('configmangle_append',
+                 "/^### CROSS$/a\\\n%s\n" %
+                  ("\\n".join(["CROSS_COMPILER_PREFIX=\"${TARGET_PREFIX}\"",
+                        "UCLIBC_EXTRA_CFLAGS=\"${UCLIBC_EXTRA_CFLAGS}\"",
+                         "KERNEL_HEADERS=\"${STAGING_INCDIR}\"",
+                         "RUNTIME_PREFIX=\"/\"",
+                         "DEVEL_PREFIX=\"/${prefix}\"",
+                         "SHARED_LIB_LOADER_PREFIX=\"/lib\"",
+                        ])
+                  ),
+                 d)
+  bb.data.setVar('configmangle_append',
+                 "/^### TGT$/a\\\nTARGET_ARCH=\"%s\"\\nTARGET_%s=y\n" %
+                        ("${UCLIBC_ARCH}", "${UCLIBC_ARCH}"),
+                 d)
+  bb.data.setVar('configmangle_append',
+    "/^### FPU$/a\\\n%s\n\n" % (["UCLIBC_HAS_FPU=y","# UCLIBC_HAS_FPU is not set"][bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]]), d)
+  if "${UCLIBC_ENDIAN}":
+    bb.data.setVar('configmangle_append',
+                   "/^### ABI$/a\\\nARCH_%s_ENDIAN=y\n\n" % ("${UCLIBC_ENDIAN}"),
+                   d)
+  if "${UCLIBC_ABI}":
+    bb.data.setVar('configmangle_append',
+                   "/^### ABI$/a\\\nCONFIG_%s=y\n\n" % ("${UCLIBC_ABI}"),
+                   d)
 }
 
-python do_patch () {
-	bb.build.exec_func('base_do_patch', d)
-	bb.build.exec_func('uclibcbuild_do_patch', d)
+do_patch_append() {
+        os.system("ln -sf ${STAGING_INCDIR}/linux ${S}/include/linux")
+        os.system("ln -sf ${STAGING_INCDIR}/asm ${S}/include/asm")
 }
 
 do_configure() {
-	rm -f ${S}/.config
-
-	# For uClibc 0.9.29, OpenEmbedded splits the uClibc.config in two parts:
-	# uClibc.machine and uClibc.distro. So, if they exist use them, otherwise
-	# use a uClibc.config
-	if [ -f ${WORKDIR}/uClibc.machine -a -f ${WORKDIR}/uClibc.distro ]; then
-		echo "### uClibc.machine ###" >${S}/merged.config
-		cat ${WORKDIR}/uClibc.machine >>${S}/merged.config
-		echo "### uClibc.distro ###" >>${S}/merged.config
-		cat ${WORKDIR}/uClibc.distro >>${S}/merged.config
-	else
-		echo "### uClibc.config ###" >${S}/merged.config
-		cat ${WORKDIR}/uClibc.config >>${S}/merged.config
-	fi
-	cp ${S}/merged.config ${S}/.config	
-
-	# Mangle the resulting .config depending on OE variables
-	perl -i -p -e 's,^CROSS=.*,TARGET_ARCH=${TARGET_ARCH}\nCROSS=${TARGET_PREFIX},g' ${S}/Rules.mak
-	sed -i -e s:'$(CROSS)strip':true: ${S}/Rules.mak	
-	perl -i -p -e '${configmangle}' ${S}/.config
-
-   	sed -i -e '/CONFIG_ARM_EABI/d' ${S}/.config
-
-	if [ `echo ${TARGET_ARCH} | grep -e '^arm'` ]; then
-		if [ `echo ${TARGET_OS} | grep -e 'eabi$'` ]; then
-       			echo "CONFIG_ARM_EABI=y"                >> ${S}/.config
-		else
-			echo "# CONFIG_ARM_EABI is not set"     >> ${S}/.config
-		fi
-	fi
-	yes '' | oe_runmake oldconfig
+        rm -f ${S}/.config
+
+        # OpenEmbedded splits the uClibc.config in two parts:
+        # uClibc.machine, uClibc.distro
+        echo "### uClibc.machine ###" >${S}/merged.config
+        cat ${WORKDIR}/uClibc.machine >>${S}/merged.config
+        echo "### uClibc.distro ###" >>${S}/merged.config
+        cat ${WORKDIR}/uClibc.distro >>${S}/merged.config
+        echo "### CROSS" >>${S}/merged.config
+        echo "### TGT" >>${S}/merged.config
+        echo "### MMU" >>${S}/merged.config
+        echo "### FPU" >>${S}/merged.config
+        echo "### ABI" >>${S}/merged.config
+        echo "### DISTRO FEATURES" >>${S}/merged.config
+        cp ${S}/merged.config ${S}/.config
+
+        # Mangle the resulting .config depending on OE variables
+        sed -i -e '${configmangle}' ${S}/.config
+
+        oe_runmake oldconfig
 }
 
 do_install() {
-	oe_runmake PREFIX=${D} DEVEL_PREFIX=${prefix}/ RUNTIME_PREFIX=/ \
-		install_dev install_runtime 
-
-	# Need to overwrite the version from -initial
-	if [ ! -e ${D}${libdir}/libc.so ]; then
-		ln -s ../../lib/libc.so.0 ${D}${libdir}/libc.so
-	fi
-
-	# We don't really need this in ${includedir}
-	rm -f ${D}${prefix}/include/.cvsignore
-
-	# This conflicts with the c++ version of this header
-	rm -f ${D}${prefix}/include/bits/atomicity.h
-
-        oe_runmake "SSP_ALL_CFLAGS=${TARGET_LINK_HASH_STYLE}" utils
-        oe_runmake STRIPTOOL=true PREFIX=${D} DEVEL_PREFIX=${prefix}/ RUNTIME_PREFIX=/ \
-                install_utils
-	
-	# oe_runstrip needs +x on files	
-	chmod +x ${D}/${base_libdir}/*
+        oe_runmake PREFIX=${D} install
+        oe_runmake PREFIX=${D} "SSP_ALL_CFLAGS=${TARGET_LINK_HASH_STYLE}" install_utils
 }
diff --git a/meta/recipes-core/uclibc/uclibc_0.9.30.1.bb b/meta/recipes-core/uclibc/uclibc_0.9.30.1.bb
deleted file mode 100644
index 6bdf153..0000000
--- a/meta/recipes-core/uclibc/uclibc_0.9.30.1.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-# UCLIBC_BASE should be the latest released revision of uclibc (that way
-# the config files will typically be correct!)  uclibc-cvs takes precedence
-# over uclibc-${UCLIBC_BASE}, if a config file in uclibc-cvs is out of date
-# try removing it
-#
-# UCLIBC_BASE can be set in a distro file, but whether this works depends
-# on whether the base patches apply to the selected (SRCDATE) svn release.
-#
-UCLIBC_BASE ?= "0.9.30.1"
-
-require uclibc.inc
-PR = "r1"
-
-PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
-
-SRC_URI += "file://uClibc.machine file://uClibc.distro \
-            file://arm-linuxthreads.patch;patch=1 \
-            file://linuxthreads-changes.patch;patch=1 \
-	    file://pthread_atfork.patch;patch=1 \
-	    file://uclibc_ldso_use_O0.patch;patch=1 \
-	    file://ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch;patch=1 \
-	    file://gcc-4.4-fixlet.patch;patch=1 \
-	    file://uclibc-c99-ldbl-math.patch;patch=1 \
-	    file://Use-__always_inline-instead-of-__inline__.patch;patch=1 \
-	   "
-#recent versions uclibc require real kernel headers
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-#as stated above, uclibc needs real kernel-headers
-#however: we can't depend on virtual/kernel when nptl hits due to depends deadlocking ....
-KERNEL_SOURCE = "${STAGING_DIR_HOST}/${exec_prefix}"
-
-S = "${WORKDIR}/uClibc-${UCLIBC_BASE}"
diff --git a/meta/recipes-core/uclibc/uclibc_git.bb b/meta/recipes-core/uclibc/uclibc_git.bb
new file mode 100644
index 0000000..18619cd
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc_git.bb
@@ -0,0 +1,31 @@
+SRCREV="71d63ed75648da9b0b71afabb9c60aaad792c55c"
+
+require uclibc.inc
+PV = "0.9.31+0.9.32rc3"
+PR = "${INC_PR}.1"
+PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
+
+#recent versions uclibc require real kernel headers
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-git' ], d)}"
+
+SRC_URI = "git://uclibc.org/uClibc.git;branch=master;protocol=git \
+	file://uClibc.config \
+	file://uClibc.machine \
+	file://uClibc.distro \
+	file://uclibc-arm-ftruncate64.patch \
+	file://uclibc_enable_log2_test.patch \
+	file://ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch \
+	file://reorder-use-BX.patch \
+	file://select-force-thumb.patch \
+	file://remove-sub-arch-variants.patch \
+	file://transform-eabi-oabi-choice.patch \
+	file://include-arm-asm.h.patch \
+	file://detect-bx-availibility.patch \
+	file://remove-eabi-oabi-selection.patch \
+	file://powerpc_copysignl.patch \
+	file://argp-support.patch \
+	file://argp-headers.patch \
+	file://remove_attribute_optimize_Os.patch \
+	"
+S = "${WORKDIR}/git"
-- 
1.7.4.1



