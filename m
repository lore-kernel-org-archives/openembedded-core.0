Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.4])
 by mx.groups.io with SMTP id smtpd.web11.1072.1623888686167272390
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jun 2021 17:11:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=TAjo6JZn;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.4, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623888683; i=@fujitsu.com;
	bh=RVDRlR+NXmkHrjj8rGOEVkI3UuqhwpnXSphjdZoAaI0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=TAjo6JZne6JxydNGSR8xWSndsP1s+jPmgSr+tDKMvFRufXyaYpymZOIPX/Dxksxzf
	 CoBw6u+c2x162auwP1LVTQm32ouH7Al1VrRwjISRcmFFaP0WMbXHFPwL7BNdCGKR+W
	 MV2kLekMccObpg27lb4tUF3n2bSNTSPXRKkR7YWyLWRQWlXgU4uC+FvMbRvS55MdaX
	 9TIg0c8XnCe8DDgqiqVwct6BQAyoaDwR/toqsVkO6o3HgF7bHABKRhNEq3I2yb01di
	 dd+BhxLLNSjiqaa5LZKE6vKdTC2zUQUSrx1Psxx+JOVRZM+yfAxtHmLadRjr4m2j0D
	 SOvEPM+8S1Fsg==
Received: from [100.112.195.193] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.symcld.net id AE/F6-45811-B239AC06; Thu, 17 Jun 2021 00:11:23 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8MxRVdr8qk
  Egz99+hZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bX2zPYCy40M1Y8fzWHpYFxSX4XIyeHkMAs
  Jok1L127GLmA7BOMEg/nb2EHSbAJqElMv3WDtYuRg0NEQE/i6j9RkDCzgIrEi989YCXCAtYS7
  7YcYwaxWQRUJU51bmYCsXkFnCQ2rXvAAmJLCChITHn4nhkiLihxcuYTFog5EhIHX7xghqhRlJ
  h9uRmqvkLi9eFLzBMYeWchaZmFpGUBI9MqRoukosz0jJLcxMwcXUMDA11DQyNdQ0sgNjLTS6z
  STdRLLdUtTy0u0TXUSywv1iuuzE3OSdHLSy3ZxAgMr5SCA3U7GB+8/qB3iFGSg0lJlLe581SC
  EF9SfkplRmJxRnxRaU5q8SFGGQ4OJQle/olAOcGi1PTUirTMHGCow6QlOHiURHg/9wOleYsLE
  nOLM9MhUqcYYzne/Vy8iJnjzdolQPItmGy7dxdItoPJmQsOrmbmmAUm77cfApIPQKQQS15+Xq
  qUOO9LkJ0CIEMzSvPgVsLi+hKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd77IFN4MvNK4C5
  7BXQ0E9DRbUJgR5ckIqSkGpj6Gte5Lwxqytldofwn/JKMQ/uBoyGN7WGs27i32De6imi7L59b
  b/VK92H762cv81t6Gy5vXNWjoRFZ9jyoLP6RZfkvxr0T+lg6zh3OO7Qz4Kjj2/W7d+pHKL7+K
  LNMpVPb1UA+Pmn3lhkeRkm+EXNvXlP6FlzpturEtjU/nz2cw/LHY//27FkNCqzvV4qvfsr6oo
  zt/PoQm2OdwQum7Pav3B11yDbwT9JjodpP6/95tmRLcUzWnHNGwjovbLvXhRUa9Q3mRyYk6i5
  +uTIl37Ir62Wm9aE4hlrJmNi5Sxt3puzuflhk+1Bjt76j6CGB2FSel3MFTv4QFyqM+uCfM+3f
  tC9LlPb6qO39cuyNrL4SS3FGoqEWc1FxIgBJFpylZgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-271.messagelabs.com!1623888682!216988!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31149 invoked from network); 17 Jun 2021 00:11:22 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-8.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Jun 2021 00:11:22 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15H0BMVa005539
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jun 2021 01:11:22 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 17 Jun 2021 01:11:19 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] blktrace: upgrade 1.2.0 -> 1.3.0
Date: Thu, 17 Jun 2021 08:10:58 +0800
Message-ID: <1623888661-63658-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

CVE-2018-10689.patch
ldflags.patch
make-btt-scripts-python3-ready.patch
removed since they're included in 1.3.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../blktrace/blktrace/CVE-2018-10689.patch    | 150 -------------
 .../blktrace/blktrace/ldflags.patch           | 114 ----------
 .../make-btt-scripts-python3-ready.patch      | 197 ------------------
 meta/recipes-kernel/blktrace/blktrace_git.bb  |  10 +-
 4 files changed, 3 insertions(+), 468 deletions(-)
 delete mode 100644 meta/recipes-kernel/blktrace/blktrace/CVE-2018-10689.patch
 delete mode 100644 meta/recipes-kernel/blktrace/blktrace/ldflags.patch
 delete mode 100644 meta/recipes-kernel/blktrace/blktrace/make-btt-scripts-python3-ready.patch

diff --git a/meta/recipes-kernel/blktrace/blktrace/CVE-2018-10689.patch b/meta/recipes-kernel/blktrace/blktrace/CVE-2018-10689.patch
deleted file mode 100644
index 7b58568d59..0000000000
--- a/meta/recipes-kernel/blktrace/blktrace/CVE-2018-10689.patch
+++ /dev/null
@@ -1,150 +0,0 @@
-From d61ff409cb4dda31386373d706ea0cfb1aaac5b7 Mon Sep 17 00:00:00 2001
-From: Jens Axboe <axboe@kernel.dk>
-Date: Wed, 2 May 2018 10:24:17 -0600
-Subject: [PATCH] btt: make device/devno use PATH_MAX to avoid overflow
-
-Herbo Zhang reports:
-
-I found a bug in blktrace/btt/devmap.c. The code is just as follows:
-
-https://git.kernel.org/pub/scm/linux/kernel/git/axboe/blktrace.git/tree/btt/devmap.c?id=8349ad2f2d19422a6241f94ea84d696b21de4757
-
-       struct devmap {
-
-struct list_head head;
-char device[32], devno[32];    // #1
-};
-
-LIST_HEAD(all_devmaps);
-
-static int dev_map_add(char *line)
-{
-struct devmap *dmp;
-
-if (strstr(line, "Device") != NULL)
-return 1;
-
-dmp = malloc(sizeof(struct devmap));
-if (sscanf(line, "%s %s", dmp->device, dmp->devno) != 2) {  //#2
-free(dmp);
-return 1;
-}
-
-list_add_tail(&dmp->head, &all_devmaps);
-return 0;
-}
-
-int dev_map_read(char *fname)
-{
-char line[256];   // #3
-FILE *fp = my_fopen(fname, "r");
-
-if (!fp) {
-perror(fname);
-return 1;
-}
-
-while (fscanf(fp, "%255[a-zA-Z0-9 :.,/_-]\n", line) == 1) {
-if (dev_map_add(line))
-break;
-}
-
-fclose(fp);
-return 0;
-}
-
- The line length is 256, but the dmp->device, dmp->devno  max length
-is only 32. We can put strings longer than 32 into dmp->device and
-dmp->devno , and then they will be overflowed.
-
- we can trigger this bug just as follows:
-
- $ python -c "print 'A'*256" > ./test
-    $ btt -M ./test
-
-    *** Error in btt': free(): invalid next size (fast): 0x000055ad7349b250 ***
-    ======= Backtrace: =========
-    /lib/x86_64-linux-gnu/libc.so.6(+0x777e5)[0x7f7f158ce7e5]
-    /lib/x86_64-linux-gnu/libc.so.6(+0x7fe0a)[0x7f7f158d6e0a]
-    /lib/x86_64-linux-gnu/libc.so.6(cfree+0x4c)[0x7f7f158da98c]
-    btt(+0x32e0)[0x55ad7306f2e0]
-    btt(+0x2c5f)[0x55ad7306ec5f]
-    btt(+0x251f)[0x55ad7306e51f]
-    /lib/x86_64-linux-gnu/libc.so.6(__libc_start_main+0xf0)[0x7f7f15877830]
-    btt(+0x26b9)[0x55ad7306e6b9]
-    ======= Memory map: ========
-    55ad7306c000-55ad7307f000 r-xp 00000000 08:14 3698139
-      /usr/bin/btt
-    55ad7327e000-55ad7327f000 r--p 00012000 08:14 3698139
-      /usr/bin/btt
-    55ad7327f000-55ad73280000 rw-p 00013000 08:14 3698139
-      /usr/bin/btt
-    55ad73280000-55ad73285000 rw-p 00000000 00:00 0
-    55ad7349a000-55ad734bb000 rw-p 00000000 00:00 0
-      [heap]
-    7f7f10000000-7f7f10021000 rw-p 00000000 00:00 0
-    7f7f10021000-7f7f14000000 ---p 00000000 00:00 0
-    7f7f15640000-7f7f15656000 r-xp 00000000 08:14 14942237
-      /lib/x86_64-linux-gnu/libgcc_s.so.1
-    7f7f15656000-7f7f15855000 ---p 00016000 08:14 14942237
-      /lib/x86_64-linux-gnu/libgcc_s.so.1
-    7f7f15855000-7f7f15856000 r--p 00015000 08:14 14942237
-      /lib/x86_64-linux-gnu/libgcc_s.so.1
-    7f7f15856000-7f7f15857000 rw-p 00016000 08:14 14942237
-      /lib/x86_64-linux-gnu/libgcc_s.so.1
-    7f7f15857000-7f7f15a16000 r-xp 00000000 08:14 14948477
-      /lib/x86_64-linux-gnu/libc-2.23.so
-    7f7f15a16000-7f7f15c16000 ---p 001bf000 08:14 14948477
-      /lib/x86_64-linux-gnu/libc-2.23.so
-    7f7f15c16000-7f7f15c1a000 r--p 001bf000 08:14 14948477
-      /lib/x86_64-linux-gnu/libc-2.23.so
-    7f7f15c1a000-7f7f15c1c000 rw-p 001c3000 08:14 14948477
-      /lib/x86_64-linux-gnu/libc-2.23.so
-    7f7f15c1c000-7f7f15c20000 rw-p 00000000 00:00 0
-    7f7f15c20000-7f7f15c46000 r-xp 00000000 08:14 14948478
-      /lib/x86_64-linux-gnu/ld-2.23.so
-    7f7f15e16000-7f7f15e19000 rw-p 00000000 00:00 0
-    7f7f15e42000-7f7f15e45000 rw-p 00000000 00:00 0
-    7f7f15e45000-7f7f15e46000 r--p 00025000 08:14 14948478
-      /lib/x86_64-linux-gnu/ld-2.23.so
-    7f7f15e46000-7f7f15e47000 rw-p 00026000 08:14 14948478
-      /lib/x86_64-linux-gnu/ld-2.23.so
-    7f7f15e47000-7f7f15e48000 rw-p 00000000 00:00 0
-    7ffdebe5c000-7ffdebe7d000 rw-p 00000000 00:00 0
-      [stack]
-    7ffdebebc000-7ffdebebe000 r--p 00000000 00:00 0
-      [vvar]
-    7ffdebebe000-7ffdebec0000 r-xp 00000000 00:00 0
-      [vdso]
-    ffffffffff600000-ffffffffff601000 r-xp 00000000 00:00 0
-      [vsyscall]
-    [1]    6272 abort      btt -M test
-
-Signed-off-by: Jens Axboe <axboe@kernel.dk>
-
-Upstream-Status: Backport
-[https://git.kernel.org/pub/scm/linux/kernel/git/axboe/blktrace.git/commit/?id=d61ff409cb4dda31386373d706ea0cfb1aaac5b7]
-
-CVE: CVE-2018-10689
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- btt/devmap.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/btt/devmap.c b/btt/devmap.c
-index 0553a9e..5fc1cb2 100644
---- a/btt/devmap.c
-+++ b/btt/devmap.c
-@@ -23,7 +23,7 @@
- 
- struct devmap {
- 	struct list_head head;
--	char device[32], devno[32];
-+	char device[PATH_MAX], devno[PATH_MAX];
- };
- 
- LIST_HEAD(all_devmaps);
--- 
-2.7.4
-
diff --git a/meta/recipes-kernel/blktrace/blktrace/ldflags.patch b/meta/recipes-kernel/blktrace/blktrace/ldflags.patch
deleted file mode 100644
index ab905cf0da..0000000000
--- a/meta/recipes-kernel/blktrace/blktrace/ldflags.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-blktrace: obey LDFLAGS
-
-Upstream-Status: Pending
-
-Signed-off-by: Christopher Larson <chris_larson@mentor.com>
-
-the patch was imported from meta-mentor layer on yoctoproject git server
-http://git.yoctoproject.org/cgit/cgit.cgi/meta-mentor as of commit id
-aed463414e2e2bf8ca44ba54ee5973e7ed599e57
-
-Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
-
-Index: git/Makefile
-===================================================================
---- git.orig/Makefile
-+++ git/Makefile
-@@ -1,5 +1,6 @@
- CC	= gcc
- CFLAGS	= -Wall -O2 -g -W
-+LDFLAGS =
- ALL_CFLAGS = $(CFLAGS) -D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
- PROGS	= blkparse blktrace verify_blkparse blkrawverify blkiomon
- LIBS	= -lpthread
-@@ -26,19 +27,19 @@ btreplay/btreplay:
- 	$(CC) -o $*.o -c $(ALL_CFLAGS) $<
- 
- blkparse: blkparse.o blkparse_fmt.o rbtree.o act_mask.o
--	$(CC) $(ALL_CFLAGS) -o $@ $(filter %.o,$^)
-+	$(CC) $(ALL_CFLAGS) -o $@ $(filter %.o,$^) $(LDFLAGS)
- 
- blktrace: blktrace.o act_mask.o
--	$(CC) $(ALL_CFLAGS) -o $@ $(filter %.o,$^) $(LIBS)
-+	$(CC) $(ALL_CFLAGS) -o $@ $(filter %.o,$^) $(LIBS) $(LDFLAGS)
- 
- verify_blkparse: verify_blkparse.o
--	$(CC) $(ALL_CFLAGS) -o $@ $(filter %.o,$^)
-+	$(CC) $(ALL_CFLAGS) -o $@ $(filter %.o,$^) $(LDFLAGS)
- 
- blkrawverify: blkrawverify.o
--	$(CC) $(ALL_CFLAGS) -o $@ $(filter %.o,$^)
-+	$(CC) $(ALL_CFLAGS) -o $@ $(filter %.o,$^) $(LDFLAGS)
- 
- blkiomon: blkiomon.o rbtree.o
--	$(CC) $(ALL_CFLAGS) -o $@ $(filter %.o,$^) $(LIBS) -lrt
-+	$(CC) $(ALL_CFLAGS) -o $@ $(filter %.o,$^) $(LIBS) -lrt $(LDFLAGS)
- 
- $(PROGS): | depend
- 
-Index: git/btreplay/Makefile
-===================================================================
---- git.orig/btreplay/Makefile
-+++ git/btreplay/Makefile
-@@ -7,6 +7,7 @@
- 
- CC	= gcc
- CFLAGS	= -Wall -W -O2 -g
-+LDFLAGS =
- INCS	= -I. -I.. -I../btt
- OCFLAGS	= -UCOUNT_IOS -UDEBUG -DNDEBUG
- XCFLAGS	= -D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
-@@ -32,10 +33,10 @@ clean: docsclean
- 	$(CC) $(CFLAGS) -c -o $*.o $<
- 
- btrecord: btrecord.o
--	$(CC) $(CFLAGS) -o $@ $(filter %.o,$^)
-+	$(CC) $(CFLAGS) -o $@ $(filter %.o,$^) $(LDFLAGS)
- 
- btreplay: btreplay.o
--	$(CC) $(CFLAGS) -o $@ $(filter %.o,$^) $(LIBS)
-+	$(CC) $(CFLAGS) -o $@ $(filter %.o,$^) $(LIBS) $(LDFLAGS)
- 
- depend:
- 	@$(CC) -MM $(CFLAGS) *.c 1> .depend
-Index: git/btt/Makefile
-===================================================================
---- git.orig/btt/Makefile
-+++ git/btt/Makefile
-@@ -7,6 +7,7 @@
- 
- CC	= gcc
- CFLAGS	= -Wall -W -O2 -g
-+LDFLAGS =
- INCS	= -I. -I..
- XCFLAGS	= -D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
- override CFLAGS += $(INCS) $(XCFLAGS)
-@@ -38,7 +39,7 @@ clean: docsclean
- 	$(CC) $(CFLAGS) -c -o $*.o $<
- 
- btt: $(OBJS)
--	$(CC) $(CFLAGS) -o $@ $(filter %.o,$^) $(LIBS)
-+	$(CC) $(CFLAGS) -o $@ $(filter %.o,$^) $(LIBS) $(LDFLAGS)
- 
- ifneq ($(wildcard .depend),)
- include .depend
-Index: git/iowatcher/Makefile
-===================================================================
---- git.orig/iowatcher/Makefile
-+++ git/iowatcher/Makefile
-@@ -1,5 +1,6 @@
- CC      = gcc
- CFLAGS  = -Wall -O2 -g -W -Wunused-result
-+LDFLAGS =
- ALL_CFLAGS = $(CFLAGS) -D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
- 
- PROGS = iowatcher
-@@ -19,7 +20,7 @@ all: $(ALL)
- 	$(CC) -o $*.o -c $(ALL_CFLAGS) $<
- 
- iowatcher: blkparse.o plot.o main.o tracers.o mpstat.o fio.o
--	$(CC) $(ALL_CFLAGS) -o $@ $(filter %.o,$^) -lm -lrt
-+	$(CC) $(ALL_CFLAGS) -o $@ $(filter %.o,$^) -lm $(LDFLAGS) -lrt
- 
- depend:
- 	@$(CC) -MM $(ALL_CFLAGS) *.c 1> .depend
diff --git a/meta/recipes-kernel/blktrace/blktrace/make-btt-scripts-python3-ready.patch b/meta/recipes-kernel/blktrace/blktrace/make-btt-scripts-python3-ready.patch
deleted file mode 100644
index 3b0c1c692c..0000000000
--- a/meta/recipes-kernel/blktrace/blktrace/make-btt-scripts-python3-ready.patch
+++ /dev/null
@@ -1,197 +0,0 @@
-From 70d5ca2d5f3d6b97c11c641b7e0c5836983219a0 Mon Sep 17 00:00:00 2001
-From: Eric Sandeen <sandeen@redhat.com>
-Date: Wed, 28 Mar 2018 15:26:36 -0500
-Subject: [oe-core][PATCH 1/1] make btt scripts python3-ready
-
-Many distributions are moving to python3 by default.  Here's
-an attempt to make the python scripts in blktrace python3-ready.
-
-Most of this was done with automated tools.  I hand fixed some
-space-vs tab issues, and cast an array index to integer.  It
-passes rudimentary testing when run under python2.7 as well
-as python3.
-
-This doesn't do anything with the shebangs, it leaves them both
-invoking whatever "env python" coughs up on the system.
-
-Signed-off-by: Eric Sandeen <sandeen@redhat.com>
-Signed-off-by: Jens Axboe <axboe@kernel.dk>
-
-Unchanged except to modify shebangs to use python3 since
-oe-core does not support python2 anymore.
-
-Upstream-Status: Backport [git://git.kernel.dk/blktrace.git commit 70d5ca2d5...]
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
----
- btt/bno_plot.py | 28 +++++++++++++++-------------
- btt/btt_plot.py | 22 +++++++++++++---------
- 2 files changed, 28 insertions(+), 22 deletions(-)
-
---- git.orig/btt/bno_plot.py
-+++ git/btt/bno_plot.py
-@@ -1,4 +1,4 @@
--#! /usr/bin/env python
-+#! /usr/bin/env python3
- #
- # btt blkno plotting interface
- #
-@@ -38,6 +38,8 @@ automatically push the keys under the gr
- To exit the plotter, enter 'quit' or ^D at the 'gnuplot> ' prompt.
- """
- 
-+from __future__ import absolute_import
-+from __future__ import print_function
- import getopt, glob, os, sys, tempfile
- 
- verbose	= 0
-@@ -60,14 +62,14 @@ def parse_args(in_args):
- 
- 	try:
- 		(opts, args) = getopt.getopt(in_args, s_opts, l_opts)
--	except getopt.error, msg:
--		print >>sys.stderr, msg
--		print >>sys.stderr, __doc__
-+	except getopt.error as msg:
-+		print(msg, file=sys.stderr)
-+		print(__doc__, file=sys.stderr)
- 		sys.exit(1)
- 
- 	for (o, a) in opts:
- 		if o in ('-h', '--help'):
--			print __doc__
-+			print(__doc__)
- 			sys.exit(0)
- 		elif o in ('-v', '--verbose'):
- 			verbose += 1
-@@ -84,10 +86,10 @@ if __name__ == '__main__':
- 	(bnos, keys_below) = parse_args(sys.argv[1:])
- 
- 	if verbose:
--		print 'Using files:',
--		for bno in bnos: print bno,
--		if keys_below:	print '\nKeys are to be placed below graph'
--		else:		print ''
-+		print('Using files:', end=' ')
-+		for bno in bnos: print(bno, end=' ')
-+		if keys_below:	print('\nKeys are to be placed below graph')
-+		else:		print('')
- 
- 	tmpdir = tempfile.mktemp()
- 	os.mkdir(tmpdir)
-@@ -99,7 +101,7 @@ if __name__ == '__main__':
- 		fo = open(t, 'w')
- 		for line in open(f, 'r'):
- 			fld = line.split(None)
--			print >>fo, fld[0], fld[1], int(fld[2])-int(fld[1])
-+			print(fld[0], fld[1], int(fld[2])-int(fld[1]), file=fo)
- 		fo.close()
- 
- 		t = t[t.rfind('/')+1:]
-@@ -107,16 +109,16 @@ if __name__ == '__main__':
- 		else:                plot_cmd = "%s,'%s'" % (plot_cmd, t)
- 
- 	fo = open('%s/plot.cmds' % tmpdir, 'w')
--	print >>fo, cmds
--	if len(bnos) > 10 or keys_below: print >>fo, 'set key below'
--	print >>fo, plot_cmd
-+	print(cmds, file=fo)
-+	if len(bnos) > 10 or keys_below: print('set key below', file=fo)
-+	print(plot_cmd, file=fo)
- 	fo.close()
- 
- 	pid = os.fork()
- 	if pid == 0:
- 		cmd = 'gnuplot %s/plot.cmds -' % tmpdir
- 
--		if verbose: print 'Executing %s' % cmd
-+		if verbose: print('Executing %s' % cmd)
- 
- 		os.chdir(tmpdir)
- 		os.system(cmd)
---- git.orig/btt/btt_plot.py
-+++ git/btt/btt_plot.py
-@@ -1,4 +1,4 @@
--#! /usr/bin/env python
-+#! /usr/bin/env python3
- #
- # btt_plot.py: Generate matplotlib plots for BTT generate data files
- #
-@@ -55,6 +55,10 @@ Arguments:
-   but the -o (--output) and -T (--title) options will be ignored.
- """
- 
-+from __future__ import absolute_import
-+from __future__ import print_function
-+import six
-+from six.moves import range
- __author__ = 'Alan D. Brunelle <alan.brunelle@hp.com>'
- 
- #------------------------------------------------------------------------------
-@@ -82,7 +86,7 @@ get_base 	= lambda file: file[file.find(
- def fatal(msg):
- 	"""Generate fatal error message and exit"""
- 
--	print >>sys.stderr, 'FATAL: %s' % msg
-+	print('FATAL: %s' % msg, file=sys.stderr)
- 	sys.exit(1)
- 
- #------------------------------------------------------------------------------
-@@ -163,7 +167,7 @@ def get_data(files):
- 		if not os.path.exists(file):
- 			fatal('%s not found' % file)
- 		elif verbose:
--			print 'Processing %s' % file
-+			print('Processing %s' % file)
- 
- 		xs = []
- 		ys = []
-@@ -214,8 +218,8 @@ def parse_args(args):
- 
- 	try:
- 		(opts, args) = getopt.getopt(args[1:], s_opts, l_opts)
--	except getopt.error, msg:
--		print >>sys.stderr, msg
-+	except getopt.error as msg:
-+		print(msg, file=sys.stderr)
- 		fatal(__doc__)
- 
- 	for (o, a) in opts:
-@@ -293,15 +297,15 @@ def generate_output(type, db):
- 	def color(idx, style):
- 		"""Returns a color/symbol type based upon the index passed."""
- 
--                colors = [ 'b', 'g', 'r', 'c', 'm', 'y', 'k' ]
-+		colors = [ 'b', 'g', 'r', 'c', 'm', 'y', 'k' ]
- 		l_styles = [ '-', ':', '--', '-.' ]
- 		m_styles = [ 'o', '+', '.', ',', 's', 'v', 'x', '<', '>' ]
- 
- 		color = colors[idx % len(colors)]
- 		if style == 'line':
--			style = l_styles[(idx / len(l_styles)) % len(l_styles)]
-+			style = l_styles[int((idx / len(l_styles)) % len(l_styles))]
- 		elif style == 'marker':
--			style = m_styles[(idx / len(m_styles)) % len(m_styles)]
-+			style = m_styles[int((idx / len(m_styles)) % len(m_styles))]
- 
- 		return '%s%s' % (color, style)
- 
-@@ -314,7 +318,7 @@ def generate_output(type, db):
- 		ofile = '%s.png' % type
- 
- 	if verbose:
--		print 'Generating plot into %s' % ofile
-+		print('Generating plot into %s' % ofile)
- 
- 	fig = plt.figure(figsize=plot_size)
- 	ax = fig.add_subplot(111)
-@@ -329,7 +333,7 @@ def generate_output(type, db):
- 		legends = None
- 
- 	keys = []
--	for file in db.iterkeys():
-+	for file in six.iterkeys(db):
- 		if not file in ['min_x', 'max_x', 'min_y', 'max_y']:
- 			keys.append(file)
- 
diff --git a/meta/recipes-kernel/blktrace/blktrace_git.bb b/meta/recipes-kernel/blktrace/blktrace_git.bb
index 7ccc022b93..a9c787fbb6 100644
--- a/meta/recipes-kernel/blktrace/blktrace_git.bb
+++ b/meta/recipes-kernel/blktrace/blktrace_git.bb
@@ -10,15 +10,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 
 DEPENDS = "libaio"
 
-SRCREV = "cca113f2fe0759b91fd6a0e10fdcda2c28f18a7e"
+SRCREV = "366d30b9cdb20345c5d064af850d686da79b89eb"
 
-PV = "1.2.0+git${SRCPV}"
+PV = "1.3.0+git${SRCPV}"
 
-SRC_URI = "git://git.kernel.dk/blktrace.git \
-           file://ldflags.patch \
-           file://CVE-2018-10689.patch \
-           file://make-btt-scripts-python3-ready.patch \
-"
+SRC_URI = "git://git.kernel.dk/blktrace.git"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

