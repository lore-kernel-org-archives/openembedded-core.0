Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDFC7C2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 21:13:56 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web11.2399.1747343633986176633
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 14:13:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LGxOU4Uu;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4034118aeb7so650261b6e.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 14:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747343633; x=1747948433; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h8Y8udbtAino0fBPFAcRoETtEW86fRTVk5EJI2GZ6XY=;
        b=LGxOU4Uuw67nA7bQTCF0R+mmjBmTTMKtfvhrjXT6kXj/UHl/Y7YvFK9B9pw9TcZ/8W
         3sS2G1KktX7uSQoGxa1s6Vb/k9nIcSgvMYR/XpKxZ7TES1v5n3YpjUmQYGEITQJJNVIu
         ujm+jWtwNfnc4RUG9NS8leh8stxeqqRhSpwyRrsOTfxJw+Qzq3Tu7Vm6sPmLmDMhmhGj
         a1Fs4dMhp3CrnrnTGJUq6+NtAWkv2Wxr5t4QOf+tBh3ovoJfDnshcisGqj/RV58QW4E7
         5WHm2QZSllsfXYax/C5MujEWeuLuJBuWmPvSWfKfxU5GiJaAE/OYudbN7eEe20RpCpok
         g4bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747343633; x=1747948433;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h8Y8udbtAino0fBPFAcRoETtEW86fRTVk5EJI2GZ6XY=;
        b=ZMGBohm9Ae3Qj9h0UFguMcLMq4lPG01/7TLMdZHFdCvSGOIIEoVUDtxKcXRp0ahIcW
         QaSPRhltBM5Qg1XQEpks6TJniRQ+VvC4ETNoGhpZTbjILnNOQtJKl0mL1i1AbvnWo6U6
         TG29Ph8kGrL5xPsXPzlNdgNe2KgBLcYmpz579PI6ANIdcCBnq6OitdTerQNXZzuudtmi
         44HfApEKAlhxtc7G4vXzlhAtqCoWWvRM6H3XSd+8VQVpo+km0ObsAF7Pb6PZ5exNn7Gk
         Gmf3ikLIQRYSfci2JtK8/6C3071d7XkgLHQOpD0hUSH4laaCz5weHypQ8vn0hk69l2w/
         C5MA==
X-Forwarded-Encrypted: i=1; AJvYcCXsXg8HE2lR+eaHWHQx5AtDTZ1sAWH2+c7kEmsQUGZIy1CmxPDOdyDLGUY6tRyOhQSiTCWFi1L/bZ8rX/MkfnvRWw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxKXBKJKXz2j0eby+53UltisDw0MdsB1Mq8zOSe4wEy03yksi/j
	RsFxjJOwfTlc7T19h4PYFSTAP+lQID4OY2iCPp1bIUHfF57LRlyjREHwUu45Z7ou25hzFLvGID8
	rQTStArEmcTGQQwFX43M/Azi/ljhjNvs=
X-Gm-Gg: ASbGncsF/bcUhWTHxKWpuk9WgwaHsmgW5Illug5o7bhnXsckqaurFYKiShGkH1hUj2t
	Cdxz1Lb2WHrvDRaY8u+oL7uH7U6J0plfGMsGIQ/FM5JSJsw9FysnvnzcWM9BSZ31qpD0aKX7eVO
	vJFcDh0mSLcLK+q92F2Tmlbttt+UFapvs8twoTN0SROC1O4z/pIPv32Q5OB4DEHoMKdnTgnrcn9
	YwZ
X-Google-Smtp-Source: AGHT+IEcV24ayXpbwZw2DdUVwaEmslTnT7pb2+b911syBdKQUV5NIfdob+DU7x8eWSWlP9H+WyKXkHROafCBc6k9lBw=
X-Received: by 2002:a05:6808:1a0f:b0:401:bcae:68 with SMTP id
 5614622812f47-404da765f99mr98534b6e.19.1747343633070; Thu, 15 May 2025
 14:13:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250515130753.326236-1-luca.fancellu@arm.com>
 <CANNYZj9qTsHiDK-hHgNUN72+i--RamkCNt760Fa3ZjWkEzqSAA@mail.gmail.com>
 <6C8DA825-0E82-4776-9E56-55B17CF1052A@arm.com> <CANNYZj-71JnUvJb1tAZ34TGQX8RTwGB9ATUVc7-ptf+CemP+XA@mail.gmail.com>
 <1CB83516-B9EF-4381-85DE-59B4C55A031C@arm.com> <CAMKF1sr68GCyfXRMuS4cUBRL4jCEd4RUZ4GZrKN84R01w_gfSg@mail.gmail.com>
 <BEB697EE-4F8F-4832-9C8C-F149BE8E862B@arm.com> <CAMKF1srHjmPo-tcx2u5c15oZCNzFKu=NagkFFHQ1UCYdCWe9bA@mail.gmail.com>
 <5979472F-B748-4ADE-B950-636574096C3B@arm.com>
In-Reply-To: <5979472F-B748-4ADE-B950-636574096C3B@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 15 May 2025 14:13:42 -0700
X-Gm-Features: AX0GCFvkyKib0HxrWaD_IlBdtFCkF0g4Y58U_LUVVJG1juT2CVdfyt2LskgMnJw
Message-ID: <CAMKF1sqAXCiaau0jfDo3OgoG=LFc96_czB0yC7JDsC4S85jJHA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] clang: Include the libclang python bindings in
 the build
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008cc04e0635332484"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 21:13:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216707

--0000000000008cc04e0635332484
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 1:57=E2=80=AFPM Luca Fancellu <Luca.Fancellu@arm.co=
m> wrote:

> Hi Khem,
>
> > On 15 May 2025, at 20:38, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Thu, May 15, 2025 at 11:48=E2=80=AFAM Luca Fancellu <Luca.Fancellu@a=
rm.com>
> wrote:
> >>
> >> Hi Khem,
> >>
> >>> On 15 May 2025, at 16:47, Khem Raj via lists.openembedded.org
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> >>>
> >>> On Thu, May 15, 2025 at 6:52=E2=80=AFAM luca fancellu via
> >>> lists.openembedded.org <luca.fancellu=3Darm.com@lists.openembedded.or=
g>
> >>> wrote:
> >>>>
> >>>> Hi Alex
> >>>>
> >>>>> On 15 May 2025, at 14:38, Alexander Kanavin <alex.kanavin@gmail.com=
>
> wrote:
> >>>>>
> >>>>> On Thu, 15 May 2025 at 15:36, Luca Fancellu <Luca.Fancellu@arm.com>
> wrote:
> >>>>>>> Why? Can that be a PACKAGECONFIG?
> >>>>>>
> >>>>>> I used the same approach as lldb, why do you think we should use a
> different approach?
> >>>>>
> >>>>> The request was to explain why this is beneficial, and should be
> >>>>> always enabled. What is the use case specifically in clang?
> >>>>
> >>>> ok I see what you mean, the module will use some python bindings for
> libclang, so I guess
> >>>> some recipe could switch the feature on if using the module,
> otherwise it should stay off
> >>>> by default.
> >>>>
> >>>> Make sense, I=E2=80=99ll try to implement in that way
> >>>
> >>> Just measure build times before and after this change, my guess is it
> >>> is not adding a significant amount, but do measure it.
> >>
> >> Is there a standard way to do that?
> >
> > enable buildstats and do a build before and after
> > it should capture task times
>
> Here a summary, let me know if I should paste a particular task/tasks:
>
> with:
>
> NOTE: Build completion summary:
> NOTE:   do_populate_sysroot: 0.0% sstate reuse(0 setscene, 1 scratch)
> NOTE:   do_deploy_source_date_epoch: 0.0% sstate reuse(0 setscene, 1
> scratch)
> NOTE:   do_create_spdx: 0.0% sstate reuse(0 setscene, 1 scratch)
> NOTE:   do_create_package_spdx: 0.0% sstate reuse(0 setscene, 1 scratch)
> NOTE:   do_recipe_qa: 0.0% sstate reuse(0 setscene, 1 scratch)
> NOTE:   do_populate_lic: 0.0% sstate reuse(0 setscene, 1 scratch)
>
> Host Info: Linux <hostname> 6.5.0-25-generic #25~22.04.1-Ubuntu SMP
> PREEMPT_DYNAMIC Tue Feb 20 16:09:15 UTC 2 x86_64 x86_64
> Build Started: 1747340234.36
> Elapsed time: 1484.02 seconds
> CPU usage: 71.1%
>
>
> without:
>
> NOTE: Build completion summary:
> NOTE:   do_populate_sysroot: 0.0% sstate reuse(0 setscene, 1 scratch)
> NOTE:   do_deploy_source_date_epoch: 0.0% sstate reuse(0 setscene, 1
> scratch)
> NOTE:   do_create_spdx: 0.0% sstate reuse(0 setscene, 1 scratch)
> NOTE:   do_create_package_spdx: 0.0% sstate reuse(0 setscene, 1 scratch)
> NOTE:   do_recipe_qa: 0.0% sstate reuse(0 setscene, 1 scratch)
> NOTE:   do_populate_lic: 0.0% sstate reuse(0 setscene, 1 scratch)
>
> Host Info: Linux <hostname> 6.5.0-25-generic #25~22.04.1-Ubuntu SMP
> PREEMPT_DYNAMIC Tue Feb 20 16:09:15 UTC 2 x86_64 x86_64
> Build Started: 1747338659.83
> Elapsed time: 1294.93 seconds
> CPU usage: 81.6%


So it does seem to add 200s to build time perhaps make it a packageconfig

>
>
> Cheers,
> Luca
>
>

--0000000000008cc04e0635332484
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><br></div><div><br><div class=3D"gmail_quote gmail_quote_=
container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 15, 2025 at 1:=
57=E2=80=AFPM Luca Fancellu &lt;<a href=3D"mailto:Luca.Fancellu@arm.com">Lu=
ca.Fancellu@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
Hi Khem,<br>
<br>
&gt; On 15 May 2025, at 20:38, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmai=
l.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; <br>
&gt; On Thu, May 15, 2025 at 11:48=E2=80=AFAM Luca Fancellu &lt;<a href=3D"=
mailto:Luca.Fancellu@arm.com" target=3D"_blank">Luca.Fancellu@arm.com</a>&g=
t; wrote:<br>
&gt;&gt; <br>
&gt;&gt; Hi Khem,<br>
&gt;&gt; <br>
&gt;&gt;&gt; On 15 May 2025, at 16:47, Khem Raj via <a href=3D"http://lists=
.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.=
org</a> &lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" =
target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; On Thu, May 15, 2025 at 6:52=E2=80=AFAM luca fancellu via<br>
&gt;&gt;&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" t=
arget=3D"_blank">lists.openembedded.org</a> &lt;luca.fancellu=3D<a href=3D"=
mailto:arm.com@lists.openembedded.org" target=3D"_blank">arm.com@lists.open=
embedded.org</a>&gt;<br>
&gt;&gt;&gt; wrote:<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; Hi Alex<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; On 15 May 2025, at 14:38, Alexander Kanavin &lt;<a hre=
f=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.co=
m</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; On Thu, 15 May 2025 at 15:36, Luca Fancellu &lt;<a hre=
f=3D"mailto:Luca.Fancellu@arm.com" target=3D"_blank">Luca.Fancellu@arm.com<=
/a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Why? Can that be a PACKAGECONFIG?<br>
&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt; I used the same approach as lldb, why do you think=
 we should use a different approach?<br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; The request was to explain why this is beneficial, and=
 should be<br>
&gt;&gt;&gt;&gt;&gt; always enabled. What is the use case specifically in c=
lang?<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; ok I see what you mean, the module will use some python bi=
ndings for libclang, so I guess<br>
&gt;&gt;&gt;&gt; some recipe could switch the feature on if using the modul=
e, otherwise it should stay off<br>
&gt;&gt;&gt;&gt; by default.<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; Make sense, I=E2=80=99ll try to implement in that way<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; Just measure build times before and after this change, my gues=
s is it<br>
&gt;&gt;&gt; is not adding a significant amount, but do measure it.<br>
&gt;&gt; <br>
&gt;&gt; Is there a standard way to do that?<br>
&gt; <br>
&gt; enable buildstats and do a build before and after<br>
&gt; it should capture task times<br>
<br>
Here a summary, let me know if I should paste a particular task/tasks:<br>
<br>
with:<br>
<br>
NOTE: Build completion summary:<br>
NOTE:=C2=A0 =C2=A0do_populate_sysroot: 0.0% sstate reuse(0 setscene, 1 scra=
tch)<br>
NOTE:=C2=A0 =C2=A0do_deploy_source_date_epoch: 0.0% sstate reuse(0 setscene=
, 1 scratch)<br>
NOTE:=C2=A0 =C2=A0do_create_spdx: 0.0% sstate reuse(0 setscene, 1 scratch)<=
br>
NOTE:=C2=A0 =C2=A0do_create_package_spdx: 0.0% sstate reuse(0 setscene, 1 s=
cratch)<br>
NOTE:=C2=A0 =C2=A0do_recipe_qa: 0.0% sstate reuse(0 setscene, 1 scratch)<br=
>
NOTE:=C2=A0 =C2=A0do_populate_lic: 0.0% sstate reuse(0 setscene, 1 scratch)=
<br>
<br>
Host Info: Linux &lt;hostname&gt; 6.5.0-25-generic #25~22.04.1-Ubuntu SMP P=
REEMPT_DYNAMIC Tue Feb 20 16:09:15 UTC 2 x86_64 x86_64 <br>
Build Started: 1747340234.36 <br>
Elapsed time: 1484.02 seconds <br>
CPU usage: 71.1% <br>
<br>
<br>
without:<br>
<br>
NOTE: Build completion summary:<br>
NOTE:=C2=A0 =C2=A0do_populate_sysroot: 0.0% sstate reuse(0 setscene, 1 scra=
tch)<br>
NOTE:=C2=A0 =C2=A0do_deploy_source_date_epoch: 0.0% sstate reuse(0 setscene=
, 1 scratch)<br>
NOTE:=C2=A0 =C2=A0do_create_spdx: 0.0% sstate reuse(0 setscene, 1 scratch)<=
br>
NOTE:=C2=A0 =C2=A0do_create_package_spdx: 0.0% sstate reuse(0 setscene, 1 s=
cratch)<br>
NOTE:=C2=A0 =C2=A0do_recipe_qa: 0.0% sstate reuse(0 setscene, 1 scratch)<br=
>
NOTE:=C2=A0 =C2=A0do_populate_lic: 0.0% sstate reuse(0 setscene, 1 scratch)=
<br>
<br>
Host Info: Linux &lt;hostname&gt; 6.5.0-25-generic #25~22.04.1-Ubuntu SMP P=
REEMPT_DYNAMIC Tue Feb 20 16:09:15 UTC 2 x86_64 x86_64 <br>
Build Started: 1747338659.83 <br>
Elapsed time: 1294.93 seconds <br>
CPU usage: 81.6% </blockquote><div dir=3D"auto"><br></div><div dir=3D"auto"=
>So it does seem to add 200s to build time perhaps make it a packageconfig=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
Cheers,<br>
Luca<br>
<br>
</blockquote></div></div>

--0000000000008cc04e0635332484--

