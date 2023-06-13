Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF88DC88CB7
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 09:36:05 +0000 (UTC)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
 by mx.groups.io with SMTP id smtpd.web10.9161.1686648957322486145
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jun 2023 02:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=e8xO7CHj;
 spf=pass (domain: gmail.com, ip: 209.85.221.177, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-460eb67244eso1589548e0c.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 02:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686648956; x=1689240956;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mo4qJGKSfEl1l4IRn/YoYwdUQB9qGt2mDdSf4Ak0dRY=;
        b=e8xO7CHjpA2ivTc5LtuWKphpU/9ioUtZ50FhzagIprLTeFvrVLpV3bqt8Nd0PhFGpb
         hrPjEvs/q5gTDO7CuYfT2zbWGZ/D6DFoCUkjKCrqUN7I7PZtJlviA3+qYGk98a3WCssH
         NxMqCAtptDzRh47lNNu+Twq/5PUqNPbjFSGcphHM5njavAx51gAcJHnilPLJJ9GpuSKK
         i2oHVkxFKvpfR37arEKmvhDNFyKGwif+nDBoESKhFvJXE2gLuTBPF+jQl/ay1+2VVANa
         kx2/o0PQQ8GhKc6K/is5N4HzahHjmNarrUG2eZFqqi3Y02eZ0O4WpBROVjpZcTaFUna/
         QVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686648956; x=1689240956;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mo4qJGKSfEl1l4IRn/YoYwdUQB9qGt2mDdSf4Ak0dRY=;
        b=P6nGDemmSVyjUoteqUojczKZuhueHeoZEIx5CICQMSxpi1DB1mkZaBc6T1Ok+umztY
         LcWUPDCtOo0G5/XvnQymxwJljRbjRVRABl6Z/KEkvyUUoNLtnaSZ1xBj08bWj06svfLS
         uSfciDweRx8RUzP4Ocozdo79xByAnhXvZMoEJ3sCIRHh6Rg+I2eODwnAVSuacUvr4uC4
         uRByq7dnYCFWHVOBaMw4SWwihYDd0iXiP1dGOFXs1Xmrr1Wuc1sR+xFEQsS47KKlxOek
         oXjRbYDNRfSZxg6rIQNIm5SSjIF7s6YfiY2GbppjUQjZ1Z6Y3GbDXG8kqB99Us8RN8Dr
         e4eg==
X-Gm-Message-State: AC+VfDyBpxeM7xJRq3QFhv7/RbR8YGh85HiOZO9vXduDIUdd1ZvI9HsW
	TgnjhA4n98zaw7/88tT88jcqSvk0Hcw0S2zZywM=
X-Google-Smtp-Source: ACHHUZ4eQ1jLQ89MSkiHkiswqrNHDfc5zspBAlvxkTAeq5MYRkE83xb0qgF76Gwxg28vQs5oHzJH0IuLBLa+Qtn4V1s=
X-Received: by 2002:a05:6102:302f:b0:438:d4bd:f1f2 with SMTP id
 v15-20020a056102302f00b00438d4bdf1f2mr4960599vsa.22.1686648956170; Tue, 13
 Jun 2023 02:35:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230613081451.1736892-1-mikko.rapeli@linaro.org>
 <CANNYZj8GcHbm-5G6J2BUy6yu6d31XTPrzGXx-iRrV8aebdj=Qg@mail.gmail.com> <ZIgvXgIq1ZhMpRwp@nuoska>
In-Reply-To: <ZIgvXgIq1ZhMpRwp@nuoska>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 13 Jun 2023 10:35:45 +0100
Message-ID: <CANPvuR=fKDZ8NPCTm913DxvGrxAOsSbfXyCQwiY=3B27L8iLjA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] selftest reproducible.py: support different
 build targets
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e4b59e05fdff8faa"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 09:36:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182702

--000000000000e4b59e05fdff8faa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mikko,

Mikko Rapeli <mikko.rapeli@linaro.org> escreveu no dia ter=C3=A7a, 13/06/20=
23
=C3=A0(s) 09:57:

> Hi Alex,
>
> On Tue, Jun 13, 2023 at 10:50:20AM +0200, Alexander Kanavin wrote:
> > There should be a default, set to what it is now.
> >
> > On Tue 13. Jun 2023 at 10.15, Mikko Rapeli <mikko.rapeli@linaro.org>
> wrote:
> >
> > > From: Mikko Rapeli <mikko.rapeli@linaro.org>
> > >
> > > Allow users to set different build reproducibility targets than
> > > the defaults using OEQA_REPRODUCIBLE_TEST_TARGET and
> > > OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS variables in local.conf.
>
> If OEQA_REPRODUCIBLE_TEST_TARGET or OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS
> are not set, the current defaults are still there hard coded into
> the test.
>

Looks like a good improvement and with this new variable we can run the
test without needing to subclass the
ReproducibleTests class to change the target image and the state target. I
have a subclass just to change these two items.

Jose


>
> Cheers,
>
> -Mikko
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182699):
> https://lists.openembedded.org/g/openembedded-core/message/182699
> Mute This Topic: https://lists.openembedded.org/mt/99501089/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000e4b59e05fdff8faa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Mikko,</div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">Mikko Rapeli &lt;<a href=3D"mailto:mikko.rap=
eli@linaro.org">mikko.rapeli@linaro.org</a>&gt; escreveu no dia ter=C3=A7a,=
 13/06/2023 =C3=A0(s) 09:57:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Hi Alex,<br>
<br>
On Tue, Jun 13, 2023 at 10:50:20AM +0200, Alexander Kanavin wrote:<br>
&gt; There should be a default, set to what it is now.<br>
&gt;<br>
&gt; On Tue 13. Jun 2023 at 10.15, Mikko Rapeli &lt;<a href=3D"mailto:mikko=
.rapeli@linaro.org" target=3D"_blank">mikko.rapeli@linaro.org</a>&gt; wrote=
:<br>
&gt; <br>
&gt; &gt; From: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@linaro.org"=
 target=3D"_blank">mikko.rapeli@linaro.org</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; Allow users to set different build reproducibility targets than<b=
r>
&gt; &gt; the defaults using OEQA_REPRODUCIBLE_TEST_TARGET and<br>
&gt; &gt; OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS variables in local.conf.<br=
>
<br>
If OEQA_REPRODUCIBLE_TEST_TARGET or OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS<b=
r>
are not set, the current defaults are still there hard coded into<br>
the test.<br></blockquote><div><br></div><div>Looks like a good improvement=
=C2=A0and with this new variable we can run the test without needing to sub=
class the</div><div><span style=3D"color:rgb(0,0,0)">ReproducibleTests</spa=
n>=C2=A0class to change the target=C2=A0image and the state=C2=A0target. I =
have a subclass just to change these two items.</div><div><br>Jose</div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
-Mikko<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#182699): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/182699" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/182699</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99501089/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/99501089/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000e4b59e05fdff8faa--

