Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D25F8C3ABB2
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 03:15:59 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web11.2824.1748574957994314598
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 20:15:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MXGoRrB1;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-601a8b6c133so1273131eaf.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 20:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748574957; x=1749179757; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UM84oq/1KSluZ35bRhK/sXgMbu6LgzA8Oh624sk9u68=;
        b=MXGoRrB1GfixCcUIJ+QnrCtB4QuakK5e7Y4aYMu83WkqJLM1QhzC8Wu202FJq+3Zgl
         WSdUArLqLBPSv4GznDQitZIigighLkYV1KAoh9lzuLMcNa68XqlEvr12szl6Y9lOx/R8
         D6rhmo5u2b1r0O9yAMtv5RGIOzGAMQEIpMjpoFailBdAlShf2rgQaSRY5S2Jig50w3Bz
         LFwSRDShgSxFg29QeY/51Vb4iLtVyMZBdS4/5SJX4RpCgxWaU5hArm/WbgcJqPyPwp1p
         +90PV2p4dxx8NDmaBfRaf/nipBoea027d/+FW3Km/81+u1klGCgelwHhXWpNYBT62Ra0
         k1Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748574957; x=1749179757;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UM84oq/1KSluZ35bRhK/sXgMbu6LgzA8Oh624sk9u68=;
        b=WevSyULcvPtVTy0aji3q7SWZLm9AvGCYHfAx8cTYXVWoLPFMHAxt19/xj6O/QgEeyd
         ATuNKkXmJ2hlN4hCJnz+UeseHISQUyYYAU3jQFOsi3cNVda6LinVB6+rUU/eLnuPf9DR
         4kpYaCgf/4YbVqAJV+j2DgrP6LQXaXfgnOv9cmNpbw+oF10nihxdZVTQQe+65t0VeKor
         Iv4eZV5wyuXGEQzPvVYUaRklnE+GXgbhoLGOFvep65O59ex1pDYjlVWfGbccU6Uh/6N0
         YGdSQlmO2bUbFb/JPNlmvzJ3uoWi4Zu0jISOkH4+UvGoyblcZD8xz9RQSJBGUErl+VZb
         dqGg==
X-Forwarded-Encrypted: i=1; AJvYcCVH/xviLzbONMmCtGLwawqz/XOsyzJzlp967VCPkBUDjbB1TdmhBXeBZQt2mszuHLX4ts3YvoiIEN9Y29JD0xcIxA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwFksbu0HWomBAQxtBUFpMNWgR23a1bD0VQIVR7tl4omiiQAnrE
	SjgrLXJxxQEHqDBp04dgcKjHteK+usB9FphQJ7/MSbBTdpVY/nolS6jR8LPFYMMp9Xs9jm+D0bQ
	x9/vd5WYboMhsK7csesmTCxVWflM7YCM=
X-Gm-Gg: ASbGncsQpe6DOnmxGkodpbW/u4c5ornx0EfyScNPzkajiLh0TmA69mxtSpB1hoZJOix
	rl67xOFldE8i2gHY3a83NbP9El+mmk2dPvGHZ5wDeY7VPjMsUJ0dzymU2gda0GB7XFln0+HQjwJ
	H4RuUtywks1uTeUW5euQvMF36PeS3YzIJXwLRVpu4zute24XT2DsR//8YwRXC7gkyUzQ==
X-Google-Smtp-Source: AGHT+IFt6o/ERZ4DQ5ZPchqpmQm3H9i5qB371KTO0PAPFQPPe3KAFdtOooBZwJjoQKWGqm9A8rMigH3OmBEIbqwipoA=
X-Received: by 2002:a05:6870:e814:b0:2e8:7752:b540 with SMTP id
 586e51a60fabf-2e9214a7577mr864096fac.15.1748574957062; Thu, 29 May 2025
 20:15:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250521031413.1566-1-liuyd.fnst@fujitsu.com> <CANNYZj9kMw3iqYi-tpWY19TbCTKjNHO2HDc=dXpu26efHDGbRQ@mail.gmail.com>
 <OSRPR01MB11597AA06EC57367CB529CBD19B98A@OSRPR01MB11597.jpnprd01.prod.outlook.com>
 <08f939dc-0880-4a2f-80af-6e8d512bf8b9@gmail.com> <OSRPR01MB1159756B512144F28ECCE295C9B61A@OSRPR01MB11597.jpnprd01.prod.outlook.com>
In-Reply-To: <OSRPR01MB1159756B512144F28ECCE295C9B61A@OSRPR01MB11597.jpnprd01.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 29 May 2025 20:15:46 -0700
X-Gm-Features: AX0GCFsLYjR9A47JpJPhUGKtccTfJhn92yStwDPADsz5XY4IIWNAt2OgNLTkmR4
Message-ID: <CAMKF1sqJWO6wiUD6SMTab4ht408ZaW3e5npw_g0WdSa-oKnZPQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] clang: multilib-header fix for
 llvm/Config/llvm-config.h and clang/Config/config.h
To: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
Cc: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002dd074063651d5b5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 03:15:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217461

--0000000000002dd074063651d5b5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes please ping Richard or Mathieu to stage it

On Thu, May 29, 2025 at 7:58=E2=80=AFPM Yiding Liu (Fujitsu) <liuyd.fnst@fu=
jitsu.com>
wrote:

>
>
> > -----Original Message-----
> > From: Khem Raj <raj.khem@gmail.com>
> > Sent: 2025=E5=B9=B45=E6=9C=8823=E6=97=A5 9:45
> > To: Liu, Yiding/=E5=88=98 =E4=B9=99=E4=B8=81 <liuyd.fnst@fujitsu.com>; =
alex.kanavin@gmail.com
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH] clang: multilib-header fix for
> > llvm/Config/llvm-config.h and clang/Config/config.h
> >
> >
> >
> > On 5/22/25 6:22 PM, Yiding Liu (Fujitsu) wrote:
> > >
> > >
> > >> -----Original Message-----
> > >> From: openembedded-core@lists.openembedded.org
> > >> <openembedded-core@lists.openembedded.org> On Behalf Of Alexander
> > >> Kanavin via lists.openembedded.org
> > >> Sent: 2025=E5=B9=B45=E6=9C=8822=E6=97=A5 18:22
> > >> To: Liu, Yiding/=E5=88=98 =E4=B9=99=E4=B8=81 <liuyd.fnst@fujitsu.com=
>
> > >> Cc: Khem Raj <raj.khem@gmail.com>;
> > >> openembedded-core@lists.openembedded.org
> > >> Subject: Re: [OE-core] [PATCH] clang: multilib-header fix for
> > >> llvm/Config/llvm-config.h and clang/Config/config.h
> > >>
> > >> On Wed, 21 May 2025 at 05:14, Yiding Liu (Fujitsu) via
> > >> lists.openembedded.org
> > >> <liuyd.fnst=3Dfujitsu.com@lists.openembedded.org>
> > >> wrote:
> > >>>
> > >>> Error: Transaction test error:
> > >>>    file /usr/include/clang/Config/config.h conflicts between
> > >>> attempted installs of
> > >>> lib32-clang-dev-20.1.4-r0.core2_32 and clang-dev-20.1.4-r0.core2_64
> > >>>    file /usr/include/llvm/Config/llvm-config.h conflicts between
> > >>> attempted installs of lib32-clang-dev-20.1.4-r0.core2_32 and
> > >>> clang-dev-20.1.4-r0.core2_64
> > >>
> > >> What is the actual difference between the headers and where does it
> > originate?
> > >> Before any multilib fixes are applied, this does need to be
> > >> investigated. This is repeatedly being asked in response to similar
> > >> patches, and it would be good if such investigations happen up front=
.
> > >
> > > Let me explain it more clearly
> > > 1. This fix started from my original patch in April
> > > https://lists.openembedded.org/g/openembedded-core/message/215193
> > >
> > > 2. Then Khem Raj raj.khem@gmail.com merged a patch set, claiming it
> would
> > resolve the conflict issues. But in reality, it didn=E2=80=99t.
> > >
> > > For the difference, I have pasted it here:
> > >
> > https://lists.openembedded.org/g/openembedded-core/message/216811?p=3D%=
2
> > >
> > C%2C%2C20%2C0%2C0%2C0%3A%3Arecentpostdate%2Fsticky%2C%2Cllvm-co
> > nfig.h%
> > > 2C20%2C2%2C0%2C112624219
> > >
> > >
> > > I know multi-script or multi-header is the last step we should
> consider.
> > > But regarding this issue, if you or Khem Raj have any good
> suggestions, please
> > let me know.
> >
> > These are configuration headers and will depend upon how clang/llvm is
> built, I
> > hoped that we maybe able to generate identical file by enabling all
> backends but
> > it has more entries that vary according to multilibs.
> > At this point this is best we can do, install multilibbed versions of
> these headers.
> > This patch is fine to go in.
>
>
> Hi Raj
>
> I noticed this patch still hasn't been tested by the master-next branch.
> Should we consider testing it now?
> Or is there anything else I can do?
>
>
> Yiding
>
>
>
> >
> > >
> > >
> > > Liu Yiding
> > >>
> > >> Alex
>
>

--0000000000002dd074063651d5b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Yes please ping Richard or Mathieu to stage it=C2=A0</div=
><div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Thu, May 29, 2025 at 7:58=E2=80=AFPM Yiding Liu (F=
ujitsu) &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.com">liuyd.fnst@fujitsu.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_bl=
ank">raj.khem@gmail.com</a>&gt;<br>
&gt; Sent: 2025=E5=B9=B45=E6=9C=8823=E6=97=A5 9:45<br>
&gt; To: Liu, Yiding/=E5=88=98 =E4=B9=99=E4=B8=81 &lt;<a href=3D"mailto:liu=
yd.fnst@fujitsu.com" target=3D"_blank">liuyd.fnst@fujitsu.com</a>&gt;; <a h=
ref=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.=
com</a><br>
&gt; Cc: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Subject: Re: [OE-core] [PATCH] clang: multilib-header fix for<br>
&gt; llvm/Config/llvm-config.h and clang/Config/config.h<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; On 5/22/25 6:22 PM, Yiding Liu (Fujitsu) wrote:<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;&gt; -----Original Message-----<br>
&gt; &gt;&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.=
org" target=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; &gt;&gt; &lt;<a href=3D"mailto:openembedded-core@lists.openembedded.or=
g" target=3D"_blank">openembedded-core@lists.openembedded.org</a>&gt; On Be=
half Of Alexander<br>
&gt; &gt;&gt; Kanavin via <a href=3D"http://lists.openembedded.org" rel=3D"=
noreferrer" target=3D"_blank">lists.openembedded.org</a><br>
&gt; &gt;&gt; Sent: 2025=E5=B9=B45=E6=9C=8822=E6=97=A5 18:22<br>
&gt; &gt;&gt; To: Liu, Yiding/=E5=88=98 =E4=B9=99=E4=B8=81 &lt;<a href=3D"m=
ailto:liuyd.fnst@fujitsu.com" target=3D"_blank">liuyd.fnst@fujitsu.com</a>&=
gt;<br>
&gt; &gt;&gt; Cc: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;;<br>
&gt; &gt;&gt; <a href=3D"mailto:openembedded-core@lists.openembedded.org" t=
arget=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; &gt;&gt; Subject: Re: [OE-core] [PATCH] clang: multilib-header fix for=
<br>
&gt; &gt;&gt; llvm/Config/llvm-config.h and clang/Config/config.h<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On Wed, 21 May 2025 at 05:14, Yiding Liu (Fujitsu) via<br>
&gt; &gt;&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" =
target=3D"_blank">lists.openembedded.org</a><br>
&gt; &gt;&gt; &lt;liuyd.fnst=3D<a href=3D"mailto:fujitsu.com@lists.openembe=
dded.org" target=3D"_blank">fujitsu.com@lists.openembedded.org</a>&gt;<br>
&gt; &gt;&gt; wrote:<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Error: Transaction test error:<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 file /usr/include/clang/Config/config.h conf=
licts between<br>
&gt; &gt;&gt;&gt; attempted installs of<br>
&gt; &gt;&gt;&gt; lib32-clang-dev-20.1.4-r0.core2_32 and clang-dev-20.1.4-r=
0.core2_64<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 file /usr/include/llvm/Config/llvm-config.h =
conflicts between<br>
&gt; &gt;&gt;&gt; attempted installs of lib32-clang-dev-20.1.4-r0.core2_32 =
and<br>
&gt; &gt;&gt;&gt; clang-dev-20.1.4-r0.core2_64<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; What is the actual difference between the headers and where d=
oes it<br>
&gt; originate?<br>
&gt; &gt;&gt; Before any multilib fixes are applied, this does need to be<b=
r>
&gt; &gt;&gt; investigated. This is repeatedly being asked in response to s=
imilar<br>
&gt; &gt;&gt; patches, and it would be good if such investigations happen u=
p front.<br>
&gt; &gt;<br>
&gt; &gt; Let me explain it more clearly<br>
&gt; &gt; 1. This fix started from my original patch in April<br>
&gt; &gt; <a href=3D"https://lists.openembedded.org/g/openembedded-core/mes=
sage/215193" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-core/message/215193</a><br>
&gt; &gt;<br>
&gt; &gt; 2. Then Khem Raj <a href=3D"mailto:raj.khem@gmail.com" target=3D"=
_blank">raj.khem@gmail.com</a> merged a patch set, claiming it would<br>
&gt; resolve the conflict issues. But in reality, it didn=E2=80=99t.<br>
&gt; &gt;<br>
&gt; &gt; For the difference, I have pasted it here:<br>
&gt; &gt;<br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-core/message/=
216811?p=3D%2" rel=3D"noreferrer" target=3D"_blank">https://lists.openembed=
ded.org/g/openembedded-core/message/216811?p=3D%2</a><br>
&gt; &gt;<br>
&gt; C%2C%2C20%2C0%2C0%2C0%3A%3Arecentpostdate%2Fsticky%2C%2Cllvm-co<br>
&gt; nfig.h%<br>
&gt; &gt; 2C20%2C2%2C0%2C112624219<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; I know multi-script or multi-header is the last step we should co=
nsider.<br>
&gt; &gt; But regarding this issue, if you or Khem Raj have any good sugges=
tions, please<br>
&gt; let me know.<br>
&gt; <br>
&gt; These are configuration headers and will depend upon how clang/llvm is=
 built, I<br>
&gt; hoped that we maybe able to generate identical file by enabling all ba=
ckends but<br>
&gt; it has more entries that vary according to multilibs.<br>
&gt; At this point this is best we can do, install multilibbed versions of =
these headers.<br>
&gt; This patch is fine to go in.<br>
<br>
<br>
Hi Raj<br>
<br>
I noticed this patch still hasn&#39;t been tested by the master-next branch=
. Should we consider testing it now?<br>
Or is there anything else I can do?<br>
<br>
<br>
Yiding<br>
<br>
<br>
<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Liu Yiding<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Alex<br>
<br>
</blockquote></div></div>

--0000000000002dd074063651d5b5--

