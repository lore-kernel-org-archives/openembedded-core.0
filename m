Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF789C48286
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 16:28:42 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web10.19950.1706804915544584531
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 08:28:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XWxTopm4;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3bbbc6e51d0so713763b6e.3
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 08:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706804915; x=1707409715; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EP8yU/rS9rea7CoDTGrJPMloGErKQUGGApRXGWsJaec=;
        b=XWxTopm4mpV/Pfm5GehOXbzLRMFUwQkeeWx3JZl1l1gqpTWyf8jLkSiLKnfybo0KKS
         krlVeL8NieaZBWe/XurCl+jxh/zHWgPcf6BIwd0W3Dqj83ZcRnKvOBR0CKitZDfEm01c
         r6kmxwNceDigtVx+rquG3gpPqS2N/3nhILJknqdeHk7Gnf6jKNtYKrpLiyKSf2OPlJAI
         EQ9kJ3JiAOiOC/p7GZ1ScvJHdZCyMl0oHazBdD3SxZW7HN4ynpTzajD/fFgOAOOVZ+z5
         y2qh6DJbpOtYbtrsZm7AnbtPxIBSMoXMyvU1ZgqPQDbtpOMLpekcmVyhcVawejfQX7BO
         2bIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706804915; x=1707409715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EP8yU/rS9rea7CoDTGrJPMloGErKQUGGApRXGWsJaec=;
        b=tErOlJ/t81O/r0lJ7hP40Ft1xHFS+5EMEin08R2vr/nGqHw1rBNPElM1yJM+qsxlGy
         w8t6JSXpk7qYWwsebQIfBqN+eQfZ8KXmZ4FWSIQxorF6IMiivXpAyUhrFgTtCgHqaCnC
         kyFq2CTJDudNzSpP2MENTJs9YRgQ8OHvuTYvqhQlP7nymjxCxfpaQFC+o5TAbpc8TopX
         MxctvA0e6Mb3Zy7yJ+1lDlNITxbknxZ8jmEBfoJSbU2nte6PDMZQfQ5agDiXfX69dUB4
         DdMhqzXjjdYnw+ZbdsJUsNilBUZPSd+PhBt0d0Fs0WVUl3jOhfPgbsoDb2CTKfGTaPJW
         z9YQ==
X-Gm-Message-State: AOJu0Yy6jgSsoTyvncZDQIvonI3k6d9i1u+19P6zgvYY/X2rcq/qlsGb
	PvznOP5PgCTRjacFQ4a/m/vZcEIOHksiKf0Gyjg4lrdBkjff7rPpGm7QsQsOyy+5MrA8DRT2VC+
	D6ctUBCnP1PzClg4rfrlTMRXKryXA6/Dy7WmTEQ==
X-Google-Smtp-Source: AGHT+IHoG04TO7vABZUVRG7yrLSqpMsfRCEOwLOlUFbLecYvhuSz6OCllPGh3AsNfxJuUK1vRE2WRk5cZvuo/JLmg30=
X-Received: by 2002:a05:6871:520f:b0:210:bad8:e096 with SMTP id
 ht15-20020a056871520f00b00210bad8e096mr2884852oac.39.1706804914505; Thu, 01
 Feb 2024 08:28:34 -0800 (PST)
MIME-Version: 1.0
References: <1706766569-13110-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1706766569-13110-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Feb 2024 08:28:08 -0800
Message-ID: <CAMKF1soo9BJ9eSLBm5b8Fip9ESHRWD=dBv8nLe_=jr4avxjtOA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] strace: upgrade 6.6 -> 6.7
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 16:28:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194596

I am seeing some ptest failures with yoe/mut branch

    {'strace': ['net-yy-inet6.gen.test',
                'net-yy-inet.test',
                'net-yy-inet6.gen',
                'net-yy-inet']}

On Wed, Jan 31, 2024 at 9:50=E2=80=AFPM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> License-Update: Copyright year updated to 2024.
>
> 0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
> 0001-strace-fix-reproducibilty-issues.patch
> 0002-tests-Replace-off64_t-with-off_t.patch
> Makefile-ptest.patch
> ptest-spacesave.patch
> update-gawk-paths.patch
> refreshed for 6.7.
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> * Improvements
>   * Implemented -kk/--stack-traces=3Dsource option for libdw-based stack =
tracing.
>   * Implemented decoding of futex_wake, futex_wait, and sys_futex_requeue
>     syscalls.
>   * Updated lists of BPF_*, BTRFS_*, IORING_*, KVM_*, LANDLOCK_*, PR_*,
>     and TCP_* constants.
>   * Updated lists of ioctl commands from Linux 6.7.
>
> * Bug fixes
>   * Fix strace -r during the first second after booting to show correct r=
elative
>     timestamps.
>   * Fix strace -f entering deadlock on exit if there are tracee processes
>     spawned using vfork semantics.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...toconf-macro-to-detect-largefile-sup.patch |  7 +-
>  ...001-strace-fix-reproducibilty-issues.patch | 10 ++-
>  ...002-tests-Replace-off64_t-with-off_t.patch | 36 ++++++----
>  .../strace/strace/Makefile-ptest.patch        |  8 +--
>  .../strace/strace/ptest-spacesave.patch       |  6 +-
>  .../strace/strace/update-gawk-paths.patch     | 69 ++++++++++---------
>  .../strace/{strace_6.6.bb =3D> strace_6.7.bb}   |  4 +-
>  7 files changed, 75 insertions(+), 65 deletions(-)
>  rename meta/recipes-devtools/strace/{strace_6.6.bb =3D> strace_6.7.bb} (=
93%)
>
> diff --git a/meta/recipes-devtools/strace/strace/0001-configure-Use-autoc=
onf-macro-to-detect-largefile-sup.patch b/meta/recipes-devtools/strace/stra=
ce/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
> index 76ca7a76a8..cb9dc11ee7 100644
> --- a/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-mac=
ro-to-detect-largefile-sup.patch
> +++ b/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-mac=
ro-to-detect-largefile-sup.patch
> @@ -1,4 +1,4 @@
> -From 470399f3636c412b74f9daf6ae430b13c3126f02 Mon Sep 17 00:00:00 2001
> +From abfd130ad939a387247515d9000f6982e11d82e9 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Thu, 15 Dec 2022 15:54:27 -0800
>  Subject: [PATCH] configure: Use autoconf macro to detect largefile suppo=
rt
> @@ -8,15 +8,16 @@ where default is to detect the support
>
>  Upstream-Status: Submitted [https://github.com/strace/strace/pull/230]
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
>  ---
>   configure.ac | 2 ++
>   1 file changed, 2 insertions(+)
>
>  diff --git a/configure.ac b/configure.ac
> -index 4797b42dd..7d57fb254 100644
> +index 36fff90..9e40ab5 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -43,6 +43,8 @@ AC_PROG_INSTALL
> +@@ -42,6 +42,8 @@ AC_PROG_INSTALL
>   AC_PROG_RANLIB
>   AC_PROG_LN_S
>
> diff --git a/meta/recipes-devtools/strace/strace/0001-strace-fix-reproduc=
ibilty-issues.patch b/meta/recipes-devtools/strace/strace/0001-strace-fix-r=
eproducibilty-issues.patch
> index c4c176e6bc..9daeaceb0f 100644
> --- a/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-=
issues.patch
> +++ b/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-=
issues.patch
> @@ -1,4 +1,4 @@
> -From 6309792c49ca900cec6a7f1dc5b51bf75b629e11 Mon Sep 17 00:00:00 2001
> +From 8482f1a149bd6f1d6b5ec80f6a206ab0dd73848a Mon Sep 17 00:00:00 2001
>  From: Jeremy Puhlman <jpuhlman@mvista.com>
>  Date: Wed, 11 Mar 2020 19:56:55 +0000
>  Subject: [PATCH] strace: fix reproducibilty issues
> @@ -8,12 +8,13 @@ The full path to the gen_tests.sh script is encoded in =
the tests
>  Upstream-Status: Pending
>
>  Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
> +
>  ---
>   tests/gen_tests.sh | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/tests/gen_tests.sh b/tests/gen_tests.sh
> -index 5e1e7c9..1e65eac 100755
> +index 8f47651..65267db 100755
>  --- a/tests/gen_tests.sh
>  +++ b/tests/gen_tests.sh
>  @@ -46,7 +46,7 @@ while read -r name arg0 args; do {
> @@ -25,7 +26,7 @@ index 5e1e7c9..1e65eac 100755
>
>         case "$arg0" in
>                 +*)
> -@@ -80,7 +80,7 @@ while read -r name arg0 args; do {
> +@@ -91,7 +91,7 @@ while read -r name arg0 args; do {
>
>   if [ -n "$names" ]; then
>         {
> @@ -34,6 +35,3 @@ index 5e1e7c9..1e65eac 100755
>                 printf 'GEN_TESTS =3D'
>                 printf ' %s.gen.test' $names
>                 echo
> ---
> -2.24.1
> -
> diff --git a/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64=
_t-with-off_t.patch b/meta/recipes-devtools/strace/strace/0002-tests-Replac=
e-off64_t-with-off_t.patch
> index 0cabdfe99f..34f06c17ab 100644
> --- a/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with=
-off_t.patch
> +++ b/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with=
-off_t.patch
> @@ -1,4 +1,4 @@
> -From 579b2ebe52d4b97f954e6188df2d07e137820075 Mon Sep 17 00:00:00 2001
> +From 51304fa04cafec3a4d2f6f1fddf03aedb6257bda Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Thu, 15 Dec 2022 15:56:13 -0800
>  Subject: [PATCH] tests: Replace off64_t with off_t
> @@ -8,11 +8,15 @@ build on musl where off64_t is not available without _L=
ARGEFILE64_SOURCE
>
>  Upstream-Status: Submitted [https://github.com/strace/strace/pull/230]
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
>  ---
>   tests/readahead.c        | 2 +-
> + tests/sync_file_range.c  | 4 ++--
>   tests/sync_file_range2.c | 4 ++--
> - 2 files changed, 3 insertions(+), 3 deletions(-)
> + 3 files changed, 5 insertions(+), 5 deletions(-)
>
> +diff --git a/tests/readahead.c b/tests/readahead.c
> +index 1072378..b9597e6 100644
>  --- a/tests/readahead.c
>  +++ b/tests/readahead.c
>  @@ -42,7 +42,7 @@ static const int fds[] =3D {
> @@ -24,29 +28,33 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>         -0x8000000000000000LL,
>         -0x5060708090a0b0c0LL,
>         -1LL,
> ---- a/tests/sync_file_range2.c
> -+++ b/tests/sync_file_range2.c
> +diff --git a/tests/sync_file_range.c b/tests/sync_file_range.c
> +index e93ab6c..dc76865 100644
> +--- a/tests/sync_file_range.c
> ++++ b/tests/sync_file_range.c
>  @@ -20,8 +20,8 @@ int
>   main(void)
>   {
>         const int fd =3D -1;
> --      const off64_t offset =3D 0xdeadbeefbadc0ded;
> --      const off64_t nbytes =3D 0xfacefeedcafef00d;
> -+      const off_t offset =3D 0xdeadbeefbadc0ded;
> -+      const off_t nbytes =3D 0xfacefeedcafef00d;
> +-      const off64_t offset =3D 0xdeadbeefbadc0dedULL;
> +-      const off64_t nbytes =3D 0xfacefeedcafef00dULL;
> ++      const off_t offset =3D 0xdeadbeefbadc0dedULL;
> ++      const off_t nbytes =3D 0xfacefeedcafef00dULL;
>         const unsigned int flags =3D -1;
>
>         int rc =3D sync_file_range(fd, offset, nbytes, flags);
> ---- a/tests/sync_file_range.c
> -+++ b/tests/sync_file_range.c
> +diff --git a/tests/sync_file_range2.c b/tests/sync_file_range2.c
> +index b8dc712..e4b003c 100644
> +--- a/tests/sync_file_range2.c
> ++++ b/tests/sync_file_range2.c
>  @@ -20,8 +20,8 @@ int
>   main(void)
>   {
>         const int fd =3D -1;
> --      const off64_t offset =3D 0xdeadbeefbadc0dedULL;
> --      const off64_t nbytes =3D 0xfacefeedcafef00dULL;
> -+      const off_t offset =3D 0xdeadbeefbadc0dedULL;
> -+      const off_t nbytes =3D 0xfacefeedcafef00dULL;
> +-      const off64_t offset =3D 0xdeadbeefbadc0ded;
> +-      const off64_t nbytes =3D 0xfacefeedcafef00d;
> ++      const off_t offset =3D 0xdeadbeefbadc0ded;
> ++      const off_t nbytes =3D 0xfacefeedcafef00d;
>         const unsigned int flags =3D -1;
>
>         int rc =3D sync_file_range(fd, offset, nbytes, flags);
> diff --git a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch b/m=
eta/recipes-devtools/strace/strace/Makefile-ptest.patch
> index 9af7737662..bfe14b7f33 100644
> --- a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
> +++ b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
> @@ -1,4 +1,4 @@
> -From 1f50e0a09d828be8f5b1f28db9af0b12492a1553 Mon Sep 17 00:00:00 2001
> +From f35dac4f3d3a7df73e1c77d7f665497ecdc60b47 Mon Sep 17 00:00:00 2001
>  From: Gabriel Barbu <gabriel.barbu@enea.com>
>  Date: Thu, 25 Jul 2013 15:28:33 +0200
>  Subject: [PATCH] strace: Add ptest
> @@ -14,10 +14,10 @@ Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
>   1 file changed, 20 insertions(+)
>
>  diff --git a/tests/Makefile.am b/tests/Makefile.am
> -index 55566ee..a7ae6f9 100644
> +index 9059f80..a732566 100644
>  --- a/tests/Makefile.am
>  +++ b/tests/Makefile.am
> -@@ -16,6 +16,7 @@ SIZEOF_LONG =3D @SIZEOF_LONG@
> +@@ -18,6 +18,7 @@ SIZEOF_LONG =3D @SIZEOF_LONG@
>   MPERS_NAME =3D
>   MPERS_CC_FLAGS =3D
>   ARCH_MFLAGS =3D
> @@ -25,7 +25,7 @@ index 55566ee..a7ae6f9 100644
>   AM_CFLAGS =3D $(WARN_CFLAGS)
>   bundled_CPPFLAGS =3D
>   if USE_BUNDLED_HEADERS
> -@@ -703,3 +704,22 @@ BUILT_SOURCES =3D ksysent.h
> +@@ -887,3 +888,22 @@ BUILT_SOURCES =3D ksysent.h
>   CLEANFILES =3D ksysent.h
>
>   include ../src/scno.am
> diff --git a/meta/recipes-devtools/strace/strace/ptest-spacesave.patch b/=
meta/recipes-devtools/strace/strace/ptest-spacesave.patch
> index 4e86ccadc5..b5cf579724 100644
> --- a/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
> +++ b/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
> @@ -1,4 +1,4 @@
> -From 3fad4821d90cd264d1b94253b9cf4fdf5d4034b8 Mon Sep 17 00:00:00 2001
> +From 8b4d63fd9705f3aea0232255c11f1125e4076e5a Mon Sep 17 00:00:00 2001
>  From: Richard Purdie <richard.purdie@linuxfoundation.org>
>  Date: Wed, 29 May 2019 00:10:32 +0100
>  Subject: [PATCH] strace: Tweak ptest disk space management
> @@ -15,10 +15,10 @@ Upstream-Status: Inappropriate [specific to OE image =
space issues]
>   1 file changed, 1 insertion(+)
>
>  diff --git a/tests/gen_tests.sh b/tests/gen_tests.sh
> -index 3540204..5e1e7c9 100755
> +index ce1467e..8f47651 100755
>  --- a/tests/gen_tests.sh
>  +++ b/tests/gen_tests.sh
> -@@ -62,6 +62,7 @@ while read -r name arg0 args; do {
> +@@ -73,6 +73,7 @@ while read -r name arg0 args; do {
>                 $hdr
>                 . "\${srcdir=3D.}/init.sh"
>                 run_strace_match_diff $arg0 $args
> diff --git a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch =
b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
> index a16ede95c2..cdd6fc6e3b 100644
> --- a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
> +++ b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
> @@ -1,4 +1,4 @@
> -From 4cd26cfaec255ec87f22abe886e0be89312a9671 Mon Sep 17 00:00:00 2001
> +From 0082413d2bf59f8837a634fc01f379ac74e193a5 Mon Sep 17 00:00:00 2001
>  From: Andre McCurdy <armccurdy@gmail.com>
>  Date: Mon, 18 Jan 2016 11:01:00 -0800
>  Subject: [PATCH] update gawk paths, /bin/gawk -> /usr/bin/gawk
> @@ -14,19 +14,22 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>
>  ---
>   src/mpers.awk               | 2 +-
> + tests-m32/caps-abbrev.awk   | 2 +-
>   tests-m32/caps.awk          | 2 +-
>   tests-m32/match.awk         | 2 +-
>   tests-m32/rt_sigaction.awk  | 2 +-
> + tests-mx32/caps-abbrev.awk  | 2 +-
>   tests-mx32/caps.awk         | 2 +-
>   tests-mx32/match.awk        | 2 +-
>   tests-mx32/rt_sigaction.awk | 2 +-
> + tests/caps-abbrev.awk       | 2 +-
>   tests/caps.awk              | 2 +-
>   tests/match.awk             | 2 +-
>   tests/rt_sigaction.awk      | 2 +-
> - 10 files changed, 10 insertions(+), 10 deletions(-)
> + 13 files changed, 13 insertions(+), 13 deletions(-)
>
>  diff --git a/src/mpers.awk b/src/mpers.awk
> -index 25a212f..b2ff53f 100644
> +index 425ab65..33ece5c 100644
>  --- a/src/mpers.awk
>  +++ b/src/mpers.awk
>  @@ -1,4 +1,4 @@
> @@ -35,6 +38,16 @@ index 25a212f..b2ff53f 100644
>   #
>   # Copyright (c) 2015 Elvira Khabirova <lineprinter0@gmail.com>
>   # Copyright (c) 2015-2016 Dmitry V. Levin <ldv@strace.io>
> +diff --git a/tests-m32/caps-abbrev.awk b/tests-m32/caps-abbrev.awk
> +index e8393fd..76c4e51 100644
> +--- a/tests-m32/caps-abbrev.awk
> ++++ b/tests-m32/caps-abbrev.awk
> +@@ -1,4 +1,4 @@
> +-#!/bin/gawk
> ++#!/usr/bin/gawk
> + #
> + # This file is part of caps strace test.
> + #
>  diff --git a/tests-m32/caps.awk b/tests-m32/caps.awk
>  index 69500ec..e5dfd87 100644
>  --- a/tests-m32/caps.awk
> @@ -65,6 +78,16 @@ index dce78f5..573d9ea 100644
>   #
>   # Copyright (c) 2014-2015 Dmitry V. Levin <ldv@strace.io>
>   # Copyright (c) 2016 Elvira Khabirova <lineprinter0@gmail.com>
> +diff --git a/tests-mx32/caps-abbrev.awk b/tests-mx32/caps-abbrev.awk
> +index e8393fd..76c4e51 100644
> +--- a/tests-mx32/caps-abbrev.awk
> ++++ b/tests-mx32/caps-abbrev.awk
> +@@ -1,4 +1,4 @@
> +-#!/bin/gawk
> ++#!/usr/bin/gawk
> + #
> + # This file is part of caps strace test.
> + #
>  diff --git a/tests-mx32/caps.awk b/tests-mx32/caps.awk
>  index 69500ec..e5dfd87 100644
>  --- a/tests-mx32/caps.awk
> @@ -95,6 +118,16 @@ index dce78f5..573d9ea 100644
>   #
>   # Copyright (c) 2014-2015 Dmitry V. Levin <ldv@strace.io>
>   # Copyright (c) 2016 Elvira Khabirova <lineprinter0@gmail.com>
> +diff --git a/tests/caps-abbrev.awk b/tests/caps-abbrev.awk
> +index e8393fd..76c4e51 100644
> +--- a/tests/caps-abbrev.awk
> ++++ b/tests/caps-abbrev.awk
> +@@ -1,4 +1,4 @@
> +-#!/bin/gawk
> ++#!/usr/bin/gawk
> + #
> + # This file is part of caps strace test.
> + #
>  diff --git a/tests/caps.awk b/tests/caps.awk
>  index 69500ec..e5dfd87 100644
>  --- a/tests/caps.awk
> @@ -125,33 +158,3 @@ index dce78f5..573d9ea 100644
>   #
>   # Copyright (c) 2014-2015 Dmitry V. Levin <ldv@strace.io>
>   # Copyright (c) 2016 Elvira Khabirova <lineprinter0@gmail.com>
> -diff --git a/tests-m32/caps-abbrev.awk b/tests-m32/caps-abbrev.awk
> -index c00023b..a56cd56 100644
> ---- a/tests-m32/caps-abbrev.awk
> -+++ b/tests-m32/caps-abbrev.awk
> -@@ -1,4 +1,4 @@
> --#!/bin/gawk
> -+#!/usr/bin/gawk
> - #
> - # This file is part of caps strace test.
> - #
> -diff --git a/tests-mx32/caps-abbrev.awk b/tests-mx32/caps-abbrev.awk
> -index c00023b..a56cd56 100644
> ---- a/tests-mx32/caps-abbrev.awk
> -+++ b/tests-mx32/caps-abbrev.awk
> -@@ -1,4 +1,4 @@
> --#!/bin/gawk
> -+#!/usr/bin/gawk
> - #
> - # This file is part of caps strace test.
> - #
> -diff --git a/tests/caps-abbrev.awk b/tests/caps-abbrev.awk
> -index c00023b..a56cd56 100644
> ---- a/tests/caps-abbrev.awk
> -+++ b/tests/caps-abbrev.awk
> -@@ -1,4 +1,4 @@
> --#!/bin/gawk
> -+#!/usr/bin/gawk
> - #
> - # This file is part of caps strace test.
> - #
> diff --git a/meta/recipes-devtools/strace/strace_6.6.bb b/meta/recipes-de=
vtools/strace/strace_6.7.bb
> similarity index 93%
> rename from meta/recipes-devtools/strace/strace_6.6.bb
> rename to meta/recipes-devtools/strace/strace_6.7.bb
> index ed3033c867..f365477ccd 100644
> --- a/meta/recipes-devtools/strace/strace_6.6.bb
> +++ b/meta/recipes-devtools/strace/strace_6.7.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://strace.io"
>  DESCRIPTION =3D "strace is a diagnostic, debugging and instructional use=
rspace utility for Linux. It is used to monitor and tamper with interaction=
s between processes and the Linux kernel, which include system calls, signa=
l deliveries, and changes of process state."
>  SECTION =3D "console/utils"
>  LICENSE =3D "LGPL-2.1-or-later & GPL-2.0-or-later"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D63c8c3eb5c71b4362edac1397f40b=
dc7"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2433d82e1432a76dc3eadd9002bfe=
304"
>
>  SRC_URI =3D "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
>             file://update-gawk-paths.patch \
> @@ -15,7 +15,7 @@ SRC_URI =3D "https://strace.io/files/${PV}/strace-${PV}=
.tar.xz \
>             file://0001-configure-Use-autoconf-macro-to-detect-largefile-=
sup.patch \
>             file://0002-tests-Replace-off64_t-with-off_t.patch \
>             "
> -SRC_URI[sha256sum] =3D "421b4186c06b705163e64dc85f271ebdcf67660af8667283=
147d5e859fc8a96c"
> +SRC_URI[sha256sum] =3D "2090201e1a3ff32846f4fe421c1163b15f440bb38e31355d=
09f82d3949922af7"
>
>  inherit autotools ptest
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194576): https://lists.openembedded.org/g/openembedde=
d-core/message/194576
> Mute This Topic: https://lists.openembedded.org/mt/104091710/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

