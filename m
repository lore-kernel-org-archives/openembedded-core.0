Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19F64C433EF
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 07:38:11 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.4492.1652773084861877233
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 00:38:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GB52zw4T;
 spf=pass (domain: gmail.com, ip: 209.85.216.49,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id
 o13-20020a17090a9f8d00b001df3fc52ea7so1637229pjp.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 00:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K3kJJynxFOmsWzIk2Wdr+AGw2op9sV/CiZzYUdBphC0=;
        b=GB52zw4TlsZMEcLC1g8HW6UzEXw22y2ks1erOWuoKJG6aS48zhW+wEVIsz+8K4jg7r
         xmwwymC5hxmTpG+FqFvn4LE5uaVEqBBkSiS99eKVXZUzClj6tWJiEtc41mC5eJA4pUpI
         osh1S9UxDuU+lHyOm7dKKUPlVI5nLp9W+oOlDrFQaIv+RovMZoFQuLwuLPxQdUFX5OV0
         /WFgFc1iZn+jCKYbUCVzJRQoSj7RjCtZHuaEDvKqKqtD8LFf/YfF9yk5PSELM/f1su4m
         YrjwDXagkDPeMerQEBHRwthL8hWhbj3mQhme7szlP2w1h+mpD/ABD6fnuZxMWBI6Zy5n
         Bx/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K3kJJynxFOmsWzIk2Wdr+AGw2op9sV/CiZzYUdBphC0=;
        b=WwISRYikb8R4yAKxUplkzSpuERJ3iDf+f6J+yB1oOFR9K0+SCAdKyKf/ZN/evffiHX
         iRrD6+Lc1USsGFnF86Cq+mDXxOCraiYxiK9qtWLBt2+JPi2+vi6lfONXO3ijp9yS4CdH
         RLak9Fe+kFBVi7zwkw4BM8BUXaECAHiFnpNBLItZa6pKrXKPRycGM4u6KnG+VsSoIZYy
         LhMkPUqMiX02lMzw9xtihyvByYbj65ZjZ20nmazFzbQ2H+o9E54Sxwa5G11qgW0pc8Ky
         AhsgGp+CyUU1sMaxtrTbmns8FRqpiq//YxzVSdDyiMXhZrbyYjjFk8nCSF4wN5PIxUKn
         zv9A==
X-Gm-Message-State: AOAM530kIVZLlvd+gNWVmDcor9homOY+eMkbY6j5s63fpEFdpKqpjqon
	cRqI/vGtRRUKBvD6YMlGgJN9G0Oj3q36MoHaT8U=
X-Google-Smtp-Source: 
 ABdhPJxPGRQe2VlxTHOXwxN6KYL/5BG/D68PvTWZfjIXzNvbhfSFQjO5s4RzgZGakALLIuS7AZIwkleeNepSstzXAW4=
X-Received: by 2002:a17:903:234d:b0:161:994f:f850 with SMTP id
 c13-20020a170903234d00b00161994ff850mr4832515plh.47.1652773084163; Tue, 17
 May 2022 00:38:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220515124346.8095-1-liu.ming50@gmail.com>
 <20220515124346.8095-2-liu.ming50@gmail.com>
 <4b08ee55f793b321f6d23c207fdb4fb0802297ed.camel@linuxfoundation.org>
 <CALatG=6SEmPaOFecWLQ6_hj63VobektQ6tKHZ5MKYExhqEPfAg@mail.gmail.com>
 <CAOSpxdbUNU+QYFmT7CMWT64Q3Q3n+soenUHL2HHfoPr9e=YJ5Q@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdbUNU+QYFmT7CMWT64Q3Q3n+soenUHL2HHfoPr9e=YJ5Q@mail.gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Tue, 17 May 2022 09:37:51 +0200
Message-ID: 
 <CALatG=5PTAt5cgv=EitRSsz81JHoMPCRvxLK3pYEK+U094ko5Q@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone] [PATCH 1/1] mmc-utils: upgrade to latest
 revision
To: Steve Sakoman <steve@sakoman.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
 Alexander Kanavin <alex@linutronix.de>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: multipart/alternative; boundary="00000000000093747b05df30386c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 07:38:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165710

--00000000000093747b05df30386c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, this only occurs on 5.4 kernel, will CC to you next time for kirkstone
patches.

//Ming Liu

Steve Sakoman <steve@sakoman.com> =E6=96=BC 2022=E5=B9=B45=E6=9C=8816=E6=97=
=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=884:29=E5=AF=AB=E9=81=93=EF=BC=9A

> On Sun, May 15, 2022 at 9:17 PM Ming Liu <liu.ming50@gmail.com> wrote:
>
> > Our products are based on LTS kirkstone, we found a build issue of
> mmc-utils, which has been fixed by
> https://kernel.googlesource.com/pub/scm/utils/mmc/mmc-utils/+/0d493fb091b=
592bde6004a618c28f1c3619af1a4
>
> So this error only occurs if you are using a BSP with a 5.4 kernel?
> That would explain why I don't see this in my testing, since it uses
> only 5.10 and 5.15
>
> BTW, for future kirkstone patches you should cc me instead of Richard
> since I am the kirkstone maintainer.
>
> > this uplift only involves in two commits including the above fix:
> >
> > ```
> > b7e4d5a mmc-utils: Add General command CMD56 read support
> > 0d493fb mmc-utils: Fix build error MMC_BLOCK_MAJOR undeclared
> > ```
> >
> > considering kirkstone mmc-utils recipe fetches mmc-utils master branch
> and does not stick to any release tag, so I think we can uplift mmc-utils
> to the latest rather than backport that fix to kirkstone.
>
> This seems reasonable to me. I will add this patch to my test queue
> and edit the commit message to include the above information.
>
> Steve
>
> > <richard.purdie@linuxfoundation.org> =E6=96=BC 2022=E5=B9=B45=E6=9C=881=
5=E6=97=A5 =E9=80=B1=E6=97=A5 =E4=B8=8B=E5=8D=8811:42=E5=AF=AB=E9=81=93=EF=
=BC=9A
> >>
> >> On Sun, 2022-05-15 at 14:43 +0200, liu.ming50@gmail.com wrote:
> >> > From: Alexander Kanavin <alex.kanavin@gmail.com>
> >> >
> >> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> >> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> >> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >> > (cherry picked from commit d98b06c9c6f480de1e5167bfe8392e39300fc02c)
> >> > Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> >> > ---
> >> >  meta/recipes-devtools/mmc/mmc-utils_git.bb | 2 +-
> >> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >> >
> >>
> >> Why does kirkstone need this though?
> >>
> >> Cheers,
> >>
> >> Richard
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#165665):
> https://lists.openembedded.org/g/openembedded-core/message/165665
> > Mute This Topic: https://lists.openembedded.org/mt/91117508/3620601
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> steve@sakoman.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--00000000000093747b05df30386c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Yes, this only occurs on 5.4 kernel, will CC to you n=
ext time for kirkstone patches.</div><div><br></div><div>//Ming Liu<br></di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com">steve@sakoman.com<=
/a>&gt; =E6=96=BC 2022=E5=B9=B45=E6=9C=8816=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=
=B8=8B=E5=8D=884:29=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Sun, May 15, 2022 at 9:17 PM Ming Liu &=
lt;<a href=3D"mailto:liu.ming50@gmail.com" target=3D"_blank">liu.ming50@gma=
il.com</a>&gt; wrote:<br>
<br>
&gt; Our products are based on LTS kirkstone, we found a build issue of mmc=
-utils, which has been fixed by <a href=3D"https://kernel.googlesource.com/=
pub/scm/utils/mmc/mmc-utils/+/0d493fb091b592bde6004a618c28f1c3619af1a4" rel=
=3D"noreferrer" target=3D"_blank">https://kernel.googlesource.com/pub/scm/u=
tils/mmc/mmc-utils/+/0d493fb091b592bde6004a618c28f1c3619af1a4</a><br>
<br>
So this error only occurs if you are using a BSP with a 5.4 kernel?<br>
That would explain why I don&#39;t see this in my testing, since it uses<br=
>
only 5.10 and 5.15<br>
<br>
BTW, for future kirkstone patches you should cc me instead of Richard<br>
since I am the kirkstone maintainer.<br>
<br>
&gt; this uplift only involves in two commits including the above fix:<br>
&gt;<br>
&gt; ```<br>
&gt; b7e4d5a mmc-utils: Add General command CMD56 read support<br>
&gt; 0d493fb mmc-utils: Fix build error MMC_BLOCK_MAJOR undeclared<br>
&gt; ```<br>
&gt;<br>
&gt; considering kirkstone mmc-utils recipe fetches mmc-utils master branch=
 and does not stick to any release tag, so I think we can uplift mmc-utils =
to the latest rather than backport that fix to kirkstone.<br>
<br>
This seems reasonable to me. I will add this patch to my test queue<br>
and edit the commit message to include the above information.<br>
<br>
Steve<br>
<br>
&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_b=
lank">richard.purdie@linuxfoundation.org</a>&gt; =E6=96=BC 2022=E5=B9=B45=
=E6=9C=8815=E6=97=A5 =E9=80=B1=E6=97=A5 =E4=B8=8B=E5=8D=8811:42=E5=AF=AB=E9=
=81=93=EF=BC=9A<br>
&gt;&gt;<br>
&gt;&gt; On Sun, 2022-05-15 at 14:43 +0200, <a href=3D"mailto:liu.ming50@gm=
ail.com" target=3D"_blank">liu.ming50@gmail.com</a> wrote:<br>
&gt;&gt; &gt; From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@l=
inutronix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt;&gt; &gt; Signed-off-by: Luca Ceresoli &lt;<a href=3D"mailto:luca.ceres=
oli@bootlin.com" target=3D"_blank">luca.ceresoli@bootlin.com</a>&gt;<br>
&gt;&gt; &gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.p=
urdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation=
.org</a>&gt;<br>
&gt;&gt; &gt; (cherry picked from commit d98b06c9c6f480de1e5167bfe8392e3930=
0fc02c)<br>
&gt;&gt; &gt; Signed-off-by: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmai=
l.com" target=3D"_blank">liu.ming50@gmail.com</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 meta/recipes-devtools/mmc/<a href=3D"http://mmc-utils_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">mmc-utils_git.bb</a> | 2 +-<br>
&gt;&gt; &gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt; Why does kirkstone need this though?<br>
&gt;&gt;<br>
&gt;&gt; Cheers,<br>
&gt;&gt;<br>
&gt;&gt; Richard<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#165665): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/165665" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/165665</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91117508=
/3620601" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/91117508/3620601</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:steve@sakoman.com" ta=
rget=3D"_blank">steve@sakoman.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--00000000000093747b05df30386c--

