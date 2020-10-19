Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.web10.6511.1603143806856766740
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 14:43:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oHefCAl3;
 spf=pass (domain: gmail.com, ip: 209.85.222.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f49.google.com with SMTP id r17so341268uaf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2020 14:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IgojP2DP2C88ISteqeOjo9qnZNEY7+kvAA3fn4kkbvM=;
        b=oHefCAl3kackusSVtoqKBPXxnyl956g/OkF0oAs76hVe1OGIy+f9ba+KMGA7NysokE
         PBxWRGxuT9RYe4CJWX1VgWeEraUwc9+lX5GjyX6+QjojoW13SQq7B699GhFp89YE/qoM
         b7i18Ddiulyatg8Yu46bnl83Xq+jSQqTasYnVhxqZyzQYc0N3s0pTBNO4RNKNnWFzdVc
         aLBO9J0jy4pVKZbyr0T4We62rmC2PcVlYO5Nexp5zNmFkR5sPTcZV6pxN25qsnBAHVOF
         sIOoAmfE6SYd0EgRxdUCIOpJr0ph2W0zDJiAF5OckKf+6sBhpqCuph38MrLX+FQPzP3m
         Sw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IgojP2DP2C88ISteqeOjo9qnZNEY7+kvAA3fn4kkbvM=;
        b=pMlWX8xM0FDHGw6UJIk5jCi6tRyubBClhsQ+WQtQZArI+/sZjXj009iDNIzS0jj/yb
         CS7Ql1gHd6c3u7K4ZHv3JO7GDwAQTwDzRG9GnErMvOpb8C8a4PKXf2hoKhfM1ysMu6PC
         GXIehLMaZmc0klaDeyK2PI3uK5U0Jqve+I5NsbiNLn0NzOnipnVb2g5dIZUmV/DCd+iH
         EK14YFEDvrTy6kEmtFqeehYieL7QVyfDwCScocdcSEjfILf33ym9RGMyoz3qydYpgMf7
         5lp5TRb3afr7nVkezNCMabYmQeVweSsfMW5GwXNt/6b1/jO0eS8KXfe8ngCoCPFaOXJh
         r9pg==
X-Gm-Message-State: AOAM532l26f5A//qlbWDKH6ulq1MaUHM3Do5cxDIUh0Tz7ZgsSqEl+UP
	4z56VSRh1KXmcphUVmbiuPk3pRRCItfOrBp9bI8=
X-Google-Smtp-Source: ABdhPJzIXozfcrOV3u3qYGDgFVx6iGPBANfRTrItdGE/hoOHAoE7GJjID+WPJwRKX4cuyfOouAYtaqo7RVbOw8jgZcI=
X-Received: by 2002:ab0:4841:: with SMTP id c1mr872977uad.22.1603143805787;
 Mon, 19 Oct 2020 14:43:25 -0700 (PDT)
MIME-Version: 1.0
References: <20201019201332.12446-1-petr.vorel@gmail.com>
In-Reply-To: <20201019201332.12446-1-petr.vorel@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 19 Oct 2020 23:43:14 +0200
Message-ID: <CANNYZj8k8zbpQMD-Y2EQF_y4AffOReL1v=5Luw2dy2yAxA9r8g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] ltp: Update to 20200930
To: Petr Vorel <petr.vorel@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	Anuj Mittal <anuj.mittal@intel.com>, He Zhe <zhe.he@windriver.com>, 
	Anders Roxell <anders.roxell@linaro.org>, Yi Zhao <yi.zhao@windriver.com>, 
	=?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="00000000000011639d05b20d0147"

--00000000000011639d05b20d0147
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you, but please set Upstream-Status properly for the two newly added
patches.

Alex

On Mon, 19 Oct 2020 at 22:13, Petr Vorel <petr.vorel@gmail.com> wrote:

> New patches (backported musl related fixes):
> * cacheflush01-Rewrite-into-new-API.patch
> * lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch
>
> Dropped patches (not applicable)
> * 0001-sigwaitinfo-Do-not-run-invalid-undefined-test-cases.patch
>
> Dropped patches from this release:
> * 0001-ptrace01-Fix-missing-format-string.patch
> * 0001-syscalls-copy_file_range02-Expect-EFBIG-in-subcase-m.patch
> * 0004-guard-mallocopt-with-__GLIBC__.patch
>
> Rebased patches:
> * 0001-Remove-OOM-tests-from-runtest-mm.patch
>
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Hi,
>
> tested only on intel. Could anybody test it on MUSL
> (the 2 new MUSL related patches were tested on MUSL on Buildroot)
>
> Also, could anybody check if problems on sigwaitinfo01.c on MUSL persist
> and update 0001-sigwaitinfo-Do-not-run-invalid-undefined-test-cases.patc=
h?
>
> Kind regards,
> Petr
>
>  ...001-Remove-OOM-tests-from-runtest-mm.patch |  26 +-
>  ...1-ptrace01-Fix-missing-format-string.patch |  33 ---
>  ...not-run-invalid-undefined-test-cases.patch |  69 ------
>  ...le_range02-Expect-EFBIG-in-subcase-m.patch |  57 -----
>  .../0004-guard-mallocopt-with-__GLIBC__.patch |  34 ---
>  .../cacheflush01-Rewrite-into-new-API.patch   | 225 ++++++++++++++++++
>  ...ysinfo.h-to-fix-build-with-MUSL-libc.patch | 203 ++++++++++++++++
>  .../ltp/{ltp_20200515.bb =3D> ltp_20200930.bb}  |   8 +-
>  8 files changed, 444 insertions(+), 211 deletions(-)
>  delete mode 100644
> meta/recipes-extended/ltp/ltp/0001-ptrace01-Fix-missing-format-string.pa=
tch
>  delete mode 100644
> meta/recipes-extended/ltp/ltp/0001-sigwaitinfo-Do-not-run-invalid-undefi=
ned-test-cases.patch
>  delete mode 100644
> meta/recipes-extended/ltp/ltp/0001-syscalls-copy_file_range02-Expect-EFB=
IG-in-subcase-m.patch
>  delete mode 100644
> meta/recipes-extended/ltp/ltp/0004-guard-mallocopt-with-__GLIBC__.patch
>  create mode 100644
> meta/recipes-extended/ltp/ltp/cacheflush01-Rewrite-into-new-API.patch
>  create mode 100644
> meta/recipes-extended/ltp/ltp/lapi-Add-sysinfo.h-to-fix-build-with-MUSL-=
libc.patch
>  rename meta/recipes-extended/ltp/{ltp_20200515.bb =3D> ltp_20200930.bb}
> (93%)
>
> diff --git
> a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.pa=
tch
> b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.pa=
tch
> index 6b665030c3..95366aee37 100644
> ---
> a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.pa=
tch
> +++
> b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.pa=
tch
> @@ -1,25 +1,25 @@
> -From 13ef88cdccfe3f58c53d57806866b91e310eb272 Mon Sep 17 00:00:00 2001
> +From 5093e44f02be0a3f1a5a79987a90ad43a2bc26c5 Mon Sep 17 00:00:00 2001
>  From: "Mingde (Matthew) Zeng" <matthewzmd@gmail.com>
> -Date: Wed, 29 Jul 2020 08:47:09 -0400
> -Subject: [PATCH] Remove OOM tests from runtest/mm
> -
> -Disable OOM tests, as they might cause oeqa ssh connection lost
> +Date: Mon, 19 Oct 2020 12:31:23 +0200
> +Subject: [PATCH] Disable OOM tests, as they might cause oeqa ssh
> connection
> + lost
>
>  Upstream-Status: Inappropriate [oe-core specific]
>  Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
> -
> +[ pvorel: rebase for 20200930 ]
> +Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
>  ---
>   runtest/mm | 6 ------
>   1 file changed, 6 deletions(-)
>
>  diff --git a/runtest/mm b/runtest/mm
> -index a09f39c1e..76fa82754 100644
> +index 481d39691..cf207d10e 100644
>  --- a/runtest/mm
>  +++ b/runtest/mm
> -@@ -73,12 +73,6 @@ ksm06 ksm06
> - ksm06_1 ksm06 -n 10
> - ksm06_2 ksm06 -n 10000
> -
> +@@ -74,12 +74,6 @@ ksm06_2 ksm06 -n 10000
> +
> + cpuset01 cpuset01
> +
>  -oom01 oom01
>  -oom02 oom02
>  -oom03 oom03
> @@ -27,8 +27,8 @@ index a09f39c1e..76fa82754 100644
>  -oom05 oom05
>  -
>   swapping01 swapping01 -i 5
> -
> +
>   thp01 thp01 -I 120
> ---
> +--
>  2.27.0
>
> diff --git
> a/meta/recipes-extended/ltp/ltp/0001-ptrace01-Fix-missing-format-string.=
patch
> b/meta/recipes-extended/ltp/ltp/0001-ptrace01-Fix-missing-format-string.=
patch
> deleted file mode 100644
> index 27b890e22b..0000000000
> ---
> a/meta/recipes-extended/ltp/ltp/0001-ptrace01-Fix-missing-format-string.=
patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From adb9587466a493fdd9d4410f1b8b130ebca06daa Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 19 May 2020 22:21:23 -0700
> -Subject: [PATCH] ptrace01: Fix missing format string
> -
> -Fixes
> -| ptrace01.c:89:2: error: format string is not a string literal
> -(potentially insecure) [-Werror,-Wformat-security]
> -|         tst_res(TINFO, tc->message);
> -|         ^              ~~~~~~~~~~~
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Upstream-Status: Backport [58424835952641f4fd60c0ae3ab6c64decca3f8a]
> ----
> - testcases/kernel/syscalls/ptrace/ptrace01.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/testcases/kernel/syscalls/ptrace/ptrace01.c
> b/testcases/kernel/syscalls/ptrace/ptrace01.c
> -index 87a99e4150..9071bbabaf 100644
> ---- a/testcases/kernel/syscalls/ptrace/ptrace01.c
> -+++ b/testcases/kernel/syscalls/ptrace/ptrace01.c
> -@@ -86,7 +86,7 @@ static void run(unsigned int i)
> -
> -       got_signal =3D 0;
> -
> --      tst_res(TINFO, tc->message);
> -+      tst_res(TINFO, "%s", tc->message);
> -
> -       if (tc->handler =3D=3D 1) {
> -               parent_act.sa_handler =3D parent_handler;
> ---
> -2.26.2
> -
> diff --git
> a/meta/recipes-extended/ltp/ltp/0001-sigwaitinfo-Do-not-run-invalid-unde=
fined-test-cases.patch
> b/meta/recipes-extended/ltp/ltp/0001-sigwaitinfo-Do-not-run-invalid-unde=
fined-test-cases.patch
> deleted file mode 100644
> index 17d5af89e2..0000000000
> ---
> a/meta/recipes-extended/ltp/ltp/0001-sigwaitinfo-Do-not-run-invalid-unde=
fined-test-cases.patch
> +++ /dev/null
> @@ -1,69 +0,0 @@
> -From e0a63deb1857eb90288e90d6368df70cdd0c0ec9 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Thu, 28 May 2020 13:04:33 -0700
> -Subject: [PATCH] sigwaitinfo: Do not run invalid/undefined test cases
> -
> -These testcases run for eternity on musl
> -
> -test_bad_address* cases are passing invalid pointers to a function;
> that's always UB
> -empty_set and timeout rely on the implementation-defined "may fail" for
> EINTR in sigtimedwait [1]
> -
> -normally "may fail" is an "unspecified" but here the impl
> -is supposed to document it so it's "impl-defined"
> -
> -[1]
> https://pubs.opengroup.org/onlinepubs/9699919799/functions/sigtimedwait.=
html
> -
> -Upstream-Status: Submitted [
> https://patchwork.ozlabs.org/project/ltp/patch/20200528204556.2444156-1-=
raj.khem@gmail.com/
> ]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Cc: Rich Felker <dalias@aerifal.cx>
> ----
> - .../kernel/syscalls/sigwaitinfo/sigwaitinfo01.c      | 12 ++----------
> - 1 file changed, 2 insertions(+), 10 deletions(-)
> -
> ---- a/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
> -+++ b/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
> -@@ -422,15 +422,10 @@ struct test_desc {
> - } tests[] =3D {
> - #ifdef TEST_RT_SIGTIMEDWAIT
> -       {
> --      test_empty_set, my_rt_sigtimedwait, SIGUSR1}, {
> -       test_unmasked_matching, my_rt_sigtimedwait, SIGUSR1}, {
> -       test_masked_matching, my_rt_sigtimedwait, SIGUSR1}, {
> -       test_unmasked_matching_noinfo, my_rt_sigtimedwait, SIGUSR1}, {
> --      test_masked_matching_noinfo, my_rt_sigtimedwait, SIGUSR1}, {
> --      test_bad_address, my_rt_sigtimedwait, SIGUSR1}, {
> --      test_bad_address2, my_rt_sigtimedwait, SIGUSR1}, {
> --      test_bad_address3, my_rt_sigtimedwait, SIGUSR1}, {
> --      test_timeout, my_rt_sigtimedwait, 0},
> -+      test_masked_matching_noinfo, my_rt_sigtimedwait, SIGUSR1},
> -           /* Special cases */
> -           /* 1: sigwaitinfo does respond to ignored signal */
> -       {
> -@@ -452,25 +447,17 @@ struct test_desc {
> - #endif
> - #if defined TEST_SIGWAITINFO
> -       {
> --      test_empty_set, my_sigwaitinfo, SIGUSR1}, {
> -       test_unmasked_matching, my_sigwaitinfo, SIGUSR1}, {
> -       test_masked_matching, my_sigwaitinfo, SIGUSR1}, {
> -       test_unmasked_matching_noinfo, my_sigwaitinfo, SIGUSR1}, {
> --      test_masked_matching_noinfo, my_sigwaitinfo, SIGUSR1}, {
> --      test_bad_address, my_sigwaitinfo, SIGUSR1}, {
> --      test_bad_address2, my_sigwaitinfo, SIGUSR1},
> -+      test_masked_matching_noinfo, my_sigwaitinfo, SIGUSR1},
> - #endif
> - #if defined TEST_SIGTIMEDWAIT
> -       {
> --      test_empty_set, my_sigtimedwait, SIGUSR1}, {
> -       test_unmasked_matching, my_sigtimedwait, SIGUSR1}, {
> -       test_masked_matching, my_sigtimedwait, SIGUSR1}, {
> -       test_unmasked_matching_noinfo, my_sigtimedwait, SIGUSR1}, {
> --      test_masked_matching_noinfo, my_sigtimedwait, SIGUSR1}, {
> --      test_bad_address, my_sigtimedwait, SIGUSR1}, {
> --      test_bad_address2, my_sigtimedwait, SIGUSR1}, {
> --      test_bad_address3, my_sigtimedwait, SIGUSR1}, {
> --      test_timeout, my_sigtimedwait, 0},
> -+      test_masked_matching_noinfo, my_sigtimedwait, SIGUSR1},
> - #endif
> - };
> -
> diff --git
> a/meta/recipes-extended/ltp/ltp/0001-syscalls-copy_file_range02-Expect-E=
FBIG-in-subcase-m.patch
> b/meta/recipes-extended/ltp/ltp/0001-syscalls-copy_file_range02-Expect-E=
FBIG-in-subcase-m.patch
> deleted file mode 100644
> index 09b6f54874..0000000000
> ---
> a/meta/recipes-extended/ltp/ltp/0001-syscalls-copy_file_range02-Expect-E=
FBIG-in-subcase-m.patch
> +++ /dev/null
> @@ -1,57 +0,0 @@
> -From 99687ab002f9f750f6f18fa1d70a91f0aa4f8ba2 Mon Sep 17 00:00:00 2001
> -From: He Zhe <zhe.he@windriver.com>
> -Date: Thu, 18 Jun 2020 17:18:27 +0800
> -Subject: [PATCH] syscalls/copy_file_range02: Expect EFBIG in subcase ma=
x
> - length on 32-bit architectures
> -
> -For syscall
> -ssize_t copy_file_range(int fd_in, loff_t *off_in,
> -                               int fd_out, loff_t *off_out,
> -                               size_t len, unsigned int flags);
> -off_out is loff_t* that is long long, 64 bits on 32-bit architectures,
> -while len is size_t that unsigned int, 32 bits on 32-bit architectures.
> -
> -In subcase "max length", simplified as below,
> -
> -dst =3D tst_max_lfs_filesize();
> -TEST(sys_copy_file_range(fd_src, 0, *tc->copy_to_fd, &dst, tc->len,
> tc->flags));
> -
> -where dst is 4K*4G and len is 4G, so (4K+1)*4G is always smaller than
> 4G*4G,
> -it can never match the following kernel condition on 32-bit architectur=
es.
> -
> -if (pos_in + count < pos_in || pos_out + count < pos_out)
> -       return -EOVERFLOW;
> -
> -And thus we would get error like
> -copy_file_range02.c:139: FAIL: copy_file_range failed unexpectedly;
> expected EOVERFLOW, but got: EFBIG (27)
> -
> -Also correct a typo.
> -
> -Upstream-Status: Backport [
> http://lists.linux.it/pipermail/ltp/2020-June/017716.html]
> -
> -Signed-off-by: He Zhe <zhe.he@windriver.com>
> -Acked-by: Li Wang <liwang@redhat.com>
> ----
> - .../kernel/syscalls/copy_file_range/copy_file_range02.c     | 6 +++++-
> - 1 file changed, 5 insertions(+), 1 deletion(-)
> -
> -diff --git
> a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
> b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
> -index fa679c4d3..bc27fbe57 100644
> ---- a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
> -+++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
> -@@ -78,7 +78,11 @@ static struct tcase {
> -       {&fd_chrdev,    0,      EINVAL,         CONTSIZE,       "char
> device",  0},
> -       {&fd_fifo,      0,      EINVAL,         CONTSIZE,       "fifo",
>      0},
> -       {&fd_pipe[0],   0,      EINVAL,         CONTSIZE,       "pipe",
>      0},
> --      {&fd_copy,      0,      EOVERFLOW,      ULLONG_MAX,     "max
> length lenght",    1},
> -+#ifdef TST_ABI64
> -+      {&fd_copy,      0,      EOVERFLOW,      ULLONG_MAX,     "max
> length",   1},
> -+#else
> -+      {&fd_copy,      0,      EFBIG,          ULLONG_MAX,     "max
> length",   1},
> -+#endif
> -       {&fd_copy,      0,      EFBIG,          MIN_OFF,        "max fil=
e
> size",        1},
> - };
> -
> ---
> -2.17.1
> -
> diff --git
> a/meta/recipes-extended/ltp/ltp/0004-guard-mallocopt-with-__GLIBC__.patc=
h
> b/meta/recipes-extended/ltp/ltp/0004-guard-mallocopt-with-__GLIBC__.patc=
h
> deleted file mode 100644
> index a187f61f08..0000000000
> ---
> a/meta/recipes-extended/ltp/ltp/0004-guard-mallocopt-with-__GLIBC__.patc=
h
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From d0fc9ca5d3366f9b8907e463222403cd2327be10 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 8 Jan 2016 06:51:20 +0000
> -Subject: [PATCH] guard mallocopt() with __GLIBC__
> -
> -mallocopt is not available on non glibc implementations
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
> -Upstream-Status: Accepted [967612c454aea66770b64f69287671037fe895b3]
> ----
> - utils/benchmark/ebizzy-0.3/ebizzy.c | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/utils/benchmark/ebizzy-0.3/ebizzy.c
> b/utils/benchmark/ebizzy-0.3/ebizzy.c
> -index 5bb8eff..934d951 100644
> ---- a/utils/benchmark/ebizzy-0.3/ebizzy.c
> -+++ b/utils/benchmark/ebizzy-0.3/ebizzy.c
> -@@ -215,10 +215,10 @@ static void read_options(int argc, char *argv[])
> -                       "\"never mmap\" option specified\n");
> -               usage();
> -       }
> --
> -+#ifdef __GLIBC__
> -       if (never_mmap)
> -               mallopt(M_MMAP_MAX, 0);
> --
> -+#endif
> -       if (chunk_size < record_size) {
> -               fprintf(stderr, "Chunk size %u smaller than record size
> %u\n",
> -                       chunk_size, record_size);
> ---
> -2.7.4
> -
> diff --git
> a/meta/recipes-extended/ltp/ltp/cacheflush01-Rewrite-into-new-API.patch
> b/meta/recipes-extended/ltp/ltp/cacheflush01-Rewrite-into-new-API.patch
> new file mode 100644
> index 0000000000..f9815624b9
> --- /dev/null
> +++ b/meta/recipes-extended/ltp/ltp/cacheflush01-Rewrite-into-new-API.pa=
tch
> @@ -0,0 +1,225 @@
> +From 48edd768850825a4d01e5e5e737122333fc55cdf Mon Sep 17 00:00:00 2001
> +From: Petr Vorel <petr.vorel@gmail.com>
> +Date: Fri, 2 Oct 2020 21:29:58 +0200
> +Subject: [PATCH] cacheflush01: Rewrite into new API
> +
> +This syscall is currently (v5.9) supported on these architectures:
> +arc, csky, mips, m68k, nds32, sh
> +
> +constants are missing for m68k, not sure if the testcase is valid for i=
t.
> +Untested.
> +
> +Test for __LTP__NR_INVALID_SYSCALL saves adding autotools check for
> +<asm/cachectl.h>.
> +
> +Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> +---
> +[ upstream status:
> https://patchwork.ozlabs.org/project/ltp/patch/20201002202416.28972-1-pe=
tr.vorel@gmail.com/
> ]
> + .../kernel/syscalls/cacheflush/cacheflush01.c | 173 ++++--------------
> + 1 file changed, 40 insertions(+), 133 deletions(-)
> +
> +diff --git a/testcases/kernel/syscalls/cacheflush/cacheflush01.c
> b/testcases/kernel/syscalls/cacheflush/cacheflush01.c
> +index 29cf2014a..6ad8b953a 100644
> +--- a/testcases/kernel/syscalls/cacheflush/cacheflush01.c
> ++++ b/testcases/kernel/syscalls/cacheflush/cacheflush01.c
> +@@ -1,157 +1,64 @@
>
> +-/*********************************************************************=
*********/
> +-/* Copyright (c) Maxin John <maxin.john@gmail.com>, 2009
>       */
> +-/* LKML Reference: http://lkml.org/lkml/2009/4/9/203
>       */
> +-/* This program is free software;  you can redistribute it and/or
> modify      */
> +-/* it under the terms of the GNU General Public License as published b=
y
>      */
> +-/* the Free Software Foundation; either version 2 of the License, or
>       */
> +-/* (at your option) any later version.
>       */
> +-/*
>       */
> +-/* This program is distributed in the hope that it will be useful,
>       */
> +-/* but WITHOUT ANY WARRANTY;  without even the implied warranty of
>       */
> +-/* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
>       */
> +-/* the GNU General Public License for more details.
>      */
> +-/*
>       */
> +-/* You should have received a copy of the GNU General Public License
>       */
> +-/* along with this program;  if not, write to the Free Software
>      */
> +-/* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
> 02110-1301 USA    */
> +-/*
>       */
>
> +-/*********************************************************************=
*********/
>
> +-/*********************************************************************=
*********/
> +-/*
>       */
> +-/* File:        cacheflush01.c
>       */
> +-/*
>       */
> +-/* Description: The cacheflush_check() syscall
>     */
> +-/*            Tests EINVAL error of cacheflush system call.
>    */
> +-/*            Its expected behaviour is cacheflush() should return
> -EINVAL  */
> +-/*            when cache parameter is not one of ICACHE, DCACHE, or
> BCACHE. */
> +-/*
>       */
> +-/* Usage:  <for command-line>
>      */
> +-/* cacheflush01 [-c n] [-e][-i n] [-I x] [-p x] [-t]
>       */
> +-/*      where,  -c n : Run n copies concurrently.
>      */
> +-/*              -e   : Turn on errno logging.
>      */
> +-/*              -i n : Execute test n times.
>       */
> +-/*              -I x : Execute test for x seconds.
>       */
> +-/*              -P x : Pause for x seconds between iterations.
>       */
> +-/*              -t   : Turn on syscall timing.
>       */
> +-/*
>       */
> +-/* Total Tests: 1
>      */
> +-/*
>       */
> +-/* Test Name:   cacheflush01
>       */
>
> +-/*********************************************************************=
*********/
> ++// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +-#include <unistd.h>
> +-#include <stdio.h>
> +-#include <stdlib.h>
> +-#include <errno.h>
> +-
> +-#include "test.h"
> ++#include "tst_test.h"
> + #include "lapi/syscalls.h"
> +
> + #if __NR_cacheflush !=3D __LTP__NR_INVALID_SYSCALL
> ++
> + #include <asm/cachectl.h>
> +-#else
> ++
> ++/*
> ++ * m68k does not have these constants
> ++ */
> ++
> + #ifndef   ICACHE
> +-#define   ICACHE   (1<<0)     /* flush instruction cache        */
> ++# define   ICACHE   (1<<0)
> + #endif
> ++
> + #ifndef   DCACHE
> +-#define   DCACHE   (1<<1)     /* writeback and flush data cache */
> ++# define   DCACHE   (1<<1)
> + #endif
> ++
> + #ifndef   BCACHE
> +-#define   BCACHE   (ICACHE|DCACHE)    /* flush both caches
> */
> +-#endif
> ++# define   BCACHE   (ICACHE|DCACHE)
> + #endif
> +
> +-char *TCID =3D "cacheflush01";
> +-int TST_TOTAL =3D 1;
> ++#define CACHE_DESC(x) .cache =3D x, .desc =3D #x
> +
> +-/* Extern Global Functions */
>
> +-/*********************************************************************=
*********/
> +-/*
>       */
> +-/* Function:    cleanup
>      */
> +-/*
>       */
> +-/* Description: Performs all one time clean up for this test on
> successful    */
> +-/*              completion,  premature exit or  failure. Closes all
> temporary */
> +-/*              files, removes all temporary directories exits the tes=
t
> with  */
> +-/*              appropriate return code by calling tst_exit() function=
.
>      */
> +-/*
>       */
> +-/* Input:       None.
>      */
> +-/*
>       */
> +-/* Output:      None.
>      */
> +-/*
>       */
> +-/* Return:      On failure - Exits calling tst_exit(). Non '0' return
> code.   */
> +-/*              On success - Exits calling tst_exit(). With '0' return
> code.  */
> +-/*
>       */
>
> +-/*********************************************************************=
*********/
> +-void cleanup(void)
> +-{
> ++static struct test_case_t {
> ++      int cache;
> ++      const char *desc;
> ++} test_cases[] =3D {
> ++      { CACHE_DESC(ICACHE) },
> ++      { CACHE_DESC(DCACHE) },
> ++      { CACHE_DESC(BCACHE) },
> ++};
> +
> +-      tst_rmdir();
> +-}
> ++static char *addr;
> +
> +-/* Local  Functions */
>
> +-/*********************************************************************=
*********/
> +-/*
>       */
> +-/* Function:    setup
>      */
> +-/*
>       */
> +-/* Description: Performs all one time setup for this test. This functi=
on
> is   */
> +-/*              typically used to capture signals, create temporary
> dirs      */
> +-/*              and temporary files that may be used in the course of
> this    */
> +-/*              test.
>      */
> +-/*
>       */
> +-/* Input:       None.
>      */
> +-/*
>       */
> +-/* Output:      None.
>      */
> +-/*
>       */
> +-/* Return:      On failure - Exits by calling cleanup().
>       */
> +-/*              On success - returns 0.
>      */
> +-/*
>       */
>
> +-/*********************************************************************=
*********/
> +-void setup(void)
> ++static void setup(void)
> + {
> +-      /* Capture signals if any */
> +-      /* Create temporary directories */
> +-      TEST_PAUSE;
> +-      tst_tmpdir();
> ++      addr =3D SAFE_MALLOC(getpagesize());
> + }
> +
> +-int main(int ac, char **av)
> ++static void test_cacheflush(unsigned int i)
> + {
> ++      struct test_case_t *tc =3D &test_cases[i];
> +
> +-      char *addr =3D NULL;
> +-
> +-      tst_parse_opts(ac, av, NULL, NULL);
> +-
> +-      setup();
> +-
> +-      tst_count =3D 0;
> +-      /* Create some user address range */
> +-      addr =3D malloc(getpagesize());
> +-      if (addr =3D=3D NULL) {
> +-              tst_brkm(TFAIL | TTERRNO, cleanup, "malloc failed");
> +-      }
> +-
> +-      /* Invokes cacheflush() with proper parameters */
> +-      TEST(ltp_syscall(__NR_cacheflush, addr, getpagesize(), ICACHE));
> +-      if (TEST_RETURN =3D=3D 0) {
> +-              tst_resm(TPASS, "passed with no errno");
> +-      } else {
> +-              tst_resm(TFAIL, "failed with unexpected errno");
> +-      }
> +-
> +-      TEST(ltp_syscall(__NR_cacheflush, addr, getpagesize(), DCACHE));
> +-      if (TEST_RETURN =3D=3D 0) {
> +-              tst_resm(TPASS, "passed with no errno");
> ++      TEST(tst_syscall(__NR_cacheflush, addr, getpagesize(), tc->cache=
));
> ++      if (TST_RET =3D=3D 0) {
> ++              tst_res(TPASS, "%s passed", tc->desc);
> +       } else {
> +-              tst_resm(TFAIL, "failed with unexpected errno");
> ++              tst_res(TFAIL | TTERRNO, "%s failed", tc->desc);
> +       }
> ++}
> +
> +-      TEST(ltp_syscall(__NR_cacheflush, addr, getpagesize(), BCACHE));
> +-      if (TEST_RETURN =3D=3D 0) {
> +-              tst_resm(TPASS, "passed with no errno");
> +-      } else {
> +-              tst_resm(TFAIL, "failed with unexpected errno");
> +-      }
> ++static struct tst_test test =3D {
> ++      .setup =3D setup,
> ++      .test =3D test_cacheflush,
> ++      .tcnt =3D ARRAY_SIZE(test_cases),
> ++};
> +
> +-      cleanup();
> +-      tst_exit();
> +-}
> ++#else
> ++      TST_TEST_TCONF("system doesn't support cacheflush()");
> ++#endif
> +--
> +2.28.0
> +
> diff --git
> a/meta/recipes-extended/ltp/ltp/lapi-Add-sysinfo.h-to-fix-build-with-MUS=
L-libc.patch
> b/meta/recipes-extended/ltp/ltp/lapi-Add-sysinfo.h-to-fix-build-with-MUS=
L-libc.patch
> new file mode 100644
> index 0000000000..f1b6743f21
> --- /dev/null
> +++
> b/meta/recipes-extended/ltp/ltp/lapi-Add-sysinfo.h-to-fix-build-with-MUS=
L-libc.patch
> @@ -0,0 +1,203 @@
> +From ac3e262cba81889c0bb04ce87a50a1709f2726e7 Mon Sep 17 00:00:00 2001
> +From: Petr Vorel <petr.vorel@gmail.com>
> +Date: Thu, 1 Oct 2020 23:28:39 +0200
> +Subject: [PATCH] lapi: Add sysinfo.h to fix build with MUSL libc
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +The reason is to avoid indirect <linux/sysinfo.h> include when using
> +some network headers: <linux/netlink.h> or others -> <linux/kernel.h>
> +-> <linux/sysinfo.h>
> +
> +This indirect include causes on MUSL redefinition of struct sysinfo whe=
n
> +included both <sys/sysinfo.h> and some of UAPI headers:
> +
> +In file included from
> x86_64-buildroot-linux-musl/sysroot/usr/include/linux/kernel.h:5,
> +                 from
> x86_64-buildroot-linux-musl/sysroot/usr/include/linux/netlink.h:5,
> +                 from ../include/tst_netlink.h:14,
> +                 from tst_crypto.c:13:
> +x86_64-buildroot-linux-musl/sysroot/usr/include/linux/sysinfo.h:8:8:
> error: redefinition of =E2=80=98struct sysinfo=E2=80=99
> + struct sysinfo {
> +        ^~~~~~~
> +In file included from ../include/tst_safe_macros.h:15,
> +                 from ../include/tst_test.h:93,
> +                 from tst_crypto.c:11:
> +x86_64-buildroot-linux-musl/sysroot/usr/include/sys/sysinfo.h:10:8: not=
e:
> originally defined here
> +
> +Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> +[ upstream status:
> https://patchwork.ozlabs.org/project/ltp/patch/20201001231256.6930-1-pet=
r.vorel@gmail.com/
> ]
> +---
> + include/lapi/sysinfo.h                        | 22 +++++++++++++++++++
> + include/tst_safe_macros.h                     |  2 +-
> + lib/safe_macros.c                             |  2 +-
> + lib/tst_memutils.c                            |  2 +-
> + testcases/kernel/mem/mtest01/mtest01.c        |  2 +-
> + testcases/kernel/syscalls/madvise/madvise06.c |  2 +-
> + testcases/kernel/syscalls/sysinfo/sysinfo01.c |  2 +-
> + testcases/kernel/syscalls/sysinfo/sysinfo02.c |  2 +-
> + testcases/kernel/syscalls/sysinfo/sysinfo03.c |  2 +-
> + 9 files changed, 30 insertions(+), 8 deletions(-)
> + create mode 100644 include/lapi/sysinfo.h
> +
> +diff --git a/include/lapi/sysinfo.h b/include/lapi/sysinfo.h
> +new file mode 100644
> +index 000000000..d0e0e93d7
> +--- /dev/null
> ++++ b/include/lapi/sysinfo.h
> +@@ -0,0 +1,22 @@
> ++// SPDX-License-Identifier: GPL-2.0-or-later
> ++/*
> ++ * Copyright (c) 2020 Petr Vorel <petr.vorel@gmail.com>
> ++ */
> ++
> ++#ifndef SYSINFO_H__
> ++
> ++/*
> ++ * Don't use <sys/sysinfo.h> as it breaks build MUSL toolchain.
> ++ * Use <linux/sysinfo.h> instead.
> ++ *
> ++ * Some kernel UAPI headers do indirect <linux/sysinfo.h> include:
> ++ * <linux/netlink.h> or others -> <linux/kernel.h> -> <linux/sysinfo.h=
>
> ++ *
> ++ * This indirect include causes on MUSL redefinition of struct sysinfo
> when
> ++ * included both <sys/sysinfo.h> and some of UAPI headers:
> ++ */
> ++#include <linux/sysinfo.h>
> ++
> ++#define SYSINFO_H__
> ++
> ++#endif /* SYSINFO_H__ */
> +diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
> +index 053c3bcf9..61ea2076d 100644
> +--- a/include/tst_safe_macros.h
> ++++ b/include/tst_safe_macros.h
> +@@ -12,7 +12,7 @@
> + #include <sys/resource.h>
> + #include <sys/stat.h>
> + #include <sys/vfs.h>
> +-#include <sys/sysinfo.h>
> ++#include <linux/sysinfo.h>
> + #include <fcntl.h>
> + #include <libgen.h>
> + #include <signal.h>
> +diff --git a/lib/safe_macros.c b/lib/safe_macros.c
> +index 4f48d7529..d8ee03dae 100644
> +--- a/lib/safe_macros.c
> ++++ b/lib/safe_macros.c
> +@@ -11,7 +11,6 @@
> + #include <sys/wait.h>
> + #include <sys/mount.h>
> + #include <sys/xattr.h>
> +-#include <sys/sysinfo.h>
> + #include <errno.h>
> + #include <fcntl.h>
> + #include <libgen.h>
> +@@ -23,6 +22,7 @@
> + #include <malloc.h>
> + #include "test.h"
> + #include "safe_macros.h"
> ++#include "lapi/sysinfo.h"
> +
> + char *safe_basename(const char *file, const int lineno,
> +                   void (*cleanup_fn) (void), char *path)
> +diff --git a/lib/tst_memutils.c b/lib/tst_memutils.c
> +index f134d90c9..647db951e 100644
> +--- a/lib/tst_memutils.c
> ++++ b/lib/tst_memutils.c
> +@@ -5,11 +5,11 @@
> +
> + #include <unistd.h>
> + #include <limits.h>
> +-#include <sys/sysinfo.h>
> + #include <stdlib.h>
> +
> + #define TST_NO_DEFAULT_MAIN
> + #include "tst_test.h"
> ++#include "lapi/sysinfo.h"
> +
> + #define BLOCKSIZE (16 * 1024 * 1024)
> +
> +diff --git a/testcases/kernel/mem/mtest01/mtest01.c
> b/testcases/kernel/mem/mtest01/mtest01.c
> +index f08d3943f..9b4d856f8 100644
> +--- a/testcases/kernel/mem/mtest01/mtest01.c
> ++++ b/testcases/kernel/mem/mtest01/mtest01.c
> +@@ -20,7 +20,6 @@
> +  */
> +
> + #include <sys/types.h>
> +-#include <sys/sysinfo.h>
> + #include <sys/wait.h>
> + #include <limits.h>
> + #include <signal.h>
> +@@ -29,6 +28,7 @@
> + #include <unistd.h>
> +
> + #include "lapi/abisize.h"
> ++#include "lapi/sysinfo.h"
> + #include "tst_test.h"
> +
> + #define FIVE_HUNDRED_MB         (500ULL*1024*1024)
> +diff --git a/testcases/kernel/syscalls/madvise/madvise06.c
> b/testcases/kernel/syscalls/madvise/madvise06.c
> +index f76f3f6aa..b2613670b 100644
> +--- a/testcases/kernel/syscalls/madvise/madvise06.c
> ++++ b/testcases/kernel/syscalls/madvise/madvise06.c
> +@@ -24,8 +24,8 @@
> + #include <errno.h>
> + #include <stdio.h>
> + #include <sys/mount.h>
> +-#include <sys/sysinfo.h>
> + #include "tst_test.h"
> ++#include "lapi/sysinfo.h"
> +
> + #define CHUNK_SZ (400*1024*1024L)
> + #define CHUNK_PAGES (CHUNK_SZ / pg_sz)
> +diff --git a/testcases/kernel/syscalls/sysinfo/sysinfo01.c
> b/testcases/kernel/syscalls/sysinfo/sysinfo01.c
> +index 2ea44a2be..a95066bf5 100644
> +--- a/testcases/kernel/syscalls/sysinfo/sysinfo01.c
> ++++ b/testcases/kernel/syscalls/sysinfo/sysinfo01.c
> +@@ -69,9 +69,9 @@
> + #include <sys/types.h>
> + #include <sys/stat.h>
> + #include <sys/signal.h>
> +-#include <sys/sysinfo.h>
> +
> + #include "test.h"
> ++#include "lapi/sysinfo.h"
> +
> + void setup();
> + void cleanup();
> +diff --git a/testcases/kernel/syscalls/sysinfo/sysinfo02.c
> b/testcases/kernel/syscalls/sysinfo/sysinfo02.c
> +index 678b8f1d3..5ce65d20e 100644
> +--- a/testcases/kernel/syscalls/sysinfo/sysinfo02.c
> ++++ b/testcases/kernel/syscalls/sysinfo/sysinfo02.c
> +@@ -65,10 +65,10 @@
> + #include <sys/types.h>
> + #include <sys/stat.h>
> + #include <sys/signal.h>
> +-#include <sys/sysinfo.h>
> + #include <stdint.h>
> +
> + #include "test.h"
> ++#include "lapi/sysinfo.h"
> +
> + #define INVALID_ADDRESS ((uintptr_t)-1)
> +
> +diff --git a/testcases/kernel/syscalls/sysinfo/sysinfo03.c
> b/testcases/kernel/syscalls/sysinfo/sysinfo03.c
> +index af7cb6421..3b61a05b1 100644
> +--- a/testcases/kernel/syscalls/sysinfo/sysinfo03.c
> ++++ b/testcases/kernel/syscalls/sysinfo/sysinfo03.c
> +@@ -13,9 +13,9 @@
> +
> +  */
> +
> +-#include <sys/sysinfo.h>
> + #include "lapi/namespaces_constants.h"
> + #include "lapi/posix_clocks.h"
> ++#include "lapi/sysinfo.h"
> + #include "tst_test.h"
> +
> + static int offsets[] =3D {
> +--
> +2.28.0
> +
> diff --git a/meta/recipes-extended/ltp/ltp_20200515.bb
> b/meta/recipes-extended/ltp/ltp_20200930.bb
> similarity index 93%
> rename from meta/recipes-extended/ltp/ltp_20200515.bb
> rename to meta/recipes-extended/ltp/ltp_20200930.bb
> index 0c7044d044..84fe734bc4 100644
> --- a/meta/recipes-extended/ltp/ltp_20200515.bb
> +++ b/meta/recipes-extended/ltp/ltp_20200930.bb
> @@ -27,17 +27,15 @@ CFLAGS_append_x86-64 =3D " -fomit-frame-pointer"
>
>  CFLAGS_append_powerpc64 =3D " -D__SANE_USERSPACE_TYPES__"
>  CFLAGS_append_mipsarchn64 =3D " -D__SANE_USERSPACE_TYPES__"
> -SRCREV =3D "0d79a93e6ca44d9bc95973faea6bcd7b0c6d1f43"
> +SRCREV =3D "da2f34028f046a208aa2fed5e287df2538e69f91"
>
>  SRC_URI =3D "git://github.com/linux-test-project/ltp.git \
>
> file://0001-build-Add-option-to-select-libc-implementation.patch \
> -           file://0004-guard-mallocopt-with-__GLIBC__.patch \
>             file://0007-Fix-test_proc_kill-hanging.patch \
>             file://0001-Add-more-musl-exclusions.patch \
> -           file://0001-ptrace01-Fix-missing-format-string.patch \
> -
>  file://0001-sigwaitinfo-Do-not-run-invalid-undefined-test-cases.patch \
> -
>  file://0001-syscalls-copy_file_range02-Expect-EFBIG-in-subcase-m.patch =
\
>             file://0001-Remove-OOM-tests-from-runtest-mm.patch \
> +           file://cacheflush01-Rewrite-into-new-API.patch \
> +           file://lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch =
\
>             "
>
>  S =3D "${WORKDIR}/git"
> --
> 2.28.0
>
>
>=20
>
>

--00000000000011639d05b20d0147
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thank you, but please set Upstream-Status properly fo=
r the two newly added patches.</div><div><br></div><div>Alex<br></div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mo=
n, 19 Oct 2020 at 22:13, Petr Vorel &lt;<a href=3D"mailto:petr.vorel@gmail.=
com">petr.vorel@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">New patches (backported musl related fixes):<br>
* cacheflush01-Rewrite-into-new-API.patch<br>
* lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch<br>
<br>
Dropped patches (not applicable)<br>
* 0001-sigwaitinfo-Do-not-run-invalid-undefined-test-cases.patch<br>
<br>
Dropped patches from this release:<br>
* 0001-ptrace01-Fix-missing-format-string.patch<br>
* 0001-syscalls-copy_file_range02-Expect-EFBIG-in-subcase-m.patch<br>
* 0004-guard-mallocopt-with-__GLIBC__.patch<br>
<br>
Rebased patches:<br>
* 0001-Remove-OOM-tests-from-runtest-mm.patch<br>
<br>
Signed-off-by: Petr Vorel &lt;<a href=3D"mailto:petr.vorel@gmail.com" targ=
et=3D"_blank">petr.vorel@gmail.com</a>&gt;<br>
---<br>
Hi,<br>
<br>
tested only on intel. Could anybody test it on MUSL<br>
(the 2 new MUSL related patches were tested on MUSL on Buildroot)<br>
<br>
Also, could anybody check if problems on sigwaitinfo01.c on MUSL persist<b=
r>
and update 0001-sigwaitinfo-Do-not-run-invalid-undefined-test-cases.patch?=
<br>
<br>
Kind regards,<br>
Petr<br>
<br>
=C2=A0...001-Remove-OOM-tests-from-runtest-mm.patch |=C2=A0 26 +-<br>
=C2=A0...1-ptrace01-Fix-missing-format-string.patch |=C2=A0 33 ---<br>
=C2=A0...not-run-invalid-undefined-test-cases.patch |=C2=A0 69 ------<br>
=C2=A0...le_range02-Expect-EFBIG-in-subcase-m.patch |=C2=A0 57 -----<br>
=C2=A0.../0004-guard-mallocopt-with-__GLIBC__.patch |=C2=A0 34 ---<br>
=C2=A0.../cacheflush01-Rewrite-into-new-API.patch=C2=A0 =C2=A0| 225 ++++++=
++++++++++++<br>
=C2=A0...ysinfo.h-to-fix-build-with-MUSL-libc.patch | 203 ++++++++++++++++=
<br>
=C2=A0.../ltp/{<a href=3D"http://ltp_20200515.bb" rel=3D"noreferrer" targe=
t=3D"_blank">ltp_20200515.bb</a> =3D&gt; <a href=3D"http://ltp_20200930.bb"=
 rel=3D"noreferrer" target=3D"_blank">ltp_20200930.bb</a>}=C2=A0 |=C2=A0 =
=C2=A08 +-<br>
=C2=A08 files changed, 444 insertions(+), 211 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-extended/ltp/ltp/0001-ptrace01-Fix-m=
issing-format-string.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/ltp/ltp/0001-sigwaitinfo-Do=
-not-run-invalid-undefined-test-cases.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/ltp/ltp/0001-syscalls-copy_=
file_range02-Expect-EFBIG-in-subcase-m.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/ltp/ltp/0004-guard-mallocop=
t-with-__GLIBC__.patch<br>
=C2=A0create mode 100644 meta/recipes-extended/ltp/ltp/cacheflush01-Rewrit=
e-into-new-API.patch<br>
=C2=A0create mode 100644 meta/recipes-extended/ltp/ltp/lapi-Add-sysinfo.h-=
to-fix-build-with-MUSL-libc.patch<br>
=C2=A0rename meta/recipes-extended/ltp/{<a href=3D"http://ltp_20200515.bb"=
 rel=3D"noreferrer" target=3D"_blank">ltp_20200515.bb</a> =3D&gt; <a href=
=3D"http://ltp_20200930.bb" rel=3D"noreferrer" target=3D"_blank">ltp_20200=
930.bb</a>} (93%)<br>
<br>
diff --git a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runt=
est-mm.patch b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-run=
test-mm.patch<br>
index 6b665030c3..95366aee37 100644<br>
--- a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.=
patch<br>
+++ b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.=
patch<br>
@@ -1,25 +1,25 @@<br>
-From 13ef88cdccfe3f58c53d57806866b91e310eb272 Mon Sep 17 00:00:00 2001<br=
>
+From 5093e44f02be0a3f1a5a79987a90ad43a2bc26c5 Mon Sep 17 00:00:00 2001<br=
>
=C2=A0From: &quot;Mingde (Matthew) Zeng&quot; &lt;<a href=3D"mailto:matthe=
wzmd@gmail.com" target=3D"_blank">matthewzmd@gmail.com</a>&gt;<br>
-Date: Wed, 29 Jul 2020 08:47:09 -0400<br>
-Subject: [PATCH] Remove OOM tests from runtest/mm<br>
-<br>
-Disable OOM tests, as they might cause oeqa ssh connection lost<br>
+Date: Mon, 19 Oct 2020 12:31:23 +0200<br>
+Subject: [PATCH] Disable OOM tests, as they might cause oeqa ssh connecti=
on<br>
+ lost<br>
<br>
=C2=A0Upstream-Status: Inappropriate [oe-core specific]<br>
=C2=A0Signed-off-by: Mingde (Matthew) Zeng &lt;<a href=3D"mailto:matthew.z=
eng@windriver.com" target=3D"_blank">matthew.zeng@windriver.com</a>&gt;<br>
-<br>
+[ pvorel: rebase for 20200930 ]<br>
+Signed-off-by: Petr Vorel &lt;<a href=3D"mailto:petr.vorel@gmail.com" tar=
get=3D"_blank">petr.vorel@gmail.com</a>&gt;<br>
=C2=A0---<br>
=C2=A0 runtest/mm | 6 ------<br>
=C2=A0 1 file changed, 6 deletions(-)<br>
<br>
=C2=A0diff --git a/runtest/mm b/runtest/mm<br>
-index a09f39c1e..76fa82754 100644<br>
+index 481d39691..cf207d10e 100644<br>
=C2=A0--- a/runtest/mm<br>
=C2=A0+++ b/runtest/mm<br>
-@@ -73,12 +73,6 @@ ksm06 ksm06<br>
- ksm06_1 ksm06 -n 10<br>
- ksm06_2 ksm06 -n 10000<br>
-<br>
+@@ -74,12 +74,6 @@ ksm06_2 ksm06 -n 10000<br>
+ <br>
+ cpuset01 cpuset01<br>
+ <br>
=C2=A0-oom01 oom01<br>
=C2=A0-oom02 oom02<br>
=C2=A0-oom03 oom03<br>
@@ -27,8 +27,8 @@ index a09f39c1e..76fa82754 100644<br>
=C2=A0-oom05 oom05<br>
=C2=A0-<br>
=C2=A0 swapping01 swapping01 -i 5<br>
-<br>
+ <br>
=C2=A0 thp01 thp01 -I 120<br>
---<br>
+-- <br>
=C2=A02.27.0<br>
<br>
diff --git a/meta/recipes-extended/ltp/ltp/0001-ptrace01-Fix-missing-forma=
t-string.patch b/meta/recipes-extended/ltp/ltp/0001-ptrace01-Fix-missing-fo=
rmat-string.patch<br>
deleted file mode 100644<br>
index 27b890e22b..0000000000<br>
--- a/meta/recipes-extended/ltp/ltp/0001-ptrace01-Fix-missing-format-strin=
g.patch<br>
+++ /dev/null<br>
@@ -1,33 +0,0 @@<br>
-From adb9587466a493fdd9d4410f1b8b130ebca06daa Mon Sep 17 00:00:00 2001<br=
>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank=
">raj.khem@gmail.com</a>&gt;<br>
-Date: Tue, 19 May 2020 22:21:23 -0700<br>
-Subject: [PATCH] ptrace01: Fix missing format string<br>
-<br>
-Fixes<br>
-| ptrace01.c:89:2: error: format string is not a string literal<br>
-(potentially insecure) [-Werror,-Wformat-security]<br>
-|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, tc-&gt;message);<br>
-|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ~~~~~~~~~~~<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
-Upstream-Status: Backport [58424835952641f4fd60c0ae3ab6c64decca3f8a]<br>
----<br>
- testcases/kernel/syscalls/ptrace/ptrace01.c | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/testcases/kernel/syscalls/ptrace/ptrace01.c b/testcases/kern=
el/syscalls/ptrace/ptrace01.c<br>
-index 87a99e4150..9071bbabaf 100644<br>
---- a/testcases/kernel/syscalls/ptrace/ptrace01.c<br>
-+++ b/testcases/kernel/syscalls/ptrace/ptrace01.c<br>
-@@ -86,7 +86,7 @@ static void run(unsigned int i)<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0got_signal =3D 0;<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 tst_res(TINFO, tc-&gt;message);<br>
-+=C2=A0 =C2=A0 =C2=A0 tst_res(TINFO, &quot;%s&quot;, tc-&gt;message);<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (tc-&gt;handler =3D=3D 1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0parent_act.sa_hand=
ler =3D parent_handler;<br>
--- <br>
-2.26.2<br>
-<br>
diff --git a/meta/recipes-extended/ltp/ltp/0001-sigwaitinfo-Do-not-run-inv=
alid-undefined-test-cases.patch b/meta/recipes-extended/ltp/ltp/0001-sigwai=
tinfo-Do-not-run-invalid-undefined-test-cases.patch<br>
deleted file mode 100644<br>
index 17d5af89e2..0000000000<br>
--- a/meta/recipes-extended/ltp/ltp/0001-sigwaitinfo-Do-not-run-invalid-un=
defined-test-cases.patch<br>
+++ /dev/null<br>
@@ -1,69 +0,0 @@<br>
-From e0a63deb1857eb90288e90d6368df70cdd0c0ec9 Mon Sep 17 00:00:00 2001<br=
>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank=
">raj.khem@gmail.com</a>&gt;<br>
-Date: Thu, 28 May 2020 13:04:33 -0700<br>
-Subject: [PATCH] sigwaitinfo: Do not run invalid/undefined test cases<br>
-<br>
-These testcases run for eternity on musl<br>
-<br>
-test_bad_address* cases are passing invalid pointers to a function; that&=
#39;s always UB<br>
-empty_set and timeout rely on the implementation-defined &quot;may fail&q=
uot; for EINTR in sigtimedwait [1]<br>
-<br>
-normally &quot;may fail&quot; is an &quot;unspecified&quot; but here the =
impl<br>
-is supposed to document it so it&#39;s &quot;impl-defined&quot;<br>
-<br>
-[1] <a href=3D"https://pubs.opengroup.org/onlinepubs/9699919799/functions=
/sigtimedwait.html" rel=3D"noreferrer" target=3D"_blank">https://pubs.openg=
roup.org/onlinepubs/9699919799/functions/sigtimedwait.html</a><br>
-<br>
-Upstream-Status: Submitted [<a href=3D"https://patchwork.ozlabs.org/proje=
ct/ltp/patch/20200528204556.2444156-1-raj.khem@gmail.com/" rel=3D"noreferre=
r" target=3D"_blank">https://patchwork.ozlabs.org/project/ltp/patch/2020052=
8204556.2444156-1-raj.khem@gmail.com/</a>]<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
-Cc: Rich Felker &lt;<a href=3D"mailto:dalias@aerifal.cx" target=3D"_blank=
">dalias@aerifal.cx</a>&gt;<br>
----<br>
- .../kernel/syscalls/sigwaitinfo/sigwaitinfo01.c=C2=A0 =C2=A0 =C2=A0 | 12=
 ++----------<br>
- 1 file changed, 2 insertions(+), 10 deletions(-)<br>
-<br>
---- a/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c<br>
-+++ b/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c<br>
-@@ -422,15 +422,10 @@ struct test_desc {<br>
- } tests[] =3D {<br>
- #ifdef TEST_RT_SIGTIMEDWAIT<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
--=C2=A0 =C2=A0 =C2=A0 test_empty_set, my_rt_sigtimedwait, SIGUSR1}, {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0test_unmasked_matching, my_rt_sigtimedwait, SI=
GUSR1}, {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0test_masked_matching, my_rt_sigtimedwait, SIGU=
SR1}, {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0test_unmasked_matching_noinfo, my_rt_sigtimedw=
ait, SIGUSR1}, {<br>
--=C2=A0 =C2=A0 =C2=A0 test_masked_matching_noinfo, my_rt_sigtimedwait, SI=
GUSR1}, {<br>
--=C2=A0 =C2=A0 =C2=A0 test_bad_address, my_rt_sigtimedwait, SIGUSR1}, {<b=
r>
--=C2=A0 =C2=A0 =C2=A0 test_bad_address2, my_rt_sigtimedwait, SIGUSR1}, {<=
br>
--=C2=A0 =C2=A0 =C2=A0 test_bad_address3, my_rt_sigtimedwait, SIGUSR1}, {<=
br>
--=C2=A0 =C2=A0 =C2=A0 test_timeout, my_rt_sigtimedwait, 0},<br>
-+=C2=A0 =C2=A0 =C2=A0 test_masked_matching_noinfo, my_rt_sigtimedwait, SI=
GUSR1}, <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Special cases */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 1: sigwaitinfo does respond t=
o ignored signal */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-@@ -452,25 +447,17 @@ struct test_desc {<br>
- #endif<br>
- #if defined TEST_SIGWAITINFO<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
--=C2=A0 =C2=A0 =C2=A0 test_empty_set, my_sigwaitinfo, SIGUSR1}, {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0test_unmasked_matching, my_sigwaitinfo, SIGUSR=
1}, {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0test_masked_matching, my_sigwaitinfo, SIGUSR1}=
, {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0test_unmasked_matching_noinfo, my_sigwaitinfo,=
 SIGUSR1}, {<br>
--=C2=A0 =C2=A0 =C2=A0 test_masked_matching_noinfo, my_sigwaitinfo, SIGUSR=
1}, {<br>
--=C2=A0 =C2=A0 =C2=A0 test_bad_address, my_sigwaitinfo, SIGUSR1}, {<br>
--=C2=A0 =C2=A0 =C2=A0 test_bad_address2, my_sigwaitinfo, SIGUSR1},<br>
-+=C2=A0 =C2=A0 =C2=A0 test_masked_matching_noinfo, my_sigwaitinfo, SIGUSR=
1},<br>
- #endif<br>
- #if defined TEST_SIGTIMEDWAIT<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
--=C2=A0 =C2=A0 =C2=A0 test_empty_set, my_sigtimedwait, SIGUSR1}, {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0test_unmasked_matching, my_sigtimedwait, SIGUS=
R1}, {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0test_masked_matching, my_sigtimedwait, SIGUSR1=
}, {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0test_unmasked_matching_noinfo, my_sigtimedwait=
, SIGUSR1}, {<br>
--=C2=A0 =C2=A0 =C2=A0 test_masked_matching_noinfo, my_sigtimedwait, SIGUS=
R1}, {<br>
--=C2=A0 =C2=A0 =C2=A0 test_bad_address, my_sigtimedwait, SIGUSR1}, {<br>
--=C2=A0 =C2=A0 =C2=A0 test_bad_address2, my_sigtimedwait, SIGUSR1}, {<br>
--=C2=A0 =C2=A0 =C2=A0 test_bad_address3, my_sigtimedwait, SIGUSR1}, {<br>
--=C2=A0 =C2=A0 =C2=A0 test_timeout, my_sigtimedwait, 0},<br>
-+=C2=A0 =C2=A0 =C2=A0 test_masked_matching_noinfo, my_sigtimedwait, SIGUS=
R1},<br>
- #endif<br>
- };<br>
- <br>
diff --git a/meta/recipes-extended/ltp/ltp/0001-syscalls-copy_file_range02=
-Expect-EFBIG-in-subcase-m.patch b/meta/recipes-extended/ltp/ltp/0001-sysca=
lls-copy_file_range02-Expect-EFBIG-in-subcase-m.patch<br>
deleted file mode 100644<br>
index 09b6f54874..0000000000<br>
--- a/meta/recipes-extended/ltp/ltp/0001-syscalls-copy_file_range02-Expect=
-EFBIG-in-subcase-m.patch<br>
+++ /dev/null<br>
@@ -1,57 +0,0 @@<br>
-From 99687ab002f9f750f6f18fa1d70a91f0aa4f8ba2 Mon Sep 17 00:00:00 2001<br=
>
-From: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com" target=3D"_blank=
">zhe.he@windriver.com</a>&gt;<br>
-Date: Thu, 18 Jun 2020 17:18:27 +0800<br>
-Subject: [PATCH] syscalls/copy_file_range02: Expect EFBIG in subcase max<=
br>
- length on 32-bit architectures<br>
-<br>
-For syscall<br>
-ssize_t copy_file_range(int fd_in, loff_t *off_in,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int fd_out, loff_t *off_out,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t len, unsigned int flags);<br>
-off_out is loff_t* that is long long, 64 bits on 32-bit architectures,<br=
>
-while len is size_t that unsigned int, 32 bits on 32-bit architectures.<b=
r>
-<br>
-In subcase &quot;max length&quot;, simplified as below,<br>
-<br>
-dst =3D tst_max_lfs_filesize();<br>
-TEST(sys_copy_file_range(fd_src, 0, *tc-&gt;copy_to_fd, &amp;dst, tc-&gt;=
len, tc-&gt;flags));<br>
-<br>
-where dst is 4K*4G and len is 4G, so (4K+1)*4G is always smaller than 4G*=
4G,<br>
-it can never match the following kernel condition on 32-bit architectures=
.<br>
-<br>
-if (pos_in + count &lt; pos_in || pos_out + count &lt; pos_out)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return -EOVERFLOW;<br>
-<br>
-And thus we would get error like<br>
-copy_file_range02.c:139: FAIL: copy_file_range failed unexpectedly; expec=
ted EOVERFLOW, but got: EFBIG (27)<br>
-<br>
-Also correct a typo.<br>
-<br>
-Upstream-Status: Backport [<a href=3D"http://lists.linux.it/pipermail/ltp=
/2020-June/017716.html" rel=3D"noreferrer" target=3D"_blank">http://lists.l=
inux.it/pipermail/ltp/2020-June/017716.html</a>]<br>
-<br>
-Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com" target=
=3D"_blank">zhe.he@windriver.com</a>&gt;<br>
-Acked-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"_bla=
nk">liwang@redhat.com</a>&gt;<br>
----<br>
- .../kernel/syscalls/copy_file_range/copy_file_range02.c=C2=A0 =C2=A0 =C2=
=
=A0| 6 +++++-<br>
- 1 file changed, 5 insertions(+), 1 deletion(-)<br>
-<br>
-diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.=
c b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c<br>
-index fa679c4d3..bc27fbe57 100644<br>
---- a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c<br>
-+++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c<br>
-@@ -78,7 +78,11 @@ static struct tcase {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{&amp;fd_chrdev,=C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =
=
=C2=A0 EINVAL,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CONTSIZE,=C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0&quot;char device&quot;,=C2=A0 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{&amp;fd_fifo,=C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =
=C2=A0 =C2=A0 EINVAL,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CONTSIZE,=C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0&quot;fifo&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00},<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{&amp;fd_pipe[0],=C2=A0 =C2=A00,=C2=A0 =C2=A0 =
=
=C2=A0 EINVAL,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CONTSIZE,=C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0&quot;pipe&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00},<br>
--=C2=A0 =C2=A0 =C2=A0 {&amp;fd_copy,=C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =
=
=C2=A0 EOVERFLOW,=C2=A0 =C2=A0 =C2=A0 ULLONG_MAX,=C2=A0 =C2=A0 =C2=A0&quot=
;max length lenght&quot;,=C2=A0 =C2=A0 1},<br>
-+#ifdef TST_ABI64<br>
-+=C2=A0 =C2=A0 =C2=A0 {&amp;fd_copy,=C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =
=
=C2=A0 EOVERFLOW,=C2=A0 =C2=A0 =C2=A0 ULLONG_MAX,=C2=A0 =C2=A0 =C2=A0&quot=
;max length&quot;,=C2=A0 =C2=A01},<br>
-+#else<br>
-+=C2=A0 =C2=A0 =C2=A0 {&amp;fd_copy,=C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =
=
=C2=A0 EFBIG,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ULLONG_MAX,=C2=A0 =C2=A0 =
=C2=A0&quot;max length&quot;,=C2=A0 =C2=A01},<br>
-+#endif<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{&amp;fd_copy,=C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =
=C2=A0 =C2=A0 EFBIG,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MIN_OFF,=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;max file size&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 1}=
,<br>
- };<br>
- <br>
--- <br>
-2.17.1<br>
-<br>
diff --git a/meta/recipes-extended/ltp/ltp/0004-guard-mallocopt-with-__GLI=
BC__.patch b/meta/recipes-extended/ltp/ltp/0004-guard-mallocopt-with-__GLIB=
C__.patch<br>
deleted file mode 100644<br>
index a187f61f08..0000000000<br>
--- a/meta/recipes-extended/ltp/ltp/0004-guard-mallocopt-with-__GLIBC__.pa=
tch<br>
+++ /dev/null<br>
@@ -1,34 +0,0 @@<br>
-From d0fc9ca5d3366f9b8907e463222403cd2327be10 Mon Sep 17 00:00:00 2001<br=
>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank=
">raj.khem@gmail.com</a>&gt;<br>
-Date: Fri, 8 Jan 2016 06:51:20 +0000<br>
-Subject: [PATCH] guard mallocopt() with __GLIBC__<br>
-<br>
-mallocopt is not available on non glibc implementations<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
-Reviewed-by: Petr Vorel &lt;<a href=3D"mailto:petr.vorel@gmail.com" targe=
t=3D"_blank">petr.vorel@gmail.com</a>&gt;<br>
-Upstream-Status: Accepted [967612c454aea66770b64f69287671037fe895b3]<br>
----<br>
- utils/benchmark/ebizzy-0.3/ebizzy.c | 4 ++--<br>
- 1 file changed, 2 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/utils/benchmark/ebizzy-0.3/ebizzy.c b/utils/benchmark/ebizzy=
-0.3/ebizzy.c<br>
-index 5bb8eff..934d951 100644<br>
---- a/utils/benchmark/ebizzy-0.3/ebizzy.c<br>
-+++ b/utils/benchmark/ebizzy-0.3/ebizzy.c<br>
-@@ -215,10 +215,10 @@ static void read_options(int argc, char *argv[])<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0&quot;\&quot;never mmap\&quot; option specified\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usage();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--<br>
-+#ifdef __GLIBC__<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (never_mmap)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mallopt(M_MMAP_MAX=
, 0);<br>
--<br>
-+#endif<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (chunk_size &lt; record_size) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &q=
uot;Chunk size %u smaller than record size %u\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0chunk_size, record_size);<br>
--- <br>
-2.7.4<br>
-<br>
diff --git a/meta/recipes-extended/ltp/ltp/cacheflush01-Rewrite-into-new-A=
PI.patch b/meta/recipes-extended/ltp/ltp/cacheflush01-Rewrite-into-new-API.=
patch<br>
new file mode 100644<br>
index 0000000000..f9815624b9<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/ltp/ltp/cacheflush01-Rewrite-into-new-API.patc=
h<br>
@@ -0,0 +1,225 @@<br>
+From 48edd768850825a4d01e5e5e737122333fc55cdf Mon Sep 17 00:00:00 2001<br=
>
+From: Petr Vorel &lt;<a href=3D"mailto:petr.vorel@gmail.com" target=3D"_b=
lank">petr.vorel@gmail.com</a>&gt;<br>
+Date: Fri, 2 Oct 2020 21:29:58 +0200<br>
+Subject: [PATCH] cacheflush01: Rewrite into new API<br>
+<br>
+This syscall is currently (v5.9) supported on these architectures:<br>
+arc, csky, mips, m68k, nds32, sh<br>
+<br>
+constants are missing for m68k, not sure if the testcase is valid for it.=
<br>
+Untested.<br>
+<br>
+Test for __LTP__NR_INVALID_SYSCALL saves adding autotools check for<br>
+&lt;asm/cachectl.h&gt;.<br>
+<br>
+Signed-off-by: Petr Vorel &lt;<a href=3D"mailto:petr.vorel@gmail.com" tar=
get=3D"_blank">petr.vorel@gmail.com</a>&gt;<br>
+---<br>
+[ upstream status: <a href=3D"https://patchwork.ozlabs.org/project/ltp/pa=
tch/20201002202416.28972-1-petr.vorel@gmail.com/" rel=3D"noreferrer" target=
=
=3D"_blank">https://patchwork.ozlabs.org/project/ltp/patch/20201002202416.=
28972-1-petr.vorel@gmail.com/</a> ]<br>
+ .../kernel/syscalls/cacheflush/cacheflush01.c | 173 ++++--------------<b=
r>
+ 1 file changed, 40 insertions(+), 133 deletions(-)<br>
+<br>
+diff --git a/testcases/kernel/syscalls/cacheflush/cacheflush01.c b/testca=
ses/kernel/syscalls/cacheflush/cacheflush01.c<br>
+index 29cf2014a..6ad8b953a 100644<br>
+--- a/testcases/kernel/syscalls/cacheflush/cacheflush01.c<br>
++++ b/testcases/kernel/syscalls/cacheflush/cacheflush01.c<br>
+@@ -1,157 +1,64 @@<br>
+-/***********************************************************************=
*******/<br>
+-/* Copyright (c) Maxin John &lt;<a href=3D"mailto:maxin.john@gmail.com" =
target=3D"_blank">maxin.john@gmail.com</a>&gt;, 2009=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-/* LKML Reference: <a href=3D"http://lkml.org/lkml/2009/4/9/203" rel=3D"=
noreferrer" target=3D"_blank">http://lkml.org/lkml/2009/4/9/203</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 */<br>
+-/* This program is free software;=C2=A0 you can redistribute it and/or m=
odify=C2=A0 =C2=A0 =C2=A0 */<br>
+-/* it under the terms of the GNU General Public License as published by=
=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+-/* the Free Software Foundation; either version 2 of the License, or=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-/* (at your option) any later version.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-/* This program is distributed in the hope that it will be useful,=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-/* but WITHOUT ANY WARRANTY;=C2=A0 without even the implied warranty of=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-/* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See=C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-/* the GNU General Public License for more details.=C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0*/<br>
+-/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-/* You should have received a copy of the GNU General Public License=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-/* along with this program;=C2=A0 if not, write to the Free Software=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+-/* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1=
301 USA=C2=A0 =C2=A0 */<br>
+-/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-/***********************************************************************=
*******/<br>
+-/***********************************************************************=
*******/<br>
+-/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-/* File:=C2=A0 =C2=A0 =C2=A0 =C2=A0 cacheflush01.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
*/<br>
+-/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-/* Description: The cacheflush_check() syscall=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 */<br>
+-/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Tests EINVAL error of cachef=
lush system call.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0*/<br>
+-/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Its expected behaviour is ca=
cheflush() should return -EINVAL=C2=A0 */<br>
+-/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 when cache parameter is not =
one of ICACHE, DCACHE, or BCACHE. */<br>
+-/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-/* Usage:=C2=A0 &lt;for command-line&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br=
>
+-/* cacheflush01 [-c n] [-e][-i n] [-I x] [-p x] [-t]=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<b=
r>
+-/*=C2=A0 =C2=A0 =C2=A0 where,=C2=A0 -c n : Run n copies concurrently.=C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+-/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e=C2=A0 =C2=A0: Turn=
 on errno logging.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+-/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -i n : Execute test n=
 times.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -I x : Execute test f=
or x seconds.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -P x : Pause for x se=
conds between iterations.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 */<br>
+-/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -t=C2=A0 =C2=A0: Turn=
 on syscall timing.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-/* Total Tests: 1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0*/<br>
+-/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-/* Test Name:=C2=A0 =C2=A0cacheflush01=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-/***********************************************************************=
*******/<br>
++// SPDX-License-Identifier: GPL-2.0-or-later<br>
+ <br>
+-#include &lt;unistd.h&gt;<br>
+-#include &lt;stdio.h&gt;<br>
+-#include &lt;stdlib.h&gt;<br>
+-#include &lt;errno.h&gt;<br>
+-<br>
+-#include &quot;test.h&quot;<br>
++#include &quot;tst_test.h&quot;<br>
+ #include &quot;lapi/syscalls.h&quot;<br>
+ <br>
+ #if __NR_cacheflush !=3D __LTP__NR_INVALID_SYSCALL<br>
++<br>
+ #include &lt;asm/cachectl.h&gt;<br>
+-#else<br>
++<br>
++/*<br>
++ * m68k does not have these constants<br>
++ */<br>
++<br>
+ #ifndef=C2=A0 =C2=A0ICACHE<br>
+-#define=C2=A0 =C2=A0ICACHE=C2=A0 =C2=A0(1&lt;&lt;0)=C2=A0 =C2=A0 =C2=A0/=
* flush instruction cache=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
++# define=C2=A0 =C2=A0ICACHE=C2=A0 =C2=A0(1&lt;&lt;0)<br>
+ #endif<br>
++<br>
+ #ifndef=C2=A0 =C2=A0DCACHE<br>
+-#define=C2=A0 =C2=A0DCACHE=C2=A0 =C2=A0(1&lt;&lt;1)=C2=A0 =C2=A0 =C2=A0/=
* writeback and flush data cache */<br>
++# define=C2=A0 =C2=A0DCACHE=C2=A0 =C2=A0(1&lt;&lt;1)<br>
+ #endif<br>
++<br>
+ #ifndef=C2=A0 =C2=A0BCACHE<br>
+-#define=C2=A0 =C2=A0BCACHE=C2=A0 =C2=A0(ICACHE|DCACHE)=C2=A0 =C2=A0 /* f=
lush both caches=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-#endif<br>
++# define=C2=A0 =C2=A0BCACHE=C2=A0 =C2=A0(ICACHE|DCACHE)<br>
+ #endif<br>
+ <br>
+-char *TCID =3D &quot;cacheflush01&quot;;<br>
+-int TST_TOTAL =3D 1;<br>
++#define CACHE_DESC(x) .cache =3D x, .desc =3D #x<br>
+ <br>
+-/* Extern Global Functions */<br>
+-/***********************************************************************=
*******/<br>
+-/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-/* Function:=C2=A0 =C2=A0 cleanup=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*/<br>
+-/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-/* Description: Performs all one time clean up for this test on successf=
ul=C2=A0 =C2=A0 */<br>
+-/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 completion,=C2=A0 pre=
mature exit or=C2=A0 failure. Closes all temporary */<br>
+-/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 files, removes all te=
mporary directories exits the test with=C2=A0 */<br>
+-/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 appropriate return co=
de by calling tst_exit() function.=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+-/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-/* Input:=C2=A0 =C2=A0 =C2=A0 =C2=A0None.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+-/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-/* Output:=C2=A0 =C2=A0 =C2=A0 None.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0*/<br>
+-/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-/* Return:=C2=A0 =C2=A0 =C2=A0 On failure - Exits calling tst_exit(). No=
n &#39;0&#39; return code.=C2=A0 =C2=A0*/<br>
+-/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 On success - Exits ca=
lling tst_exit(). With &#39;0&#39; return code.=C2=A0 */<br>
+-/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-/***********************************************************************=
*******/<br>
+-void cleanup(void)<br>
+-{<br>
++static struct test_case_t {<br>
++=C2=A0 =C2=A0 =C2=A0 int cache;<br>
++=C2=A0 =C2=A0 =C2=A0 const char *desc;<br>
++} test_cases[] =3D {<br>
++=C2=A0 =C2=A0 =C2=A0 { CACHE_DESC(ICACHE) },<br>
++=C2=A0 =C2=A0 =C2=A0 { CACHE_DESC(DCACHE) },<br>
++=C2=A0 =C2=A0 =C2=A0 { CACHE_DESC(BCACHE) },<br>
++};<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 tst_rmdir();<br>
+-}<br>
++static char *addr;<br>
+ <br>
+-/* Local=C2=A0 Functions */<br>
+-/***********************************************************************=
*******/<br>
+-/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-/* Function:=C2=A0 =C2=A0 setup=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0*/<br>
+-/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-/* Description: Performs all one time setup for this test. This function=
 is=C2=A0 =C2=A0*/<br>
+-/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 typically used to cap=
ture signals, create temporary dirs=C2=A0 =C2=A0 =C2=A0 */<br>
+-/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 and temporary files t=
hat may be used in the course of this=C2=A0 =C2=A0 */<br>
+-/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test.=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+-/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-/* Input:=C2=A0 =C2=A0 =C2=A0 =C2=A0None.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+-/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-/* Output:=C2=A0 =C2=A0 =C2=A0 None.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0*/<br>
+-/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-/* Return:=C2=A0 =C2=A0 =C2=A0 On failure - Exits by calling cleanup().=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 */<br>
+-/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 On success - returns =
0.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+-/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-/***********************************************************************=
*******/<br>
+-void setup(void)<br>
++static void setup(void)<br>
+ {<br>
+-=C2=A0 =C2=A0 =C2=A0 /* Capture signals if any */<br>
+-=C2=A0 =C2=A0 =C2=A0 /* Create temporary directories */<br>
+-=C2=A0 =C2=A0 =C2=A0 TEST_PAUSE;<br>
+-=C2=A0 =C2=A0 =C2=A0 tst_tmpdir();<br>
++=C2=A0 =C2=A0 =C2=A0 addr =3D SAFE_MALLOC(getpagesize());<br>
+ }<br>
+ <br>
+-int main(int ac, char **av)<br>
++static void test_cacheflush(unsigned int i)<br>
+ {<br>
++=C2=A0 =C2=A0 =C2=A0 struct test_case_t *tc =3D &amp;test_cases[i];<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 char *addr =3D NULL;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 tst_parse_opts(ac, av, NULL, NULL);<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 setup();<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 tst_count =3D 0;<br>
+-=C2=A0 =C2=A0 =C2=A0 /* Create some user address range */<br>
+-=C2=A0 =C2=A0 =C2=A0 addr =3D malloc(getpagesize());<br>
+-=C2=A0 =C2=A0 =C2=A0 if (addr =3D=3D NULL) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_brkm(TFAIL | TTERRN=
O, cleanup, &quot;malloc failed&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 /* Invokes cacheflush() with proper parameters */<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 TEST(ltp_syscall(__NR_cacheflush, addr, getpagesize=
(), ICACHE));<br>
+-=C2=A0 =C2=A0 =C2=A0 if (TEST_RETURN =3D=3D 0) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_resm(TPASS, &quot;p=
assed with no errno&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 } else {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_resm(TFAIL, &quot;f=
ailed with unexpected errno&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 TEST(ltp_syscall(__NR_cacheflush, addr, getpagesize=
(), DCACHE));<br>
+-=C2=A0 =C2=A0 =C2=A0 if (TEST_RETURN =3D=3D 0) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_resm(TPASS, &quot;p=
assed with no errno&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 TEST(tst_syscall(__NR_cacheflush, addr, getpagesize=
(), tc-&gt;cache));<br>
++=C2=A0 =C2=A0 =C2=A0 if (TST_RET =3D=3D 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TPASS, &quot;%s=
 passed&quot;, tc-&gt;desc);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_resm(TFAIL, &quot;f=
ailed with unexpected errno&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TFAIL | TTERRNO=
, &quot;%s failed&quot;, tc-&gt;desc);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++}<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 TEST(ltp_syscall(__NR_cacheflush, addr, getpagesize=
(), BCACHE));<br>
+-=C2=A0 =C2=A0 =C2=A0 if (TEST_RETURN =3D=3D 0) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_resm(TPASS, &quot;p=
assed with no errno&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 } else {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_resm(TFAIL, &quot;f=
ailed with unexpected errno&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
++static struct tst_test test =3D {<br>
++=C2=A0 =C2=A0 =C2=A0 .setup =3D setup,<br>
++=C2=A0 =C2=A0 =C2=A0 .test =3D test_cacheflush,<br>
++=C2=A0 =C2=A0 =C2=A0 .tcnt =3D ARRAY_SIZE(test_cases),<br>
++};<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 cleanup();<br>
+-=C2=A0 =C2=A0 =C2=A0 tst_exit();<br>
+-}<br>
++#else<br>
++=C2=A0 =C2=A0 =C2=A0 TST_TEST_TCONF(&quot;system doesn&#39;t support cac=
heflush()&quot;);<br>
++#endif<br>
+-- <br>
+2.28.0<br>
+<br>
diff --git a/meta/recipes-extended/ltp/ltp/lapi-Add-sysinfo.h-to-fix-build=
-with-MUSL-libc.patch b/meta/recipes-extended/ltp/ltp/lapi-Add-sysinfo.h-to=
-fix-build-with-MUSL-libc.patch<br>
new file mode 100644<br>
index 0000000000..f1b6743f21<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/ltp/ltp/lapi-Add-sysinfo.h-to-fix-build-with-M=
USL-libc.patch<br>
@@ -0,0 +1,203 @@<br>
+From ac3e262cba81889c0bb04ce87a50a1709f2726e7 Mon Sep 17 00:00:00 2001<br=
>
+From: Petr Vorel &lt;<a href=3D"mailto:petr.vorel@gmail.com" target=3D"_b=
lank">petr.vorel@gmail.com</a>&gt;<br>
+Date: Thu, 1 Oct 2020 23:28:39 +0200<br>
+Subject: [PATCH] lapi: Add sysinfo.h to fix build with MUSL libc<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+The reason is to avoid indirect &lt;linux/sysinfo.h&gt; include when usin=
g<br>
+some network headers: &lt;linux/netlink.h&gt; or others -&gt; &lt;linux/k=
ernel.h&gt;<br>
+-&gt; &lt;linux/sysinfo.h&gt;<br>
+<br>
+This indirect include causes on MUSL redefinition of struct sysinfo when<=
br>
+included both &lt;sys/sysinfo.h&gt; and some of UAPI headers:<br>
+<br>
+In file included from x86_64-buildroot-linux-musl/sysroot/usr/include/lin=
ux/kernel.h:5,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from x86_64=
-buildroot-linux-musl/sysroot/usr/include/linux/netlink.h:5,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ../inc=
lude/tst_netlink.h:14,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from tst_cr=
ypto.c:13:<br>
+x86_64-buildroot-linux-musl/sysroot/usr/include/linux/sysinfo.h:8:8: erro=
r: redefinition of =E2=80=98struct sysinfo=E2=80=99<br>
+ struct sysinfo {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~<br>
+In file included from ../include/tst_safe_macros.h:15,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ../inc=
lude/tst_test.h:93,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from tst_cr=
ypto.c:11:<br>
+x86_64-buildroot-linux-musl/sysroot/usr/include/sys/sysinfo.h:10:8: note:=
 originally defined here<br>
+<br>
+Signed-off-by: Petr Vorel &lt;<a href=3D"mailto:petr.vorel@gmail.com" tar=
get=3D"_blank">petr.vorel@gmail.com</a>&gt;<br>
+[ upstream status: <a href=3D"https://patchwork.ozlabs.org/project/ltp/pa=
tch/20201001231256.6930-1-petr.vorel@gmail.com/" rel=3D"noreferrer" target=
=3D"_blank">https://patchwork.ozlabs.org/project/ltp/patch/20201001231256.=
6930-1-petr.vorel@gmail.com/</a> ]<br>
+---<br>
+ include/lapi/sysinfo.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 22 +++++++++++++++++++<br>
+ include/tst_safe_macros.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
+ lib/safe_macros.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
+ lib/tst_memutils.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
+ testcases/kernel/mem/mtest01/mtest01.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 2 +-<br>
+ testcases/kernel/syscalls/madvise/madvise06.c |=C2=A0 2 +-<br>
+ testcases/kernel/syscalls/sysinfo/sysinfo01.c |=C2=A0 2 +-<br>
+ testcases/kernel/syscalls/sysinfo/sysinfo02.c |=C2=A0 2 +-<br>
+ testcases/kernel/syscalls/sysinfo/sysinfo03.c |=C2=A0 2 +-<br>
+ 9 files changed, 30 insertions(+), 8 deletions(-)<br>
+ create mode 100644 include/lapi/sysinfo.h<br>
+<br>
+diff --git a/include/lapi/sysinfo.h b/include/lapi/sysinfo.h<br>
+new file mode 100644<br>
+index 000000000..d0e0e93d7<br>
+--- /dev/null<br>
++++ b/include/lapi/sysinfo.h<br>
+@@ -0,0 +1,22 @@<br>
++// SPDX-License-Identifier: GPL-2.0-or-later<br>
++/*<br>
++ * Copyright (c) 2020 Petr Vorel &lt;<a href=3D"mailto:petr.vorel@gmail.=
com" target=3D"_blank">petr.vorel@gmail.com</a>&gt;<br>
++ */<br>
++<br>
++#ifndef SYSINFO_H__<br>
++<br>
++/*<br>
++ * Don&#39;t use &lt;sys/sysinfo.h&gt; as it breaks build MUSL toolchain=
.<br>
++ * Use &lt;linux/sysinfo.h&gt; instead.<br>
++ *<br>
++ * Some kernel UAPI headers do indirect &lt;linux/sysinfo.h&gt; include:=
<br>
++ * &lt;linux/netlink.h&gt; or others -&gt; &lt;linux/kernel.h&gt; -&gt; =
&lt;linux/sysinfo.h&gt;<br>
++ *<br>
++ * This indirect include causes on MUSL redefinition of struct sysinfo w=
hen<br>
++ * included both &lt;sys/sysinfo.h&gt; and some of UAPI headers:<br>
++ */<br>
++#include &lt;linux/sysinfo.h&gt;<br>
++<br>
++#define SYSINFO_H__<br>
++<br>
++#endif /* SYSINFO_H__ */<br>
+diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h<br>
+index 053c3bcf9..61ea2076d 100644<br>
+--- a/include/tst_safe_macros.h<br>
++++ b/include/tst_safe_macros.h<br>
+@@ -12,7 +12,7 @@<br>
+ #include &lt;sys/resource.h&gt;<br>
+ #include &lt;sys/stat.h&gt;<br>
+ #include &lt;sys/vfs.h&gt;<br>
+-#include &lt;sys/sysinfo.h&gt;<br>
++#include &lt;linux/sysinfo.h&gt;<br>
+ #include &lt;fcntl.h&gt;<br>
+ #include &lt;libgen.h&gt;<br>
+ #include &lt;signal.h&gt;<br>
+diff --git a/lib/safe_macros.c b/lib/safe_macros.c<br>
+index 4f48d7529..d8ee03dae 100644<br>
+--- a/lib/safe_macros.c<br>
++++ b/lib/safe_macros.c<br>
+@@ -11,7 +11,6 @@<br>
+ #include &lt;sys/wait.h&gt;<br>
+ #include &lt;sys/mount.h&gt;<br>
+ #include &lt;sys/xattr.h&gt;<br>
+-#include &lt;sys/sysinfo.h&gt;<br>
+ #include &lt;errno.h&gt;<br>
+ #include &lt;fcntl.h&gt;<br>
+ #include &lt;libgen.h&gt;<br>
+@@ -23,6 +22,7 @@<br>
+ #include &lt;malloc.h&gt;<br>
+ #include &quot;test.h&quot;<br>
+ #include &quot;safe_macros.h&quot;<br>
++#include &quot;lapi/sysinfo.h&quot;<br>
+<br>
+ char *safe_basename(const char *file, const int lineno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void=
 (*cleanup_fn) (void), char *path)<br>
+diff --git a/lib/tst_memutils.c b/lib/tst_memutils.c<br>
+index f134d90c9..647db951e 100644<br>
+--- a/lib/tst_memutils.c<br>
++++ b/lib/tst_memutils.c<br>
+@@ -5,11 +5,11 @@<br>
+<br>
+ #include &lt;unistd.h&gt;<br>
+ #include &lt;limits.h&gt;<br>
+-#include &lt;sys/sysinfo.h&gt;<br>
+ #include &lt;stdlib.h&gt;<br>
+<br>
+ #define TST_NO_DEFAULT_MAIN<br>
+ #include &quot;tst_test.h&quot;<br>
++#include &quot;lapi/sysinfo.h&quot;<br>
+<br>
+ #define BLOCKSIZE (16 * 1024 * 1024)<br>
+<br>
+diff --git a/testcases/kernel/mem/mtest01/mtest01.c b/testcases/kernel/me=
m/mtest01/mtest01.c<br>
+index f08d3943f..9b4d856f8 100644<br>
+--- a/testcases/kernel/mem/mtest01/mtest01.c<br>
++++ b/testcases/kernel/mem/mtest01/mtest01.c<br>
+@@ -20,7 +20,6 @@<br>
+=C2=A0 */<br>
+<br>
+ #include &lt;sys/types.h&gt;<br>
+-#include &lt;sys/sysinfo.h&gt;<br>
+ #include &lt;sys/wait.h&gt;<br>
+ #include &lt;limits.h&gt;<br>
+ #include &lt;signal.h&gt;<br>
+@@ -29,6 +28,7 @@<br>
+ #include &lt;unistd.h&gt;<br>
+<br>
+ #include &quot;lapi/abisize.h&quot;<br>
++#include &quot;lapi/sysinfo.h&quot;<br>
+ #include &quot;tst_test.h&quot;<br>
+<br>
+ #define FIVE_HUNDRED_MB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(500ULL*1024*10=
24)<br>
+diff --git a/testcases/kernel/syscalls/madvise/madvise06.c b/testcases/ke=
rnel/syscalls/madvise/madvise06.c<br>
+index f76f3f6aa..b2613670b 100644<br>
+--- a/testcases/kernel/syscalls/madvise/madvise06.c<br>
++++ b/testcases/kernel/syscalls/madvise/madvise06.c<br>
+@@ -24,8 +24,8 @@<br>
+ #include &lt;errno.h&gt;<br>
+ #include &lt;stdio.h&gt;<br>
+ #include &lt;sys/mount.h&gt;<br>
+-#include &lt;sys/sysinfo.h&gt;<br>
+ #include &quot;tst_test.h&quot;<br>
++#include &quot;lapi/sysinfo.h&quot;<br>
+<br>
+ #define CHUNK_SZ (400*1024*1024L)<br>
+ #define CHUNK_PAGES (CHUNK_SZ / pg_sz)<br>
+diff --git a/testcases/kernel/syscalls/sysinfo/sysinfo01.c b/testcases/ke=
rnel/syscalls/sysinfo/sysinfo01.c<br>
+index 2ea44a2be..a95066bf5 100644<br>
+--- a/testcases/kernel/syscalls/sysinfo/sysinfo01.c<br>
++++ b/testcases/kernel/syscalls/sysinfo/sysinfo01.c<br>
+@@ -69,9 +69,9 @@<br>
+ #include &lt;sys/types.h&gt;<br>
+ #include &lt;sys/stat.h&gt;<br>
+ #include &lt;sys/signal.h&gt;<br>
+-#include &lt;sys/sysinfo.h&gt;<br>
+<br>
+ #include &quot;test.h&quot;<br>
++#include &quot;lapi/sysinfo.h&quot;<br>
+<br>
+ void setup();<br>
+ void cleanup();<br>
+diff --git a/testcases/kernel/syscalls/sysinfo/sysinfo02.c b/testcases/ke=
rnel/syscalls/sysinfo/sysinfo02.c<br>
+index 678b8f1d3..5ce65d20e 100644<br>
+--- a/testcases/kernel/syscalls/sysinfo/sysinfo02.c<br>
++++ b/testcases/kernel/syscalls/sysinfo/sysinfo02.c<br>
+@@ -65,10 +65,10 @@<br>
+ #include &lt;sys/types.h&gt;<br>
+ #include &lt;sys/stat.h&gt;<br>
+ #include &lt;sys/signal.h&gt;<br>
+-#include &lt;sys/sysinfo.h&gt;<br>
+ #include &lt;stdint.h&gt;<br>
+<br>
+ #include &quot;test.h&quot;<br>
++#include &quot;lapi/sysinfo.h&quot;<br>
+<br>
+ #define INVALID_ADDRESS ((uintptr_t)-1)<br>
+<br>
+diff --git a/testcases/kernel/syscalls/sysinfo/sysinfo03.c b/testcases/ke=
rnel/syscalls/sysinfo/sysinfo03.c<br>
+index af7cb6421..3b61a05b1 100644<br>
+--- a/testcases/kernel/syscalls/sysinfo/sysinfo03.c<br>
++++ b/testcases/kernel/syscalls/sysinfo/sysinfo03.c<br>
+@@ -13,9 +13,9 @@<br>
+<br>
+=C2=A0 */<br>
+<br>
+-#include &lt;sys/sysinfo.h&gt;<br>
+ #include &quot;lapi/namespaces_constants.h&quot;<br>
+ #include &quot;lapi/posix_clocks.h&quot;<br>
++#include &quot;lapi/sysinfo.h&quot;<br>
+ #include &quot;tst_test.h&quot;<br>
+<br>
+ static int offsets[] =3D {<br>
+--<br>
+2.28.0<br>
+<br>
diff --git a/meta/recipes-extended/ltp/<a href=3D"http://ltp_20200515.bb" =
rel=3D"noreferrer" target=3D"_blank">ltp_20200515.bb</a> b/meta/recipes-ext=
ended/ltp/<a href=3D"http://ltp_20200930.bb" rel=3D"noreferrer" target=3D"_=
blank">ltp_20200930.bb</a><br>
similarity index 93%<br>
rename from meta/recipes-extended/ltp/<a href=3D"http://ltp_20200515.bb" r=
el=3D"noreferrer" target=3D"_blank">ltp_20200515.bb</a><br>
rename to meta/recipes-extended/ltp/<a href=3D"http://ltp_20200930.bb" rel=
=
=3D"noreferrer" target=3D"_blank">ltp_20200930.bb</a><br>
index 0c7044d044..84fe734bc4 100644<br>
--- a/meta/recipes-extended/ltp/<a href=3D"http://ltp_20200515.bb" rel=3D"=
noreferrer" target=3D"_blank">ltp_20200515.bb</a><br>
+++ b/meta/recipes-extended/ltp/<a href=3D"http://ltp_20200930.bb" rel=3D"=
noreferrer" target=3D"_blank">ltp_20200930.bb</a><br>
@@ -27,17 +27,15 @@ CFLAGS_append_x86-64 =3D &quot; -fomit-frame-pointer&q=
uot;<br>
<br>
=C2=A0CFLAGS_append_powerpc64 =3D &quot; -D__SANE_USERSPACE_TYPES__&quot;<=
br>
=C2=A0CFLAGS_append_mipsarchn64 =3D &quot; -D__SANE_USERSPACE_TYPES__&quot=
;<br>
-SRCREV =3D &quot;0d79a93e6ca44d9bc95973faea6bcd7b0c6d1f43&quot;<br>
+SRCREV =3D &quot;da2f34028f046a208aa2fed5e287df2538e69f91&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/linux-test-proj=
ect/ltp.git" rel=3D"noreferrer" target=3D"_blank">github.com/linux-test-pro=
ject/ltp.git</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-build-Add-option-to-=
select-libc-implementation.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-guard-mallocopt-with=
-__GLIBC__.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0007-Fix-test_proc_kill-h=
anging.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Add-more-musl-exclus=
ions.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-ptrace01-Fix-missing=
-format-string.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-sigwaitinfo-Do-not-r=
un-invalid-undefined-test-cases.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-syscalls-copy_file_r=
ange02-Expect-EFBIG-in-subcase-m.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Remove-OOM-tests-fro=
m-runtest-mm.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://cacheflush01-Rewrite-into=
-new-API.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://lapi-Add-sysinfo.h-to-fix=
-build-with-MUSL-libc.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
-- <br>
2.28.0<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000011639d05b20d0147--
