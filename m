Return-Path: <daniel.diaz@linaro.org>
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
	[209.85.167.171])
	by mail.openembedded.org (Postfix) with ESMTP id C7AC6745AB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Nov 2018 13:12:51 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id k64-v6so16516114oia.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Nov 2018 06:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Q6dJieiuWC1wfijUbhlHZ+vrPLjmO1BkbJpYeDfSWe4=;
	b=Sas5v8MJRFxWCjyuxlwjbmpoKzSZc8caaicHvbHIJF9OKq4DXe31mR/tGdLg/iiuiT
	TRCO5/qsK7qK4y7C2BCv/DE1oCtiI+GsdNOLIYJ1aunWI4u1yDncJ67C2vH6hD2qhtbd
	S2j4/Ijbb8Z90oPdjVg3wg/hsYZgFLmvuUeSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Q6dJieiuWC1wfijUbhlHZ+vrPLjmO1BkbJpYeDfSWe4=;
	b=m8Q3lzuaukrFk0ErNou00vOmqf4ogqN4AyDyD6X0MUSAK4ficnC4ZPbOTGbsBi1QTE
	3x8GaVtgNZlqKsqH2+8KLJ1f/Ye+8uAFTMsqz3i6cX/wm2fIUwPQGXfRSbA2yBb1C4w4
	T8YPat1PD728CUBhAvZY+euIedbU+DkLoAndEV91tr1CYXat5Mk0qtD1FySd3w7YbGpn
	19UJA0vxNd876G8lSup1XKEejZE3nbNSi+uBnuUhQ3tab/LuA6vxSfvGPJQ3cSjJtRuu
	T3ssslNMUX1tlOK18zcSos3J3LI73ksuqGbfWIe7DmmsG76qeDTnJiK8RoW1926+aUlQ
	xFew==
X-Gm-Message-State: AGRZ1gKbkiPANcBURQ/FT37QuENLLBGXE/o4yImbOYYTuUdH6lhrDr1b
	crrA4M+gO+08CgALwgOzUFOj06vAh2U=
X-Google-Smtp-Source: AJdET5e5yc3gfuKhwgdVUSuZnwYg8iqkowGhyLtmQ6mjssGPfBEG4Rd/GC1vN0lGiro6nPHr54vbHw==
X-Received: by 2002:aca:e78a:: with SMTP id
	e132-v6mr4485422oih.9.1541077971295; 
	Thu, 01 Nov 2018 06:12:51 -0700 (PDT)
Received: from alago.cortijodelrio.net
	(CableLink-187-161-144-57.PCs.InterCable.net. [187.161.144.57])
	by smtp.googlemail.com with ESMTPSA id
	o189-v6sm8600522oih.15.2018.11.01.06.12.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Nov 2018 06:12:49 -0700 (PDT)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Nov 2018 07:09:01 -0600
Message-Id: <20181101130901.3721-1-daniel.diaz@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH][RFC] ltp: bump to release 20180926
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
X-List-Received-Date: Thu, 01 Nov 2018 13:12:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following patches have made it to upstream:
* 0040-fs-read_all-define-FNM_EXTMATCH-if-needed.patch
* 0041-cve-2017-5669-shmat-for-0-or-PAGESIZE-with-RND-flag-.patch
* 0042-cve-meltdown-read-saved_command_line.patch
* 0043-open-creat-skip-S_ISGID-check-on-files-created-by-no.patch

This patch was replaced by another, different patch upstream:
* 0001-mmap15-mips64-return-EINVAL.patch

These patches have been refreshed in order to apply cleanly
and without any fuzz:
* 0004-build-Add-option-to-select-libc-implementation.patch
* 0007-fix-__WORDSIZE-undeclared-when-building-with-musl.patch
* 0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch
* 0035-fix-test_proc_kill-hang.patch
* 0039-commands-ar01-Fix-for-test-in-deterministic-mode.patch

The LICENSE for tools/pounder21 has been removed as that code
was dropped altogether from LTP: "It's is obsolete, not being
built."

Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
---
 .../0001-mmap15-mips64-return-EINVAL.patch    | 41 --------
 ...option-to-select-libc-implementation.patch |  2 +-
 ...E-undeclared-when-building-with-musl.patch |  2 +-
 ...BC_PREREQ-is-defined-before-using-it.patch | 98 ++++++++-----------
 .../ltp/0035-fix-test_proc_kill-hang.patch    |  2 +-
 ...1-Fix-for-test-in-deterministic-mode.patch | 38 +++----
 ...FNM_EXTMATCH-if-not-already-like-und.patch | 44 ---------
 ...mat-for-0-or-PAGESIZE-with-RND-flag-.patch | 97 ------------------
 ....c-Fix-too-small-name-string-and-rel.patch | 34 -------
 ...S_ISGID-check-on-files-created-by-no.patch | 81 ---------------
 .../ltp/{ltp_20180515.bb => ltp_20180926.bb}  |  8 +-
 11 files changed, 66 insertions(+), 381 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-mmap15-mips64-return-EINVAL.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0040-read_all-Define-FNM_EXTMATCH-if-not-already-like-und.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0041-cve-2017-5669-shmat-for-0-or-PAGESIZE-with-RND-flag-.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0042-fs-ftest-ftest06.c-Fix-too-small-name-string-and-rel.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0043-open-creat-skip-S_ISGID-check-on-files-created-by-no.patch
 rename meta/recipes-extended/ltp/{ltp_20180515.bb => ltp_20180926.bb} (92%)

diff --git a/meta/recipes-extended/ltp/ltp/0001-mmap15-mips64-return-EINVAL.patch b/meta/recipes-extended/ltp/ltp/0001-mmap15-mips64-return-EINVAL.patch
deleted file mode 100644
index 18eba27c2d..0000000000
--- a/meta/recipes-extended/ltp/ltp/0001-mmap15-mips64-return-EINVAL.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From b909805b4fc1b72e0ce299afb4abc02720ee81da Mon Sep 17 00:00:00 2001
-From: Dengke Du <dengke.du@windriver.com>
-Date: Wed, 12 Sep 2018 14:24:35 +0800
-Subject: [PATCH] mmap15: mips64 return EINVAL
-
-In mips64 kernel, system check the addr that passed to mmap:
-
-    if (TASK_SIZE - len < addr)
-        return -EINVAL;
-
-Link: https://github.com/torvalds/linux/blob/master/arch/mips/mm/mmap.c#L71
-
-Upstream-Status: Submitted [https://github.com/linux-test-project/ltp/pull/394]
-
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
----
- testcases/kernel/syscalls/mmap/mmap15.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/testcases/kernel/syscalls/mmap/mmap15.c b/testcases/kernel/syscalls/mmap/mmap15.c
-index eff27d6..a10b5c7 100644
---- a/testcases/kernel/syscalls/mmap/mmap15.c
-+++ b/testcases/kernel/syscalls/mmap/mmap15.c
-@@ -81,9 +81,14 @@ int main(int ac, char **av)
- 		}
- 
- 		if (errno != ENOMEM) {
-+#ifdef __mips__
-+			tst_resm(TPASS | TERRNO, "mmap into high region "
-+                                 "failed as expected");                        
-+#else
- 			tst_resm(TFAIL | TERRNO, "mmap into high region "
- 				 "failed unexpectedly - expect "
- 				 "errno=ENOMEM, got");
-+#endif
- 		} else {
- 			tst_resm(TPASS | TERRNO, "mmap into high region "
- 				 "failed as expected");
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/ltp/ltp/0004-build-Add-option-to-select-libc-implementation.patch b/meta/recipes-extended/ltp/ltp/0004-build-Add-option-to-select-libc-implementation.patch
index 2df385591b..8fd6d0fad0 100644
--- a/meta/recipes-extended/ltp/ltp/0004-build-Add-option-to-select-libc-implementation.patch
+++ b/meta/recipes-extended/ltp/ltp/0004-build-Add-option-to-select-libc-implementation.patch
@@ -42,7 +42,7 @@ diff --git a/testcases/kernel/Makefile b/testcases/kernel/Makefile
 index 50a12fa..4f1987f 100644
 --- a/testcases/kernel/Makefile
 +++ b/testcases/kernel/Makefile
-@@ -48,13 +48,16 @@ SUBDIRS			+= connectors \
+@@ -49,13 +49,16 @@ SUBDIRS			+= connectors \
  			   logging \
  			   mem \
  			   numa \
diff --git a/meta/recipes-extended/ltp/ltp/0007-fix-__WORDSIZE-undeclared-when-building-with-musl.patch b/meta/recipes-extended/ltp/ltp/0007-fix-__WORDSIZE-undeclared-when-building-with-musl.patch
index 2f4ca63750..6e6dbf398b 100644
--- a/meta/recipes-extended/ltp/ltp/0007-fix-__WORDSIZE-undeclared-when-building-with-musl.patch
+++ b/meta/recipes-extended/ltp/ltp/0007-fix-__WORDSIZE-undeclared-when-building-with-musl.patch
@@ -16,7 +16,7 @@ diff --git a/include/old/test.h b/include/old/test.h
 index b36764d83..cc6f1b551 100644
 --- a/include/old/test.h
 +++ b/include/old/test.h
-@@ -44,6 +44,9 @@
+@@ -17,6 +17,9 @@
  #include <string.h>
  #include <stdlib.h>
  #include <stdint.h>
diff --git a/meta/recipes-extended/ltp/ltp/0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch b/meta/recipes-extended/ltp/ltp/0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch
index 428ac30049..4223aec121 100644
--- a/meta/recipes-extended/ltp/ltp/0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch
+++ b/meta/recipes-extended/ltp/ltp/0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch
@@ -102,7 +102,7 @@ index c927512..921b107 100644
  	*cpu_id = sched_getcpu();
  #endif
  	return 0;
-@@ -191,15 +203,20 @@ unsigned int set_cpu_affinity(void)
+@@ -191,29 +203,45 @@ unsigned int set_cpu_affinity(void)
  	cpu_set_t *set;
  	size_t size;
  	int nrcpus = 1024;
@@ -110,12 +110,12 @@ index c927512..921b107 100644
  #if __GLIBC_PREREQ(2, 7)
  realloc:
  	set = CPU_ALLOC(nrcpus);
- #else
- 	set = malloc(sizeof(cpu_set_t));
- #endif
 +#else
 +	set = malloc(sizeof(cpu_set_t));
 +#endif
+ #else
+ 	set = malloc(sizeof(cpu_set_t));
+ #endif
  	if (set == NULL) {
  		tst_brkm(TFAIL, NULL, "CPU_ALLOC:errno:%d", errno);
  	}
@@ -123,31 +123,32 @@ index c927512..921b107 100644
  #if __GLIBC_PREREQ(2, 7)
  	size = CPU_ALLOC_SIZE(nrcpus);
  	CPU_ZERO_S(size, set);
-@@ -207,8 +224,13 @@ realloc:
- 	size = sizeof(cpu_set_t);
- 	CPU_ZERO(set);
- #endif
 +#else
 +	size = sizeof(cpu_set_t);
 +	CPU_ZERO(set);
 +#endif
+ #else
+ 	size = sizeof(cpu_set_t);
+ 	CPU_ZERO(set);
+ #endif
  	if (sched_getaffinity(0, size, set) < 0) {
  		CPU_FREE(set);
 +#if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
  #if __GLIBC_PREREQ(2, 7)
  		if (errno == EINVAL && nrcpus < (1024 << 8)) {
  			nrcpus = nrcpus << 2;
-@@ -220,10 +242,17 @@ realloc:
- 				 "NR_CPUS of the kernel is more than 1024, so we'd better use a newer glibc(>= 2.7)");
- 		else
- #endif
+ 			goto realloc;
+ 		}
 +#else
 +		if (errno == EINVAL)
 +			tst_resm(TFAIL,
 +				 "NR_CPUS of the kernel is more than 1024, so we'd better use a newer glibc(>= 2.7)");
 +		else
 +#endif
- 			tst_resm(TFAIL, "sched_getaffinity:errno:%d", errno);
+ #else
+ 		if (errno == EINVAL)
+ 			tst_resm(TFAIL,
+@@ -224,9 +252,14 @@ realloc:
  		tst_exit();
  	}
  	cpu_max = max_cpuid(size, set);
@@ -155,33 +156,26 @@ index c927512..921b107 100644
  #if __GLIBC_PREREQ(2, 7)
  	CPU_ZERO_S(size, set);
  	CPU_SET_S(cpu_max, size, set);
-@@ -231,6 +260,10 @@ realloc:
- 	CPU_ZERO(set);
- 	CPU_SET(cpu_max, set);
- #endif
 +#else
 +	CPU_ZERO(set);
 +	CPU_SET(cpu_max, set);
 +#endif
- 	if (sched_setaffinity(0, size, set) < 0) {
- 		CPU_FREE(set);
- 		tst_brkm(TFAIL, NULL, "sched_setaffinity:errno:%d", errno);
-@@ -247,11 +280,15 @@ unsigned int max_cpuid(size_t size, cpu_set_t * set)
+ #else
+ 	CPU_ZERO(set);
+ 	CPU_SET(cpu_max, set);
+@@ -247,8 +280,12 @@ unsigned int max_cpuid(size_t size, cpu_set_t * set)
  {
  	unsigned int index, max = 0;
  	for (index = 0; index < size * BITS_PER_BYTE; index++)
 +#if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
  #if __GLIBC_PREREQ(2, 7)
  		if (CPU_ISSET_S(index, size, set))
- #else
- 		if (CPU_ISSET(index, set))
- #endif
 +#else
 +		if (CPU_ISSET(index, set))
 +#endif
- 			max = index;
- 	return max;
- }
+ #else
+ 		if (CPU_ISSET(index, set))
+ #endif
 diff --git a/testcases/kernel/syscalls/sched_getaffinity/sched_getaffinity01.c b/testcases/kernel/syscalls/sched_getaffinity/sched_getaffinity01.c
 index 9d6a81a..4ed13b2 100644
 --- a/testcases/kernel/syscalls/sched_getaffinity/sched_getaffinity01.c
@@ -198,7 +192,7 @@ index 9d6a81a..4ed13b2 100644
  
  int main(int ac, char **av)
  {
-@@ -96,14 +98,19 @@ static void do_test(void)
+@@ -96,17 +98,26 @@ static void do_test(void)
  	pid_t unused_pid;
  	unsigned len;
  
@@ -206,27 +200,26 @@ index 9d6a81a..4ed13b2 100644
  #if __GLIBC_PREREQ(2, 7)
  realloc:
  	mask = CPU_ALLOC(nrcpus);
- #else
- 	mask = malloc(sizeof(cpu_set_t));
- #endif
 +#else
 +	mask = malloc(sizeof(cpu_set_t));
 +#endif
+ #else
+ 	mask = malloc(sizeof(cpu_set_t));
+ #endif
  	if (mask == NULL)
  		tst_brkm(TFAIL | TTERRNO, cleanup, "fail to get enough memory");
 +#if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
  #if __GLIBC_PREREQ(2, 7)
  	len = CPU_ALLOC_SIZE(nrcpus);
  	CPU_ZERO_S(len, mask);
-@@ -111,10 +118,15 @@ realloc:
- 	len = sizeof(cpu_set_t);
- 	CPU_ZERO(mask);
- #endif
 +#else
 +	len = sizeof(cpu_set_t);
 +	CPU_ZERO(mask);
 +#endif
- 	/* positive test */
+ #else
+ 	len = sizeof(cpu_set_t);
+ 	CPU_ZERO(mask);
+@@ -115,11 +126,18 @@ realloc:
  	TEST(sched_getaffinity(0, len, mask));
  	if (TEST_RETURN == -1) {
  		CPU_FREE(mask);
@@ -234,50 +227,43 @@ index 9d6a81a..4ed13b2 100644
  #if __GLIBC_PREREQ(2, 7)
  		if (errno == EINVAL && nrcpus < (1024 << 8)) {
  			nrcpus = nrcpus << 2;
-@@ -126,17 +138,27 @@ realloc:
- 				 "newer glibc(>= 2.7)");
- 		else
- #endif
+ 			goto realloc;
+ 		}
 +#else
 +		if (errno == EINVAL)
 +			tst_resm(TFAIL, "NR_CPUS > 1024, we'd better use a "
 +				 "newer glibc(>= 2.7)");
 +		else
 +#endif
- 			tst_resm(TFAIL | TTERRNO, "fail to get cpu affinity");
- 		cleanup();
- 	} else {
+ #else
+ 		if (errno == EINVAL)
+ 			tst_resm(TFAIL, "NR_CPUS > 1024, we'd better use a "
+@@ -132,8 +150,12 @@ realloc:
  		tst_resm(TINFO, "cpusetsize is %d", len);
  		tst_resm(TINFO, "mask.__bits[0] = %lu ", mask->__bits[0]);
  		for (i = 0; i < num; i++) {
 +#if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
  #if __GLIBC_PREREQ(2, 7)
  			TEST(CPU_ISSET_S(i, len, mask));
- #else
- 			TEST(CPU_ISSET(i, mask));
- #endif
 +#else
 +			TEST(CPU_ISSET(i, mask));
 +#endif
- 			if (TEST_RETURN != -1)
- 				tst_resm(TPASS, "sched_getaffinity() succeed, "
- 					 "this process %d is running "
-@@ -144,11 +166,15 @@ realloc:
+ #else
+ 			TEST(CPU_ISSET(i, mask));
+ #endif
+@@ -144,8 +166,12 @@ realloc:
  		}
  	}
  
 +#if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
  #if __GLIBC_PREREQ(2, 7)
  	CPU_ZERO_S(len, mask);
- #else
- 	CPU_ZERO(mask);
- #endif
 +#else
 +	CPU_ZERO(mask);
 +#endif
- 	/* negative tests */
- 	QUICK_TEST(sched_getaffinity(0, len, (cpu_set_t *) - 1));
- 	QUICK_TEST(sched_getaffinity(0, 0, mask));
+ #else
+ 	CPU_ZERO(mask);
+ #endif
 -- 
 1.9.1
 
diff --git a/meta/recipes-extended/ltp/ltp/0035-fix-test_proc_kill-hang.patch b/meta/recipes-extended/ltp/ltp/0035-fix-test_proc_kill-hang.patch
index 71e32a5e51..665da3bef3 100644
--- a/meta/recipes-extended/ltp/ltp/0035-fix-test_proc_kill-hang.patch
+++ b/meta/recipes-extended/ltp/ltp/0035-fix-test_proc_kill-hang.patch
@@ -19,7 +19,7 @@ diff --git a/testcases/kernel/controllers/memcg/functional/memcg_lib.sh b/testca
 index b785fe3..2918cc5 100755
 --- a/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
 +++ b/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
-@@ -283,6 +283,7 @@ test_proc_kill()
+@@ -291,6 +291,7 @@ test_proc_kill()
  	pid=$!
  	TST_CHECKPOINT_WAIT 0
  	echo $pid > tasks
diff --git a/meta/recipes-extended/ltp/ltp/0039-commands-ar01-Fix-for-test-in-deterministic-mode.patch b/meta/recipes-extended/ltp/ltp/0039-commands-ar01-Fix-for-test-in-deterministic-mode.patch
index e7c927e116..9accdb01f2 100644
--- a/meta/recipes-extended/ltp/ltp/0039-commands-ar01-Fix-for-test-in-deterministic-mode.patch
+++ b/meta/recipes-extended/ltp/ltp/0039-commands-ar01-Fix-for-test-in-deterministic-mode.patch
@@ -24,13 +24,15 @@ diff --git a/testcases/commands/ar/ar01 b/testcases/commands/ar/ar01
 index ddab2e0..d688f76 100644
 --- a/testcases/commands/ar/ar01
 +++ b/testcases/commands/ar/ar01
-@@ -23,14 +23,26 @@
- # This is a basic ar command test.
+@@ -24,16 +24,28 @@
  #
+ AR="${AR:=ar}"
  TST_CNT=17
 +TST_SETUP=setup
  TST_TESTFUNC=test
  TST_NEEDS_TMPDIR=1
+ TST_NEEDS_CMDS="$AR"
+ 
  . tst_test.sh
  
 +setup()
@@ -53,7 +55,7 @@ index ddab2e0..d688f76 100644
  	ROD ar -t lib.a \> ar.out
  
  	printf "file1.in\nfile2.in\nfile3.in\n" > ar.exp
-@@ -47,9 +59,9 @@ test1()
+@@ -50,9 +62,9 @@ test1()
  
  test2()
  {
@@ -66,7 +68,7 @@ index ddab2e0..d688f76 100644
  	ROD ar -t lib.a \> ar.out
  
  	printf "file1.in\nfile4.in\nfile2.in\nfile3.in\n" > ar.exp
-@@ -66,8 +78,8 @@ test2()
+@@ -69,8 +81,8 @@ test2()
  
  test3()
  {
@@ -77,7 +79,7 @@ index ddab2e0..d688f76 100644
  	ROD ar -t lib.a \> ar.out
  
  	printf "file1.in\nfile2.in\nfile3.in\n" > ar.exp
-@@ -84,9 +96,9 @@ test3()
+@@ -87,9 +99,9 @@ test3()
  
  test4()
  {
@@ -90,7 +92,7 @@ index ddab2e0..d688f76 100644
  	ROD ar -t lib.a \> ar.out
  
  	printf "file1.in\nfile2.in\nfile3.in\n" > ar.exp
-@@ -103,7 +115,7 @@ test4()
+@@ -106,7 +118,7 @@ test4()
  
  test5()
  {
@@ -99,7 +101,7 @@ index ddab2e0..d688f76 100644
  
  	if [ -s ar.out ]; then
  		tst_res TFAIL "ar produced output unexpectedly (-c)"
-@@ -117,7 +129,7 @@ test5()
+@@ -120,7 +132,7 @@ test5()
  
  test6()
  {
@@ -108,7 +110,7 @@ index ddab2e0..d688f76 100644
  
  	if [ -s ar.out ]; then
  		tst_res TFAIL "ar produced output unexpectedly (-qc)"
-@@ -131,9 +143,9 @@ test6()
+@@ -134,9 +146,9 @@ test6()
  
  test7()
  {
@@ -121,7 +123,7 @@ index ddab2e0..d688f76 100644
  	ROD ar -t lib.a \> ar.out
  
  	printf "file3.in\n" > ar.exp
-@@ -150,9 +162,9 @@ test7()
+@@ -153,9 +165,9 @@ test7()
  
  test8()
  {
@@ -134,7 +136,7 @@ index ddab2e0..d688f76 100644
  	ROD ar -t lib.a \> ar.out
  
  	printf "file1.in\nfile2.in\nfile3.in\n" > ar.exp
-@@ -169,8 +181,8 @@ test8()
+@@ -172,8 +184,8 @@ test8()
  
  test9()
  {
@@ -145,7 +147,7 @@ index ddab2e0..d688f76 100644
  	ROD ar -t lib.a \> ar.out
  
  	printf "file1.in\nfile2.in\nfile3.in\n" > ar.exp
-@@ -187,9 +199,9 @@ test9()
+@@ -190,9 +202,9 @@ test9()
  
  test10()
  {
@@ -158,7 +160,7 @@ index ddab2e0..d688f76 100644
  	ROD ar -t lib.a \> ar.out
  
  	printf "file1.in\nfile2.in\nfile3.in\n" > ar.exp
-@@ -206,9 +218,9 @@ test10()
+@@ -209,9 +221,9 @@ test10()
  
  test11()
  {
@@ -171,7 +173,7 @@ index ddab2e0..d688f76 100644
  	ROD ar -t lib.a \> ar.out
  
  	printf "file1.in\nfile2.in\nfile3.in\n" > ar.exp
-@@ -225,9 +237,9 @@ test11()
+@@ -228,9 +240,9 @@ test11()
  
  test12()
  {
@@ -184,7 +186,7 @@ index ddab2e0..d688f76 100644
  
  	printf "This is file one\nThis is file two\nThis is file three\n" > ar.exp
  
-@@ -244,9 +256,9 @@ test12()
+@@ -247,9 +259,9 @@ test12()
  test13()
  {
  
@@ -197,7 +199,7 @@ index ddab2e0..d688f76 100644
  	ROD ar -t lib.a \> ar.out
  
  	printf "file1.in\nfile2.in\nfile3.in\nfile4.in\n" > ar.exp
-@@ -264,14 +276,14 @@ test13()
+@@ -267,14 +279,14 @@ test13()
  test14()
  {
  	ROD touch file0.in
@@ -214,7 +216,7 @@ index ddab2e0..d688f76 100644
  
  	file0_mtime2=$(ar -tv lib.a | grep file0.in)
  	file1_mtime2=$(ar -tv lib.a | grep file1.in)
-@@ -293,7 +305,7 @@ test14()
+@@ -296,7 +308,7 @@ test14()
  
  test15()
  {
@@ -223,7 +225,7 @@ index ddab2e0..d688f76 100644
  	ROD ar -tv lib.a \> ar.out
  
  	if grep -q '[rwx-]\{9\} [0-9].*/[0-9].*\s*[0-9].*.*file1.in' ar.out; then
-@@ -308,9 +320,9 @@ test15()
+@@ -311,9 +323,9 @@ test15()
  
  test16()
  {
@@ -236,7 +238,7 @@ index ddab2e0..d688f76 100644
  
  	printf "x - file1.in\nx - file2.in\nx - file3.in\n" > ar.exp
  
-@@ -332,8 +344,8 @@ test16()
+@@ -335,8 +347,8 @@ test16()
  
  test17()
  {
diff --git a/meta/recipes-extended/ltp/ltp/0040-read_all-Define-FNM_EXTMATCH-if-not-already-like-und.patch b/meta/recipes-extended/ltp/ltp/0040-read_all-Define-FNM_EXTMATCH-if-not-already-like-und.patch
deleted file mode 100644
index 0245a89f3d..0000000000
--- a/meta/recipes-extended/ltp/ltp/0040-read_all-Define-FNM_EXTMATCH-if-not-already-like-und.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 23518508de307790231d16af307291f1b45e903a Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
-Date: Tue, 5 Jun 2018 15:36:30 -0500
-Subject: [PATCH] read_all: Define FNM_EXTMATCH if not already (like under
- musl).
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-With musl, FNM_EXTMATCH is not defined:
-| read_all.c: In function 'read_test':
-| read_all.c:201:41: error: 'FNM_EXTMATCH' undeclared (first use in this function); did you mean 'FNM_NOMATCH'?
-|   if (exclude && !fnmatch(exclude, path, FNM_EXTMATCH)) {
-|                                          ^~~~~~~~~~~~
-|                                          FNM_NOMATCH
-| read_all.c:201:41: note: each undeclared identifier is reported only once for each function it appears in
-| <builtin>: recipe for target 'read_all' failed
-| make[4]: *** [read_all] Error 1
-
-Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
-
-Upstream-Status: Pending
----
- testcases/kernel/fs/read_all/read_all.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/testcases/kernel/fs/read_all/read_all.c b/testcases/kernel/fs/read_all/read_all.c
-index a8e1611..e9ff47a 100644
---- a/testcases/kernel/fs/read_all/read_all.c
-+++ b/testcases/kernel/fs/read_all/read_all.c
-@@ -59,6 +59,10 @@
- #define MAX_PATH 4096
- #define MAX_DISPLAY 40
- 
-+#if !defined(FNM_EXTMATCH)
-+#define FNM_EXTMATCH 0
-+#endif
-+
- struct queue {
- 	sem_t sem;
- 	int front;
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/ltp/ltp/0041-cve-2017-5669-shmat-for-0-or-PAGESIZE-with-RND-flag-.patch b/meta/recipes-extended/ltp/ltp/0041-cve-2017-5669-shmat-for-0-or-PAGESIZE-with-RND-flag-.patch
deleted file mode 100644
index 0d2d2cbce4..0000000000
--- a/meta/recipes-extended/ltp/ltp/0041-cve-2017-5669-shmat-for-0-or-PAGESIZE-with-RND-flag-.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From b767b73ef027ba8d35f297c7d3659265ac80425b Mon Sep 17 00:00:00 2001
-From: Rafael David Tinoco <rafael.tinoco@canonical.com>
-Date: Wed, 30 May 2018 09:14:34 -0300
-Subject: [PATCH] cve-2017-5669: shmat() for 0 (or <PAGESIZE with RND flag) has
- to fail with REMAPs
-
-Fixes: https://github.com/linux-test-project/ltp/issues/319
-
-According to upstream thread (https://lkml.org/lkml/2018/5/28/2056),
-cve-2017-5669 needs to address the "new" way of handling nil addresses
-for shmat() when used with MAP_FIXED or SHM_REMAP flags.
-
-- mapping nil-page is OK on lower addresses with MAP_FIXED (or else X11 is broken)
-- mapping nil-page is NOT OK with SHM_REMAP on lower addresses
-
-Addresses Davidlohr Bueso's comments/changes:
-
-commit 8f89c007b6de
-Author: Davidlohr Bueso <dave@stgolabs.net>
-Date:   Fri May 25 14:47:30 2018 -0700
-
-    ipc/shm: fix shmat() nil address after round-down when remapping
-
-commit a73ab244f0da
-Author: Davidlohr Bueso <dave@stgolabs.net>
-Date:   Fri May 25 14:47:27 2018 -0700
-
-    Revert "ipc/shm: Fix shmat mmap nil-page protection"
-
-For previously test, and now broken, made based on:
-
-commit 95e91b831f87
-Author: Davidlohr Bueso <dave@stgolabs.net>
-Date:   Mon Feb 27 14:28:24 2017 -0800
-
-    ipc/shm: Fix shmat mmap nil-page protection
-
-Signed-off-by: Rafael David Tinoco <rafael.tinoco@linaro.org>
-Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>
-Reviewed-by: Jan Stancek <jstancek@redhat.com>
-
-Upstream-Status: Accepted [https://github.com/linux-test-project/ltp/pull/324]
-CVE: CVE-2017-5669
-Signed-off-by: Rafael David Tinoco <rafael.tinoco@linaro.org>
----
- testcases/cve/cve-2017-5669.c | 20 +++++++++++++++++++-
- 1 file changed, 19 insertions(+), 1 deletion(-)
-
-diff --git a/testcases/cve/cve-2017-5669.c b/testcases/cve/cve-2017-5669.c
-index 1ca5983..0834626 100644
---- a/testcases/cve/cve-2017-5669.c
-+++ b/testcases/cve/cve-2017-5669.c
-@@ -28,7 +28,20 @@
-  * is just to see if we get an access error or some other unexpected behaviour.
-  *
-  * See commit 95e91b831f (ipc/shm: Fix shmat mmap nil-page protection)
-+ *
-+ * The commit above disallowed SHM_RND maps to zero (and rounded) entirely and
-+ * that broke userland for cases like Xorg. New behavior disallows REMAPs to
-+ * lower addresses (0<=PAGESIZE).
-+ *
-+ * See commit a73ab244f0da (Revert "ipc/shm: Fix shmat mmap nil-page protect...)
-+ * See commit 8f89c007b6de (ipc/shm: fix shmat() nil address after round-dow...)
-+ * See https://github.com/linux-test-project/ltp/issues/319
-+ *
-+ * This test needs root permissions or else security_mmap_addr(), from
-+ * get_unmapped_area(), will cause permission errors when trying to mmap lower
-+ * addresses.
-  */
-+
- #include <sys/types.h>
- #include <sys/ipc.h>
- #include <sys/shm.h>
-@@ -60,7 +73,11 @@ static void cleanup(void)
- static void run(void)
- {
- 	tst_res(TINFO, "Attempting to attach shared memory to null page");
--	shm_addr = shmat(shm_id, ((void *)1), SHM_RND);
-+	/*
-+	 * shmat() for 0 (or < PAGESIZE with RND flag) has to fail with REMAPs
-+	 * https://github.com/linux-test-project/ltp/issues/319
-+	 */
-+	shm_addr = shmat(shm_id, ((void *)1), SHM_RND | SHM_REMAP);
- 	if (shm_addr == (void *)-1) {
- 		shm_addr = NULL;
- 		if (errno == EINVAL) {
-@@ -89,6 +106,7 @@ static void run(void)
- }
- 
- static struct tst_test test = {
-+	.needs_root = 1,
- 	.setup = setup,
- 	.cleanup = cleanup,
- 	.test_all = run,
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/ltp/ltp/0042-fs-ftest-ftest06.c-Fix-too-small-name-string-and-rel.patch b/meta/recipes-extended/ltp/ltp/0042-fs-ftest-ftest06.c-Fix-too-small-name-string-and-rel.patch
deleted file mode 100644
index 407d98eff0..0000000000
--- a/meta/recipes-extended/ltp/ltp/0042-fs-ftest-ftest06.c-Fix-too-small-name-string-and-rel.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From baeef026f80e19a634a4096e97286419aca1cf68 Mon Sep 17 00:00:00 2001
-From: He Zhe <zhe.he@windriver.com>
-Date: Thu, 23 Aug 2018 00:22:04 +0800
-Subject: [PATCH] fs/ftest/ftest06.c: Fix too small name string and related
- failure
-
-The name string is too small to contain normal full path names and causes
-the following failure.
-
-"ftest06     2  TFAIL  :  ftest06.c:223: Can't chdir(): errno=ENOENT(2): No such file or directory"
-
-Upstream-Status: Submitted [ltp-list@lists.sourceforge.net]
-
-Signed-off-by: He Zhe <zhe.he@windriver.com>
----
- testcases/kernel/fs/ftest/ftest06.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/testcases/kernel/fs/ftest/ftest06.c b/testcases/kernel/fs/ftest/ftest06.c
-index 2ca7c88..b434067 100644
---- a/testcases/kernel/fs/ftest/ftest06.c
-+++ b/testcases/kernel/fs/ftest/ftest06.c
-@@ -100,7 +100,7 @@ static char *fstyp;
- int main(int ac, char *av[])
- {
- 	int pid, child, status, count, k, j;
--	char name[3];
-+	char name[MAXPATHLEN];
- 
- 	int lc;
- 
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/ltp/ltp/0043-open-creat-skip-S_ISGID-check-on-files-created-by-no.patch b/meta/recipes-extended/ltp/ltp/0043-open-creat-skip-S_ISGID-check-on-files-created-by-no.patch
deleted file mode 100644
index dc61fcc039..0000000000
--- a/meta/recipes-extended/ltp/ltp/0043-open-creat-skip-S_ISGID-check-on-files-created-by-no.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From 3c87ef2961dedb10d1f674c6a530e00dbab8ec1b Mon Sep 17 00:00:00 2001
-From: Jan Stancek <jstancek@redhat.com>
-Date: Tue, 17 Jul 2018 10:26:39 +0200
-Subject: [PATCH] open|creat: skip S_ISGID check on files created by non-group
- members
-
-0fa3ecd87848 ("Fix up non-directory creation in SGID directories")
-fixes problem described in CVE-2018-13405. This commit is getting
-backported to older streams as well.
-
-This patch removes S_ISGID check for files created by non-group members
-in LTP tests creat08 and open10.
-
-Once 0fa3ecd87848 will be in non-rc kernel, we could add a new test
-for this CVE that would be limited to 4.18+ kernels.
-
-Signed-off-by: Jan Stancek <jstancek@redhat.com>
-Acked-by: Cyril Hrubis <chrubis@suse.cz>
-Reviewed-by: Naresh Kamboju <naresh.kamboju@linaro.org>
-
-Upstream-Status: Backport
-[ git://github.com/linux-test-project/ltp.git
-  3c87ef2961dedb10d1f674c6a530e00dbab8ec1b
-  "open|creat: skip S_ISGID check on files created by non-group members" ]
-
-Signed-off-by: He Zhe <zhe.he@windriver.com>
----
- testcases/kernel/syscalls/creat/creat08.c | 13 ++++++-------
- testcases/kernel/syscalls/open/open10.c   | 12 +++++-------
- 2 files changed, 11 insertions(+), 14 deletions(-)
-
-diff --git a/testcases/kernel/syscalls/creat/creat08.c b/testcases/kernel/syscalls/creat/creat08.c
-index 50f2b3993..d22558ac3 100644
---- a/testcases/kernel/syscalls/creat/creat08.c
-+++ b/testcases/kernel/syscalls/creat/creat08.c
-@@ -361,13 +361,12 @@ int main(int ac, char **av)
- 			local_flag = FAILED;
- 		}
- 
--		/* Verify modes */
--		if (!(buf.st_mode & S_ISGID)) {
--			tst_resm(TFAIL,
--				 "%s: Incorrect modes, setgid bit should be set",
--				 setgid_B);
--			local_flag = FAILED;
--		}
-+		/*
-+		 * Skip S_ISGID check
-+		 * 0fa3ecd87848 ("Fix up non-directory creation in SGID directories")
-+		 * clears S_ISGID for files created by non-group members
-+		 */
-+
- 		close(fd);
- 
- 		if (local_flag == PASSED) {
-diff --git a/testcases/kernel/syscalls/open/open10.c b/testcases/kernel/syscalls/open/open10.c
-index 613f2288f..14feec9e1 100644
---- a/testcases/kernel/syscalls/open/open10.c
-+++ b/testcases/kernel/syscalls/open/open10.c
-@@ -345,13 +345,11 @@ int main(int ac, char *av[])
- 			local_flag = FAILED;
- 		}
- 
--		/* Verify modes */
--		if (!(buf.st_mode & S_ISGID)) {
--			tst_resm(TFAIL,
--				 "%s: Incorrect modes, setgid bit not set",
--				 setgid_B);
--			local_flag = FAILED;
--		}
-+		/*
-+		 * Skip S_ISGID check
-+		 * 0fa3ecd87848 ("Fix up non-directory creation in SGID directories")
-+		 * clears S_ISGID for files created by non-group members
-+		 */
- 
- 		if (local_flag == PASSED) {
- 			tst_resm(TPASS, "Test passed in block2.");
--- 
-2.11.0
-
diff --git a/meta/recipes-extended/ltp/ltp_20180515.bb b/meta/recipes-extended/ltp/ltp_20180926.bb
similarity index 92%
rename from meta/recipes-extended/ltp/ltp_20180515.bb
rename to meta/recipes-extended/ltp/ltp_20180926.bb
index ff85be723f..43f5f066e4 100644
--- a/meta/recipes-extended/ltp/ltp_20180515.bb
+++ b/meta/recipes-extended/ltp/ltp_20180926.bb
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM = "\
     file://testcases/kernel/hotplug/cpu_hotplug/COPYING;md5=e04a2e542b2b8629bf9cd2ba29b0fe41 \
     file://testcases/open_posix_testsuite/COPYING;md5=48b1c5ec633e3e30ec2cf884ae699947 \
     file://testcases/realtime/COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
-    file://tools/pounder21/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
     file://utils/benchmark/kernbench-0.42/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
     file://utils/ffsb-6.0-rc2/COPYING;md5=c46082167a314d785d012a244748d803 \
 "
@@ -28,10 +27,9 @@ CFLAGS_append_x86-64 = " -fomit-frame-pointer"
 
 CFLAGS_append_powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS_append_mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
-SRCREV = "96cbf48313afa65ef4d693d3441cbfd60a8d9b27"
+SRCREV = "f424769b1ad9fca477118763f88a6cec98ea2c0a"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git \
-           file://0001-mmap15-mips64-return-EINVAL.patch \
            file://0004-build-Add-option-to-select-libc-implementation.patch \
            file://0005-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch \
            file://0007-fix-__WORDSIZE-undeclared-when-building-with-musl.patch \
@@ -48,10 +46,6 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0035-fix-test_proc_kill-hang.patch \
            file://0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch \
            file://0039-commands-ar01-Fix-for-test-in-deterministic-mode.patch \
-           file://0040-read_all-Define-FNM_EXTMATCH-if-not-already-like-und.patch \
-           file://0041-cve-2017-5669-shmat-for-0-or-PAGESIZE-with-RND-flag-.patch \
-           file://0042-fs-ftest-ftest06.c-Fix-too-small-name-string-and-rel.patch \
-           file://0043-open-creat-skip-S_ISGID-check-on-files-created-by-no.patch \
            file://0001-syscalls-fcntl-make-OFD-command-use-fcntl64-syscall-.patch \
            file://0001-sigwaitinfo01-recent-glibc-calls-syscall-directly.patch \
            file://0001-netns_helper.sh-use-ping-6-when-ping6-is-not-avaliab.patch \
-- 
2.17.1


