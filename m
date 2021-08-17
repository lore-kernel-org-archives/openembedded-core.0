Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.40383.1629213907346097296
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Aug 2021 08:25:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=F/VQYSgw;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id i28so15382356lfl.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Aug 2021 08:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YeHyKUwDZrimogXFfxZ12qq2/tq/ckROn4alFQ4/WTg=;
        b=F/VQYSgwJoyl2VvP6B5k7/T54nzCmio8pi00+zSaU7dPJ8WbEvR4kRyXwOAh+Oy1h4
         G7TvQx91DINw9RbkFIWZqMA+EdTh8NjURoKSDsFQVOCyB0mAdbzBSDUvVRROPSwCH0UD
         cgsG9H11OtLxT18L2ZDY4FFXXHeaR2q4JKVqZDFDwnIQ9apWebF2okvUPr4tJIrnlED0
         v9c3cBx4nzYhUYhkbn0q0i19bfQY0io/xj/69BmSFSnkxwBYQFp5YvQbSuj74nmSO5iw
         rvyAvloXZoic0krh/QpzmZdBQdTrnuhDWLvc1FazuFH7qtQgO1NzBti3alFeNkZjW9CB
         9i4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YeHyKUwDZrimogXFfxZ12qq2/tq/ckROn4alFQ4/WTg=;
        b=O19NMwgViv2RXBEsP/CC5IbVLPrI8u3xjkAQpQ4dMXwvV+QPw1tx/qt/1sfqxc/Ka3
         0NSnkFB0x5+/ypcT/l4h95AOvsPuyxBlQtzkx+blngxgWE1ByEW+DmJ26iQbEs7cjw92
         HVqMe85Mxr3N6dTJKMcUBjaTmxdgHmFBcqnNGIz9n+XT0mZLK2IU3Dfvkgq6WKFBMYdp
         7eqGBpkOL4F62jfGsVHdbx0zRGiIRXdZQ3bdmNbISjx3QsWxVV7xUpYLzzNHpqwbkvMv
         XM1+LE5+tL3rs7Zuc8xDRtpQ7cwi2GF0CY+VBaD86xew6zD72nPLZrR71X4pT5uAxSij
         mTzQ==
X-Gm-Message-State: AOAM530tFUZSBimusaA0Fux5gRmAkH+HPmsj7VflJnRIrpOQOM44T0VS
	oD76oL4dVXhmEFJG3Yn/NINoYox5G15KRoZ41pk=
X-Google-Smtp-Source: ABdhPJzXP5QZG1u0U5d6fDbLIZ/8A+ChSoTQQRVEBKH/X8uxDvf0q7Gh6rTAL+D/hm1Wxx/XGbl/TiVzOe0tCqB4ajE=
X-Received: by 2002:a05:6512:3f89:: with SMTP id x9mr2841392lfa.233.1629213904171;
 Tue, 17 Aug 2021 08:25:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210727183831.100545-1-vinay.m.engg@gmail.com>
 <a3e9bd964546a48124dddfb13008e2bc1e467163.camel@intel.com>
 <CANUMPcVH2STrqcD34DRXQ9ty3id9O0ZgZ_qWg76+F-pQ-6Hx5A@mail.gmail.com>
 <6d88bfb57e64bfd5f169413c1fab0777ca3e811d.camel@intel.com>
 <CANUMPcV4EQ1ds6jx2QEMTD1PsC2tXeumGtyTr89v8JCOhwFoug@mail.gmail.com> <CAD=4a=Xu+9dZC1n6Fy4qkmyBqY3k9P2sNBvR84BdZnozLjaJ7w@mail.gmail.com>
In-Reply-To: <CAD=4a=Xu+9dZC1n6Fy4qkmyBqY3k9P2sNBvR84BdZnozLjaJ7w@mail.gmail.com>
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
Date: Tue, 17 Aug 2021 20:54:52 +0530
Message-ID: <CANUMPcU7HdzPd2zs=rWob=1476QECHn7JTYpHrA4v6rwru=A3Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: Fix CVE-2021-33574
To: =?UTF-8?Q?Ernst_Sj=C3=B6strand?= <ernstp@gmail.com>
Cc: "Mittal, Anuj" <anuj.mittal@intel.com>, 
	"vinay.kumar@blackfigtech.com" <vinay.kumar@blackfigtech.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"rwmacleod@gmail.com" <rwmacleod@gmail.com>, "umesh.kalappa0@gmail.com" <umesh.kalappa0@gmail.com>, 
	khairul.rohaizzat.jamaluddin@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ernst,

Thanks, for the update of CVE-2021-38604.
Will send a path to the hardknott branch as well as master branch.

Regards,
Vinay

On Tue, Aug 17, 2021 at 12:10 PM Ernst Sj=C3=B6strand <ernstp@gmail.com> wr=
ote:
>
> There is now an additional fix on top of this:
>
> https://it.slashdot.org/story/21/08/16/2131221/linux-glibc-security-fix-c=
reated-a-nastier-linux-bug
>
> https://access.redhat.com/security/cve/cve-2021-38604
>
> //E
>
> Den m=C3=A5n 2 aug. 2021 kl 06:14 skrev Vinay Kumar <vinay.m.engg@gmail.c=
om>:
>>
>> Hi Anuj,
>>
>> >> It seems wrong to me because the patch header/description is not
>> >> correct here. It's no longer a backport of just
>> >> 42d359350510506b87101cf77202fefcbfc790cb.
>>
>> Yes, I merged 2 commits first
>> (42d359350510506b87101cf77202fefcbfc790cb and
>> 217b6dc298156bdb0d6aea9ea93e7e394a5ff091)
>> and then backported as a single patch, and I used only the patch
>> header of 42d359350510506b87101cf77202fefcbfc790cb.
>>
>> >> I also just noticed that there's already a fix for this CVE in my
>> >> branch. So I think I will take that:
>>
>> Ok, thanks. Will go with this once it gets merged to the "hardknott" bra=
nch.
>>
>> Regards,
>> Vinay
>>
>> On Mon, Aug 2, 2021 at 8:09 AM Mittal, Anuj <anuj.mittal@intel.com> wrot=
e:
>> >
>> > On Sat, 2021-07-31 at 21:57 +0530, Vinay Kumar wrote:
>> > > Hi Anuj,
>> > >
>> > > The patch is conjugate of both commits.
>> > > https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D42d35935051=
0506b87101cf77202fefcbfc790cb
>> > >
>> > > https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D217b6dc2981=
56bdb0d6aea9ea93e7e394a5ff091
>> > >
>> > > Also, the patch is committed to master branch
>> > > http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3D55681d09=
d7f519a1c7f17d17b18ec59bccdc91ca
>> > >
>> > > Due you want me to resubmit for "hardknott" branch by splitting in t=
o
>> > > 2 patches ?
>> >
>> > It seems wrong to me because the patch header/description is not
>> > correct here. It's no longer a backport of just
>> > 42d359350510506b87101cf77202fefcbfc790cb.
>> >
>> > I also just noticed that there's already a fix for this CVE in my
>> > branch. So I think I will take that:
>> >
>> > https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Danu=
jm/hardknott&id=3Dede353df06a07d35dc66d024e2c7bd1b250d9761
>> >
>> > Thanks,
>> >
>> > Anuj
>> >
>> > >
>> > > Regards,
>> > > Vinay
>> > >
>> > > On Sat, Jul 31, 2021 at 11:52 AM Mittal, Anuj <anuj.mittal@intel.com=
>
>> > > wrote:
>> > > >
>> > > > On Tue, 2021-07-27 at 11:38 -0700, Vinay Kumar wrote:
>> > > > > Source: https://sourceware.org/git/glibc.git
>> > > > > Tracking -- https://sourceware.org/bugzilla/show_bug.cgi?id=3D27=
896
>> > > > >
>> > > > > Backported upstream commit 42d359350510506b87101cf77202fefcbfc79=
0cb
>> > > > > to
>> > > > > glibc-2.33 source with dependent commit id
>> > > > > 217b6dc298156bdb0d6aea9ea93e7e394a5ff091.
>> > > > >
>> > > > > Upstream-Status: Backport
>> > > > > [
>> > > > > https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D42d3593=
50510506b87101cf77202fefcbfc790cb
>> > > > > ]
>> > > >
>> > > > It looks like you'd need to backport this one too:
>> > > >
>> > > > https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D217b6dc29=
8156bdb0d6aea9ea93e7e394a5ff091
>> > > >
>> > > > ?
>> > > >
>> > > > Thanks,
>> > > >
>> > > > Anuj
>> > > >
>> > > > >
>> > > > > Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
>> > > > > ---
>> > > > >  .../glibc/glibc/CVE-2021-33574.patch          | 61
>> > > > > +++++++++++++++++++
>> > > > >  meta/recipes-core/glibc/glibc_2.33.bb         |  1 +
>> > > > >  2 files changed, 62 insertions(+)
>> > > > >  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-
>> > > > > 33574.patch
>> > > > >
>> > > > > diff --git a/meta/recipes-core/glibc/glibc/CVE-2021-33574.patch
>> > > > > b/meta/recipes-core/glibc/glibc/CVE-2021-33574.patch
>> > > > > new file mode 100644
>> > > > > index 0000000000..fd73b23c88
>> > > > > --- /dev/null
>> > > > > +++ b/meta/recipes-core/glibc/glibc/CVE-2021-33574.patch
>> > > > > @@ -0,0 +1,61 @@
>> > > > > +From 42d359350510506b87101cf77202fefcbfc790cb Mon Sep 17 00:00:=
00
>> > > > > 2001
>> > > > > +From: Andreas Schwab <schwab@linux-m68k.org>
>> > > > > +Date: Thu, 27 May 2021 12:49:47 +0200
>> > > > > +Subject: [PATCH] Use __pthread_attr_copy in mq_notify (bug 2789=
6)
>> > > > > +
>> > > > > +Make a deep copy of the pthread attribute object to remove a
>> > > > > potential
>> > > > > +use-after-free issue.
>> > > > > +
>> > > > > +Upstream-Status: Backport
>> > > > > [
>> > > > > https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D42d3593=
50510506b87101cf77202fefcbfc790cb
>> > > > > ]
>> > > > > +CVE: CVE-2021-33574
>> > > > > +Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
>> > > > > +---
>> > > > > +diff --git a/sysdeps/unix/sysv/linux/mq_notify.c
>> > > > > b/sysdeps/unix/sysv/linux/mq_notify.c
>> > > > > +index cc575a0cdd8..6f46d29d1dc 100644
>> > > > > +--- a/sysdeps/unix/sysv/linux/mq_notify.c
>> > > > > ++++ b/sysdeps/unix/sysv/linux/mq_notify.c
>> > > > > +@@ -133,8 +133,11 @@ helper_thread (void *arg)
>> > > > > +           (void) __pthread_barrier_wait (&notify_barrier);
>> > > > > +       }
>> > > > > +       else if (data.raw[NOTIFY_COOKIE_LEN - 1] =3D=3D NOTIFY_R=
EMOVED)
>> > > > > +-      /* The only state we keep is the copy of the thread
>> > > > > attributes.  */
>> > > > > +-      free (data.attr);
>> > > > > ++      {
>> > > > > ++        /* The only state we keep is the copy of the thread
>> > > > > attributes.  */
>> > > > > ++        pthread_attr_destroy (data.attr);
>> > > > > ++        free (data.attr);
>> > > > > ++      }
>> > > > > +     }
>> > > > > +   return NULL;
>> > > > > + }
>> > > > > +@@ -255,8 +258,14 @@ mq_notify (mqd_t mqdes, const struct sigev=
ent
>> > > > > *notification)
>> > > > > +       if (data.attr =3D=3D NULL)
>> > > > > +       return -1;
>> > > > > +
>> > > > > +-      memcpy (data.attr, notification->sigev_notify_attributes=
,
>> > > > > +-            sizeof (pthread_attr_t));
>> > > > > ++      int ret =3D __pthread_attr_copy (data.attr,
>> > > > > ++                                   notification-
>> > > > > > sigev_notify_attributes);
>> > > > > ++      if (ret !=3D 0)
>> > > > > ++      {
>> > > > > ++        free (data.attr);
>> > > > > ++        __set_errno (ret);
>> > > > > ++        return -1;
>> > > > > ++      }
>> > > > > +     }
>> > > > > +
>> > > > > +   /* Construct the new request.  */
>> > > > > +@@ -269,8 +278,11 @@ mq_notify (mqd_t mqdes, const struct sigev=
ent
>> > > > > *notification)
>> > > > > +   int retval =3D INLINE_SYSCALL (mq_notify, 2, mqdes, &se);
>> > > > > +
>> > > > > +   /* If it failed, free the allocated memory.  */
>> > > > > +-  if (__glibc_unlikely (retval !=3D 0))
>> > > > > +-    free (data.attr);
>> > > > > ++  if (retval !=3D 0 && data.attr !=3D NULL)
>> > > > > ++    {
>> > > > > ++      pthread_attr_destroy (data.attr);
>> > > > > ++      free (data.attr);
>> > > > > ++    }
>> > > > > +
>> > > > > +   return retval;
>> > > > > + }
>> > > > > diff --git a/meta/recipes-core/glibc/glibc_2.33.bb b/meta/recipe=
s-
>> > > > > core/glibc/glibc_2.33.bb
>> > > > > index 925efe8cc6..e9f01a14c5 100644
>> > > > > --- a/meta/recipes-core/glibc/glibc_2.33.bb
>> > > > > +++ b/meta/recipes-core/glibc/glibc_2.33.bb
>> > > > > @@ -57,6 +57,7 @@ SRC_URI =3D
>> > > > > "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=3Dglibc \
>> > > > >
>> > > > > file://0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.=
patch
>> > > > >  \
>> > > > >
>> > > > > file://0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch \
>> > > > >             file://mte-backports.patch \
>> > > > > +           file://CVE-2021-33574.patch \
>> > > > >             "
>> > > > >  S =3D "${WORKDIR}/git"
>> > > > >  B =3D "${WORKDIR}/build-${TARGET_SYS}"
>> > > >
>> >
>>
>>=20
>>
