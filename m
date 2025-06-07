Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14D67C61CE7
	for <webhook@archiver.kernel.org>; Sat,  7 Jun 2025 22:40:34 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web11.27666.1749336029980225285
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Jun 2025 15:40:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q6AO2oyX;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-70dd2d35449so24607177b3.3
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Jun 2025 15:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749336029; x=1749940829; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7AyXwqf8JQBR5PFmaD67TrofPQMoWiUcyPJ29jNfYiI=;
        b=Q6AO2oyXzJWCkTjjm2gSARDJLvgLu2sqygdb64Ss/5gB3T/arDQ5p7Hwkqqdm7x9io
         GZmz5uN3qoB/fC53DHT3SNfw3oUoVFbkh8HHoMt65LH76569P0BM1zkU0sSK8pKTf/dJ
         MDnQ/N3uwvypllVE5pq06HqnD9yn4t+rC30M2eSIAEKhU2P1Qlk8+7VEGIkOih2Xehuv
         K9Bhkcx8SNbhT2vsDodIDs5ICK0w7GYzGMIufAonzuhDoDn30omlM/YlgXE19bXmbYAa
         dW37AnRO3/eZWdTjRar+8b0LmejQazg/07WDPgMSCDJ233Oqh3mH6vAqChWLE5XDGh/x
         21RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749336029; x=1749940829;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7AyXwqf8JQBR5PFmaD67TrofPQMoWiUcyPJ29jNfYiI=;
        b=F8wWL06RYYEALAvGM3nyVjnhoTtBmzpdIzf4Z55oLzrCdv3o8CsGCXtspkhU43sfCq
         2OowfNZ52XmY3heoK1zvUqN0ReNR5lWNr6QsamMzthKS7F2Oo6HI3GDy1MnLHh6OCicx
         6DGfeuF+yM0G9nsDNUf1uRd1p/BDT8cnb34v7feaQaTsDWGVv4rtJ9oYUWWWBIy3d1Vp
         iGvlycOzBlDSF/b7iCO+yduWu5xnQpVHEROA69/o2NlNuIYDylOwGTPQto4xzR36aVMK
         z+knOTUvJFoAJyfFwQYfn0dm5OQWSvKkZJPL+G2b9afUdmueWd5LBFenMkl130Dinb1H
         bfaw==
X-Forwarded-Encrypted: i=1; AJvYcCXMSZV2zekTO44ujsVSaSXHYDUdKeCbxRTR4sFbeJPPqCe71Yx376lO0ko27ya2bj/GUM9xIhncYkI/2Gx9VLyC8Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyZeg9p8+/mBrOan7v0htIxzhOUJWP9AJCybNSY2SuzEgcbHurk
	IqOC+6BT6D7t7qMENdahgmeedBB+inravNQ3zlDt+OxF42YRgAxQb9Pzl6emqBL3x4a41SKAZoQ
	AHU0PyLnl3IBqhcP+Z/hLHpGD2Dl5/Oc=
X-Gm-Gg: ASbGncsaDjLohTrxDjkFvsUR0U2WuPQViOpvrnuq3RW1nUdTV/MWSsAI3htwE5QaNd6
	ttdDbKm+CE7rktb8fB2w0MPq21C3l1w7rwDksUyic3+owMyUFY97kpCvwo5/1lYF8S4bMohqLza
	qjVOI7hOEz4Z7y/Ab+/1AoUNRjGrsfVNptBftfXUJ7foz0dlFvrd7CTCBZpOP563bYIg==
X-Google-Smtp-Source: AGHT+IHU/7G3RfSwj2+zd3LlJAxGzsMemtLjiA+u6JthDfhq/raAMK6wbYG/z2MYiO0GHl9TZIpbObygXyO+ivTo4pE=
X-Received: by 2002:a05:690c:4c07:b0:70c:d9e0:f657 with SMTP id
 00721157ae682-710f77372aamr123883367b3.35.1749336029060; Sat, 07 Jun 2025
 15:40:29 -0700 (PDT)
MIME-Version: 1.0
References: <26D43BA4-43AE-4D40-8533-8D443F804F97@arm.com> <440c4178-40b0-47c7-b7dc-1e0ee9cf65b0@gmail.com>
 <20250605194043.nzlanfitchaedeyb@hiago-nb> <CAMKF1srYrrHALtb3MzfdPKZOBv_Vc9CvDbK9oXv=bK+echkugg@mail.gmail.com>
 <20250607214859.xtgkq6sirsvnweyo@hiago-nb>
In-Reply-To: <20250607214859.xtgkq6sirsvnweyo@hiago-nb>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 7 Jun 2025 15:40:18 -0700
X-Gm-Features: AX0GCFv_6IYhiNicKmY9reGHYc1kvmYpSSDoQBE_udVfdDU7Cr3m1_U3KBhs_xs
Message-ID: <CAMKF1sryNXm5K5Ex9fKuooQPHptNQf=-fsuy-6cZwj7tH_rE2w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libgcrypt: fix compile error for t-thread-local
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Hongxu Jia <hongxu.jia@windriver.com>, Hiago De Franco <hiago.franco@toradex.com>
Content-Type: multipart/alternative; boundary="0000000000009ae0ee063703083f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Jun 2025 22:40:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218207

--0000000000009ae0ee063703083f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I meant glibc on the build machine not Yocto target

On Sat, Jun 7, 2025 at 2:49=E2=80=AFPM Hiago De Franco <hiagofranco@gmail.c=
om>
wrote:

> On Thu, Jun 05, 2025 at 12:53:23PM -0700, Khem Raj wrote:
> > On Thu, Jun 5, 2025 at 12:40=E2=80=AFPM Hiago De Franco <hiagofranco@gm=
ail.com>
> wrote:
> > >
> > > Hi Ross, Khem,
> > >
> > > On Thu, Jun 05, 2025 at 01:44:08PM +0000, Ross Burton wrote:
> > > > On 2 Jun 2025, at 21:55, Hiago De Franco via lists.openembedded.org
> <hiagofranco=3Dgmail.com@lists.openembedded.org> wrote:
> > > > >
> > > > > From: Hiago De Franco <hiago.franco@toradex.com>
> > > > >
> > > > > Currently the libgcrypt-native build is failing with the followin=
g
> > > > > error:
> > > > >
> > > > > | ld: t_thread_local-t-thread-local.o: in function `main':
> > > > > | t-thread-local.c:(.text.startup+0x187): undefined reference to
> `pthread_create'
> > > > > | ld: t-thread-local.c:(.text.startup+0x1d0): undefined reference
> to `pthread_join'
> > > > >
> > > > > Backport the fix from upstream and add "-lpthread" to
> > > > > "t_thread_local_CFLAGS" to make the compilation successfull,
> similar to
> > > > > what
> 0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
> > > > > does.
> > > >
> > > > This has been merged but I=E2=80=99m curious: in what situations do=
es this
> fail? The commit talks about NetBSD and we=E2=80=99re not seeing this on =
the
> autobuilder cluster.
> > >
> > > The NetBSD part is from the commit I backported, because I saw this w=
as
> > > fixed upstream. Looks they were the first to see this issue.
> > >
> > > I am not sure why the autobuilder was not able to catch it, we do
> > > nightly builds of oe-core master with our hardware and the upgrade of
> > > libgcrypt recipe introduced a regression were all our machines were
> > > broken.
> > >
> > > I attached the do_compile log failure, but the issue happends here:
> > >
> > > build/tmp/hosttools/ld: t-thread-local.o: in function `main':
> > > t-thread-local.c:(.text.startup+0x187): undefined reference to
> `pthread_create'
> > > /build/tmp/hosttools/ld: t-thread-local.c:(.text.startup+0x1d0):
> undefined reference to `pthread_join'
> > >
> >
> >
> > My guess is that you are using glibc before pthread merge into libc.so
> > which could be alma-8 distro or some such
> > we do have alma-8 nodes on AB but I guess this escaped building on
> alma-8 hosts.
> >
> > Whats your build distro  and version of glibc on it
> >
>
> In this case we are using a custom distro, and an image based on
> core-image.
>
> For glibc, we use the one from oe-core:
>
> $ bitbake-getvar -r virtual/libc --value PN
> glibc
> $ bitbake-getvar -r virtual/libc --value PV
> 2.41+git
>
> [...]
>
> Best Regards,
> Hiago
>

--0000000000009ae0ee063703083f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I meant glibc on the build machine not Yocto target=C2=A0=
</div><div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D=
"ltr" class=3D"gmail_attr">On Sat, Jun 7, 2025 at 2:49=E2=80=AFPM Hiago De =
Franco &lt;<a href=3D"mailto:hiagofranco@gmail.com">hiagofranco@gmail.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, Jun 05, 2025 =
at 12:53:23PM -0700, Khem Raj wrote:<br>
&gt; On Thu, Jun 5, 2025 at 12:40=E2=80=AFPM Hiago De Franco &lt;<a href=3D=
"mailto:hiagofranco@gmail.com" target=3D"_blank">hiagofranco@gmail.com</a>&=
gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Hi Ross, Khem,<br>
&gt; &gt;<br>
&gt; &gt; On Thu, Jun 05, 2025 at 01:44:08PM +0000, Ross Burton wrote:<br>
&gt; &gt; &gt; On 2 Jun 2025, at 21:55, Hiago De Franco via <a href=3D"http=
://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.opene=
mbedded.org</a> &lt;hiagofranco=3D<a href=3D"mailto:gmail.com@lists.openemb=
edded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote=
:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; From: Hiago De Franco &lt;<a href=3D"mailto:hiago.franc=
o@toradex.com" target=3D"_blank">hiago.franco@toradex.com</a>&gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Currently the libgcrypt-native build is failing with th=
e following<br>
&gt; &gt; &gt; &gt; error:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; | ld: t_thread_local-t-thread-local.o: in function `mai=
n&#39;:<br>
&gt; &gt; &gt; &gt; | t-thread-local.c:(.text.startup+0x187): undefined ref=
erence to `pthread_create&#39;<br>
&gt; &gt; &gt; &gt; | ld: t-thread-local.c:(.text.startup+0x1d0): undefined=
 reference to `pthread_join&#39;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Backport the fix from upstream and add &quot;-lpthread&=
quot; to<br>
&gt; &gt; &gt; &gt; &quot;t_thread_local_CFLAGS&quot; to make the compilati=
on successfull, similar to<br>
&gt; &gt; &gt; &gt; what 0004-tests-Makefile.am-fix-undefined-reference-to-=
pthread.patch<br>
&gt; &gt; &gt; &gt; does.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; This has been merged but I=E2=80=99m curious: in what situat=
ions does this fail? The commit talks about NetBSD and we=E2=80=99re not se=
eing this on the autobuilder cluster.<br>
&gt; &gt;<br>
&gt; &gt; The NetBSD part is from the commit I backported, because I saw th=
is was<br>
&gt; &gt; fixed upstream. Looks they were the first to see this issue.<br>
&gt; &gt;<br>
&gt; &gt; I am not sure why the autobuilder was not able to catch it, we do=
<br>
&gt; &gt; nightly builds of oe-core master with our hardware and the upgrad=
e of<br>
&gt; &gt; libgcrypt recipe introduced a regression were all our machines we=
re<br>
&gt; &gt; broken.<br>
&gt; &gt;<br>
&gt; &gt; I attached the do_compile log failure, but the issue happends her=
e:<br>
&gt; &gt;<br>
&gt; &gt; build/tmp/hosttools/ld: t-thread-local.o: in function `main&#39;:=
<br>
&gt; &gt; t-thread-local.c:(.text.startup+0x187): undefined reference to `p=
thread_create&#39;<br>
&gt; &gt; /build/tmp/hosttools/ld: t-thread-local.c:(.text.startup+0x1d0): =
undefined reference to `pthread_join&#39;<br>
&gt; &gt;<br>
&gt; <br>
&gt; <br>
&gt; My guess is that you are using glibc before pthread merge into libc.so=
<br>
&gt; which could be alma-8 distro or some such<br>
&gt; we do have alma-8 nodes on AB but I guess this escaped building on alm=
a-8 hosts.<br>
&gt; <br>
&gt; Whats your build distro=C2=A0 and version of glibc on it<br>
&gt; <br>
<br>
In this case we are using a custom distro, and an image based on<br>
core-image.<br>
<br>
For glibc, we use the one from oe-core:<br>
<br>
$ bitbake-getvar -r virtual/libc --value PN<br>
glibc<br>
$ bitbake-getvar -r virtual/libc --value PV<br>
2.41+git<br>
<br>
[...]<br>
<br>
Best Regards,<br>
Hiago<br>
</blockquote></div></div>

--0000000000009ae0ee063703083f--

