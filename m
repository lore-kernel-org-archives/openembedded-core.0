Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AD05C433F5
	for <webhook@archiver.kernel.org>; Fri,  1 Oct 2021 02:22:58 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web12.2605.1633054977144017216
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Sep 2021 19:22:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Gsh5zz0Y;
 spf=pass (domain: gmail.com, ip: 209.85.160.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id r16so7628869qtw.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Sep 2021 19:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=YI81LMd3zCaaOoXBc8R9AqcMfoayQuwSbrVev9g674w=;
        b=Gsh5zz0Y3TA1cJFYQTmptnbtvGIxIGZYre/KeNgBunthO2sjhnD748a3ywsQLpv7Ed
         mfNtamdAfJNX1RERvhR/D9QgXd48tIL5MguDhk4dyRMFK8bNBWUeX5pDXZ9g3iIpVEkK
         1lWWq107DcFuQSdIOXzTkMdl36p7YToZqS4Sm91H6ZjTvCtQtl5Ub9OPwblRstgfNu9I
         ZREIsGYgmOl6TJauRQALMnFzVx7PRF4xdrDp6ENflG6K2jLqA7fMS91lyk9SdAK/XMp4
         LHFCHhMensr9+jOKbwtf+aNqj/P/NdUBObHHMSVa0KcB99haT1Q34BGzdXhihxr+o+dU
         cGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=YI81LMd3zCaaOoXBc8R9AqcMfoayQuwSbrVev9g674w=;
        b=QIsjBesfjLyZXeZdh7GxxxsG1df/yEcdkQ3+kZFx8GHm7yiBXtqtefi8xUuXhDj4WK
         niroPXv4OuT5YsgXdz7L+5Q5nHbs1ef/wYNhy+CawraZyXs+GmkU59Va6MZ0kGlVZ14W
         2Q2lL85dzqaz3tGVJU3ZSXmER+hQ6ZKZGnhVxKyB1T4GfMjaU1r/ONDWQmAf/v4dLsaJ
         a2x5FLIrYzg6zmXyHz2gmczLsUogiWXsDC6clyPeMB+BmxorguY6CYU2WCcEyh0J89+q
         8TgnL6zA8cVVpRnxARbQ+7m3AZL4zgvyEJhGEhBSJfYBNTadEgfQtpIrmy0k9dR9woQk
         aa2w==
X-Gm-Message-State: AOAM533Kk51AX+6RWd5yz4raQKRDHJJsMVkMw1BwI0MB/OlYGEm1MwyN
	hQQQCtSSI8BH0cFmwVb/Gyoez5XlalnPCp3aL2aB3gxgEnk=
X-Google-Smtp-Source: 
 ABdhPJwJVxF0sDbkdx8kYleTMhsuidIyemfIrLAi+BtgE4vkdo/TdyA9N3UOQ92WbyeWLCoX+c8EOTPHO9W4iZvVnas=
X-Received: by 2002:a05:622a:316:: with SMTP id
 q22mr2339825qtw.225.1633054971929;
 Thu, 30 Sep 2021 19:22:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210918181609.3695676-1-raj.khem@gmail.com>
In-Reply-To: <20210918181609.3695676-1-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 30 Sep 2021 19:22:25 -0700
Message-ID: 
 <CAMKF1spVPumMU_BUeNK0=Mi4cuRWcHDKBif3NiRwYea8+yhTmw@mail.gmail.com>
Subject: Re: [PATCH 1/2] libseccomp: Upgrade to 2.5.2 and beyond
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexandre BELLONI <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Oct 2021 02:22:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156510

Hi Alex

Please drop this from kirkstone-next, this is causing wield failures
on riscv64/systemd, totally unrelated but we need to debug them before
we can upgrade.

Thanks
-Khem

On Sat, Sep 18, 2021 at 11:16 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Forward port the rv32 port
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...rch-Add-riscv32-architecture-support.patch |  161 ++-
>  ...-the-syscall-defs-for-Linux-v5.14.3.patch} | 1011 ++++++++---------
>  ...e-the-syscall-defs-for-Linux-v5.14.x.patch |   40 +
>  .../0004-man-Add-RISCV64-to-arch-list.patch   |   28 +
>  ...ibseccomp_2.5.1.bb => libseccomp_2.5.2.bb} |    8 +-
>  5 files changed, 648 insertions(+), 600 deletions(-)
>  rename meta/recipes-support/libseccomp/files/{0002-Regenerate-syscall-cvs-file-from-5.13-rc5-kernel.patch => 0002-syscalls-update-the-syscall-defs-for-Linux-v5.14.3.patch} (66%)
>  create mode 100644 meta/recipes-support/libseccomp/files/0003-syscalls-update-the-syscall-defs-for-Linux-v5.14.x.patch
>  create mode 100644 meta/recipes-support/libseccomp/files/0004-man-Add-RISCV64-to-arch-list.patch
>  rename meta/recipes-support/libseccomp/{libseccomp_2.5.1.bb => libseccomp_2.5.2.bb} (86%)
>
> diff --git a/meta/recipes-support/libseccomp/files/0001-arch-Add-riscv32-architecture-support.patch b/meta/recipes-support/libseccomp/files/0001-arch-Add-riscv32-architecture-support.patch
> index 62bd61fb56..d78c87cab7 100644
> --- a/meta/recipes-support/libseccomp/files/0001-arch-Add-riscv32-architecture-support.patch
> +++ b/meta/recipes-support/libseccomp/files/0001-arch-Add-riscv32-architecture-support.patch
> @@ -1,18 +1,19 @@
> -From 6d127a0463ea2d7bb5021562678324e28e0407e5 Mon Sep 17 00:00:00 2001
> +From 90a0b5267eb7cee14b7a87b13b00bc35d79b3c4f Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Tue, 8 Jun 2021 19:45:34 -0700
> -Subject: [PATCH 1/2] arch: Add riscv32 architecture support
> +Subject: [PATCH 1/4] arch: Add riscv32 architecture support
>
>  Support for rv32 was upstreamed into 5.4+ kernel
>
>  Upstream-Status: Submitted [https://github.com/seccomp/libseccomp/pull/327]
> +
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
>   CREDITS                            |  1 +
>   README.md                          |  1 +
>   doc/man/man1/scmp_sys_resolver.1   |  2 +-
>   doc/man/man3/seccomp_arch_add.3    |  1 +
> - include/seccomp-syscalls.h         | 31 ++++++++++++++++++
> + include/seccomp-syscalls.h         | 32 +++++++++++++++++++
>   include/seccomp.h.in               |  9 ++++++
>   src/Makefile.am                    |  1 +
>   src/arch-riscv32.c                 | 31 ++++++++++++++++++
> @@ -24,7 +25,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   src/python/libseccomp.pxd          |  1 +
>   src/python/seccomp.pyx             |  2 ++
>   src/syscalls.c                     |  1 +
> - src/syscalls.csv                   |  2 +-
>   src/syscalls.h                     |  2 ++
>   src/system.c                       |  1 +
>   tests/15-basic-resolver.c          |  1 +
> @@ -40,12 +40,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   tools/scmp_bpf_sim.c               |  2 ++
>   tools/util.c                       |  6 +++-
>   tools/util.h                       |  7 ++++
> - 32 files changed, 208 insertions(+), 7 deletions(-)
> + 31 files changed, 208 insertions(+), 6 deletions(-)
>   create mode 100644 src/arch-riscv32.c
>   create mode 100644 src/arch-riscv32.h
>
>  diff --git a/CREDITS b/CREDITS
> -index d6bbc2a..ad2f7e0 100644
> +index b685712..c1ffdb3 100644
>  --- a/CREDITS
>  +++ b/CREDITS
>  @@ -33,6 +33,7 @@ John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> @@ -55,9 +55,9 @@ index d6bbc2a..ad2f7e0 100644
>  +Khem Raj <raj.khem@gmail.com>
>   Kyle R. Conway <kyle.r.conway@gmail.com>
>   Kenta Tada <Kenta.Tada@sony.com>
> - Luca Bruno <lucab@debian.org>
> + Kir Kolyshkin <kolyshkin@gmail.com>
>  diff --git a/README.md b/README.md
> -index ba02186..2cd718f 100644
> +index 579f226..8199a71 100644
>  --- a/README.md
>  +++ b/README.md
>  @@ -54,6 +54,7 @@ The libseccomp library currently supports the architectures listed below:
> @@ -67,7 +67,7 @@ index ba02186..2cd718f 100644
>  +* 32-bit RISC-V (riscv32)
>   * 32-bit SuperH big endian (sheb)
>   * 32-bit SuperH (sh)
> -
> +
>  diff --git a/doc/man/man1/scmp_sys_resolver.1 b/doc/man/man1/scmp_sys_resolver.1
>  index 267187b..fc68d18 100644
>  --- a/doc/man/man1/scmp_sys_resolver.1
> @@ -94,93 +94,94 @@ index 7baa21e..8966b3a 100644
>   .sp
>   .BI "uint32_t seccomp_arch_resolve_name(const char *" arch_name ");"
>  diff --git a/include/seccomp-syscalls.h b/include/seccomp-syscalls.h
> -index c694db1..c6ea5ca 100644
> +index 476f953..4ff814c 100644
>  --- a/include/seccomp-syscalls.h
>  +++ b/include/seccomp-syscalls.h
> -@@ -275,6 +275,13 @@
> - #define __PNR_ppoll                           -10241
> +@@ -276,6 +276,14 @@
>   #define __PNR_renameat                                -10242
>   #define __PNR_riscv_flush_icache              -10243
> -+#define __PNR_fstat                           -10244
> -+#define __PNR_futex                           -10245
> -+#define __PNR_nanosleep                               -10246
> -+#define __PNR_lseek                           -10247
> -+#define __PNR_clock_gettime                   -10248
> -+#define __PNR_clock_nanosleep                 -10249
> -+#define __PNR_gettimeofday                    -10250
> -
> + #define __PNR_memfd_secret                    -10244
> ++#define __PNR_fstat                           -10245
> ++#define __PNR_futex                           -10246
> ++#define __PNR_nanosleep                               -10247
> ++#define __PNR_lseek                           -10248
> ++#define __PNR_clock_gettime                   -10249
> ++#define __PNR_clock_nanosleep                 -10250
> ++#define __PNR_gettimeofday                    -10251
> ++#define __PNR_fcntl                           -10252
> +
>   /*
>    * libseccomp syscall definitions
> -@@ -442,7 +449,11 @@
> +@@ -443,7 +451,11 @@
>   #define __SNR_clock_getres_time64     __PNR_clock_getres_time64
>   #endif
> -
> +
>  +#ifdef __NR_clock_gettime
>   #define __SNR_clock_gettime           __NR_clock_gettime
>  +#else
>  +#define __SNR_clock_gettime           __PNR_clock_gettime
>  +#endif
> -
> +
>   #ifdef __NR_clock_gettime64
>   #define __SNR_clock_gettime64         __NR_clock_gettime64
> -@@ -450,7 +461,11 @@
> +@@ -451,7 +463,11 @@
>   #define __SNR_clock_gettime64         __PNR_clock_gettime64
>   #endif
> -
> +
>  +#ifdef __NR_clock_nanosleep
>   #define __SNR_clock_nanosleep         __NR_clock_nanosleep
>  +#else
>  +#define __SNR_clock_nanosleep         __PNR_clock_nanosleep
>  +#endif
> -
> +
>   #ifdef __NR_clock_nanosleep_time64
>   #define __SNR_clock_nanosleep_time64  __NR_clock_nanosleep_time64
> -@@ -710,7 +725,11 @@
> +@@ -713,7 +729,11 @@
>   #define __SNR_ftruncate64             __PNR_ftruncate64
>   #endif
> -
> +
>  +#ifdef __NR_futex
>   #define __SNR_futex                   __NR_futex
>  +#else
>  +#define __SNR_futex                   __PNR_futex
>  +#endif
> -
> +
>   #ifdef __NR_futex_time64
>   #define __SNR_futex_time64            __NR_futex_time64
> -@@ -896,7 +915,11 @@
> -
> +@@ -899,7 +919,11 @@
> +
>   #define __SNR_gettid                  __NR_gettid
> -
> +
>  +#ifdef __NR_gettimeofday
>   #define __SNR_gettimeofday            __NR_gettimeofday
>  +#else
>  +#define __SNR_gettimeofday            __PNR_gettimeofday
>  +#endif
> -
> +
>   #ifdef __NR_getuid
>   #define __SNR_getuid                  __NR_getuid
> -@@ -1046,7 +1069,11 @@
> -
> +@@ -1049,7 +1073,11 @@
> +
>   #define __SNR_lremovexattr            __NR_lremovexattr
> -
> +
>  +#ifdef __NR_lseek
>   #define __SNR_lseek                   __NR_lseek
>  +#else
>  +#define __SNR_lseek                   __PNR_lseek
>  +#endif
> -
> +
>   #define __SNR_lsetxattr                       __NR_lsetxattr
> -
> -@@ -1218,7 +1245,11 @@
> -
> +
> +@@ -1227,7 +1255,11 @@
> +
>   #define __SNR_name_to_handle_at                       __NR_name_to_handle_at
> -
> +
>  +#ifdef __NR_nanosleep
>   #define __SNR_nanosleep                       __NR_nanosleep
>  +#else
>  +#define __SNR_nanosleep                       __PNR_nanosleep
>  +#endif
> -
> +
>   #ifdef __NR_newfstatat
>   #define __SNR_newfstatat              __NR_newfstatat
>  diff --git a/include/seccomp.h.in b/include/seccomp.h.in
> @@ -201,14 +202,14 @@ index 333a89c..2e911db 100644
>  +
>   #define SCMP_ARCH_RISCV64     AUDIT_ARCH_RISCV64
>  +#define SCMP_ARCH_RISCV32     AUDIT_ARCH_RISCV32
> -
> +
>   /**
>    * The SuperH architecture tokens
>  diff --git a/src/Makefile.am b/src/Makefile.am
> -index 7b59810..7961925 100644
> +index 04e7ba5..a30bbc0 100644
>  --- a/src/Makefile.am
>  +++ b/src/Makefile.am
> -@@ -44,6 +44,7 @@ SOURCES_ALL = \
> +@@ -40,6 +40,7 @@ SOURCES_ALL = \
>         arch-ppc.h arch-ppc.c \
>         arch-ppc64.h arch-ppc64.c \
>         arch-riscv64.h arch-riscv64.c \
> @@ -218,7 +219,7 @@ index 7b59810..7961925 100644
>         arch-sh.h arch-sh.c \
>  diff --git a/src/arch-riscv32.c b/src/arch-riscv32.c
>  new file mode 100644
> -index 0000000..53b3126
> +index 0000000..10418f4
>  --- /dev/null
>  +++ b/src/arch-riscv32.c
>  @@ -0,0 +1,31 @@
> @@ -248,8 +249,8 @@ index 0000000..53b3126
>  +      .token_bpf = AUDIT_ARCH_RISCV32,
>  +      .size = ARCH_SIZE_32,
>  +      .endian = ARCH_ENDIAN_LITTLE,
> -+      .syscall_resolve_name = riscv32_syscall_resolve_name,
> -+      .syscall_resolve_num = riscv32_syscall_resolve_num,
> ++      .syscall_resolve_name_raw = riscv32_syscall_resolve_name,
> ++      .syscall_resolve_num_raw = riscv32_syscall_resolve_num,
>  +      .syscall_rewrite = NULL,
>  +      .rule_add = NULL,
>  +};
> @@ -310,7 +311,7 @@ index 68bebef..85c7f3d 100755
>  @@ -519,6 +519,49 @@ function dump_lib_riscv64() {
>         dump_lib_arch riscv64 | mangle_lib_syscall riscv64
>   }
> -
> +
>  +#
>  +# Dump the riscv32 system syscall table
>  +#
> @@ -385,9 +386,9 @@ index 68bebef..85c7f3d 100755
>  +      abi_list+=" riscv32 riscv64"
>         abi_list+=" s390 s390x"
>         abi_list+=" sh"
> -
> +
>  diff --git a/src/arch.c b/src/arch.c
> -index 6ab922f..acf80af 100644
> +index 921e455..07935a9 100644
>  --- a/src/arch.c
>  +++ b/src/arch.c
>  @@ -43,6 +43,7 @@
> @@ -453,10 +454,10 @@ index 0629bf1..000d503 100644
>           SCMP_ARCH_S390X
>  +        SCMP_ARCH_RISCV32
>           SCMP_ARCH_RISCV64
> -
> +
>       cdef enum scmp_filter_attr:
>  diff --git a/src/python/seccomp.pyx b/src/python/seccomp.pyx
> -index 1a9eb24..c94ad1d 100644
> +index 2eeabc1..2895d78 100644
>  --- a/src/python/seccomp.pyx
>  +++ b/src/python/seccomp.pyx
>  @@ -214,6 +214,7 @@ cdef class Arch:
> @@ -466,36 +467,29 @@ index 1a9eb24..c94ad1d 100644
>  +    RISCV32 - 32-bit RISC-V
>       RISCV64 - 64-bit RISC-V
>       """
> -
> +
>  @@ -238,6 +239,7 @@ cdef class Arch:
>       PPC64LE = libseccomp.SCMP_ARCH_PPC64LE
>       S390 = libseccomp.SCMP_ARCH_S390
>       S390X = libseccomp.SCMP_ARCH_S390X
>  +    RISCV32 = libseccomp.SCMP_ARCH_RISCV32
>       RISCV64 = libseccomp.SCMP_ARCH_RISCV64
> -
> +
>       def __cinit__(self, arch=libseccomp.SCMP_ARCH_NATIVE):
>  diff --git a/src/syscalls.c b/src/syscalls.c
> -index ddb84fa..34e08d9 100644
> +index faddff0..15952ce 100644
>  --- a/src/syscalls.c
>  +++ b/src/syscalls.c
> -@@ -55,3 +55,4 @@ ARCH_DEF(sh)
> +@@ -59,6 +59,7 @@ ARCH_DEF(sh)
>   ARCH_DEF(x32)
>   ARCH_DEF(x86)
>   ARCH_DEF(riscv64)
>  +ARCH_DEF(riscv32)
> -diff --git a/src/syscalls.csv b/src/syscalls.csv
> -index fbd1058..0ee6c15 100644
> ---- a/src/syscalls.csv
> -+++ b/src/syscalls.csv
> -@@ -1,4 +1,4 @@
> --#syscall (v5.12.0-rc7 2021-04-17),x86,x86_64,x32,arm,aarch64,mips,mips64,mips64n32,parisc,parisc64,ppc,ppc64,riscv64,s390,s390x,sh
> -+#syscall (v5.12.0-rc7 2021-04-17),x86,x86_64,x32,arm,aarch64,mips,mips64,mips64n32,parisc,parisc64,ppc,ppc64,riscv32,riscv64,s390,s390x,sh
> - accept,PNR,43,43,285,202,168,42,42,35,35,330,330,202,PNR,PNR,344
> - accept4,364,288,288,366,242,334,293,297,320,320,344,344,242,364,364,358
> - access,33,21,21,33,PNR,33,20,20,33,33,33,33,PNR,33,33,33
> +
> + /**
> +  * Resolve a syscall name to a number
>  diff --git a/src/syscalls.h b/src/syscalls.h
> -index 4f959af..49887ba 100644
> +index 58a788c..c6b5db5 100644
>  --- a/src/syscalls.h
>  +++ b/src/syscalls.h
>  @@ -28,6 +28,7 @@
> @@ -503,7 +497,7 @@ index 4f959af..49887ba 100644
>   #include "arch-x86.h"
>   #include "arch-riscv64.h"
>  +#include "arch-riscv32.h"
> -
> +
>   /* NOTE: changes to the arch_syscall_table layout may require changes to the
>    *       generate_syscalls_perf.sh and arch-syscall-validate scripts */
>  @@ -49,6 +50,7 @@ struct arch_syscall_table {
> @@ -527,7 +521,7 @@ index ae445bf..063e6be 100644
>                 break;
>         default:
>  diff --git a/tests/15-basic-resolver.c b/tests/15-basic-resolver.c
> -index 2679270..57092f3 100644
> +index c759dd1..fd94dbf 100644
>  --- a/tests/15-basic-resolver.c
>  +++ b/tests/15-basic-resolver.c
>  @@ -45,6 +45,7 @@ unsigned int arch_list[] = {
> @@ -536,8 +530,8 @@ index 2679270..57092f3 100644
>         SCMP_ARCH_PARISC64,
>  +      SCMP_ARCH_RISCV32,
>         SCMP_ARCH_RISCV64,
> +       SCMP_ARCH_SH,
>         -1
> - };
>  diff --git a/tests/16-sim-arch_basic.c b/tests/16-sim-arch_basic.c
>  index 4fcbb5c..662e081 100644
>  --- a/tests/16-sim-arch_basic.c
> @@ -587,7 +581,7 @@ index 08f030c..ec73224 100644
>  +      rc = seccomp_arch_add(ctx, seccomp_arch_resolve_name("riscv32"));
>         if (rc != 0)
>                 goto out;
> -
> +
>  diff --git a/tests/23-sim-arch_all_le_basic.py b/tests/23-sim-arch_all_le_basic.py
>  index 12bb243..1eebc20 100755
>  --- a/tests/23-sim-arch_all_le_basic.py
> @@ -622,10 +616,10 @@ index 77a5b89..2e860bf 100755
>                "ppc64le",
>  +             "riscv32",
>                "riscv64"]
> -
> +
>   def test_arch(arch, init):
>  diff --git a/tests/regression b/tests/regression
> -index 53dab75..2869629 100755
> +index d28b848..057ff67 100755
>  --- a/tests/regression
>  +++ b/tests/regression
>  @@ -26,7 +26,7 @@ GLBL_ARCH_LE_SUPPORT=" \
> @@ -644,9 +638,9 @@ index 53dab75..2869629 100755
>  +      riscv32 \
>         s390 \
>         sheb sh"
> -
> -@@ -785,7 +786,7 @@ function run_test_live() {
> -
> +
> +@@ -801,7 +802,7 @@ function run_test_live() {
> +
>         # setup the arch specific return values
>         case "$arch" in
>  -      x86|x86_64|x32|arm|aarch64|parisc|parisc64|ppc|ppc64|ppc64le|ppc|s390|s390x|riscv64|sh|sheb)
> @@ -669,10 +663,10 @@ index b6bd2bb..7789970 100644
>                         printf("unknown\n");
>                 }
>  diff --git a/tools/scmp_bpf_disasm.c b/tools/scmp_bpf_disasm.c
> -index b95cdeb..49a89c7 100644
> +index b682de7..4f759fc 100644
>  --- a/tools/scmp_bpf_disasm.c
>  +++ b/tools/scmp_bpf_disasm.c
> -@@ -510,6 +510,8 @@ int main(int argc, char *argv[])
> +@@ -508,6 +508,8 @@ int main(int argc, char *argv[])
>                                 arch = AUDIT_ARCH_S390X;
>                         else if (strcmp(optarg, "riscv64") == 0)
>                                 arch = AUDIT_ARCH_RISCV64;
> @@ -719,7 +713,7 @@ index 6c2ca33..4d16e38 100644
>  @@ -79,6 +79,13 @@
>   #define AUDIT_ARCH_RISCV64    (EM_RISCV|__AUDIT_ARCH_64BIT|__AUDIT_ARCH_LE)
>   #endif /* AUDIT_ARCH_RISCV64 */
> -
> +
>  +#ifndef AUDIT_ARCH_RISCV32
>  +#ifndef EM_RISCV
>  +#define EM_RISCV              243
> @@ -728,7 +722,8 @@ index 6c2ca33..4d16e38 100644
>  +#endif /* AUDIT_ARCH_RISCV32 */
>  +
>   extern uint32_t arch;
> -
> +
>   uint16_t ttoh16(uint32_t arch, uint16_t val);
> ---
> -2.32.0
> +--
> +2.33.0
> +
> diff --git a/meta/recipes-support/libseccomp/files/0002-Regenerate-syscall-cvs-file-from-5.13-rc5-kernel.patch b/meta/recipes-support/libseccomp/files/0002-syscalls-update-the-syscall-defs-for-Linux-v5.14.3.patch
> similarity index 66%
> rename from meta/recipes-support/libseccomp/files/0002-Regenerate-syscall-cvs-file-from-5.13-rc5-kernel.patch
> rename to meta/recipes-support/libseccomp/files/0002-syscalls-update-the-syscall-defs-for-Linux-v5.14.3.patch
> index 7ca861a7b2..f3e66c21bc 100644
> --- a/meta/recipes-support/libseccomp/files/0002-Regenerate-syscall-cvs-file-from-5.13-rc5-kernel.patch
> +++ b/meta/recipes-support/libseccomp/files/0002-syscalls-update-the-syscall-defs-for-Linux-v5.14.3.patch
> @@ -1,46 +1,22 @@
> -From ee4aba3f59b4bf52a74cb3917e64c704250de8ef Mon Sep 17 00:00:00 2001
> +From 24c03e71c43688830db3f28625c00e45fb36addc Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 8 Jun 2021 20:42:19 -0700
> -Subject: [PATCH 2/2] Regenerate syscall cvs file from 5.13-rc5 kernel
> +Date: Thu, 16 Sep 2021 20:48:05 -0700
> +Subject: [PATCH 2/4] syscalls: update the syscall defs for Linux v5.14.3
>
> +Include RISCV32 arch as well
>  Upstream-Status: Submitted [https://github.com/seccomp/libseccomp/pull/327]
> +
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
> - include/seccomp-syscalls.h |   7 +
> - src/syscalls.csv           | 952 +++++++++++++++++++------------------
> - 2 files changed, 485 insertions(+), 474 deletions(-)
> -
> -diff --git a/include/seccomp-syscalls.h b/include/seccomp-syscalls.h
> -index c6ea5ca..b7651bf 100644
> ---- a/include/seccomp-syscalls.h
> -+++ b/include/seccomp-syscalls.h
> -@@ -282,6 +282,7 @@
> - #define __PNR_clock_gettime                   -10248
> - #define __PNR_clock_nanosleep                 -10249
> - #define __PNR_gettimeofday                    -10250
> -+#define __PNR_quotactl_path                   -10251
> + src/syscalls.csv | 958 +++++++++++++++++++++++------------------------
> + 1 file changed, 479 insertions(+), 479 deletions(-)
>
> - /*
> -  * libseccomp syscall definitions
> -@@ -1547,6 +1548,12 @@
> - #define __SNR_riscv_flush_icache      __PNR_riscv_flush_icache
> - #endif
> -
> -+#ifdef __NR_quotactl_path
> -+#define __SNR_quotactl_path       __NR_quotactl_path
> -+#else
> -+#define __SNR_quotactl_path       __PNR_quotactl_path
> -+#endif
> -+
> - #ifdef __NR_rmdir
> - #define __SNR_rmdir                   __NR_rmdir
> - #else
>  diff --git a/src/syscalls.csv b/src/syscalls.csv
> -index 0ee6c15..eec8d21 100644
> +index 5bd0c9f..0613424 100644
>  --- a/src/syscalls.csv
>  +++ b/src/syscalls.csv
> -@@ -1,474 +1,478 @@
> --#syscall (v5.12.0-rc7 2021-04-17),x86,x86_64,x32,arm,aarch64,mips,mips64,mips64n32,parisc,parisc64,ppc,ppc64,riscv32,riscv64,s390,s390x,sh
> +@@ -1,479 +1,479 @@
> +-#syscall (v5.14.0-rc7 2021-08-23),x86,x86_64,x32,arm,aarch64,mips,mips64,mips64n32,parisc,parisc64,ppc,ppc64,riscv64,s390,s390x,sh
>  -accept,PNR,43,43,285,202,168,42,42,35,35,330,330,202,PNR,PNR,344
>  -accept4,364,288,288,366,242,334,293,297,320,320,344,344,242,364,364,358
>  -access,33,21,21,33,PNR,33,20,20,33,33,33,33,PNR,33,33,33
> @@ -210,6 +186,9 @@ index 0ee6c15..eec8d21 100644
>  -kexec_load,283,246,528,347,104,311,270,274,300,300,268,268,104,277,277,283
>  -keyctl,288,250,250,311,219,282,241,245,266,266,271,271,219,280,280,287
>  -kill,37,62,62,37,129,37,60,60,37,37,37,37,129,37,37,37
> +-landlock_add_rule,445,445,445,445,445,445,445,445,445,445,445,445,445,445,445,445
> +-landlock_create_ruleset,444,444,444,444,444,444,444,444,444,444,444,444,444,444,444,444
> +-landlock_restrict_self,446,446,446,446,446,446,446,446,446,446,446,446,446,446,446,446
>  -lchown,16,94,94,16,PNR,16,92,92,16,16,16,16,PNR,16,198,16
>  -lchown32,198,PNR,PNR,198,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,198,PNR,198
>  -lgetxattr,230,192,192,230,9,228,184,184,242,242,213,213,9,228,228,230
> @@ -230,6 +209,7 @@ index 0ee6c15..eec8d21 100644
>  -mbind,274,237,237,319,235,268,227,231,260,260,259,259,235,268,268,274
>  -membarrier,375,324,324,389,283,358,318,322,343,343,365,365,283,356,356,378
>  -memfd_create,356,319,319,385,279,354,314,318,340,340,360,360,279,350,350,374
> +-memfd_secret,447,447,447,PNR,447,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR
>  -migrate_pages,294,256,256,400,238,287,246,250,272,272,258,258,238,287,287,294
>  -mincore,218,27,27,219,232,217,26,26,72,72,206,206,232,218,218,218
>  -mkdir,39,83,83,39,PNR,39,81,81,39,39,39,39,PNR,39,39,39
> @@ -319,6 +299,7 @@ index 0ee6c15..eec8d21 100644
>  -pwritev2,379,328,547,393,287,362,322,326,348,348,381,381,287,377,377,382
>  -query_module,167,178,PNR,PNR,PNR,187,171,171,PNR,PNR,166,166,PNR,167,167,PNR
>  -quotactl,131,179,179,131,60,131,172,172,131,131,131,131,60,131,131,131
> +-quotactl_fd,443,443,443,443,443,443,443,443,443,443,443,443,443,443,443,443
>  -read,3,0,0,3,63,3,0,0,3,3,3,3,63,3,3,3
>  -readahead,225,187,187,225,213,223,179,179,207,207,191,191,213,222,222,225
>  -readdir,89,PNR,PNR,PNR,PNR,89,PNR,PNR,PNR,PNR,89,89,PNR,89,89,89
> @@ -514,483 +495,485 @@ index 0ee6c15..eec8d21 100644
>  -waitpid,7,PNR,PNR,PNR,PNR,7,PNR,PNR,7,7,7,7,PNR,PNR,PNR,7
>  -write,4,1,1,4,64,4,1,1,4,4,4,4,64,4,4,4
>  -writev,146,20,516,146,66,146,19,19,146,146,146,146,66,146,146,146
> -+#syscall (v5.13.0-rc5 2021-06-09),x86,x86_64,x32,arm,aarch64,mips,mips64,mips64n32,parisc,parisc64,ppc,ppc64,riscv32,riscv64,s390,s390x,sh
> -+accept,PNR,43,43,285,202,168,42,42,35,35,330,330,202,202,PNR,PNR,344
> -+accept4,364,288,288,366,242,334,293,297,320,320,344,344,242,242,364,364,358
> -+access,33,21,21,33,PNR,33,20,20,33,33,33,33,PNR,PNR,33,33,33
> -+acct,51,163,163,51,89,51,158,158,51,51,51,51,89,89,51,51,51
> -+add_key,286,248,248,309,217,280,239,243,264,264,269,269,217,217,278,278,285
> -+adjtimex,124,159,159,124,171,124,154,154,124,124,124,124,171,171,124,124,124
> -+afs_syscall,137,183,183,PNR,PNR,137,176,176,PNR,PNR,137,137,PNR,PNR,137,137,PNR
> -+alarm,27,37,37,PNR,PNR,27,37,37,27,27,27,27,PNR,PNR,27,27,27
> -+arch_prctl,384,158,158,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR
> -+arm_fadvise64_64,PNR,PNR,PNR,270,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR
> -+arm_sync_file_range,PNR,PNR,PNR,341,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR
> -+bdflush,134,PNR,PNR,134,PNR,134,PNR,PNR,134,134,134,134,PNR,PNR,134,134,134
> -+bind,361,49,49,282,200,169,48,48,22,22,327,327,200,200,361,361,341
> -+bpf,357,321,321,386,280,355,315,319,341,341,361,361,280,280,351,351,375
> -+break,17,PNR,PNR,PNR,PNR,17,PNR,PNR,PNR,PNR,17,17,PNR,PNR,PNR,PNR,PNR
> -+breakpoint,PNR,PNR,PNR,983041,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR
> -+brk,45,12,12,45,214,45,12,12,45,45,45,45,214,214,45,45,45
> -+cachectl,PNR,PNR,PNR,PNR,PNR,148,198,198,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR
> -+cacheflush,PNR,PNR,PNR,983042,PNR,147,197,197,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,123
> -+capget,184,125,125,184,90,204,123,123,106,106,183,183,90,90,184,184,184
> -+capset,185,126,126,185,91,205,124,124,107,107,184,184,91,91,185,185,185
> -+chdir,12,80,80,12,49,12,78,78,12,12,12,12,49,49,12,12,12
> -+chmod,15,90,90,15,PNR,15,88,88,15,15,15,15,PNR,PNR,15,15,15
> -+chown,182,92,92,182,PNR,202,90,90,180,180,181,181,PNR,PNR,182,212,182
> -+chown32,212,PNR,PNR,212,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,212,PNR,212
> -+chroot,61,161,161,61,51,61,156,156,61,61,61,61,51,51,61,61,61
> -+clock_adjtime,343,305,305,372,266,341,300,305,324,324,347,347,266,266,337,337,361
> -+clock_adjtime64,405,PNR,PNR,405,PNR,405,PNR,405,405,PNR,405,PNR,PNR,PNR,405,PNR,405
> -+clock_getres,266,229,229,264,114,264,223,227,257,257,247,247,114,114,261,261,266
> -+clock_getres_time64,406,PNR,PNR,406,PNR,406,PNR,406,406,PNR,406,PNR,PNR,PNR,406,PNR,406
> -+clock_gettime,265,228,228,263,113,263,222,226,256,256,246,246,113,113,260,260,265
> -+clock_gettime64,403,PNR,PNR,403,PNR,403,PNR,403,403,PNR,403,PNR,PNR,PNR,403,PNR,403
> -+clock_nanosleep,267,230,230,265,115,265,224,228,258,258,248,248,115,115,262,262,267
> -+clock_nanosleep_time64,407,PNR,PNR,407,PNR,407,PNR,407,407,PNR,407,PNR,PNR,PNR,407,PNR,407
> -+clock_settime,264,227,227,262,112,262,221,225,255,255,245,245,112,112,259,259,264
> -+clock_settime64,404,PNR,PNR,404,PNR,404,PNR,404,404,PNR,404,PNR,PNR,PNR,404,PNR,404
> -+clone,120,56,56,120,220,120,55,55,120,120,120,120,220,220,120,120,120
> -+clone3,435,435,435,435,435,435,435,435,435,435,435,435,435,435,435,435,PNR
> -+close,6,3,3,6,57,6,3,3,6,6,6,6,57,57,6,6,6
> -+close_range,436,436,436,436,436,436,436,436,436,436,436,436,436,436,436,436,436
> -+connect,362,42,42,283,203,170,41,41,31,31,328,328,203,203,362,362,342
> -+copy_file_range,377,326,326,391,285,360,320,324,346,346,379,379,285,285,375,375,380
> -+creat,8,85,85,8,PNR,8,83,83,8,8,8,8,PNR,PNR,8,8,8
> -+create_module,127,174,PNR,PNR,PNR,127,167,167,PNR,PNR,127,127,PNR,PNR,127,127,PNR
> -+delete_module,129,176,176,129,106,129,169,169,129,129,129,129,106,106,129,129,129
> -+dup,41,32,32,41,23,41,31,31,41,41,41,41,23,23,41,41,41
> -+dup2,63,33,33,63,PNR,63,32,32,63,63,63,63,PNR,PNR,63,63,63
> -+dup3,330,292,292,358,24,327,286,290,312,312,316,316,24,24,326,326,330
> -+epoll_create,254,213,213,250,PNR,248,207,207,224,224,236,236,PNR,PNR,249,249,254
> -+epoll_create1,329,291,291,357,20,326,285,289,311,311,315,315,20,20,327,327,329
> -+epoll_ctl,255,233,233,251,21,249,208,208,225,225,237,237,21,21,250,250,255
> -+epoll_ctl_old,PNR,214,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR
> -+epoll_pwait,319,281,281,346,22,313,272,276,297,297,303,303,22,22,312,312,319
> -+epoll_pwait2,441,441,441,441,441,441,441,441,441,441,441,441,441,441,441,441,441
> -+epoll_wait,256,232,232,252,PNR,250,209,209,226,226,238,238,PNR,PNR,251,251,256
> -+epoll_wait_old,PNR,215,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR
> -+eventfd,323,284,284,351,PNR,319,278,282,304,304,307,307,PNR,PNR,318,318,323
> -+eventfd2,328,290,290,356,19,325,284,288,310,310,314,314,19,19,323,323,328
> -+execve,11,59,520,11,221,11,57,57,11,11,11,11,221,221,11,11,11
> -+execveat,358,322,545,387,281,356,316,320,342,342,362,362,281,281,354,354,376
> -+exit,1,60,60,1,93,1,58,58,1,1,1,1,93,93,1,1,1
> -+exit_group,252,231,231,248,94,246,205,205,222,222,234,234,94,94,248,248,252
> -+faccessat,307,269,269,334,48,300,259,263,287,287,298,298,48,48,300,300,307
> -+faccessat2,439,439,439,439,439,439,439,439,439,439,439,439,439,439,439,439,439
> -+fadvise64,250,221,221,PNR,223,254,215,216,PNR,PNR,233,233,223,223,253,253,250
> -+fadvise64_64,272,PNR,PNR,PNR,PNR,PNR,PNR,PNR,236,236,254,PNR,PNR,PNR,264,PNR,272
> -+fallocate,324,285,285,352,47,320,279,283,305,305,309,309,47,47,314,314,324
> -+fanotify_init,338,300,300,367,262,336,295,300,322,322,323,323,262,262,332,332,337
> -+fanotify_mark,339,301,301,368,263,337,296,301,323,323,324,324,263,263,333,333,338
> -+fchdir,133,81,81,133,50,133,79,79,133,133,133,133,50,50,133,133,133
> -+fchmod,94,91,91,94,52,94,89,89,94,94,94,94,52,52,94,94,94
> -+fchmodat,306,268,268,333,53,299,258,262,286,286,297,297,53,53,299,299,306
> -+fchown,95,93,93,95,55,95,91,91,95,95,95,95,55,55,95,207,95
> -+fchown32,207,PNR,PNR,207,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,207,PNR,207
> -+fchownat,298,260,260,325,54,291,250,254,278,278,289,289,54,54,291,291,298
> -+fcntl,55,72,72,55,25,55,70,70,55,55,55,55,25,25,55,55,55
> -+fcntl64,221,PNR,PNR,221,PNR,220,PNR,212,202,202,204,PNR,PNR,PNR,221,PNR,221
> -+fdatasync,148,75,75,148,83,152,73,73,148,148,148,148,83,83,148,148,148
> -+fgetxattr,231,193,193,231,10,229,185,185,243,243,214,214,10,10,229,229,231
> -+finit_module,350,313,313,379,273,348,307,312,333,333,353,353,273,273,344,344,368
> -+flistxattr,234,196,196,234,13,232,188,188,246,246,217,217,13,13,232,232,234
> -+flock,143,73,73,143,32,143,71,71,143,143,143,143,32,32,143,143,143
> -+fork,2,57,57,2,PNR,2,56,56,2,2,2,2,PNR,PNR,2,2,2
> -+fremovexattr,237,199,199,237,16,235,191,191,249,249,220,220,16,16,235,235,237
> -+fsconfig,431,431,431,431,431,431,431,431,431,431,431,431,431,431,431,431,431
> -+fsetxattr,228,190,190,228,7,226,182,182,240,240,211,211,7,7,226,226,228
> -+fsmount,432,432,432,432,432,432,432,432,432,432,432,432,432,432,432,432,432
> -+fsopen,430,430,430,430,430,430,430,430,430,430,430,430,430,430,430,430,430
> -+fspick,433,433,433,433,433,433,433,433,433,433,433,433,433,433,433,433,433
> -+fstat,108,5,5,108,80,108,5,5,28,28,108,108,80,80,108,108,108
> -+fstat64,197,PNR,PNR,197,PNR,215,PNR,PNR,112,112,197,PNR,PNR,PNR,197,PNR,197
> -+fstatat64,300,PNR,PNR,327,PNR,293,PNR,PNR,280,280,291,PNR,PNR,PNR,293,PNR,300
> -+fstatfs,100,138,138,100,44,100,135,135,100,100,100,100,44,44,100,100,100
> -+fstatfs64,269,PNR,PNR,267,PNR,256,PNR,218,299,299,253,253,PNR,PNR,266,266,269
> -+fsync,118,74,74,118,82,118,72,72,118,118,118,118,82,82,118,118,118
> -+ftime,35,PNR,PNR,PNR,PNR,35,PNR,PNR,PNR,PNR,35,35,PNR,PNR,PNR,PNR,PNR
> -+ftruncate,93,77,77,93,46,93,75,75,93,93,93,93,46,46,93,93,93
> -+ftruncate64,194,PNR,PNR,194,PNR,212,PNR,PNR,200,200,194,PNR,PNR,PNR,194,PNR,194
> -+futex,240,202,202,240,98,238,194,194,210,210,221,221,98,98,238,238,240
> -+futex_time64,422,PNR,PNR,422,PNR,422,PNR,422,422,PNR,422,PNR,PNR,PNR,422,PNR,422
> -+futimesat,299,261,261,326,PNR,292,251,255,279,279,290,290,PNR,PNR,292,292,299
> -+getcpu,318,309,309,345,168,312,271,275,296,296,302,302,168,168,311,311,318
> -+getcwd,183,79,79,183,17,203,77,77,110,110,182,182,17,17,183,183,183
> -+getdents,141,78,78,141,PNR,141,76,76,141,141,141,141,PNR,PNR,141,141,141
> -+getdents64,220,217,217,217,61,219,308,299,201,201,202,202,61,61,220,220,220
> -+getegid,50,108,108,50,177,50,106,106,50,50,50,50,177,177,50,202,50
> -+getegid32,202,PNR,PNR,202,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,202,PNR,202
> -+geteuid,49,107,107,49,175,49,105,105,49,49,49,49,175,175,49,201,49
> -+geteuid32,201,PNR,PNR,201,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,201,PNR,201
> -+getgid,47,104,104,47,176,47,102,102,47,47,47,47,176,176,47,200,47
> -+getgid32,200,PNR,PNR,200,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,200,PNR,200
> -+getgroups,80,115,115,80,158,80,113,113,80,80,80,80,158,158,80,205,80
> -+getgroups32,205,PNR,PNR,205,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,205,PNR,205
> -+getitimer,105,36,36,105,102,105,35,35,105,105,105,105,102,102,105,105,105
> -+get_kernel_syms,130,177,PNR,PNR,PNR,130,170,170,PNR,PNR,130,130,PNR,PNR,130,130,PNR
> -+get_mempolicy,275,239,239,320,236,269,228,232,261,261,260,260,236,236,269,269,275
> -+getpeername,368,52,52,287,205,171,51,51,53,53,332,332,205,205,368,368,346
> -+getpgid,132,121,121,132,155,132,119,119,132,132,132,132,155,155,132,132,132
> -+getpgrp,65,111,111,65,PNR,65,109,109,65,65,65,65,PNR,PNR,65,65,65
> -+getpid,20,39,39,20,172,20,38,38,20,20,20,20,172,172,20,20,20
> -+getpmsg,188,181,181,PNR,PNR,208,174,174,PNR,PNR,187,187,PNR,PNR,188,188,PNR
> -+getppid,64,110,110,64,173,64,108,108,64,64,64,64,173,173,64,64,64
> -+getpriority,96,140,140,96,141,96,137,137,96,96,96,96,141,141,96,96,96
> -+getrandom,355,318,318,384,278,353,313,317,339,339,359,359,278,278,349,349,373
> -+getresgid,171,120,120,171,150,191,118,118,171,171,170,170,150,150,171,211,171
> -+getresgid32,211,PNR,PNR,211,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,211,PNR,211
> -+getresuid,165,118,118,165,148,186,116,116,165,165,165,165,148,148,165,209,165
> -+getresuid32,209,PNR,PNR,209,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,209,PNR,209
> -+getrlimit,76,97,97,PNR,163,76,95,95,76,76,76,76,163,163,76,191,76
> -+get_robust_list,312,274,531,339,100,310,269,273,290,290,299,299,100,100,305,305,312
> -+getrusage,77,98,98,77,165,77,96,96,77,77,77,77,165,165,77,77,77
> -+getsid,147,124,124,147,156,151,122,122,147,147,147,147,156,156,147,147,147
> -+getsockname,367,51,51,286,204,172,50,50,44,44,331,331,204,204,367,367,345
> -+getsockopt,365,55,542,295,209,173,54,54,182,182,340,340,209,209,365,365,354
> -+get_thread_area,244,211,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR
> -+gettid,224,186,186,224,178,222,178,178,206,206,207,207,178,178,236,236,224
> -+gettimeofday,78,96,96,78,169,78,94,94,78,78,78,78,169,169,78,78,78
> -+get_tls,PNR,PNR,PNR,983046,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR
> -+getuid,24,102,102,24,174,24,100,100,24,24,24,24,174,174,24,199,24
> -+getuid32,199,PNR,PNR,199,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,199,PNR,199
> -+getxattr,229,191,191,229,8,227,183,183,241,241,212,212,8,8,227,227,229
> -+gtty,32,PNR,PNR,PNR,PNR,32,PNR,PNR,PNR,PNR,32,32,PNR,PNR,PNR,PNR,PNR
> -+idle,112,PNR,PNR,PNR,PNR,112,PNR,PNR,PNR,PNR,112,112,PNR,PNR,112,112,PNR
> -+init_module,128,175,175,128,105,128,168,168,128,128,128,128,105,105,128,128,128
> -+inotify_add_watch,292,254,254,317,27,285,244,248,270,270,276,276,27,27,285,285,291
> -+inotify_init,291,253,253,316,PNR,284,243,247,269,269,275,275,PNR,PNR,284,284,290
> -+inotify_init1,332,294,294,360,26,329,288,292,314,314,318,318,26,26,324,324,332
> -+inotify_rm_watch,293,255,255,318,28,286,245,249,271,271,277,277,28,28,286,286,292
> -+io_cancel,249,210,210,247,3,245,204,204,219,219,231,231,3,3,247,247,249
> -+ioctl,54,16,514,54,29,54,15,15,54,54,54,54,29,29,54,54,54
> -+io_destroy,246,207,207,244,1,242,201,201,216,216,228,228,1,1,244,244,246
> -+io_getevents,247,208,208,245,4,243,202,202,217,217,229,229,4,4,245,245,247
> -+ioperm,101,173,173,PNR,PNR,101,PNR,PNR,PNR,PNR,101,101,PNR,PNR,101,PNR,PNR
> -+io_pgetevents,385,333,333,399,292,368,328,332,350,350,388,388,292,292,382,382,PNR
> -+io_pgetevents_time64,416,PNR,PNR,416,PNR,416,PNR,416,416,PNR,416,PNR,PNR,PNR,416,PNR,416
> -+iopl,110,172,172,PNR,PNR,110,PNR,PNR,PNR,PNR,110,110,PNR,PNR,PNR,PNR,PNR
> -+ioprio_get,290,252,252,315,31,315,274,278,268,268,274,274,31,31,283,283,289
> -+ioprio_set,289,251,251,314,30,314,273,277,267,267,273,273,30,30,282,282,288
> -+io_setup,245,206,543,243,0,241,200,200,215,215,227,227,0,0,243,243,245
> -+io_submit,248,209,544,246,2,244,203,203,218,218,230,230,2,2,246,246,248
> -+io_uring_enter,426,426,426,426,426,426,426,426,426,426,426,426,426,426,426,426,426
> -+io_uring_register,427,427,427,427,427,427,427,427,427,427,427,427,427,427,427,427,427
> -+io_uring_setup,425,425,425,425,425,425,425,425,425,425,425,425,425,425,425,425,425
> -+ipc,117,PNR,PNR,PNR,PNR,117,PNR,PNR,PNR,PNR,117,117,PNR,PNR,117,117,117
> -+kcmp,349,312,312,378,272,347,306,311,332,332,354,354,272,272,343,343,367
> -+kexec_file_load,PNR,320,320,401,294,PNR,PNR,PNR,355,355,382,382,294,294,381,381,PNR
> -+kexec_load,283,246,528,347,104,311,270,274,300,300,268,268,104,104,277,277,283
> -+keyctl,288,250,250,311,219,282,241,245,266,266,271,271,219,219,280,280,287
> -+kill,37,62,62,37,129,37,60,60,37,37,37,37,129,129,37,37,37
> -+landlock_add_rule,445,445,445,445,445,445,445,445,445,445,445,445,445,445,445,445,445
> -+landlock_create_ruleset,444,444,444,444,444,444,444,444,444,444,444,444,444,444,444,444,444
> -+landlock_restrict_self,446,446,446,446,446,446,446,446,446,446,446,446,446,446,446,446,446
> -+lchown,16,94,94,16,PNR,16,92,92,16,16,16,16,PNR,PNR,16,198,16
> -+lchown32,198,PNR,PNR,198,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,198,PNR,198
> -+lgetxattr,230,192,192,230,9,228,184,184,242,242,213,213,9,9,228,228,230
> -+link,9,86,86,9,PNR,9,84,84,9,9,9,9,PNR,PNR,9,9,9
> -+linkat,303,265,265,330,37,296,255,259,283,283,294,294,37,37,296,296,303
> -+listen,363,50,50,284,201,174,49,49,32,32,329,329,201,201,363,363,343
> -+listxattr,232,194,194,232,11,230,186,186,244,244,215,215,11,11,230,230,232
> -+llistxattr,233,195,195,233,12,231,187,187,245,245,216,216,12,12,231,231,233
> -+_llseek,140,PNR,PNR,140,PNR,140,PNR,PNR,140,140,140,140,PNR,PNR,140,PNR,140
> -+lock,53,PNR,PNR,PNR,PNR,53,PNR,PNR,PNR,PNR,53,53,PNR,PNR,PNR,PNR,PNR
> -+lookup_dcookie,253,212,212,249,18,247,206,206,223,223,235,235,18,18,110,110,253
> -+lremovexattr,236,198,198,236,15,234,190,190,248,248,219,219,15,15,234,234,236
> -+lseek,19,8,8,19,62,19,8,8,19,19,19,19,62,62,19,19,19
> -+lsetxattr,227,189,189,227,6,225,181,181,239,239,210,210,6,6,225,225,227
> -+lstat,107,6,6,107,PNR,107,6,6,84,84,107,107,PNR,PNR,107,107,107
> -+lstat64,196,PNR,PNR,196,PNR,214,PNR,PNR,198,198,196,PNR,PNR,PNR,196,PNR,196
> -+madvise,219,28,28,220,233,218,27,27,119,119,205,205,233,233,219,219,219
> -+mbind,274,237,237,319,235,268,227,231,260,260,259,259,235,235,268,268,274
> -+membarrier,375,324,324,389,283,358,318,322,343,343,365,365,283,283,356,356,378
> -+memfd_create,356,319,319,385,279,354,314,318,340,340,360,360,279,279,350,350,374
> -+migrate_pages,294,256,256,400,238,287,246,250,272,272,258,258,238,238,287,287,294
> -+mincore,218,27,27,219,232,217,26,26,72,72,206,206,232,232,218,218,218
> -+mkdir,39,83,83,39,PNR,39,81,81,39,39,39,39,PNR,PNR,39,39,39
> -+mkdirat,296,258,258,323,34,289,248,252,276,276,287,287,34,34,289,289,296
> -+mknod,14,133,133,14,PNR,14,131,131,14,14,14,14,PNR,PNR,14,14,14
> -+mknodat,297,259,259,324,33,290,249,253,277,277,288,288,33,33,290,290,297
> -+mlock,150,149,149,150,228,154,146,146,150,150,150,150,228,228,150,150,150
> -+mlock2,376,325,325,390,284,359,319,323,345,345,378,378,284,284,374,374,379
> -+mlockall,152,151,151,152,230,156,148,148,152,152,152,152,230,230,152,152,152
> -+mmap,90,9,9,PNR,222,90,9,9,90,90,90,90,222,222,90,90,90
> -+mmap2,192,PNR,PNR,192,PNR,210,PNR,PNR,89,89,192,PNR,PNR,PNR,192,PNR,192
> -+modify_ldt,123,154,154,PNR,PNR,123,PNR,PNR,PNR,PNR,123,123,PNR,PNR,PNR,PNR,PNR
> -+mount,21,165,165,21,40,21,160,160,21,21,21,21,40,40,21,21,21
> -+mount_setattr,442,442,442,442,442,442,442,442,442,442,442,442,442,442,442,442,442
> -+move_mount,429,429,429,429,429,429,429,429,429,429,429,429,429,429,429,429,429
> -+move_pages,317,279,533,344,239,308,267,271,295,295,301,301,239,239,310,310,317
> -+mprotect,125,10,10,125,226,125,10,10,125,125,125,125,226,226,125,125,125
> -+mpx,56,PNR,PNR,PNR,PNR,56,PNR,PNR,PNR,PNR,56,56,PNR,PNR,PNR,PNR,PNR
> -+mq_getsetattr,282,245,245,279,185,276,235,239,234,234,267,267,185,185,276,276,282
> -+mq_notify,281,244,527,278,184,275,234,238,233,233,266,266,184,184,275,275,281
> -+mq_open,277,240,240,274,180,271,230,234,229,229,262,262,180,180,271,271,277
> -+mq_timedreceive,280,243,243,277,183,274,233,237,232,232,265,265,183,183,274,274,280
> -+mq_timedreceive_time64,419,PNR,PNR,419,PNR,419,PNR,419,419,PNR,419,PNR,PNR,PNR,419,PNR,419
> -+mq_timedsend,279,242,242,276,182,273,232,236,231,231,264,264,182,182,273,273,279
> -+mq_timedsend_time64,418,PNR,PNR,418,PNR,418,PNR,418,418,PNR,418,PNR,PNR,PNR,418,PNR,418
> -+mq_unlink,278,241,241,275,181,272,231,235,230,230,263,263,181,181,272,272,278
> -+mremap,163,25,25,163,216,167,24,24,163,163,163,163,216,216,163,163,163
> -+msgctl,402,71,71,304,187,402,69,69,191,191,402,402,187,187,402,402,402
> -+msgget,399,68,68,303,186,399,66,66,190,190,399,399,186,186,399,399,399
> -+msgrcv,401,70,70,302,188,401,68,68,189,189,401,401,188,188,401,401,401
> -+msgsnd,400,69,69,301,189,400,67,67,188,188,400,400,189,189,400,400,400
> -+msync,144,26,26,144,227,144,25,25,144,144,144,144,227,227,144,144,144
> -+multiplexer,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,201,201,PNR,PNR,PNR,PNR,PNR
> -+munlock,151,150,150,151,229,155,147,147,151,151,151,151,229,229,151,151,151
> -+munlockall,153,152,152,153,231,157,149,149,153,153,153,153,231,231,153,153,153
> -+munmap,91,11,11,91,215,91,11,11,91,91,91,91,215,215,91,91,91
> -+name_to_handle_at,341,303,303,370,264,339,298,303,325,325,345,345,264,264,335,335,359
> -+nanosleep,162,35,35,162,101,166,34,34,162,162,162,162,101,101,162,162,162
> -+newfstatat,PNR,262,262,PNR,79,PNR,252,256,PNR,PNR,PNR,291,79,79,PNR,293,PNR
> -+_newselect,142,PNR,PNR,142,PNR,142,22,22,142,142,142,142,PNR,PNR,142,PNR,142
> -+nfsservctl,169,180,PNR,169,42,189,173,173,PNR,PNR,168,168,42,42,169,169,169
> -+nice,34,PNR,PNR,34,PNR,34,PNR,PNR,34,34,34,34,PNR,PNR,34,34,34
> -+oldfstat,28,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,28,28,PNR,PNR,PNR,PNR,28
> -+oldlstat,84,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,84,84,PNR,PNR,PNR,PNR,84
> -+oldolduname,59,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,59,59,PNR,PNR,PNR,PNR,PNR
> -+oldstat,18,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,18,18,PNR,PNR,PNR,PNR,18
> -+olduname,109,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,109,109,PNR,PNR,PNR,PNR,109
> -+open,5,2,2,5,PNR,5,2,2,5,5,5,5,PNR,PNR,5,5,5
> -+openat,295,257,257,322,56,288,247,251,275,275,286,286,56,56,288,288,295
> -+openat2,437,437,437,437,437,437,437,437,437,437,437,437,437,437,437,437,437
> -+open_by_handle_at,342,304,304,371,265,340,299,304,326,326,346,346,265,265,336,336,360
> -+open_tree,428,428,428,428,428,428,428,428,428,428,428,428,428,428,428,428,428
> -+pause,29,34,34,29,PNR,29,33,33,29,29,29,29,PNR,PNR,29,29,29
> -+pciconfig_iobase,PNR,PNR,PNR,271,PNR,PNR,PNR,PNR,PNR,PNR,200,200,PNR,PNR,PNR,PNR,PNR
> -+pciconfig_read,PNR,PNR,PNR,272,PNR,PNR,PNR,PNR,PNR,PNR,198,198,PNR,PNR,PNR,PNR,PNR
> -+pciconfig_write,PNR,PNR,PNR,273,PNR,PNR,PNR,PNR,PNR,PNR,199,199,PNR,PNR,PNR,PNR,PNR
> -+perf_event_open,336,298,298,364,241,333,292,296,318,318,319,319,241,241,331,331,336
> -+personality,136,135,135,136,92,136,132,132,136,136,136,136,92,92,136,136,136
> -+pidfd_getfd,438,438,438,438,438,438,438,438,438,438,438,438,438,438,438,438,438
> -+pidfd_open,434,434,434,434,434,434,434,434,434,434,434,434,434,434,434,434,434
> -+pidfd_send_signal,424,424,424,424,424,424,424,424,424,424,424,424,424,424,424,424,424
> -+pipe,42,22,22,42,PNR,42,21,21,42,42,42,42,PNR,PNR,42,42,42
> -+pipe2,331,293,293,359,59,328,287,291,313,313,317,317,59,59,325,325,331
> -+pivot_root,217,155,155,218,41,216,151,151,67,67,203,203,41,41,217,217,217
> -+pkey_alloc,381,330,330,395,289,364,324,328,352,352,384,384,289,289,385,385,385
> -+pkey_free,382,331,331,396,290,365,325,329,353,353,385,385,290,290,386,386,386
> -+pkey_mprotect,380,329,329,394,288,363,323,327,351,351,386,386,288,288,384,384,384
> -+poll,168,7,7,168,PNR,188,7,7,168,168,167,167,PNR,PNR,168,168,168
> -+ppoll,309,271,271,336,73,302,261,265,274,274,281,281,73,73,302,302,309
> -+ppoll_time64,414,PNR,PNR,414,PNR,414,PNR,414,414,PNR,414,PNR,PNR,PNR,414,PNR,414
> -+prctl,172,157,157,172,167,192,153,153,172,172,171,171,167,167,172,172,172
> -+pread64,180,17,17,180,67,200,16,16,108,108,179,179,67,67,180,180,180
> -+preadv,333,295,534,361,69,330,289,293,315,315,320,320,69,69,328,328,333
> -+preadv2,378,327,546,392,286,361,321,325,347,347,380,380,286,286,376,376,381
> -+prlimit64,340,302,302,369,261,338,297,302,321,321,325,325,261,261,334,334,339
> -+process_madvise,440,440,440,440,440,440,440,440,440,440,440,440,440,440,440,440,440
> -+process_vm_readv,347,310,539,376,270,345,304,309,330,330,351,351,270,270,340,340,365
> -+process_vm_writev,348,311,540,377,271,346,305,310,331,331,352,352,271,271,341,341,366
> -+prof,44,PNR,PNR,PNR,PNR,44,PNR,PNR,PNR,PNR,44,44,PNR,PNR,PNR,PNR,PNR
> -+profil,98,PNR,PNR,PNR,PNR,98,PNR,PNR,PNR,PNR,98,98,PNR,PNR,PNR,PNR,PNR
> -+pselect6,308,270,270,335,72,301,260,264,273,273,280,280,72,72,301,301,308
> -+pselect6_time64,413,PNR,PNR,413,PNR,413,PNR,413,413,PNR,413,PNR,PNR,PNR,413,PNR,413
> -+ptrace,26,101,521,26,117,26,99,99,26,26,26,26,117,117,26,26,26
> -+putpmsg,189,182,182,PNR,PNR,209,175,175,PNR,PNR,188,188,PNR,PNR,189,189,PNR
> -+pwrite64,181,18,18,181,68,201,17,17,109,109,180,180,68,68,181,181,181
> -+pwritev,334,296,535,362,70,331,290,294,316,316,321,321,70,70,329,329,334
> -+pwritev2,379,328,547,393,287,362,322,326,348,348,381,381,287,287,377,377,382
> -+query_module,167,178,PNR,PNR,PNR,187,171,171,PNR,PNR,166,166,PNR,PNR,167,167,PNR
> -+quotactl,131,179,179,131,60,131,172,172,131,131,131,131,60,60,131,131,131
> -+quotactl_path,PNR,PNR,PNR,PNR,443,PNR,PNR,PNR,PNR,PNR,PNR,PNR,443,443,PNR,PNR,PNR
> -+read,3,0,0,3,63,3,0,0,3,3,3,3,63,63,3,3,3
> -+readahead,225,187,187,225,213,223,179,179,207,207,191,191,213,213,222,222,225
> -+readdir,89,PNR,PNR,PNR,PNR,89,PNR,PNR,PNR,PNR,89,89,PNR,PNR,89,89,89
> -+readlink,85,89,89,85,PNR,85,87,87,85,85,85,85,PNR,PNR,85,85,85
> -+readlinkat,305,267,267,332,78,298,257,261,285,285,296,296,78,78,298,298,305
> -+readv,145,19,515,145,65,145,18,18,145,145,145,145,65,65,145,145,145
> -+reboot,88,169,169,88,142,88,164,164,88,88,88,88,142,142,88,88,88
> -+recv,PNR,PNR,PNR,291,PNR,175,PNR,PNR,98,98,336,336,PNR,PNR,PNR,PNR,350
> -+recvfrom,371,45,517,292,207,176,44,44,123,123,337,337,207,207,371,371,351
> -+recvmmsg,337,299,537,365,243,335,294,298,319,319,343,343,243,243,357,357,357
> -+recvmmsg_time64,417,PNR,PNR,417,PNR,417,PNR,417,417,PNR,417,PNR,PNR,PNR,417,PNR,417
> -+recvmsg,372,47,519,297,212,177,46,46,184,184,342,342,212,212,372,372,356
> -+remap_file_pages,257,216,216,253,234,251,210,210,227,227,239,239,234,234,267,267,257
> -+removexattr,235,197,197,235,14,233,189,189,247,247,218,218,14,14,233,233,235
> -+rename,38,82,82,38,PNR,38,80,80,38,38,38,38,PNR,PNR,38,38,38
> -+renameat,302,264,264,329,38,295,254,258,282,282,293,293,PNR,PNR,295,295,302
> -+renameat2,353,316,316,382,276,351,311,315,337,337,357,357,276,276,347,347,371
> -+request_key,287,249,249,310,218,281,240,244,265,265,270,270,218,218,279,279,286
> -+restart_syscall,0,219,219,0,128,253,213,214,0,0,0,0,128,128,7,7,0
> -+riscv_flush_icache,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,259,259,PNR,PNR,PNR
> -+rmdir,40,84,84,40,PNR,40,82,82,40,40,40,40,PNR,PNR,40,40,40
> -+rseq,386,334,334,398,293,367,327,331,354,354,387,387,293,293,383,383,387
> -+rtas,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,255,255,PNR,PNR,PNR,PNR,PNR
> -+rt_sigaction,174,13,512,174,134,194,13,13,174,174,173,173,134,134,174,174,174
> -+rt_sigpending,176,127,522,176,136,196,125,125,176,176,175,175,136,136,176,176,176
> -+rt_sigprocmask,175,14,14,175,135,195,14,14,175,175,174,174,135,135,175,175,175
> -+rt_sigqueueinfo,178,129,524,178,138,198,127,127,178,178,177,177,138,138,178,178,178
> -+rt_sigreturn,173,15,513,173,139,193,211,211,173,173,172,172,139,139,173,173,173
> -+rt_sigsuspend,179,130,130,179,133,199,128,128,179,179,178,178,133,133,179,179,179
> -+rt_sigtimedwait,177,128,523,177,137,197,126,126,177,177,176,176,137,137,177,177,177
> -+rt_sigtimedwait_time64,421,PNR,PNR,421,PNR,421,PNR,421,421,PNR,421,PNR,PNR,PNR,421,PNR,421
> -+rt_tgsigqueueinfo,335,297,536,363,240,332,291,295,317,317,322,322,240,240,330,330,335
> -+s390_guarded_storage,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,378,378,PNR
> -+s390_pci_mmio_read,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,353,353,PNR
> -+s390_pci_mmio_write,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,352,352,PNR
> -+s390_runtime_instr,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,342,342,PNR
> -+s390_sthyi,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,380,380,PNR
> -+sched_getaffinity,242,204,204,242,123,240,196,196,212,212,223,223,123,123,240,240,242
> -+sched_getattr,352,315,315,381,275,350,310,314,335,335,356,356,275,275,346,346,369
> -+sched_getparam,155,143,143,155,121,159,140,140,155,155,155,155,121,121,155,155,155
> -+sched_get_priority_max,159,146,146,159,125,163,143,143,159,159,159,159,125,125,159,159,159
> -+sched_get_priority_min,160,147,147,160,126,164,144,144,160,160,160,160,126,126,160,160,160
> -+sched_getscheduler,157,145,145,157,120,161,142,142,157,157,157,157,120,120,157,157,157
> -+sched_rr_get_interval,161,148,148,161,127,165,145,145,161,161,161,161,127,127,161,161,161
> -+sched_rr_get_interval_time64,423,PNR,PNR,423,PNR,423,PNR,423,423,PNR,423,PNR,PNR,PNR,423,PNR,423
> -+sched_setaffinity,241,203,203,241,122,239,195,195,211,211,222,222,122,122,239,239,241
> -+sched_setattr,351,314,314,380,274,349,309,313,334,334,355,355,274,274,345,345,370
> -+sched_setparam,154,142,142,154,118,158,139,139,154,154,154,154,118,118,154,154,154
> -+sched_setscheduler,156,144,144,156,119,160,141,141,156,156,156,156,119,119,156,156,156
> -+sched_yield,158,24,24,158,124,162,23,23,158,158,158,158,124,124,158,158,158
> -+seccomp,354,317,317,383,277,352,312,316,338,338,358,358,277,277,348,348,372
> -+security,PNR,185,185,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR
> -+select,82,23,23,PNR,PNR,PNR,PNR,PNR,PNR,PNR,82,82,PNR,PNR,PNR,142,PNR
> -+semctl,394,66,66,300,191,394,64,64,187,187,394,394,191,191,394,394,394
> -+semget,393,64,64,299,190,393,62,62,186,186,393,393,190,190,393,393,393
> -+semop,PNR,65,65,298,193,PNR,63,63,185,185,PNR,PNR,193,193,PNR,PNR,PNR
> -+semtimedop,PNR,220,220,312,192,PNR,214,215,228,228,PNR,392,192,192,PNR,392,PNR
> -+semtimedop_time64,420,PNR,PNR,420,PNR,420,PNR,420,420,PNR,420,PNR,PNR,PNR,420,PNR,420
> -+send,PNR,PNR,PNR,289,PNR,178,PNR,PNR,58,58,334,334,PNR,PNR,PNR,PNR,348
> -+sendfile,187,40,40,187,71,207,39,39,122,122,186,186,71,71,187,187,187
> -+sendfile64,239,PNR,PNR,239,PNR,237,PNR,219,209,209,226,PNR,PNR,PNR,223,PNR,239
> -+sendmmsg,345,307,538,374,269,343,302,307,329,329,349,349,269,269,358,358,363
> -+sendmsg,370,46,518,296,211,179,45,45,183,183,341,341,211,211,370,370,355
> -+sendto,369,44,44,290,206,180,43,43,82,82,335,335,206,206,369,369,349
> -+setdomainname,121,171,171,121,162,121,166,166,121,121,121,121,162,162,121,121,121
> -+setfsgid,139,123,123,139,152,139,121,121,139,139,139,139,152,152,139,216,139
> -+setfsgid32,216,PNR,PNR,216,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,216,PNR,216
> -+setfsuid,138,122,122,138,151,138,120,120,138,138,138,138,151,151,138,215,138
> -+setfsuid32,215,PNR,PNR,215,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,215,PNR,215
> -+setgid,46,106,106,46,144,46,104,104,46,46,46,46,144,144,46,214,46
> -+setgid32,214,PNR,PNR,214,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,214,PNR,214
> -+setgroups,81,116,116,81,159,81,114,114,81,81,81,81,159,159,81,206,81
> -+setgroups32,206,PNR,PNR,206,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,206,PNR,206
> -+sethostname,74,170,170,74,161,74,165,165,74,74,74,74,161,161,74,74,74
> -+setitimer,104,38,38,104,103,104,36,36,104,104,104,104,103,103,104,104,104
> -+set_mempolicy,276,238,238,321,237,270,229,233,262,262,261,261,237,237,270,270,276
> -+setns,346,308,308,375,268,344,303,308,328,328,350,350,268,268,339,339,364
> -+setpgid,57,109,109,57,154,57,107,107,57,57,57,57,154,154,57,57,57
> -+setpriority,97,141,141,97,140,97,138,138,97,97,97,97,140,140,97,97,97
> -+setregid,71,114,114,71,143,71,112,112,71,71,71,71,143,143,71,204,71
> -+setregid32,204,PNR,PNR,204,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,204,PNR,204
> -+setresgid,170,119,119,170,149,190,117,117,170,170,169,169,149,149,170,210,170
> -+setresgid32,210,PNR,PNR,210,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,210,PNR,210
> -+setresuid,164,117,117,164,147,185,115,115,164,164,164,164,147,147,164,208,164
> -+setresuid32,208,PNR,PNR,208,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,208,PNR,208
> -+setreuid,70,113,113,70,145,70,111,111,70,70,70,70,145,145,70,203,70
> -+setreuid32,203,PNR,PNR,203,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,203,PNR,203
> -+setrlimit,75,160,160,75,164,75,155,155,75,75,75,75,164,164,75,75,75
> -+set_robust_list,311,273,530,338,99,309,268,272,289,289,300,300,99,99,304,304,311
> -+setsid,66,112,112,66,157,66,110,110,66,66,66,66,157,157,66,66,66
> -+setsockopt,366,54,541,294,208,181,53,53,181,181,339,339,208,208,366,366,353
> -+set_thread_area,243,205,PNR,PNR,PNR,283,242,246,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR
> -+set_tid_address,258,218,218,256,96,252,212,213,237,237,232,232,96,96,252,252,258
> -+settimeofday,79,164,164,79,170,79,159,159,79,79,79,79,170,170,79,79,79
> -+set_tls,PNR,PNR,PNR,983045,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR
> -+setuid,23,105,105,23,146,23,103,103,23,23,23,23,146,146,23,213,23
> -+setuid32,213,PNR,PNR,213,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,213,PNR,213
> -+setxattr,226,188,188,226,5,224,180,180,238,238,209,209,5,5,224,224,226
> -+sgetmask,68,PNR,PNR,PNR,PNR,68,PNR,PNR,68,68,68,68,PNR,PNR,PNR,PNR,68
> -+shmat,397,30,30,305,196,397,29,29,192,192,397,397,196,196,397,397,397
> -+shmctl,396,31,31,308,195,396,30,30,195,195,396,396,195,195,396,396,396
> -+shmdt,398,67,67,306,197,398,65,65,193,193,398,398,197,197,398,398,398
> -+shmget,395,29,29,307,194,395,28,28,194,194,395,395,194,194,395,395,395
> -+shutdown,373,48,48,293,210,182,47,47,117,117,338,338,210,210,373,373,352
> -+sigaction,67,PNR,PNR,67,PNR,67,PNR,PNR,PNR,PNR,67,67,PNR,PNR,67,67,67
> -+sigaltstack,186,131,525,186,132,206,129,129,166,166,185,185,132,132,186,186,186
> -+signal,48,PNR,PNR,PNR,PNR,48,PNR,PNR,48,48,48,48,PNR,PNR,48,48,48
> -+signalfd,321,282,282,349,PNR,317,276,280,302,302,305,305,PNR,PNR,316,316,321
> -+signalfd4,327,289,289,355,74,324,283,287,309,309,313,313,74,74,322,322,327
> -+sigpending,73,PNR,PNR,73,PNR,73,PNR,PNR,73,73,73,73,PNR,PNR,73,73,73
> -+sigprocmask,126,PNR,PNR,126,PNR,126,PNR,PNR,126,126,126,126,PNR,PNR,126,126,126
> -+sigreturn,119,PNR,PNR,119,PNR,119,PNR,PNR,PNR,PNR,119,119,PNR,PNR,119,119,119
> -+sigsuspend,72,PNR,PNR,72,PNR,72,PNR,PNR,PNR,PNR,72,72,PNR,PNR,72,72,72
> -+socket,359,41,41,281,198,183,40,40,17,17,326,326,198,198,359,359,340
> -+socketcall,102,PNR,PNR,PNR,PNR,102,PNR,PNR,PNR,PNR,102,102,PNR,PNR,102,102,102
> -+socketpair,360,53,53,288,199,184,52,52,56,56,333,333,199,199,360,360,347
> -+splice,313,275,275,340,76,304,263,267,291,291,283,283,76,76,306,306,313
> -+spu_create,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,279,279,PNR,PNR,PNR,PNR,PNR
> -+spu_run,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,278,278,PNR,PNR,PNR,PNR,PNR
> -+ssetmask,69,PNR,PNR,PNR,PNR,69,PNR,PNR,69,69,69,69,PNR,PNR,PNR,PNR,69
> -+stat,106,4,4,106,PNR,106,4,4,18,18,106,106,PNR,PNR,106,106,106
> -+stat64,195,PNR,PNR,195,PNR,213,PNR,PNR,101,101,195,PNR,PNR,PNR,195,PNR,195
> -+statfs,99,137,137,99,43,99,134,134,99,99,99,99,43,43,99,99,99
> -+statfs64,268,PNR,PNR,266,PNR,255,PNR,217,298,298,252,252,PNR,PNR,265,265,268
> -+statx,383,332,332,397,291,366,326,330,349,349,383,383,291,291,379,379,383
> -+stime,25,PNR,PNR,PNR,PNR,25,PNR,PNR,25,25,25,25,PNR,PNR,25,PNR,25
> -+stty,31,PNR,PNR,PNR,PNR,31,PNR,PNR,PNR,PNR,31,31,PNR,PNR,PNR,PNR,PNR
> -+subpage_prot,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,310,310,PNR,PNR,PNR,PNR,PNR
> -+swapcontext,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,249,249,PNR,PNR,PNR,PNR,PNR
> -+swapoff,115,168,168,115,225,115,163,163,115,115,115,115,225,225,115,115,115
> -+swapon,87,167,167,87,224,87,162,162,87,87,87,87,224,224,87,87,87
> -+switch_endian,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,363,363,PNR,PNR,PNR,PNR,PNR
> -+symlink,83,88,88,83,PNR,83,86,86,83,83,83,83,PNR,PNR,83,83,83
> -+symlinkat,304,266,266,331,36,297,256,260,284,284,295,295,36,36,297,297,304
> -+sync,36,162,162,36,81,36,157,157,36,36,36,36,81,81,36,36,36
> -+sync_file_range,314,277,277,PNR,84,305,264,268,292,292,PNR,PNR,84,84,307,307,314
> -+sync_file_range2,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,308,308,PNR,PNR,PNR,PNR,PNR
> -+syncfs,344,306,306,373,267,342,301,306,327,327,348,348,267,267,338,338,362
> -+syscall,PNR,PNR,PNR,PNR,PNR,0,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR
> -+_sysctl,149,156,PNR,149,PNR,153,152,152,149,149,149,149,PNR,PNR,149,149,149
> -+sys_debug_setcontext,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,256,256,PNR,PNR,PNR,PNR,PNR
> -+sysfs,135,139,139,135,PNR,135,136,136,135,135,135,135,PNR,PNR,135,135,135
> -+sysinfo,116,99,99,116,179,116,97,97,116,116,116,116,179,179,116,116,116
> -+syslog,103,103,103,103,116,103,101,101,103,103,103,103,116,116,103,103,103
> -+sysmips,PNR,PNR,PNR,PNR,PNR,149,199,199,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR
> -+tee,315,276,276,342,77,306,265,269,293,293,284,284,77,77,308,308,315
> -+tgkill,270,234,234,268,131,266,225,229,259,259,250,250,131,131,241,241,270
> -+time,13,201,201,PNR,PNR,13,PNR,PNR,13,13,13,13,PNR,PNR,13,PNR,13
> -+timer_create,259,222,526,257,107,257,216,220,250,250,240,240,107,107,254,254,259
> -+timer_delete,263,226,226,261,111,261,220,224,254,254,244,244,111,111,258,258,263
> -+timerfd,PNR,PNR,PNR,PNR,PNR,318,277,281,PNR,PNR,PNR,PNR,PNR,PNR,317,317,PNR
> -+timerfd_create,322,283,283,350,85,321,280,284,306,306,306,306,85,85,319,319,322
> -+timerfd_gettime,326,287,287,354,87,322,281,285,308,308,312,312,87,87,321,321,326
> -+timerfd_gettime64,410,PNR,PNR,410,PNR,410,PNR,410,410,PNR,410,PNR,PNR,PNR,410,PNR,410
> -+timerfd_settime,325,286,286,353,86,323,282,286,307,307,311,311,86,86,320,320,325
> -+timerfd_settime64,411,PNR,PNR,411,PNR,411,PNR,411,411,PNR,411,PNR,PNR,PNR,411,PNR,411
> -+timer_getoverrun,262,225,225,260,109,260,219,223,253,253,243,243,109,109,257,257,262
> -+timer_gettime,261,224,224,259,108,259,218,222,252,252,242,242,108,108,256,256,261
> -+timer_gettime64,408,PNR,PNR,408,PNR,408,PNR,408,408,PNR,408,PNR,PNR,PNR,408,PNR,408
> -+timer_settime,260,223,223,258,110,258,217,221,251,251,241,241,110,110,255,255,260
> -+timer_settime64,409,PNR,PNR,409,PNR,409,PNR,409,409,PNR,409,PNR,PNR,PNR,409,PNR,409
> -+times,43,100,100,43,153,43,98,98,43,43,43,43,153,153,43,43,43
> -+tkill,238,200,200,238,130,236,192,192,208,208,208,208,130,130,237,237,238
> -+truncate,92,76,76,92,45,92,74,74,92,92,92,92,45,45,92,92,92
> -+truncate64,193,PNR,PNR,193,PNR,211,PNR,PNR,199,199,193,PNR,PNR,PNR,193,PNR,193
> -+tuxcall,PNR,184,184,PNR,PNR,PNR,PNR,PNR,PNR,PNR,225,225,PNR,PNR,PNR,PNR,PNR
> -+ugetrlimit,191,PNR,PNR,191,PNR,PNR,PNR,PNR,PNR,PNR,190,190,PNR,PNR,191,PNR,191
> -+ulimit,58,PNR,PNR,PNR,PNR,58,PNR,PNR,PNR,PNR,58,58,PNR,PNR,PNR,PNR,PNR
> -+umask,60,95,95,60,166,60,93,93,60,60,60,60,166,166,60,60,60
> -+umount,22,PNR,PNR,PNR,PNR,22,PNR,PNR,PNR,PNR,22,22,PNR,PNR,22,22,22
> -+umount2,52,166,166,52,39,52,161,161,52,52,52,52,39,39,52,52,52
> -+uname,122,63,63,122,160,122,61,61,59,59,122,122,160,160,122,122,122
> -+unlink,10,87,87,10,PNR,10,85,85,10,10,10,10,PNR,PNR,10,10,10
> -+unlinkat,301,263,263,328,35,294,253,257,281,281,292,292,35,35,294,294,301
> -+unshare,310,272,272,337,97,303,262,266,288,288,282,282,97,97,303,303,310
> -+uselib,86,134,PNR,86,PNR,86,PNR,PNR,86,86,86,86,PNR,PNR,86,86,86
> -+userfaultfd,374,323,323,388,282,357,317,321,344,344,364,364,282,282,355,355,377
> -+usr26,PNR,PNR,PNR,983043,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR
> -+usr32,PNR,PNR,PNR,983044,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR
> -+ustat,62,136,136,62,PNR,62,133,133,62,62,62,62,PNR,PNR,62,62,62
> -+utime,30,132,132,PNR,PNR,30,130,130,30,30,30,30,PNR,PNR,30,30,30
> -+utimensat,320,280,280,348,88,316,275,279,301,301,304,304,88,88,315,315,320
> -+utimensat_time64,412,PNR,PNR,412,PNR,412,PNR,412,412,PNR,412,PNR,PNR,PNR,412,PNR,412
> -+utimes,271,235,235,269,PNR,267,226,230,336,336,251,251,PNR,PNR,313,313,271
> -+vfork,190,58,58,190,PNR,PNR,PNR,PNR,113,113,189,189,PNR,PNR,190,190,190
> -+vhangup,111,153,153,111,58,111,150,150,111,111,111,111,58,58,111,111,111
> -+vm86,166,PNR,PNR,PNR,PNR,113,PNR,PNR,PNR,PNR,113,113,PNR,PNR,PNR,PNR,PNR
> -+vm86old,113,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR
> -+vmsplice,316,278,532,343,75,307,266,270,294,294,285,285,75,75,309,309,316
> -+vserver,273,236,PNR,313,PNR,277,236,240,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR
> -+wait4,114,61,61,114,260,114,59,59,114,114,114,114,260,260,114,114,114
> -+waitid,284,247,529,280,95,278,237,241,235,235,272,272,95,95,281,281,284
> -+waitpid,7,PNR,PNR,PNR,PNR,7,PNR,PNR,7,7,7,7,PNR,PNR,PNR,PNR,7
> -+write,4,1,1,4,64,4,1,1,4,4,4,4,64,64,4,4,4
> -+writev,146,20,516,146,66,146,19,19,146,146,146,146,66,66,146,146,146
> ---
> -2.32.0
> ++#syscall (5.14.3 2021-09-16),x86,x86_64,x32,arm,aarch64,mips,mips64,mips64n32,parisc,parisc64,ppc,ppc64,riscv32,riscv64,s390,s390x,sh
> ++_llseek,140,PNR,PNR,140,PNR,140,PNR,PNR,140,140,140,140,PNR,140,PNR,140,0
> ++_newselect,142,PNR,PNR,142,PNR,142,22,22,142,142,142,142,PNR,142,PNR,142,0
> ++_sysctl,149,156,PNR,149,PNR,153,152,152,149,149,149,149,PNR,149,149,149,0
> ++accept,PNR,43,43,285,202,168,42,42,35,35,330,330,202,PNR,PNR,344,0
> ++accept4,364,288,288,366,242,334,293,297,320,320,344,344,242,364,364,358,0
> ++access,33,21,21,33,PNR,33,20,20,33,33,33,33,PNR,33,33,33,0
> ++acct,51,163,163,51,89,51,158,158,51,51,51,51,89,51,51,51,0
> ++add_key,286,248,248,309,217,280,239,243,264,264,269,269,217,278,278,285,0
> ++adjtimex,124,159,159,124,171,124,154,154,124,124,124,124,171,124,124,124,0
> ++afs_syscall,137,183,183,PNR,PNR,137,176,176,PNR,PNR,137,137,PNR,137,137,PNR,0
> ++alarm,27,37,37,PNR,PNR,27,37,37,27,27,27,27,PNR,27,27,27,0
> ++arch_prctl,384,158,158,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,0
> ++arm_fadvise64_64,PNR,PNR,PNR,270,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,0
> ++arm_sync_file_range,PNR,PNR,PNR,341,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,0
> ++bdflush,134,PNR,PNR,134,PNR,134,PNR,PNR,134,134,134,134,PNR,134,134,134,0
> ++bind,361,49,49,282,200,169,48,48,22,22,327,327,200,361,361,341,0
> ++bpf,357,321,321,386,280,355,315,319,341,341,361,361,280,351,351,375,0
> ++break,17,PNR,PNR,PNR,PNR,17,PNR,PNR,PNR,PNR,17,17,PNR,PNR,PNR,PNR,0
> ++breakpoint,PNR,PNR,PNR,983041,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,0
> ++brk,45,12,12,45,214,45,12,12,45,45,45,45,214,45,45,45,0
> ++cachectl,PNR,PNR,PNR,PNR,PNR,148,198,198,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,0
> ++cacheflush,PNR,PNR,PNR,983042,PNR,147,197,197,PNR,PNR,PNR,PNR,PNR,PNR,PNR,123,0
> ++capget,184,125,125,184,90,204,123,123,106,106,183,183,90,184,184,184,0
> ++capset,185,126,126,185,91,205,124,124,107,107,184,184,91,185,185,185,0
> ++chdir,12,80,80,12,49,12,78,78,12,12,12,12,49,12,12,12,0
> ++chmod,15,90,90,15,PNR,15,88,88,15,15,15,15,PNR,15,15,15,0
> ++chown,182,92,92,182,PNR,202,90,90,180,180,181,181,PNR,182,212,182,0
> ++chown32,212,PNR,PNR,212,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,212,PNR,212,0
> ++chroot,61,161,161,61,51,61,156,156,61,61,61,61,51,61,61,61,0
> ++clock_adjtime,343,305,305,372,266,341,300,305,324,324,347,347,266,337,337,361,0
> ++clock_adjtime64,405,PNR,PNR,405,PNR,405,PNR,405,405,PNR,405,PNR,PNR,405,PNR,405,0
> ++clock_getres,266,229,229,264,114,264,223,227,257,257,247,247,114,261,261,266,0
> ++clock_getres_time64,406,PNR,PNR,406,PNR,406,PNR,406,406,PNR,406,PNR,PNR,406,PNR,406,0
> ++clock_gettime,265,228,228,263,113,263,222,226,256,256,246,246,113,260,260,265,0
> ++clock_gettime64,403,PNR,PNR,403,PNR,403,PNR,403,403,PNR,403,PNR,PNR,403,PNR,403,0
> ++clock_nanosleep,267,230,230,265,115,265,224,228,258,258,248,248,115,262,262,267,0
> ++clock_nanosleep_time64,407,PNR,PNR,407,PNR,407,PNR,407,407,PNR,407,PNR,PNR,407,PNR,407,0
> ++clock_settime,264,227,227,262,112,262,221,225,255,255,245,245,112,259,259,264,0
> ++clock_settime64,404,PNR,PNR,404,PNR,404,PNR,404,404,PNR,404,PNR,PNR,404,PNR,404,0
> ++clone,120,56,56,120,220,120,55,55,120,120,120,120,220,120,120,120,0
> ++clone3,435,435,435,435,435,435,435,435,435,435,435,435,435,435,435,PNR,0
> ++close,6,3,3,6,57,6,3,3,6,6,6,6,57,6,6,6,0
> ++close_range,436,436,436,436,436,436,436,436,436,436,436,436,436,436,436,436,0
> ++connect,362,42,42,283,203,170,41,41,31,31,328,328,203,362,362,342,0
> ++copy_file_range,377,326,326,391,285,360,320,324,346,346,379,379,285,375,375,380,0
> ++creat,8,85,85,8,PNR,8,83,83,8,8,8,8,PNR,8,8,8,0
> ++create_module,127,174,PNR,PNR,PNR,127,167,167,PNR,PNR,127,127,PNR,127,127,PNR,0
> ++delete_module,129,176,176,129,106,129,169,169,129,129,129,129,106,129,129,129,0
> ++dup,41,32,32,41,23,41,31,31,41,41,41,41,23,41,41,41,0
> ++dup2,63,33,33,63,PNR,63,32,32,63,63,63,63,PNR,63,63,63,0
> ++dup3,330,292,292,358,24,327,286,290,312,312,316,316,24,326,326,330,0
> ++epoll_create,254,213,213,250,PNR,248,207,207,224,224,236,236,PNR,249,249,254,0
> ++epoll_create1,329,291,291,357,20,326,285,289,311,311,315,315,20,327,327,329,0
> ++epoll_ctl,255,233,233,251,21,249,208,208,225,225,237,237,21,250,250,255,0
> ++epoll_ctl_old,PNR,214,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,0
> ++epoll_pwait,319,281,281,346,22,313,272,276,297,297,303,303,22,312,312,319,0
> ++epoll_pwait2,441,441,441,441,441,441,441,441,441,441,441,441,441,441,441,441,0
> ++epoll_wait,256,232,232,252,PNR,250,209,209,226,226,238,238,PNR,251,251,256,0
> ++epoll_wait_old,PNR,215,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,0
> ++eventfd,323,284,284,351,PNR,319,278,282,304,304,307,307,PNR,318,318,323,0
> ++eventfd2,328,290,290,356,19,325,284,288,310,310,314,314,19,323,323,328,0
> ++execve,11,59,520,11,221,11,57,57,11,11,11,11,221,11,11,11,0
> ++execveat,358,322,545,387,281,356,316,320,342,342,362,362,281,354,354,376,0
> ++exit,1,60,60,1,93,1,58,58,1,1,1,1,93,1,1,1,0
> ++exit_group,252,231,231,248,94,246,205,205,222,222,234,234,94,248,248,252,0
> ++faccessat,307,269,269,334,48,300,259,263,287,287,298,298,48,300,300,307,0
> ++faccessat2,439,439,439,439,439,439,439,439,439,439,439,439,439,439,439,439,0
> ++fadvise64,250,221,221,PNR,223,254,215,216,PNR,PNR,233,233,223,253,253,250,0
> ++fadvise64_64,272,PNR,PNR,PNR,PNR,PNR,PNR,PNR,236,236,254,PNR,PNR,264,PNR,272,0
> ++fallocate,324,285,285,352,47,320,279,283,305,305,309,309,47,314,314,324,0
> ++fanotify_init,338,300,300,367,262,336,295,300,322,322,323,323,262,332,332,337,0
> ++fanotify_mark,339,301,301,368,263,337,296,301,323,323,324,324,263,333,333,338,0
> ++fchdir,133,81,81,133,50,133,79,79,133,133,133,133,50,133,133,133,0
> ++fchmod,94,91,91,94,52,94,89,89,94,94,94,94,52,94,94,94,0
> ++fchmodat,306,268,268,333,53,299,258,262,286,286,297,297,53,299,299,306,0
> ++fchown,95,93,93,95,55,95,91,91,95,95,95,95,55,95,207,95,0
> ++fchown32,207,PNR,PNR,207,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,207,PNR,207,0
> ++fchownat,298,260,260,325,54,291,250,254,278,278,289,289,54,291,291,298,0
> ++fcntl,55,72,72,55,25,55,70,70,55,55,55,55,25,55,55,55,0
> ++fcntl64,221,PNR,PNR,221,PNR,220,PNR,212,202,202,204,PNR,PNR,221,PNR,221,0
> ++fdatasync,148,75,75,148,83,152,73,73,148,148,148,148,83,148,148,148,0
> ++fgetxattr,231,193,193,231,10,229,185,185,243,243,214,214,10,229,229,231,0
> ++finit_module,350,313,313,379,273,348,307,312,333,333,353,353,273,344,344,368,0
> ++flistxattr,234,196,196,234,13,232,188,188,246,246,217,217,13,232,232,234,0
> ++flock,143,73,73,143,32,143,71,71,143,143,143,143,32,143,143,143,0
> ++fork,2,57,57,2,PNR,2,56,56,2,2,2,2,PNR,2,2,2,0
> ++fremovexattr,237,199,199,237,16,235,191,191,249,249,220,220,16,235,235,237,0
> ++fsconfig,431,431,431,431,431,431,431,431,431,431,431,431,431,431,431,431,0
> ++fsetxattr,228,190,190,228,7,226,182,182,240,240,211,211,7,226,226,228,0
> ++fsmount,432,432,432,432,432,432,432,432,432,432,432,432,432,432,432,432,0
> ++fsopen,430,430,430,430,430,430,430,430,430,430,430,430,430,430,430,430,0
> ++fspick,433,433,433,433,433,433,433,433,433,433,433,433,433,433,433,433,0
> ++fstat,108,5,5,108,80,108,5,5,28,28,108,108,80,108,108,108,0
> ++fstat64,197,PNR,PNR,197,PNR,215,PNR,PNR,112,112,197,PNR,PNR,197,PNR,197,0
> ++fstatat64,300,PNR,PNR,327,PNR,293,PNR,PNR,280,280,291,PNR,PNR,293,PNR,300,0
> ++fstatfs,100,138,138,100,44,100,135,135,100,100,100,100,44,100,100,100,0
> ++fstatfs64,269,PNR,PNR,267,PNR,256,PNR,218,299,299,253,253,PNR,266,266,269,0
> ++fsync,118,74,74,118,82,118,72,72,118,118,118,118,82,118,118,118,0
> ++ftime,35,PNR,PNR,PNR,PNR,35,PNR,PNR,PNR,PNR,35,35,PNR,PNR,PNR,PNR,0
> ++ftruncate,93,77,77,93,46,93,75,75,93,93,93,93,46,93,93,93,0
> ++ftruncate64,194,PNR,PNR,194,PNR,212,PNR,PNR,200,200,194,PNR,PNR,194,PNR,194,0
> ++futex,240,202,202,240,98,238,194,194,210,210,221,221,98,238,238,240,0
> ++futex_time64,422,PNR,PNR,422,PNR,422,PNR,422,422,PNR,422,PNR,PNR,422,PNR,422,0
> ++futimesat,299,261,261,326,PNR,292,251,255,279,279,290,290,PNR,292,292,299,0
> ++get_kernel_syms,130,177,PNR,PNR,PNR,130,170,170,PNR,PNR,130,130,PNR,130,130,PNR,0
> ++get_mempolicy,275,239,239,320,236,269,228,232,261,261,260,260,236,269,269,275,0
> ++get_robust_list,312,274,531,339,100,310,269,273,290,290,299,299,100,305,305,312,0
> ++get_thread_area,244,211,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,0
> ++get_tls,PNR,PNR,PNR,983046,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,0
> ++getcpu,318,309,309,345,168,312,271,275,296,296,302,302,168,311,311,318,0
> ++getcwd,183,79,79,183,17,203,77,77,110,110,182,182,17,183,183,183,0
> ++getdents,141,78,78,141,PNR,141,76,76,141,141,141,141,PNR,141,141,141,0
> ++getdents64,220,217,217,217,61,219,308,299,201,201,202,202,61,220,220,220,0
> ++getegid,50,108,108,50,177,50,106,106,50,50,50,50,177,50,202,50,0
> ++getegid32,202,PNR,PNR,202,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,202,PNR,202,0
> ++geteuid,49,107,107,49,175,49,105,105,49,49,49,49,175,49,201,49,0
> ++geteuid32,201,PNR,PNR,201,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,201,PNR,201,0
> ++getgid,47,104,104,47,176,47,102,102,47,47,47,47,176,47,200,47,0
> ++getgid32,200,PNR,PNR,200,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,200,PNR,200,0
> ++getgroups,80,115,115,80,158,80,113,113,80,80,80,80,158,80,205,80,0
> ++getgroups32,205,PNR,PNR,205,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,205,PNR,205,0
> ++getitimer,105,36,36,105,102,105,35,35,105,105,105,105,102,105,105,105,0
> ++getpeername,368,52,52,287,205,171,51,51,53,53,332,332,205,368,368,346,0
> ++getpgid,132,121,121,132,155,132,119,119,132,132,132,132,155,132,132,132,0
> ++getpgrp,65,111,111,65,PNR,65,109,109,65,65,65,65,PNR,65,65,65,0
> ++getpid,20,39,39,20,172,20,38,38,20,20,20,20,172,20,20,20,0
> ++getpmsg,188,181,181,PNR,PNR,208,174,174,PNR,PNR,187,187,PNR,188,188,PNR,0
> ++getppid,64,110,110,64,173,64,108,108,64,64,64,64,173,64,64,64,0
> ++getpriority,96,140,140,96,141,96,137,137,96,96,96,96,141,96,96,96,0
> ++getrandom,355,318,318,384,278,353,313,317,339,339,359,359,278,349,349,373,0
> ++getresgid,171,120,120,171,150,191,118,118,171,171,170,170,150,171,211,171,0
> ++getresgid32,211,PNR,PNR,211,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,211,PNR,211,0
> ++getresuid,165,118,118,165,148,186,116,116,165,165,165,165,148,165,209,165,0
> ++getresuid32,209,PNR,PNR,209,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,209,PNR,209,0
> ++getrlimit,76,97,97,PNR,163,76,95,95,76,76,76,76,163,76,191,76,0
> ++getrusage,77,98,98,77,165,77,96,96,77,77,77,77,165,77,77,77,0
> ++getsid,147,124,124,147,156,151,122,122,147,147,147,147,156,147,147,147,0
> ++getsockname,367,51,51,286,204,172,50,50,44,44,331,331,204,367,367,345,0
> ++getsockopt,365,55,542,295,209,173,54,54,182,182,340,340,209,365,365,354,0
> ++gettid,224,186,186,224,178,222,178,178,206,206,207,207,178,236,236,224,0
> ++gettimeofday,78,96,96,78,169,78,94,94,78,78,78,78,169,78,78,78,0
> ++getuid,24,102,102,24,174,24,100,100,24,24,24,24,174,24,199,24,0
> ++getuid32,199,PNR,PNR,199,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,199,PNR,199,0
> ++getxattr,229,191,191,229,8,227,183,183,241,241,212,212,8,227,227,229,0
> ++gtty,32,PNR,PNR,PNR,PNR,32,PNR,PNR,PNR,PNR,32,32,PNR,PNR,PNR,PNR,0
> ++idle,112,PNR,PNR,PNR,PNR,112,PNR,PNR,PNR,PNR,112,112,PNR,112,112,PNR,0
> ++init_module,128,175,175,128,105,128,168,168,128,128,128,128,105,128,128,128,0
> ++inotify_add_watch,292,254,254,317,27,285,244,248,270,270,276,276,27,285,285,291,0
> ++inotify_init,291,253,253,316,PNR,284,243,247,269,269,275,275,PNR,284,284,290,0
> ++inotify_init1,332,294,294,360,26,329,288,292,314,314,318,318,26,324,324,332,0
> ++inotify_rm_watch,293,255,255,318,28,286,245,249,271,271,277,277,28,286,286,292,0
> ++io_cancel,249,210,210,247,3,245,204,204,219,219,231,231,3,247,247,249,0
> ++io_destroy,246,207,207,244,1,242,201,201,216,216,228,228,1,244,244,246,0
> ++io_getevents,247,208,208,245,4,243,202,202,217,217,229,229,4,245,245,247,0
> ++io_pgetevents,385,333,333,399,292,368,328,332,350,350,388,388,292,382,382,PNR,0
> ++io_pgetevents_time64,416,PNR,PNR,416,PNR,416,PNR,416,416,PNR,416,PNR,PNR,416,PNR,416,0
> ++io_setup,245,206,543,243,0,241,200,200,215,215,227,227,0,243,243,245,0
> ++io_submit,248,209,544,246,2,244,203,203,218,218,230,230,2,246,246,248,0
> ++io_uring_enter,426,426,426,426,426,426,426,426,426,426,426,426,426,426,426,426,0
> ++io_uring_register,427,427,427,427,427,427,427,427,427,427,427,427,427,427,427,427,0
> ++io_uring_setup,425,425,425,425,425,425,425,425,425,425,425,425,425,425,425,425,0
> ++ioctl,54,16,514,54,29,54,15,15,54,54,54,54,29,54,54,54,0
> ++ioperm,101,173,173,PNR,PNR,101,PNR,PNR,PNR,PNR,101,101,PNR,101,PNR,PNR,0
> ++iopl,110,172,172,PNR,PNR,110,PNR,PNR,PNR,PNR,110,110,PNR,PNR,PNR,PNR,0
> ++ioprio_get,290,252,252,315,31,315,274,278,268,268,274,274,31,283,283,289,0
> ++ioprio_set,289,251,251,314,30,314,273,277,267,267,273,273,30,282,282,288,0
> ++ipc,117,PNR,PNR,PNR,PNR,117,PNR,PNR,PNR,PNR,117,117,PNR,117,117,117,0
> ++kcmp,349,312,312,378,272,347,306,311,332,332,354,354,272,343,343,367,0
> ++kexec_file_load,PNR,320,320,401,294,PNR,PNR,PNR,355,355,382,382,294,381,381,PNR,0
> ++kexec_load,283,246,528,347,104,311,270,274,300,300,268,268,104,277,277,283,0
> ++keyctl,288,250,250,311,219,282,241,245,266,266,271,271,219,280,280,287,0
> ++kill,37,62,62,37,129,37,60,60,37,37,37,37,129,37,37,37,0
> ++landlock_add_rule,445,445,445,445,445,445,445,445,445,445,445,445,445,445,445,445,0
> ++landlock_create_ruleset,444,444,444,444,444,444,444,444,444,444,444,444,444,444,444,444,0
> ++landlock_restrict_self,446,446,446,446,446,446,446,446,446,446,446,446,446,446,446,446,0
> ++lchown,16,94,94,16,PNR,16,92,92,16,16,16,16,PNR,16,198,16,0
> ++lchown32,198,PNR,PNR,198,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,198,PNR,198,0
> ++lgetxattr,230,192,192,230,9,228,184,184,242,242,213,213,9,228,228,230,0
> ++link,9,86,86,9,PNR,9,84,84,9,9,9,9,PNR,9,9,9,0
> ++linkat,303,265,265,330,37,296,255,259,283,283,294,294,37,296,296,303,0
> ++listen,363,50,50,284,201,174,49,49,32,32,329,329,201,363,363,343,0
> ++listxattr,232,194,194,232,11,230,186,186,244,244,215,215,11,230,230,232,0
> ++llistxattr,233,195,195,233,12,231,187,187,245,245,216,216,12,231,231,233,0
> ++lock,53,PNR,PNR,PNR,PNR,53,PNR,PNR,PNR,PNR,53,53,PNR,PNR,PNR,PNR,0
> ++lookup_dcookie,253,212,212,249,18,247,206,206,223,223,235,235,18,110,110,253,0
> ++lremovexattr,236,198,198,236,15,234,190,190,248,248,219,219,15,234,234,236,0
> ++lseek,19,8,8,19,62,19,8,8,19,19,19,19,62,19,19,19,0
> ++lsetxattr,227,189,189,227,6,225,181,181,239,239,210,210,6,225,225,227,0
> ++lstat,107,6,6,107,PNR,107,6,6,84,84,107,107,PNR,107,107,107,0
> ++lstat64,196,PNR,PNR,196,PNR,214,PNR,PNR,198,198,196,PNR,PNR,196,PNR,196,0
> ++madvise,219,28,28,220,233,218,27,27,119,119,205,205,233,219,219,219,0
> ++mbind,274,237,237,319,235,268,227,231,260,260,259,259,235,268,268,274,0
> ++membarrier,375,324,324,389,283,358,318,322,343,343,365,365,283,356,356,378,0
> ++memfd_create,356,319,319,385,279,354,314,318,340,340,360,360,279,350,350,374,0
> ++memfd_secret,447,447,447,PNR,447,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,0
> ++migrate_pages,294,256,256,400,238,287,246,250,272,272,258,258,238,287,287,294,0
> ++mincore,218,27,27,219,232,217,26,26,72,72,206,206,232,218,218,218,0
> ++mkdir,39,83,83,39,PNR,39,81,81,39,39,39,39,PNR,39,39,39,0
> ++mkdirat,296,258,258,323,34,289,248,252,276,276,287,287,34,289,289,296,0
> ++mknod,14,133,133,14,PNR,14,131,131,14,14,14,14,PNR,14,14,14,0
> ++mknodat,297,259,259,324,33,290,249,253,277,277,288,288,33,290,290,297,0
> ++mlock,150,149,149,150,228,154,146,146,150,150,150,150,228,150,150,150,0
> ++mlock2,376,325,325,390,284,359,319,323,345,345,378,378,284,374,374,379,0
> ++mlockall,152,151,151,152,230,156,148,148,152,152,152,152,230,152,152,152,0
> ++mmap,90,9,9,PNR,222,90,9,9,90,90,90,90,222,90,90,90,0
> ++mmap2,192,PNR,PNR,192,PNR,210,PNR,PNR,89,89,192,PNR,PNR,192,PNR,192,0
> ++modify_ldt,123,154,154,PNR,PNR,123,PNR,PNR,PNR,PNR,123,123,PNR,PNR,PNR,PNR,0
> ++mount,21,165,165,21,40,21,160,160,21,21,21,21,40,21,21,21,0
> ++mount_setattr,442,442,442,442,442,442,442,442,442,442,442,442,442,442,442,442,0
> ++move_mount,429,429,429,429,429,429,429,429,429,429,429,429,429,429,429,429,0
> ++move_pages,317,279,533,344,239,308,267,271,295,295,301,301,239,310,310,317,0
> ++mprotect,125,10,10,125,226,125,10,10,125,125,125,125,226,125,125,125,0
> ++mpx,56,PNR,PNR,PNR,PNR,56,PNR,PNR,PNR,PNR,56,56,PNR,PNR,PNR,PNR,0
> ++mq_getsetattr,282,245,245,279,185,276,235,239,234,234,267,267,185,276,276,282,0
> ++mq_notify,281,244,527,278,184,275,234,238,233,233,266,266,184,275,275,281,0
> ++mq_open,277,240,240,274,180,271,230,234,229,229,262,262,180,271,271,277,0
> ++mq_timedreceive,280,243,243,277,183,274,233,237,232,232,265,265,183,274,274,280,0
> ++mq_timedreceive_time64,419,PNR,PNR,419,PNR,419,PNR,419,419,PNR,419,PNR,PNR,419,PNR,419,0
> ++mq_timedsend,279,242,242,276,182,273,232,236,231,231,264,264,182,273,273,279,0
> ++mq_timedsend_time64,418,PNR,PNR,418,PNR,418,PNR,418,418,PNR,418,PNR,PNR,418,PNR,418,0
> ++mq_unlink,278,241,241,275,181,272,231,235,230,230,263,263,181,272,272,278,0
> ++mremap,163,25,25,163,216,167,24,24,163,163,163,163,216,163,163,163,0
> ++msgctl,402,71,71,304,187,402,69,69,191,191,402,402,187,402,402,402,0
> ++msgget,399,68,68,303,186,399,66,66,190,190,399,399,186,399,399,399,0
> ++msgrcv,401,70,70,302,188,401,68,68,189,189,401,401,188,401,401,401,0
> ++msgsnd,400,69,69,301,189,400,67,67,188,188,400,400,189,400,400,400,0
> ++msync,144,26,26,144,227,144,25,25,144,144,144,144,227,144,144,144,0
> ++multiplexer,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,201,201,PNR,PNR,PNR,PNR,0
> ++munlock,151,150,150,151,229,155,147,147,151,151,151,151,229,151,151,151,0
> ++munlockall,153,152,152,153,231,157,149,149,153,153,153,153,231,153,153,153,0
> ++munmap,91,11,11,91,215,91,11,11,91,91,91,91,215,91,91,91,0
> ++name_to_handle_at,341,303,303,370,264,339,298,303,325,325,345,345,264,335,335,359,0
> ++nanosleep,162,35,35,162,101,166,34,34,162,162,162,162,101,162,162,162,0
> ++newfstatat,PNR,262,262,PNR,79,PNR,252,256,PNR,PNR,PNR,291,79,PNR,293,PNR,0
> ++nfsservctl,169,180,PNR,169,42,189,173,173,PNR,PNR,168,168,42,169,169,169,0
> ++nice,34,PNR,PNR,34,PNR,34,PNR,PNR,34,34,34,34,PNR,34,34,34,0
> ++oldfstat,28,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,28,28,PNR,PNR,PNR,28,0
> ++oldlstat,84,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,84,84,PNR,PNR,PNR,84,0
> ++oldolduname,59,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,59,59,PNR,PNR,PNR,PNR,0
> ++oldstat,18,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,18,18,PNR,PNR,PNR,18,0
> ++olduname,109,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,109,109,PNR,PNR,PNR,109,0
> ++open,5,2,2,5,PNR,5,2,2,5,5,5,5,PNR,5,5,5,0
> ++open_by_handle_at,342,304,304,371,265,340,299,304,326,326,346,346,265,336,336,360,0
> ++open_tree,428,428,428,428,428,428,428,428,428,428,428,428,428,428,428,428,0
> ++openat,295,257,257,322,56,288,247,251,275,275,286,286,56,288,288,295,0
> ++openat2,437,437,437,437,437,437,437,437,437,437,437,437,437,437,437,437,0
> ++pause,29,34,34,29,PNR,29,33,33,29,29,29,29,PNR,29,29,29,0
> ++pciconfig_iobase,PNR,PNR,PNR,271,PNR,PNR,PNR,PNR,PNR,PNR,200,200,PNR,PNR,PNR,PNR,0
> ++pciconfig_read,PNR,PNR,PNR,272,PNR,PNR,PNR,PNR,PNR,PNR,198,198,PNR,PNR,PNR,PNR,0
> ++pciconfig_write,PNR,PNR,PNR,273,PNR,PNR,PNR,PNR,PNR,PNR,199,199,PNR,PNR,PNR,PNR,0
> ++perf_event_open,336,298,298,364,241,333,292,296,318,318,319,319,241,331,331,336,0
> ++personality,136,135,135,136,92,136,132,132,136,136,136,136,92,136,136,136,0
> ++pidfd_getfd,438,438,438,438,438,438,438,438,438,438,438,438,438,438,438,438,0
> ++pidfd_open,434,434,434,434,434,434,434,434,434,434,434,434,434,434,434,434,0
> ++pidfd_send_signal,424,424,424,424,424,424,424,424,424,424,424,424,424,424,424,424,0
> ++pipe,42,22,22,42,PNR,42,21,21,42,42,42,42,PNR,42,42,42,0
> ++pipe2,331,293,293,359,59,328,287,291,313,313,317,317,59,325,325,331,0
> ++pivot_root,217,155,155,218,41,216,151,151,67,67,203,203,41,217,217,217,0
> ++pkey_alloc,381,330,330,395,289,364,324,328,352,352,384,384,289,385,385,385,0
> ++pkey_free,382,331,331,396,290,365,325,329,353,353,385,385,290,386,386,386,0
> ++pkey_mprotect,380,329,329,394,288,363,323,327,351,351,386,386,288,384,384,384,0
> ++poll,168,7,7,168,PNR,188,7,7,168,168,167,167,PNR,168,168,168,0
> ++ppoll,309,271,271,336,73,302,261,265,274,274,281,281,73,302,302,309,0
> ++ppoll_time64,414,PNR,PNR,414,PNR,414,PNR,414,414,PNR,414,PNR,PNR,414,PNR,414,0
> ++prctl,172,157,157,172,167,192,153,153,172,172,171,171,167,172,172,172,0
> ++pread64,180,17,17,180,67,200,16,16,108,108,179,179,67,180,180,180,0
> ++preadv,333,295,534,361,69,330,289,293,315,315,320,320,69,328,328,333,0
> ++preadv2,378,327,546,392,286,361,321,325,347,347,380,380,286,376,376,381,0
> ++prlimit64,340,302,302,369,261,338,297,302,321,321,325,325,261,334,334,339,0
> ++process_madvise,440,440,440,440,440,440,440,440,440,440,440,440,440,440,440,440,0
> ++process_vm_readv,347,310,539,376,270,345,304,309,330,330,351,351,270,340,340,365,0
> ++process_vm_writev,348,311,540,377,271,346,305,310,331,331,352,352,271,341,341,366,0
> ++prof,44,PNR,PNR,PNR,PNR,44,PNR,PNR,PNR,PNR,44,44,PNR,PNR,PNR,PNR,0
> ++profil,98,PNR,PNR,PNR,PNR,98,PNR,PNR,PNR,PNR,98,98,PNR,PNR,PNR,PNR,0
> ++pselect6,308,270,270,335,72,301,260,264,273,273,280,280,72,301,301,308,0
> ++pselect6_time64,413,PNR,PNR,413,PNR,413,PNR,413,413,PNR,413,PNR,PNR,413,PNR,413,0
> ++ptrace,26,101,521,26,117,26,99,99,26,26,26,26,117,26,26,26,0
> ++putpmsg,189,182,182,PNR,PNR,209,175,175,PNR,PNR,188,188,PNR,189,189,PNR,0
> ++pwrite64,181,18,18,181,68,201,17,17,109,109,180,180,68,181,181,181,0
> ++pwritev,334,296,535,362,70,331,290,294,316,316,321,321,70,329,329,334,0
> ++pwritev2,379,328,547,393,287,362,322,326,348,348,381,381,287,377,377,382,0
> ++query_module,167,178,PNR,PNR,PNR,187,171,171,PNR,PNR,166,166,PNR,167,167,PNR,0
> ++quotactl,131,179,179,131,60,131,172,172,131,131,131,131,60,131,131,131,0
> ++quotactl_fd,443,443,443,443,443,443,443,443,443,443,443,443,443,443,443,443,0
> ++read,3,0,0,3,63,3,0,0,3,3,3,3,63,3,3,3,0
> ++readahead,225,187,187,225,213,223,179,179,207,207,191,191,213,222,222,225,0
> ++readdir,89,PNR,PNR,PNR,PNR,89,PNR,PNR,PNR,PNR,89,89,PNR,89,89,89,0
> ++readlink,85,89,89,85,PNR,85,87,87,85,85,85,85,PNR,85,85,85,0
> ++readlinkat,305,267,267,332,78,298,257,261,285,285,296,296,78,298,298,305,0
> ++readv,145,19,515,145,65,145,18,18,145,145,145,145,65,145,145,145,0
> ++reboot,88,169,169,88,142,88,164,164,88,88,88,88,142,88,88,88,0
> ++recv,PNR,PNR,PNR,291,PNR,175,PNR,PNR,98,98,336,336,PNR,PNR,PNR,350,0
> ++recvfrom,371,45,517,292,207,176,44,44,123,123,337,337,207,371,371,351,0
> ++recvmmsg,337,299,537,365,243,335,294,298,319,319,343,343,243,357,357,357,0
> ++recvmmsg_time64,417,PNR,PNR,417,PNR,417,PNR,417,417,PNR,417,PNR,PNR,417,PNR,417,0
> ++recvmsg,372,47,519,297,212,177,46,46,184,184,342,342,212,372,372,356,0
> ++remap_file_pages,257,216,216,253,234,251,210,210,227,227,239,239,234,267,267,257,0
> ++removexattr,235,197,197,235,14,233,189,189,247,247,218,218,14,233,233,235,0
> ++rename,38,82,82,38,PNR,38,80,80,38,38,38,38,PNR,38,38,38,0
> ++renameat,302,264,264,329,38,295,254,258,282,282,293,293,PNR,295,295,302,0
> ++renameat2,353,316,316,382,276,351,311,315,337,337,357,357,276,347,347,371,0
> ++request_key,287,249,249,310,218,281,240,244,265,265,270,270,218,279,279,286,0
> ++restart_syscall,0,219,219,0,128,253,213,214,0,0,0,0,128,7,7,0,0
> ++riscv_flush_icache,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,259,PNR,PNR,PNR,0
> ++rmdir,40,84,84,40,PNR,40,82,82,40,40,40,40,PNR,40,40,40,0
> ++rseq,386,334,334,398,293,367,327,331,354,354,387,387,293,383,383,387,0
> ++rt_sigaction,174,13,512,174,134,194,13,13,174,174,173,173,134,174,174,174,0
> ++rt_sigpending,176,127,522,176,136,196,125,125,176,176,175,175,136,176,176,176,0
> ++rt_sigprocmask,175,14,14,175,135,195,14,14,175,175,174,174,135,175,175,175,0
> ++rt_sigqueueinfo,178,129,524,178,138,198,127,127,178,178,177,177,138,178,178,178,0
> ++rt_sigreturn,173,15,513,173,139,193,211,211,173,173,172,172,139,173,173,173,0
> ++rt_sigsuspend,179,130,130,179,133,199,128,128,179,179,178,178,133,179,179,179,0
> ++rt_sigtimedwait,177,128,523,177,137,197,126,126,177,177,176,176,137,177,177,177,0
> ++rt_sigtimedwait_time64,421,PNR,PNR,421,PNR,421,PNR,421,421,PNR,421,PNR,PNR,421,PNR,421,0
> ++rt_tgsigqueueinfo,335,297,536,363,240,332,291,295,317,317,322,322,240,330,330,335,0
> ++rtas,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,255,255,PNR,PNR,PNR,PNR,0
> ++s390_guarded_storage,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,378,378,PNR,0
> ++s390_pci_mmio_read,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,353,353,PNR,0
> ++s390_pci_mmio_write,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,352,352,PNR,0
> ++s390_runtime_instr,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,342,342,PNR,0
> ++s390_sthyi,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,380,380,PNR,0
> ++sched_get_priority_max,159,146,146,159,125,163,143,143,159,159,159,159,125,159,159,159,0
> ++sched_get_priority_min,160,147,147,160,126,164,144,144,160,160,160,160,126,160,160,160,0
> ++sched_getaffinity,242,204,204,242,123,240,196,196,212,212,223,223,123,240,240,242,0
> ++sched_getattr,352,315,315,381,275,350,310,314,335,335,356,356,275,346,346,369,0
> ++sched_getparam,155,143,143,155,121,159,140,140,155,155,155,155,121,155,155,155,0
> ++sched_getscheduler,157,145,145,157,120,161,142,142,157,157,157,157,120,157,157,157,0
> ++sched_rr_get_interval,161,148,148,161,127,165,145,145,161,161,161,161,127,161,161,161,0
> ++sched_rr_get_interval_time64,423,PNR,PNR,423,PNR,423,PNR,423,423,PNR,423,PNR,PNR,423,PNR,423,0
> ++sched_setaffinity,241,203,203,241,122,239,195,195,211,211,222,222,122,239,239,241,0
> ++sched_setattr,351,314,314,380,274,349,309,313,334,334,355,355,274,345,345,370,0
> ++sched_setparam,154,142,142,154,118,158,139,139,154,154,154,154,118,154,154,154,0
> ++sched_setscheduler,156,144,144,156,119,160,141,141,156,156,156,156,119,156,156,156,0
> ++sched_yield,158,24,24,158,124,162,23,23,158,158,158,158,124,158,158,158,0
> ++seccomp,354,317,317,383,277,352,312,316,338,338,358,358,277,348,348,372,0
> ++security,PNR,185,185,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,0
> ++select,82,23,23,PNR,PNR,PNR,PNR,PNR,PNR,PNR,82,82,PNR,PNR,142,PNR,0
> ++semctl,394,66,66,300,191,394,64,64,187,187,394,394,191,394,394,394,0
> ++semget,393,64,64,299,190,393,62,62,186,186,393,393,190,393,393,393,0
> ++semop,PNR,65,65,298,193,PNR,63,63,185,185,PNR,PNR,193,PNR,PNR,PNR,0
> ++semtimedop,PNR,220,220,312,192,PNR,214,215,228,228,PNR,392,192,PNR,392,PNR,0
> ++semtimedop_time64,420,PNR,PNR,420,PNR,420,PNR,420,420,PNR,420,PNR,PNR,420,PNR,420,0
> ++send,PNR,PNR,PNR,289,PNR,178,PNR,PNR,58,58,334,334,PNR,PNR,PNR,348,0
> ++sendfile,187,40,40,187,71,207,39,39,122,122,186,186,71,187,187,187,0
> ++sendfile64,239,PNR,PNR,239,PNR,237,PNR,219,209,209,226,PNR,PNR,223,PNR,239,0
> ++sendmmsg,345,307,538,374,269,343,302,307,329,329,349,349,269,358,358,363,0
> ++sendmsg,370,46,518,296,211,179,45,45,183,183,341,341,211,370,370,355,0
> ++sendto,369,44,44,290,206,180,43,43,82,82,335,335,206,369,369,349,0
> ++set_mempolicy,276,238,238,321,237,270,229,233,262,262,261,261,237,270,270,276,0
> ++set_robust_list,311,273,530,338,99,309,268,272,289,289,300,300,99,304,304,311,0
> ++set_thread_area,243,205,PNR,PNR,PNR,283,242,246,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,0
> ++set_tid_address,258,218,218,256,96,252,212,213,237,237,232,232,96,252,252,258,0
> ++set_tls,PNR,PNR,PNR,983045,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,0
> ++setdomainname,121,171,171,121,162,121,166,166,121,121,121,121,162,121,121,121,0
> ++setfsgid,139,123,123,139,152,139,121,121,139,139,139,139,152,139,216,139,0
> ++setfsgid32,216,PNR,PNR,216,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,216,PNR,216,0
> ++setfsuid,138,122,122,138,151,138,120,120,138,138,138,138,151,138,215,138,0
> ++setfsuid32,215,PNR,PNR,215,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,215,PNR,215,0
> ++setgid,46,106,106,46,144,46,104,104,46,46,46,46,144,46,214,46,0
> ++setgid32,214,PNR,PNR,214,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,214,PNR,214,0
> ++setgroups,81,116,116,81,159,81,114,114,81,81,81,81,159,81,206,81,0
> ++setgroups32,206,PNR,PNR,206,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,206,PNR,206,0
> ++sethostname,74,170,170,74,161,74,165,165,74,74,74,74,161,74,74,74,0
> ++setitimer,104,38,38,104,103,104,36,36,104,104,104,104,103,104,104,104,0
> ++setns,346,308,308,375,268,344,303,308,328,328,350,350,268,339,339,364,0
> ++setpgid,57,109,109,57,154,57,107,107,57,57,57,57,154,57,57,57,0
> ++setpriority,97,141,141,97,140,97,138,138,97,97,97,97,140,97,97,97,0
> ++setregid,71,114,114,71,143,71,112,112,71,71,71,71,143,71,204,71,0
> ++setregid32,204,PNR,PNR,204,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,204,PNR,204,0
> ++setresgid,170,119,119,170,149,190,117,117,170,170,169,169,149,170,210,170,0
> ++setresgid32,210,PNR,PNR,210,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,210,PNR,210,0
> ++setresuid,164,117,117,164,147,185,115,115,164,164,164,164,147,164,208,164,0
> ++setresuid32,208,PNR,PNR,208,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,208,PNR,208,0
> ++setreuid,70,113,113,70,145,70,111,111,70,70,70,70,145,70,203,70,0
> ++setreuid32,203,PNR,PNR,203,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,203,PNR,203,0
> ++setrlimit,75,160,160,75,164,75,155,155,75,75,75,75,164,75,75,75,0
> ++setsid,66,112,112,66,157,66,110,110,66,66,66,66,157,66,66,66,0
> ++setsockopt,366,54,541,294,208,181,53,53,181,181,339,339,208,366,366,353,0
> ++settimeofday,79,164,164,79,170,79,159,159,79,79,79,79,170,79,79,79,0
> ++setuid,23,105,105,23,146,23,103,103,23,23,23,23,146,23,213,23,0
> ++setuid32,213,PNR,PNR,213,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,213,PNR,213,0
> ++setxattr,226,188,188,226,5,224,180,180,238,238,209,209,5,224,224,226,0
> ++sgetmask,68,PNR,PNR,PNR,PNR,68,PNR,PNR,68,68,68,68,PNR,PNR,PNR,68,0
> ++shmat,397,30,30,305,196,397,29,29,192,192,397,397,196,397,397,397,0
> ++shmctl,396,31,31,308,195,396,30,30,195,195,396,396,195,396,396,396,0
> ++shmdt,398,67,67,306,197,398,65,65,193,193,398,398,197,398,398,398,0
> ++shmget,395,29,29,307,194,395,28,28,194,194,395,395,194,395,395,395,0
> ++shutdown,373,48,48,293,210,182,47,47,117,117,338,338,210,373,373,352,0
> ++sigaction,67,PNR,PNR,67,PNR,67,PNR,PNR,PNR,PNR,67,67,PNR,67,67,67,0
> ++sigaltstack,186,131,525,186,132,206,129,129,166,166,185,185,132,186,186,186,0
> ++signal,48,PNR,PNR,PNR,PNR,48,PNR,PNR,48,48,48,48,PNR,48,48,48,0
> ++signalfd,321,282,282,349,PNR,317,276,280,302,302,305,305,PNR,316,316,321,0
> ++signalfd4,327,289,289,355,74,324,283,287,309,309,313,313,74,322,322,327,0
> ++sigpending,73,PNR,PNR,73,PNR,73,PNR,PNR,73,73,73,73,PNR,73,73,73,0
> ++sigprocmask,126,PNR,PNR,126,PNR,126,PNR,PNR,126,126,126,126,PNR,126,126,126,0
> ++sigreturn,119,PNR,PNR,119,PNR,119,PNR,PNR,PNR,PNR,119,119,PNR,119,119,119,0
> ++sigsuspend,72,PNR,PNR,72,PNR,72,PNR,PNR,PNR,PNR,72,72,PNR,72,72,72,0
> ++socket,359,41,41,281,198,183,40,40,17,17,326,326,198,359,359,340,0
> ++socketcall,102,PNR,PNR,PNR,PNR,102,PNR,PNR,PNR,PNR,102,102,PNR,102,102,102,0
> ++socketpair,360,53,53,288,199,184,52,52,56,56,333,333,199,360,360,347,0
> ++splice,313,275,275,340,76,304,263,267,291,291,283,283,76,306,306,313,0
> ++spu_create,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,279,279,PNR,PNR,PNR,PNR,0
> ++spu_run,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,278,278,PNR,PNR,PNR,PNR,0
> ++ssetmask,69,PNR,PNR,PNR,PNR,69,PNR,PNR,69,69,69,69,PNR,PNR,PNR,69,0
> ++stat,106,4,4,106,PNR,106,4,4,18,18,106,106,PNR,106,106,106,0
> ++stat64,195,PNR,PNR,195,PNR,213,PNR,PNR,101,101,195,PNR,PNR,195,PNR,195,0
> ++statfs,99,137,137,99,43,99,134,134,99,99,99,99,43,99,99,99,0
> ++statfs64,268,PNR,PNR,266,PNR,255,PNR,217,298,298,252,252,PNR,265,265,268,0
> ++statx,383,332,332,397,291,366,326,330,349,349,383,383,291,379,379,383,0
> ++stime,25,PNR,PNR,PNR,PNR,25,PNR,PNR,25,25,25,25,PNR,25,PNR,25,0
> ++stty,31,PNR,PNR,PNR,PNR,31,PNR,PNR,PNR,PNR,31,31,PNR,PNR,PNR,PNR,0
> ++subpage_prot,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,310,310,PNR,PNR,PNR,PNR,0
> ++swapcontext,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,249,249,PNR,PNR,PNR,PNR,0
> ++swapoff,115,168,168,115,225,115,163,163,115,115,115,115,225,115,115,115,0
> ++swapon,87,167,167,87,224,87,162,162,87,87,87,87,224,87,87,87,0
> ++switch_endian,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,363,363,PNR,PNR,PNR,PNR,0
> ++symlink,83,88,88,83,PNR,83,86,86,83,83,83,83,PNR,83,83,83,0
> ++symlinkat,304,266,266,331,36,297,256,260,284,284,295,295,36,297,297,304,0
> ++sync,36,162,162,36,81,36,157,157,36,36,36,36,81,36,36,36,0
> ++sync_file_range,314,277,277,PNR,84,305,264,268,292,292,PNR,PNR,84,307,307,314,0
> ++sync_file_range2,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,308,308,PNR,PNR,PNR,PNR,0
> ++syncfs,344,306,306,373,267,342,301,306,327,327,348,348,267,338,338,362,0
> ++sys_debug_setcontext,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,256,256,PNR,PNR,PNR,PNR,0
> ++syscall,PNR,PNR,PNR,PNR,PNR,0,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,0
> ++sysfs,135,139,139,135,PNR,135,136,136,135,135,135,135,PNR,135,135,135,0
> ++sysinfo,116,99,99,116,179,116,97,97,116,116,116,116,179,116,116,116,0
> ++syslog,103,103,103,103,116,103,101,101,103,103,103,103,116,103,103,103,0
> ++sysmips,PNR,PNR,PNR,PNR,PNR,149,199,199,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,0
> ++tee,315,276,276,342,77,306,265,269,293,293,284,284,77,308,308,315,0
> ++tgkill,270,234,234,268,131,266,225,229,259,259,250,250,131,241,241,270,0
> ++time,13,201,201,PNR,PNR,13,PNR,PNR,13,13,13,13,PNR,13,PNR,13,0
> ++timer_create,259,222,526,257,107,257,216,220,250,250,240,240,107,254,254,259,0
> ++timer_delete,263,226,226,261,111,261,220,224,254,254,244,244,111,258,258,263,0
> ++timer_getoverrun,262,225,225,260,109,260,219,223,253,253,243,243,109,257,257,262,0
> ++timer_gettime,261,224,224,259,108,259,218,222,252,252,242,242,108,256,256,261,0
> ++timer_gettime64,408,PNR,PNR,408,PNR,408,PNR,408,408,PNR,408,PNR,PNR,408,PNR,408,0
> ++timer_settime,260,223,223,258,110,258,217,221,251,251,241,241,110,255,255,260,0
> ++timer_settime64,409,PNR,PNR,409,PNR,409,PNR,409,409,PNR,409,PNR,PNR,409,PNR,409,0
> ++timerfd,PNR,PNR,PNR,PNR,PNR,318,277,281,PNR,PNR,PNR,PNR,PNR,317,317,PNR,0
> ++timerfd_create,322,283,283,350,85,321,280,284,306,306,306,306,85,319,319,322,0
> ++timerfd_gettime,326,287,287,354,87,322,281,285,308,308,312,312,87,321,321,326,0
> ++timerfd_gettime64,410,PNR,PNR,410,PNR,410,PNR,410,410,PNR,410,PNR,PNR,410,PNR,410,0
> ++timerfd_settime,325,286,286,353,86,323,282,286,307,307,311,311,86,320,320,325,0
> ++timerfd_settime64,411,PNR,PNR,411,PNR,411,PNR,411,411,PNR,411,PNR,PNR,411,PNR,411,0
> ++times,43,100,100,43,153,43,98,98,43,43,43,43,153,43,43,43,0
> ++tkill,238,200,200,238,130,236,192,192,208,208,208,208,130,237,237,238,0
> ++truncate,92,76,76,92,45,92,74,74,92,92,92,92,45,92,92,92,0
> ++truncate64,193,PNR,PNR,193,PNR,211,PNR,PNR,199,199,193,PNR,PNR,193,PNR,193,0
> ++tuxcall,PNR,184,184,PNR,PNR,PNR,PNR,PNR,PNR,PNR,225,225,PNR,PNR,PNR,PNR,0
> ++ugetrlimit,191,PNR,PNR,191,PNR,PNR,PNR,PNR,PNR,PNR,190,190,PNR,191,PNR,191,0
> ++ulimit,58,PNR,PNR,PNR,PNR,58,PNR,PNR,PNR,PNR,58,58,PNR,PNR,PNR,PNR,0
> ++umask,60,95,95,60,166,60,93,93,60,60,60,60,166,60,60,60,0
> ++umount,22,PNR,PNR,PNR,PNR,22,PNR,PNR,PNR,PNR,22,22,PNR,22,22,22,0
> ++umount2,52,166,166,52,39,52,161,161,52,52,52,52,39,52,52,52,0
> ++uname,122,63,63,122,160,122,61,61,59,59,122,122,160,122,122,122,0
> ++unlink,10,87,87,10,PNR,10,85,85,10,10,10,10,PNR,10,10,10,0
> ++unlinkat,301,263,263,328,35,294,253,257,281,281,292,292,35,294,294,301,0
> ++unshare,310,272,272,337,97,303,262,266,288,288,282,282,97,303,303,310,0
> ++uselib,86,134,PNR,86,PNR,86,PNR,PNR,86,86,86,86,PNR,86,86,86,0
> ++userfaultfd,374,323,323,388,282,357,317,321,344,344,364,364,282,355,355,377,0
> ++usr26,PNR,PNR,PNR,983043,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,0
> ++usr32,PNR,PNR,PNR,983044,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,0
> ++ustat,62,136,136,62,PNR,62,133,133,62,62,62,62,PNR,62,62,62,0
> ++utime,30,132,132,PNR,PNR,30,130,130,30,30,30,30,PNR,30,30,30,0
> ++utimensat,320,280,280,348,88,316,275,279,301,301,304,304,88,315,315,320,0
> ++utimensat_time64,412,PNR,PNR,412,PNR,412,PNR,412,412,PNR,412,PNR,PNR,412,PNR,412,0
> ++utimes,271,235,235,269,PNR,267,226,230,336,336,251,251,PNR,313,313,271,0
> ++vfork,190,58,58,190,PNR,PNR,PNR,PNR,113,113,189,189,PNR,190,190,190,0
> ++vhangup,111,153,153,111,58,111,150,150,111,111,111,111,58,111,111,111,0
> ++vm86,166,PNR,PNR,PNR,PNR,113,PNR,PNR,PNR,PNR,113,113,PNR,PNR,PNR,PNR,0
> ++vm86old,113,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,0
> ++vmsplice,316,278,532,343,75,307,266,270,294,294,285,285,75,309,309,316,0
> ++vserver,273,236,PNR,313,PNR,277,236,240,PNR,PNR,PNR,PNR,PNR,PNR,PNR,PNR,0
> ++wait4,114,61,61,114,260,114,59,59,114,114,114,114,260,114,114,114,0
> ++waitid,284,247,529,280,95,278,237,241,235,235,272,272,95,281,281,284,0
> ++waitpid,7,PNR,PNR,PNR,PNR,7,PNR,PNR,7,7,7,7,PNR,PNR,PNR,7,0
> ++write,4,1,1,4,64,4,1,1,4,4,4,4,64,4,4,4,0
> ++writev,146,20,516,146,66,146,19,19,146,146,146,146,66,146,146,146,0
> +--
> +2.33.0
> +
> diff --git a/meta/recipes-support/libseccomp/files/0003-syscalls-update-the-syscall-defs-for-Linux-v5.14.x.patch b/meta/recipes-support/libseccomp/files/0003-syscalls-update-the-syscall-defs-for-Linux-v5.14.x.patch
> new file mode 100644
> index 0000000000..a81d5187b4
> --- /dev/null
> +++ b/meta/recipes-support/libseccomp/files/0003-syscalls-update-the-syscall-defs-for-Linux-v5.14.x.patch
> @@ -0,0 +1,40 @@
> +From 013bf4503b6435e3d12715f00919ea78e5a46226 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Tue, 8 Jun 2021 20:42:19 -0700
> +Subject: [PATCH 3/4] syscalls: update the syscall defs for Linux v5.14.x
> +
> +Upstream-Status: Submitted [https://github.com/seccomp/libseccomp/pull/327]
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + include/seccomp-syscalls.h | 7 +++++++
> + 1 file changed, 7 insertions(+)
> +
> +diff --git a/include/seccomp-syscalls.h b/include/seccomp-syscalls.h
> +index 4ff814c..dd347d3 100644
> +--- a/include/seccomp-syscalls.h
> ++++ b/include/seccomp-syscalls.h
> +@@ -284,6 +284,7 @@
> + #define __PNR_clock_nanosleep                 -10250
> + #define __PNR_gettimeofday                    -10251
> + #define __PNR_fcntl                           -10252
> ++#define __PNR_quotactl_path                   -10253
> +
> + /*
> +  * libseccomp syscall definitions
> +@@ -1557,6 +1558,12 @@
> + #define __SNR_riscv_flush_icache      __PNR_riscv_flush_icache
> + #endif
> +
> ++#ifdef __NR_quotactl_path
> ++#define __SNR_quotactl_path       __NR_quotactl_path
> ++#else
> ++#define __SNR_quotactl_path       __PNR_quotactl_path
> ++#endif
> ++
> + #ifdef __NR_rmdir
> + #define __SNR_rmdir                   __NR_rmdir
> + #else
> +--
> +2.33.0
> +
> diff --git a/meta/recipes-support/libseccomp/files/0004-man-Add-RISCV64-to-arch-list.patch b/meta/recipes-support/libseccomp/files/0004-man-Add-RISCV64-to-arch-list.patch
> new file mode 100644
> index 0000000000..225c466b41
> --- /dev/null
> +++ b/meta/recipes-support/libseccomp/files/0004-man-Add-RISCV64-to-arch-list.patch
> @@ -0,0 +1,28 @@
> +From 0261a7a58bfd43b2bf01a20845661a90c967ddfc Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 28 Jul 2021 11:03:24 -0700
> +Subject: [PATCH 4/4] man: Add RISCV64 to arch list
> +
> +Upstream-Status: Submitted [https://github.com/seccomp/libseccomp/pull/327]
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + doc/man/man1/scmp_sys_resolver.1 | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/doc/man/man1/scmp_sys_resolver.1 b/doc/man/man1/scmp_sys_resolver.1
> +index fc68d18..74d8a8a 100644
> +--- a/doc/man/man1/scmp_sys_resolver.1
> ++++ b/doc/man/man1/scmp_sys_resolver.1
> +@@ -36,7 +36,7 @@ The architecture to use for resolving the system call.  Valid
> + .I ARCH
> + values are "x86", "x86_64", "x32", "arm", "aarch64", "mips", "mipsel", "mips64",
> + "mipsel64", "mips64n32", "mipsel64n32", "parisc", "parisc64", "ppc", "ppc64",
> +-"ppc64le", "riscv32", "s390", "s390x", "sheb" and "sh".
> ++"ppc64le", "riscv64", "riscv32", "s390", "s390x", "sheb" and "sh".
> + .TP
> + .B \-t
> + If necessary, translate the system call name to the proper system call number,
> +--
> +2.33.0
> +
> diff --git a/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb b/meta/recipes-support/libseccomp/libseccomp_2.5.2.bb
> similarity index 86%
> rename from meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
> rename to meta/recipes-support/libseccomp/libseccomp_2.5.2.bb
> index 74bface4a1..83976e4ca4 100644
> --- a/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
> +++ b/meta/recipes-support/libseccomp/libseccomp_2.5.2.bb
> @@ -8,12 +8,14 @@ LIC_FILES_CHKSUM = "file://LICENSE;beginline=0;endline=1;md5=8eac08d22113880357c
>  DEPENDS += "gperf-native"
>
>  PV .= "+git${SRCPV}"
> -SRCREV = "5822e50c2920ce597d038077dea4a0eedf193f86"
> +SRCREV = "4f34c6eb17c2ffcb0fce5911ddbc161d97517476"
>
>  SRC_URI = "git://github.com/seccomp/libseccomp.git;branch=main \
> -           file://0001-configure.ac-Bump-version-to-2.5.99.patch \
>             file://0001-arch-Add-riscv32-architecture-support.patch \
> -           file://0002-Regenerate-syscall-cvs-file-from-5.13-rc5-kernel.patch \
> +           file://0001-configure.ac-Bump-version-to-2.5.99.patch \
> +           file://0002-syscalls-update-the-syscall-defs-for-Linux-v5.14.3.patch \
> +           file://0003-syscalls-update-the-syscall-defs-for-Linux-v5.14.x.patch \
> +           file://0004-man-Add-RISCV64-to-arch-list.patch \
>             file://run-ptest \
>             "
>
> --
> 2.33.0
>

