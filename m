Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67E77C6371A
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:09 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web08.9811.1650471281613371818
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 09:14:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O2fbw6w3;
 spf=pass (domain: gmail.com, ip: 209.85.167.41,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id p10so3837215lfa.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 09:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QzV5e7rsqA+MbBSC0Lk/0P7YR+bh52qhHtqt88G8zuQ=;
        b=O2fbw6w3CtVoGnqyxunDUFO6cNZ7Cj/7EqkurIk260bkF485ZMG9VXQRZJMbzKDDkH
         amZ/UNSMBfj+1NnfNDB5h2CLUqZGTa75GI95xH+zemXDrRDNeog6wHBj1aLfHtYSln/c
         bIN9XGm3+WEG+e5HSnWRt/luBfsf7dgh4hgkAVeT9os6kzNGkXIfeZLyev0OhW4VT1ly
         odJYYSAYmwmxdul+sX8R6VG9oqnLUFGclWo/cxXoOVQOAsYMxYQ9i6aLTlizizWk0msz
         RiZhUBzjDFPq0dZbBcVL+BUT3rcH3dH9Omn9S3TbHH/1B0aOSwegwpGKwsZeSDMMv6aq
         a6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QzV5e7rsqA+MbBSC0Lk/0P7YR+bh52qhHtqt88G8zuQ=;
        b=gag0gDrxFAMiS5Gjkshivf1GxZt5ZUwKEDVbx6cjN4fYfWyEdtM36zi/Gnc/yUqWzI
         YwQ/gvMFxRKRVNYGOwnp8GqZDUJzhi6E2nYhxPFdc4i3+yQevDPlzruLy/xctjYyN2xK
         cfd2WbM/5mwzZkRL5Rqd0hbxS9zZBJvIdDdioQbZ6fUKIRXXau2V+/9Pre2RB9XXJwEm
         R/3Rh/dIxVAeqQuWyBxVJNWtkVdVmii7yl3UF0BuOdl30UglYwJQgKRSZZLr3JSn5AtQ
         kt7YnuvZPU8oB0F2XY2imnmjIhjg8Vt36jfipAI986HbGucTWGM/VZ4eUvxUltC5G+zL
         koNQ==
X-Gm-Message-State: AOAM53162c8Au4SeePaENKiiJ2Cw6diooOU4vmrWM6wlytQ39Ct0y0Do
	qb5NJcusrFRoMpsRA78oTpAWicOpcFTu9D0na1k=
X-Google-Smtp-Source: 
 ABdhPJyL6yTXZOrGYxRzVnRQzVySGpZ1HPufuGbt4tNYXLGUBaWZbic7n7VNSI/479agN3aDWIK415vXQMnlF7o0yOI=
X-Received: by 2002:ac2:4350:0:b0:46b:a3b7:fec7 with SMTP id
 o16-20020ac24350000000b0046ba3b7fec7mr15498661lfl.648.1650471279721; Wed, 20
 Apr 2022 09:14:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220130062039.151292-1-pgowda.cve@gmail.com>
 <3fbc21f8-da33-55f5-587a-aadbe34e8678@windriver.com>
 <CALY4986MhE4bJd-_1zRrE+W2nOCkzZZ51MrqpSJPkszodzxRTA@mail.gmail.com>
 <5cab64a0-a667-47f2-4e36-5da9f47550d8@windriver.com>
In-Reply-To: <5cab64a0-a667-47f2-4e36-5da9f47550d8@windriver.com>
From: pgowda cve <pgowda.cve@gmail.com>
Date: Wed, 20 Apr 2022 21:44:26 +0530
Message-ID: 
 <CALY4984+qosHRY5m6Jz8R7j5vcxb+igs_FN4eN8JQgP2z733FQ@mail.gmail.com>
Subject: Re: [OE-core] [hardknott][PATCH] glibc: upgrade glibc-2.33 to latest
 version
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	"Mittal, Anuj" <anuj.mittal@intel.com>, Randy MacLeod <rwmacleod@gmail.com>,
	umesh kalappa0 <umesh.kalappa0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164710

Hi Randy,

Sorry for the misunderstanding from my side.
I am going through the list again and it seems like the required patch
was not part of the Hardknott.
It was rather a part of the Master branch.

@Mittal, Anuj , @Randy MacLeod
Please let me know if I can upgrade the GLIBC Hardknott to the latest
version of glibc-2.33?

Thanks,
Pgowda



On Wed, Apr 20, 2022 at 9:11 PM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 2022-04-20 11:30, pgowda cve wrote:
> > Hi Randy,
> >
> > The GLIBC was already updated to the latest version on top of [BZ #28353].
> >
> > Please find the commit which had [BZ #28353] patch along with others.
> > https://git.openembedded.org/openembedded-core/commit/?h=hardknott&id=d5bdff460cc8b0f38177f1f38d625eeda729b459
> >
> > Thanks,
> > Pgowda
>
>
> Ah good. I'm not sue why my repo seemed to be behind.
>
> There are still 23 commits that could be picked up, several of which
> are marked as bug fixes but since we have the patch that was my main
> concern, I'll leave it up to Anuj to see if he wants the update for 3.3.6.
>
> Naveen,
>
> We'll need that update regardless for WR Linux so please test it.
>
>
> Thanks,
>
> ../Randy
>
>
> git log --oneline 3e2a15c666e40e5ee740e5079c56d83469280323...
> 5eddc29c92 (HEAD -> release/2.33/master, origin/release/2.33/master)
> S390: Add new s390 platform z16.
> c78ad8eb47 hppa: Use END instead of PSEUDO_END in swapcontext.S
> 32f74d4f14 hppa: Implement swapcontext in assembler (bug 28960)
> baa74e8589 hppa: Fix warnings from _dl_lookup_address
> 6d9525b620 nptl: Fix cleanups for stack grows up [BZ# 28899]
> 8f56ecc19b hppa: Revise gettext trampoline design
> ea94346dbe hppa: Fix swapcontext
> aeab7584c2 Fix elf/tst-audit2 on hppa
> f341ab08fc NEWS: Add a bug fix entry for BZ #28896
> 24e95955aa x86: Fix TEST_NAME to make it a string in tst-strncmp-rtm.c
> 6f8e99b567 x86: Test wcscmp RTM in the wcsncmp overflow case [BZ #28896]
> a3cd0fe201 x86: Fallback {str|wcs}cmp RTM in the ncmp overflow case [BZ
> #28896]
> cb922428dc string: Add a testcase for wcsncmp with SIZE_MAX [BZ #28755]
> 211cce703d <bits/platform/x86.h>: Correct x86_cpu_TBM
> 55446dd8a2 socket: Do not use AF_NETLINK in __opensock
> 9495d729f6 hurd if_index: Explicitly use AF_INET for if index discovery
> 78d25827ae Linux: Simplify __opensock and fix race condition [BZ #28353]
> 1956ad4930 x86-64: Test strlen and wcslen with 0 in the RSI register [BZ
> #28064]
> 260360e89b x86: Remove wcsnlen-sse4_1 from wcslen ifunc-impl-list [BZ
> #28064]
> 1b8f2456b9 x86: Use CHECK_FEATURE_PRESENT to check HLE [BZ #27398]
> 54fdfa2b33 x86: Black list more Intel CPUs for TSX [BZ #27398]
> 0a5f5e2dc1 x86: Check RTM_ALWAYS_ABORT for RTM [BZ #28033]
> 5cb6edb6cd x86: Copy IBT and SHSTK usable only if CET is enabled
>
> $ git log --oneline 3e2a15c666e40e5ee740e5079c56d83469280323... | wc -l
> 23
>
>
>
> >
> > On Wed, Apr 20, 2022 at 8:05 PM Randy MacLeod
> > <randy.macleod@windriver.com> wrote:
> >> On 2022-01-30 01:20, Pgowda wrote:
> >>> glibc-2.33 has been upgraded to latest version that includes many CVE and
> >>> other bug fixes. Ran the regressions and results are better.
> >>>
> >>> Signed-off-by: pgowda <pgowda.cve@gmail.com>
> >>> ---
> >>>    meta/recipes-core/glibc/glibc-version.inc | 2 +-
> >>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
> >>> index 63241ee951..e1eefdee49 100644
> >>> --- a/meta/recipes-core/glibc/glibc-version.inc
> >>> +++ b/meta/recipes-core/glibc/glibc-version.inc
> >>> @@ -1,6 +1,6 @@
> >>>    SRCBRANCH ?= "release/2.33/master"
> >>>    PV = "2.33"
> >>> -SRCREV_glibc ?= "55b99e9ed07688019609bd4dcd17d3ebf4572948"
> >>> +SRCREV_glibc ?= "3e2a15c666e40e5ee740e5079c56d83469280323"
> >>>    SRCREV_localedef ?= "bd644c9e6f3e20c5504da1488448173c69c56c28"
> >>>
> >>>    GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
> >>>
> >>> -=-=-=-=-=-=-=-=-=-=-=-
> >>> Links: You receive all messages sent to this group.
> >>> View/Reply Online (#161106): https://lists.openembedded.org/g/openembedded-core/message/161106
> >>> Mute This Topic: https://lists.openembedded.org/mt/88782078/3616765
> >>> Group Owner: openembedded-core+owner@lists.openembedded.org
> >>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> >>> -=-=-=-=-=-=-=-=-=-=-=-
> >>>
> >> Naveen, Anuj, Richard,
> >>
> >> Is there time to do this one last time for hardknott  to pick up these
> >> 67 bug fixes in glibc?
> >>
> >> We're particularily interested in:
> >>
> >> 78d25827ae   2021-09-28   Linux: Simplify __opensock and fix race
> >> condition [BZ #28353]
> >>
> >> but there seem to be many good bug fixes and optimizations in the list.
> >>
> >> Naveen, please try it and test ASAP.
> >>
> >> ../Randy
> >>
> >> 5eddc29c92   2022-04-13   (HEAD -> release/2.33/master,
> >> origin/release/2.33/master) S390: Add new s390 platform z16.
> >> c78ad8eb47   2022-03-15   hppa: Use END instead of PSEUDO_END in
> >> swapcontext.S
> >> 32f74d4f14   2022-03-15   hppa: Implement swapcontext in assembler (bug
> >> 28960)
> >> baa74e8589   2022-03-06   hppa: Fix warnings from _dl_lookup_address
> >> 6d9525b620   2022-02-28   nptl: Fix cleanups for stack grows up [BZ# 28899]
> >> 8f56ecc19b   2022-02-22   hppa: Revise gettext trampoline design
> >> ea94346dbe   2022-02-18   hppa: Fix swapcontext
> >> aeab7584c2   2022-03-06   Fix elf/tst-audit2 on hppa
> >> f341ab08fc   2022-02-18   NEWS: Add a bug fix entry for BZ #28896
> >> 24e95955aa   2022-02-18   x86: Fix TEST_NAME to make it a string in
> >> tst-strncmp-rtm.c
> >> 6f8e99b567   2022-02-18   x86: Test wcscmp RTM in the wcsncmp overflow
> >> case [BZ #28896]
> >> a3cd0fe201   2022-02-15   x86: Fallback {str|wcs}cmp RTM in the ncmp
> >> overflow case [BZ #28896]
> >> cb922428dc   2022-02-17   string: Add a testcase for wcsncmp with
> >> SIZE_MAX [BZ #28755]
> >> 211cce703d   2021-02-02   <bits/platform/x86.h>: Correct x86_cpu_TBM
> >> 55446dd8a2   2021-11-22   socket: Do not use AF_NETLINK in __opensock
> >> 9495d729f6   2021-10-18   hurd if_index: Explicitly use AF_INET for if
> >> index discovery
> >> 78d25827ae   2021-09-28   Linux: Simplify __opensock and fix race
> >> condition [BZ #28353]
> >> 1956ad4930   2021-07-08   x86-64: Test strlen and wcslen with 0 in the
> >> RSI register [BZ #28064]
> >> 260360e89b   2021-07-08   x86: Remove wcsnlen-sse4_1 from wcslen
> >> ifunc-impl-list [BZ #28064]
> >> 1b8f2456b9   2022-01-24   x86: Use CHECK_FEATURE_PRESENT to check HLE
> >> [BZ #27398]
> >> 54fdfa2b33   2022-01-14   x86: Black list more Intel CPUs for TSX [BZ
> >> #27398]
> >> 0a5f5e2dc1   2021-06-30   x86: Check RTM_ALWAYS_ABORT for RTM [BZ #28033]
> >> 5cb6edb6cd   2021-06-23   x86: Copy IBT and SHSTK usable only if CET is
> >> enabled
> >> 3e2a15c666   2021-04-19   x86-64: Require BMI2 for __strlen_evex and
> >> __strnlen_evex
> >> 25941de34e   2022-01-27   NEWS: Add a bug fix entry for BZ #27974
> >> 2b00ee820a   2021-06-09   String: Add overflow tests for strnlen,
> >> memchr, and strncat [BZ #27974]
> >> 8a3a0177c7   2021-04-19   x86: Optimize strlen-evex.S
> >> cef3bffade   2021-06-23   x86: Fix overflow bug in wcsnlen-sse4_1 and
> >> wcsnlen-avx2 [BZ #27974]
> >> 3ac5a7fe8b   2021-06-23   x86-64: Add wcslen optimize for sse4.1
> >> 5697e2dda8   2021-06-22   x86-64: Move strlen.S to multiarch/strlen-vec.S
> >> 3dea108f60   2021-05-07   x86-64: Fix an unknown vector operation in
> >> memchr-evex.S
> >> 355afae940   2021-05-03   x86: Optimize memchr-evex.S
> >> b72b89705e   2021-04-19   x86: Optimize strlen-avx2.S
> >> 453ed0a0f2   2021-06-09   x86: Fix overflow bug with wmemchr-sse2 and
> >> wmemchr-avx2 [BZ #27974]
> >> e09c377806   2021-05-03   x86: Optimize memchr-avx2.S
> >> 902af2f5ee   2022-01-27   NEWS: Add a bug fix entry for BZ #27457
> >> 31dd3e3cb3   2021-04-01   x86-64: Fix ifdef indentation in strlen-evex.S
> >> d49105cc7a   2021-03-07   x86-64: Use ZMM16-ZMM31 in AVX512 memmove
> >> family functions
> >> 763cea698b   2021-03-07   x86-64: Use ZMM16-ZMM31 in AVX512 memset
> >> family functions
> >> 82f1ba9af7   2021-02-23   x86: Add string/memory function tests in RTM
> >> region
> >> 0598a25cbe   2021-03-05   x86-64: Add AVX optimized string/memory
> >> functions for RTM
> >> 15bae38c8b   2021-03-05   x86-64: Add memcmp family functions with
> >> 256-bit EVEX
> >> 47bf9f38bb   2021-03-05   x86-64: Add memset family functions with
> >> 256-bit EVEX
> >> 1697e739ef   2021-03-05   x86-64: Add memmove family functions with
> >> 256-bit EVEX
> >> 06d1aed51b   2021-03-05   x86-64: Add strcpy family functions with
> >> 256-bit EVEX
> >> 9cee072f8f   2021-03-05   x86-64: Add ifunc-avx2.h functions with
> >> 256-bit EVEX
> >> f0a2b67147   2021-02-26   x86: Set Prefer_No_VZEROUPPER and add
> >> Prefer_AVX2_STRCMP
> >> a744a0a3fe   2021-03-27   test-strnlen.c: Check that strnlen won't go
> >> beyond the maximum length
> >> 6b7b6c7514   2021-03-27   test-strnlen.c: Initialize wchar_t string with
> >> wmemset [BZ #27655]
> >> 86c153d092   2022-01-26   NEWS: Add a bug fix entry for BZ #28755
> >> 3d52239b30   2022-01-09   x86: Fix __wcsncmp_avx2 in strcmp-avx2.S [BZ#
> >> 28755]
> >> d251ad533e   2021-06-01   aarch64: align stack in clone [BZ #27939]
> >> 06ce5fbd6d   2021-06-25   support: Fix xclone build failures on ia64 and
> >> hppa
> >> 48d9161e02   2022-01-24   Linux: Detect user namespace support in
> >> io/tst-getcwd-smallbuff
> >> 41980af2d7   2022-01-24   realpath: Avoid overwriting preexisting error
> >> (CVE-2021-3998)
> >> bcdde07537   2022-01-21   getcwd: Set errno to ERANGE for size == 1
> >> (CVE-2021-3999)
> >> 46a70c49ba   2021-03-10   support: Add xclone
> >> f63cb3cf72   2022-01-24   tst-realpath-toolong: Fix hurd build
> >> e41e5b97e3   2022-01-13   realpath: Set errno to ENAMETOOLONG for result
> >> larger than PATH_MAX [BZ #28770]
> >> e081bafcb1   2022-01-18   support: Add helpers to create paths longer
> >> than PATH_MAX
> >> ac148bdd88   2021-06-25   elf: Fix glibc-hwcaps priorities with cache
> >> flags mismatches [BZ #27046]
> >> 5cab4e3f3a   2021-09-25   powerpc: Fix unrecognized instruction errors
> >> with recent binutils
> >> 0f70b829f8   2022-01-17   CVE-2022-23218: Buffer overflow in sunrpc
> >> svcunix_create (bug 28768)
> >> 4f4452721d   2021-03-09   <shlib-compat.h>: Support
> >> compat_symbol_reference for _ISOMAC
> >> dae9a8e7f6   2022-01-17   sunrpc: Test case for clnt_create "unix"
> >> buffer overflow (bug 22542)
> >> 4653cd9e36   2022-01-17   CVE-2022-23219: Buffer overflow in sunrpc
> >> clnt_create for "unix" (bug 22542)
> >> f10e992e8d   2022-01-17   socket: Add the __sockaddr_un_set function
> >> a51b76b71e   2022-01-17   x86: use default cache size if it cannot be
> >> determined [BZ #28784]
> >>
> >> --
> >> # Randy MacLeod
> >> # Wind River Linux
> >>
>
> --
> # Randy MacLeod
> # Wind River Linux
>

