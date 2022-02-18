Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BBA6C433FE
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 11:37:19 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web10.9759.1645184238271954574
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 03:37:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LtLoOxg5;
 spf=pass (domain: gmail.com, ip: 209.85.222.48,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ua1-f48.google.com with SMTP id 10so4118241uar.9;
        Fri, 18 Feb 2022 03:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jacSJBrx2Y1J/zWoAqCEuXfqmTzc51RIzqU/JTSkV7s=;
        b=LtLoOxg5LQSaIJX1diT0A9tFoYdL1AleorKX/o6t2EGcHiun8GONt8XXIz2cVAiPDu
         34bExIVP6P6M7ny81swXpIsDwLWlDtXHn4d2/S53PhJHL+6BFZ5HQcTO4HcVWTeZtSub
         4I64w7yu4IElWCRm48I9tEyFT3xf2ojK5W04+sdBLtI0tRAhrtzxFAGIx21pGH6+0NBa
         FWVDmQ1OIaOA0LtrRTtiCmnq3zn0dbeKDvo9fbztFOj76AdO1NFYFOi5vny9lHoIDyH4
         YGKzsZjD4xfdQDcO11k/FKwK3ekhhHFxKuXc6u259oqkZ7thtYl+Jd4hqmc0z54B/vLk
         b4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jacSJBrx2Y1J/zWoAqCEuXfqmTzc51RIzqU/JTSkV7s=;
        b=NMkgv9zQ3zWTGucPMk0N7H8ooa/lhTH2GdZf2V0vSTD24Gl24f00qd3AVzOMd0VCQk
         h9cAPwKaXLqKQKp3uyWKwgaUUdhrQBl9Ih+/v8JtTib/Zjv2gFEkZ7LaSDBZ11haLE/8
         0d4qJdWmOG4uxPNoNnraEYqQI0sDZw1Hww2QxgsX5Y/7DU3FsqTglEsQIj44hAA81lgQ
         JQko6vYaDNPr8rlgASypTzhBmiNDf+SO46TMptbs/aHZjdMZEDMld5C1UKBO9dh4seY5
         wnxYyjfh/dqvtrydw3jy82xmh9bQPcZ89WmVosUMcgCrlABvU0rJTA7jduTm9zbGjYbz
         JHpA==
X-Gm-Message-State: AOAM533jo5YNSKiWaW4jFIOoq22xF9OwsDpoGKuopNMJfwODaePl2YWc
	Mp6rda50uZkcitRSeWu640FC4yBOdT0uBgRBYDU=
X-Google-Smtp-Source: 
 ABdhPJwMb0D9vYD78GF7Rb+eec6uun6UlkGH9ZYMi7Kx7euh6LjucGdNFIJyDsdXKpzeLERgEEAEx2097NDHYy9pS/4=
X-Received: by 2002:a9f:29c3:0:b0:33b:e5b0:be79 with SMTP id
 s61-20020a9f29c3000000b0033be5b0be79mr2933466uas.84.1645184237356; Fri, 18
 Feb 2022 03:37:17 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAHMutra5px9Egp6VXpBqyrxYCSCfX-437so6D+HSXZUPBc62sg@mail.gmail.com>
In-Reply-To: 
 <CAHMutra5px9Egp6VXpBqyrxYCSCfX-437so6D+HSXZUPBc62sg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 18 Feb 2022 12:37:04 +0100
Message-ID: 
 <CA+chaQfB9J1FQCWjWW4+x1m-PKUL9kZDO3uSPfGpcjFd8UJ35w@mail.gmail.com>
Subject: Re: [Openembedded-architecture] Kirkstone Layer Compatibility
To: Alejandro Hernandez Samaniego <alejandro@enedino.org>
Cc: openembedded-architecture
 <openembedded-architecture@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000ecd3805d8494e44"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 11:37:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161936

--0000000000000ecd3805d8494e44
Content-Type: text/plain; charset="UTF-8"

The [3] should be
https://git.openembedded.org/openembedded-core/commit/?id=311e61ae14b7216f5b98f1afe0e791644a07c9d0
that's where LAYERSERIES_CORENAMES was changed to kirkstone (it's not due
to LAYERSERIES_COMPAT changes, these changes are what people need to update
in their layer).

On Fri, Feb 18, 2022 at 7:57 AM Alejandro Hernandez Samaniego <
alejandro@enedino.org> wrote:

> Hello everyone,
>
> There have been a number of failures in the autobuilder today [1] [2] due
> to the change currently sitting in master-next that switches
> LAYERSERIES_COMPAT from honister to kirkstone[3].
>
> Since the change will soon be merged into master I thought it'd be a good
> idea to send an email so layer maintainers become aware of the upcoming
> issue and update their corresponding layers accordingly.
>
> Cheers,
>
> Alejandro
>
> [1] https://swatbot.yoctoproject.org/mainindex/swat/
> [2] https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3243
> [3]
> https://git.yoctoproject.org/poky/commit/?h=master-next&id=7145b34de02fffa97bb1238f4777d817efcdc78f
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#1459):
> https://lists.openembedded.org/g/openembedded-architecture/message/1459
> Mute This Topic: https://lists.openembedded.org/mt/89227923/3617156
> Group Owner: openembedded-architecture+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-architecture/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000000ecd3805d8494e44
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The [3] should be=C2=A0<a href=3D"https://git.openembedded=
.org/openembedded-core/commit/?id=3D311e61ae14b7216f5b98f1afe0e791644a07c9d=
0">https://git.openembedded.org/openembedded-core/commit/?id=3D311e61ae14b7=
216f5b98f1afe0e791644a07c9d0</a> that&#39;s where=C2=A0LAYERSERIES_CORENAME=
S was changed to kirkstone (it&#39;s not due to=C2=A0<span style=3D"font-fa=
mily:arial,sans-serif">LAYERSERIES_COMPAT changes, these changes are what p=
eople need to update in their layer).</span></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 18, 2022 at 7:57 AM=
 Alejandro Hernandez Samaniego &lt;<a href=3D"mailto:alejandro@enedino.org"=
>alejandro@enedino.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_default" style=
=3D"font-family:arial,sans-serif;font-size:small">Hello everyone,</div><div=
 class=3D"gmail_default" style=3D"font-family:arial,sans-serif;font-size:sm=
all"><br></div><div class=3D"gmail_default" style=3D"font-family:arial,sans=
-serif;font-size:small">There have been a number of failures in the autobui=
lder today [1] [2] due to the change currently sitting in master-next that =
switches LAYERSERIES_COMPAT from honister to kirkstone[3].</div><div class=
=3D"gmail_default" style=3D"font-family:arial,sans-serif;font-size:small"><=
br></div><div class=3D"gmail_default" style=3D"font-family:arial,sans-serif=
;font-size:small">Since the change will soon=C2=A0be merged into master I t=
hought it&#39;d be a good idea to send an email so layer maintainers become=
 aware of the upcoming issue and update their corresponding layers accordin=
gly.</div><div class=3D"gmail_default" style=3D"font-family:arial,sans-seri=
f;font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-fam=
ily:arial,sans-serif;font-size:small">Cheers,</div><div class=3D"gmail_defa=
ult" style=3D"font-family:arial,sans-serif;font-size:small"><br></div><div =
class=3D"gmail_default" style=3D"font-family:arial,sans-serif;font-size:sma=
ll">Alejandro</div><div class=3D"gmail_default" style=3D"font-family:arial,=
sans-serif;font-size:small"><br></div><div class=3D"gmail_default" style=3D=
"font-family:arial,sans-serif;font-size:small">[1]=C2=A0<a href=3D"https://=
swatbot.yoctoproject.org/mainindex/swat/" target=3D"_blank">https://swatbot=
.yoctoproject.org/mainindex/swat/</a></div><div class=3D"gmail_default" sty=
le=3D"font-family:arial,sans-serif;font-size:small">[2]=C2=A0<a href=3D"htt=
ps://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3243" target=
=3D"_blank">https://autobuilder.yoctoproject.org/typhoon/#/builders/83/buil=
ds/3243</a></div><div class=3D"gmail_default" style=3D"font-family:arial,sa=
ns-serif;font-size:small">[3] <a href=3D"https://git.yoctoproject.org/poky/=
commit/?h=3Dmaster-next&amp;id=3D7145b34de02fffa97bb1238f4777d817efcdc78f" =
target=3D"_blank">https://git.yoctoproject.org/poky/commit/?h=3Dmaster-next=
&amp;id=3D7145b34de02fffa97bb1238f4777d817efcdc78f</a><br></div><div class=
=3D"gmail_default" style=3D"font-family:arial,sans-serif;font-size:small"><=
br></div><div class=3D"gmail_default" style=3D"font-family:arial,sans-serif=
;font-size:small"><br></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#1459): <a href=3D"https://lists.openembedded.org/g/open=
embedded-architecture/message/1459" rel=3D"noreferrer" target=3D"_blank">ht=
tps://lists.openembedded.org/g/openembedded-architecture/message/1459</a><b=
r>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89227923/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/89227923/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-architecture%2Bowner@lists.open=
embedded.org" target=3D"_blank">openembedded-architecture+owner@lists.opene=
mbedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-archi=
tecture/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembed=
ded.org/g/openembedded-architecture/unsub</a> [<a href=3D"mailto:Martin.Jan=
sa@gmail.com" target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000000ecd3805d8494e44--

