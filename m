Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web09.21519.1629104384981500459
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Aug 2021 01:59:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YH68U8Hw;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id r9so23513050lfn.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Aug 2021 01:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n1v1Gn+P7ocHNRDRsm7YOMAAoUeemJyRKildSyTulhI=;
        b=YH68U8HwraJNJ27ue5RfHO0hTYbO7wn0i5Kmi3o5MFhld9GM0Rfm9kYVarf2BPRzAP
         0yRLdSTJ0yaopCAzfl7g6Xq2PqZYvuAInGbJBdpqUgwSEseKmLUGTZDSXt2wUqse3r1P
         M93bHunmw46AZ/3ZhI1reEXKp0uW472OKNeANJsV3fZsr31tzWfoy6PMiGeQ+42fXUIZ
         6JIkFaTSdRp+vNvNMeNL/wtP/TrvcvpTBMUmG00SGJdPiY4oyjunkzwbcJzpp1X2xrnv
         O9Iq7u3VOiPj1Kv6x61vjUzX40K1g2bbWJHN+T4wRf9OhIWmWseeS6TbCIb930hz0NI/
         FvCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n1v1Gn+P7ocHNRDRsm7YOMAAoUeemJyRKildSyTulhI=;
        b=ZdoNTaoLS3wOGPlXasxGCM7Iz/0cxBfA8dPPyfhdvNK1yPAO8jxxOCuu3QCzoUEusL
         optKjAi/p1w0U3UkHoct79zSXYFtUvuubOPO8mGmN6VdsYCu+LIe0llcOqQbFljDEUfw
         Zh4j60tzW2I5XcgwzlfjJgdDfvjKjOfA6WCpdXUDTm5R6Vjef1UjpWZuJ2PVODu89+RQ
         6ywJyVvC3iSskebHHQe+iqZ6Rn/EkYvconnYRmrUyG6sWJlHXm/g3ojhrI88zw0k/vyF
         en32GVO9yxR//Wy8XxOJlTZ6cIS55KcHjUUbft2C1RAazr621r2J4bOjQ3NNu61WQgLv
         bmaA==
X-Gm-Message-State: AOAM5302KiAtBEaRfLtr7vnd8pD/goRMOqebHPo9dNpHnsDXJSBr7aPX
	+ZMrjMwyiTCi7s9ivMmXqowLrsbToxu4W1/uxq8=
X-Google-Smtp-Source: ABdhPJzk6/EIwD72SHHnG/fQt9LUjz6sHmpaCqna56IFl7obOVwsZAx92Yb+47oxvtXKSkiiAB3LDA7U7qWYwLsTOgo=
X-Received: by 2002:a05:6512:3f89:: with SMTP id x9mr11164978lfa.233.1629104383031;
 Mon, 16 Aug 2021 01:59:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210728075215.154410-1-vinay.m.engg@gmail.com>
 <CANUMPcVVHAPZ1KQEq1kvrEYhvfkFY5oJMMmzxcUzDcpzwEovHA@mail.gmail.com>
 <YRjcNxUwivcLlpit@piout.net> <CAMKF1sqbLyWPxdESL13RApEt7+NG+FWH+XKEazVvzk07vGa4uA@mail.gmail.com>
In-Reply-To: <CAMKF1sqbLyWPxdESL13RApEt7+NG+FWH+XKEazVvzk07vGa4uA@mail.gmail.com>
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
Date: Mon, 16 Aug 2021 14:29:31 +0530
Message-ID: <CANUMPcUknJY4Uhwvz=zJfwszmdJ3D75A+FSj8YKeYW8kcgOPog@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: Fix CVE-2021-35942
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, "Mittal, Anuj" <anuj.mittal@intel.com>, 
	Randy MacLeod <rwmacleod@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	umesh kalappa0 <umesh.kalappa0@gmail.com>, vinay.kumar@blackfigtech.com
Content-Type: text/plain; charset="UTF-8"

Hi Khen Raj,

The patch for hardknott branch was also submitted.
https://lists.openembedded.org/g/openembedded-core/message/154810

Regards,
Vinay

On Sun, Aug 15, 2021 at 11:01 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Sun, Aug 15, 2021 at 2:19 AM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > Hello,
> >
> > On 15/08/2021 13:19:33+0530, Vinay Kumar wrote:
> > > Hi Richard,
> > >
> > > Any update on the above patch.
> > > Please let me know if anything is pending from my side.
> > >
> >
> > I didn't test because the plan is to switch to glibc2.34 which IIRC has
> > the fix.
>
> We perhaps still need it for hardknott.
>
> >
> > > Regards,
> > > Vinay
> > >
> > > On Wed, Jul 28, 2021 at 1:22 PM Vinay Kumar <vinay.m.engg@gmail.com> wrote:
> > > >
> > > > Source: https://sourceware.org/git/glibc.git
> > > > Tracking -- https://sourceware.org/bugzilla/show_bug.cgi?id=28011
> > > >
> > > > Backported upstream commit 5adda61f62b77384718b4c0d8336ade8f2b4b35c to
> > > > glibc-2.33 source.
> > > >
> > > > Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=5adda61f62b77384718b4c0d8336ade8f2b4b35c]
> > > >
> > > > Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> > > > ---
> > > >  .../glibc/glibc/CVE-2021-35942.patch          | 44 +++++++++++++++++++
> > > >  meta/recipes-core/glibc/glibc_2.33.bb         |  1 +
> > > >  2 files changed, 45 insertions(+)
> > > >  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-35942.patch
> > > >
> > > > diff --git a/meta/recipes-core/glibc/glibc/CVE-2021-35942.patch b/meta/recipes-core/glibc/glibc/CVE-2021-35942.patch
> > > > new file mode 100644
> > > > index 0000000000..5cae1bc91c
> > > > --- /dev/null
> > > > +++ b/meta/recipes-core/glibc/glibc/CVE-2021-35942.patch
> > > > @@ -0,0 +1,44 @@
> > > > +From 5adda61f62b77384718b4c0d8336ade8f2b4b35c Mon Sep 17 00:00:00 2001
> > > > +From: Andreas Schwab <schwab@linux-m68k.org>
> > > > +Date: Fri, 25 Jun 2021 15:02:47 +0200
> > > > +Subject: [PATCH] wordexp: handle overflow in positional parameter number (bug
> > > > + 28011)
> > > > +
> > > > +Use strtoul instead of atoi so that overflow can be detected.
> > > > +
> > > > +Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=5adda61f62b77384718b4c0d8336ade8f2b4b35c]
> > > > +CVE: CVE-2021-35942
> > > > +Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> > > > +---
> > > > + posix/wordexp-test.c | 1 +
> > > > + posix/wordexp.c      | 2 +-
> > > > + 2 files changed, 2 insertions(+), 1 deletion(-)
> > > > +
> > > > +diff --git a/posix/wordexp-test.c b/posix/wordexp-test.c
> > > > +index f93a546d7e..9df02dbbb3 100644
> > > > +--- a/posix/wordexp-test.c
> > > > ++++ b/posix/wordexp-test.c
> > > > +@@ -183,6 +183,7 @@ struct test_case_struct
> > > > +     { 0, NULL, "$var", 0, 0, { NULL, }, IFS },
> > > > +     { 0, NULL, "\"\\n\"", 0, 1, { "\\n", }, IFS },
> > > > +     { 0, NULL, "", 0, 0, { NULL, }, IFS },
> > > > ++    { 0, NULL, "${1234567890123456789012}", 0, 0, { NULL, }, IFS },
> > > > +
> > > > +     /* Flags not already covered (testit() has special handling for these) */
> > > > +     { 0, NULL, "one two", WRDE_DOOFFS, 2, { "one", "two", }, IFS },
> > > > +diff --git a/posix/wordexp.c b/posix/wordexp.c
> > > > +index bcbe96e48d..1f3b09f721 100644
> > > > +--- a/posix/wordexp.c
> > > > ++++ b/posix/wordexp.c
> > > > +@@ -1399,7 +1399,7 @@ envsubst:
> > > > +   /* Is it a numeric parameter? */
> > > > +   else if (isdigit (env[0]))
> > > > +     {
> > > > +-      int n = atoi (env);
> > > > ++      unsigned long n = strtoul (env, NULL, 10);
> > > > +
> > > > +       if (n >= __libc_argc)
> > > > +       /* Substitute NULL. */
> > > > +--
> > > > +2.17.1
> > > > +
> > > > diff --git a/meta/recipes-core/glibc/glibc_2.33.bb b/meta/recipes-core/glibc/glibc_2.33.bb
> > > > index e9f01a14c5..abb01f8468 100644
> > > > --- a/meta/recipes-core/glibc/glibc_2.33.bb
> > > > +++ b/meta/recipes-core/glibc/glibc_2.33.bb
> > > > @@ -58,6 +58,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
> > > >             file://0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch \
> > > >             file://mte-backports.patch \
> > > >             file://CVE-2021-33574.patch \
> > > > +           file://CVE-2021-35942.patch \
> > > >             "
> > > >  S = "${WORKDIR}/git"
> > > >  B = "${WORKDIR}/build-${TARGET_SYS}"
> > > > --
> > > > 2.31.1
> > > >
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> >
> > 
> >
