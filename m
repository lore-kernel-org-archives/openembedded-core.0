Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web10.25623.1629126916332488360
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Aug 2021 08:15:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MgQ+zw/m;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id t3so19370715qkg.11
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Aug 2021 08:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ILC9jwyVKOENA9C8SSQFvGQIqVyoykQzIINTAB5sN84=;
        b=MgQ+zw/mfygboiYkT1mxVFxZ9jrJvH5Achu2RdNteRGx2d2+T6yZq/eWceHSg52JCc
         C4emUHyuopUEA+iOJput2Ft148v0aRx/5ske577K9Q2OOhxIV4N+m3NGd+0b0jUQHx7E
         8VG2WxxLMQHY/lTTtg816JywHShnhgnjKkhjzSy4n+bzUIrdKyoW2BbGiXunhhc6N5Hx
         ak4wtEQWuYLtUdzIfIYQLYPwF4xvW/+ZYwzO3xxxsJ+xJUE26sgZopRZqNt5WbfCO2Id
         W3ugMwI548YlHkbK+j3TutFmCl+EhC0cBqMy0juLBsKM9YnU49ldz1jXhGS1g9D0vA4n
         uyPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ILC9jwyVKOENA9C8SSQFvGQIqVyoykQzIINTAB5sN84=;
        b=amxTPLUj71/5QC7TG7qMVzI7ZwuTusbom4BIF7p+IXZ2X1ofuKBHA9CrGMTgjsQw3V
         JTOmFTt8FXbQ17H6l2inC7KMGw5+uYtXFeRdKDREeTfLmAHRU81knqchA8AdJBflWuiS
         jqnBJTfNaXvuTneL3yisBVsXFlxFoRK1bVEiCk3YCZVjGuerWtgZrtUvT/tM8MFwCeNp
         uCNZ+FfQjdOuiOF7xkGwNdb+W3GH1A8RmgUZCnWwXIJ5vf95AtTegt4d4kS/oOnYjqkK
         x4XU7maDYf7JFFqO0IylX8Tnp3KR4FdA10h+OCrs+CzFchPN+NxHsX1Wtt9UkvHlcW85
         Nw5g==
X-Gm-Message-State: AOAM531vyOwiJQreYfVyu6JuntY9Ah0kJLmTmz/4sJKScjWaTW/Nq2Gp
	I+C5n3KmBlN+3lFKhzT1w4AFQjwkNjN7TJto/zQ=
X-Google-Smtp-Source: ABdhPJwiWHxO2SjdvuAIin3b4kA6cO3/adBs+j5cAp2hNK57USeofXHS6vTDQFQVVbpg0tO6DvoaukQtvQ0uap6nrYk=
X-Received: by 2002:a05:620a:88d:: with SMTP id b13mr16438527qka.125.1629126915457;
 Mon, 16 Aug 2021 08:15:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210728075215.154410-1-vinay.m.engg@gmail.com>
 <CANUMPcVVHAPZ1KQEq1kvrEYhvfkFY5oJMMmzxcUzDcpzwEovHA@mail.gmail.com>
 <YRjcNxUwivcLlpit@piout.net> <CAMKF1sqbLyWPxdESL13RApEt7+NG+FWH+XKEazVvzk07vGa4uA@mail.gmail.com>
 <CANUMPcUknJY4Uhwvz=zJfwszmdJ3D75A+FSj8YKeYW8kcgOPog@mail.gmail.com>
In-Reply-To: <CANUMPcUknJY4Uhwvz=zJfwszmdJ3D75A+FSj8YKeYW8kcgOPog@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 16 Aug 2021 08:14:49 -0700
Message-ID: <CAMKF1sqj2ydKKeLGeHRE8uwyde7aS4h1v5tgiHt+ijijX2NQqA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: Fix CVE-2021-35942
To: Vinay Kumar <vinay.m.engg@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, "Mittal, Anuj" <anuj.mittal@intel.com>, 
	Randy MacLeod <rwmacleod@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	umesh kalappa0 <umesh.kalappa0@gmail.com>, vinay.kumar@blackfigtech.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 16, 2021 at 1:59 AM Vinay Kumar <vinay.m.engg@gmail.com> wrote:
>
> Hi Khen Raj,
>
> The patch for hardknott branch was also submitted.
> https://lists.openembedded.org/g/openembedded-core/message/154810

OK, now we have glibc 2.34 in master so the master version is not
needed anymore but we still should pursue the hardknott version.
Please bring it to hardknott maintainer's attention if need be.

>
> Regards,
> Vinay
>
> On Sun, Aug 15, 2021 at 11:01 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Sun, Aug 15, 2021 at 2:19 AM Alexandre Belloni
> > <alexandre.belloni@bootlin.com> wrote:
> > >
> > > Hello,
> > >
> > > On 15/08/2021 13:19:33+0530, Vinay Kumar wrote:
> > > > Hi Richard,
> > > >
> > > > Any update on the above patch.
> > > > Please let me know if anything is pending from my side.
> > > >
> > >
> > > I didn't test because the plan is to switch to glibc2.34 which IIRC has
> > > the fix.
> >
> > We perhaps still need it for hardknott.
> >
> > >
> > > > Regards,
> > > > Vinay
> > > >
> > > > On Wed, Jul 28, 2021 at 1:22 PM Vinay Kumar <vinay.m.engg@gmail.com> wrote:
> > > > >
> > > > > Source: https://sourceware.org/git/glibc.git
> > > > > Tracking -- https://sourceware.org/bugzilla/show_bug.cgi?id=28011
> > > > >
> > > > > Backported upstream commit 5adda61f62b77384718b4c0d8336ade8f2b4b35c to
> > > > > glibc-2.33 source.
> > > > >
> > > > > Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=5adda61f62b77384718b4c0d8336ade8f2b4b35c]
> > > > >
> > > > > Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> > > > > ---
> > > > >  .../glibc/glibc/CVE-2021-35942.patch          | 44 +++++++++++++++++++
> > > > >  meta/recipes-core/glibc/glibc_2.33.bb         |  1 +
> > > > >  2 files changed, 45 insertions(+)
> > > > >  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-35942.patch
> > > > >
> > > > > diff --git a/meta/recipes-core/glibc/glibc/CVE-2021-35942.patch b/meta/recipes-core/glibc/glibc/CVE-2021-35942.patch
> > > > > new file mode 100644
> > > > > index 0000000000..5cae1bc91c
> > > > > --- /dev/null
> > > > > +++ b/meta/recipes-core/glibc/glibc/CVE-2021-35942.patch
> > > > > @@ -0,0 +1,44 @@
> > > > > +From 5adda61f62b77384718b4c0d8336ade8f2b4b35c Mon Sep 17 00:00:00 2001
> > > > > +From: Andreas Schwab <schwab@linux-m68k.org>
> > > > > +Date: Fri, 25 Jun 2021 15:02:47 +0200
> > > > > +Subject: [PATCH] wordexp: handle overflow in positional parameter number (bug
> > > > > + 28011)
> > > > > +
> > > > > +Use strtoul instead of atoi so that overflow can be detected.
> > > > > +
> > > > > +Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=5adda61f62b77384718b4c0d8336ade8f2b4b35c]
> > > > > +CVE: CVE-2021-35942
> > > > > +Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> > > > > +---
> > > > > + posix/wordexp-test.c | 1 +
> > > > > + posix/wordexp.c      | 2 +-
> > > > > + 2 files changed, 2 insertions(+), 1 deletion(-)
> > > > > +
> > > > > +diff --git a/posix/wordexp-test.c b/posix/wordexp-test.c
> > > > > +index f93a546d7e..9df02dbbb3 100644
> > > > > +--- a/posix/wordexp-test.c
> > > > > ++++ b/posix/wordexp-test.c
> > > > > +@@ -183,6 +183,7 @@ struct test_case_struct
> > > > > +     { 0, NULL, "$var", 0, 0, { NULL, }, IFS },
> > > > > +     { 0, NULL, "\"\\n\"", 0, 1, { "\\n", }, IFS },
> > > > > +     { 0, NULL, "", 0, 0, { NULL, }, IFS },
> > > > > ++    { 0, NULL, "${1234567890123456789012}", 0, 0, { NULL, }, IFS },
> > > > > +
> > > > > +     /* Flags not already covered (testit() has special handling for these) */
> > > > > +     { 0, NULL, "one two", WRDE_DOOFFS, 2, { "one", "two", }, IFS },
> > > > > +diff --git a/posix/wordexp.c b/posix/wordexp.c
> > > > > +index bcbe96e48d..1f3b09f721 100644
> > > > > +--- a/posix/wordexp.c
> > > > > ++++ b/posix/wordexp.c
> > > > > +@@ -1399,7 +1399,7 @@ envsubst:
> > > > > +   /* Is it a numeric parameter? */
> > > > > +   else if (isdigit (env[0]))
> > > > > +     {
> > > > > +-      int n = atoi (env);
> > > > > ++      unsigned long n = strtoul (env, NULL, 10);
> > > > > +
> > > > > +       if (n >= __libc_argc)
> > > > > +       /* Substitute NULL. */
> > > > > +--
> > > > > +2.17.1
> > > > > +
> > > > > diff --git a/meta/recipes-core/glibc/glibc_2.33.bb b/meta/recipes-core/glibc/glibc_2.33.bb
> > > > > index e9f01a14c5..abb01f8468 100644
> > > > > --- a/meta/recipes-core/glibc/glibc_2.33.bb
> > > > > +++ b/meta/recipes-core/glibc/glibc_2.33.bb
> > > > > @@ -58,6 +58,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
> > > > >             file://0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch \
> > > > >             file://mte-backports.patch \
> > > > >             file://CVE-2021-33574.patch \
> > > > > +           file://CVE-2021-35942.patch \
> > > > >             "
> > > > >  S = "${WORKDIR}/git"
> > > > >  B = "${WORKDIR}/build-${TARGET_SYS}"
> > > > > --
> > > > > 2.31.1
> > > > >
> > >
> > > --
> > > Alexandre Belloni, co-owner and COO, Bootlin
> > > Embedded Linux and Kernel engineering
> > > https://bootlin.com
> > >
> > > 
> > >
