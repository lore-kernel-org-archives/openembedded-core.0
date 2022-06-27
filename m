Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63143CCA47F
	for <webhook@archiver.kernel.org>; Mon, 27 Jun 2022 13:02:08 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web12.41436.1656334922584534392
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jun 2022 06:02:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XeYmtdKK;
 spf=pass (domain: gmail.com, ip: 209.85.167.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id x3so16532943lfd.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jun 2022 06:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7uJBj8g1/F8e4TOEQSOBFAstbcUI7UMQ/DKdREUQLTI=;
        b=XeYmtdKKCNvtwi2hwnuBlOzdXX9zOGpcFmv44D3y8qhjbxs+zliNtAnfdoDfZyCo3u
         LEtABCrfx2VVI9IQbsatXYflD1LAhwym9EAxDBlBG/7PKLlR0G8YwG2lSDgytb+52fWN
         Yz68emfFrUle4rAA40G83p48utqCgkFa4pPPtT+IwxaImmFNXnjdk3QoMDNXvHoJqSyI
         KFexVebxchcyiGxhko2020q60KysLZBVsQeZ2bkbo+yFoanB0vH/v1FXDT6eH/TRfqNS
         ZZrIvaNOOf5F2Hkp0esGsEob8OkjXb/7TQvR+Jhss7mNXQnKIOzU5zPhKRmiglaOYBnh
         efJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7uJBj8g1/F8e4TOEQSOBFAstbcUI7UMQ/DKdREUQLTI=;
        b=679GaxGmifSpRXKmMswhXaL2oet0kK7v85Jw69Q0mICJODyNOH6PgE+Fv1+Udq58N3
         qBX0/BStMdZOh10+q+/9j22Ei+L8grobsckif2b5W4BSi4rVX+dI0jM0KABCRTLAhDKt
         jiL3pIP83BDn/Ih9JgECTBiAnvsblapVO4RNqCeXnxIrN2ytKDrPicyNiCZdLZSuvwnQ
         YoCqaxbjKhVdyC3drySv25bhz4vR2AzqTk3BKKRdyclON7Wrj88S9IqoIsWVr6YSiZ1n
         vBiREBzMZT9JWkBNyouqvuf/vdLZAq/W16AsRO0VU76UlP+ZN81sWfdySLSbvuNwAc/q
         GyXw==
X-Gm-Message-State: AJIora+pnQLTDRpkiyn9jOK8HKEXwUxTUZhbNd80FxG4T4NlKQVgGjHK
	6Qd48IG/QGGpGLzBZocCHDcaIqdITVRF5iZOKTU=
X-Google-Smtp-Source: 
 AGRyM1tjEfdwSDXz+nr3rR/WEUhpMue1F4CTzfZYq5rs2XNN1vnAE8dyP3MSXrhgigkfLNTatdLA4YL0Qdpc3ykoJkU=
X-Received: by 2002:a05:6512:5d2:b0:47f:6270:cb54 with SMTP id
 o18-20020a05651205d200b0047f6270cb54mr8506864lfo.358.1656334920766; Mon, 27
 Jun 2022 06:02:00 -0700 (PDT)
MIME-Version: 1.0
References: <57e72a0fe687a49a7efcffa167adab843305b612.camel@siemens.com>
In-Reply-To: <57e72a0fe687a49a7efcffa167adab843305b612.camel@siemens.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 27 Jun 2022 16:01:49 +0300
Message-ID: 
 <CANNYZj-Kr3TZAt69GZyChhnC37hwBcUCVL3PbxnoHCO=McFcLA@mail.gmail.com>
Subject: Re: [OE-core] eSDK dependencies
To: Andrej Valek <andrej.valek@siemens.com>
Cc: "Freihofer, Adrian" <adrian.freihofer@siemens.com>, "Marko,
 Peter" <Peter.Marko@siemens.com>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="00000000000094d8dd05e26d8664"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jun 2022 13:02:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167320

--00000000000094d8dd05e26d8664
Content-Type: text/plain; charset="UTF-8"

Can this behavior be reproduced using poky and no other layers?

Alex

On Mon 27. Jun 2022 at 15.33, Andrej Valek <andrej.valek@siemens.com> wrote:

> Hello Richard!
>
> I have a question related to eSDK dependencies. We're using the dunfell
> branch were everything related to this eSDK topic works fine. Now we're
> in the transition phase to new LTS branch, where were we found one big
> difference between eSDKs.
>
> The old variant (dunfell) includes all application build dependencies,
> but the new variant (kirkstone/master) doesn't. Means if I installed
> the eSDK and used "devtool modify my-app" (application installed on the
> image) it works without any additional build deps recompilation.
> But now, if I do the same on the newer version it always recompile all
> build deps.
> I was already looked, what could be changed, but I didn't find so far
> something suspicious. So the question is, what has been changed, and
> how to bring the old variant back?
>
> Many thanks,
> Andrej
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167319):
> https://lists.openembedded.org/g/openembedded-core/message/167319
> Mute This Topic: https://lists.openembedded.org/mt/92019337/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000094d8dd05e26d8664
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Can this behavior be reproduced using poky and no other l=
ayers?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon 2=
7. Jun 2022 at 15.33, Andrej Valek &lt;<a href=3D"mailto:andrej.valek@sieme=
ns.com">andrej.valek@siemens.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">=
Hello Richard!<br>
<br>
I have a question related to eSDK dependencies. We&#39;re using the dunfell=
<br>
branch were everything related to this eSDK topic works fine. Now we&#39;re=
<br>
in the transition phase to new LTS branch, where were we found one big<br>
difference between eSDKs.<br>
<br>
The old variant (dunfell) includes all application build dependencies,<br>
but the new variant (kirkstone/master) doesn&#39;t. Means if I installed<br=
>
the eSDK and used &quot;devtool modify my-app&quot; (application installed =
on the<br>
image) it works without any additional build deps recompilation.<br>
But now, if I do the same on the newer version it always recompile all<br>
build deps.<br>
I was already looked, what could be changed, but I didn&#39;t find so far<b=
r>
something suspicious. So the question is, what has been changed, and<br>
how to bring the old variant back?<br>
<br>
Many thanks,<br>
Andrej<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#167319): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/167319" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/167319</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92019337/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/92019337/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000094d8dd05e26d8664--

