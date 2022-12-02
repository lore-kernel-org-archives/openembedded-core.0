Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C590C4332F
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 08:47:50 +0000 (UTC)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web11.70588.1669970862604105851
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Dec 2022 00:47:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Npuwq2ef;
 spf=pass (domain: mvista.com, ip: 209.85.217.41, mailfrom: hprajapati@mvista.com)
Received: by mail-vs1-f41.google.com with SMTP id 3so3146911vsq.7
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Dec 2022 00:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5csINOa2yyNpubd02NoT817yU92aUZR4V2qpHv33wLc=;
        b=Npuwq2efj5wKQPDmQ5o+/VgUHOTk2tOiIdLaOEqgcN/wCEMFqfBUnWKe3FubI4RhrI
         5AEJqx7nHZ9fbBcVU3S+L/gEaD1cNbOlyoyk22+rSxkcydcDPZm9qmqmhm3bAktuoOwQ
         ynk0WeQuPDdNv6zf8b1y7Jpe2h1yaMaXiz8qU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5csINOa2yyNpubd02NoT817yU92aUZR4V2qpHv33wLc=;
        b=z0V48z1jPnsJTe+Gn8d+sYX91sorkQQxxq4I1arH4CPdVFGPAE+eeogdz/JNDDN/7l
         mLiLFHG68XjxzDBreCAKNy7DF3E4JZ3S4OaVPb1R09aXl0kAFpgI31UeQKcFSNLRURn3
         EPr/B/d9FFErMCNwypKBxD4n+/1BSoUWAV9y/NwbtxMQxut3TmGeliSRfcruD8d9lHgp
         8u+6zPRbe9tfbcEKW0KtjNhFzPpiyNXCICshiGVUSonl8ABnCvivXUEYolQIJeA0Sc/Y
         U7h+JQ0WFBM2+7HYOZ+l+nQEsKmkUXApOB1TwBjhjN6zHh/hHymO9+vo2Q9fDiF0+KnV
         7sWw==
X-Gm-Message-State: ANoB5plNw+vXE0739VrVmQbwk2UMZ0GdlQjL62jG2xEUVUEOOm+mKS1I
	oEyHlkDL6jyzDxTnvy5RAeNoRw2y2RD3B10oi7nWUg==
X-Google-Smtp-Source: AA0mqf6/bCTxAPqwbL03kRa023OxPRCMqc2hrGhZkFtgArPH4oM9Ircm3/TeM9ScIWwihD+8ezTibLzDkdj7LwQLqBU=
X-Received: by 2002:a05:6102:22c6:b0:3b0:a169:a116 with SMTP id
 a6-20020a05610222c600b003b0a169a116mr13013233vsh.59.1669970861672; Fri, 02
 Dec 2022 00:47:41 -0800 (PST)
MIME-Version: 1.0
References: <20185.1668683543873254772@lists.openembedded.org>
 <4965.1669954979811583031@lists.openembedded.org> <CA+chaQevcAt2WTkKONqrgjY+ULQCXm92GyPFiFOORqQsiUyzLQ@mail.gmail.com>
In-Reply-To: <CA+chaQevcAt2WTkKONqrgjY+ULQCXm92GyPFiFOORqQsiUyzLQ@mail.gmail.com>
From: Hitendra Prajapati <hprajapati@mvista.com>
Date: Fri, 2 Dec 2022 14:17:29 +0530
Message-ID: <CACVbggHg1WeE4ES1J0UcSc9z1C=BdtOrB0gKYpu+dAjySE_Qxw@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] curl: Fix multiple CVEs
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Hitendra Prajapati <hpprajapati@mvista.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fee23505eed463fd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Dec 2022 08:47:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174227

--000000000000fee23505eed463fd
Content-Type: text/plain; charset="UTF-8"

Hi Martin/Team,

Yes, I missed that part.

It is my mistake. I'm extremely sorry for that.

I'll take care of it in next patches.

Regards,
Hitendra Prajapati

On Fri, 2 Dec 2022, 1:11 pm Martin Jansa, <Martin.Jansa@gmail.com> wrote:

> I see the same fixes with correct Author in .patch files (please don't
> change the Author when you're just backporting a patch from someone else)
> queued from someone else in kirkstone-nut branch:
>
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=stable/kirkstone-nut&id=518bea85c9496d77c70d703b818e442eda841554
>
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=stable/kirkstone-nut&id=e6796b426503477620e0e5c5c9da50352269a593
>
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=stable/kirkstone-nut&id=4754f33d7ec96f72351853463540c8b1a3f4bc0c
> so they should be applied soon.
>
> On Fri, Dec 2, 2022 at 5:23 AM Hitendra Prajapati <hpprajapati@mvista.com>
> wrote:
>
>> Hi Steve/Team ,
>> Any update or issue with this patches ?? Why it is not picked or merged ?
>>
>>
>>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174224):
> https://lists.openembedded.org/g/openembedded-core/message/174224
> Mute This Topic: https://lists.openembedded.org/mt/94800386/6955432
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> hprajapati@mvista.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000fee23505eed463fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Martin/Team,<div dir=3D"auto"><br></div><div dir=3D"au=
to">Yes, I missed that part.=C2=A0</div><div dir=3D"auto"><br></div><div di=
r=3D"auto">It is my mistake. I&#39;m extremely sorry for that.</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">I&#39;ll take care=C2=A0of it in nex=
t patches.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Regards,</div=
><div dir=3D"auto">Hitendra Prajapati=C2=A0</div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 2 Dec 2022, 1:11 p=
m Martin Jansa, &lt;<a href=3D"mailto:Martin.Jansa@gmail.com">Martin.Jansa@=
gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr">I see the same fixes with correct Author in .patch files (please d=
on&#39;t change the Author when you&#39;re just backporting a patch from so=
meone else) queued from someone else in kirkstone-nut branch:<div><a href=
=3D"https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dstab=
le/kirkstone-nut&amp;id=3D518bea85c9496d77c70d703b818e442eda841554" target=
=3D"_blank" rel=3D"noreferrer">https://git.openembedded.org/openembedded-co=
re-contrib/commit/?h=3Dstable/kirkstone-nut&amp;id=3D518bea85c9496d77c70d70=
3b818e442eda841554</a><br></div><div><a href=3D"https://git.openembedded.or=
g/openembedded-core-contrib/commit/?h=3Dstable/kirkstone-nut&amp;id=3De6796=
b426503477620e0e5c5c9da50352269a593" target=3D"_blank" rel=3D"noreferrer">h=
ttps://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dstable/ki=
rkstone-nut&amp;id=3De6796b426503477620e0e5c5c9da50352269a593</a><br></div>=
<div><a href=3D"https://git.openembedded.org/openembedded-core-contrib/comm=
it/?h=3Dstable/kirkstone-nut&amp;id=3D4754f33d7ec96f72351853463540c8b1a3f4b=
c0c" target=3D"_blank" rel=3D"noreferrer">https://git.openembedded.org/open=
embedded-core-contrib/commit/?h=3Dstable/kirkstone-nut&amp;id=3D4754f33d7ec=
96f72351853463540c8b1a3f4bc0c</a><br></div><div>so they should be applied s=
oon.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Fri, Dec 2, 2022 at 5:23 AM Hitendra Prajapati &lt;<a href=3D"=
mailto:hpprajapati@mvista.com" target=3D"_blank" rel=3D"noreferrer">hppraja=
pati@mvista.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">Hi Steve/Team ,<br>Any update or issue with this patches ?? =
Why it is not picked or merged ?
<br>
<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#174224): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/174224" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/174224</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94800386/6955=
432" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/94800386/6955432</a><br>
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

--000000000000fee23505eed463fd--

