Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id EF81D7F82F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 15:44:23 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id z7so4115941wrl.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Dec 2019 07:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WeQ0RmV6xWyENBkDlRYcKGIOeT1fjJG6lnFQYXNzcjM=;
	b=BabyV1GHFAnDg1/R9Oadqaw14bpG4B+gq1gLHm0i+oymGrSvHyjrDEYCYdCo/cfsdu
	ACxihvAvLxPN5KUa34EQHk40TGAYVOt0g7ZRe1/m/n9CAjKLrWt4rW6UNBV5SCKAXsZk
	32/+cljjn0phnL0PPEjQcqREM3x+AeekKWGlRO/6ZqLJXJnZNHSlFYYdoaDAvAAW3/az
	2hZHzB1LaAvK21ULFoC8fMhTyLdVJpbExX28nVfZWQsx37nJLxKJnnNBA9Dvc+2nS7+S
	KmWEaNKN7Tsgyyc3Fi+9L56QE7+RXtMu1r+l8h6bToY9rnzUkjC9msi72jaSh3u/6ib7
	RVyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=WeQ0RmV6xWyENBkDlRYcKGIOeT1fjJG6lnFQYXNzcjM=;
	b=UXBcNPmBfUF7g3MxzA7iE78VK9+sdlU0xUvDyrP2E9HydslqOOjGowd1jqT9IPj1j6
	nXk0GyTblBtp18veQ0SIcQ6VJfDObIysqL5vJ/yvtww0D6GhZVWapLSmFSC3hKOBMwZ+
	Gbg5q4Sh096UzpF/iOacl0I/2v0nqrR6Dy+nLa6yiOQ6P2WmUi7Rja1fvwIgnRNxuEoq
	2tObS8na/D7pZ0Wrr6vJVijxv7zPDCpbnpPjXlxCS3NFzwTEpfWnmK97IOU15f2hKXVh
	hA9uFYdoFjSp0ofT+ZRJreR2XRUIj+BMHx22wrpJnKuh0mATnMzImHTURmiaQwb9T6X0
	B2zQ==
X-Gm-Message-State: APjAAAW6beDTAVzpWBGFCe3/I6dLpdwwbXoq2LynZ8meNdW5c9H1x5fN
	ElyUYx2zPxlwiW5Sd4H2BBAMnBq/
X-Google-Smtp-Source: APXvYqyx1kC6EWEnNZGszLWHxeh1ii9N/RZGb4ic2Vpt8/JQOBmjXVlbAsZXZ2yIfLurAiL6Ix5/jQ==
X-Received: by 2002:a05:6000:367:: with SMTP id
	f7mr10656391wrf.174.1575560664112; 
	Thu, 05 Dec 2019 07:44:24 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id z64sm223330wmg.30.2019.12.05.07.44.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 07:44:23 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2019 16:43:57 +0100
Message-Id: <20191205154357.121346-24-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191205154357.121346-1-alex.kanavin@gmail.com>
References: <20191205154357.121346-1-alex.kanavin@gmail.com>
Subject: [PATCH 24/24] sysvinit: update 2.88dsf -> 2.96
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
X-List-Received-Date: Thu, 05 Dec 2019 15:44:24 -0000

Remove 0001-This-fixes-an-issue-that-clang-reports-about-mutlipl.patch,
the problem has been fixed upstream.

Rebase the other patches.

License-Update: copyright years
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...sue-that-clang-reports-about-mutlipl.patch | 52 ------------
 ...acros.h-for-major-minor-defines-in-g.patch | 14 +--
 .../sysvinit/sysvinit/crypt-lib.patch         | 31 ++++---
 .../sysvinit/sysvinit/install.patch           | 47 ++++++----
 .../sysvinit/pidof-add-m-option.patch         | 64 +++++++-------
 .../sysvinit/sysvinit/realpath.patch          | 85 +++++++------------
 .../{sysvinit_2.88dsf.bb => sysvinit_2.96.bb} | 20 +++--
 7 files changed, 135 insertions(+), 178 deletions(-)
 delete mode 100644 meta/recipes-core/sysvinit/sysvinit/0001-This-fixes-an-issue-that-clang-reports-about-mutlipl.patch
 rename meta/recipes-core/sysvinit/{sysvinit_2.88dsf.bb => sysvinit_2.96.bb} (88%)

diff --git a/meta/recipes-core/sysvinit/sysvinit/0001-This-fixes-an-issue-that-clang-reports-about-mutlipl.patch b/meta/recipes-core/sysvinit/sysvinit/0001-This-fixes-an-issue-that-clang-reports-about-mutlipl.patch
deleted file mode 100644
index f35c15cb310..00000000000
--- a/meta/recipes-core/sysvinit/sysvinit/0001-This-fixes-an-issue-that-clang-reports-about-mutlipl.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 36ac97bfe51797458442a6035219a504a42e703a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 21 Aug 2015 10:56:40 -0700
-Subject: [PATCH] This fixes an issue that clang reports about mutliple output
- files
-
-Issue is that we are passing .h file to link step as seen below.
-
-| arm-oe-linux-gnueabi-clang  -march=armv7-a -mthumb  -mfloat-abi=hard
--mfpu=neon-vfpv4 -mtune=cortex-a7 -D__extern_always_inline=inline
--no-integrated-as
---sysroot=/mnt/home/kraj/work/angstrom/sources/openembedded-core/build/tmp-glibc/sysroots/raspberrypi2
--Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed  halt.o ifdown.o hddown.o
-utmp.o reboot.h   -o halt
-| clang-3.7: error: cannot specify -o when generating multiple output
-files
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/Makefile | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/Makefile b/src/Makefile
-index e77ed5f..a6f9f40 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -103,9 +103,9 @@ all:		$(BIN) $(SBIN) $(USRBIN)
- init:		LDLIBS += $(INITLIBS) $(STATIC)
- init:		init.o init_utmp.o
- 
--halt:		halt.o ifdown.o hddown.o utmp.o reboot.h
-+halt:		halt.o ifdown.o hddown.o utmp.o
- 
--last:		last.o oldutmp.h
-+last:		last.o
- 
- mesg:		mesg.o
- 
-@@ -120,7 +120,7 @@ sulogin:	sulogin.o
- 
- wall:		dowall.o wall.o
- 
--shutdown:	dowall.o shutdown.o utmp.o reboot.h
-+shutdown:	dowall.o shutdown.o utmp.o
- 
- bootlogd:	LDLIBS += -lutil
- bootlogd:	bootlogd.o
--- 
-2.1.4
-
diff --git a/meta/recipes-core/sysvinit/sysvinit/0001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch b/meta/recipes-core/sysvinit/sysvinit/0001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch
index e13ac9d06bc..60fbd87534b 100644
--- a/meta/recipes-core/sysvinit/sysvinit/0001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch
+++ b/meta/recipes-core/sysvinit/sysvinit/0001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch
@@ -1,4 +1,4 @@
-From 3c29a86f351ea4827dc445bb8e6cb774543c9be6 Mon Sep 17 00:00:00 2001
+From c710a3accd1fabdb671274e1a458405282d51e0c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 6 Aug 2018 15:38:58 -0700
 Subject: [PATCH] include sys/sysmacros.h for major/minor definitions
@@ -13,10 +13,10 @@ Upstream-Status: Pending
  3 files changed, 3 insertions(+)
 
 diff --git a/src/bootlogd.c b/src/bootlogd.c
-index 570d382..68d62f3 100644
+index 787db87..8b07903 100644
 --- a/src/bootlogd.c
 +++ b/src/bootlogd.c
-@@ -35,6 +35,7 @@
+@@ -29,6 +29,7 @@
  #include <sys/types.h>
  #include <sys/time.h>
  #include <sys/stat.h>
@@ -25,7 +25,7 @@ index 570d382..68d62f3 100644
  #include <sys/utsname.h>
  #include <time.h>
 diff --git a/src/mountpoint.c b/src/mountpoint.c
-index 9e3dd9c..91f74ed 100644
+index 5f20522..94df7a1 100644
 --- a/src/mountpoint.c
 +++ b/src/mountpoint.c
 @@ -25,6 +25,7 @@
@@ -37,7 +37,7 @@ index 9e3dd9c..91f74ed 100644
  #include <stdlib.h>
  #include <string.h>
 diff --git a/src/shutdown.c b/src/shutdown.c
-index 7e997da..17de58d 100644
+index b744a2c..40b7faf 100644
 --- a/src/shutdown.c
 +++ b/src/shutdown.c
 @@ -40,6 +40,7 @@
@@ -46,5 +46,5 @@ index 7e997da..17de58d 100644
  #include <sys/stat.h>
 +#include <sys/sysmacros.h>
  #include <sys/wait.h>
- #include <time.h>
- #include <string.h>
+ #ifdef __linux__
+ #include <sys/sysmacros.h>   /* brought in my LFS patch */
diff --git a/meta/recipes-core/sysvinit/sysvinit/crypt-lib.patch b/meta/recipes-core/sysvinit/sysvinit/crypt-lib.patch
index 7b342901e1b..bd4444b81ba 100644
--- a/meta/recipes-core/sysvinit/sysvinit/crypt-lib.patch
+++ b/meta/recipes-core/sysvinit/sysvinit/crypt-lib.patch
@@ -1,3 +1,8 @@
+From 7276275d9a08d5ae268fb263027bbc60bc0ab2e8 Mon Sep 17 00:00:00 2001
+From: Jeff Dike <jdike@x86_64.user-mode-linux.org>
+Date: Wed, 14 Jul 2010 14:35:52 -0400
+Subject: [PATCH] sysvinit - Remove sulogin dependency on /usr/lib*/libcrypt.a
+
 Upstream-Status: Inappropriate [configuration]
 
 # The src Makefile was checking for libcrypt.a on the host, not in the
@@ -5,21 +10,27 @@ Upstream-Status: Inappropriate [configuration]
 # and uses it if it's there.
 # - jdike@linux.intel.com
 
-Index: sysvinit-2.88dsf/src/Makefile
-===================================================================
---- sysvinit-2.88dsf.orig/src/Makefile
-+++ sysvinit-2.88dsf/src/Makefile
-@@ -85,9 +85,13 @@ else
+---
+ src/Makefile | 9 ++-------
+ 1 file changed, 2 insertions(+), 7 deletions(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index 1380d7f..628e77f 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -97,13 +97,8 @@ else
  endif
  
  # Additional libs for GNU libc.
+-ifneq ($(wildcard /usr/lib*/libcrypt.*),)
+-  SULOGINLIBS	+= -lcrypt
+-endif
+-
+-# Additional libs for GNU libc / multiarch on Debian based systems.
+-ifneq ($(wildcard /usr/lib/*/libcrypt.*),)
+-  SULOGINLIBS	+= -lcrypt
 +ifneq ($(LCRYPT),)
 +  SULOGINLIBS	+= $(LCRYPT)
-+else
- ifneq ($(wildcard /usr/lib*/libcrypt.a),)
-   SULOGINLIBS	+= -lcrypt
  endif
-+endif
  
  all:		$(BIN) $(SBIN) $(USRBIN)
- 
diff --git a/meta/recipes-core/sysvinit/sysvinit/install.patch b/meta/recipes-core/sysvinit/sysvinit/install.patch
index 6c4225a678d..2930fb01953 100644
--- a/meta/recipes-core/sysvinit/sysvinit/install.patch
+++ b/meta/recipes-core/sysvinit/sysvinit/install.patch
@@ -1,10 +1,19 @@
+From b6cc66ab245ceb6bca0116dff7a41f6d7677b96a Mon Sep 17 00:00:00 2001
+From: Qing He <qing.he@intel.com>
+Date: Fri, 18 Jun 2010 09:40:30 +0800
+Subject: [PATCH] sysvinit: upgrade to version 2.88dsf
+
 Upstream-Status: Pending
 
+---
+ src/Makefile | 53 +++++++++++++++++++++++++++++-----------------------
+ 1 file changed, 30 insertions(+), 23 deletions(-)
+
 diff --git a/src/Makefile b/src/Makefile
-index e2b8028..3e11e92 100644
+index 9f9f09e..1380d7f 100644
 --- a/src/Makefile
 +++ b/src/Makefile
-@@ -65,7 +65,14 @@ else
+@@ -77,7 +77,14 @@ else
    INSTALL_DATA	= install -m 644
  endif
  INSTALL_DIR	= install -m 755 -d
@@ -20,10 +29,10 @@ index e2b8028..3e11e92 100644
  
  ifeq ($(WITH_SELINUX),yes)
    SELINUX_DEF	=  -DWITH_SELINUX
-@@ -138,39 +145,39 @@ clobber:	cleanobjs
+@@ -189,42 +196,42 @@ clobber:	cleanobjs
  distclean:	clobber
  
- install:
+ install:	all
 -		$(INSTALL_DIR) $(ROOT)/bin/ $(ROOT)/sbin/
 -		$(INSTALL_DIR) $(ROOT)/usr/bin/
 +		$(INSTALL_DIR) $(ROOT)$(base_bindir)/ $(ROOT)$(base_sbindir)/
@@ -40,16 +49,14 @@ index e2b8028..3e11e92 100644
 -			$(INSTALL_EXEC) $$i $(ROOT)/usr/bin/ ; \
 +			$(INSTALL_EXEC) $$i $(ROOT)$(bindir)/ ; \
  		done
--		# $(INSTALL_DIR) $(ROOT)/etc/
--		# $(INSTALL_EXEC) initscript.sample $(ROOT)/etc/
+ 		# $(INSTALL_DIR) $(ROOT)/etc/
+ 		# $(INSTALL_EXEC) ../doc/initscript.sample $(ROOT)/etc/
 -		ln -sf halt $(ROOT)/sbin/reboot
 -		ln -sf halt $(ROOT)/sbin/poweroff
 -		ln -sf init $(ROOT)/sbin/telinit
 -		ln -sf /sbin/killall5 $(ROOT)/bin/pidof
 -		if [ ! -f $(ROOT)/usr/bin/lastb ]; then \
 -			ln -sf last $(ROOT)/usr/bin/lastb; \
-+		# $(INSTALL_DIR) $(ROOT)$(sysconfdir)/
-+		# $(INSTALL_EXEC) initscript.sample $(ROOT)$(sysconfdir)/
 +		ln -sf halt $(ROOT)$(base_sbindir)/reboot
 +		ln -sf halt $(ROOT)$(base_sbindir)/poweroff
 +		ln -sf init $(ROOT)$(base_sbindir)/telinit
@@ -67,17 +74,23 @@ index e2b8028..3e11e92 100644
 +		$(INSTALL_DIR) $(ROOT)$(mandir)/man1/
 +		$(INSTALL_DIR) $(ROOT)$(mandir)/man5/
 +		$(INSTALL_DIR) $(ROOT)$(mandir)/man8/
- 		for i in $(MAN1); do \
--			$(INSTALL_DATA) ../man/$$i $(ROOT)$(MANDIR)/man1/; \
-+			$(INSTALL_DATA) ../man/$$i $(ROOT)$(mandir)/man1/; \
+ 		for man in $(MAN1); do \
+-			$(INSTALL_DATA) ../man/$$man $(ROOT)$(MANDIR)/man1/; \
+-			sed -i "1{ $(MANDB); }" $(ROOT)$(MANDIR)/man1/$$man ; \
++			$(INSTALL_DATA) ../man/$$man $(ROOT)$(mandir)/man1/; \
++			sed -i "1{ $(MANDB); }" $(ROOT)$(mandir)/man1/$$man ; \
  		done
- 		for i in $(MAN5); do \
--			$(INSTALL_DATA) ../man/$$i $(ROOT)$(MANDIR)/man5/; \
-+			$(INSTALL_DATA) ../man/$$i $(ROOT)$(mandir)/man5/; \
+ 		for man in $(MAN5); do \
+-			$(INSTALL_DATA) ../man/$$man $(ROOT)$(MANDIR)/man5/; \
+-			sed -i "1{ $(MANDB); }" $(ROOT)$(MANDIR)/man5/$$man ; \
++			$(INSTALL_DATA) ../man/$$man $(ROOT)$(mandir)/man5/; \
++			sed -i "1{ $(MANDB); }" $(ROOT)$(mandir)/man5/$$man ; \
  		done
- 		for i in $(MAN8); do \
--			$(INSTALL_DATA) ../man/$$i $(ROOT)$(MANDIR)/man8/; \
-+			$(INSTALL_DATA) ../man/$$i $(ROOT)$(mandir)/man8/; \
+ 		for man in $(MAN8); do \
+-			$(INSTALL_DATA) ../man/$$man $(ROOT)$(MANDIR)/man8/; \
+-			sed -i "1{ $(MANDB); }" $(ROOT)$(MANDIR)/man8/$$man ; \
++			$(INSTALL_DATA) ../man/$$man $(ROOT)$(mandir)/man8/; \
++			sed -i "1{ $(MANDB); }" $(ROOT)$(mandir)/man8/$$man ; \
  		done
  ifeq ($(ROOT),)
  		#
diff --git a/meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch b/meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch
index 5b5dfdc0012..494aa0e0126 100644
--- a/meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch
+++ b/meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch
@@ -1,4 +1,7 @@
-pidof: add -m option
+From 6c490ea6579a132fabb7dbd25387bb521f820371 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 24 Jul 2013 17:07:22 +0800
+Subject: [PATCH] pidof: add -m option
 
 When used with -o, will also omit any processes that have the same
 argv[0] and argv[1] as any explicitly omitted process ids. This can be
@@ -11,23 +14,25 @@ Upstream-Status: backport
 Imported patch from: https://bugzilla.redhat.com/attachment.cgi?id=658166
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 ---
- man/pidof.8    |  6 ++++++
- src/killall5.c | 62 +++++++++++++++++++++++++++++++++++++++++++++++++++++++---
+ man/pidof.8    |  6 +++++
+ src/killall5.c | 62 +++++++++++++++++++++++++++++++++++++++++++++++---
  2 files changed, 65 insertions(+), 3 deletions(-)
 
 diff --git a/man/pidof.8 b/man/pidof.8
+index ebe5f55..2fdc4d3 100644
 --- a/man/pidof.8
 +++ b/man/pidof.8
-@@ -24,6 +24,7 @@ pidof -- find the process ID of a running program.
- .RB [ \-c ]
+@@ -25,6 +25,7 @@ pidof -- find the process ID of a running program.
  .RB [ \-n ]
  .RB [ \-x ]
+ .RB [ \-z ]
 +.RB [ \-m ]
  .RB [ \-o
- .IR omitpid[,omitpid..] ]
+ .IR omitpid[,omitpid...] ]
  .RB [ \-o
-@@ -63,6 +64,11 @@ shells running the named scripts.
+@@ -76,6 +77,11 @@ is shown. The default separator is a space.
  Tells \fIpidof\fP to omit processes with that process id. The special
  pid \fB%PPID\fP can be used to name the parent process of the \fIpidof\fP
  program, in other words the calling shell or shell script.
@@ -40,10 +45,10 @@ diff --git a/man/pidof.8 b/man/pidof.8
  .TP
  .B 0
 diff --git a/src/killall5.c b/src/killall5.c
-index 5937d98..e73885e 100644
+index 8b5cb38..a664954 100644
 --- a/src/killall5.c
 +++ b/src/killall5.c
-@@ -118,6 +118,7 @@ typedef struct _s_nfs
+@@ -126,6 +126,7 @@ typedef struct _s_nfs
  
  /* List of processes. */
  PROC *plist;
@@ -51,7 +56,7 @@ index 5937d98..e73885e 100644
  
  /* List of processes to omit. */
  OMIT *omit;
-@@ -345,6 +346,20 @@ static void clear_mnt(void)
+@@ -361,6 +362,20 @@ static void clear_mnt(void)
  	}
  }
  
@@ -70,9 +75,9 @@ index 5937d98..e73885e 100644
 +}
 +
  /*
-  *     Check if path is ia shadow off a NFS partition.
+  *     Check if path is a shadow off a NFS partition.
   */
-@@ -452,6 +467,7 @@ int readproc(int do_stat)
+@@ -486,6 +501,7 @@ int readproc(int do_stat)
  	DIR		*dir;
  	FILE		*fp;
  	PROC		*p, *n;
@@ -80,7 +85,7 @@ index 5937d98..e73885e 100644
  	struct dirent	*d;
  	struct stat	st;
  	char		path[PATH_MAX+1];
-@@ -624,6 +640,17 @@ int readproc(int do_stat)
+@@ -733,6 +749,17 @@ int readproc(int do_stat)
  		p->next = plist;
  		plist = p;
  		p->pid = pid;
@@ -98,7 +103,7 @@ index 5937d98..e73885e 100644
  	}
  	closedir(dir);
  
-@@ -813,6 +840,26 @@ PIDQ_HEAD *pidof(char *prog)
+@@ -944,6 +971,26 @@ PIDQ_HEAD *pidof(char *prog)
  	return q;
  }
  
@@ -125,42 +130,42 @@ index 5937d98..e73885e 100644
  /* Give usage message and exit. */
  void usage(void)
  {
-@@ -845,6 +892,7 @@ void nsyslog(int pri, char *fmt, ...)
- #define PIDOF_SINGLE	0x01
+@@ -994,6 +1041,7 @@ void nsyslog(int pri, char *fmt, ...)
  #define PIDOF_OMIT	0x02
  #define PIDOF_NETFS	0x04
+ #define PIDOF_QUIET     0x08
 +#define PIDOF_OMIT_OMIT_MATCHES	0x08
  
  /*
   *	Pidof functionality.
-@@ -861,6 +909,7 @@ int main_pidof(int argc, char **argv)
- 	struct stat	st;
+@@ -1011,6 +1059,7 @@ int main_pidof(int argc, char **argv)
  	char		tmp[512];
+         char            sep = ' ';
  
 +	olist = (PROC*)0;
  	omit = (OMIT*)0;
  	nlist = (NFS*)0;
  	opterr = 0;
-@@ -868,7 +917,7 @@ int main_pidof(int argc, char **argv)
+@@ -1018,7 +1067,7 @@ int main_pidof(int argc, char **argv)
  	if ((token = getenv("PIDOF_NETFS")) && (strcmp(token,"no") != 0))
  		flags |= PIDOF_NETFS;
  
--	while ((opt = getopt(argc,argv,"hco:sxn")) != EOF) switch (opt) {
-+	while ((opt = getopt(argc,argv,"hcmo:sxn")) != EOF) switch (opt) {
+-	while ((opt = getopt(argc,argv,"qhco:d:sxzn")) != EOF) switch (opt) {
++	while ((opt = getopt(argc,argv,"qhcmo:d:sxzn")) != EOF) switch (opt) {
  		case '?':
  			nsyslog(LOG_ERR,"invalid options on command line!\n");
  			closelog();
-@@ -907,6 +956,9 @@ int main_pidof(int argc, char **argv)
- 		case 'x':
- 			scripts_too++;
- 			break;
+@@ -1069,6 +1118,9 @@ int main_pidof(int argc, char **argv)
+                 case 'z':
+                         list_dz_processes = TRUE;
+                         break;
 +		case 'm':
 +			flags |= PIDOF_OMIT_OMIT_MATCHES;
 +			break;
  		case 'n':
  			flags |= PIDOF_NETFS;
  			break;
-@@ -938,10 +990,13 @@ int main_pidof(int argc, char **argv)
+@@ -1100,10 +1152,13 @@ int main_pidof(int argc, char **argv)
  			pid_t spid = 0;
  			while ((p = get_next_from_pid_q(q))) {
  				if ((flags & PIDOF_OMIT) && omit) {
@@ -176,14 +181,11 @@ index 5937d98..e73885e 100644
  					}
  
  					/*
-@@ -977,6 +1032,7 @@ int main_pidof(int argc, char **argv)
- 	if (!first)
+@@ -1145,6 +1200,7 @@ int main_pidof(int argc, char **argv)
  		printf("\n");
+         }
  
 +	clear_omit();
  	clear_mnt();
  
  	closelog();
--- 
-1.8.1.2
-
diff --git a/meta/recipes-core/sysvinit/sysvinit/realpath.patch b/meta/recipes-core/sysvinit/sysvinit/realpath.patch
index 5e0dca3bf11..859fd8baadd 100644
--- a/meta/recipes-core/sysvinit/sysvinit/realpath.patch
+++ b/meta/recipes-core/sysvinit/sysvinit/realpath.patch
@@ -1,4 +1,8 @@
-Fix build on musl use realpath() API its available on all libcs
+From eb158c97f19d473d01befe96359a7f93ae834517 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 19 Nov 2015 00:10:03 +0000
+Subject: [PATCH] Fix build on musl use realpath() API its available on all
+ libcs
 
 realpath() API doesnt work on systems with PATH_MAX set to be unlimited e.g. GNU/Hurd
 However for Linux it should always work
@@ -7,52 +11,17 @@ Upstream-Status: Inappropriate[Linux specific]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Index: sysvinit-2.88dsf/src/ifdown.c
-===================================================================
---- sysvinit-2.88dsf.orig/src/ifdown.c	2010-03-23 07:37:01.000000000 -0700
-+++ sysvinit-2.88dsf/src/ifdown.c	2014-04-02 00:43:43.675437029 -0700
-@@ -26,11 +26,11 @@
- #include <unistd.h>
- #include <time.h>
- #include <string.h>
-+#include <errno.h>
- 
- #include <sys/ioctl.h>
- #include <sys/socket.h>
- #include <sys/time.h>
--#include <sys/errno.h>
- 
- #include <net/if.h>
- #include <netinet/in.h>
-Index: sysvinit-2.88dsf/src/init.c
-===================================================================
---- sysvinit-2.88dsf.orig/src/init.c	2014-04-02 00:42:10.488770162 -0700
-+++ sysvinit-2.88dsf/src/init.c	2014-04-02 00:42:59.432103823 -0700
-@@ -49,6 +49,7 @@
- #include <utmp.h>
- #include <ctype.h>
- #include <stdarg.h>
-+#include <sys/ttydefaults.h>
- #include <sys/syslog.h>
- #include <sys/time.h>
- 
-Index: sysvinit-2.88dsf/src/mountpoint.c
-===================================================================
---- sysvinit-2.88dsf.orig/src/mountpoint.c	2009-09-10 01:28:49.000000000 -0700
-+++ sysvinit-2.88dsf/src/mountpoint.c	2014-04-02 00:44:18.248770942 -0700
-@@ -23,6 +23,7 @@
-  *		Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
-  */
- 
-+#include <sys/types.h>
- #include <sys/stat.h>
- #include <unistd.h>
- #include <stdlib.h>
-Index: sysvinit-2.88dsf/src/killall5.c
-===================================================================
---- sysvinit-2.88dsf.orig/src/killall5.c	2014-03-26 00:49:52.982668074 -0700
-+++ sysvinit-2.88dsf/src/killall5.c	2014-04-02 00:46:45.838771653 -0700
-@@ -846,9 +846,9 @@
+---
+ src/killall5.c   | 4 ++--
+ src/mountpoint.c | 1 +
+ src/wall.c       | 1 +
+ 3 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/killall5.c b/src/killall5.c
+index a664954..9798423 100644
+--- a/src/killall5.c
++++ b/src/killall5.c
+@@ -977,9 +977,9 @@ int matches(PROC *o, PROC *p)
  	char *oargv1, *pargv1;
  	if ((o->argv0 && p->argv0 && !strcmp(o->argv0,p->argv0))) {
  		if (o->argv1 && p->argv1) {
@@ -64,14 +33,26 @@ Index: sysvinit-2.88dsf/src/killall5.c
  				pargv1 = strdup(p->argv1);
  			if (! strcmp(oargv1, pargv1)) {
  				ret = 1;
-Index: sysvinit-2.88dsf/src/wall.c
-===================================================================
---- sysvinit-2.88dsf.orig/src/wall.c	2009-11-22 14:05:53.000000000 -0800
-+++ sysvinit-2.88dsf/src/wall.c	2014-04-02 00:49:15.258772217 -0700
-@@ -29,6 +29,7 @@
+diff --git a/src/mountpoint.c b/src/mountpoint.c
+index b24335e..5f20522 100644
+--- a/src/mountpoint.c
++++ b/src/mountpoint.c
+@@ -23,6 +23,7 @@
+  *		Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+  */
+ 
++#include <sys/types.h>
+ #include <sys/stat.h>
  #include <unistd.h>
+ #include <stdlib.h>
+diff --git a/src/wall.c b/src/wall.c
+index d3a2c70..00826e9 100644
+--- a/src/wall.c
++++ b/src/wall.c
+@@ -30,6 +30,7 @@
  #include <pwd.h>
  #include <syslog.h>
+ #include <sys/types.h>
 +#include <time.h>
  #include "init.h"
  
diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit_2.96.bb
similarity index 88%
rename from meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
rename to meta/recipes-core/sysvinit/sysvinit_2.96.bb
index 8fd6df9d6b1..2b146b1ef8f 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.96.bb
@@ -4,16 +4,15 @@ HOMEPAGE = "http://savannah.nongnu.org/projects/sysvinit/"
 SECTION = "base"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
-                    file://COPYRIGHT;endline=15;md5=349c872e0066155e1818b786938876a4"
-PR = "r14"
+                    file://COPYRIGHT;endline=15;md5=a1d3b3526501d3546d530bbe6ab6cdbe \
+                    "
 
 RDEPENDS_${PN} = "${PN}-inittab"
 
-SRC_URI = "${SAVANNAH_GNU_MIRROR}/sysvinit/sysvinit-${PV}.tar.bz2 \
+SRC_URI = "${SAVANNAH_GNU_MIRROR}/sysvinit/sysvinit-${PV}.tar.xz \
            file://install.patch \
            file://crypt-lib.patch \
            file://pidof-add-m-option.patch \
-           file://0001-This-fixes-an-issue-that-clang-reports-about-mutlipl.patch \
            file://realpath.patch \
            file://0001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch \
            file://rcS-default \
@@ -21,10 +20,9 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/sysvinit/sysvinit-${PV}.tar.bz2 \
            file://rcS \
            file://bootlogd.init \
            file://01_bootlogd \
-"
-
-SRC_URI[md5sum] = "6eda8a97b86e0a6f59dabbf25202aa6f"
-SRC_URI[sha256sum] = "60bbc8c1e1792056e23761d22960b30bb13eccc2cabff8c7310a01f4d5df1519"
+           "
+SRC_URI[md5sum] = "48cebffebf2a96ab09bec14bf9976016"
+SRC_URI[sha256sum] = "2a2e26b72aa235a23ab1c8471005f890309ce1196c83fbc9413c57b9ab62b587"
 
 S = "${WORKDIR}/sysvinit-${PV}"
 B = "${S}/src"
@@ -81,7 +79,8 @@ EXTRA_OEMAKE += "'base_bindir=${base_bindir}' \
 		 'sbindir=${sbindir}' \
 		 'sysconfdir=${sysconfdir}' \
 		 'includedir=${includedir}' \
-		 'mandir=${mandir}'"
+		 'mandir=${mandir}' \
+                 MNTPOINT=yes"
 
 do_install () {
 	oe_runmake 'ROOT=${D}' install
@@ -107,4 +106,7 @@ do_install () {
 
 	chown root:shutdown ${D}${base_sbindir}/halt ${D}${base_sbindir}/shutdown
 	chmod o-x,u+s ${D}${base_sbindir}/halt ${D}${base_sbindir}/shutdown
+
+        # Already provided by e2fsprogs; sysvinit's version is a copy from there
+        rm ${D}${base_sbindir}/logsave
 }
-- 
2.17.1


