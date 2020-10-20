Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.845.1603224595321590286
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2020 13:09:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=b27Bar5k;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: petr.vorel@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id i1so4006191wro.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2020 13:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1uMh/K0kzYJSls5VeXvW0T1UMV81zuam63olbMhAPkE=;
        b=b27Bar5kV5PpCFXY5MSZi1pq5kmRaFdgLUJLF3/gZaeBuy61UT3/cJYMUMYFitMhqO
         tooGr+PghlOFKhtJdg/0yBEVhAi7Fb3hgzkreGopdrGgHsHuxYAqyZUHqKr7OoGVwHhn
         hyWkvbI6T1Iqav8mDOwNVPPk1dEB/citlZ7q695Nj+2L6TSIY5jTaxkbch93vi1q5TrW
         gpn9inNIOAwlEH6JkfGEXIXqz3tg4TmumCG/+WrIvjtatyUEk2wkBOVHUzByZZSN4/Ey
         xKpM157QeoVOBQJzbsaeM8qUzz6C0LYf0k/Rx6cJDc8Yw7s8X0Eb7tSx1Y5NF5LCrwR3
         IxRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1uMh/K0kzYJSls5VeXvW0T1UMV81zuam63olbMhAPkE=;
        b=FrGGGe2J0subPSA5jBdQtZoN6K6MH/g479b3rEB/00IixYeP12U0aTWGot1gknPDMw
         U+EUKTGZgjg9pqayPZbbsqqYr+elk3GPjMS7n/wJRR+snB/redecaWLaDVKhrsLY9X9c
         8ZdmsRjTcrSCt+oYlOSssBRvb4ZQED6xE2QMgaPVh22aPlOAYSjpfanX26jVhePVti25
         idHqLNFj0/ONfumDJE6EWIYj9ga21vidchzxZalpfjnOgQ6BF5I2EG4qHqIMR1ihTstd
         2aBZPynTfhzc66iDmDS6TGw9aR1Xls9o65MFsz9fmxPC1JbCj1Do0SSCcJXz1rFVsKTg
         zivw==
X-Gm-Message-State: AOAM533v5XhCJO/vladbI44K2AeH3BTkr2kRgaTkr0IShlF8yBAgpxQ0
	FTW7lf/zLbthV9/4bWE/PqU7I61hy/M3DA==
X-Google-Smtp-Source: ABdhPJzLvTW9TWNSnxVAlg/WA++QgE6MAL4xG8k6DX99o4E/MH5oYOmIwCNxqvcBXc/6RcSWoAeINQ==
X-Received: by 2002:a7b:c20e:: with SMTP id x14mr4438808wmi.76.1603224592523;
        Tue, 20 Oct 2020 13:09:52 -0700 (PDT)
Return-Path: <petr.vorel@gmail.com>
Received: from dell5510.suse.de ([62.201.25.198])
        by smtp.gmail.com with ESMTPSA id o4sm4507615wrv.8.2020.10.20.13.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 13:09:51 -0700 (PDT)
From: "Petr Vorel" <petr.vorel@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Petr Vorel <petr.vorel@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Anuj Mittal <anuj.mittal@intel.com>,
	He Zhe <zhe.he@windriver.com>,
	Anders Roxell <anders.roxell@linaro.org>,
	Yi Zhao <yi.zhao@windriver.com>,
	=?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH v4 1/1] ltp: Update to 20200930
Date: Tue, 20 Oct 2020 22:09:45 +0200
Message-Id: <20201020200945.3089-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

New patches (backported musl related fixes):
* cacheflush01-Rewrite-into-new-API.patch
* lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch

Dropped patches (not applicable)
* 0001-sigwaitinfo-Do-not-run-invalid-undefined-test-cases.patch

Dropped patches from this release:
* 0001-ptrace01-Fix-missing-format-string.patch
* 0001-syscalls-copy_file_range02-Expect-EFBIG-in-subcase-m.patch
* 0004-guard-mallocopt-with-__GLIBC__.patch

Rebased patches:
* 0001-Remove-OOM-tests-from-runtest-mm.patch

Add change status of 2 patches from Pending to Inappropriate and add
note why.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
* changes v3-v4:
Further fixes of upstream status (s/Pending/Inappropriate/ + note)
(asked by Alexander Kanavin)

Kind regards,
Petr

 .../ltp/0001-Add-more-musl-exclusions.patch   |   3 +-
 ...001-Remove-OOM-tests-from-runtest-mm.patch |  26 +-
 ...option-to-select-libc-implementation.patch |   3 +-
 ...1-ptrace01-Fix-missing-format-string.patch |  33 ---
 ...not-run-invalid-undefined-test-cases.patch |  69 ------
 ...le_range02-Expect-EFBIG-in-subcase-m.patch |  57 -----
 .../0004-guard-mallocopt-with-__GLIBC__.patch |  34 ---
 .../cacheflush01-Rewrite-into-new-API.patch   | 225 ++++++++++++++++++
 ...ysinfo.h-to-fix-build-with-MUSL-libc.patch | 203 ++++++++++++++++
 .../ltp/{ltp_20200515.bb => ltp_20200930.bb}  |   8 +-
 10 files changed, 447 insertions(+), 214 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-ptrace01-Fix-missing-format-string.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-sigwaitinfo-Do-not-run-invalid-undefined-test-cases.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-syscalls-copy_file_range02-Expect-EFBIG-in-subcase-m.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0004-guard-mallocopt-with-__GLIBC__.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/cacheflush01-Rewrite-into-new-API.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch
 rename meta/recipes-extended/ltp/{ltp_20200515.bb => ltp_20200930.bb} (93%)

diff --git a/meta/recipes-extended/ltp/ltp/0001-Add-more-musl-exclusions.patch b/meta/recipes-extended/ltp/ltp/0001-Add-more-musl-exclusions.patch
index f2fc8ee958..da3c36456a 100644
--- a/meta/recipes-extended/ltp/ltp/0001-Add-more-musl-exclusions.patch
+++ b/meta/recipes-extended/ltp/ltp/0001-Add-more-musl-exclusions.patch
@@ -3,7 +3,8 @@ From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 20 Dec 2019 13:06:05 +0100
 Subject: [PATCH] Add more musl exclusions
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [pvorel: this is not going to be merged, instead each test needs to be fixed]
+
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 [ pvorel: rebase for 20200515: enable accept4_01 ]
 [ pvorel: rebase for 20200120: enable fanotify13, fanotify15, setxattr03 ]
diff --git a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
index 6b665030c3..95366aee37 100644
--- a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
+++ b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
@@ -1,25 +1,25 @@
-From 13ef88cdccfe3f58c53d57806866b91e310eb272 Mon Sep 17 00:00:00 2001
+From 5093e44f02be0a3f1a5a79987a90ad43a2bc26c5 Mon Sep 17 00:00:00 2001
 From: "Mingde (Matthew) Zeng" <matthewzmd@gmail.com>
-Date: Wed, 29 Jul 2020 08:47:09 -0400
-Subject: [PATCH] Remove OOM tests from runtest/mm
-
-Disable OOM tests, as they might cause oeqa ssh connection lost
+Date: Mon, 19 Oct 2020 12:31:23 +0200
+Subject: [PATCH] Disable OOM tests, as they might cause oeqa ssh connection
+ lost
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
-
+[ pvorel: rebase for 20200930 ]
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
 ---
  runtest/mm | 6 ------
  1 file changed, 6 deletions(-)
 
 diff --git a/runtest/mm b/runtest/mm
-index a09f39c1e..76fa82754 100644
+index 481d39691..cf207d10e 100644
 --- a/runtest/mm
 +++ b/runtest/mm
-@@ -73,12 +73,6 @@ ksm06 ksm06
- ksm06_1 ksm06 -n 10
- ksm06_2 ksm06 -n 10000
-
+@@ -74,12 +74,6 @@ ksm06_2 ksm06 -n 10000
+ 
+ cpuset01 cpuset01
+ 
 -oom01 oom01
 -oom02 oom02
 -oom03 oom03
@@ -27,8 +27,8 @@ index a09f39c1e..76fa82754 100644
 -oom05 oom05
 -
  swapping01 swapping01 -i 5
-
+ 
  thp01 thp01 -I 120
---
+-- 
 2.27.0
 
diff --git a/meta/recipes-extended/ltp/ltp/0001-build-Add-option-to-select-libc-implementation.patch b/meta/recipes-extended/ltp/ltp/0001-build-Add-option-to-select-libc-implementation.patch
index 29b2bf7e41..97b4af0b7a 100644
--- a/meta/recipes-extended/ltp/ltp/0001-build-Add-option-to-select-libc-implementation.patch
+++ b/meta/recipes-extended/ltp/ltp/0001-build-Add-option-to-select-libc-implementation.patch
@@ -9,8 +9,7 @@ different and does not implement all GNU extensions.
 
 Disable tests specifically not building _yet_ on musl based systems
 
-Upstream-Status: Pending (pvorel: this is not going to be fixed, instead
-each test needs to be fixed)
+Upstream-Status: Inappropriate [pvorel: this is not going to be merged, instead each test needs to be fixed]
 
 rt_tgsigqueueinfo fails with:
 rt_tgsigqueueinfo01.c: In function 'sigusr1_handler':
diff --git a/meta/recipes-extended/ltp/ltp/0001-ptrace01-Fix-missing-format-string.patch b/meta/recipes-extended/ltp/ltp/0001-ptrace01-Fix-missing-format-string.patch
deleted file mode 100644
index 27b890e22b..0000000000
--- a/meta/recipes-extended/ltp/ltp/0001-ptrace01-Fix-missing-format-string.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From adb9587466a493fdd9d4410f1b8b130ebca06daa Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 19 May 2020 22:21:23 -0700
-Subject: [PATCH] ptrace01: Fix missing format string
-
-Fixes
-| ptrace01.c:89:2: error: format string is not a string literal
-(potentially insecure) [-Werror,-Wformat-security]
-|         tst_res(TINFO, tc->message);
-|         ^              ~~~~~~~~~~~
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Backport [58424835952641f4fd60c0ae3ab6c64decca3f8a]
----
- testcases/kernel/syscalls/ptrace/ptrace01.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/testcases/kernel/syscalls/ptrace/ptrace01.c b/testcases/kernel/syscalls/ptrace/ptrace01.c
-index 87a99e4150..9071bbabaf 100644
---- a/testcases/kernel/syscalls/ptrace/ptrace01.c
-+++ b/testcases/kernel/syscalls/ptrace/ptrace01.c
-@@ -86,7 +86,7 @@ static void run(unsigned int i)
- 
- 	got_signal = 0;
- 
--	tst_res(TINFO, tc->message);
-+	tst_res(TINFO, "%s", tc->message);
- 
- 	if (tc->handler == 1) {
- 		parent_act.sa_handler = parent_handler;
--- 
-2.26.2
-
diff --git a/meta/recipes-extended/ltp/ltp/0001-sigwaitinfo-Do-not-run-invalid-undefined-test-cases.patch b/meta/recipes-extended/ltp/ltp/0001-sigwaitinfo-Do-not-run-invalid-undefined-test-cases.patch
deleted file mode 100644
index 17d5af89e2..0000000000
--- a/meta/recipes-extended/ltp/ltp/0001-sigwaitinfo-Do-not-run-invalid-undefined-test-cases.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From e0a63deb1857eb90288e90d6368df70cdd0c0ec9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 28 May 2020 13:04:33 -0700
-Subject: [PATCH] sigwaitinfo: Do not run invalid/undefined test cases
-
-These testcases run for eternity on musl
-
-test_bad_address* cases are passing invalid pointers to a function; that's always UB
-empty_set and timeout rely on the implementation-defined "may fail" for EINTR in sigtimedwait [1]
-
-normally "may fail" is an "unspecified" but here the impl
-is supposed to document it so it's "impl-defined"
-
-[1] https://pubs.opengroup.org/onlinepubs/9699919799/functions/sigtimedwait.html
-
-Upstream-Status: Submitted [https://patchwork.ozlabs.org/project/ltp/patch/20200528204556.2444156-1-raj.khem@gmail.com/]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Cc: Rich Felker <dalias@aerifal.cx>
----
- .../kernel/syscalls/sigwaitinfo/sigwaitinfo01.c      | 12 ++----------
- 1 file changed, 2 insertions(+), 10 deletions(-)
-
---- a/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
-+++ b/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
-@@ -422,15 +422,10 @@ struct test_desc {
- } tests[] = {
- #ifdef TEST_RT_SIGTIMEDWAIT
- 	{
--	test_empty_set, my_rt_sigtimedwait, SIGUSR1}, {
- 	test_unmasked_matching, my_rt_sigtimedwait, SIGUSR1}, {
- 	test_masked_matching, my_rt_sigtimedwait, SIGUSR1}, {
- 	test_unmasked_matching_noinfo, my_rt_sigtimedwait, SIGUSR1}, {
--	test_masked_matching_noinfo, my_rt_sigtimedwait, SIGUSR1}, {
--	test_bad_address, my_rt_sigtimedwait, SIGUSR1}, {
--	test_bad_address2, my_rt_sigtimedwait, SIGUSR1}, {
--	test_bad_address3, my_rt_sigtimedwait, SIGUSR1}, {
--	test_timeout, my_rt_sigtimedwait, 0},
-+	test_masked_matching_noinfo, my_rt_sigtimedwait, SIGUSR1}, 
- 	    /* Special cases */
- 	    /* 1: sigwaitinfo does respond to ignored signal */
- 	{
-@@ -452,25 +447,17 @@ struct test_desc {
- #endif
- #if defined TEST_SIGWAITINFO
- 	{
--	test_empty_set, my_sigwaitinfo, SIGUSR1}, {
- 	test_unmasked_matching, my_sigwaitinfo, SIGUSR1}, {
- 	test_masked_matching, my_sigwaitinfo, SIGUSR1}, {
- 	test_unmasked_matching_noinfo, my_sigwaitinfo, SIGUSR1}, {
--	test_masked_matching_noinfo, my_sigwaitinfo, SIGUSR1}, {
--	test_bad_address, my_sigwaitinfo, SIGUSR1}, {
--	test_bad_address2, my_sigwaitinfo, SIGUSR1},
-+	test_masked_matching_noinfo, my_sigwaitinfo, SIGUSR1},
- #endif
- #if defined TEST_SIGTIMEDWAIT
- 	{
--	test_empty_set, my_sigtimedwait, SIGUSR1}, {
- 	test_unmasked_matching, my_sigtimedwait, SIGUSR1}, {
- 	test_masked_matching, my_sigtimedwait, SIGUSR1}, {
- 	test_unmasked_matching_noinfo, my_sigtimedwait, SIGUSR1}, {
--	test_masked_matching_noinfo, my_sigtimedwait, SIGUSR1}, {
--	test_bad_address, my_sigtimedwait, SIGUSR1}, {
--	test_bad_address2, my_sigtimedwait, SIGUSR1}, {
--	test_bad_address3, my_sigtimedwait, SIGUSR1}, {
--	test_timeout, my_sigtimedwait, 0},
-+	test_masked_matching_noinfo, my_sigtimedwait, SIGUSR1},
- #endif
- };
- 
diff --git a/meta/recipes-extended/ltp/ltp/0001-syscalls-copy_file_range02-Expect-EFBIG-in-subcase-m.patch b/meta/recipes-extended/ltp/ltp/0001-syscalls-copy_file_range02-Expect-EFBIG-in-subcase-m.patch
deleted file mode 100644
index 09b6f54874..0000000000
--- a/meta/recipes-extended/ltp/ltp/0001-syscalls-copy_file_range02-Expect-EFBIG-in-subcase-m.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 99687ab002f9f750f6f18fa1d70a91f0aa4f8ba2 Mon Sep 17 00:00:00 2001
-From: He Zhe <zhe.he@windriver.com>
-Date: Thu, 18 Jun 2020 17:18:27 +0800
-Subject: [PATCH] syscalls/copy_file_range02: Expect EFBIG in subcase max
- length on 32-bit architectures
-
-For syscall
-ssize_t copy_file_range(int fd_in, loff_t *off_in,
-                               int fd_out, loff_t *off_out,
-                               size_t len, unsigned int flags);
-off_out is loff_t* that is long long, 64 bits on 32-bit architectures,
-while len is size_t that unsigned int, 32 bits on 32-bit architectures.
-
-In subcase "max length", simplified as below,
-
-dst = tst_max_lfs_filesize();
-TEST(sys_copy_file_range(fd_src, 0, *tc->copy_to_fd, &dst, tc->len, tc->flags));
-
-where dst is 4K*4G and len is 4G, so (4K+1)*4G is always smaller than 4G*4G,
-it can never match the following kernel condition on 32-bit architectures.
-
-if (pos_in + count < pos_in || pos_out + count < pos_out)
-	return -EOVERFLOW;
-
-And thus we would get error like
-copy_file_range02.c:139: FAIL: copy_file_range failed unexpectedly; expected EOVERFLOW, but got: EFBIG (27)
-
-Also correct a typo.
-
-Upstream-Status: Backport [http://lists.linux.it/pipermail/ltp/2020-June/017716.html]
-
-Signed-off-by: He Zhe <zhe.he@windriver.com>
-Acked-by: Li Wang <liwang@redhat.com>
----
- .../kernel/syscalls/copy_file_range/copy_file_range02.c     | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
-index fa679c4d3..bc27fbe57 100644
---- a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
-+++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
-@@ -78,7 +78,11 @@ static struct tcase {
- 	{&fd_chrdev,	0,	EINVAL,		CONTSIZE,	"char device",	0},
- 	{&fd_fifo,	0,	EINVAL,		CONTSIZE,	"fifo", 	0},
- 	{&fd_pipe[0],	0,	EINVAL,		CONTSIZE,	"pipe", 	0},
--	{&fd_copy,	0,	EOVERFLOW,	ULLONG_MAX,	"max length lenght", 	1},
-+#ifdef TST_ABI64
-+	{&fd_copy,	0,	EOVERFLOW,	ULLONG_MAX,	"max length", 	1},
-+#else
-+	{&fd_copy,	0,	EFBIG,		ULLONG_MAX,	"max length", 	1},
-+#endif
- 	{&fd_copy,	0,	EFBIG,		MIN_OFF,	"max file size", 	1},
- };
- 
--- 
-2.17.1
-
diff --git a/meta/recipes-extended/ltp/ltp/0004-guard-mallocopt-with-__GLIBC__.patch b/meta/recipes-extended/ltp/ltp/0004-guard-mallocopt-with-__GLIBC__.patch
deleted file mode 100644
index a187f61f08..0000000000
--- a/meta/recipes-extended/ltp/ltp/0004-guard-mallocopt-with-__GLIBC__.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From d0fc9ca5d3366f9b8907e463222403cd2327be10 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 8 Jan 2016 06:51:20 +0000
-Subject: [PATCH] guard mallocopt() with __GLIBC__
-
-mallocopt is not available on non glibc implementations
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
-Upstream-Status: Accepted [967612c454aea66770b64f69287671037fe895b3]
----
- utils/benchmark/ebizzy-0.3/ebizzy.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/utils/benchmark/ebizzy-0.3/ebizzy.c b/utils/benchmark/ebizzy-0.3/ebizzy.c
-index 5bb8eff..934d951 100644
---- a/utils/benchmark/ebizzy-0.3/ebizzy.c
-+++ b/utils/benchmark/ebizzy-0.3/ebizzy.c
-@@ -215,10 +215,10 @@ static void read_options(int argc, char *argv[])
- 			"\"never mmap\" option specified\n");
- 		usage();
- 	}
--
-+#ifdef __GLIBC__
- 	if (never_mmap)
- 		mallopt(M_MMAP_MAX, 0);
--
-+#endif
- 	if (chunk_size < record_size) {
- 		fprintf(stderr, "Chunk size %u smaller than record size %u\n",
- 			chunk_size, record_size);
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/ltp/ltp/cacheflush01-Rewrite-into-new-API.patch b/meta/recipes-extended/ltp/ltp/cacheflush01-Rewrite-into-new-API.patch
new file mode 100644
index 0000000000..fc41b72049
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/cacheflush01-Rewrite-into-new-API.patch
@@ -0,0 +1,225 @@
+From 48edd768850825a4d01e5e5e737122333fc55cdf Mon Sep 17 00:00:00 2001
+From: Petr Vorel <petr.vorel@gmail.com>
+Date: Fri, 2 Oct 2020 21:29:58 +0200
+Subject: [PATCH] cacheflush01: Rewrite into new API
+
+This syscall is currently (v5.9) supported on these architectures:
+arc, csky, mips, m68k, nds32, sh
+
+constants are missing for m68k, not sure if the testcase is valid for it.
+Untested.
+
+Test for __LTP__NR_INVALID_SYSCALL saves adding autotools check for
+<asm/cachectl.h>.
+
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+---
+Upstream-Status: Backport [https://github.com/linux-test-project/ltp/commit/a06fcc4b7f76e5a2138c356670d04df71fc88ab7]
+ .../kernel/syscalls/cacheflush/cacheflush01.c | 173 ++++--------------
+ 1 file changed, 40 insertions(+), 133 deletions(-)
+
+diff --git a/testcases/kernel/syscalls/cacheflush/cacheflush01.c b/testcases/kernel/syscalls/cacheflush/cacheflush01.c
+index 29cf2014a..6ad8b953a 100644
+--- a/testcases/kernel/syscalls/cacheflush/cacheflush01.c
++++ b/testcases/kernel/syscalls/cacheflush/cacheflush01.c
+@@ -1,157 +1,64 @@
+-/******************************************************************************/
+-/* Copyright (c) Maxin John <maxin.john@gmail.com>, 2009                      */
+-/* LKML Reference: http://lkml.org/lkml/2009/4/9/203                          */
+-/* This program is free software;  you can redistribute it and/or modify      */
+-/* it under the terms of the GNU General Public License as published by       */
+-/* the Free Software Foundation; either version 2 of the License, or          */
+-/* (at your option) any later version.                                        */
+-/*                                                                            */
+-/* This program is distributed in the hope that it will be useful,            */
+-/* but WITHOUT ANY WARRANTY;  without even the implied warranty of            */
+-/* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See                  */
+-/* the GNU General Public License for more details.                           */
+-/*                                                                            */
+-/* You should have received a copy of the GNU General Public License          */
+-/* along with this program;  if not, write to the Free Software               */
+-/* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA    */
+-/*                                                                            */
+-/******************************************************************************/
+-/******************************************************************************/
+-/*                                                                            */
+-/* File:        cacheflush01.c                                                */
+-/*                                                                            */
+-/* Description: The cacheflush_check() syscall                     	      */
+-/*		Tests EINVAL error of cacheflush system call.		      */
+-/* 		Its expected behaviour is cacheflush() should return -EINVAL  */
+-/*		when cache parameter is not one of ICACHE, DCACHE, or BCACHE. */
+-/*                                                                            */
+-/* Usage:  <for command-line>                                                 */
+-/* cacheflush01 [-c n] [-e][-i n] [-I x] [-p x] [-t]                          */
+-/*      where,  -c n : Run n copies concurrently.                             */
+-/*              -e   : Turn on errno logging.                                 */
+-/*              -i n : Execute test n times.                                  */
+-/*              -I x : Execute test for x seconds.                            */
+-/*              -P x : Pause for x seconds between iterations.                */
+-/*              -t   : Turn on syscall timing.                                */
+-/*                                                                            */
+-/* Total Tests: 1                                                             */
+-/*                                                                            */
+-/* Test Name:   cacheflush01                                                  */
+-/******************************************************************************/
++// SPDX-License-Identifier: GPL-2.0-or-later
+ 
+-#include <unistd.h>
+-#include <stdio.h>
+-#include <stdlib.h>
+-#include <errno.h>
+-
+-#include "test.h"
++#include "tst_test.h"
+ #include "lapi/syscalls.h"
+ 
+ #if __NR_cacheflush != __LTP__NR_INVALID_SYSCALL
++
+ #include <asm/cachectl.h>
+-#else
++
++/*
++ * m68k does not have these constants
++ */
++
+ #ifndef   ICACHE
+-#define   ICACHE   (1<<0)	/* flush instruction cache        */
++# define   ICACHE   (1<<0)
+ #endif
++
+ #ifndef   DCACHE
+-#define   DCACHE   (1<<1)	/* writeback and flush data cache */
++# define   DCACHE   (1<<1)
+ #endif
++
+ #ifndef   BCACHE
+-#define   BCACHE   (ICACHE|DCACHE)	/* flush both caches              */
+-#endif
++# define   BCACHE   (ICACHE|DCACHE)
+ #endif
+ 
+-char *TCID = "cacheflush01";
+-int TST_TOTAL = 1;
++#define CACHE_DESC(x) .cache = x, .desc = #x
+ 
+-/* Extern Global Functions */
+-/******************************************************************************/
+-/*                                                                            */
+-/* Function:    cleanup                                                       */
+-/*                                                                            */
+-/* Description: Performs all one time clean up for this test on successful    */
+-/*              completion,  premature exit or  failure. Closes all temporary */
+-/*              files, removes all temporary directories exits the test with  */
+-/*              appropriate return code by calling tst_exit() function.       */
+-/*                                                                            */
+-/* Input:       None.                                                         */
+-/*                                                                            */
+-/* Output:      None.                                                         */
+-/*                                                                            */
+-/* Return:      On failure - Exits calling tst_exit(). Non '0' return code.   */
+-/*              On success - Exits calling tst_exit(). With '0' return code.  */
+-/*                                                                            */
+-/******************************************************************************/
+-void cleanup(void)
+-{
++static struct test_case_t {
++	int cache;
++	const char *desc;
++} test_cases[] = {
++	{ CACHE_DESC(ICACHE) },
++	{ CACHE_DESC(DCACHE) },
++	{ CACHE_DESC(BCACHE) },
++};
+ 
+-	tst_rmdir();
+-}
++static char *addr;
+ 
+-/* Local  Functions */
+-/******************************************************************************/
+-/*                                                                            */
+-/* Function:    setup                                                         */
+-/*                                                                            */
+-/* Description: Performs all one time setup for this test. This function is   */
+-/*              typically used to capture signals, create temporary dirs      */
+-/*              and temporary files that may be used in the course of this    */
+-/*              test.                                                         */
+-/*                                                                            */
+-/* Input:       None.                                                         */
+-/*                                                                            */
+-/* Output:      None.                                                         */
+-/*                                                                            */
+-/* Return:      On failure - Exits by calling cleanup().                      */
+-/*              On success - returns 0.                                       */
+-/*                                                                            */
+-/******************************************************************************/
+-void setup(void)
++static void setup(void)
+ {
+-	/* Capture signals if any */
+-	/* Create temporary directories */
+-	TEST_PAUSE;
+-	tst_tmpdir();
++	addr = SAFE_MALLOC(getpagesize());
+ }
+ 
+-int main(int ac, char **av)
++static void test_cacheflush(unsigned int i)
+ {
++	struct test_case_t *tc = &test_cases[i];
+ 
+-	char *addr = NULL;
+-
+-	tst_parse_opts(ac, av, NULL, NULL);
+-
+-	setup();
+-
+-	tst_count = 0;
+-	/* Create some user address range */
+-	addr = malloc(getpagesize());
+-	if (addr == NULL) {
+-		tst_brkm(TFAIL | TTERRNO, cleanup, "malloc failed");
+-	}
+-
+-	/* Invokes cacheflush() with proper parameters */
+-	TEST(ltp_syscall(__NR_cacheflush, addr, getpagesize(), ICACHE));
+-	if (TEST_RETURN == 0) {
+-		tst_resm(TPASS, "passed with no errno");
+-	} else {
+-		tst_resm(TFAIL, "failed with unexpected errno");
+-	}
+-
+-	TEST(ltp_syscall(__NR_cacheflush, addr, getpagesize(), DCACHE));
+-	if (TEST_RETURN == 0) {
+-		tst_resm(TPASS, "passed with no errno");
++	TEST(tst_syscall(__NR_cacheflush, addr, getpagesize(), tc->cache));
++	if (TST_RET == 0) {
++		tst_res(TPASS, "%s passed", tc->desc);
+ 	} else {
+-		tst_resm(TFAIL, "failed with unexpected errno");
++		tst_res(TFAIL | TTERRNO, "%s failed", tc->desc);
+ 	}
++}
+ 
+-	TEST(ltp_syscall(__NR_cacheflush, addr, getpagesize(), BCACHE));
+-	if (TEST_RETURN == 0) {
+-		tst_resm(TPASS, "passed with no errno");
+-	} else {
+-		tst_resm(TFAIL, "failed with unexpected errno");
+-	}
++static struct tst_test test = {
++	.setup = setup,
++	.test = test_cacheflush,
++	.tcnt = ARRAY_SIZE(test_cases),
++};
+ 
+-	cleanup();
+-	tst_exit();
+-}
++#else
++	TST_TEST_TCONF("system doesn't support cacheflush()");
++#endif
+-- 
+2.28.0
+
diff --git a/meta/recipes-extended/ltp/ltp/lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch b/meta/recipes-extended/ltp/ltp/lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch
new file mode 100644
index 0000000000..f0b8df11b6
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch
@@ -0,0 +1,203 @@
+From ac3e262cba81889c0bb04ce87a50a1709f2726e7 Mon Sep 17 00:00:00 2001
+From: Petr Vorel <petr.vorel@gmail.com>
+Date: Thu, 1 Oct 2020 23:28:39 +0200
+Subject: [PATCH] lapi: Add sysinfo.h to fix build with MUSL libc
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The reason is to avoid indirect <linux/sysinfo.h> include when using
+some network headers: <linux/netlink.h> or others -> <linux/kernel.h>
+-> <linux/sysinfo.h>
+
+This indirect include causes on MUSL redefinition of struct sysinfo when
+included both <sys/sysinfo.h> and some of UAPI headers:
+
+In file included from x86_64-buildroot-linux-musl/sysroot/usr/include/linux/kernel.h:5,
+                 from x86_64-buildroot-linux-musl/sysroot/usr/include/linux/netlink.h:5,
+                 from ../include/tst_netlink.h:14,
+                 from tst_crypto.c:13:
+x86_64-buildroot-linux-musl/sysroot/usr/include/linux/sysinfo.h:8:8: error: redefinition of ‘struct sysinfo’
+ struct sysinfo {
+        ^~~~~~~
+In file included from ../include/tst_safe_macros.h:15,
+                 from ../include/tst_test.h:93,
+                 from tst_crypto.c:11:
+x86_64-buildroot-linux-musl/sysroot/usr/include/sys/sysinfo.h:10:8: note: originally defined here
+
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+Upstream-Status: Submitted [https://patchwork.ozlabs.org/project/ltp/patch/20201001231256.6930-1-petr.vorel@gmail.com/]
+---
+ include/lapi/sysinfo.h                        | 22 +++++++++++++++++++
+ include/tst_safe_macros.h                     |  2 +-
+ lib/safe_macros.c                             |  2 +-
+ lib/tst_memutils.c                            |  2 +-
+ testcases/kernel/mem/mtest01/mtest01.c        |  2 +-
+ testcases/kernel/syscalls/madvise/madvise06.c |  2 +-
+ testcases/kernel/syscalls/sysinfo/sysinfo01.c |  2 +-
+ testcases/kernel/syscalls/sysinfo/sysinfo02.c |  2 +-
+ testcases/kernel/syscalls/sysinfo/sysinfo03.c |  2 +-
+ 9 files changed, 30 insertions(+), 8 deletions(-)
+ create mode 100644 include/lapi/sysinfo.h
+
+diff --git a/include/lapi/sysinfo.h b/include/lapi/sysinfo.h
+new file mode 100644
+index 000000000..d0e0e93d7
+--- /dev/null
++++ b/include/lapi/sysinfo.h
+@@ -0,0 +1,22 @@
++// SPDX-License-Identifier: GPL-2.0-or-later
++/*
++ * Copyright (c) 2020 Petr Vorel <petr.vorel@gmail.com>
++ */
++
++#ifndef SYSINFO_H__
++
++/*
++ * Don't use <sys/sysinfo.h> as it breaks build MUSL toolchain.
++ * Use <linux/sysinfo.h> instead.
++ *
++ * Some kernel UAPI headers do indirect <linux/sysinfo.h> include:
++ * <linux/netlink.h> or others -> <linux/kernel.h> -> <linux/sysinfo.h>
++ *
++ * This indirect include causes on MUSL redefinition of struct sysinfo when
++ * included both <sys/sysinfo.h> and some of UAPI headers:
++ */
++#include <linux/sysinfo.h>
++
++#define SYSINFO_H__
++
++#endif /* SYSINFO_H__ */
+diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
+index 053c3bcf9..61ea2076d 100644
+--- a/include/tst_safe_macros.h
++++ b/include/tst_safe_macros.h
+@@ -12,7 +12,7 @@
+ #include <sys/resource.h>
+ #include <sys/stat.h>
+ #include <sys/vfs.h>
+-#include <sys/sysinfo.h>
++#include <linux/sysinfo.h>
+ #include <fcntl.h>
+ #include <libgen.h>
+ #include <signal.h>
+diff --git a/lib/safe_macros.c b/lib/safe_macros.c
+index 4f48d7529..d8ee03dae 100644
+--- a/lib/safe_macros.c
++++ b/lib/safe_macros.c
+@@ -11,7 +11,6 @@
+ #include <sys/wait.h>
+ #include <sys/mount.h>
+ #include <sys/xattr.h>
+-#include <sys/sysinfo.h>
+ #include <errno.h>
+ #include <fcntl.h>
+ #include <libgen.h>
+@@ -23,6 +22,7 @@
+ #include <malloc.h>
+ #include "test.h"
+ #include "safe_macros.h"
++#include "lapi/sysinfo.h"
+
+ char *safe_basename(const char *file, const int lineno,
+ 		    void (*cleanup_fn) (void), char *path)
+diff --git a/lib/tst_memutils.c b/lib/tst_memutils.c
+index f134d90c9..647db951e 100644
+--- a/lib/tst_memutils.c
++++ b/lib/tst_memutils.c
+@@ -5,11 +5,11 @@
+
+ #include <unistd.h>
+ #include <limits.h>
+-#include <sys/sysinfo.h>
+ #include <stdlib.h>
+
+ #define TST_NO_DEFAULT_MAIN
+ #include "tst_test.h"
++#include "lapi/sysinfo.h"
+
+ #define BLOCKSIZE (16 * 1024 * 1024)
+
+diff --git a/testcases/kernel/mem/mtest01/mtest01.c b/testcases/kernel/mem/mtest01/mtest01.c
+index f08d3943f..9b4d856f8 100644
+--- a/testcases/kernel/mem/mtest01/mtest01.c
++++ b/testcases/kernel/mem/mtest01/mtest01.c
+@@ -20,7 +20,6 @@
+  */
+
+ #include <sys/types.h>
+-#include <sys/sysinfo.h>
+ #include <sys/wait.h>
+ #include <limits.h>
+ #include <signal.h>
+@@ -29,6 +28,7 @@
+ #include <unistd.h>
+
+ #include "lapi/abisize.h"
++#include "lapi/sysinfo.h"
+ #include "tst_test.h"
+
+ #define FIVE_HUNDRED_MB         (500ULL*1024*1024)
+diff --git a/testcases/kernel/syscalls/madvise/madvise06.c b/testcases/kernel/syscalls/madvise/madvise06.c
+index f76f3f6aa..b2613670b 100644
+--- a/testcases/kernel/syscalls/madvise/madvise06.c
++++ b/testcases/kernel/syscalls/madvise/madvise06.c
+@@ -24,8 +24,8 @@
+ #include <errno.h>
+ #include <stdio.h>
+ #include <sys/mount.h>
+-#include <sys/sysinfo.h>
+ #include "tst_test.h"
++#include "lapi/sysinfo.h"
+
+ #define CHUNK_SZ (400*1024*1024L)
+ #define CHUNK_PAGES (CHUNK_SZ / pg_sz)
+diff --git a/testcases/kernel/syscalls/sysinfo/sysinfo01.c b/testcases/kernel/syscalls/sysinfo/sysinfo01.c
+index 2ea44a2be..a95066bf5 100644
+--- a/testcases/kernel/syscalls/sysinfo/sysinfo01.c
++++ b/testcases/kernel/syscalls/sysinfo/sysinfo01.c
+@@ -69,9 +69,9 @@
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <sys/signal.h>
+-#include <sys/sysinfo.h>
+
+ #include "test.h"
++#include "lapi/sysinfo.h"
+
+ void setup();
+ void cleanup();
+diff --git a/testcases/kernel/syscalls/sysinfo/sysinfo02.c b/testcases/kernel/syscalls/sysinfo/sysinfo02.c
+index 678b8f1d3..5ce65d20e 100644
+--- a/testcases/kernel/syscalls/sysinfo/sysinfo02.c
++++ b/testcases/kernel/syscalls/sysinfo/sysinfo02.c
+@@ -65,10 +65,10 @@
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <sys/signal.h>
+-#include <sys/sysinfo.h>
+ #include <stdint.h>
+
+ #include "test.h"
++#include "lapi/sysinfo.h"
+
+ #define INVALID_ADDRESS ((uintptr_t)-1)
+
+diff --git a/testcases/kernel/syscalls/sysinfo/sysinfo03.c b/testcases/kernel/syscalls/sysinfo/sysinfo03.c
+index af7cb6421..3b61a05b1 100644
+--- a/testcases/kernel/syscalls/sysinfo/sysinfo03.c
++++ b/testcases/kernel/syscalls/sysinfo/sysinfo03.c
+@@ -13,9 +13,9 @@
+
+  */
+
+-#include <sys/sysinfo.h>
+ #include "lapi/namespaces_constants.h"
+ #include "lapi/posix_clocks.h"
++#include "lapi/sysinfo.h"
+ #include "tst_test.h"
+
+ static int offsets[] = {
+--
+2.28.0
+
diff --git a/meta/recipes-extended/ltp/ltp_20200515.bb b/meta/recipes-extended/ltp/ltp_20200930.bb
similarity index 93%
rename from meta/recipes-extended/ltp/ltp_20200515.bb
rename to meta/recipes-extended/ltp/ltp_20200930.bb
index 0c7044d044..84fe734bc4 100644
--- a/meta/recipes-extended/ltp/ltp_20200515.bb
+++ b/meta/recipes-extended/ltp/ltp_20200930.bb
@@ -27,17 +27,15 @@ CFLAGS_append_x86-64 = " -fomit-frame-pointer"
 
 CFLAGS_append_powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS_append_mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
-SRCREV = "0d79a93e6ca44d9bc95973faea6bcd7b0c6d1f43"
+SRCREV = "da2f34028f046a208aa2fed5e287df2538e69f91"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0001-build-Add-option-to-select-libc-implementation.patch \
-           file://0004-guard-mallocopt-with-__GLIBC__.patch \
            file://0007-Fix-test_proc_kill-hanging.patch \
            file://0001-Add-more-musl-exclusions.patch \
-           file://0001-ptrace01-Fix-missing-format-string.patch \
-           file://0001-sigwaitinfo-Do-not-run-invalid-undefined-test-cases.patch \
-           file://0001-syscalls-copy_file_range02-Expect-EFBIG-in-subcase-m.patch \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
+           file://cacheflush01-Rewrite-into-new-API.patch \
+           file://lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.28.0

