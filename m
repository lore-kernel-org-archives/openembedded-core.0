Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web12.65944.1629350128728228221
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Aug 2021 22:15:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lPATRxIC;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id y7so9368312ljp.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Aug 2021 22:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g2YQbZvj4BrCHv90oI8kGo0yY1mqMbaFD4echHoJZMo=;
        b=lPATRxICuvGSteYRJjEc0d3xWirN4F8RZ0QXrcVIoMKOe9+huKn081K+h6PkYtFpSC
         wXJUwbYgCjaJ+xk5kktPldNeW7rLuAJJ9u4IjfShoferuWAHly2rHZ00ts9NoxbYU3EE
         LynRH9RUtKDxPyEwaZNfqo7CBtpQR/HXSdhChRAIxSfH/vbHLRHe91Zd3TNtt/QiSLLW
         XKKMWsl4YSl4pWg7fZVfDLn1ZXIvkuT2ofK/zNUyWcwvg2rI1TxgQ8zyjpxS3VynpY1d
         MISIR6mdoKXRWUx4DQeUzFz2SXBaqNTtv3MgQrvPaQL9M2eoqfSZlVh0JpyHKQ/7gg4M
         mAyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g2YQbZvj4BrCHv90oI8kGo0yY1mqMbaFD4echHoJZMo=;
        b=p+TCWkKP2u4UffNF840fqv8dzK9H+KDYv/JCnevuCWwTUYsMBYSTEo6TZsIeMM7M3p
         oV4bH2XhObIuOP7JGCt04C4cnpi8Ga7ZaBaHrzaljmnxzmVpvMf8rTS0+ZbdDECSedY3
         kt7/e0X0w+7k/bF4lhcs4l7tfP9bxfI1cUZWjCWD4k17OjgQ7x0dVNLRlm1MW5H5I3Uz
         Cd92Opb9krAY0E5qc+8/ywgtUsSPpxn7x0Qt7OIxr3GS8OsJPEBj+631e3WzAQ/tTIoh
         YkpbYoRTlpNPuWEw7V7S4CSK690aW8OxMVeFS/lJzBYxx1iTreh3CcEmlk9logunA6kK
         1eQg==
X-Gm-Message-State: AOAM532hSlD9YY1P+rC4iZ8zKEilGdnQ9YOnStIp6ClNEi7X5Ty9+FJk
	nOtdR0dB0vRIvUyOspKpj5k4cCMEQbu3E9O6aLg=
X-Google-Smtp-Source: ABdhPJwzCH0WOkpnNgTMvLCg2+Cbicfy4UG9z0rhmgscvZhyADfnsfDg4W2ASX/D21PjVXAptu6SHSvf69fU/HVwe1A=
X-Received: by 2002:a05:651c:1683:: with SMTP id bd3mr8066952ljb.323.1629350126711;
 Wed, 18 Aug 2021 22:15:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210728075215.154410-1-vinay.m.engg@gmail.com>
 <CANUMPcVVHAPZ1KQEq1kvrEYhvfkFY5oJMMmzxcUzDcpzwEovHA@mail.gmail.com>
 <YRjcNxUwivcLlpit@piout.net> <CAMKF1sqbLyWPxdESL13RApEt7+NG+FWH+XKEazVvzk07vGa4uA@mail.gmail.com>
 <CANUMPcUknJY4Uhwvz=zJfwszmdJ3D75A+FSj8YKeYW8kcgOPog@mail.gmail.com> <CAMKF1sqj2ydKKeLGeHRE8uwyde7aS4h1v5tgiHt+ijijX2NQqA@mail.gmail.com>
In-Reply-To: <CAMKF1sqj2ydKKeLGeHRE8uwyde7aS4h1v5tgiHt+ijijX2NQqA@mail.gmail.com>
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
Date: Thu, 19 Aug 2021 10:45:15 +0530
Message-ID: <CANUMPcU=TTx2C24PPTCi2DUbpgXWSWsjrKKGy72ikrZsy+ih-A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: Fix CVE-2021-35942
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, "Mittal, Anuj" <anuj.mittal@intel.com>, 
	Randy MacLeod <rwmacleod@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	umesh kalappa0 <umesh.kalappa0@gmail.com>, vinay.kumar@blackfigtech.com
Content-Type: text/plain; charset="UTF-8"

Hi Khem Raj,

FYI, the patch is committed in hardknott branch,
https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?h=hardknott&id=9df882ce6835692774c649405fcb474ea0eacda4

Regards,
Vinay

On Mon, Aug 16, 2021 at 8:45 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, Aug 16, 2021 at 1:59 AM Vinay Kumar <vinay.m.engg@gmail.com> wrote:
> >
> > Hi Khen Raj,
> >
> > The patch for hardknott branch was also submitted.
> > https://lists.openembedded.org/g/openembedded-core/message/154810
>
> OK, now we have glibc 2.34 in master so the master version is not
> needed anymore but we still should pursue the hardknott version.
> Please bring it to hardknott maintainer's attention if need be.
>
> >
> > Regards,
> > Vinay
> >
> > On Sun, Aug 15, 2021 at 11:01 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > On Sun, Aug 15, 2021 at 2:19 AM Alexandre Belloni
> > > <alexandre.belloni@bootlin.com> wrote:
> > > >
> > > > Hello,
> > > >
> > > > On 15/08/2021 13:19:33+0530, Vinay Kumar wrote:
> > > > > Hi Richard,
> > > > >
> > > > > Any update on the above patch.
> > > > > Please let me know if anything is pending from my side.
> > > > >
> > > >
> > > > I didn't test because the plan is to switch to glibc2.34 which IIRC has
> > > > the fix.
> > >
> > > We perhaps still need it for hardknott.
> > >
> > > >
> > > > > Regards,
> > > > > Vinay
> > > > >
> > > > > On Wed, Jul 28, 2021 at 1:22 PM Vinay Kumar <vinay.m.engg@gmail.com> wrote:
> > > > > >
> > > > > > Source: https://sourceware.org/git/glibc.git
> > > > > > Tracking -- https://sourceware.org/bugzilla/show_bug.cgi?id=28011
> > > > > >
> > > > > > Backported upstream commit 5adda61f62b77384718b4c0d8336ade8f2b4b35c to
> > > > > > glibc-2.33 source.
> > > > > >
> > > > > > Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=5adda61f62b77384718b4c0d8336ade8f2b4b35c]
> > > > > >
> > > > > > Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> > > > > > ---
> > > > > >  .../glibc/glibc/CVE-2021-35942.patch          | 44 +++++++++++++++++++
> > > > > >  meta/recipes-core/glibc/glibc_2.33.bb         |  1 +
> > > > > >  2 files changed, 45 insertions(+)
> > > > > >  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-35942.patch
> > > > > >
> > > > > > diff --git a/meta/recipes-core/glibc/glibc/CVE-2021-35942.patch b/meta/recipes-core/glibc/glibc/CVE-2021-35942.patch
> > > > > > new file mode 100644
> > > > > > index 0000000000..5cae1bc91c
> > > > > > --- /dev/null
> > > > > > +++ b/meta/recipes-core/glibc/glibc/CVE-2021-35942.patch
> > > > > > @@ -0,0 +1,44 @@
> > > > > > +From 5adda61f62b77384718b4c0d8336ade8f2b4b35c Mon Sep 17 00:00:00 2001
> > > > > > +From: Andreas Schwab <schwab@linux-m68k.org>
> > > > > > +Date: Fri, 25 Jun 2021 15:02:47 +0200
> > > > > > +Subject: [PATCH] wordexp: handle overflow in positional parameter number (bug
> > > > > > + 28011)
> > > > > > +
> > > > > > +Use strtoul instead of atoi so that overflow can be detected.
> > > > > > +
> > > > > > +Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=5adda61f62b77384718b4c0d8336ade8f2b4b35c]
> > > > > > +CVE: CVE-2021-35942
> > > > > > +Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> > > > > > +---
> > > > > > + posix/wordexp-test.c | 1 +
> > > > > > + posix/wordexp.c      | 2 +-
> > > > > > + 2 files changed, 2 insertions(+), 1 deletion(-)
> > > > > > +
> > > > > > +diff --git a/posix/wordexp-test.c b/posix/wordexp-test.c
> > > > > > +index f93a546d7e..9df02dbbb3 100644
> > > > > > +--- a/posix/wordexp-test.c
> > > > > > ++++ b/posix/wordexp-test.c
> > > > > > +@@ -183,6 +183,7 @@ struct test_case_struct
> > > > > > +     { 0, NULL, "$var", 0, 0, { NULL, }, IFS },
> > > > > > +     { 0, NULL, "\"\\n\"", 0, 1, { "\\n", }, IFS },
> > > > > > +     { 0, NULL, "", 0, 0, { NULL, }, IFS },
> > > > > > ++    { 0, NULL, "${1234567890123456789012}", 0, 0, { NULL, }, IFS },
> > > > > > +
> > > > > > +     /* Flags not already covered (testit() has special handling for these) */
> > > > > > +     { 0, NULL, "one two", WRDE_DOOFFS, 2, { "one", "two", }, IFS },
> > > > > > +diff --git a/posix/wordexp.c b/posix/wordexp.c
> > > > > > +index bcbe96e48d..1f3b09f721 100644
> > > > > > +--- a/posix/wordexp.c
> > > > > > ++++ b/posix/wordexp.c
> > > > > > +@@ -1399,7 +1399,7 @@ envsubst:
> > > > > > +   /* Is it a numeric parameter? */
> > > > > > +   else if (isdigit (env[0]))
> > > > > > +     {
> > > > > > +-      int n = atoi (env);
> > > > > > ++      unsigned long n = strtoul (env, NULL, 10);
> > > > > > +
> > > > > > +       if (n >= __libc_argc)
> > > > > > +       /* Substitute NULL. */
> > > > > > +--
> > > > > > +2.17.1
> > > > > > +
> > > > > > diff --git a/meta/recipes-core/glibc/glibc_2.33.bb b/meta/recipes-core/glibc/glibc_2.33.bb
> > > > > > index e9f01a14c5..abb01f8468 100644
> > > > > > --- a/meta/recipes-core/glibc/glibc_2.33.bb
> > > > > > +++ b/meta/recipes-core/glibc/glibc_2.33.bb
> > > > > > @@ -58,6 +58,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
> > > > > >             file://0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch \
> > > > > >             file://mte-backports.patch \
> > > > > >             file://CVE-2021-33574.patch \
> > > > > > +           file://CVE-2021-35942.patch \
> > > > > >             "
> > > > > >  S = "${WORKDIR}/git"
> > > > > >  B = "${WORKDIR}/build-${TARGET_SYS}"
> > > > > > --
> > > > > > 2.31.1
> > > > > >
> > > >
> > > > --
> > > > Alexandre Belloni, co-owner and COO, Bootlin
> > > > Embedded Linux and Kernel engineering
> > > > https://bootlin.com
> > > >
> > > > 
> > > >
