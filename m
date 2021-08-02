Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web08.15833.1627877646259805264
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Aug 2021 21:14:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RdpCsflA;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id b21so22168371ljo.13
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Aug 2021 21:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vVQCJtqUdUf49eqo1zOkCiSOfIlpYWeWkkCzgwgZnQ8=;
        b=RdpCsflAiTgdILd8wmkh8yeiK11/XNH7qzbChjShFJaCAwDuhcTEy6mXhk8xQvd7z/
         ogDJzwKrvaGQdVyc7sW9lks/WWA1BS+tFsSCHzi0MnA5U8QUAMofH+YJnClfRmm+sOOK
         Jt2CtymIkl7OctUU4VYIFdDILcFOo1sSmIgZwFrMPOg1M0rsmES9QEqagKLhKZT5kg27
         7SoBkLxSAtuzbPIfvYbVbFCWyoluZSuouIGYgiZ3IeuylezTiaGqfiQLOsQ/795L7iYE
         OjzlFSRvUdN8rjBblO2vWPDjCuzjpAiHoVQx1YOoryR0Ev0Lw0GmXpv2hCSRESq1sGkK
         GNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vVQCJtqUdUf49eqo1zOkCiSOfIlpYWeWkkCzgwgZnQ8=;
        b=Z6LLQQ+A6Ksp6N2iesvjamPVMUJU0kY9InA2naoe71oR713j3tkYyR3bKl70+dP0UL
         nBvFjdoLvv90fi61l2k9qL8OILYG47ndxDvnAzUdtVEu1JrHNHWTLMi+VyjYSvxhoDzw
         tfrtBjq5HvTxbpPbTRTjQNFjwHLUeLJxuOCur2IIk/a32g6sm1z1yGJlA6kF0AXBfTRf
         dU9E8g4eR3//3rNjxEOQLQFTzhaKkjzIHVQnC/doee/MycUmi2r+SpUHSf8GNQFYsqhT
         NEPQ1sLgpvakr8enaY2jHvkQZqmGgZzx0uGi3P/37+yms9P/hDHUmPdX2K1TffLCxQ7G
         oFrg==
X-Gm-Message-State: AOAM530Sy/upqV2Fx6MDUYUZGAaiNBLFxqrmSDiIq9f1+aCoK1SsFg0A
	nYWoCEKFtMP9lVtdglR6x4A+L/FnkliZYMvGPw8=
X-Google-Smtp-Source: ABdhPJxpgndftltQXROjP5bIyc5ZoP7bPz22LFOdGkE15V6s2Sc9agGRu0TSSuDvskOwJ8FR66HtZisgAHLjW7vzZMk=
X-Received: by 2002:a2e:894e:: with SMTP id b14mr10215125ljk.344.1627877644141;
 Sun, 01 Aug 2021 21:14:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210727183831.100545-1-vinay.m.engg@gmail.com>
 <a3e9bd964546a48124dddfb13008e2bc1e467163.camel@intel.com>
 <CANUMPcVH2STrqcD34DRXQ9ty3id9O0ZgZ_qWg76+F-pQ-6Hx5A@mail.gmail.com> <6d88bfb57e64bfd5f169413c1fab0777ca3e811d.camel@intel.com>
In-Reply-To: <6d88bfb57e64bfd5f169413c1fab0777ca3e811d.camel@intel.com>
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
Date: Mon, 2 Aug 2021 09:43:53 +0530
Message-ID: <CANUMPcV4EQ1ds6jx2QEMTD1PsC2tXeumGtyTr89v8JCOhwFoug@mail.gmail.com>
Subject: Re: [PATCH] glibc: Fix CVE-2021-33574
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "vinay.kumar@blackfigtech.com" <vinay.kumar@blackfigtech.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"rwmacleod@gmail.com" <rwmacleod@gmail.com>, "umesh.kalappa0@gmail.com" <umesh.kalappa0@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Anuj,

>> It seems wrong to me because the patch header/description is not
>> correct here. It's no longer a backport of just
>> 42d359350510506b87101cf77202fefcbfc790cb.

Yes, I merged 2 commits first
(42d359350510506b87101cf77202fefcbfc790cb and
217b6dc298156bdb0d6aea9ea93e7e394a5ff091)
and then backported as a single patch, and I used only the patch
header of 42d359350510506b87101cf77202fefcbfc790cb.

>> I also just noticed that there's already a fix for this CVE in my
>> branch. So I think I will take that:

Ok, thanks. Will go with this once it gets merged to the "hardknott" branch.

Regards,
Vinay

On Mon, Aug 2, 2021 at 8:09 AM Mittal, Anuj <anuj.mittal@intel.com> wrote:
>
> On Sat, 2021-07-31 at 21:57 +0530, Vinay Kumar wrote:
> > Hi Anuj,
> >
> > The patch is conjugate of both commits.
> > https://sourceware.org/git/?p=glibc.git;a=commit;h=42d359350510506b87101cf77202fefcbfc790cb
> >
> > https://sourceware.org/git/?p=glibc.git;a=commit;h=217b6dc298156bdb0d6aea9ea93e7e394a5ff091
> >
> > Also, the patch is committed to master branch
> > http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=55681d09d7f519a1c7f17d17b18ec59bccdc91ca
> >
> > Due you want me to resubmit for "hardknott" branch by splitting in to
> > 2 patches ?
>
> It seems wrong to me because the patch header/description is not
> correct here. It's no longer a backport of just
> 42d359350510506b87101cf77202fefcbfc790cb.
>
> I also just noticed that there's already a fix for this CVE in my
> branch. So I think I will take that:
>
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=anujm/hardknott&id=ede353df06a07d35dc66d024e2c7bd1b250d9761
>
> Thanks,
>
> Anuj
>
> >
> > Regards,
> > Vinay
> >
> > On Sat, Jul 31, 2021 at 11:52 AM Mittal, Anuj <anuj.mittal@intel.com>
> > wrote:
> > >
> > > On Tue, 2021-07-27 at 11:38 -0700, Vinay Kumar wrote:
> > > > Source: https://sourceware.org/git/glibc.git
> > > > Tracking -- https://sourceware.org/bugzilla/show_bug.cgi?id=27896
> > > >
> > > > Backported upstream commit 42d359350510506b87101cf77202fefcbfc790cb
> > > > to
> > > > glibc-2.33 source with dependent commit id
> > > > 217b6dc298156bdb0d6aea9ea93e7e394a5ff091.
> > > >
> > > > Upstream-Status: Backport
> > > > [
> > > > https://sourceware.org/git/?p=glibc.git;a=commit;h=42d359350510506b87101cf77202fefcbfc790cb
> > > > ]
> > >
> > > It looks like you'd need to backport this one too:
> > >
> > > https://sourceware.org/git/?p=glibc.git;a=commit;h=217b6dc298156bdb0d6aea9ea93e7e394a5ff091
> > >
> > > ?
> > >
> > > Thanks,
> > >
> > > Anuj
> > >
> > > >
> > > > Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> > > > ---
> > > >  .../glibc/glibc/CVE-2021-33574.patch          | 61
> > > > +++++++++++++++++++
> > > >  meta/recipes-core/glibc/glibc_2.33.bb         |  1 +
> > > >  2 files changed, 62 insertions(+)
> > > >  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-
> > > > 33574.patch
> > > >
> > > > diff --git a/meta/recipes-core/glibc/glibc/CVE-2021-33574.patch
> > > > b/meta/recipes-core/glibc/glibc/CVE-2021-33574.patch
> > > > new file mode 100644
> > > > index 0000000000..fd73b23c88
> > > > --- /dev/null
> > > > +++ b/meta/recipes-core/glibc/glibc/CVE-2021-33574.patch
> > > > @@ -0,0 +1,61 @@
> > > > +From 42d359350510506b87101cf77202fefcbfc790cb Mon Sep 17 00:00:00
> > > > 2001
> > > > +From: Andreas Schwab <schwab@linux-m68k.org>
> > > > +Date: Thu, 27 May 2021 12:49:47 +0200
> > > > +Subject: [PATCH] Use __pthread_attr_copy in mq_notify (bug 27896)
> > > > +
> > > > +Make a deep copy of the pthread attribute object to remove a
> > > > potential
> > > > +use-after-free issue.
> > > > +
> > > > +Upstream-Status: Backport
> > > > [
> > > > https://sourceware.org/git/?p=glibc.git;a=commit;h=42d359350510506b87101cf77202fefcbfc790cb
> > > > ]
> > > > +CVE: CVE-2021-33574
> > > > +Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> > > > +---
> > > > +diff --git a/sysdeps/unix/sysv/linux/mq_notify.c
> > > > b/sysdeps/unix/sysv/linux/mq_notify.c
> > > > +index cc575a0cdd8..6f46d29d1dc 100644
> > > > +--- a/sysdeps/unix/sysv/linux/mq_notify.c
> > > > ++++ b/sysdeps/unix/sysv/linux/mq_notify.c
> > > > +@@ -133,8 +133,11 @@ helper_thread (void *arg)
> > > > +           (void) __pthread_barrier_wait (&notify_barrier);
> > > > +       }
> > > > +       else if (data.raw[NOTIFY_COOKIE_LEN - 1] == NOTIFY_REMOVED)
> > > > +-      /* The only state we keep is the copy of the thread
> > > > attributes.  */
> > > > +-      free (data.attr);
> > > > ++      {
> > > > ++        /* The only state we keep is the copy of the thread
> > > > attributes.  */
> > > > ++        pthread_attr_destroy (data.attr);
> > > > ++        free (data.attr);
> > > > ++      }
> > > > +     }
> > > > +   return NULL;
> > > > + }
> > > > +@@ -255,8 +258,14 @@ mq_notify (mqd_t mqdes, const struct sigevent
> > > > *notification)
> > > > +       if (data.attr == NULL)
> > > > +       return -1;
> > > > +
> > > > +-      memcpy (data.attr, notification->sigev_notify_attributes,
> > > > +-            sizeof (pthread_attr_t));
> > > > ++      int ret = __pthread_attr_copy (data.attr,
> > > > ++                                   notification-
> > > > > sigev_notify_attributes);
> > > > ++      if (ret != 0)
> > > > ++      {
> > > > ++        free (data.attr);
> > > > ++        __set_errno (ret);
> > > > ++        return -1;
> > > > ++      }
> > > > +     }
> > > > +
> > > > +   /* Construct the new request.  */
> > > > +@@ -269,8 +278,11 @@ mq_notify (mqd_t mqdes, const struct sigevent
> > > > *notification)
> > > > +   int retval = INLINE_SYSCALL (mq_notify, 2, mqdes, &se);
> > > > +
> > > > +   /* If it failed, free the allocated memory.  */
> > > > +-  if (__glibc_unlikely (retval != 0))
> > > > +-    free (data.attr);
> > > > ++  if (retval != 0 && data.attr != NULL)
> > > > ++    {
> > > > ++      pthread_attr_destroy (data.attr);
> > > > ++      free (data.attr);
> > > > ++    }
> > > > +
> > > > +   return retval;
> > > > + }
> > > > diff --git a/meta/recipes-core/glibc/glibc_2.33.bb b/meta/recipes-
> > > > core/glibc/glibc_2.33.bb
> > > > index 925efe8cc6..e9f01a14c5 100644
> > > > --- a/meta/recipes-core/glibc/glibc_2.33.bb
> > > > +++ b/meta/recipes-core/glibc/glibc_2.33.bb
> > > > @@ -57,6 +57,7 @@ SRC_URI =
> > > > "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
> > > >
> > > > file://0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
> > > >  \
> > > >
> > > > file://0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch \
> > > >             file://mte-backports.patch \
> > > > +           file://CVE-2021-33574.patch \
> > > >             "
> > > >  S = "${WORKDIR}/git"
> > > >  B = "${WORKDIR}/build-${TARGET_SYS}"
> > >
>
