Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web08.3860.1603919180095042120
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 14:06:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=k68Wr6x4;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id p93so942406edd.7
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 14:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dJEzu8/c1mYQQcPn1cmTFR4W8eZUX3UA5s6YuB/aVOQ=;
        b=k68Wr6x4s+4rWdW3IdUkZ41JIOgu6Gbdj4fVExeXgNIKEe4PkBjrKHe8a5N4ZrGMF9
         hK9IiN+GB2LnuMk5aq2oZyeC9mDTmfy+SwhD5rQiMUo/mO+2WVHa8BAtJqPA/1I+PQVD
         xtiN/P8fFnP88+4OxGZvqtukB5FldppNeprOlj+X6JAPlCckOUHs3Tv9SoNHO6TNe8II
         yn+Stf4sZZSHLHZuea8cWz7t4g3ODHyKGGeCO/6FwkZ0uA6K7MyEe19jDh7g4xdS/gA8
         QgI4dlKxaSOR7feMusubnobuEYvmNGWjYtpBPYKVFX7mlbNHXcIBI0xxeEa2HA586N/B
         vTrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dJEzu8/c1mYQQcPn1cmTFR4W8eZUX3UA5s6YuB/aVOQ=;
        b=L6TUNvUjM8HdIYwi5pQO138qOSHN+3gaSovh01GXwj2Te+GQiAAThJ8jZ8NSytrZgI
         nyZWV6kvMpWHIBrDOVqHBNweQ3fWbnuYmXOhudpOLKukW0PNMQiP+Jl+QJa0FtrtRik4
         eOFWJcryNtYA6azbdp2KGW0UgfGn85hQSfdhta1Co4mHoCGcVPkzh1ksza3DSX2JSM9+
         fRjzpt4wwFPrNfkjciHDS4qtK+sZzAhUk0yKjwjkpT7ou1EdJYf4NsoHRPG0xBbVx/yZ
         2XnAYdp8tuH18DpMRa0j/YP+CECCXBTY7ziB5NRwj+AC6SuOTJngJLkqKU2e04LlBjvc
         Whjg==
X-Gm-Message-State: AOAM531MnUmEmKzfyccSELoJ4nc90oKPU1ST0+UZnYnGREqbT8Pmf8Av
	kgozJS+FTg6e0uIVulvHuNvfHaZj8OayHQ==
X-Google-Smtp-Source: ABdhPJx+OF1aqXTfSFhA9ivWqLteK2kOCRSjn3JP+PvBGHlqVP/jm6XpO8AUvXqBZaYkx5ayxFl8pg==
X-Received: by 2002:aa7:d550:: with SMTP id u16mr805700edr.147.1603919178181;
        Wed, 28 Oct 2020 14:06:18 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id q25sm352434eja.86.2020.10.28.14.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 14:06:17 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 14/33] ltp: update 20200515 -> 20200930
Date: Wed, 28 Oct 2020 22:05:39 +0100
Message-Id: <20201028210558.21070-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201028210558.21070-1-alex.kanavin@gmail.com>
References: <20201028210558.21070-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop backports.

Remove 0001-sigwaitinfo-Do-not-run-invalid-undefined-test-cases.patch as
upstream has removed the code being patched.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...001-Remove-OOM-tests-from-runtest-mm.patch | 17 ++---
 ...1-ptrace01-Fix-missing-format-string.patch | 33 ---------
 ...not-run-invalid-undefined-test-cases.patch | 69 -------------------
 ...le_range02-Expect-EFBIG-in-subcase-m.patch | 57 ---------------
 .../0004-guard-mallocopt-with-__GLIBC__.patch | 34 ---------
 .../ltp/{ltp_20200515.bb => ltp_20200930.bb}  |  6 +-
 6 files changed, 8 insertions(+), 208 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-ptrace01-Fix-missing-format-string.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-sigwaitinfo-Do-not-run-invalid-undefined-test-cases.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-syscalls-copy_file_range02-Expect-EFBIG-in-subcase-m.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0004-guard-mallocopt-with-__GLIBC__.patch
 rename meta/recipes-extended/ltp/{ltp_20200515.bb => ltp_20200930.bb} (93%)

diff --git a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
index 6b665030c3..e51950f153 100644
--- a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
+++ b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
@@ -1,4 +1,4 @@
-From 13ef88cdccfe3f58c53d57806866b91e310eb272 Mon Sep 17 00:00:00 2001
+From 93772c511d954d755cc9128c58ed8968a5af541b Mon Sep 17 00:00:00 2001
 From: "Mingde (Matthew) Zeng" <matthewzmd@gmail.com>
 Date: Wed, 29 Jul 2020 08:47:09 -0400
 Subject: [PATCH] Remove OOM tests from runtest/mm
@@ -13,13 +13,13 @@ Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
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
@@ -27,8 +27,5 @@ index a09f39c1e..76fa82754 100644
 -oom05 oom05
 -
  swapping01 swapping01 -i 5
-
+ 
  thp01 thp01 -I 120
---
-2.27.0
-
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
diff --git a/meta/recipes-extended/ltp/ltp_20200515.bb b/meta/recipes-extended/ltp/ltp_20200930.bb
similarity index 93%
rename from meta/recipes-extended/ltp/ltp_20200515.bb
rename to meta/recipes-extended/ltp/ltp_20200930.bb
index 0c7044d044..7acf15b360 100644
--- a/meta/recipes-extended/ltp/ltp_20200515.bb
+++ b/meta/recipes-extended/ltp/ltp_20200930.bb
@@ -27,16 +27,12 @@ CFLAGS_append_x86-64 = " -fomit-frame-pointer"
 
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
            "
 
-- 
2.29.0

