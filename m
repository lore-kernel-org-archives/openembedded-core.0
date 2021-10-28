Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE93C433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Oct 2021 10:15:49 +0000 (UTC)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com
 [209.85.221.174])
 by mx.groups.io with SMTP id smtpd.web10.10930.1635416147808117244
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 03:15:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ikJpKkNW;
 spf=pass (domain: gmail.com, ip: 209.85.221.174,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-vk1-f174.google.com with SMTP id bc10so2715426vkb.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 03:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q7TqyqCr5zuGUfzlZU9lhANyMaju4R6oMG4+fXiCWFY=;
        b=ikJpKkNWWyl8YKIy0KbgneF+kWh+klxea26acwCEazFyKoTAkjlD0b25R9T6G+jASk
         Bu8vYG/MOQMWbpWtkf/302nwfVlWcY5n6gYLSRHXjzlxG7XkBCwlAAiEOeqDdlaXqwrf
         Ms5IAzUrkOkA+tkkdlxSTTk48taZeoAAoOGxHHCd5XQqHQryJLNXlpF3o4sq8+UXowxx
         Jeqpsm/AK72ARLrAYZbBPXwoDqUccK3hDOxiIayZGF3S84X7hLNWQvNxd37fNgE2JWRu
         f2jtazoiIXOW3rLQEO70e7Tw2CdbClN1aCyp6Ew7Y7D+17RwLLFVy2CYGtB9l7+JY4Xl
         sKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q7TqyqCr5zuGUfzlZU9lhANyMaju4R6oMG4+fXiCWFY=;
        b=6/GWQnb542stBlocwYk4XZlYJqlhF5vOTe6Il31t0UfOTJwAVH8bgh1lAUhQI6s7Rf
         PMtCuTOOHiCrelircUm88Dl8F5K1o0sepHlETj6FcFdatyd/u635x6tHsmk4AIfK04c5
         ZOLYVIwYng1mqq7rQePNH7dIj37FfU5wlGtabLQ/b+mwX962A6m46TeJlsrWGKcPqyhg
         at32GUGUJy63rvsmkMvI5tr/2p95vL8hUCfzMUCRCtTKrvuMktrCBasiHbAgn5VtE9GJ
         BR/RnWvl2Yem6MpdOFcYuDFPBmnKyq34NO/CJOMZqPHoEXqzMV+5VJ35j4iZOlz+AGsd
         RktA==
X-Gm-Message-State: AOAM531joa3ihB5MPKMaxWLb5vPHMSVH9VJxNOQ7Hy5/OsdGALsnQOB7
	DkxuXqmPwqkzHCxiqj0tLWFUmOVrkCuDnbFdUOk=
X-Google-Smtp-Source: 
 ABdhPJzBPhLK3ZFWgPMHLmy+BEQyQjk0I4h5SjyAROFckfXDy14fi9X0i2dbIEV8/VEoBim767OsYX9+9A9Y9riDB3c=
X-Received: by 2002:a05:6122:2e8:: with SMTP id
 b8mr2588241vko.23.1635416146670;
 Thu, 28 Oct 2021 03:15:46 -0700 (PDT)
MIME-Version: 1.0
References: <20211028095814.171717-1-pgowda.cve@gmail.com>
 <0c8605845a24803452ebb70082330af16dead6e4.camel@intel.com>
In-Reply-To: <0c8605845a24803452ebb70082330af16dead6e4.camel@intel.com>
From: pgowda cve <pgowda.cve@gmail.com>
Date: Thu, 28 Oct 2021 15:45:36 +0530
Message-ID: 
 <CALY4985BksEzoDLUBN=Jvv=q7f1UOtRxEE+6Fc_8OQmZ_r1QOQ@mail.gmail.com>
Subject: Re: [hardknott][PATCH v2] binutils: Fix CVE-2021-3530
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"rwmacleod@gmail.com" <rwmacleod@gmail.com>,
 "umesh.kalappa0@gmail.com" <umesh.kalappa0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Oct 2021 10:15:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157588

>> Did you mean CVE-2021-3530 here and in the patches below as well?

Should I have it in the commit message or in the patches?

Thanks,
Naveen

On Thu, Oct 28, 2021 at 3:32 PM Mittal, Anuj <anuj.mittal@intel.com> wrote:
>
> On Thu, 2021-10-28 at 02:58 -0700, Pgowda wrote:
> > CVE: CVE-2015-3530
>
> Did you mean CVE-2021-3530 here and in the patches below as well?
>
> Thanks,
>
> Anuj
>
> > Upstream-Status:
> > Backport[https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=25162c795b1a2becf936bb3581d86a307ea491eb
> > ]
> > Upstream-Status:
> > Backport[https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=999566402e3
> > ]
> >
> > Signed-off-by: Pgowda <pgowda.cve@gmail.com>
> > ---
> >  .../binutils/binutils-2.36.inc                |   2 +
> >  .../binutils/0017-CVE-2021-3530.patch         | 102
> > ++++++++++++++++++
> >  .../binutils/0018-CVE-2021-3530.patch         |  64 +++++++++++
> >  3 files changed, 168 insertions(+)
> >  create mode 100644 meta/recipes-devtools/binutils/binutils/0017-CVE-
> > 2021-3530.patch
> >  create mode 100644 meta/recipes-devtools/binutils/binutils/0018-CVE-
> > 2021-3530.patch
> >
> > diff --git a/meta/recipes-devtools/binutils/binutils-2.36.inc
> > b/meta/recipes-devtools/binutils/binutils-2.36.inc
> > index 9d770db5a8..7d0824e060 100644
> > --- a/meta/recipes-devtools/binutils/binutils-2.36.inc
> > +++ b/meta/recipes-devtools/binutils/binutils-2.36.inc
> > @@ -44,5 +44,7 @@ SRC_URI = "\
> >       file://0001-CVE-2021-20197.patch \
> >       file://0002-CVE-2021-20197.patch \
> >       file://0003-CVE-2021-20197.patch \
> > +     file://0017-CVE-2021-3530.patch \
> > +     file://0018-CVE-2021-3530.patch \
> >  "
> >  S  = "${WORKDIR}/git"
> > diff --git a/meta/recipes-devtools/binutils/binutils/0017-CVE-2021-
> > 3530.patch b/meta/recipes-devtools/binutils/binutils/0017-CVE-2021-
> > 3530.patch
> > new file mode 100644
> > index 0000000000..3eba99132b
> > --- /dev/null
> > +++ b/meta/recipes-devtools/binutils/binutils/0017-CVE-2021-
> > 3530.patch
> > @@ -0,0 +1,102 @@
> > +From 25162c795b1a2becf936bb3581d86a307ea491eb Mon Sep 17 00:00:00
> > 2001
> > +From: Nick Clifton <nickc@redhat.com>
> > +Date: Thu, 15 Jul 2021 16:51:56 +0100
> > +Subject: [PATCH] Fix a stack exhaustion problem in the Rust
> > demangling code in
> > + the libiberty library.
> > +
> > +       PR 99935
> > +       * rust-demangle.c: Add recursion limit.
> > +
> > +CVE: CVE-2015-3530
> > +Upstream-Status:
> > Backport[https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=25162c795b1a2becf936bb3581d86a307ea491eb
> > ]
> > +Signed-off-by: Pgowda <pgowda.cve@gmail.com>
> > +
> > +---
> > + libiberty/ChangeLog       |  5 +++++
> > + libiberty/rust-demangle.c | 31 +++++++++++++++++++++++++------
> > + 2 files changed, 30 insertions(+), 6 deletions(-)
> > +
> > +diff --git a/libiberty/ChangeLog b/libiberty/ChangeLog
> > +index bc1b35b97c4..8e39fd28eba 100644
> > +--- a/libiberty/ChangeLog
> > ++++ b/libiberty/ChangeLog
> > +@@ -1,3 +1,8 @@
> > ++2021-07-15  Nick Clifton  <nickc@redhat.com>
> > ++
> > ++      PR 99935
> > ++      * rust-demangle.c: Add recursion limit.
> > ++
> > + 2021-01-04  Martin Liska  <mliska@suse.cz>
> > +
> > +       * strverscmp.c: Convert to utf8 from iso8859.
> > +diff --git a/libiberty/rust-demangle.c b/libiberty/rust-demangle.c
> > +index 449941b56dc..df09b7b8fdd 100644
> > +--- a/libiberty/rust-demangle.c
> > ++++ b/libiberty/rust-demangle.c
> > +@@ -74,6 +74,12 @@ struct rust_demangler
> > +   /* Rust mangling version, with legacy mangling being -1. */
> > +   int version;
> > +
> > ++  /* Recursion depth.  */
> > ++  uint recursion;
> > ++  /* Maximum number of times demangle_path may be called
> > recursively.  */
> > ++#define RUST_MAX_RECURSION_COUNT  1024
> > ++#define RUST_NO_RECURSION_LIMIT   ((uint) -1)
> > ++
> > +   uint64_t bound_lifetime_depth;
> > + };
> > +
> > +@@ -671,6 +677,15 @@ demangle_path (struct rust_demangler *rd
> > +   if (rdm->errored)
> > +     return;
> > +
> > ++  if (rdm->recursion != RUST_NO_RECURSION_LIMIT)
> > ++    {
> > ++      ++ rdm->recursion;
> > ++      if (rdm->recursion > RUST_MAX_RECURSION_COUNT)
> > ++      /* FIXME: There ought to be a way to report
> > ++         that the recursion limit has been reached.  */
> > ++      goto fail_return;
> > ++    }
> > ++
> > +   switch (tag = next (rdm))
> > +     {
> > +     case 'C':
> > +@@ -688,10 +703,7 @@ demangle_path (struct rust_demangler *rd
> > +     case 'N':
> > +       ns = next (rdm);
> > +       if (!ISLOWER (ns) && !ISUPPER (ns))
> > +-        {
> > +-          rdm->errored = 1;
> > +-          return;
> > +-        }
> > ++      goto fail_return;
> > +
> > +       demangle_path (rdm, in_value);
> > +
> > +@@ -776,9 +788,15 @@ demangle_path (struct rust_demangler *rd
> > +         }
> > +       break;
> > +     default:
> > +-      rdm->errored = 1;
> > +-      return;
> > ++      goto fail_return;
> > +     }
> > ++  goto pass_return;
> > ++
> > ++ fail_return:
> > ++  rdm->errored = 1;
> > ++ pass_return:
> > ++  if (rdm->recursion != RUST_NO_RECURSION_LIMIT)
> > ++    -- rdm->recursion;
> > + }
> > +
> > + static void
> > +@@ -1317,6 +1335,7 @@ rust_demangle_callback (const char *mang
> > +   rdm.skipping_printing = 0;
> > +   rdm.verbose = (options & DMGL_VERBOSE) != 0;
> > +   rdm.version = 0;
> > ++  rdm.recursion = (options & DMGL_NO_RECURSE_LIMIT) ?
> > RUST_NO_RECURSION_LIMIT : 0;
> > +   rdm.bound_lifetime_depth = 0;
> > +
> > +   /* Rust symbols always start with _R (v0) or _ZN (legacy). */
> > diff --git a/meta/recipes-devtools/binutils/binutils/0018-CVE-2021-
> > 3530.patch b/meta/recipes-devtools/binutils/binutils/0018-CVE-2021-
> > 3530.patch
> > new file mode 100644
> > index 0000000000..857ac5b3d0
> > --- /dev/null
> > +++ b/meta/recipes-devtools/binutils/binutils/0018-CVE-2021-
> > 3530.patch
> > @@ -0,0 +1,64 @@
> > +From 999566402e3d7c69032bbf47e28b44fc0926fe62 Mon Sep 17 00:00:00
> > 2001
> > +From: Christopher Wellons <wellons@nullprogram.com>
> > +Date: Sun, 18 Jul 2021 16:57:19 -0400
> > +Subject: [PATCH] Change "uint" to "unsigned"
> > +
> > +This fixes a defect introduced in 25162c795. The "uint" type has not
> > +been explicitly defined here on mingw, causing compilation to fail.
> > +
> > +On linux we have this in /usr/include/sys/types.h
> > +
> > +/* Old compatibility names for C types.  */
> > +typedef unsigned long int ulong;
> > +typedef unsigned short int ushort;
> > +typedef unsigned int uint;
> > +
> > +So it's easy to see how such bugs can creep in.
> > +
> > +       * rust-demangle.c (struct rust_demangler): Change type of
> > +       "recursion" to unsigned.
> > +       (RUST_NO_RECURSION_LIMIT): Similarly in cast.
> > +
> > +CVE: CVE-2015-3530
> > +Upstream-Status:
> > Backport[https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=999566402e3
> > ]
> > +Signed-off-by: Pgowda <pgowda.cve@gmail.com>
> > +
> > +---
> > + libiberty/ChangeLog       | 6 ++++++
> > + libiberty/rust-demangle.c | 4 ++--
> > + 2 files changed, 8 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/libiberty/ChangeLog b/libiberty/ChangeLog
> > +index 8e39fd28eba..3f749455f05 100644
> > +--- a/libiberty/ChangeLog
> > ++++ b/libiberty/ChangeLog
> > +@@ -1,3 +1,9 @@
> > ++2021-07-19  Christopher Wellons  <wellons@nullprogram.com>
> > ++
> > ++      * rust-demangle.c (struct rust_demangler): Change type of
> > ++      "recursion" to unsigned.
> > ++      (RUST_NO_RECURSION_LIMIT): Similarly in cast.
> > ++
> > + 2021-07-15  Nick Clifton  <nickc@redhat.com>
> > +
> > +       PR 99935
> > +diff --git a/libiberty/rust-demangle.c b/libiberty/rust-demangle.c
> > +index df09b7b8fdd..ac1eb8eb02c 100644
> > +--- a/libiberty/rust-demangle.c
> > ++++ b/libiberty/rust-demangle.c
> > +@@ -75,10 +75,10 @@ struct rust_demangler
> > +   int version;
> > +
> > +   /* Recursion depth.  */
> > +-  uint recursion;
> > ++  unsigned recursion;
> > +   /* Maximum number of times demangle_path may be called
> > recursively.  */
> > + #define RUST_MAX_RECURSION_COUNT  1024
> > +-#define RUST_NO_RECURSION_LIMIT   ((uint) -1)
> > ++#define RUST_NO_RECURSION_LIMIT   ((unsigned) -1)
> > +
> > +   uint64_t bound_lifetime_depth;
> > + };
> > +--
> > +2.27.0
> > +
>

