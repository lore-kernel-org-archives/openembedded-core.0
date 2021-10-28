Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E4C9C433FE
	for <webhook@archiver.kernel.org>; Thu, 28 Oct 2021 23:38:18 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web11.1887.1635464297510127873
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 16:38:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OI4qMiDJ;
 spf=pass (domain: gmail.com, ip: 209.85.222.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id y10so7573668qkp.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 16:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6TIC8puJfjP8K+FYVKPBkAd35beC5qg1u0nn37B6Ec8=;
        b=OI4qMiDJ8NdO0WimbT6ohp9iJoySKw5Ge9G/4ZXDEYwxAQOALO4g8JZhA9BB5QGKrc
         vfj7JU4bQ27RBKqOmAH56//n87GVJqkZh1HU4xHaNWN2l2dADrO77E0ti4dwK+ZgHH/K
         mWHdXQHh4qxzBXyepZJLXVgF1/jjGiw6AzX3NJ7qkaB4fyIJrzwf0qStdiYAZjyn9inH
         vq/evw3Pkgd3domZdcl1JyzE8FxgGsdYg5WT4PPgb4ywn48WS5NLeiEIw1SqdOGE2SrF
         3V6qqctiVn/pf4OeXMXjp2Pdq2NvWRlhZ/33fknrTs7K2sHXex2P02ZspXMzLFr+Ad+8
         RB3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6TIC8puJfjP8K+FYVKPBkAd35beC5qg1u0nn37B6Ec8=;
        b=HDOF2W3WbGpYn7O/1/oK8n0GJ+Cw0DwBZQUNXcou1QEmXqweFvuWYsACztm+SXtPe0
         CG7cMMOTih/eLsGSDzR7vEPgXAoUHe0n7iy+VtGf8HJO4R91j7r6GCTiv/x48pZLdwqs
         CVFih7J/0LGrGLCIrEvYbnk/NtkPJPx/V+QcI5XcQ4ehAZyhvhfp/KYaMs32osMAGta3
         YQOrFZUZTT5BXzTja/wpau3gGrboF7aT2UAqmsuzRtkFVHnGvWmIDeFcxNV0LbsLTh9R
         yo0VVpp5irJrAPUdtJ2knNJmUU/6DBPdyeK29fTuzNXgW8L2eSME1uzSCvwDubYBU/I8
         3Iug==
X-Gm-Message-State: AOAM533uufU8skHawefU6vfY6XT67NahJvfp3nhfcU/RhKLR0xaTwNgz
	rROQZDolnrW9tEI+5QdzVfwW6WLnC+2sdoREFYM=
X-Google-Smtp-Source: 
 ABdhPJwoY/xnx3QbD6gM3jQ/VkSs9oflaTsZniNp0a4GsDXLZAvojv0lcCQM3t6GOv6K+n3uCX0tix3lpzpjb4SLlVs=
X-Received: by 2002:ae9:de07:: with SMTP id s7mr6075728qkf.47.1635464296539;
 Thu, 28 Oct 2021 16:38:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211028232602.3402356-1-richard.purdie@linuxfoundation.org>
 <20211028232602.3402356-2-richard.purdie@linuxfoundation.org>
In-Reply-To: <20211028232602.3402356-2-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Oct 2021 16:37:49 -0700
Message-ID: 
 <CAMKF1sr=EE7O_hDysRnUzj5wF=R8hubvef9jz4322m6sDOP17g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] gcc: Drop testsuite failure fix patch
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Oct 2021 23:38:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157619

On Thu, Oct 28, 2021 at 4:26 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> This patch has headers as if it were submitted upstream but I can't find any
> record of it. I did try tests with it removed, building the referenced testsuite
> files with -Werror and it all works just fine with no warnings or errors (tested
> on MACHINE=qemux86). I suspect this was fixed in gcc itself in other ways.
>

LGTM

> As such I think this patch isn't needed and suggest we drop it. If there is
> a reason it is needed, please report along with an example of how to reproduce
> issues.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/gcc/gcc-11.2.inc        |   1 -
>  .../gcc/0032-Fix-for-testsuite-failure.patch  | 255 ------------------
>  2 files changed, 256 deletions(-)
>  delete mode 100644 meta/recipes-devtools/gcc/gcc/0032-Fix-for-testsuite-failure.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc b/meta/recipes-devtools/gcc/gcc-11.2.inc
> index fbe0ec740cc..f06c1a891b2 100644
> --- a/meta/recipes-devtools/gcc/gcc-11.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-11.2.inc
> @@ -55,7 +55,6 @@ SRC_URI = "\
>             file://0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch \
>             file://0030-sync-gcc-stddef.h-with-musl.patch \
>             file://0031-fix-segmentation-fault-in-precompiled-header-generat.patch \
> -           file://0032-Fix-for-testsuite-failure.patch \
>             file://0033-Re-introduce-spe-commandline-options.patch \
>             file://0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch \
>             file://0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch \
> diff --git a/meta/recipes-devtools/gcc/gcc/0032-Fix-for-testsuite-failure.patch b/meta/recipes-devtools/gcc/gcc/0032-Fix-for-testsuite-failure.patch
> deleted file mode 100644
> index 0be03e652ba..00000000000
> --- a/meta/recipes-devtools/gcc/gcc/0032-Fix-for-testsuite-failure.patch
> +++ /dev/null
> @@ -1,255 +0,0 @@
> -From bb171ef618f8892bd56e57ae41ecb6e02caa8173 Mon Sep 17 00:00:00 2001
> -From: RAGHUNATH LOLUR <raghunath.lolur@kpit.com>
> -Date: Wed, 6 Dec 2017 22:52:26 -0800
> -Subject: [PATCH] Fix for testsuite failure
> -
> -2017-11-16  Raghunath Lolur  <raghunath.lolur@kpit.com>
> -
> -       * gcc.dg/pr56275.c: If SSE is disabled, ensure that
> -       "-mfpmath" is not set to use SSE. Set "-mfpmath=387".
> -       * gcc.dg/pr68306.c: Likewise
> -       * gcc.dg/pr68306-2.c: Likewise
> -       * gcc.dg/pr68306-3.c: Likewise
> -       * gcc.dg/pr69634.c: Likewise
> -       * gcc.target/i386/amd64-abi-1.c: Likewise
> -       * gcc.target/i386/funcspec-6.c: Likewise
> -       * gcc.target/i386/interrupt-387-err-1.c: Likewise
> -       * gcc.target/i386/isa-14.c: Likewise
> -       * gcc.target/i386/pr44948-2b.c: Likewise
> -       * gcc.target/i386/pr53425-1.c: Likewise
> -       * gcc.target/i386/pr53425-2.c: Likewise
> -       * gcc.target/i386/pr55247.c: Likewise
> -       * gcc.target/i386/pr59644.c: Likewise
> -       * gcc.target/i386/pr62120.c: Likewise
> -       * gcc.target/i386/pr70467-1.c: Likewise
> -       * gcc.target/i386/warn-vect-op-1.c: Likewise
> -
> -If -Wall, -Werror are used during compilation various test cases fail
> -to compile.
> -
> -If SSE is disabled, be sure to -mfpmath=387 to resolve this.
> -
> -This patch removes the changes to Changelog from the original patch.
> -This will help us avoid conflicts.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ----
> - gcc/testsuite/gcc.dg/pr56275.c                      | 2 +-
> - gcc/testsuite/gcc.dg/pr68306-2.c                    | 2 +-
> - gcc/testsuite/gcc.dg/pr68306-3.c                    | 2 +-
> - gcc/testsuite/gcc.dg/pr68306.c                      | 2 +-
> - gcc/testsuite/gcc.dg/pr69634.c                      | 2 +-
> - gcc/testsuite/gcc.target/i386/amd64-abi-1.c         | 2 +-
> - gcc/testsuite/gcc.target/i386/funcspec-6.c          | 1 +
> - gcc/testsuite/gcc.target/i386/interrupt-387-err-1.c | 2 +-
> - gcc/testsuite/gcc.target/i386/isa-14.c              | 2 +-
> - gcc/testsuite/gcc.target/i386/pr44948-2b.c          | 2 +-
> - gcc/testsuite/gcc.target/i386/pr53425-1.c           | 2 +-
> - gcc/testsuite/gcc.target/i386/pr53425-2.c           | 2 +-
> - gcc/testsuite/gcc.target/i386/pr55247.c             | 2 +-
> - gcc/testsuite/gcc.target/i386/pr59644.c             | 2 +-
> - gcc/testsuite/gcc.target/i386/pr62120.c             | 2 +-
> - gcc/testsuite/gcc.target/i386/pr70467-1.c           | 2 +-
> - gcc/testsuite/gcc.target/i386/warn-vect-op-1.c      | 2 +-
> - 17 files changed, 17 insertions(+), 16 deletions(-)
> -
> -diff --git a/gcc/testsuite/gcc.dg/pr56275.c b/gcc/testsuite/gcc.dg/pr56275.c
> -index b901bb2b199..a4f6c95e1a1 100644
> ---- a/gcc/testsuite/gcc.dg/pr56275.c
> -+++ b/gcc/testsuite/gcc.dg/pr56275.c
> -@@ -1,6 +1,6 @@
> - /* { dg-do compile } */
> - /* { dg-options "-O2" } */
> --/* { dg-additional-options "-mno-sse" { target { i?86-*-* x86_64-*-* } } } */
> -+/* { dg-additional-options "-mno-sse -mfpmath=387" { target { i?86-*-* x86_64-*-* } } } */
> -
> - typedef long long v2tw __attribute__ ((vector_size (2 * sizeof (long long))));
> -
> -diff --git a/gcc/testsuite/gcc.dg/pr68306-2.c b/gcc/testsuite/gcc.dg/pr68306-2.c
> -index 4672ebe7987..2a368c484b6 100644
> ---- a/gcc/testsuite/gcc.dg/pr68306-2.c
> -+++ b/gcc/testsuite/gcc.dg/pr68306-2.c
> -@@ -1,6 +1,6 @@
> - /* { dg-do compile } */
> - /* { dg-options "-O3" } */
> --/* { dg-additional-options "-mno-sse -mno-mmx" { target i?86-*-* x86_64-*-* } } */
> -+/* { dg-additional-options "-mno-sse -mno-mmx -mfpmath=387" { target i?86-*-* x86_64-*-* } } */
> -
> - struct {
> -     int tz_minuteswest;
> -diff --git a/gcc/testsuite/gcc.dg/pr68306-3.c b/gcc/testsuite/gcc.dg/pr68306-3.c
> -index f5a8c102cf8..df3390c64c2 100644
> ---- a/gcc/testsuite/gcc.dg/pr68306-3.c
> -+++ b/gcc/testsuite/gcc.dg/pr68306-3.c
> -@@ -1,6 +1,6 @@
> - /* { dg-do compile } */
> - /* { dg-options "-O3" } */
> --/* { dg-additional-options "-mno-sse -mno-mmx" { target i?86-*-* x86_64-*-* } } */
> -+/* { dg-additional-options "-mno-sse -mno-mmx -mfpmath=387" { target i?86-*-* x86_64-*-* } } */
> - /* { dg-additional-options "-mno-altivec -mno-vsx" { target powerpc*-*-* } } */
> -
> - extern void fn2();
> -diff --git a/gcc/testsuite/gcc.dg/pr68306.c b/gcc/testsuite/gcc.dg/pr68306.c
> -index 54e5b40f221..0813389e2c1 100644
> ---- a/gcc/testsuite/gcc.dg/pr68306.c
> -+++ b/gcc/testsuite/gcc.dg/pr68306.c
> -@@ -1,6 +1,6 @@
> - /* { dg-do compile } */
> - /* { dg-options "-O3" } */
> --/* { dg-additional-options "-mno-sse -mno-mmx" { target i?86-*-* x86_64-*-* } } */
> -+/* { dg-additional-options "-mno-sse -mno-mmx -mfpmath=387" { target i?86-*-* x86_64-*-* } } */
> -
> - enum powerpc_pmc_type { PPC_PMC_IBM };
> - struct {
> -diff --git a/gcc/testsuite/gcc.dg/pr69634.c b/gcc/testsuite/gcc.dg/pr69634.c
> -index 60a56149463..bcc23f9ccd6 100644
> ---- a/gcc/testsuite/gcc.dg/pr69634.c
> -+++ b/gcc/testsuite/gcc.dg/pr69634.c
> -@@ -1,6 +1,6 @@
> - /* { dg-do compile } */
> - /* { dg-options "-O2 -fno-dce -fschedule-insns -fno-tree-vrp -fcompare-debug -Wno-psabi" } */
> --/* { dg-additional-options "-mno-sse" { target i?86-*-* x86_64-*-* } } */
> -+/* { dg-additional-options "-mno-sse -mfpmath=387" { target i?86-*-* x86_64-*-* } } */
> - /* { dg-require-effective-target scheduling } */
> -
> - typedef unsigned short u16;
> -diff --git a/gcc/testsuite/gcc.target/i386/amd64-abi-1.c b/gcc/testsuite/gcc.target/i386/amd64-abi-1.c
> -index 69fde57bf06..7f1f1c03edf 100644
> ---- a/gcc/testsuite/gcc.target/i386/amd64-abi-1.c
> -+++ b/gcc/testsuite/gcc.target/i386/amd64-abi-1.c
> -@@ -1,5 +1,5 @@
> - /* { dg-do compile { target { ! ia32 } } } */
> --/* { dg-options "-mno-sse" } */
> -+/* { dg-options "-mno-sse -mfpmath=387" } */
> - /* { dg-additional-options "-mabi=sysv" { target *-*-mingw* } } */
> -
> - double foo(void) { return 0; }        /* { dg-error "SSE disabled" } */
> -diff --git a/gcc/testsuite/gcc.target/i386/funcspec-6.c b/gcc/testsuite/gcc.target/i386/funcspec-6.c
> -index ea896b7ebfd..bf15569b826 100644
> ---- a/gcc/testsuite/gcc.target/i386/funcspec-6.c
> -+++ b/gcc/testsuite/gcc.target/i386/funcspec-6.c
> -@@ -1,6 +1,7 @@
> - /* Test whether all of the 64-bit function specific options are accepted
> -    without error.  */
> - /* { dg-do compile { target { ! ia32 } } } */
> -+/* { dg-additional-options "-mfpmath=387" } */
> -
> - #include "funcspec-56.inc"
> -
> -diff --git a/gcc/testsuite/gcc.target/i386/interrupt-387-err-1.c b/gcc/testsuite/gcc.target/i386/interrupt-387-err-1.c
> -index 8561a3c26d6..6377f814645 100644
> ---- a/gcc/testsuite/gcc.target/i386/interrupt-387-err-1.c
> -+++ b/gcc/testsuite/gcc.target/i386/interrupt-387-err-1.c
> -@@ -1,5 +1,5 @@
> - /* { dg-do compile } */
> --/* { dg-options "-O2 -mgeneral-regs-only -mno-cld -mno-iamcu -m80387" } */
> -+/* { dg-options "-O2 -mgeneral-regs-only -mno-cld -mno-iamcu -m80387 -mfpmath=387" } */
> -
> - typedef unsigned int uword_t __attribute__ ((mode (__word__)));
> -
> -diff --git a/gcc/testsuite/gcc.target/i386/isa-14.c b/gcc/testsuite/gcc.target/i386/isa-14.c
> -index 5d49e6e77fe..1de2db92bdd 100644
> ---- a/gcc/testsuite/gcc.target/i386/isa-14.c
> -+++ b/gcc/testsuite/gcc.target/i386/isa-14.c
> -@@ -1,5 +1,5 @@
> - /* { dg-do run } */
> --/* { dg-options "-march=x86-64 -msse4a -mfma4 -mno-sse" } */
> -+/* { dg-options "-march=x86-64 -msse4a -mfma4 -mno-sse -mfpmath=387" } */
> -
> - extern void abort (void);
> -
> -diff --git a/gcc/testsuite/gcc.target/i386/pr44948-2b.c b/gcc/testsuite/gcc.target/i386/pr44948-2b.c
> -index fa1769b62fb..f79fb12726f 100644
> ---- a/gcc/testsuite/gcc.target/i386/pr44948-2b.c
> -+++ b/gcc/testsuite/gcc.target/i386/pr44948-2b.c
> -@@ -1,5 +1,5 @@
> - /* { dg-do compile } */
> --/* { dg-options "-O -mno-sse -Wno-psabi -mtune=generic" } */
> -+/* { dg-options "-O -mno-sse -Wno-psabi -mtune=generic -mfpmath=387" } */
> -
> - struct A
> - {
> -diff --git a/gcc/testsuite/gcc.target/i386/pr53425-1.c b/gcc/testsuite/gcc.target/i386/pr53425-1.c
> -index 2e89ff7d81d..6339bf6b736 100644
> ---- a/gcc/testsuite/gcc.target/i386/pr53425-1.c
> -+++ b/gcc/testsuite/gcc.target/i386/pr53425-1.c
> -@@ -1,6 +1,6 @@
> - /* PR target/53425 */
> - /* { dg-do compile { target { ! ia32 } } } */
> --/* { dg-options "-O2 -mno-sse" } */
> -+/* { dg-options "-O2 -mno-sse -mfpmath=387" } */
> - /* { dg-skip-if "no SSE vector" { x86_64-*-mingw* } } */
> -
> - typedef double __v2df __attribute__ ((__vector_size__ (16)));
> -diff --git a/gcc/testsuite/gcc.target/i386/pr53425-2.c b/gcc/testsuite/gcc.target/i386/pr53425-2.c
> -index 61f6283dbe9..2c5a55f0ac3 100644
> ---- a/gcc/testsuite/gcc.target/i386/pr53425-2.c
> -+++ b/gcc/testsuite/gcc.target/i386/pr53425-2.c
> -@@ -1,6 +1,6 @@
> - /* PR target/53425 */
> - /* { dg-do compile { target { ! ia32 } } } */
> --/* { dg-options "-O2 -mno-sse" } */
> -+/* { dg-options "-O2 -mno-sse -mfpmath=387" } */
> - /* { dg-skip-if "no SSE vector" { x86_64-*-mingw* } } */
> -
> - typedef float __v2sf __attribute__ ((__vector_size__ (8)));
> -diff --git a/gcc/testsuite/gcc.target/i386/pr55247.c b/gcc/testsuite/gcc.target/i386/pr55247.c
> -index 23366d0909d..9810e3abb76 100644
> ---- a/gcc/testsuite/gcc.target/i386/pr55247.c
> -+++ b/gcc/testsuite/gcc.target/i386/pr55247.c
> -@@ -1,6 +1,6 @@
> - /* { dg-do compile { target { ! ia32 } } } */
> - /* { dg-require-effective-target maybe_x32 } */
> --/* { dg-options "-O2 -mno-sse -mno-mmx -mx32 -maddress-mode=long" } */
> -+/* { dg-options "-O2 -mno-sse -mno-mmx -mx32 -maddress-mode=long -mfpmath=387" } */
> -
> - typedef unsigned int uint32_t;
> - typedef uint32_t Elf32_Word;
> -diff --git a/gcc/testsuite/gcc.target/i386/pr59644.c b/gcc/testsuite/gcc.target/i386/pr59644.c
> -index 96006b3e338..4287e4538bf 100644
> ---- a/gcc/testsuite/gcc.target/i386/pr59644.c
> -+++ b/gcc/testsuite/gcc.target/i386/pr59644.c
> -@@ -1,6 +1,6 @@
> - /* PR target/59644 */
> - /* { dg-do run { target lp64 } } */
> --/* { dg-options "-O2 -ffreestanding -mno-sse -mpreferred-stack-boundary=3 -maccumulate-outgoing-args -mno-red-zone" } */
> -+/* { dg-options "-O2 -ffreestanding -mno-sse -mpreferred-stack-boundary=3 -maccumulate-outgoing-args -mno-red-zone -mfpmath=387" } */
> -
> - /* This test uses __builtin_trap () instead of e.g. abort,
> -    because due to -mpreferred-stack-boundary=3 it should not call
> -diff --git a/gcc/testsuite/gcc.target/i386/pr62120.c b/gcc/testsuite/gcc.target/i386/pr62120.c
> -index 28d85d37712..c93266bd4bc 100644
> ---- a/gcc/testsuite/gcc.target/i386/pr62120.c
> -+++ b/gcc/testsuite/gcc.target/i386/pr62120.c
> -@@ -1,5 +1,5 @@
> - /* { dg-do compile } */
> --/* { dg-options "-mno-sse" } */
> -+/* { dg-options "-mno-sse -mfpmath=387" } */
> -
> - void foo ()
> - {
> -diff --git a/gcc/testsuite/gcc.target/i386/pr70467-1.c b/gcc/testsuite/gcc.target/i386/pr70467-1.c
> -index 4e112c88d07..bcfb396a68d 100644
> ---- a/gcc/testsuite/gcc.target/i386/pr70467-1.c
> -+++ b/gcc/testsuite/gcc.target/i386/pr70467-1.c
> -@@ -1,6 +1,6 @@
> - /* PR rtl-optimization/70467 */
> - /* { dg-do compile } */
> --/* { dg-options "-O2 -mno-sse" } */
> -+/* { dg-options "-O2 -mno-sse -mfpmath=387" } */
> -
> - void foo (unsigned long long *);
> -
> -diff --git a/gcc/testsuite/gcc.target/i386/warn-vect-op-1.c b/gcc/testsuite/gcc.target/i386/warn-vect-op-1.c
> -index 6cda1534311..26e37f5b8ba 100644
> ---- a/gcc/testsuite/gcc.target/i386/warn-vect-op-1.c
> -+++ b/gcc/testsuite/gcc.target/i386/warn-vect-op-1.c
> -@@ -1,5 +1,5 @@
> - /* { dg-do compile { target { ! ia32 } } }  */
> --/* { dg-options "-mno-sse -Wvector-operation-performance" }  */
> -+/* { dg-options "-mno-sse -Wvector-operation-performance -mfpmath=387" }  */
> - #define vector(elcount, type)  \
> - __attribute__((vector_size((elcount)*sizeof(type)))) type
> -
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157617): https://lists.openembedded.org/g/openembedded-core/message/157617
> Mute This Topic: https://lists.openembedded.org/mt/86665515/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

