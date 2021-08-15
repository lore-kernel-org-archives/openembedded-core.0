Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web12.9551.1629021232923364630
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Aug 2021 02:53:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=i/nmwhj5;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id c24so28454342lfi.11
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Aug 2021 02:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=izBO2wTozBarv83scJNPcTmEeVHQX0js/ttGHqhl4Qc=;
        b=i/nmwhj5oznmCo1+M9s+bWCWTCjb/C7JqOq5ThbOxk0erSu8C4d1N12wMWHkUTfoHk
         /FlLyhrCus//evxtd2iEeRMEqTmJc9cNt312bBS017XZiIhzEfAnyMNKhHSusxlG9mpu
         5/sbN8Gat4nyW2hhUzMBG+ykrokJdywuENpAIZ8yGKjixylmQ2nfeJguclNOSnCVyGcn
         lyHUwhVNmow8O85UDQeZv18etMpvTGtkuLC0pbfVODg/4x4TfscrUmyLq14QIVsvs+p+
         77lrRAtVmi9NL/ZuuXa73TPIA+OEmEV6JbLMw3+VIwHB1AE3VoV4vJlUHSMRgRatY/67
         ZPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=izBO2wTozBarv83scJNPcTmEeVHQX0js/ttGHqhl4Qc=;
        b=GBSHjjJT5gQ5QJpr12e2WVgcyOoW4uBVIrFDefP0uTr+OfiyZ7bm2xhrkocoxCDgko
         qWaFtUOGT4oVF+P4ViIfs/oecWMMEAasw6egxZw2zZYlZOBxuW99HcdODtvIyUi+mxZa
         EpbcgxaaQuJcu5jdY62Lgc7PHDzFlECLMCWAT9GnQL3EEtwdC7kly1dMdAHVgumZ1Omu
         88zA1L01THVOa0lejpRly1Axjd1HVsGV1YW2F+N6VTHGetRYaUDKYNKGlhiswB9soixT
         XxXAQiAeTVN3A4MpRHUsvr+QqoiXhUdmmGnPsmwIiT9Vsa6W4j4rlNv7Sgtnw5kgdYT5
         SRzA==
X-Gm-Message-State: AOAM530RGB83URSFoldi0FX5VkD/n76X2OxfwNwyxyNGm18nwgUqOGkr
	UoHCGAYM8BKa5SAZfhq3h9pW/sOTO7SGJTciHJA=
X-Google-Smtp-Source: ABdhPJz7LOYj/ek1mo8APxmXfTUu05HS9aklRal+l+dWbY8AwHctGPqCwU/1p55eBiRDA6BFAFdFwuXb7u8xhPC/Z8Q=
X-Received: by 2002:a05:6512:3455:: with SMTP id j21mr2449608lfr.8.1629021231078;
 Sun, 15 Aug 2021 02:53:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210728075215.154410-1-vinay.m.engg@gmail.com>
 <CANUMPcVVHAPZ1KQEq1kvrEYhvfkFY5oJMMmzxcUzDcpzwEovHA@mail.gmail.com> <YRjcNxUwivcLlpit@piout.net>
In-Reply-To: <YRjcNxUwivcLlpit@piout.net>
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
Date: Sun, 15 Aug 2021 15:23:39 +0530
Message-ID: <CANUMPcUzT2-PD-pFoik39jQf_mH_heM_6it=LSCk+7DWO5cDew@mail.gmail.com>
Subject: Re: [PATCH] glibc: Fix CVE-2021-35942
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"Mittal, Anuj" <anuj.mittal@intel.com>, Randy MacLeod <rwmacleod@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	umesh kalappa0 <umesh.kalappa0@gmail.com>, vinay.kumar@blackfigtech.com
Content-Type: text/plain; charset="UTF-8"

Hi Alexandre,

Thanks for confirming.

Regards,
Vinay

On Sun, Aug 15, 2021 at 2:49 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello,
>
> On 15/08/2021 13:19:33+0530, Vinay Kumar wrote:
> > Hi Richard,
> >
> > Any update on the above patch.
> > Please let me know if anything is pending from my side.
> >
>
> I didn't test because the plan is to switch to glibc2.34 which IIRC has
> the fix.
>
> > Regards,
> > Vinay
> >
> > On Wed, Jul 28, 2021 at 1:22 PM Vinay Kumar <vinay.m.engg@gmail.com> wrote:
> > >
> > > Source: https://sourceware.org/git/glibc.git
> > > Tracking -- https://sourceware.org/bugzilla/show_bug.cgi?id=28011
> > >
> > > Backported upstream commit 5adda61f62b77384718b4c0d8336ade8f2b4b35c to
> > > glibc-2.33 source.
> > >
> > > Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=5adda61f62b77384718b4c0d8336ade8f2b4b35c]
> > >
> > > Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> > > ---
> > >  .../glibc/glibc/CVE-2021-35942.patch          | 44 +++++++++++++++++++
> > >  meta/recipes-core/glibc/glibc_2.33.bb         |  1 +
> > >  2 files changed, 45 insertions(+)
> > >  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-35942.patch
> > >
> > > diff --git a/meta/recipes-core/glibc/glibc/CVE-2021-35942.patch b/meta/recipes-core/glibc/glibc/CVE-2021-35942.patch
> > > new file mode 100644
> > > index 0000000000..5cae1bc91c
> > > --- /dev/null
> > > +++ b/meta/recipes-core/glibc/glibc/CVE-2021-35942.patch
> > > @@ -0,0 +1,44 @@
> > > +From 5adda61f62b77384718b4c0d8336ade8f2b4b35c Mon Sep 17 00:00:00 2001
> > > +From: Andreas Schwab <schwab@linux-m68k.org>
> > > +Date: Fri, 25 Jun 2021 15:02:47 +0200
> > > +Subject: [PATCH] wordexp: handle overflow in positional parameter number (bug
> > > + 28011)
> > > +
> > > +Use strtoul instead of atoi so that overflow can be detected.
> > > +
> > > +Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=5adda61f62b77384718b4c0d8336ade8f2b4b35c]
> > > +CVE: CVE-2021-35942
> > > +Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> > > +---
> > > + posix/wordexp-test.c | 1 +
> > > + posix/wordexp.c      | 2 +-
> > > + 2 files changed, 2 insertions(+), 1 deletion(-)
> > > +
> > > +diff --git a/posix/wordexp-test.c b/posix/wordexp-test.c
> > > +index f93a546d7e..9df02dbbb3 100644
> > > +--- a/posix/wordexp-test.c
> > > ++++ b/posix/wordexp-test.c
> > > +@@ -183,6 +183,7 @@ struct test_case_struct
> > > +     { 0, NULL, "$var", 0, 0, { NULL, }, IFS },
> > > +     { 0, NULL, "\"\\n\"", 0, 1, { "\\n", }, IFS },
> > > +     { 0, NULL, "", 0, 0, { NULL, }, IFS },
> > > ++    { 0, NULL, "${1234567890123456789012}", 0, 0, { NULL, }, IFS },
> > > +
> > > +     /* Flags not already covered (testit() has special handling for these) */
> > > +     { 0, NULL, "one two", WRDE_DOOFFS, 2, { "one", "two", }, IFS },
> > > +diff --git a/posix/wordexp.c b/posix/wordexp.c
> > > +index bcbe96e48d..1f3b09f721 100644
> > > +--- a/posix/wordexp.c
> > > ++++ b/posix/wordexp.c
> > > +@@ -1399,7 +1399,7 @@ envsubst:
> > > +   /* Is it a numeric parameter? */
> > > +   else if (isdigit (env[0]))
> > > +     {
> > > +-      int n = atoi (env);
> > > ++      unsigned long n = strtoul (env, NULL, 10);
> > > +
> > > +       if (n >= __libc_argc)
> > > +       /* Substitute NULL. */
> > > +--
> > > +2.17.1
> > > +
> > > diff --git a/meta/recipes-core/glibc/glibc_2.33.bb b/meta/recipes-core/glibc/glibc_2.33.bb
> > > index e9f01a14c5..abb01f8468 100644
> > > --- a/meta/recipes-core/glibc/glibc_2.33.bb
> > > +++ b/meta/recipes-core/glibc/glibc_2.33.bb
> > > @@ -58,6 +58,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
> > >             file://0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch \
> > >             file://mte-backports.patch \
> > >             file://CVE-2021-33574.patch \
> > > +           file://CVE-2021-35942.patch \
> > >             "
> > >  S = "${WORKDIR}/git"
> > >  B = "${WORKDIR}/build-${TARGET_SYS}"
> > > --
> > > 2.31.1
> > >
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
