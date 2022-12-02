Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1407C4321E
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 15:40:32 +0000 (UTC)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
 by mx.groups.io with SMTP id smtpd.web10.78699.1669995623208216106
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Dec 2022 07:40:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=P9rFGv3/;
 spf=pass (domain: mvista.com, ip: 209.85.217.43, mailfrom: hprajapati@mvista.com)
Received: by mail-vs1-f43.google.com with SMTP id f189so463518vsc.11
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Dec 2022 07:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Pb4nAapA5ZdAbNjrl4mBbap5cRgchBnjx7pT5O7egoo=;
        b=P9rFGv3/SunKR18Dtz424x07ThPvPM8U43h6kBWTFUy0WOHM/lk2TzU2tsEYWT92kU
         dqUXpifczKNv2zoaMAZtlhodXSPtaUZZDLfD1DT5hWPnhDOIQBx6WGM0ApjIvOTG04Pm
         JeRUgSNg03qNu4fYu7HWCPK9xbV7s7iu/AUGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pb4nAapA5ZdAbNjrl4mBbap5cRgchBnjx7pT5O7egoo=;
        b=DaDW7TzZ/97N22EZivYVf8+3YqaPsa80VMHc50wQbJx8hXI+NWofqq3h9OvMLq90xh
         cY8yunRejd0AlDNmc+Tl7ZHFnlMdYAl9V7FlC/QytKBIJ5XNpdqquem+ERMVZOuv6NYm
         XBWXiyebDuPcitkGeeN23WgDL5CMKvQEUKjL8MXSHjTB9nQ7928mIosXy5MNV3Nv6jnC
         Jmut8nDOHdhnsZDodDdQIxroGKkXsBnnuGqhh289s8BtpuVKchxqonwcYAGsYZHc/zcV
         RzR3ezNps7oyjGihngjSiEpC616H3dxObkBTGp1tlOjN8cY6LqGUPmsBIWVnXgDY0Jsn
         Z2ew==
X-Gm-Message-State: ANoB5pmU1iNQ4ZtotSkQXUgjJcZ5ub5+DCg5lQVncu5gU9tGYV2J7Ia0
	fOCx/FiBxSM7Ltph0bA9nPgtJ3i9rjUthUebaQFvxbEatTEsrg==
X-Google-Smtp-Source: AA0mqf56fppAr+lpz5VHBcv4mgVtkWO3pYTzwlLbixklQYYoVWrlXXFNZqSIrTa6b1L6WwJ144sbwu2QRpiUuSHyNqQ=
X-Received: by 2002:a05:6102:11e8:b0:3b1:21b4:d8a8 with SMTP id
 e8-20020a05610211e800b003b121b4d8a8mr1030508vsg.49.1669995622184; Fri, 02 Dec
 2022 07:40:22 -0800 (PST)
MIME-Version: 1.0
References: <20221103114823.349490-1-hprajapati@mvista.com>
 <6562.1669955704179296939@lists.openembedded.org> <CAOSpxdYSFGzM=BKZSWR_D-oobnPR5n8JjKDre+PE9jHjkq--sA@mail.gmail.com>
In-Reply-To: <CAOSpxdYSFGzM=BKZSWR_D-oobnPR5n8JjKDre+PE9jHjkq--sA@mail.gmail.com>
From: Hitendra Prajapati <hprajapati@mvista.com>
Date: Fri, 2 Dec 2022 21:10:10 +0530
Message-ID: <CACVbggFeBtF2DU8gxi0ntM8_Gv=0tHE0jYRHXeFaBPBQg9JQxQ@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] golang: CVE-2022-41715
 regexp/syntax: limit memory used by parsing regexps
To: Steve Sakoman <steve@sakoman.com>
Cc: Hitendra Prajapati <hpprajapati@mvista.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d6517905eeda2767"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Dec 2022 15:40:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174238

--000000000000d6517905eeda2767
Content-Type: text/plain; charset="UTF-8"

Hi Steve/Team,

Yes, this is mistake from my side.

I noticed that mistake and I'm sincerely sorry for that issue.

I'll look back for the patch to correct those issue .

I'll be more careful for any future patches .

Regards,
Hitendra

On Fri, 2 Dec 2022, 8:17 pm Steve Sakoman, <steve@sakoman.com> wrote:

> On Thu, Dec 1, 2022 at 6:35 PM Hitendra Prajapati
> <hpprajapati@mvista.com> wrote:
> >
> > Hi team,
> >
> > Why this issue is unattended ?? Any issue in merged ??
> >
> > Please look at this issue, Which fixed for Go package .
>
> I sent you a private email when I noticed you were changing the author
> on CVE patches, but it seems you didn't get it.
>
> Ideally you should send fix patches for those commits that were
> accepted before I noticed this.
>
> Steve
>
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174236):
> https://lists.openembedded.org/g/openembedded-core/message/174236
> Mute This Topic: https://lists.openembedded.org/mt/94754439/6955432
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> hprajapati@mvista.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000d6517905eeda2767
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi=C2=A0Steve/Team,<div dir=3D"auto"><br></div><div dir=
=3D"auto">Yes, this is mistake from=C2=A0my side.</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">I noticed that mistake and I&#39;m sincerely sorr=
y for that issue.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;=
ll look back for the patch to correct those issue .</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">I&#39;ll be more=C2=A0careful for any=C2=A0futu=
re patches .</div><div dir=3D"auto"><br></div><div dir=3D"auto">Regards,</d=
iv><div dir=3D"auto">Hitendra=C2=A0</div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 2 Dec 2022, 8:17 pm Steve =
Sakoman, &lt;<a href=3D"mailto:steve@sakoman.com">steve@sakoman.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, Dec 1, 2022 at 6:35=
 PM Hitendra Prajapati<br>
&lt;<a href=3D"mailto:hpprajapati@mvista.com" target=3D"_blank" rel=3D"nore=
ferrer">hpprajapati@mvista.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi team,<br>
&gt;<br>
&gt; Why this issue is unattended ?? Any issue in merged ??<br>
&gt;<br>
&gt; Please look at this issue, Which fixed for Go package .<br>
<br>
I sent you a private email when I noticed you were changing the author<br>
on CVE patches, but it seems you didn&#39;t get it.<br>
<br>
Ideally you should send fix patches for those commits that were<br>
accepted before I noticed this.<br>
<br>
Steve<br>
<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#174236): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/174236" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/174236</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94754439/6955=
432" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/94754439/6955432</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:hprajapati@mvis=
ta.com" target=3D"_blank" rel=3D"noreferrer">hprajapati@mvista.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000d6517905eeda2767--

