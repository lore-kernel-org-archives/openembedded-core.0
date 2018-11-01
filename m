Return-Path: <petr.vorel@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3EB7A79EF5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Nov 2018 17:47:28 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id f1-v6so17229336edi.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Nov 2018 10:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9QQndTPOYvByal9GO7uSSuZVONIhdI/IDoVhMMihl9c=;
	b=YRBwvOHjSrbe0wS12Ve6SFZPBSXDHqWlmT18+ZmG7S+8itbBtUpDGAQK+jyIK0ZeaC
	koSM9ZYevucaKxuBCDhZ8CoZBrYOHxR66X+6chFRUVqh/4UkDMd4b1d+jK/s187wGoAM
	+8aYSxh9RNjBnRkjHfomkUOqxXEFU4wu9W1X80uHa15l7VoZ7xt15BvU6Tezij5noBcZ
	Bo64JOo2NTLgFe/FO/i4+dAE30tXOp7CiIwkmXFRQrXE1UvC6aRgvzZAwCeFz97X0Zmj
	HPswcTspFiXU8Uqxg2ljZxvoL3JENTjNmyz21GfvCemdK29vSpKooS2KrVWUt4ZhOWkB
	RHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9QQndTPOYvByal9GO7uSSuZVONIhdI/IDoVhMMihl9c=;
	b=XHVx0PV3jd0Qsge02l4wSYtXdxIUmbgYJLystVWADvvBhjwCoV0zFblVhaOHpTUUIL
	d9SNrWKM1BtbnT0QziXxK1J1Vc3HnBBR8EAPZ5IMtzhA2wKOwPrIdk/L2xBJZfk83jqO
	LMHgngOCwWu1sYLpUfNsG2gGsCOhoGMsJlMywEKTauUl59QFoB5RqkYYHDWh9anPk3s4
	z5HBEDwfHG8baTR4GK8vA2/mupk96ruWk7Bp1IrZqmv9cA/A1L0mFcWz1GCSFi9CtN34
	ereDtnT5OPbplrFoMpQHsynxxY2p85FAMKJ30UzLe1CalO4YuKp2Sm3jbbd8/plx823V
	iH3A==
X-Gm-Message-State: AGRZ1gKqgkUsvK96RJVxNJurcJckfVfv/LzY+jQ7GtfhKKXsW+CbhK1B
	tDaEJL0qDVcYnFto1vJItYUGxI0s
X-Google-Smtp-Source: AJdET5cBLg/+l3i6L5TpIZ+zUhmfHXbpJJS2AC7rNz0snbWOZ2SWu7xl/axplYs8YuKWTal8NcBg+A==
X-Received: by 2002:a17:906:1f99:: with SMTP id
	t25-v6mr4637795ejr.36.1541094447891; 
	Thu, 01 Nov 2018 10:47:27 -0700 (PDT)
Received: from dell5510.suse.cz ([62.201.25.198])
	by smtp.gmail.com with ESMTPSA id
	j24-v6sm5161258edp.27.2018.11.01.10.47.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Nov 2018 10:47:26 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Nov 2018 18:47:18 +0100
Message-Id: <20181101174718.19499-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH v2 1/1] ltp: Update to 20180926
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
X-List-Received-Date: Thu, 01 Nov 2018 17:47:28 -0000
Content-Transfer-Encoding: 8bit

New patches
* 0001-statx-fix-compile-errors.patch

Rebased patches
* 0039-commands-ar01-Fix-for-test-in-deterministic-mode.patch

Removed removed (accepted in upstream)
* 0041-cve-2017-5669-shmat-for-0-or-PAGESIZE-with-RND-flag-.patch
* 0042-fs-ftest-ftest06.c-Fix-too-small-name-string-and-rel.patch
* 0043-open-creat-skip-S_ISGID-check-on-files-created-by-no.patch

Removed patches (different fix accepted in upstream)
* 0001-mmap15-mips64-return-EINVAL.patch

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Changes v1->v2:
* Resolved rebase errors
---
 .../0001-mmap15-mips64-return-EINVAL.patch    | 41 --------
 .../ltp/0001-statx-fix-compile-errors.patch   | 34 +++++++
 ...1-Fix-for-test-in-deterministic-mode.patch | 42 ++++----
 ...mat-for-0-or-PAGESIZE-with-RND-flag-.patch | 97 -------------------
 ....c-Fix-too-small-name-string-and-rel.patch | 34 -------
 ...S_ISGID-check-on-files-created-by-no.patch | 81 ----------------
 .../ltp/{ltp_20180515.bb => ltp_20180926.bb}  |  8 +-
 7 files changed, 58 insertions(+), 279 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-mmap15-mips64-return-EINVAL.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-statx-fix-compile-errors.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0041-cve-2017-5669-shmat-for-0-or-PAGESIZE-with-RND-flag-.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0042-fs-ftest-ftest06.c-Fix-too-small-name-string-and-rel.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0043-open-creat-skip-S_ISGID-check-on-files-created-by-no.patch
 rename meta/recipes-extended/ltp/{ltp_20180515.bb => ltp_20180926.bb} (93%)

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
diff --git a/meta/recipes-extended/ltp/ltp/0001-statx-fix-compile-errors.patch b/meta/recipes-extended/ltp/ltp/0001-statx-fix-compile-errors.patch
new file mode 100644
index 0000000000..c4fd8d0223
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-statx-fix-compile-errors.patch
@@ -0,0 +1,34 @@
+From a945304b6a2286d0665c70250cc5475eb07fd21e Mon Sep 17 00:00:00 2001
+From: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
+Date: Wed, 26 Sep 2018 11:15:45 -0300
+Subject: [PATCH] statx: fix compile errors
+
+struct statx is only defined in sys/stat.h when _GNU_SOURCE is defined.
+The testcases do define _GNU_SOURCE, but not the m4 struct check.
+
+Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
+Acked-by: Cyril Hrubis <chrubis@suse.cz>
+---
+ m4/ltp-statx.m4 | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/m4/ltp-statx.m4 b/m4/ltp-statx.m4
+index 44303d30c..5f79a94cd 100644
+--- a/m4/ltp-statx.m4
++++ b/m4/ltp-statx.m4
+@@ -23,6 +23,11 @@ dnl
+ AC_DEFUN([LTP_CHECK_STATX],[
+ AC_CHECK_FUNCS(statx,,,[[#include <sys/stat.h>]])
+ AC_CHECK_HEADER(linux/fs.h,,,)
+-AC_CHECK_TYPES([struct statx],,,[[#include <sys/stat.h>]])
+-AC_CHECK_TYPES([struct statx_timestamp],,,[[#include <sys/stat.h>]])
++AC_CHECK_TYPES([struct statx],,,[[
++	#define _GNU_SOURCE
++	#include <sys/stat.h>
++]])
++AC_CHECK_TYPES([struct statx_timestamp],,,[[
++	#define _GNU_SOURCE
++	#include <sys/stat.h>]])
+ ])
+--
+2.19.1
diff --git a/meta/recipes-extended/ltp/ltp/0039-commands-ar01-Fix-for-test-in-deterministic-mode.patch b/meta/recipes-extended/ltp/ltp/0039-commands-ar01-Fix-for-test-in-deterministic-mode.patch
index e7c927e116..9244a06b44 100644
--- a/meta/recipes-extended/ltp/ltp/0039-commands-ar01-Fix-for-test-in-deterministic-mode.patch
+++ b/meta/recipes-extended/ltp/ltp/0039-commands-ar01-Fix-for-test-in-deterministic-mode.patch
@@ -21,16 +21,18 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 52 insertions(+), 40 deletions(-)
 
 diff --git a/testcases/commands/ar/ar01 b/testcases/commands/ar/ar01
-index ddab2e0..d688f76 100644
+index be105f6da..813a51d9c 100644
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
@@ -248,5 +250,5 @@ index ddab2e0..d688f76 100644
  	printf "x - file2.in\n" > ar.exp
  
 -- 
-2.7.4
+2.19.0.rc2
 
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
similarity index 93%
rename from meta/recipes-extended/ltp/ltp_20180515.bb
rename to meta/recipes-extended/ltp/ltp_20180926.bb
index ff85be723f..622c1f42f7 100644
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
@@ -49,13 +47,11 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch \
            file://0039-commands-ar01-Fix-for-test-in-deterministic-mode.patch \
            file://0040-read_all-Define-FNM_EXTMATCH-if-not-already-like-und.patch \
-           file://0041-cve-2017-5669-shmat-for-0-or-PAGESIZE-with-RND-flag-.patch \
-           file://0042-fs-ftest-ftest06.c-Fix-too-small-name-string-and-rel.patch \
-           file://0043-open-creat-skip-S_ISGID-check-on-files-created-by-no.patch \
            file://0001-syscalls-fcntl-make-OFD-command-use-fcntl64-syscall-.patch \
            file://0001-sigwaitinfo01-recent-glibc-calls-syscall-directly.patch \
            file://0001-netns_helper.sh-use-ping-6-when-ping6-is-not-avaliab.patch \
            file://0001-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch \
+           file://0001-statx-fix-compile-errors.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.19.1


