Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67E89C433F5
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 12:53:34 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.web10.6494.1637153613196882258
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 04:53:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o5i0vgmW;
 spf=pass (domain: gmail.com, ip: 209.85.222.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f49.google.com with SMTP id ay21so5572479uab.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 04:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A2n5VfIICgb6YMMM9LJA/yn9RXKtZXhTYdKi9GQ5mVc=;
        b=o5i0vgmWn6Q1ETq6lOvWZN7lL4CyGxnDmE6XzxZ48gj29B2cZrmcjr/CCAYa1JTLXr
         0kJnlQ9cJG+Mc2p65q0yaui6R1FUt9mpzgRfMYIbD2BKszzdHu8A2uIymy0RdCl5rl0b
         YiDYo1XZIPtSykFP4kYWRFaoCWN45+T1uZQPJLPbTOLBjL5+wZ+wJGt+KIyFzmzIrpzq
         kHX0t9l8owBhD1YUsiGlJVerEplYpACw7DP090sdMyn99wMUhpedTV/2wNo4lhx1JOug
         N8CEBd8xCVOD4Kq1h/q1yP0c2oxZuhgQ+5ZDrfhoKCYnMTLuGBk5S0wqzm9sF/2Sj8v+
         52nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A2n5VfIICgb6YMMM9LJA/yn9RXKtZXhTYdKi9GQ5mVc=;
        b=Fd3TYKQDUPL7FsB+w8VshBCE+OrEZX8QnlOGJZlLN9f/XXQs75z8UDA8X/YagtKJsj
         qcsFD5jZ4U9NDWaL//b88ju10DPzAMh+6oifrQniF/Ke+mZ9UEcdk1eE8jVH84wjPI0S
         oaZhHwObG5vok0l9K+jQX3tXFTDJ+t6NySjSbQxV7mPwhU6mHHnXyH2Mlcm4JWRi2141
         wKqGeAY2vVyRofy2+5+WXFXGQ/DMuOK1p1ZI5xcdZ1FztHqsHEfnNCAMrExET13ItJkR
         CH8ZXtaAVJ3BTnFCW0SuJj6HrkFDta9sgyim51jsA+BXp0BZaRBkEqVO9tczrsESXA6P
         tXJg==
X-Gm-Message-State: AOAM530SdlBfLIBVELwKgN01bD1oC6bJAwPYdgMcNh8t74ZKtA58VIti
	vzbOyNKp03EUSf45KrHgbi1qrid3JKAIj3yzzp0=
X-Google-Smtp-Source: 
 ABdhPJyEqOh1ED5MXeDwNBnsLLjX0y38CLE2zc5cwlb9SlMNEjXncRufbGlM04gALqDFRMY0oy8RP+bI4LJDCxNih3s=
X-Received: by 2002:ab0:6f14:: with SMTP id r20mr23799594uah.22.1637153612298;
 Wed, 17 Nov 2021 04:53:32 -0800 (PST)
MIME-Version: 1.0
References: <20211117123201.111905-1-luca.boccassi@gmail.com>
In-Reply-To: <20211117123201.111905-1-luca.boccassi@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 17 Nov 2021 13:53:20 +0100
Message-ID: 
 <CANNYZj-tjH20-ocHq_7DWC6qaPA0XhKfk4cGXMPNbs-_YXp8jg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/8] systemd: allow building for nativesdk
To: Luca Bocassi <luca.boccassi@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 paul.eggleton@microsoft.com
Content-Type: multipart/alternative; boundary="00000000000080fb5e05d0fb877c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 12:53:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158393

--00000000000080fb5e05d0fb877c
Content-Type: text/plain; charset="UTF-8"

Shouldn't this be enabled in regular yocto builds first, e.g. allow
systemd-native and then add the needed checks to systemd.bbclass? Maybe
nativesdk support isn't then needed at all?

Alex

On Wed, 17 Nov 2021 at 13:32, Luca Bocassi <luca.boccassi@gmail.com> wrote:

> From: Luca Boccassi <luca.boccassi@microsoft.com>
>
> systemd-analyze in the next release will gain the ability to
> run the 'security' and 'verify' verbs offline, on local units.
> This is very useful at build time and/or in CI systems to detect
> errors and issues before changes are deployed, as a static
> analyzer tool.
> This series enables building the systemd recipe for the nativesdk
> targets, so that systemd-analyze can be included in the SDK and
> called by users/build systems/CI systems.
>
> Luca Boccassi (8):
>   systemd: skip chown when building for nativesdk
>   systemd: skip postinst in nativesdk builds
>   systemd: remove /var in nativesdk builds
>   volatile-binds: remove /var in nativesdk builds
>   volatile-binds: add nativesdk
>   kbd: add nativesdk
>   os-release: add nativesdk
>   systemd: add nativesdk
>
>  meta/recipes-core/kbd/kbd_2.4.0.bb            |  2 +-
>  meta/recipes-core/os-release/os-release.bb    |  2 ++
>  meta/recipes-core/systemd/systemd-conf_1.0.bb |  2 ++
>  .../systemd/systemd-serialgetty.bb            |  2 ++
>  meta/recipes-core/systemd/systemd_249.5.bb    | 29 +++++++++++++++++--
>  .../volatile-binds/volatile-binds.bb          |  7 +++++
>  6 files changed, 41 insertions(+), 3 deletions(-)
>
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158384):
> https://lists.openembedded.org/g/openembedded-core/message/158384
> Mute This Topic: https://lists.openembedded.org/mt/87118013/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000080fb5e05d0fb877c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Shouldn&#39;t this be enabled in regular yocto builds=
 first, e.g. allow systemd-native and then add the needed checks to systemd=
.bbclass? Maybe nativesdk support isn&#39;t then needed at all?<br></div><d=
iv><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Wed, 17 Nov 2021 at 13:32, Luca Bocassi =
&lt;<a href=3D"mailto:luca.boccassi@gmail.com">luca.boccassi@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From:=
 Luca Boccassi &lt;<a href=3D"mailto:luca.boccassi@microsoft.com" target=3D=
"_blank">luca.boccassi@microsoft.com</a>&gt;<br>
<br>
systemd-analyze in the next release will gain the ability to<br>
run the &#39;security&#39; and &#39;verify&#39; verbs offline, on local uni=
ts.<br>
This is very useful at build time and/or in CI systems to detect<br>
errors and issues before changes are deployed, as a static<br>
analyzer tool.<br>
This series enables building the systemd recipe for the nativesdk<br>
targets, so that systemd-analyze can be included in the SDK and<br>
called by users/build systems/CI systems.<br>
<br>
Luca Boccassi (8):<br>
=C2=A0 systemd: skip chown when building for nativesdk<br>
=C2=A0 systemd: skip postinst in nativesdk builds<br>
=C2=A0 systemd: remove /var in nativesdk builds<br>
=C2=A0 volatile-binds: remove /var in nativesdk builds<br>
=C2=A0 volatile-binds: add nativesdk<br>
=C2=A0 kbd: add nativesdk<br>
=C2=A0 os-release: add nativesdk<br>
=C2=A0 systemd: add nativesdk<br>
<br>
=C2=A0meta/recipes-core/kbd/<a href=3D"http://kbd_2.4.0.bb" rel=3D"noreferr=
er" target=3D"_blank">kbd_2.4.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 2 +-<br>
=C2=A0meta/recipes-core/os-release/<a href=3D"http://os-release.bb" rel=3D"=
noreferrer" target=3D"_blank">os-release.bb</a>=C2=A0 =C2=A0 |=C2=A0 2 ++<b=
r>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd-conf_1.0.bb" rel=
=3D"noreferrer" target=3D"_blank">systemd-conf_1.0.bb</a> |=C2=A0 2 ++<br>
=C2=A0.../systemd/<a href=3D"http://systemd-serialgetty.bb" rel=3D"noreferr=
er" target=3D"_blank">systemd-serialgetty.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 2 ++<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_249.5.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_249.5.bb</a>=C2=A0 =C2=A0 | 29 ++++++=
+++++++++++--<br>
=C2=A0.../volatile-binds/<a href=3D"http://volatile-binds.bb" rel=3D"norefe=
rrer" target=3D"_blank">volatile-binds.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 7 +++++<br>
=C2=A06 files changed, 41 insertions(+), 3 deletions(-)<br>
<br>
-- <br>
2.30.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#158384): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/158384" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/158384</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87118013/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87118013/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000080fb5e05d0fb877c--

