Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.5416.1627748877676160925
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Jul 2021 09:27:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JZqSpm1d;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id n6so17363413ljp.9
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Jul 2021 09:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cXf+w2qcKPl75s6E7nFOQuaX1F5NpcmATOwWjTDreEo=;
        b=JZqSpm1dwcGyxi+iesAS855fgNb5cdyJMG7B0vdm1iyybc5hiNgAFv+RX2SgJXgk0M
         FGrl4idaj2N6wWkqbxQwlYJskZc0UMPMNMBD6787fKLnUSpIZTqmJ0nB24CymLXh4DEa
         q1H4+qg8xrhOdq53UisaxYf1tBTG2ftlvB9Yilpaab/GiH3/0CEIf0fVq2mAu6pJzJXP
         9MydzlU9abImYTuoLBBLFa2SrJghEH3Y1VKtOuX5ad9JTsJdyUnPQ7OZkzzNCoszpRyO
         BBDuvMhl5UGl8Bn4YHZX1W4Kuk+ErQejW3mYPTtGWJ1XN3YMvJRPrE98uYEaFrjXaLTE
         Rjug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cXf+w2qcKPl75s6E7nFOQuaX1F5NpcmATOwWjTDreEo=;
        b=cr/zCvyai2YL99lQvzHZHWCpOZscnE9JbNwOb3dIf6elsvQa3XF/cP1yDuUZOwLRDN
         jLr7Es2enPR/NZ2BgRou8ZFtMHC3TwRl31RGD5dsn8SzmRsiwzhARQMcETw/MkD5Yu06
         M/TbsmPhxSz2i3i62gh5XyHPXnQe2BJbWDs7nFt3UaCqb8JVIwB4d76Ak8dsJTa9Zk3L
         x+/LRF9abO/yHmjzRV7nkFn1Vq0AQpIUhYLp4kTBiMB7xEYbHQXErfFevC6XLIHS0Fmb
         IemIP538IMbxoZhJPH5NdMyf3l5lRIngLZYcW8ozoAoVpgYzPIo1IYWGCb4l8MM/IK8T
         T9dw==
X-Gm-Message-State: AOAM5317NTF2sA7VCHzr6yaY8lG8b2RmmMfe/3TGhVZkm3ASw2rdy3lo
	vBwiExoAwpUFGtD8Cf9KV/eMd5B6up2VtgBByRE=
X-Google-Smtp-Source: ABdhPJwwsmmXarB0TPBYSorPGjtTD4ogay1PGvhQb8vpiHshBFuFB8VCR9jxRUz9APW80Di85cd6OEJRs5W0wxWb0wY=
X-Received: by 2002:a2e:894e:: with SMTP id b14mr5763068ljk.344.1627748875532;
 Sat, 31 Jul 2021 09:27:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210727183831.100545-1-vinay.m.engg@gmail.com> <a3e9bd964546a48124dddfb13008e2bc1e467163.camel@intel.com>
In-Reply-To: <a3e9bd964546a48124dddfb13008e2bc1e467163.camel@intel.com>
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
Date: Sat, 31 Jul 2021 21:57:44 +0530
Message-ID: <CANUMPcVH2STrqcD34DRXQ9ty3id9O0ZgZ_qWg76+F-pQ-6Hx5A@mail.gmail.com>
Subject: Re: [PATCH] glibc: Fix CVE-2021-33574
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"vinay.kumar@blackfigtech.com" <vinay.kumar@blackfigtech.com>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"rwmacleod@gmail.com" <rwmacleod@gmail.com>, "umesh.kalappa0@gmail.com" <umesh.kalappa0@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Anuj,

The patch is conjugate of both commits.
https://sourceware.org/git/?p=glibc.git;a=commit;h=42d359350510506b87101cf77202fefcbfc790cb
 https://sourceware.org/git/?p=glibc.git;a=commit;h=217b6dc298156bdb0d6aea9ea93e7e394a5ff091

Also, the patch is committed to master branch
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=55681d09d7f519a1c7f17d17b18ec59bccdc91ca

Due you want me to resubmit for "hardknott" branch by splitting in to
2 patches ?

Regards,
Vinay

On Sat, Jul 31, 2021 at 11:52 AM Mittal, Anuj <anuj.mittal@intel.com> wrote:
>
> On Tue, 2021-07-27 at 11:38 -0700, Vinay Kumar wrote:
> > Source: https://sourceware.org/git/glibc.git
> > Tracking -- https://sourceware.org/bugzilla/show_bug.cgi?id=27896
> >
> > Backported upstream commit 42d359350510506b87101cf77202fefcbfc790cb to
> > glibc-2.33 source with dependent commit id
> > 217b6dc298156bdb0d6aea9ea93e7e394a5ff091.
> >
> > Upstream-Status: Backport
> > [https://sourceware.org/git/?p=glibc.git;a=commit;h=42d359350510506b87101cf77202fefcbfc790cb
> > ]
>
> It looks like you'd need to backport this one too:
>
> https://sourceware.org/git/?p=glibc.git;a=commit;h=217b6dc298156bdb0d6aea9ea93e7e394a5ff091
>
> ?
>
> Thanks,
>
> Anuj
>
> >
> > Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> > ---
> >  .../glibc/glibc/CVE-2021-33574.patch          | 61 +++++++++++++++++++
> >  meta/recipes-core/glibc/glibc_2.33.bb         |  1 +
> >  2 files changed, 62 insertions(+)
> >  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-33574.patch
> >
> > diff --git a/meta/recipes-core/glibc/glibc/CVE-2021-33574.patch
> > b/meta/recipes-core/glibc/glibc/CVE-2021-33574.patch
> > new file mode 100644
> > index 0000000000..fd73b23c88
> > --- /dev/null
> > +++ b/meta/recipes-core/glibc/glibc/CVE-2021-33574.patch
> > @@ -0,0 +1,61 @@
> > +From 42d359350510506b87101cf77202fefcbfc790cb Mon Sep 17 00:00:00 2001
> > +From: Andreas Schwab <schwab@linux-m68k.org>
> > +Date: Thu, 27 May 2021 12:49:47 +0200
> > +Subject: [PATCH] Use __pthread_attr_copy in mq_notify (bug 27896)
> > +
> > +Make a deep copy of the pthread attribute object to remove a potential
> > +use-after-free issue.
> > +
> > +Upstream-Status: Backport
> > [https://sourceware.org/git/?p=glibc.git;a=commit;h=42d359350510506b87101cf77202fefcbfc790cb
> > ]
> > +CVE: CVE-2021-33574
> > +Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> > +---
> > +diff --git a/sysdeps/unix/sysv/linux/mq_notify.c
> > b/sysdeps/unix/sysv/linux/mq_notify.c
> > +index cc575a0cdd8..6f46d29d1dc 100644
> > +--- a/sysdeps/unix/sysv/linux/mq_notify.c
> > ++++ b/sysdeps/unix/sysv/linux/mq_notify.c
> > +@@ -133,8 +133,11 @@ helper_thread (void *arg)
> > +           (void) __pthread_barrier_wait (&notify_barrier);
> > +       }
> > +       else if (data.raw[NOTIFY_COOKIE_LEN - 1] == NOTIFY_REMOVED)
> > +-      /* The only state we keep is the copy of the thread
> > attributes.  */
> > +-      free (data.attr);
> > ++      {
> > ++        /* The only state we keep is the copy of the thread
> > attributes.  */
> > ++        pthread_attr_destroy (data.attr);
> > ++        free (data.attr);
> > ++      }
> > +     }
> > +   return NULL;
> > + }
> > +@@ -255,8 +258,14 @@ mq_notify (mqd_t mqdes, const struct sigevent
> > *notification)
> > +       if (data.attr == NULL)
> > +       return -1;
> > +
> > +-      memcpy (data.attr, notification->sigev_notify_attributes,
> > +-            sizeof (pthread_attr_t));
> > ++      int ret = __pthread_attr_copy (data.attr,
> > ++                                   notification-
> > >sigev_notify_attributes);
> > ++      if (ret != 0)
> > ++      {
> > ++        free (data.attr);
> > ++        __set_errno (ret);
> > ++        return -1;
> > ++      }
> > +     }
> > +
> > +   /* Construct the new request.  */
> > +@@ -269,8 +278,11 @@ mq_notify (mqd_t mqdes, const struct sigevent
> > *notification)
> > +   int retval = INLINE_SYSCALL (mq_notify, 2, mqdes, &se);
> > +
> > +   /* If it failed, free the allocated memory.  */
> > +-  if (__glibc_unlikely (retval != 0))
> > +-    free (data.attr);
> > ++  if (retval != 0 && data.attr != NULL)
> > ++    {
> > ++      pthread_attr_destroy (data.attr);
> > ++      free (data.attr);
> > ++    }
> > +
> > +   return retval;
> > + }
> > diff --git a/meta/recipes-core/glibc/glibc_2.33.bb b/meta/recipes-
> > core/glibc/glibc_2.33.bb
> > index 925efe8cc6..e9f01a14c5 100644
> > --- a/meta/recipes-core/glibc/glibc_2.33.bb
> > +++ b/meta/recipes-core/glibc/glibc_2.33.bb
> > @@ -57,6 +57,7 @@ SRC_URI =
> > "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
> >
> > file://0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch \
> >
> > file://0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch \
> >             file://mte-backports.patch \
> > +           file://CVE-2021-33574.patch \
> >             "
> >  S = "${WORKDIR}/git"
> >  B = "${WORKDIR}/build-${TARGET_SYS}"
>
