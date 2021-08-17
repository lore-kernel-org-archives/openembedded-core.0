Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.35864.1629182459020254083
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Aug 2021 23:40:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YPBaJF4s;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: ernstp@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d17so23689740plr.12
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Aug 2021 23:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8IGF9mhkCkYk5oVh+Unhsyw5mK9y3S7OcCEqhOeyq1k=;
        b=YPBaJF4srsy4KpQ2pwOoa1ITMyD/34hesvBS7g3MJiiLGaraLmakn0ZnKCU3db44jm
         81TIrJ3QcN9+k9Hv09ptxUX4KN18iK40BMV9xMzrig1QApCXiRQxIVOS7tz9/a06J06f
         pgXMeT8cbngGUU25w7RxLFTRUp/3hzteCqvdJ4LBmPwwhK+xBPVPqU3AJJ2n6KMY5njM
         gaiNA5AhybcndOUW2LMcg7vfbcG+jxtVifAdMqmezYAvolR78wiQ+KPfjOoT49x7Nitz
         czDEK0cfc99nVNn6zCYjqMm1TVypyDtspUgWtL4ZxuRZtco/EEE/S3pU03qgOOJSyYw/
         xRCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8IGF9mhkCkYk5oVh+Unhsyw5mK9y3S7OcCEqhOeyq1k=;
        b=SmqLdHJypeHtCVkG4MzpRwea38Hjs6EbTHPVFlARcPygOrPNcZEj7q02CrDjhoHzGC
         X7LtFct7jb8kk3ss1yy43XxR3bCX/PMvLgI0tzOv6gyy2mG/czrZVXe16NlJhEXjMEGh
         E3a6Ww7tGsx1zX7Lbraah557w8NDWnXCnubXmw4FOVa3qyj/YWrMQay0TiQn+xdb5mvf
         QtindCAHFSDFR9H2yOczdiFp3YN6wYOK1xq+J7gAAwAZySOA8ueM8WxcLCbz+6YptJWB
         sKv+gYqg0Wu3rV4LfX4vTV65456YpSjmDZKTHW2Jmmu1GdgsioK6O9a0vtk10DtSyw8g
         hN8g==
X-Gm-Message-State: AOAM531mb9nnzt2T2ylYx2gmIn6+J2wOPJc9c2ssU/8Kk4Gcpn3FDj4u
	g9TR2UJy6dj4hXeQlwhhEwH91R+HkdKiNTDCbps=
X-Google-Smtp-Source: ABdhPJyN84AZ+Gt7d6MlFpeOl3qS7ageoJN/vumw631YHyKH//l1MBqYqXg5Sv6ArYM1579ISwMfmNMbmI0DfAnm6gg=
X-Received: by 2002:a17:90b:1a85:: with SMTP id ng5mr2015554pjb.62.1629182458317;
 Mon, 16 Aug 2021 23:40:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210727183831.100545-1-vinay.m.engg@gmail.com>
 <a3e9bd964546a48124dddfb13008e2bc1e467163.camel@intel.com>
 <CANUMPcVH2STrqcD34DRXQ9ty3id9O0ZgZ_qWg76+F-pQ-6Hx5A@mail.gmail.com>
 <6d88bfb57e64bfd5f169413c1fab0777ca3e811d.camel@intel.com> <CANUMPcV4EQ1ds6jx2QEMTD1PsC2tXeumGtyTr89v8JCOhwFoug@mail.gmail.com>
In-Reply-To: <CANUMPcV4EQ1ds6jx2QEMTD1PsC2tXeumGtyTr89v8JCOhwFoug@mail.gmail.com>
From: =?UTF-8?B?RXJuc3QgU2rDtnN0cmFuZA==?= <ernstp@gmail.com>
Date: Tue, 17 Aug 2021 08:40:47 +0200
Message-ID: <CAD=4a=Xu+9dZC1n6Fy4qkmyBqY3k9P2sNBvR84BdZnozLjaJ7w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: Fix CVE-2021-33574
To: Vinay Kumar <vinay.m.engg@gmail.com>
Cc: "Mittal, Anuj" <anuj.mittal@intel.com>, 
	"vinay.kumar@blackfigtech.com" <vinay.kumar@blackfigtech.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"rwmacleod@gmail.com" <rwmacleod@gmail.com>, "umesh.kalappa0@gmail.com" <umesh.kalappa0@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000b3d0e005c9bb9926"

--000000000000b3d0e005c9bb9926
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

There is now an additional fix on top of this:

https://it.slashdot.org/story/21/08/16/2131221/linux-glibc-security-fix-cre=
ated-a-nastier-linux-bug

https://access.redhat.com/security/cve/cve-2021-38604

//E

Den m=C3=A5n 2 aug. 2021 kl 06:14 skrev Vinay Kumar <vinay.m.engg@gmail.com=
>:

> Hi Anuj,
>
> >> It seems wrong to me because the patch header/description is not
> >> correct here. It's no longer a backport of just
> >> 42d359350510506b87101cf77202fefcbfc790cb.
>
> Yes, I merged 2 commits first
> (42d359350510506b87101cf77202fefcbfc790cb and
> 217b6dc298156bdb0d6aea9ea93e7e394a5ff091)
> and then backported as a single patch, and I used only the patch
> header of 42d359350510506b87101cf77202fefcbfc790cb.
>
> >> I also just noticed that there's already a fix for this CVE in my
> >> branch. So I think I will take that:
>
> Ok, thanks. Will go with this once it gets merged to the "hardknott"
> branch.
>
> Regards,
> Vinay
>
> On Mon, Aug 2, 2021 at 8:09 AM Mittal, Anuj <anuj.mittal@intel.com> wrote=
:
> >
> > On Sat, 2021-07-31 at 21:57 +0530, Vinay Kumar wrote:
> > > Hi Anuj,
> > >
> > > The patch is conjugate of both commits.
> > >
> https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D42d359350510506b=
87101cf77202fefcbfc790cb
> > >
> > >
> https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D217b6dc298156bdb=
0d6aea9ea93e7e394a5ff091
> > >
> > > Also, the patch is committed to master branch
> > >
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3D55681d09d7f51=
9a1c7f17d17b18ec59bccdc91ca
> > >
> > > Due you want me to resubmit for "hardknott" branch by splitting in to
> > > 2 patches ?
> >
> > It seems wrong to me because the patch header/description is not
> > correct here. It's no longer a backport of just
> > 42d359350510506b87101cf77202fefcbfc790cb.
> >
> > I also just noticed that there's already a fix for this CVE in my
> > branch. So I think I will take that:
> >
> >
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Danujm/=
hardknott&id=3Dede353df06a07d35dc66d024e2c7bd1b250d9761
> >
> > Thanks,
> >
> > Anuj
> >
> > >
> > > Regards,
> > > Vinay
> > >
> > > On Sat, Jul 31, 2021 at 11:52 AM Mittal, Anuj <anuj.mittal@intel.com>
> > > wrote:
> > > >
> > > > On Tue, 2021-07-27 at 11:38 -0700, Vinay Kumar wrote:
> > > > > Source: https://sourceware.org/git/glibc.git
> > > > > Tracking -- https://sourceware.org/bugzilla/show_bug.cgi?id=3D278=
96
> > > > >
> > > > > Backported upstream commit 42d359350510506b87101cf77202fefcbfc790=
cb
> > > > > to
> > > > > glibc-2.33 source with dependent commit id
> > > > > 217b6dc298156bdb0d6aea9ea93e7e394a5ff091.
> > > > >
> > > > > Upstream-Status: Backport
> > > > > [
> > > > >
> https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D42d359350510506b=
87101cf77202fefcbfc790cb
> > > > > ]
> > > >
> > > > It looks like you'd need to backport this one too:
> > > >
> > > >
> https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D217b6dc298156bdb=
0d6aea9ea93e7e394a5ff091
> > > >
> > > > ?
> > > >
> > > > Thanks,
> > > >
> > > > Anuj
> > > >
> > > > >
> > > > > Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> > > > > ---
> > > > >  .../glibc/glibc/CVE-2021-33574.patch          | 61
> > > > > +++++++++++++++++++
> > > > >  meta/recipes-core/glibc/glibc_2.33.bb         |  1 +
> > > > >  2 files changed, 62 insertions(+)
> > > > >  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-
> > > > > 33574.patch
> > > > >
> > > > > diff --git a/meta/recipes-core/glibc/glibc/CVE-2021-33574.patch
> > > > > b/meta/recipes-core/glibc/glibc/CVE-2021-33574.patch
> > > > > new file mode 100644
> > > > > index 0000000000..fd73b23c88
> > > > > --- /dev/null
> > > > > +++ b/meta/recipes-core/glibc/glibc/CVE-2021-33574.patch
> > > > > @@ -0,0 +1,61 @@
> > > > > +From 42d359350510506b87101cf77202fefcbfc790cb Mon Sep 17 00:00:0=
0
> > > > > 2001
> > > > > +From: Andreas Schwab <schwab@linux-m68k.org>
> > > > > +Date: Thu, 27 May 2021 12:49:47 +0200
> > > > > +Subject: [PATCH] Use __pthread_attr_copy in mq_notify (bug 27896=
)
> > > > > +
> > > > > +Make a deep copy of the pthread attribute object to remove a
> > > > > potential
> > > > > +use-after-free issue.
> > > > > +
> > > > > +Upstream-Status: Backport
> > > > > [
> > > > >
> https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D42d359350510506b=
87101cf77202fefcbfc790cb
> > > > > ]
> > > > > +CVE: CVE-2021-33574
> > > > > +Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> > > > > +---
> > > > > +diff --git a/sysdeps/unix/sysv/linux/mq_notify.c
> > > > > b/sysdeps/unix/sysv/linux/mq_notify.c
> > > > > +index cc575a0cdd8..6f46d29d1dc 100644
> > > > > +--- a/sysdeps/unix/sysv/linux/mq_notify.c
> > > > > ++++ b/sysdeps/unix/sysv/linux/mq_notify.c
> > > > > +@@ -133,8 +133,11 @@ helper_thread (void *arg)
> > > > > +           (void) __pthread_barrier_wait (&notify_barrier);
> > > > > +       }
> > > > > +       else if (data.raw[NOTIFY_COOKIE_LEN - 1] =3D=3D NOTIFY_RE=
MOVED)
> > > > > +-      /* The only state we keep is the copy of the thread
> > > > > attributes.  */
> > > > > +-      free (data.attr);
> > > > > ++      {
> > > > > ++        /* The only state we keep is the copy of the thread
> > > > > attributes.  */
> > > > > ++        pthread_attr_destroy (data.attr);
> > > > > ++        free (data.attr);
> > > > > ++      }
> > > > > +     }
> > > > > +   return NULL;
> > > > > + }
> > > > > +@@ -255,8 +258,14 @@ mq_notify (mqd_t mqdes, const struct sigeve=
nt
> > > > > *notification)
> > > > > +       if (data.attr =3D=3D NULL)
> > > > > +       return -1;
> > > > > +
> > > > > +-      memcpy (data.attr, notification->sigev_notify_attributes,
> > > > > +-            sizeof (pthread_attr_t));
> > > > > ++      int ret =3D __pthread_attr_copy (data.attr,
> > > > > ++                                   notification-
> > > > > > sigev_notify_attributes);
> > > > > ++      if (ret !=3D 0)
> > > > > ++      {
> > > > > ++        free (data.attr);
> > > > > ++        __set_errno (ret);
> > > > > ++        return -1;
> > > > > ++      }
> > > > > +     }
> > > > > +
> > > > > +   /* Construct the new request.  */
> > > > > +@@ -269,8 +278,11 @@ mq_notify (mqd_t mqdes, const struct sigeve=
nt
> > > > > *notification)
> > > > > +   int retval =3D INLINE_SYSCALL (mq_notify, 2, mqdes, &se);
> > > > > +
> > > > > +   /* If it failed, free the allocated memory.  */
> > > > > +-  if (__glibc_unlikely (retval !=3D 0))
> > > > > +-    free (data.attr);
> > > > > ++  if (retval !=3D 0 && data.attr !=3D NULL)
> > > > > ++    {
> > > > > ++      pthread_attr_destroy (data.attr);
> > > > > ++      free (data.attr);
> > > > > ++    }
> > > > > +
> > > > > +   return retval;
> > > > > + }
> > > > > diff --git a/meta/recipes-core/glibc/glibc_2.33.bb b/meta/recipes=
-
> > > > > core/glibc/glibc_2.33.bb
> > > > > index 925efe8cc6..e9f01a14c5 100644
> > > > > --- a/meta/recipes-core/glibc/glibc_2.33.bb
> > > > > +++ b/meta/recipes-core/glibc/glibc_2.33.bb
> > > > > @@ -57,6 +57,7 @@ SRC_URI =3D
> > > > > "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=3Dglibc \
> > > > >
> > > > >
> file://0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
> > > > >  \
> > > > >
> > > > > file://0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch \
> > > > >             file://mte-backports.patch \
> > > > > +           file://CVE-2021-33574.patch \
> > > > >             "
> > > > >  S =3D "${WORKDIR}/git"
> > > > >  B =3D "${WORKDIR}/build-${TARGET_SYS}"
> > > >
> >
>
>=20
>
>

--000000000000b3d0e005c9bb9926
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:arial,helvetica,sans-serif">There is now an additional fix on top =
of this:</div><div class=3D"gmail_default" style=3D"font-family:arial,helve=
tica,sans-serif"><br></div><div class=3D"gmail_default" style=3D"font-famil=
y:arial,helvetica,sans-serif"><a href=3D"https://it.slashdot.org/story/21/0=
8/16/2131221/linux-glibc-security-fix-created-a-nastier-linux-bug">https://=
it.slashdot.org/story/21/08/16/2131221/linux-glibc-security-fix-created-a-n=
astier-linux-bug</a></div><div class=3D"gmail_default" style=3D"font-family=
:arial,helvetica,sans-serif"><br></div><div class=3D"gmail_default" style=
=3D"font-family:arial,helvetica,sans-serif"><a href=3D"https://access.redha=
t.com/security/cve/cve-2021-38604">https://access.redhat.com/security/cve/c=
ve-2021-38604</a></div><div class=3D"gmail_default" style=3D"font-family:ar=
ial,helvetica,sans-serif"><br></div></div><div><div style=3D"font-family:ar=
ial,helvetica,sans-serif" class=3D"gmail_default">//E</div></div><div><br><=
/div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Den m=
=C3=A5n 2 aug. 2021 kl 06:14 skrev Vinay Kumar &lt;<a href=3D"mailto:vinay.=
m.engg@gmail.com">vinay.m.engg@gmail.com</a>&gt;:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">Hi Anuj,<br>
<br>
&gt;&gt; It seems wrong to me because the patch header/description is not<b=
r>
&gt;&gt; correct here. It&#39;s no longer a backport of just<br>
&gt;&gt; 42d359350510506b87101cf77202fefcbfc790cb.<br>
<br>
Yes, I merged 2 commits first<br>
(42d359350510506b87101cf77202fefcbfc790cb and<br>
217b6dc298156bdb0d6aea9ea93e7e394a5ff091)<br>
and then backported as a single patch, and I used only the patch<br>
header of 42d359350510506b87101cf77202fefcbfc790cb.<br>
<br>
&gt;&gt; I also just noticed that there&#39;s already a fix for this CVE in=
 my<br>
&gt;&gt; branch. So I think I will take that:<br>
<br>
Ok, thanks. Will go with this once it gets merged to the &quot;hardknott&qu=
ot; branch.<br>
<br>
Regards,<br>
Vinay<br>
<br>
On Mon, Aug 2, 2021 at 8:09 AM Mittal, Anuj &lt;<a href=3D"mailto:anuj.mitt=
al@intel.com" target=3D"_blank">anuj.mittal@intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Sat, 2021-07-31 at 21:57 +0530, Vinay Kumar wrote:<br>
&gt; &gt; Hi Anuj,<br>
&gt; &gt;<br>
&gt; &gt; The patch is conjugate of both commits.<br>
&gt; &gt; <a href=3D"https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=
=3D42d359350510506b87101cf77202fefcbfc790cb" rel=3D"noreferrer" target=3D"_=
blank">https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D42d35935051=
0506b87101cf77202fefcbfc790cb</a><br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=
=3D217b6dc298156bdb0d6aea9ea93e7e394a5ff091" rel=3D"noreferrer" target=3D"_=
blank">https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D217b6dc2981=
56bdb0d6aea9ea93e7e394a5ff091</a><br>
&gt; &gt;<br>
&gt; &gt; Also, the patch is committed to master branch<br>
&gt; &gt; <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/=
?id=3D55681d09d7f519a1c7f17d17b18ec59bccdc91ca" rel=3D"noreferrer" target=
=3D"_blank">http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3D556=
81d09d7f519a1c7f17d17b18ec59bccdc91ca</a><br>
&gt; &gt;<br>
&gt; &gt; Due you want me to resubmit for &quot;hardknott&quot; branch by s=
plitting in to<br>
&gt; &gt; 2 patches ?<br>
&gt;<br>
&gt; It seems wrong to me because the patch header/description is not<br>
&gt; correct here. It&#39;s no longer a backport of just<br>
&gt; 42d359350510506b87101cf77202fefcbfc790cb.<br>
&gt;<br>
&gt; I also just noticed that there&#39;s already a fix for this CVE in my<=
br>
&gt; branch. So I think I will take that:<br>
&gt;<br>
&gt; <a href=3D"https://git.openembedded.org/openembedded-core-contrib/comm=
it/?h=3Danujm/hardknott&amp;id=3Dede353df06a07d35dc66d024e2c7bd1b250d9761" =
rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/openembed=
ded-core-contrib/commit/?h=3Danujm/hardknott&amp;id=3Dede353df06a07d35dc66d=
024e2c7bd1b250d9761</a><br>
&gt;<br>
&gt; Thanks,<br>
&gt;<br>
&gt; Anuj<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; Regards,<br>
&gt; &gt; Vinay<br>
&gt; &gt;<br>
&gt; &gt; On Sat, Jul 31, 2021 at 11:52 AM Mittal, Anuj &lt;<a href=3D"mail=
to:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com</a>&gt;<b=
r>
&gt; &gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Tue, 2021-07-27 at 11:38 -0700, Vinay Kumar wrote:<br>
&gt; &gt; &gt; &gt; Source: <a href=3D"https://sourceware.org/git/glibc.git=
" rel=3D"noreferrer" target=3D"_blank">https://sourceware.org/git/glibc.git=
</a><br>
&gt; &gt; &gt; &gt; Tracking -- <a href=3D"https://sourceware.org/bugzilla/=
show_bug.cgi?id=3D27896" rel=3D"noreferrer" target=3D"_blank">https://sourc=
eware.org/bugzilla/show_bug.cgi?id=3D27896</a><br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Backported upstream commit 42d359350510506b87101cf77202=
fefcbfc790cb<br>
&gt; &gt; &gt; &gt; to<br>
&gt; &gt; &gt; &gt; glibc-2.33 source with dependent commit id<br>
&gt; &gt; &gt; &gt; 217b6dc298156bdb0d6aea9ea93e7e394a5ff091.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Upstream-Status: Backport<br>
&gt; &gt; &gt; &gt; [<br>
&gt; &gt; &gt; &gt; <a href=3D"https://sourceware.org/git/?p=3Dglibc.git;a=
=3Dcommit;h=3D42d359350510506b87101cf77202fefcbfc790cb" rel=3D"noreferrer" =
target=3D"_blank">https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D=
42d359350510506b87101cf77202fefcbfc790cb</a><br>
&gt; &gt; &gt; &gt; ]<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; It looks like you&#39;d need to backport this one too:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; <a href=3D"https://sourceware.org/git/?p=3Dglibc.git;a=3Dcom=
mit;h=3D217b6dc298156bdb0d6aea9ea93e7e394a5ff091" rel=3D"noreferrer" target=
=3D"_blank">https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D217b6d=
c298156bdb0d6aea9ea93e7e394a5ff091</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; ?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Thanks,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Anuj<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Signed-off-by: Vinay Kumar &lt;<a href=3D"mailto:vinay.=
m.engg@gmail.com" target=3D"_blank">vinay.m.engg@gmail.com</a>&gt;<br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt;=C2=A0 .../glibc/glibc/CVE-2021-33574.patch=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 61<br>
&gt; &gt; &gt; &gt; +++++++++++++++++++<br>
&gt; &gt; &gt; &gt;=C2=A0 meta/recipes-core/glibc/<a href=3D"http://glibc_2=
.33.bb" rel=3D"noreferrer" target=3D"_blank">glibc_2.33.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt; &gt; &gt; &gt;=C2=A0 2 files changed, 62 insertions(+)<br>
&gt; &gt; &gt; &gt;=C2=A0 create mode 100644 meta/recipes-core/glibc/glibc/=
CVE-2021-<br>
&gt; &gt; &gt; &gt; 33574.patch<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; diff --git a/meta/recipes-core/glibc/glibc/CVE-2021-335=
74.patch<br>
&gt; &gt; &gt; &gt; b/meta/recipes-core/glibc/glibc/CVE-2021-33574.patch<br=
>
&gt; &gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; &gt; index 0000000000..fd73b23c88<br>
&gt; &gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; &gt; +++ b/meta/recipes-core/glibc/glibc/CVE-2021-33574.patc=
h<br>
&gt; &gt; &gt; &gt; @@ -0,0 +1,61 @@<br>
&gt; &gt; &gt; &gt; +From 42d359350510506b87101cf77202fefcbfc790cb Mon Sep =
17 00:00:00<br>
&gt; &gt; &gt; &gt; 2001<br>
&gt; &gt; &gt; &gt; +From: Andreas Schwab &lt;<a href=3D"mailto:schwab@linu=
x-m68k.org" target=3D"_blank">schwab@linux-m68k.org</a>&gt;<br>
&gt; &gt; &gt; &gt; +Date: Thu, 27 May 2021 12:49:47 +0200<br>
&gt; &gt; &gt; &gt; +Subject: [PATCH] Use __pthread_attr_copy in mq_notify =
(bug 27896)<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +Make a deep copy of the pthread attribute object to re=
move a<br>
&gt; &gt; &gt; &gt; potential<br>
&gt; &gt; &gt; &gt; +use-after-free issue.<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +Upstream-Status: Backport<br>
&gt; &gt; &gt; &gt; [<br>
&gt; &gt; &gt; &gt; <a href=3D"https://sourceware.org/git/?p=3Dglibc.git;a=
=3Dcommit;h=3D42d359350510506b87101cf77202fefcbfc790cb" rel=3D"noreferrer" =
target=3D"_blank">https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D=
42d359350510506b87101cf77202fefcbfc790cb</a><br>
&gt; &gt; &gt; &gt; ]<br>
&gt; &gt; &gt; &gt; +CVE: CVE-2021-33574<br>
&gt; &gt; &gt; &gt; +Signed-off-by: Vinay Kumar &lt;<a href=3D"mailto:vinay=
.m.engg@gmail.com" target=3D"_blank">vinay.m.engg@gmail.com</a>&gt;<br>
&gt; &gt; &gt; &gt; +---<br>
&gt; &gt; &gt; &gt; +diff --git a/sysdeps/unix/sysv/linux/mq_notify.c<br>
&gt; &gt; &gt; &gt; b/sysdeps/unix/sysv/linux/mq_notify.c<br>
&gt; &gt; &gt; &gt; +index cc575a0cdd8..6f46d29d1dc 100644<br>
&gt; &gt; &gt; &gt; +--- a/sysdeps/unix/sysv/linux/mq_notify.c<br>
&gt; &gt; &gt; &gt; ++++ b/sysdeps/unix/sysv/linux/mq_notify.c<br>
&gt; &gt; &gt; &gt; +@@ -133,8 +133,11 @@ helper_thread (void *arg)<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) __pthr=
ead_barrier_wait (&amp;notify_barrier);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (data.raw[NOTIFY_CO=
OKIE_LEN - 1] =3D=3D NOTIFY_REMOVED)<br>
&gt; &gt; &gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 /* The only state we keep is the=
 copy of the thread<br>
&gt; &gt; &gt; &gt; attributes.=C2=A0 */<br>
&gt; &gt; &gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 free (data.attr);<br>
&gt; &gt; &gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; &gt; &gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* The only state we keep=
 is the copy of the thread<br>
&gt; &gt; &gt; &gt; attributes.=C2=A0 */<br>
&gt; &gt; &gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 pthread_attr_destroy (dat=
a.attr);<br>
&gt; &gt; &gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 free (data.attr);<br>
&gt; &gt; &gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0return NULL;<br>
&gt; &gt; &gt; &gt; + }<br>
&gt; &gt; &gt; &gt; +@@ -255,8 +258,14 @@ mq_notify (mqd_t mqdes, const str=
uct sigevent<br>
&gt; &gt; &gt; &gt; *notification)<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (data.attr =3D=3D NULL)<=
br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 memcpy (data.attr, notification-=
&gt;sigev_notify_attributes,<br>
&gt; &gt; &gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof (pth=
read_attr_t));<br>
&gt; &gt; &gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 int ret =3D __pthread_attr_copy =
(data.attr,<br>
&gt; &gt; &gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0no=
tification-<br>
&gt; &gt; &gt; &gt; &gt; sigev_notify_attributes);<br>
&gt; &gt; &gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 if (ret !=3D 0)<br>
&gt; &gt; &gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; &gt; &gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 free (data.attr);<br>
&gt; &gt; &gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 __set_errno (ret);<br>
&gt; &gt; &gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; &gt; &gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0/* Construct the new request.=C2=A0 */<br=
>
&gt; &gt; &gt; &gt; +@@ -269,8 +278,11 @@ mq_notify (mqd_t mqdes, const str=
uct sigevent<br>
&gt; &gt; &gt; &gt; *notification)<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0int retval =3D INLINE_SYSCALL (mq_notify,=
 2, mqdes, &amp;se);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0/* If it failed, free the allocated memor=
y.=C2=A0 */<br>
&gt; &gt; &gt; &gt; +-=C2=A0 if (__glibc_unlikely (retval !=3D 0))<br>
&gt; &gt; &gt; &gt; +-=C2=A0 =C2=A0 free (data.attr);<br>
&gt; &gt; &gt; &gt; ++=C2=A0 if (retval !=3D 0 &amp;&amp; data.attr !=3D NU=
LL)<br>
&gt; &gt; &gt; &gt; ++=C2=A0 =C2=A0 {<br>
&gt; &gt; &gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 pthread_attr_destroy (data.attr)=
;<br>
&gt; &gt; &gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 free (data.attr);<br>
&gt; &gt; &gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0return retval;<br>
&gt; &gt; &gt; &gt; + }<br>
&gt; &gt; &gt; &gt; diff --git a/meta/recipes-core/glibc/<a href=3D"http://=
glibc_2.33.bb" rel=3D"noreferrer" target=3D"_blank">glibc_2.33.bb</a> b/met=
a/recipes-<br>
&gt; &gt; &gt; &gt; core/glibc/<a href=3D"http://glibc_2.33.bb" rel=3D"nore=
ferrer" target=3D"_blank">glibc_2.33.bb</a><br>
&gt; &gt; &gt; &gt; index 925efe8cc6..e9f01a14c5 100644<br>
&gt; &gt; &gt; &gt; --- a/meta/recipes-core/glibc/<a href=3D"http://glibc_2=
.33.bb" rel=3D"noreferrer" target=3D"_blank">glibc_2.33.bb</a><br>
&gt; &gt; &gt; &gt; +++ b/meta/recipes-core/glibc/<a href=3D"http://glibc_2=
.33.bb" rel=3D"noreferrer" target=3D"_blank">glibc_2.33.bb</a><br>
&gt; &gt; &gt; &gt; @@ -57,6 +57,7 @@ SRC_URI =3D<br>
&gt; &gt; &gt; &gt; &quot;${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=3Dgli=
bc \<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; file://0029-wordsize.h-Unify-the-header-between-arm-and=
-aarch64.patch<br>
&gt; &gt; &gt; &gt;=C2=A0 \<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; file://0030-powerpc-Do-not-ask-compiler-for-finding-arc=
h.patch \<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://m=
te-backports.patch \<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-20=
21-33574.patch \<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<b=
r>
&gt; &gt; &gt; &gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; &gt; &gt; &gt;=C2=A0 B =3D &quot;${WORKDIR}/build-${TARGET_SYS}&quot;<=
br>
&gt; &gt; &gt;<br>
&gt;<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000b3d0e005c9bb9926--
