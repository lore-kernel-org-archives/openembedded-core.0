Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34003C63797
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 15:23:55 +0000 (UTC)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
 by mx.groups.io with SMTP id smtpd.web11.199336.1673969026009036844
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jan 2023 07:23:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n9fd7D8M;
 spf=pass (domain: gmail.com, ip: 209.85.217.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f49.google.com with SMTP id d66so20086659vsd.9
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 07:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QTEOOW38RtTjeVPMpYjk6QWjF+dTi0dN9ckBqvPO3Ow=;
        b=n9fd7D8My1qbFnBZIzGM6HK5UbADOgD4S78pvtzb5Zf6qgrFKeu/UYEBYj6dpSRbxz
         lxs3gVRuvALusSKM5l6qNFqib623cnWDp12rQqSUOVsaTPJ7nsnb6Erl95eIoWiYhfM6
         LqVb3ju/kOTQEKgmnhkwrtzlEJYXnB7PYefued4Xn7g7X0P9RRRHT7m5aCXZH+Q04nqM
         YCvJbNGCNUlA/BoG3DqhTz68IMX/mYR0pgM7c8/WBhjmXIeV6vy4Sqhux3zL3RX/GhPd
         /CgkE5NUR3BW7SEZiAV4k1zJYpcAlLFRN26yTm9fnqqkH090JJ4maOV5WR6DHAE4B5pz
         HuEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QTEOOW38RtTjeVPMpYjk6QWjF+dTi0dN9ckBqvPO3Ow=;
        b=06/JPERIWmr4fWHNzI7zBUOEiFGLXYiX+1NZf5p9iBEilagRxvWoVQtDq069tpOfZa
         5mDwdOqliiidPOxSxHILbv3wdAtp1YF2EGbS2MVOgIOwON3M9AMaenYrz7yFICiIFBHN
         lWnCuGNS0IbfkLlgctDZV2JKScs3KAyKaMi0eT77XG1E5fQbra3AYYqZ8IAb7QCM4vzD
         RJgEvBIaTGBv6EhbHajcp5KDNeoq5ryAwOYD3IxpzLt9SyCleF5KRpWTMeZz3OwsNIjx
         WJv0KEjqFHYV4+sa0Ge9D1qEdG3KTGaQyJqyfAdGf3C/UGOBOeJeA3Cyp5CkN7HWhVrM
         eK5A==
X-Gm-Message-State: AFqh2kqvhJwQ6Js4ugQTZW2zI1TEp6kM+xMeeWNXm4lGfWpE34bedh+B
	+u69BeeZgtVi7n3Vj2tUXnXVo0pcrgU7rBV2JOk=
X-Google-Smtp-Source: AMrXdXveKHC0AqZxHpBsL+lg/Oyuq7bV2APzTcIQN7cIS1PSXXjTgM9b+3S0QXvSaHR/56jAncLBrF189WSva7cqZzg=
X-Received: by 2002:a67:fe48:0:b0:3cb:ba4:3831 with SMTP id
 m8-20020a67fe48000000b003cb0ba43831mr463755vsr.87.1673969024988; Tue, 17 Jan
 2023 07:23:44 -0800 (PST)
MIME-Version: 1.0
References: <20230109134930.1409270-1-richard.purdie@linuxfoundation.org>
 <CANPvuRmQiEXiZ7+9_N5O=FmKcMPcjhqBU-Fn8bJ-KYirNg0Z3g@mail.gmail.com>
 <60471b4cad9af5016e08174e3e7d7878be89d5a1.camel@linuxfoundation.org>
 <CANPvuRmjUHFVO4DgkFOSmU_2nLb8j6XJVA6nyqYOKt+rUBUugA@mail.gmail.com> <54ce6c61fabc641dcb40ce11e72f8eabf4b21e33.camel@linuxfoundation.org>
In-Reply-To: <54ce6c61fabc641dcb40ce11e72f8eabf4b21e33.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 17 Jan 2023 15:23:34 +0000
Message-ID: <CANPvuRnYZ-yALt-qJDpDNo265NQM-=WqK_mRt607sZFVpp0NJQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] uninative-tarball: Add libgcc
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000019791705f27749b7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 15:23:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176050

--00000000000019791705f27749b7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia ter=C3=
=A7a,
17/01/2023 =C3=A0(s) 15:07:

> On Tue, 2023-01-17 at 14:35 +0000, Jose Quaresma wrote:
> > No, I don't have libgcc installed on my build container and this is
> > the main reason.
> > I know that we now need the libgcc on the build host and this can
> > satisfied in two different ways:
> >
> > 1 - installing the libgcc on the build host
>
> This is the correct thing to do here.
>
> > 2 - using the unative
> >
> > For now I will use the [1] because I don't use the uninative.
> > Maybe the documentation needs to be updated adding the libgcc
> > as a requirement of bitbake.
>
> To be clear, this is a distro python dependency problem. python is
> needing libgcc but is missing a dependency, that is the real issue.
>
> We can document it as a known problem and something to install but we
> should be clear it is required by python.
>
> >
> > No, I am not using the buildtools nor the uninative.
> > My build container is ubuntu 20.04 based and dont have libgcc.
> > This is not the first time I see this error in the last few weeks
> > but I'll go install libgcc and it should fix my issue, if not i will
> > come back.
>
> Sounds good. We should add libgcc to the list of packages to ensure are
> installed in the docs. Patches for that would be very welcome.
>

I will do some tests with libgcc installed and after that send something
to update the documentation.

Thanks for your time.

Jose


>
> Cheers,
>
> Richard
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000019791705f27749b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; escreveu no dia ter=C3=A7a, 17/01/2023 =C3=A0(s) 15:07:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On Tue, 2023-01-17 at 14:35 +00=
00, Jose Quaresma wrote:<br>
&gt; No, I don&#39;t=C2=A0have libgcc installed on my build container and t=
his is<br>
&gt; the main reason.<br>
&gt; I know=C2=A0that we now need the libgcc on the build host and this can=
<br>
&gt; satisfied in two different ways:<br>
&gt; <br>
&gt; 1 - installing the libgcc on the build host<br>
<br>
This is the correct thing to do here.<br>
<br>
&gt; 2 - using the unative<br>
&gt; <br>
&gt; For now I will use the [1] because I don&#39;t use the uninative.<br>
&gt; Maybe the documentation needs to be updated adding the libgcc<br>
&gt; as a requirement=C2=A0of bitbake.<br>
<br>
To be clear, this is a distro python dependency problem. python is<br>
needing libgcc but is missing a dependency, that is the real issue.<br>
<br>
We can document it as a known problem and something to install but we<br>
should be clear it is required by python.<br>
<br>
&gt; <br>
&gt; No, I am not using the buildtools=C2=A0nor the uninative.<br>
&gt; My build container is ubuntu 20.04 based and dont have libgcc.<br>
&gt; This is not the first time I see this error=C2=A0in the last few weeks=
<br>
&gt; but I&#39;ll go install libgcc and it should fix my issue, if not i wi=
ll<br>
&gt; come back.<br>
<br>
Sounds good. We should add libgcc to the list of packages to ensure are<br>
installed in the docs. Patches for that would be very welcome.<br></blockqu=
ote><div><br></div><div>I will do some tests with libgcc installed and afte=
r that send something <br>to update the documentation.<br><br>Thanks for yo=
ur time.<br><br>Jose<br>=C2=A0<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--00000000000019791705f27749b7--

