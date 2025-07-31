Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C8A5C87FCC
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 14:02:31 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web11.62791.1753970546933561514
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Jul 2025 07:02:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O6GLe+mS;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-710e344bbf9so10416837b3.2
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 07:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753970546; x=1754575346; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YsLmSdUDajpucI61ABNkQtm3PfV903EQkcPjFBWseKc=;
        b=O6GLe+mSDWGfiZLVckkUgElnWgdjcCdl7GBUEuUcHH9fG9+g6Ht8nKODvmLMx6BMio
         WwzEM6+5kW/XWkdEQajTMU8Hs3iW/PIPuM2oLp7ad3hWFs9FkdCPeAKm7PI/zZHs6gv6
         xTHBDV77pgRcBMbX0XLQ6bMN0jo99ftLDWOznlxoZ+yCfcu7jFPYT4ridIYVgVi51GUS
         v/j+cVHDmrFl6y7lXSnAL0XAdRhxBwQ04YRllPc3n9AhLMbSJSA5xtD6AvSmC4raesQP
         zwbbUh2X/ENCr1Qgqivujhlk1wG1ewhnKDS8uFaTCm71tkBRmlnDMgHr9LlrcNFT6LDX
         knvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753970546; x=1754575346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YsLmSdUDajpucI61ABNkQtm3PfV903EQkcPjFBWseKc=;
        b=r/IkHvg7G56xxCieCN2xt8KBA1dmTvgmSN/bTwAH+cLTWg31vau9ojBPIHVyuMTS6C
         wocvpKdm0E4WebVyBO8LFCtDW7SGUhu+m1WXomc9/2W5DysPr/fo2lFyOMPeOrxBIRO6
         c4AdDGaCiNGWij2/NXC21YuFsodW7ZlS5QhzEkViRIFw0nikKzU3oD/VKffhiQXcCncY
         j+Ma7LZghYfEyKdxCYlTexIDoxN1EE0vwwzBDlSzUJsy9wlkz9iXmo0gkZi7WIi4Q+9X
         mUouulGJkyDUvo9fL52YpsaC4Kug1I5iVn/ZeBho0UT7OxHEitzXzEb5+f+v+h3bhkhI
         tC1Q==
X-Gm-Message-State: AOJu0Yxl7k55HqbD4OzyngdXzMDzd9qf0gSirMsWLQlBKLDYHr9J8GtD
	uavs1YdmFUtTDMv7ZxdSVnOXerxx47njYlJxghRKSHhLYigrcZH9GdICG4vMIWSxQ9JBAVE81xd
	pMf19PVryOZwPS+TkUL8ue37hyJBLOCY=
X-Gm-Gg: ASbGncsKLZDbemnIpI30+JZ8SpLzp2/3qEYWtVNse33IT6e+za7tVQHp5kd7dSwFXLL
	UemGucrNdLEqgFJsW8KWFWdl67+FGFiW6Jy1r4+vLWyN/45vWqBmHjFKPikng8iJiX04DAVvl2B
	r3dqwspgiOC5WGCR/G6QOhHwgEcnAHagD4Go7iBZ7OZZFmQlhAY6+wBRHUkuempKdAl9Bmhw6C9
	+TOtMqB4Il28gotRDwHhRw4qiS08iB+dCDHRXc4ik7ITjT1dN5bsD4u9ehGIA==
X-Google-Smtp-Source: AGHT+IEOE2JUvKcUOGbzoF/SoDcEwtwWliNIbJBLUYRiyjXvPgk2funlo4mtypbOw+LfYm4ihyw2fvFxY9pGh8M/rPg=
X-Received: by 2002:a05:690c:6f0f:b0:71a:26cd:6d18 with SMTP id
 00721157ae682-71a4696e8ebmr107354057b3.40.1753970545744; Thu, 31 Jul 2025
 07:02:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250730162112.67549-1-nikhilr5@kpit.com> <CAMKF1spu==k3jvfuxjqL2t0hD825BdieWqi1oZcN0_oNtxkfXA@mail.gmail.com>
 <MAZPR01MB89502A455B06BE7AACFF5D1BEE27A@MAZPR01MB8950.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <MAZPR01MB89502A455B06BE7AACFF5D1BEE27A@MAZPR01MB8950.INDPRD01.PROD.OUTLOOK.COM>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 31 Jul 2025 07:01:59 -0700
X-Gm-Features: Ac12FXy9Ct6-3uN1e56yGrwhQzqupiC5Uswh21Kad4qOXJhBE_cPgDdaMNDZuto
Message-ID: <CAMKF1sqBK0ZbBcnw=+wRDfKxz1fXqEKBCSqTEXwkcHcBJZ2Rdw@mail.gmail.com>
Subject: Re: [OE-core][master][PATCH] cmake: Enable debugger support in CMake
To: Nikhil R <Nikhil.R@kpit.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 14:02:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221195

On Thu, Jul 31, 2025 at 3:24=E2=80=AFAM Nikhil R <Nikhil.R@kpit.com> wrote:
>
> Hi Khem,
>
> Build time of cmake without Debugger support
> time : 8m9.082s
>
> Build time of cmake with Debugger support
> time: 8m35.592s

Thats just for cmake's own build I suppose. I was wondering about
cmake's execution time, when it is used to build a project something
like llvm/clang do_configure/do_compile tasks might show it

>
>
>  Regards,
>
>  Nikhil R
>
>  KPIT Technologies Limited
>
>
> ________________________________
> From: Khem Raj <raj.khem@gmail.com>
> Sent: Wednesday, July 30, 2025 9:57 PM
> To: Nikhil R <Nikhil.R@kpit.com>
> Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org>
> Subject: Re: [OE-core][master][PATCH] cmake: Enable debugger support in C=
Make
>
> Caution: This email originated from outside of the KPIT. Do not click lin=
ks or open attachments unless you recognize the sender and know the content=
 is safe.
>
> On Wed, Jul 30, 2025 at 9:21=E2=80=AFAM Nikhil via lists.openembedded.org
> <nikhil.r=3Dkpit.com@lists.openembedded.org> wrote:
> >
> > Starting from CMake version 3.27 support for interactive debugging of C=
Make
> > scripts and configurations was added. However, by default the `nativesd=
k-cmake`
> > is compiled with debugger support turned off. This change enables it.
> >
> > Signed-off-by: Nikhil R <nikhilr5@kpit.com>
> > ---
> >  meta/recipes-devtools/cmake/cmake_4.0.3.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/cmake/cmake_4.0.3.bb b/meta/recipes-=
devtools/cmake/cmake_4.0.3.bb
> > index 7d8b8cac65..604e306667 100644
> > --- a/meta/recipes-devtools/cmake/cmake_4.0.3.bb
> > +++ b/meta/recipes-devtools/cmake/cmake_4.0.3.bb
> > @@ -43,7 +43,7 @@ EXTRA_OECMAKE =3D " \
> >      -DKWSYS_CHAR_IS_SIGNED=3D1 \
> >      -DBUILD_CursesDialog=3D0 \
> >      -DKWSYS_LFS_WORKS=3D1 \
> > -    -DCMake_ENABLE_DEBUGGER=3D0 \
> > +    -DCMake_ENABLE_DEBUGGER=3D1 \
>
> Does it impact cmake execution time in some negative way ?
>
> >  "
> >
> >  do_install:append:class-nativesdk() {
> > --
> > 2.34.1
> >
> > This message contains information that may be privileged or confidentia=
l and is the property of the KPIT Technologies Ltd. It is intended only for=
 the person to whom it is addressed. If you are not the intended recipient,=
 you are not authorized to read, print, retain copy, disseminate, distribut=
e, or use this message or any part thereof. If you receive this message in =
error, please notify the sender immediately and delete all copies of this m=
essage. KPIT Technologies Ltd. does not accept any liability for virus infe=
cted mails.
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#221135): https://apc01.safelinks.protection.outlook=
.com/?url=3Dhttps%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2F=
message%2F221135&data=3D05%7C02%7Cnikhil.r%40kpit.com%7C76cd179f4ce14b6b0cf=
f08ddcf8602b1%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6388948967048690=
72%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAi=
OiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DOI5zbb7hh=
JvfovC657Hr4GOJ1ti%2FSiz0TPGLgOdlYgo%3D&reserved=3D0
> > Mute This Topic: https://apc01.safelinks.protection.outlook.com/?url=3D=
https%3A%2F%2Flists.openembedded.org%2Fmt%2F114451722%2F1997914&data=3D05%7=
C02%7Cnikhil.r%40kpit.com%7C76cd179f4ce14b6b0cff08ddcf8602b1%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C638894896704891799%7CUnknown%7CTWFpbGZsb3d8e=
yJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIs=
IldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D%2FK9lloAg4hSREUmOG9XtHqYVWpsGG43X37u=
pY2EXRU8%3D&reserved=3D0
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://apc01.safelinks.protection.outlook.com/?url=3Dhttp=
s%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2Funsub&data=3D05%=
7C02%7Cnikhil.r%40kpit.com%7C76cd179f4ce14b6b0cff08ddcf8602b1%7C3539451eb46=
e4a26a242ff61502855c7%7C0%7C0%7C638894896704901584%7CUnknown%7CTWFpbGZsb3d8=
eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCI=
sIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3Du56z0ckHVyDhDdnRaYxj%2F%2B6%2Bw%2B6X=
aOy%2BfE2OSXYiBZQ%3D&reserved=3D0 [raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
> This message contains information that may be privileged or confidential =
and is the property of the KPIT Technologies Ltd. It is intended only for t=
he person to whom it is addressed. If you are not the intended recipient, y=
ou are not authorized to read, print, retain copy, disseminate, distribute,=
 or use this message or any part thereof. If you receive this message in er=
ror, please notify the sender immediately and delete all copies of this mes=
sage. KPIT Technologies Ltd. does not accept any liability for virus infect=
ed mails.

