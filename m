Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web12.3684.1589934532902356918
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2020 17:28:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rE4bI17a;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id f83so1861882qke.13
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2020 17:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/afA8JwJmxSBrXLv6jGLLKj7us797PdkG4838HDNzlQ=;
        b=rE4bI17aIg7UmvHGl+uYCx5pYJHhSPPSak7Pvlt7ZI4fOVVwSnSJW0JHP2HFT+fsx8
         k+7ZN2cSOsTTPH1LYGoBWxfZ1nhhGZUXazYzOQdpNgORR7hfnsZxhdMly2+RpCG6ktSG
         lF1rMsmi5xp2WCg00TnV8L+2y8E6W3v+Ir/vuD/4QtccsV58uN0rorVm31Ftz9LcUymX
         HW7qOPhijyCKbV62ZBMkKayrFqHPkryNOvyqHqJA/9nTJc9OSQ3Hxd8hOpGRLxDtJm2I
         lEaW/mTnMiLQ5/tZqnnrVJCkx2ZRLe3ann7TdwWLm9EjnZ/5CQ/NPCropvBccSHAIyjy
         4Nlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/afA8JwJmxSBrXLv6jGLLKj7us797PdkG4838HDNzlQ=;
        b=NN/YNhZi3/2HGd8p6nDmGJO8g5IvwnKYm0F2wb4P7PhNb5RpBa9xzsNA3+Hi1mnkdY
         A0+H1YAa9ecfb+f+jza2PFPcMKd/xJgHtzZu2/N0GNdwMnz08ADy6vNcHBpWbtnJK8GE
         1oU55U2WXN3xfvkWvffZ/4alnab2qb3u1w4zgs2MfeQ4nFRpi44Dx+X22Y/6SUn/5B8y
         tvc9eGgpHxapFhf8me2ZtmQiyAnRUR00y+VSHaCCQ1PxsXw6y3fsBr8tzHUFCQgXZjxj
         3fpS2RDoY1yVKCHnKodHhE81IHTtOFyc3LNTMwYpp9DvbsWcJsIPuNgbwXnSKoVSuYV0
         9VFw==
X-Gm-Message-State: AOAM531iGgqJgXXOZDwGL+6iNDgrovpieNun+LnIuavVBFJcNm2woIht
	9r88smt51g6ZCRcTNcyMVC2Mad9oObcy2GCkBsU=
X-Google-Smtp-Source: ABdhPJwGVWOINbG//EbW9phHluuG4R6Pxv49H23d9TnwcBb/c+xvakDpT2S7wjAR5zaUS5RzP3/u/bakWI9UHzmjVuQ=
X-Received: by 2002:a37:a694:: with SMTP id p142mr2155926qke.165.1589934531595;
 Tue, 19 May 2020 17:28:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200518203644.15991-1-petr.vorel@gmail.com>
In-Reply-To: <20200518203644.15991-1-petr.vorel@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 19 May 2020 17:28:25 -0700
Message-ID: <CAMKF1srsbwSLkcXsfro4B01aWWmp45p7vzA+HR9M-VQLxcr1EA@mail.gmail.com>
Subject: Re: [PATCH 1/1] ltp: Update to 20200515
To: Petr Vorel <petr.vorel@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Anuj Mittal <anuj.mittal@intel.com>, He Zhe <zhe.he@windriver.com>, 
	Anders Roxell <anders.roxell@linaro.org>, Yi Zhao <yi.zhao@windriver.com>, 
	=?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fails on musl

https://errors.yoctoproject.org/Errors/Details/412683/

On Mon, May 18, 2020 at 1:36 PM Petr Vorel <petr.vorel@gmail.com> wrote:
>
> Inherit also pkgconfig (required for TI-RPC and Netlink based route
> tests), to fix:
> configure:6045: error: possibly undefined macro: AC_DEFINE
>
> Refreshed patches (some tests have been fixed for musl)
> * 0001-build-Add-option-to-select-libc-implementation.patch
> (add a note here)
> * 0001-Add-more-musl-exclusions.patch
>
> Removed patches (different fix in upstream)
> * 0003-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch
>
> Removed patches (accepted upstream)
> * 0008-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch
> * 0001-syscalls-Check-for-time64-unsafe-syscalls-before-usi.patch
>
> Update upstream status
> * 0004-guard-mallocopt-with-__GLIBC__.patch
>
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Hi,
>
> tested:
>
> $ bitbake ltp
> Build Configuration:
> BB_VERSION           =3D "1.44.0"
> BUILD_SYS            =3D "x86_64-linux"
> NATIVELSBSTRING      =3D "opensusetumbleweed-20200516"
> TARGET_SYS           =3D "x86_64-oe-linux"
> MACHINE              =3D "qemux86-64"
> DISTRO               =3D "nodistro"
> DISTRO_VERSION       =3D "nodistro.0"
> TUNE_FEATURES        =3D "m64 core2"
> TARGET_FPU           =3D ""
> meta                 =3D "ltp/20200515.v1:31cb32ae7321027b25080c9f7be56ca=
140f1eb35"
>
> $ MACHINE=3Dqemuarm TCLIBC=3Dmusl bitbake ltp
> Build Configuration:
> BB_VERSION           =3D "1.44.0"
> BUILD_SYS            =3D "x86_64-linux"
> NATIVELSBSTRING      =3D "opensusetumbleweed-20200516"
> TARGET_SYS           =3D "arm-oe-linux-musleabi"
> MACHINE              =3D "qemuarm"
> DISTRO               =3D "nodistro"
> DISTRO_VERSION       =3D "nodistro.0"
> TUNE_FEATURES        =3D "arm armv7ve vfp thumb neon callconvention-hard"
> TARGET_FPU           =3D "hard"
> meta                 =3D "ltp/20200515.v1:b66ebb768a2b53f38d62d98249b377c=
73d5e0b9c"
>
> Kind regards,
> Petr
>
>  .../ltp/0001-Add-more-musl-exclusions.patch   |  28 ++--
>  ...option-to-select-libc-implementation.patch |  47 ++-----
>  ...or-time64-unsafe-syscalls-before-usi.patch | 122 ------------------
>  ...BC_PREREQ-is-defined-before-using-it.patch |  55 --------
>  .../0004-guard-mallocopt-with-__GLIBC__.patch |   4 +-
>  ...k-nfsv4-acl-acl1.c-Security-fix-on-s.patch |  42 ------
>  .../ltp/{ltp_20200120.bb =3D> ltp_20200515.bb}  |   7 +-
>  7 files changed, 25 insertions(+), 280 deletions(-)
>  delete mode 100644 meta/recipes-extended/ltp/ltp/0001-syscalls-Check-for=
-time64-unsafe-syscalls-before-usi.patch
>  delete mode 100644 meta/recipes-extended/ltp/ltp/0003-Check-if-__GLIBC_P=
REREQ-is-defined-before-using-it.patch
>  delete mode 100644 meta/recipes-extended/ltp/ltp/0008-testcases-network-=
nfsv4-acl-acl1.c-Security-fix-on-s.patch
>  rename meta/recipes-extended/ltp/{ltp_20200120.bb =3D> ltp_20200515.bb} =
(93%)
>
> diff --git a/meta/recipes-extended/ltp/ltp/0001-Add-more-musl-exclusions.=
patch b/meta/recipes-extended/ltp/ltp/0001-Add-more-musl-exclusions.patch
> index 02c2fef55b..f2fc8ee958 100644
> --- a/meta/recipes-extended/ltp/ltp/0001-Add-more-musl-exclusions.patch
> +++ b/meta/recipes-extended/ltp/ltp/0001-Add-more-musl-exclusions.patch
> @@ -1,35 +1,22 @@
> -From 788c47ceef7f115ab7f7aa17f918e58795f4e6c7 Mon Sep 17 00:00:00 2001
> +From ad8e73306cb8293f7d32841e1599fd9048801f1f Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Fri, 20 Dec 2019 13:06:05 +0100
>  Subject: [PATCH] Add more musl exclusions
>
>  Upstream-Status: Pending
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +[ pvorel: rebase for 20200515: enable accept4_01 ]
>  [ pvorel: rebase for 20200120: enable fanotify13, fanotify15, setxattr03=
 ]
>  Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
>  ---
> - testcases/kernel/syscalls/accept4/Makefile      | 4 ++++
>   testcases/kernel/syscalls/timer_create/Makefile | 4 ++++
> - 2 files changed, 8 insertions(+)
> + 1 file changed, 4 insertions(+)
>
> -diff --git a/testcases/kernel/syscalls/accept4/Makefile b/testcases/kern=
el/syscalls/accept4/Makefile
> -index 504042e11..94db06266 100644
> ---- a/testcases/kernel/syscalls/accept4/Makefile
> -+++ b/testcases/kernel/syscalls/accept4/Makefile
> -@@ -20,4 +20,8 @@ top_srcdir           ?=3D ../../../..
> -
> - include $(top_srcdir)/include/mk/testcases.mk
> -
> -+ifeq ($(LIBC),musl)
> -+FILTER_OUT_MAKE_TARGETS        :=3D accept4_01
> -+endif
> -+
> - include $(top_srcdir)/include/mk/generic_leaf_target.mk
>  diff --git a/testcases/kernel/syscalls/timer_create/Makefile b/testcases=
/kernel/syscalls/timer_create/Makefile
> -index 8de247075..eb240f432 100644
> +index ada241fe1..d454b01e7 100644
>  --- a/testcases/kernel/syscalls/timer_create/Makefile
>  +++ b/testcases/kernel/syscalls/timer_create/Makefile
> -@@ -20,6 +20,10 @@ top_srcdir          ?=3D ../../../..
> +@@ -5,6 +5,10 @@ top_srcdir            ?=3D ../../../..
>
>   include $(top_srcdir)/include/mk/testcases.mk
>
> @@ -40,5 +27,6 @@ index 8de247075..eb240f432 100644
>   CPPFLAGS              +=3D -D_GNU_SOURCE -I$(abs_srcdir)/../include
>
>   LDLIBS                        +=3D -lpthread -lrt
> ---
> -2.25.1
> +--
> +2.26.2
> +
> diff --git a/meta/recipes-extended/ltp/ltp/0001-build-Add-option-to-selec=
t-libc-implementation.patch b/meta/recipes-extended/ltp/ltp/0001-build-Add-=
option-to-select-libc-implementation.patch
> index b1a99959d3..29b2bf7e41 100644
> --- a/meta/recipes-extended/ltp/ltp/0001-build-Add-option-to-select-libc-=
implementation.patch
> +++ b/meta/recipes-extended/ltp/ltp/0001-build-Add-option-to-select-libc-=
implementation.patch
> @@ -1,15 +1,16 @@
> -From be453d1be826b862d47e08663fd69eea9dd62730 Mon Sep 17 00:00:00 2001
> +From 74958c3e341de713b596c8cfd35b2391d6c7bc09 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Thu, 7 Jan 2016 18:19:03 +0000
> -Subject: [PATCH 1/6] build: Add option to select libc implementation
> +Subject: [PATCH] build: Add option to select libc implementation
>
>  There are more than glibc for C library implementation available on
>  linux now a days, uclibc cloaked like glibc but musl e.g. is very
> -different and does not implement all GNU extentions
> +different and does not implement all GNU extensions.
>
>  Disable tests specifically not building _yet_ on musl based systems
>
> -Upstream-Status: Pending
> +Upstream-Status: Pending (pvorel: this is not going to be fixed, instead
> +each test needs to be fixed)
>
>  rt_tgsigqueueinfo fails with:
>  rt_tgsigqueueinfo01.c: In function 'sigusr1_handler':
> @@ -19,18 +20,17 @@ rt_tgsigqueueinfo01.c:42:22: error: 'siginfo_t' {aka =
'struct <anonymous>'} has n
>        |                      __si_fields
>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +[ pvorel: rebase for 20200515: enable pty, ioctl ]
>  [ pvorel: rebase for 20200120: enable mallopt, profil, rpc016,
>  rt_sigsuspend, sbrk_mutex, setdomainname, sethostname, sigsuspend,
>  testpi-3, testpi-5, testpi-6, ustat; move rt_tgsigqueueinfo
>  from 0006-rt_tgsigqueueinfo-disable-test-on-musl.patch ]
>  Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> -Signed-off-by: Petr Vorel <pvorel@suse.cz>
>  ---
>   Makefile                           | 5 +++++
> - testcases/kernel/Makefile          | 5 ++++-
>   testcases/kernel/sched/Makefile    | 4 +++-
>   testcases/kernel/syscalls/Makefile | 4 ++++
> - 4 files changed, 16 insertions(+), 2 deletions(-)
> + 3 files changed, 12 insertions(+), 1 deletion(-)
>
>  diff --git a/Makefile b/Makefile
>  index 768ca4606..e9d679a71 100644
> @@ -48,28 +48,6 @@ index 768ca4606..e9d679a71 100644
>   # CLEAN_TARGETS:      Targets which exist solely in clean.
>   # COMMON_TARGETS:     Targets which exist in all, clean, and install.
>   # INSTALL_TARGETS:    Targets which exist in clean and install (contain=
s
> -diff --git a/testcases/kernel/Makefile b/testcases/kernel/Makefile
> -index 3319b3163..94ea362c8 100644
> ---- a/testcases/kernel/Makefile
> -+++ b/testcases/kernel/Makefile
> -@@ -49,13 +49,16 @@ SUBDIRS                    +=3D connectors \
> -                          logging \
> -                          mem \
> -                          numa \
> --                         pty \
> -                          sched \
> -                          security \
> -                          sound \
> -                          tracing \
> -                          uevents \
> -
> -+ifneq ($(LIBC),musl)
> -+SUBDIRS                       +=3D pty
> -+endif
> -+
> - ifeq ($(WITH_POWER_MANAGEMENT_TESTSUITE),yes)
> - SUBDIRS                       +=3D power_management
> - endif
>  diff --git a/testcases/kernel/sched/Makefile b/testcases/kernel/sched/Ma=
kefile
>  index 6a57d79ee..74bb93370 100644
>  --- a/testcases/kernel/sched/Makefile
> @@ -84,19 +62,20 @@ index 6a57d79ee..74bb93370 100644
>  +endif
>   include $(top_srcdir)/include/mk/generic_trunk_target.mk
>  diff --git a/testcases/kernel/syscalls/Makefile b/testcases/kernel/sysca=
lls/Makefile
> -index 45a00cf7d..af5a591a0 100644
> +index c6dc8d9e7..aa50761ea 100644
>  --- a/testcases/kernel/syscalls/Makefile
>  +++ b/testcases/kernel/syscalls/Makefile
> -@@ -29,6 +29,10 @@ FILTER_OUT_DIRS     +=3D capget capset chmod chown cl=
one fork getcontext llseek \
> +@@ -15,6 +15,10 @@ FILTER_OUT_DIRS     +=3D capget capset chmod chown cl=
one fork getcontext llseek \
>                    mincore mprotect nftw profil remap_file_pages sbrk
>   endif
>
>  +ifeq ($(LIBC),musl)
> -+FILTER_OUT_DIRS       +=3D confstr fmtmsg getcontext ioctl rt_tgsigqueu=
einfo
> ++FILTER_OUT_DIRS       +=3D confstr fmtmsg getcontext rt_tgsigqueueinfo
>  +endif
>  +
>   ifeq ($(UCLIBC),1)
>   FILTER_OUT_DIRS       +=3D profil
>   endif
> ---
> -2.25.1
> +--
> +2.26.2
> +
> diff --git a/meta/recipes-extended/ltp/ltp/0001-syscalls-Check-for-time64=
-unsafe-syscalls-before-usi.patch b/meta/recipes-extended/ltp/ltp/0001-sysc=
alls-Check-for-time64-unsafe-syscalls-before-usi.patch
> deleted file mode 100644
> index ac8f08ef5a..0000000000
> --- a/meta/recipes-extended/ltp/ltp/0001-syscalls-Check-for-time64-unsafe=
-syscalls-before-usi.patch
> +++ /dev/null
> @@ -1,122 +0,0 @@
> -From 89c5841bd148a7ae70c65f4a1ca5996b7f0cddfa Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 19 Feb 2020 22:52:04 -0800
> -Subject: [PATCH] syscalls: Check for time64 unsafe syscalls before using=
 them
> -
> -musl is using 64bit time_t now on 32bit architectures and these syscalls
> -no longer exist, therefore its better to check for them being available
> -before using them
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Reviewed-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> -Reviewed-by: Petr Vorel <pvorel@suse.cz>
> -Signed-off-by: Petr Vorel <pvorel@suse.cz>
> -Upstream-Status: accepted as 5b57ae2913e2d2d167cbd3822784b4c4ba336812
> ----
> - lib/tst_clocks.c                                 | 16 ++++++----------
> - .../syscalls/gettimeofday/gettimeofday01.c       |  6 ++----
> - .../syscalls/gettimeofday/gettimeofday02.c       |  8 +++-----
> - 3 files changed, 11 insertions(+), 19 deletions(-)
> -
> -diff --git a/lib/tst_clocks.c b/lib/tst_clocks.c
> -index 5195da38f..fa2f1cb84 100644
> ---- a/lib/tst_clocks.c
> -+++ b/lib/tst_clocks.c
> -@@ -3,28 +3,24 @@
> -  * Copyright (c) 2017 Cyril Hrubis <chrubis@suse.cz>
> -  */
> -
> --/*
> -- * clock_gettime() and clock_getres() functions
> -- */
> --
> --#define _GNU_SOURCE
> --#include <unistd.h>
> - #include <time.h>
> --#include <sys/syscall.h>
> -
> -+#define TST_NO_DEFAULT_MAIN
> -+#include "tst_test.h"
> - #include "tst_clocks.h"
> -+#include "lapi/syscalls.h"
> -
> - int tst_clock_getres(clockid_t clk_id, struct timespec *res)
> - {
> --      return syscall(SYS_clock_getres, clk_id, res);
> -+      return tst_syscall(__NR_clock_getres, clk_id, res);
> - }
> -
> - int tst_clock_gettime(clockid_t clk_id, struct timespec *ts)
> - {
> --      return syscall(SYS_clock_gettime, clk_id, ts);
> -+      return tst_syscall(__NR_clock_gettime, clk_id, ts);
> - }
> -
> - int tst_clock_settime(clockid_t clk_id, struct timespec *ts)
> - {
> --      return syscall(SYS_clock_settime, clk_id, ts);
> -+      return tst_syscall(__NR_clock_settime, clk_id, ts);
> - }
> -diff --git a/testcases/kernel/syscalls/gettimeofday/gettimeofday01.c b/t=
estcases/kernel/syscalls/gettimeofday/gettimeofday01.c
> -index 583d8f7b9..08ea1673a 100644
> ---- a/testcases/kernel/syscalls/gettimeofday/gettimeofday01.c
> -+++ b/testcases/kernel/syscalls/gettimeofday/gettimeofday01.c
> -@@ -38,10 +38,8 @@
> - #include <sys/time.h>
> - #include <errno.h>
> - #include "test.h"
> --#include <sys/syscall.h>
> - #include <unistd.h>
> --
> --#define gettimeofday(a,b)  syscall(__NR_gettimeofday,a,b)
> -+#include "lapi/syscalls.h"
> -
> - char *TCID =3D "gettimeofday01";
> - int TST_TOTAL =3D 1;
> -@@ -63,7 +61,7 @@ int main(int ac, char **av)
> -       for (lc =3D 0; TEST_LOOPING(lc); lc++) {
> -               tst_count =3D 0;
> -
> --              TEST(gettimeofday((void *)-1, (void *)-1));
> -+              TEST(ltp_syscall(__NR_gettimeofday, (void *)-1, (void *)-=
1));
> -
> -               /* gettimeofday returns an int, so we need to turn the lo=
ng
> -                * TEST_RETURN into an int to test with */
> -diff --git a/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c b/t=
estcases/kernel/syscalls/gettimeofday/gettimeofday02.c
> -index 1d60f448e..5170ad2f7 100644
> ---- a/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c
> -+++ b/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c
> -@@ -16,14 +16,12 @@
> - #include <stdint.h>
> - #include <sys/time.h>
> - #include <stdlib.h>
> --#include <sys/syscall.h>
> - #include <unistd.h>
> - #include <time.h>
> - #include <errno.h>
> -
> - #include "tst_test.h"
> --
> --#define gettimeofday(a,b)  syscall(__NR_gettimeofday,a,b)
> -+#include "lapi/syscalls.h"
> -
> - static volatile sig_atomic_t done;
> - static char *str_rtime;
> -@@ -48,13 +46,13 @@ static void verify_gettimeofday(void)
> -
> -       alarm(rtime);
> -
> --      if (gettimeofday(&tv1, NULL)) {
> -+      if (tst_syscall(__NR_gettimeofday, &tv1, NULL)) {
> -               tst_res(TBROK | TERRNO, "gettimeofday() failed");
> -               return;
> -       }
> -
> -       while (!done) {
> --              if (gettimeofday(&tv2, NULL)) {
> -+              if (tst_syscall(__NR_gettimeofday, &tv2, NULL)) {
> -                       tst_res(TBROK | TERRNO, "gettimeofday() failed");
> -                       return;
> -               }
> ---
> -2.25.1
> diff --git a/meta/recipes-extended/ltp/ltp/0003-Check-if-__GLIBC_PREREQ-i=
s-defined-before-using-it.patch b/meta/recipes-extended/ltp/ltp/0003-Check-=
if-__GLIBC_PREREQ-is-defined-before-using-it.patch
> deleted file mode 100644
> index df3e8831f5..0000000000
> --- a/meta/recipes-extended/ltp/ltp/0003-Check-if-__GLIBC_PREREQ-is-defin=
ed-before-using-it.patch
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -From 1ce47a6ed811fd78ed04ea2f82e6321c6bca57b6 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Thu, 7 Jan 2016 19:40:08 +0000
> -Subject: [PATCH] Check if __GLIBC_PREREQ is defined before using it
> -
> -__GLIBC_PREREQ is specific to glibc so it should be checked if it is
> -defined or not.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> -
> ----
> - testcases/kernel/syscalls/accept4/accept4_01.c | 7 +++++++
> - 1 file changed, 7 insertions(+)
> -
> -diff --git a/testcases/kernel/syscalls/accept4/accept4_01.c b/testcases/=
kernel/syscalls/accept4/accept4_01.c
> -index 29e18f27d..07444a46f 100644
> ---- a/testcases/kernel/syscalls/accept4/accept4_01.c
> -+++ b/testcases/kernel/syscalls/accept4/accept4_01.c
> -@@ -38,6 +38,7 @@
> - static struct sockaddr_in *conn_addr, *accept_addr;
> - static int listening_fd;
> -
> -+#if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
> - #if !(__GLIBC_PREREQ(2, 10))
> - static int
> - accept4_01(int fd, struct sockaddr *sockaddr, socklen_t *addrlen, int f=
lags)
> -@@ -56,6 +57,7 @@ accept4_01(int fd, struct sockaddr *sockaddr, socklen_=
t *addrlen, int flags)
> - #endif
> - }
> - #endif
> -+#endif
> -
> - static int create_listening_socket(void)
> - {
> -@@ -114,12 +116,17 @@ static void verify_accept4(unsigned int nr)
> -       SAFE_CONNECT(connfd, (struct sockaddr *)conn_addr, sizeof(*conn_a=
ddr));
> -       addrlen =3D sizeof(*accept_addr);
> -
> -+#if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
> - #if !(__GLIBC_PREREQ(2, 10))
> -       TEST(accept4_01(listening_fd, (struct sockaddr *)accept_addr, &ad=
drlen,
> -                               tcase->cloexec | tcase->nonblock));
> - #else
> -       TEST(accept4(listening_fd, (struct sockaddr *)accept_addr, &addrl=
en,
> -                               tcase->cloexec | tcase->nonblock));
> -+#endif
> -+#else
> -+      TEST(accept4(listening_fd, (struct sockaddr *)&claddr, &addrlen,
> -+                              tcase->cloexec | tcase->nonblock));
> - #endif
> -       if (TST_RET =3D=3D -1) {
> -               if (TST_ERR =3D=3D ENOSYS)
> diff --git a/meta/recipes-extended/ltp/ltp/0004-guard-mallocopt-with-__GL=
IBC__.patch b/meta/recipes-extended/ltp/ltp/0004-guard-mallocopt-with-__GLI=
BC__.patch
> index 5622a64d43..e93886c9cd 100644
> --- a/meta/recipes-extended/ltp/ltp/0004-guard-mallocopt-with-__GLIBC__.p=
atch
> +++ b/meta/recipes-extended/ltp/ltp/0004-guard-mallocopt-with-__GLIBC__.p=
atch
> @@ -5,9 +5,9 @@ Subject: [PATCH] guard mallocopt() with __GLIBC__
>
>  mallocopt is not available on non glibc implementations
>
> -Upstream-Status: Pending
> -
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
> +[ Upstream-Status: accepted in 967612c454aea66770b64f69287671037fe895b3 =
]
>  ---
>   utils/benchmark/ebizzy-0.3/ebizzy.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> diff --git a/meta/recipes-extended/ltp/ltp/0008-testcases-network-nfsv4-a=
cl-acl1.c-Security-fix-on-s.patch b/meta/recipes-extended/ltp/ltp/0008-test=
cases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch
> deleted file mode 100644
> index 350091a70c..0000000000
> --- a/meta/recipes-extended/ltp/ltp/0008-testcases-network-nfsv4-acl-acl1=
.c-Security-fix-on-s.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -From 4b7db094d6fc5659001ae8dc17078bb65d46b9c9 Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?An=3DC3=3DADbal=3D20Lim=3DC3=3DB3n?=3D <anibal.limon@l=
inux.intel.com>
> -Date: Fri, 13 May 2016 11:11:28 -0500
> -Subject: [PATCH] acl: Security fix on string printf
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Fixes build error when compiled with -Werror=3Dformat-security:
> -
> -acl1.c: In function =E2=80=98test_acl_default=E2=80=99:
> -acl1.c:305:2: error: format not a string literal and no format arguments=
 [-Werror=3Dformat-security]
> -  305 |  printf(cmd);
> -
> -Patch taken from openembedded-core,
> -original bug report: https://bugzilla.yoctoproject.org/9548
> -
> -[YOCTO #9548]
> -
> -Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.com>
> -Signed-off-by: Petr Vorel <pvorel@suse.cz>
> -Upstream-Status: accepted in 4b7db094d6fc5659001ae8dc17078bb65d46b9c9
> ----
> - testcases/network/nfsv4/acl/acl1.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/testcases/network/nfsv4/acl/acl1.c b/testcases/network/nfsv=
4/acl/acl1.c
> -index aae9484e5..ad778cd33 100644
> ---- a/testcases/network/nfsv4/acl/acl1.c
> -+++ b/testcases/network/nfsv4/acl/acl1.c
> -@@ -302,7 +302,7 @@ void test_acl_default(char *dir, acl_t acl)
> -       char *cmd =3D malloc(256);
> -
> -       strcpy(cmd, "chmod 7777 ");
> --      printf(cmd);
> -+      printf(cmd, NULL);
> -       strcat(cmd, dir);
> -       system(cmd);
> -       acl2 =3D acl_get_file(path, ACL_TYPE_ACCESS);
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-extended/ltp/ltp_20200120.bb b/meta/recipes-ext=
ended/ltp/ltp_20200515.bb
> similarity index 93%
> rename from meta/recipes-extended/ltp/ltp_20200120.bb
> rename to meta/recipes-extended/ltp/ltp_20200515.bb
> index deac3917d7..37bad53766 100644
> --- a/meta/recipes-extended/ltp/ltp_20200120.bb
> +++ b/meta/recipes-extended/ltp/ltp_20200515.bb
> @@ -27,21 +27,18 @@ CFLAGS_append_x86-64 =3D " -fomit-frame-pointer"
>
>  CFLAGS_append_powerpc64 =3D " -D__SANE_USERSPACE_TYPES__"
>  CFLAGS_append_mipsarchn64 =3D " -D__SANE_USERSPACE_TYPES__"
> -SRCREV =3D "4079aaf264d0e9ead042b59d1c5f4e643620d0d5"
> +SRCREV =3D "0d79a93e6ca44d9bc95973faea6bcd7b0c6d1f43"
>
>  SRC_URI =3D "git://github.com/linux-test-project/ltp.git \
>             file://0001-build-Add-option-to-select-libc-implementation.pa=
tch \
> -           file://0003-Check-if-__GLIBC_PREREQ-is-defined-before-using-i=
t.patch \
>             file://0004-guard-mallocopt-with-__GLIBC__.patch \
>             file://0007-Fix-test_proc_kill-hanging.patch \
> -           file://0008-testcases-network-nfsv4-acl-acl1.c-Security-fix-o=
n-s.patch \
>             file://0001-Add-more-musl-exclusions.patch \
> -           file://0001-syscalls-Check-for-time64-unsafe-syscalls-before-=
usi.patch \
>             "
>
>  S =3D "${WORKDIR}/git"
>
> -inherit autotools-brokensep
> +inherit autotools-brokensep pkgconfig
>
>  TARGET_CC_ARCH +=3D "${LDFLAGS}"
>
> --
> 2.26.2
>
