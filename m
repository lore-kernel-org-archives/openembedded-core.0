Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5526FC433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 23:28:17 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web09.1212.1646350096244579093
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 15:28:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=btiL8Ruc;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: ticotimo@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id r13so13949987ejd.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 15:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2PX9NQmBJTRXHtf/FXJ9GxInqusGK9qQ5mKdXdFRIxw=;
        b=btiL8RucegfcGFk2u51QUf3Xj4CbZ6rxxGAdrzJ4v91UzPgEe4KwHLmuYNRK8CbHtX
         Gsma5XFXqZgXx1hOX0U6KmCnQx/oJY/4H+rsOgoDxB8DpYmQS2pKGO6epj/MuesNzTdD
         wJh6XxwvPie5YteG5+5ktT5IKMcGqepAIkg8yU/FjBwx9T7xyH0u5wooXJzgHKCo4CvO
         8vea0K2e90pY+hrLzLNRusB1rc23ukoSwcLj+IaUFiKHpqVpFC3TmMRTlFfN2LyE6bss
         ADB4bbCy4YRj7ImkqEtuTGHXuSoAjeXbQKlPh6WbUqkD71EUg/dJC8+sCylln857YgVN
         rvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2PX9NQmBJTRXHtf/FXJ9GxInqusGK9qQ5mKdXdFRIxw=;
        b=5sgp6gMQM1YWDGAk3+MhGEJtq8Y5TrchFtio8WXMA+slvBKSwL5uRhfkwolyHGJ216
         llDvqemNGDtvAg/dqm7J+nCvSSC94+Vcc4yZ8MoWe540yq9qpEosan5wnFNg3bC/sSRo
         rzHxfPUN3SYDIAxksa9c1R1IdzHK1OdkDurxymWlmun0X6Uk6RUDpu9eenOCD6z6Tbij
         qtu+Cz8tI9oElHX98cKItK9i3hcYkuQmAloBA6oVoNcBqeXKu0RtCiCZiDYQdcf7tv/E
         GGzX6PSO7K5C+HIuy9IOQi+R1bFXxk+dX4C1KxXJaW6khS0UD3fyBCSHT+C1JzvsRDdK
         M5sw==
X-Gm-Message-State: AOAM532TlmWXHW+DknPvsUfbF35Lp+s2/l7YfaYj50epXfu1qYBgT5mX
	jVRXzBFUZPUb9DvwSXnK2EFY0cn2p65DKhuPoH4=
X-Google-Smtp-Source: 
 ABdhPJwOilBc9N5LWUxNyu0UT4GhWM0nQ87JbIotrABbT45pjCVUKoTRVn9+rwAOrgC50Xia3Bdc0+Zxcw4Bloz+IHo=
X-Received: by 2002:a17:906:3adb:b0:6b7:876c:d11b with SMTP id
 z27-20020a1709063adb00b006b7876cd11bmr29111329ejd.250.1646350094638; Thu, 03
 Mar 2022 15:28:14 -0800 (PST)
MIME-Version: 1.0
References: <20220303163451.336518-1-richard.purdie@linuxfoundation.org>
 <CAAnfSTu78H+UG34pykED6G8M939LLmupEghxaUaz8_mToAwwFg@mail.gmail.com>
 <6d880923351fe7e16d4c44d25dd8f43d1de390c6.camel@linuxfoundation.org>
In-Reply-To: 
 <6d880923351fe7e16d4c44d25dd8f43d1de390c6.camel@linuxfoundation.org>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 3 Mar 2022 15:28:03 -0800
Message-ID: 
 <CANx9H-Cn8e6-5q-6YJurv0TkTDvFnVd=9Kd5qFs5geP7i8YXGQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] python3-native: Remove all pyc files
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross@burtonini.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000911ffb05d958c060"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 23:28:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162705

--000000000000911ffb05d958c060
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 3, 2022 at 9:16 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2022-03-03 at 17:14 +0000, Ross Burton wrote:
> > On Thu, 3 Mar 2022 at 16:34, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > This removes a further 1600 files from sstate handling and lets python
> > > create the ones it wants at runtime which is likely much better overall
> > > for performance.
> >
> > Playing devil's advocate: doesn't having them in sstate mean they're
> > generated once and hardlinked, instead of needing to be generated for
> > every recipe which runs pythonnative?
> >
> > Whilst I can't disagree that 1600 files being dropped from sstate is
> > good, we're just punting the recompile step to every recipe when it
> > runs python code.
> >
> > I guess the question here is how long does the Python library take to
> recompile.
>

At runtime it should only generate pyc for modules actually used?

>
> Another consideration is that there are many sysroots pulling in
> python3-native
> which don't run python and they're only there as there are python scripts
> being
> added which means python has to come too.
>
> I suspect for that reason it could be a net win but it is a tough call.


> I tend to be in favor of the reduced number of files moving around. I
suppose we could do some timing comparisons if we really care. It will be a
trade-off of network/io vs compute/io, correct?


> Cheers,
>
> Richard
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162669):
> https://lists.openembedded.org/g/openembedded-core/message/162669
> Mute This Topic: https://lists.openembedded.org/mt/89528765/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000911ffb05d958c060
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Mar 3, 2022 at 9:16 AM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, 2022-=
03-03 at 17:14 +0000, Ross Burton wrote:<br>
&gt; On Thu, 3 Mar 2022 at 16:34, Richard Purdie<br>
&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_b=
lank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt; This removes a further 1600 files from sstate handling and lets p=
ython<br>
&gt; &gt; create the ones it wants at runtime which is likely much better o=
verall<br>
&gt; &gt; for performance.<br>
&gt; <br>
&gt; Playing devil&#39;s advocate: doesn&#39;t having them in sstate mean t=
hey&#39;re<br>
&gt; generated once and hardlinked, instead of needing to be generated for<=
br>
&gt; every recipe which runs pythonnative?<br>
&gt; <br>
&gt; Whilst I can&#39;t disagree that 1600 files being dropped from sstate =
is<br>
&gt; good, we&#39;re just punting the recompile step to every recipe when i=
t<br>
&gt; runs python code.<br>
&gt; <br>
&gt; I guess the question here is how long does the Python library take to =
recompile.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">At runtime it sh=
ould only generate pyc for modules actually used?<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><br>
Another consideration is that there are many sysroots pulling in python3-na=
tive<br>
which don&#39;t run python and they&#39;re only there as there are python s=
cripts being<br>
added which means python has to come too.<br>
<br>
I suspect for that reason it could be a net win but it is a tough call.</bl=
ockquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
</blockquote><div dir=3D"auto">I tend to be in favor of the reduced number =
of files moving around. I suppose we could do some timing comparisons if we=
 really care. It will be a trade-off of network/io vs compute/io, correct?<=
/div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#162669): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/162669" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/162669</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89528765/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
89528765/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000911ffb05d958c060--

