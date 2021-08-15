Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.13683.1629048691177020678
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Aug 2021 10:31:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oJGCtH8b;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id n11so11892341qkk.1
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Aug 2021 10:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oPntXbe6V7emL2G0gtRXJyKGuZBCHwhZ0mJk3+0+PgU=;
        b=oJGCtH8bcSmuCDF9Yp+tD82MlZG2h7OEhGbmvIl2DW4wh9jnO2b3vygyL5uV4JAr8D
         7D3RDGq/ddUPKvmq7UsOuegIhLcFXWeVc7PdNd9jeSVbv88gClxQddBmASY+taGcrCsm
         O3ZVr6F+Fsd/1/eyaT39TC/LxB3HiMzXe7Zj7L7U5HTricNkhc1feVPVNl+5w5g9wz03
         LfPOu+mHkzQRM6bb9V4ePI9pFyrOIdHpBSMLHoEpxpq4VFC8VPHeHLUX5gGe7Z5B7ih9
         AmxFhqoKJxmrbMvqIszB9W+8bNdF5jvrjcVcCGkrHe4Ew6SKy/My5zr0UxRLonu2PdTG
         VpIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oPntXbe6V7emL2G0gtRXJyKGuZBCHwhZ0mJk3+0+PgU=;
        b=brIhL9bAnPqxUpw7HAr5k7SJC1bBtNAGRqH9Iyvn4pBpqao/k2naUGpFYdzuZMaea5
         rwORkhnG4DIXQtdxDTTMY5hepR8XEcKymr72JuC+aEKMUE6qpeLHcZqjC7iEWJS4sN3o
         VqpTOpn+RlMwZNVBe86xCplY47mxHOlPplfi8V46/F1nP0R6w6ebKclInJTulD6801rq
         ByP4m5Mn1xxgs3iFvtyUpmoBHXa8RW6+lvq/ZIryS1ORuQTHwtQvIJi8J1HnlEwg8y0h
         GVkFNEYRWUqkDKZUE31WQONCp7osnCZnw+rbXGMov+MrEmsjMq9iCgt7o0o9G8RwQZMb
         cPZQ==
X-Gm-Message-State: AOAM533BiwTtdcX18j+6GgB+Q876A68BTN8Z1CynVPCtrm+js3/HzO2G
	hT1VhhldGbLmL2w0Ii8BuHVfec48i6T0SyqK3HM=
X-Google-Smtp-Source: ABdhPJw9fWYBO+V7B5E1zwgYn7n0Iag44fNsitYyOlfZzZb/3U4PYGSpMXEJBoIWS12FKmjRe77zIyH6iabu1pDeaLU=
X-Received: by 2002:a05:620a:68a:: with SMTP id f10mr12137962qkh.119.1629048690329;
 Sun, 15 Aug 2021 10:31:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210728075215.154410-1-vinay.m.engg@gmail.com>
 <CANUMPcVVHAPZ1KQEq1kvrEYhvfkFY5oJMMmzxcUzDcpzwEovHA@mail.gmail.com> <YRjcNxUwivcLlpit@piout.net>
In-Reply-To: <YRjcNxUwivcLlpit@piout.net>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 15 Aug 2021 10:31:04 -0700
Message-ID: <CAMKF1sqbLyWPxdESL13RApEt7+NG+FWH+XKEazVvzk07vGa4uA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: Fix CVE-2021-35942
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Vinay Kumar <vinay.m.engg@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, "Mittal, Anuj" <anuj.mittal@intel.com>, 
	Randy MacLeod <rwmacleod@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	umesh kalappa0 <umesh.kalappa0@gmail.com>, vinay.kumar@blackfigtech.com
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 15, 2021 at 2:19 AM Alexandre Belloni
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

We perhaps still need it for hardknott.

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
>
> 
>
