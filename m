Received: from mail-oa0-f46.google.com ([209.85.219.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TxWHN-0004JG-6q
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 06:20:14 +0100
Received: by mail-oa0-f46.google.com with SMTP id h16so6883136oag.33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 21:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=kLwHTyERQEq5P7cmuBo4HuAu1f4jOqY/vTT3bnPHMGQ=;
	b=rz16j0BRVCrmh4IZf3HadzqtXoGpzT0o107/4FiXTeXP3bcHaVNoh6Gz8+bqJ9N91m
	b1lPmWAtXtlMR+VzgrlvTF7aGBHFtV39AdwlDnfdUDes0wjJ7xliMdj2I8nhGNzs8P2M
	2wGQ+tzRPpQ8rE4+ShVy1xQ4PADED64+NzsY2uv+1ER68Pwp7Yx0m+S/RO/Q224IX8Vp
	jnpmO9bGOFWE35k4dQ45RLdZd3qAcbWmtr5Z8coSwcE1wet25o/L+Xy5Un9VfKDm2P5f
	fY6RWDoSI4Vk/FneVti+Go1XEVIaT/JSTj/G+GGskv9EPtvGEumkkGGWBMMp5tA2j00r
	xXCA==
X-Received: by 10.60.3.168 with SMTP id d8mr15756740oed.112.1358831082681;
	Mon, 21 Jan 2013 21:04:42 -0800 (PST)
Received: from leo.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id zz6sm12729989oeb.1.2013.01.21.21.04.41
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 21 Jan 2013 21:04:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jan 2013 21:04:27 -0800
Message-Id: <f2afd56d955a56e412bf9d50a915402c2e513c62.1358830857.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <e9f39209e9fdf88a6205eb59b482c830eda83aa6.1358830857.git.raj.khem@gmail.com>
References: <e9f39209e9fdf88a6205eb59b482c830eda83aa6.1358830857.git.raj.khem@gmail.com>
In-Reply-To: <cover.1358830857.git.raj.khem@gmail.com>
References: <cover.1358830857.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] uclibc-git: Upgrades to latest git
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
X-List-Received-Date: Tue, 22 Jan 2013 05:20:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop upstream accepted patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc-git.inc            |    5 +-
 ...nt.c-wtent.c-move-functions-from-utxent.c.patch |   78 ++++++++--------
 ...-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch |   30 +++----
 .../uclibc-git/define-MSG_CMSG_CLOEXEC.patch       |   25 ------
 meta/recipes-core/uclibc/uclibc-git/dup3.patch     |   37 --------
 .../uclibc/uclibc-git/mount.h-update.patch         |   83 -----------------
 .../uclibc/uclibc-git/powerpc_copysignl.patch      |   16 ++--
 .../uclibc-git/remove_attribute_optimize_Os.patch  |   95 ++++++--------------
 8 files changed, 89 insertions(+), 280 deletions(-)
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/define-MSG_CMSG_CLOEXEC.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/dup3.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/mount.h-update.patch

diff --git a/meta/recipes-core/uclibc/uclibc-git.inc b/meta/recipes-core/uclibc/uclibc-git.inc
index 4da9c58..ed9b5fd 100644
--- a/meta/recipes-core/uclibc/uclibc-git.inc
+++ b/meta/recipes-core/uclibc/uclibc-git.inc
@@ -1,4 +1,4 @@
-SRCREV="cb43f2afba0633400387fa7c55dda3396517f58a"
+SRCREV="9591091f150e8a86c47efbea5def21fa67fffb07"
 
 DEFAULT_PREFERENCE = "-1"
 
@@ -18,14 +18,11 @@ SRC_URI = "git://uclibc.org/uClibc.git;branch=master;protocol=git \
 	file://compile-arm-fork-with-O2.patch \
 	file://uclibc-execvpe.patch \
 	file://orign_path.patch \
-	file://dup3.patch \
-	file://define-MSG_CMSG_CLOEXEC.patch \
 	file://posix_fallocate.patch \
 	file://0001-atexit_old-Do-not-add-it-to-shared-libc.patch \
 	file://0001-nptl-arm-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch \
 	file://0001-nptl-atfork-Hide-pthread_atfork-in-shared-versions.patch \
 	file://0001-librt-Use-nodefaultlibs-instead-of-nostdlib.patch \
-	file://mount.h-update.patch \
 	file://0001-Revert-utent.c-wtent.c-move-functions-from-utxent.c.patch \
 	"
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-Revert-utent.c-wtent.c-move-functions-from-utxent.c.patch b/meta/recipes-core/uclibc/uclibc-git/0001-Revert-utent.c-wtent.c-move-functions-from-utxent.c.patch
index 8c202ac..4ac765c 100644
--- a/meta/recipes-core/uclibc/uclibc-git/0001-Revert-utent.c-wtent.c-move-functions-from-utxent.c.patch
+++ b/meta/recipes-core/uclibc/uclibc-git/0001-Revert-utent.c-wtent.c-move-functions-from-utxent.c.patch
@@ -13,18 +13,18 @@ This reverts commit 84135275cfeebc0b233c1c96eeada4d4178a0b18.
  libc/misc/utmp/wtent.c  |   14 ++-------
  4 files changed, 30 insertions(+), 76 deletions(-)
 
-diff --git a/include/utmp.h b/include/utmp.h
-index cb8e08f..10b75c9 100644
---- a/include/utmp.h
-+++ b/include/utmp.h
-@@ -57,29 +57,37 @@ extern void logwtmp (__const char *__ut_line, __const char *__ut_name,
+Index: git/include/utmp.h
+===================================================================
+--- git.orig/include/utmp.h	2013-01-21 16:37:18.000000000 -0800
++++ git/include/utmp.h	2013-01-21 16:40:56.987583099 -0800
+@@ -56,30 +56,37 @@
  /* Append entry UTMP to the wtmp-like file WTMP_FILE.  */
- extern void updwtmp (__const char *__wtmp_file, __const struct utmp *__utmp)
+ extern void updwtmp (const char *__wtmp_file, const struct utmp *__utmp)
       __THROW;
 +libc_hidden_proto(updwtmp)
  
  /* Change name of the utmp file to be examined.  */
- extern int utmpname (__const char *__file) __THROW;
+ extern int utmpname (const char *__file) __THROW;
 +libc_hidden_proto(utmpname)
  
  /* Read next entry from a utmp-like file.  */
@@ -41,24 +41,25 @@ index cb8e08f..10b75c9 100644
  
  /* Search forward from the current point in the utmp file until the
     next entry with a ut_type matching ID->ut_type.  */
- extern struct utmp *getutid (__const struct utmp *__id) __THROW;
+ extern struct utmp *getutid (const struct utmp *__id) __THROW;
 +libc_hidden_proto(getutid)
  
  /* Search forward from the current point in the utmp file until the
     next entry with a ut_line matching LINE->ut_line.  */
- extern struct utmp *getutline (__const struct utmp *__line) __THROW;
+ extern struct utmp *getutline (const struct utmp *__line) __THROW;
 +libc_hidden_proto(getutline)
  
  /* Write out entry pointed to by UTMP_PTR into the utmp file.  */
- extern struct utmp *pututline (__const struct utmp *__utmp_ptr) __THROW;
+ extern struct utmp *pututline (const struct utmp *__utmp_ptr) __THROW;
+-
 +libc_hidden_proto(pututline)
  
- 
  #if 0 /* def	__USE_MISC */
-diff --git a/libc/misc/utmp/utent.c b/libc/misc/utmp/utent.c
-index a35bb2b..07ca44e 100644
---- a/libc/misc/utmp/utent.c
-+++ b/libc/misc/utmp/utent.c
+ /* Reentrant versions of the file for handling utmp files.  */
+Index: git/libc/misc/utmp/utent.c
+===================================================================
+--- git.orig/libc/misc/utmp/utent.c	2013-01-21 16:37:18.000000000 -0800
++++ git/libc/misc/utmp/utent.c	2013-01-21 16:38:14.035578638 -0800
 @@ -19,9 +19,6 @@
  #include <errno.h>
  #include <string.h>
@@ -69,7 +70,7 @@ index a35bb2b..07ca44e 100644
  #include <not-cancel.h>
  
  #include <bits/uClibc_mutex.h>
-@@ -34,7 +31,7 @@ static const char default_file_name[] = _PATH_UTMP;
+@@ -34,7 +31,7 @@
  static const char *static_ut_name = default_file_name;
  
  /* This function must be called with the LOCK held */
@@ -78,7 +79,7 @@ index a35bb2b..07ca44e 100644
  {
      if (static_fd < 0) {
  	static_fd = open_not_cancel_2(static_ut_name, O_RDWR | O_CLOEXEC);
-@@ -53,24 +50,19 @@ static void __setutent_unlocked(void)
+@@ -53,24 +50,19 @@
      lseek(static_fd, 0, SEEK_SET);
  }
  #if defined __UCLIBC_HAS_THREADS__
@@ -107,7 +108,7 @@ index a35bb2b..07ca44e 100644
  {
      if (static_fd < 0) {
  	__setutent();
-@@ -86,27 +78,19 @@ static struct utmp *__getutent_unlocked(void)
+@@ -86,27 +78,19 @@
      return NULL;
  }
  #if defined __UCLIBC_HAS_THREADS__
@@ -138,7 +139,7 @@ index a35bb2b..07ca44e 100644
  
  static void __endutent(void)
  {
-@@ -117,13 +101,10 @@ static void __endutent(void)
+@@ -117,13 +101,10 @@
      __UCLIBC_MUTEX_UNLOCK(utmplock);
  }
  strong_alias(__endutent,endutent)
@@ -154,7 +155,7 @@ index a35bb2b..07ca44e 100644
  {
      struct utmp *lutmp;
      unsigned type;
-@@ -133,7 +114,7 @@ static struct utmp *__getutid_unlocked(const struct utmp *utmp_entry)
+@@ -133,7 +114,7 @@
      type = utmp_entry->ut_type - 1;
      type /= 4;
  
@@ -163,7 +164,7 @@ index a35bb2b..07ca44e 100644
  	if (type == 0 && lutmp->ut_type == utmp_entry->ut_type)	{
  	    /* one of RUN_LVL, BOOT_TIME, NEW_TIME, OLD_TIME */
  	    return lutmp;
-@@ -147,34 +128,26 @@ static struct utmp *__getutid_unlocked(const struct utmp *utmp_entry)
+@@ -147,34 +128,26 @@
      return NULL;
  }
  #if defined __UCLIBC_HAS_THREADS__
@@ -202,7 +203,7 @@ index a35bb2b..07ca44e 100644
  	if (lutmp->ut_type == USER_PROCESS || lutmp->ut_type == LOGIN_PROCESS) {
  	    if (strncmp(lutmp->ut_line, utmp_entry->ut_line, sizeof(lutmp->ut_line)) == 0) {
  		break;
-@@ -185,13 +158,7 @@ static struct utmp *__getutline(const struct utmp *utmp_entry)
+@@ -185,13 +158,7 @@
      return lutmp;
  }
  strong_alias(__getutline,getutline)
@@ -217,7 +218,7 @@ index a35bb2b..07ca44e 100644
  
  static struct utmp *__pututline(const struct utmp *utmp_entry)
  {
-@@ -200,7 +167,7 @@ static struct utmp *__pututline(const struct utmp *utmp_entry)
+@@ -200,7 +167,7 @@
         the file pointer where they want it, everything will work out. */
      lseek(static_fd, (off_t) - sizeof(struct utmp), SEEK_CUR);
  
@@ -226,7 +227,7 @@ index a35bb2b..07ca44e 100644
  	lseek(static_fd, (off_t) - sizeof(struct utmp), SEEK_CUR);
      else
  	lseek(static_fd, (off_t) 0, SEEK_END);
-@@ -211,13 +178,7 @@ static struct utmp *__pututline(const struct utmp *utmp_entry)
+@@ -211,13 +178,7 @@
      return (struct utmp *)utmp_entry;
  }
  strong_alias(__pututline,pututline)
@@ -241,7 +242,7 @@ index a35bb2b..07ca44e 100644
  
  static int __utmpname(const char *new_ut_name)
  {
-@@ -241,7 +202,4 @@ static int __utmpname(const char *new_ut_name)
+@@ -241,7 +202,4 @@
      return 0; /* or maybe return -(static_ut_name != new_ut_name)? */
  }
  strong_alias(__utmpname,utmpname)
@@ -250,10 +251,10 @@ index a35bb2b..07ca44e 100644
 -strong_alias(__utmpname,utmpxname)
 -#endif
 +libc_hidden_def(utmpname)
-diff --git a/libc/misc/utmp/utxent.c b/libc/misc/utmp/utxent.c
-index 71157cc..a0e80a6 100644
---- a/libc/misc/utmp/utxent.c
-+++ b/libc/misc/utmp/utxent.c
+Index: git/libc/misc/utmp/utxent.c
+===================================================================
+--- git.orig/libc/misc/utmp/utxent.c	2013-01-21 16:37:18.000000000 -0800
++++ git/libc/misc/utmp/utxent.c	2013-01-21 16:38:14.035578638 -0800
 @@ -13,7 +13,6 @@
  #include <utmpx.h>
  #include <utmp.h>
@@ -262,7 +263,7 @@ index 71157cc..a0e80a6 100644
  void setutxent(void)
  {
  	setutent ();
-@@ -49,12 +48,10 @@ int utmpxname (const char *new_ut_name)
+@@ -49,12 +48,10 @@
  	return utmpname (new_ut_name);
  }
  
@@ -275,15 +276,15 @@ index 71157cc..a0e80a6 100644
  
  /* Copy the information in UTMPX to UTMP. */
  void getutmp (const struct utmpx *utmpx, struct utmp *utmp)
-@@ -107,3 +104,4 @@ void getutmpx (const struct utmp *utmp, struct utmpx *utmpx)
+@@ -107,3 +104,4 @@
  	utmpx->ut_time = utmp->ut_time;
  #endif
  }
 +
-diff --git a/libc/misc/utmp/wtent.c b/libc/misc/utmp/wtent.c
-index 9b3ad50..b5e4ee5 100644
---- a/libc/misc/utmp/wtent.c
-+++ b/libc/misc/utmp/wtent.c
+Index: git/libc/misc/utmp/wtent.c
+===================================================================
+--- git.orig/libc/misc/utmp/wtent.c	2013-01-21 16:37:18.000000000 -0800
++++ git/libc/misc/utmp/wtent.c	2013-01-21 16:38:14.035578638 -0800
 @@ -11,9 +11,6 @@
  #include <time.h>
  #include <unistd.h>
@@ -294,7 +295,7 @@ index 9b3ad50..b5e4ee5 100644
  #include <fcntl.h>
  #include <sys/file.h>
  #include <not-cancel.h>
-@@ -36,7 +33,7 @@ void logwtmp (const char *line, const char *name, const char *host)
+@@ -36,7 +33,7 @@
  }
  #endif
  
@@ -303,7 +304,7 @@ index 9b3ad50..b5e4ee5 100644
  {
      int fd;
  
-@@ -49,11 +46,4 @@ static void __updwtmp(const char *wtmp_file, const struct utmp *lutmp)
+@@ -49,11 +46,4 @@
  	}
      }
  }
@@ -316,6 +317,3 @@ index 9b3ad50..b5e4ee5 100644
 -}
 -#endif
 +libc_hidden_def(updwtmp)
--- 
-1.7.9.5
-
diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-nptl-arm-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch b/meta/recipes-core/uclibc/uclibc-git/0001-nptl-arm-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch
index bf6f2c8..407beb6 100644
--- a/meta/recipes-core/uclibc/uclibc-git/0001-nptl-arm-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch
+++ b/meta/recipes-core/uclibc/uclibc-git/0001-nptl-arm-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch
@@ -11,21 +11,19 @@ Upstream-Status: Pending
  libc/sysdeps/linux/arm/Makefile.arch |    4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
-diff --git a/libc/sysdeps/linux/arm/Makefile.arch b/libc/sysdeps/linux/arm/Makefile.arch
-index 5fc3e54..8285b9b 100644
---- a/libc/sysdeps/linux/arm/Makefile.arch
-+++ b/libc/sysdeps/linux/arm/Makefile.arch
-@@ -13,7 +13,9 @@ SSRC := \
+Index: git/libc/sysdeps/linux/arm/Makefile.arch
+===================================================================
+--- git.orig/libc/sysdeps/linux/arm/Makefile.arch	2013-01-21 16:29:25.000000000 -0800
++++ git/libc/sysdeps/linux/arm/Makefile.arch	2013-01-21 16:33:11.575571091 -0800
+@@ -12,7 +12,10 @@
+ 	bsd-_setjmp.S sigrestorer.S mmap64.S \
  	vfork.S clone.S
  
- ifeq ($(UCLIBC_HAS_THREADS_NATIVE),y)
--SSRC += libc-aeabi_read_tp.S libc-thumb_atomics.S
-+SSRC += libc-thumb_atomics.S
-+libc-nonshared-y += $(ARCH_OUT)/libc-aeabi_read_tp.os
-+libc-static-y += $(ARCH_OUT)/libc-aeabi_read_tp.o
- endif
- 
- ifeq ($(UCLIBC_HAS_ADVANCED_REALTIME),y)
--- 
-1.7.9.5
-
+-SSRC-$(UCLIBC_HAS_THREADS_NATIVE) += libc-aeabi_read_tp.S libc-thumb_atomics.S
++SSRC-$(UCLIBC_HAS_THREADS_NATIVE) += libc-thumb_atomics.S
++libc-nonshared-$(UCLIBC_HAS_THREADS_NATIVE) += $(ARCH_OUT)/libc-aeabi_read_tp.os
++libc-static-$(UCLIBC_HAS_THREADS_NATIVE) += $(ARCH_OUT)/libc-aeabi_read_tp.o
++
+ CSRC-$(UCLIBC_HAS_ADVANCED_REALTIME) += posix_fadvise.c
+ CSRC-$(UCLIBC_HAS_CONTEXT_FUNCS) += makecontext.c
+ SSRC-$(UCLIBC_HAS_CONTEXT_FUNCS) += getcontext.S setcontext.S swapcontext.S
diff --git a/meta/recipes-core/uclibc/uclibc-git/define-MSG_CMSG_CLOEXEC.patch b/meta/recipes-core/uclibc/uclibc-git/define-MSG_CMSG_CLOEXEC.patch
deleted file mode 100644
index 4e900f3..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/define-MSG_CMSG_CLOEXEC.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Add definition of MSG_WAITFORONE and MSG_CMSG_CLOEXEC
-
-Upstream-Status: Pending
-
-Index: git/libc/sysdeps/linux/common/bits/socket.h
-===================================================================
---- git.orig/libc/sysdeps/linux/common/bits/socket.h	2012-01-26 23:23:21.537456132 -0800
-+++ git/libc/sysdeps/linux/common/bits/socket.h	2012-01-26 23:25:10.125461388 -0800
-@@ -235,8 +235,15 @@
- #define	MSG_ERRQUEUE	MSG_ERRQUEUE
-     MSG_NOSIGNAL	= 0x4000, /* Do not generate SIGPIPE.  */
- #define	MSG_NOSIGNAL	MSG_NOSIGNAL
--    MSG_MORE		= 0x8000  /* Sender will send more.  */
-+    MSG_MORE		= 0x8000,  /* Sender will send more.  */
- #define	MSG_MORE	MSG_MORE
-+    MSG_WAITFORONE      = 0x10000, /* Wait for at least one packet to return.*/
-+#define MSG_WAITFORONE  MSG_WAITFORONE
-+
-+    MSG_CMSG_CLOEXEC    = 0x40000000    /* Set close_on_exit for file
-+                                           descriptor received through
-+                                           SCM_RIGHTS.  */
-+#define MSG_CMSG_CLOEXEC MSG_CMSG_CLOEXEC
-   };
- 
- 
diff --git a/meta/recipes-core/uclibc/uclibc-git/dup3.patch b/meta/recipes-core/uclibc/uclibc-git/dup3.patch
deleted file mode 100644
index 481f23b..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/dup3.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Implement dup3()
-
-Upstream-Status: Pending
-
-Index: git/libc/sysdeps/linux/common/dup3.c
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ git/libc/sysdeps/linux/common/dup3.c	2012-01-27 07:40:52.802900849 -0800
-@@ -0,0 +1,15 @@
-+/* vi: set sw=4 ts=4: */
-+/*
-+ * dup3() for uClibc
-+ *
-+ * Copyright (C) 2000-2006 Erik Andersen <andersen@uclibc.org>
-+ *
-+ * Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
-+ */
-+
-+#include <sys/syscall.h>
-+#include <unistd.h>
-+
-+
-+_syscall3(int, dup3, int, oldfd, int, newfd, int, flags)
-+libc_hidden_def(dup3)
-Index: git/include/unistd.h
-===================================================================
---- git.orig/include/unistd.h	2012-01-27 01:19:17.521792781 -0800
-+++ git/include/unistd.h	2012-01-27 07:40:03.106898447 -0800
-@@ -512,6 +512,8 @@
- /* Duplicate FD to FD2, closing FD2 and making it open on the same file.  */
- extern int dup2 (int __fd, int __fd2) __THROW;
- libc_hidden_proto(dup2)
-+extern int dup3 (int __fd, int __fd2, int __flags) __THROW;
-+libc_hidden_proto(dup3)
- 
- /* NULL-terminated array of "NAME=VALUE" environment variables.  */
- extern char **__environ;
diff --git a/meta/recipes-core/uclibc/uclibc-git/mount.h-update.patch b/meta/recipes-core/uclibc/uclibc-git/mount.h-update.patch
deleted file mode 100644
index 41a410c..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/mount.h-update.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-
-sync mount.h with glibc
-
-Index: git/include/sys/mount.h
-===================================================================
---- git.orig/include/sys/mount.h	2012-08-23 21:26:51.038825295 -0700
-+++ git/include/sys/mount.h	2012-08-23 21:27:09.914826014 -0700
-@@ -1,5 +1,5 @@
- /* Header file for mounting/unmount Linux filesystems.
--   Copyright (C) 1996,1997,1998,1999,2000,2004 Free Software Foundation, Inc.
-+   Copyright (C) 1996-2000, 2004, 2010 Free Software Foundation, Inc.
-    This file is part of the GNU C Library.
- 
-    The GNU C Library is free software; you can redistribute it and/or
-@@ -47,23 +47,46 @@
- #define MS_REMOUNT	MS_REMOUNT
-   MS_MANDLOCK = 64,		/* Allow mandatory locks on an FS.  */
- #define MS_MANDLOCK	MS_MANDLOCK
--  S_WRITE = 128,		/* Write on file/directory/symlink.  */
--#define S_WRITE		S_WRITE
--  S_APPEND = 256,		/* Append-only file.  */
--#define S_APPEND	S_APPEND
--  S_IMMUTABLE = 512,		/* Immutable file.  */
--#define S_IMMUTABLE	S_IMMUTABLE
-+  MS_DIRSYNC = 128,		/* Directory modifications are synchronous.  */
-+#define MS_DIRSYNC	MS_DIRSYNC
-   MS_NOATIME = 1024,		/* Do not update access times.  */
- #define MS_NOATIME	MS_NOATIME
-   MS_NODIRATIME = 2048,		/* Do not update directory access times.  */
- #define MS_NODIRATIME	MS_NODIRATIME
-   MS_BIND = 4096,		/* Bind directory at different place.  */
- #define MS_BIND		MS_BIND
-+  MS_MOVE = 8192,
-+#define MS_MOVE		MS_MOVE
-+  MS_REC = 16384,
-+#define MS_REC		MS_REC
-+  MS_SILENT = 32768,
-+#define MS_SILENT	MS_SILENT
-+  MS_POSIXACL = 1 << 16,	/* VFS does not apply the umask.  */
-+#define MS_POSIXACL	MS_POSIXACL
-+  MS_UNBINDABLE = 1 << 17,	/* Change to unbindable.  */
-+#define MS_UNBINDABLE	MS_UNBINDABLE
-+  MS_PRIVATE = 1 << 18,		/* Change to private.  */
-+#define MS_PRIVATE	MS_PRIVATE
-+  MS_SLAVE = 1 << 19,		/* Change to slave.  */
-+#define MS_SLAVE	MS_SLAVE
-+  MS_SHARED = 1 << 20,		/* Change to shared.  */
-+#define MS_SHARED	MS_SHARED
-+  MS_RELATIME = 1 << 21,	/* Update atime relative to mtime/ctime.  */
-+#define MS_RELATIME	MS_RELATIME
-+  MS_KERNMOUNT = 1 << 22,	/* This is a kern_mount call.  */
-+#define MS_KERNMOUNT	MS_KERNMOUNT
-+  MS_I_VERSION =  1 << 23,	/* Update inode I_version field.  */
-+#define MS_I_VERSION	MS_I_VERSION
-+  MS_STRICTATIME = 1 << 24,	/* Always perform atime updates.  */
-+#define MS_STRICTATIME	MS_STRICTATIME
-+  MS_ACTIVE = 1 << 30,
-+#define MS_ACTIVE	MS_ACTIVE
-+  MS_NOUSER = 1 << 31
-+#define MS_NOUSER	MS_NOUSER
- };
- 
- /* Flags that can be altered by MS_REMOUNT  */
--#define MS_RMT_MASK (MS_RDONLY|MS_SYNCHRONOUS|MS_MANDLOCK|MS_NOATIME \
--		     |MS_NODIRATIME)
-+#define MS_RMT_MASK (MS_RDONLY|MS_SYNCHRONOUS|MS_MANDLOCK|MS_I_VERSION)
- 
- 
- /* Magic mount flag number. Has to be or-ed to the flag values.  */
-@@ -100,8 +123,10 @@
- #define MNT_FORCE MNT_FORCE
-   MNT_DETACH = 2,		/* Just detach from the tree.  */
- #define MNT_DETACH MNT_DETACH
--  MNT_EXPIRE = 4		/* Mark for expiry.  */
-+  MNT_EXPIRE = 4,		/* Mark for expiry.  */
- #define MNT_EXPIRE MNT_EXPIRE
-+  UMOUNT_NOFOLLOW = 8		/* Don't follow symlink on umount.  */
-+#define UMOUNT_NOFOLLOW UMOUNT_NOFOLLOW
- };
- 
- 
diff --git a/meta/recipes-core/uclibc/uclibc-git/powerpc_copysignl.patch b/meta/recipes-core/uclibc/uclibc-git/powerpc_copysignl.patch
index 3fa10af..ce58583 100644
--- a/meta/recipes-core/uclibc/uclibc-git/powerpc_copysignl.patch
+++ b/meta/recipes-core/uclibc/uclibc-git/powerpc_copysignl.patch
@@ -6,21 +6,21 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Index: git/libc/sysdeps/linux/powerpc/Makefile.arch
 ===================================================================
---- git.orig/libc/sysdeps/linux/powerpc/Makefile.arch
-+++ git/libc/sysdeps/linux/powerpc/Makefile.arch
+--- git.orig/libc/sysdeps/linux/powerpc/Makefile.arch	2013-01-21 16:18:22.000000000 -0800
++++ git/libc/sysdeps/linux/powerpc/Makefile.arch	2013-01-21 16:21:25.363552429 -0800
 @@ -5,7 +5,7 @@
  # Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
  #
  
--CSRC := __syscall_error.c pread_write.c ioctl.c
-+CSRC := __syscall_error.c pread_write.c ioctl.c copysignl.c
+-CSRC-y := __syscall_error.c pread_write.c ioctl.c
++CSRC-y := __syscall_error.c pread_write.c ioctl.c copysignl.c
  
- ifeq ($(UCLIBC_HAS_ADVANCED_REALTIME),y)
- CSRC += posix_fadvise.c posix_fadvise64.c
+ SSRC-y := \
+ 	__longjmp.S setjmp.S bsd-setjmp.S bsd-_setjmp.S brk.S \
 Index: git/libc/sysdeps/linux/powerpc/copysignl.c
 ===================================================================
---- /dev/null
-+++ git/libc/sysdeps/linux/powerpc/copysignl.c
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ git/libc/sysdeps/linux/powerpc/copysignl.c	2013-01-21 16:20:46.807552554 -0800
 @@ -0,0 +1,89 @@
 +/* s_copysignl.c -- long double version of s_copysign.c.
 + * Conversion to long double by Ulrich Drepper,
diff --git a/meta/recipes-core/uclibc/uclibc-git/remove_attribute_optimize_Os.patch b/meta/recipes-core/uclibc/uclibc-git/remove_attribute_optimize_Os.patch
index bee251c..d2a8a81 100644
--- a/meta/recipes-core/uclibc/uclibc-git/remove_attribute_optimize_Os.patch
+++ b/meta/recipes-core/uclibc/uclibc-git/remove_attribute_optimize_Os.patch
@@ -5,9 +5,9 @@ Upstream-Status: Pending
 
 Index: git/libpthread/nptl/pthread_mutex_timedlock.c
 ===================================================================
---- git.orig/libpthread/nptl/pthread_mutex_timedlock.c
-+++ git/libpthread/nptl/pthread_mutex_timedlock.c
-@@ -29,7 +29,9 @@
+--- git.orig/libpthread/nptl/pthread_mutex_timedlock.c	2013-01-21 16:22:20.000000000 -0800
++++ git/libpthread/nptl/pthread_mutex_timedlock.c	2013-01-21 16:24:12.275557670 -0800
+@@ -28,7 +28,9 @@
   * error: can't find a register in class ‘GENERAL_REGS’ while reloading ‘asm’
   */
  int
@@ -19,9 +19,9 @@ Index: git/libpthread/nptl/pthread_mutex_timedlock.c
       const struct timespec *abstime)
 Index: git/libc/sysdeps/linux/powerpc/bits/mathinline.h
 ===================================================================
---- git.orig/libc/sysdeps/linux/powerpc/bits/mathinline.h
-+++ git/libc/sysdeps/linux/powerpc/bits/mathinline.h
-@@ -27,7 +27,7 @@
+--- git.orig/libc/sysdeps/linux/powerpc/bits/mathinline.h	2013-01-21 16:22:20.000000000 -0800
++++ git/libc/sysdeps/linux/powerpc/bits/mathinline.h	2013-01-21 16:24:12.275557670 -0800
+@@ -26,7 +26,7 @@
  #ifdef __cplusplus
  # define __MATH_INLINE __inline
  #else
@@ -32,9 +32,9 @@ Index: git/libc/sysdeps/linux/powerpc/bits/mathinline.h
  #if defined __GNUC__ && !defined _SOFT_FLOAT
 Index: git/libc/sysdeps/linux/alpha/bits/mathinline.h
 ===================================================================
---- git.orig/libc/sysdeps/linux/alpha/bits/mathinline.h
-+++ git/libc/sysdeps/linux/alpha/bits/mathinline.h
-@@ -25,7 +25,7 @@
+--- git.orig/libc/sysdeps/linux/alpha/bits/mathinline.h	2013-01-21 16:22:20.000000000 -0800
++++ git/libc/sysdeps/linux/alpha/bits/mathinline.h	2013-01-21 16:24:12.275557670 -0800
+@@ -24,7 +24,7 @@
  #ifdef __cplusplus
  # define __MATH_INLINE __inline
  #else
@@ -43,24 +43,11 @@ Index: git/libc/sysdeps/linux/alpha/bits/mathinline.h
  #endif
  
  #if defined __USE_ISOC99 && defined __GNUC__ && !__GNUC_PREREQ(3,0)
-Index: git/libc/sysdeps/linux/common/bits/socket.h
-===================================================================
---- git.orig/libc/sysdeps/linux/common/bits/socket.h
-+++ git/libc/sysdeps/linux/common/bits/socket.h
-@@ -302,7 +302,7 @@ extern struct cmsghdr *__cmsg_nxthdr (st
- libc_hidden_proto(__cmsg_nxthdr)
- #ifdef __USE_EXTERN_INLINES
- # ifndef _EXTERN_INLINE
--#  define _EXTERN_INLINE extern __inline
-+#  define _EXTERN_INLINE __extern_inline
- # endif
- _EXTERN_INLINE struct cmsghdr *
- __NTH (__cmsg_nxthdr (struct msghdr *__mhdr, struct cmsghdr *__cmsg))
 Index: git/libc/sysdeps/linux/i386/bits/mathinline.h
 ===================================================================
---- git.orig/libc/sysdeps/linux/i386/bits/mathinline.h
-+++ git/libc/sysdeps/linux/i386/bits/mathinline.h
-@@ -26,7 +26,7 @@
+--- git.orig/libc/sysdeps/linux/i386/bits/mathinline.h	2013-01-21 16:22:20.000000000 -0800
++++ git/libc/sysdeps/linux/i386/bits/mathinline.h	2013-01-21 16:24:12.275557670 -0800
+@@ -25,7 +25,7 @@
  #ifdef __cplusplus
  # define __MATH_INLINE __inline
  #else
@@ -71,9 +58,9 @@ Index: git/libc/sysdeps/linux/i386/bits/mathinline.h
  
 Index: git/libc/sysdeps/linux/ia64/bits/mathinline.h
 ===================================================================
---- git.orig/libc/sysdeps/linux/ia64/bits/mathinline.h
-+++ git/libc/sysdeps/linux/ia64/bits/mathinline.h
-@@ -24,7 +24,7 @@
+--- git.orig/libc/sysdeps/linux/ia64/bits/mathinline.h	2013-01-21 16:22:20.000000000 -0800
++++ git/libc/sysdeps/linux/ia64/bits/mathinline.h	2013-01-21 16:24:12.275557670 -0800
+@@ -23,7 +23,7 @@
  #ifdef __cplusplus
  # define __MATH_INLINE __inline
  #else
@@ -84,9 +71,9 @@ Index: git/libc/sysdeps/linux/ia64/bits/mathinline.h
  #if defined __USE_ISOC99 && defined __GNUC__ && __GNUC__ >= 2
 Index: git/libc/sysdeps/linux/m68k/bits/mathinline.h
 ===================================================================
---- git.orig/libc/sysdeps/linux/m68k/bits/mathinline.h
-+++ git/libc/sysdeps/linux/m68k/bits/mathinline.h
-@@ -92,7 +92,7 @@
+--- git.orig/libc/sysdeps/linux/m68k/bits/mathinline.h	2013-01-21 16:22:20.000000000 -0800
++++ git/libc/sysdeps/linux/m68k/bits/mathinline.h	2013-01-21 16:24:12.275557670 -0800
+@@ -91,7 +91,7 @@
  # ifdef __cplusplus
  #  define __m81_inline		__inline
  # else
@@ -95,7 +82,7 @@ Index: git/libc/sysdeps/linux/m68k/bits/mathinline.h
  # endif
  # define __M81_MATH_INLINES	1
  #endif
-@@ -351,14 +351,14 @@ __inline_functions (long double,l)
+@@ -350,14 +350,14 @@
  /* Note that there must be no whitespace before the argument passed for
     NAME, to make token pasting work correctly with -traditional.  */
  # define __inline_forward_c(rettype, name, args1, args2)	\
@@ -112,24 +99,11 @@ Index: git/libc/sysdeps/linux/m68k/bits/mathinline.h
  {							\
    return __CONCAT(__,name) args2;			\
  }
-Index: git/libc/sysdeps/linux/mips/bits/socket.h
-===================================================================
---- git.orig/libc/sysdeps/linux/mips/bits/socket.h
-+++ git/libc/sysdeps/linux/mips/bits/socket.h
-@@ -307,7 +307,7 @@ extern struct cmsghdr *__cmsg_nxthdr (st
- libc_hidden_proto(__cmsg_nxthdr)
- #ifdef __USE_EXTERN_INLINES
- # ifndef _EXTERN_INLINE
--#  define _EXTERN_INLINE extern __inline
-+#  define _EXTERN_INLINE __extern_inline
- # endif
- _EXTERN_INLINE struct cmsghdr *
- __NTH (__cmsg_nxthdr (struct msghdr *__mhdr, struct cmsghdr *__cmsg))
 Index: git/libc/sysdeps/linux/mips/sys/tas.h
 ===================================================================
---- git.orig/libc/sysdeps/linux/mips/sys/tas.h
-+++ git/libc/sysdeps/linux/mips/sys/tas.h
-@@ -30,7 +30,7 @@ extern int _test_and_set (int *p, int v)
+--- git.orig/libc/sysdeps/linux/mips/sys/tas.h	2013-01-21 16:22:20.000000000 -0800
++++ git/libc/sysdeps/linux/mips/sys/tas.h	2013-01-21 16:24:12.275557670 -0800
+@@ -29,7 +29,7 @@
  #ifdef __USE_EXTERN_INLINES
  
  # ifndef _EXTERN_INLINE
@@ -140,9 +114,9 @@ Index: git/libc/sysdeps/linux/mips/sys/tas.h
  _EXTERN_INLINE int
 Index: git/libc/sysdeps/linux/sparc/bits/mathinline.h
 ===================================================================
---- git.orig/libc/sysdeps/linux/sparc/bits/mathinline.h
-+++ git/libc/sysdeps/linux/sparc/bits/mathinline.h
-@@ -131,7 +131,7 @@
+--- git.orig/libc/sysdeps/linux/sparc/bits/mathinline.h	2013-01-21 16:22:20.000000000 -0800
++++ git/libc/sysdeps/linux/sparc/bits/mathinline.h	2013-01-21 16:24:12.279557671 -0800
+@@ -130,7 +130,7 @@
  # ifdef __cplusplus
  #  define __MATH_INLINE __inline
  # else
@@ -151,24 +125,11 @@ Index: git/libc/sysdeps/linux/sparc/bits/mathinline.h
  # endif  /* __cplusplus */
  
  /* The gcc, version 2.7 or below, has problems with all this inlining
-Index: git/libc/sysdeps/linux/sparc/bits/socket.h
-===================================================================
---- git.orig/libc/sysdeps/linux/sparc/bits/socket.h
-+++ git/libc/sysdeps/linux/sparc/bits/socket.h
-@@ -292,7 +292,7 @@ extern struct cmsghdr *__cmsg_nxthdr (st
- libc_hidden_proto(__cmsg_nxthdr)
- #ifdef __USE_EXTERN_INLINES
- # ifndef _EXTERN_INLINE
--#  define _EXTERN_INLINE extern __inline
-+#  define _EXTERN_INLINE __extern_inline
- # endif
- _EXTERN_INLINE struct cmsghdr *
- __NTH (__cmsg_nxthdr (struct msghdr *__mhdr, struct cmsghdr *__cmsg))
 Index: git/libc/sysdeps/linux/x86_64/bits/mathinline.h
 ===================================================================
---- git.orig/libc/sysdeps/linux/x86_64/bits/mathinline.h
-+++ git/libc/sysdeps/linux/x86_64/bits/mathinline.h
-@@ -25,7 +25,7 @@
+--- git.orig/libc/sysdeps/linux/x86_64/bits/mathinline.h	2013-01-21 16:22:20.000000000 -0800
++++ git/libc/sysdeps/linux/x86_64/bits/mathinline.h	2013-01-21 16:24:12.279557671 -0800
+@@ -24,7 +24,7 @@
  #ifdef __cplusplus
  # define __MATH_INLINE __inline
  #else
-- 
1.7.9.5



