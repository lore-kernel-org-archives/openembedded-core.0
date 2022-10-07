Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B8E3C433F5
	for <webhook@archiver.kernel.org>; Fri,  7 Oct 2022 09:00:03 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.2283.1665133188696398676
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Oct 2022 01:59:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=j1jO1nEF;
 spf=pass (domain: gmail.com, ip: 209.85.214.170,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d24so4006642pls.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Oct 2022 01:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ADvSZl49RlbsXxEsjxBm74Sst7gbksqY0kStG8ztosY=;
        b=j1jO1nEFwSg8vzn3pC086Uw0Vu3WooF1R/L96pWYRkKu59gf2PzB06ajXwsqBAaDnW
         heW92UEhC1Y1IGzZTC7gpFjO+f6pdSG/jWHfB0Xe/+Do9+WBOWcbBFC1ODEqzQHggPRb
         2nkn/wEtDWUPwCQuioj9JjZsOaldWejGaJEHxH0oM9ab59TFzTTIKBf9Wm3Ry+CF8niy
         EC8dpEOw38zMBR5JcoU63thZGOiYtrkASid8lLw08AmqYJ0g1/c1/4BXBZnWpSp7R+pm
         62e7rNzwhKsh0+0qW0M2uCiSkFUkJ5UHEu1XkTzRVRuDfzZAO3bk87V60XlmDkLlhEyp
         h9BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ADvSZl49RlbsXxEsjxBm74Sst7gbksqY0kStG8ztosY=;
        b=7NNXlFBExEUBYJHpQBAc1GCcStucZoYt5mhKJPVVQtIIoIXOGHcMIOA9dcW5rtYnOX
         I9hpwjNwxt5ZMk3qNdoaLJPBRpzJ7B2lEka09wRnCSdk0qSTznWyASRpmYbm0bzfIeHl
         5LPngNzqaRgWcPDpCAFp+PrjFtc1JcaV3FgRzw2twgJjLG0QmWyxbyfSivlsAJWiNLDh
         Z1DUbTdhxiLQ61hDXyR9+I0VQuCxlEjNC/cJ7ARYygIysYxoPsvWSSoI3vkmLkHEk1na
         m3ZbgFKZqQuv5PFW/6fAzO+6h+P4WaZHuJfd9Vvi/mEokCUcLAIBxQWbHZTUcQD78Z5V
         cg8w==
X-Gm-Message-State: ACrzQf1xbvXCOaRF8Pl6zInVwuvAUOWpFHXhKisoSywvxPlq6si5W1zb
	iehAYxcJWfFNg5T/5Q/+rQ6XSXL0LyLPMCJIoxQ=
X-Google-Smtp-Source: 
 AMsMyM59Sn061HAA2q6x7JafoMYOFtVIn+ZVZysU6wB6OxsBMJdMSn7zo1jM8CqWlXhjN6wI3eLBb2Dsn32Ow0Z1BBc=
X-Received: by 2002:a17:90a:7f95:b0:20a:7510:618e with SMTP id
 m21-20020a17090a7f9500b0020a7510618emr14826686pjl.26.1665133187803; Fri, 07
 Oct 2022 01:59:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220930175440.2168008-1-jose.quaresma@foundries.io>
 <20220930175440.2168008-2-jose.quaresma@foundries.io>
 <95AC8980-2768-4D43-B50E-DD2AF76250A9@arm.com>
In-Reply-To: <95AC8980-2768-4D43-B50E-DD2AF76250A9@arm.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 7 Oct 2022 09:59:36 +0100
Message-ID: 
 <CANPvuRkrXBGeNS-=ypFOxqXaoLq-bdYB79sBLk+nxeLboUP_9g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] kern-tools-native: don't pull the toolchain
 as it is not used
To: Ross Burton <Ross.Burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000029ace005ea6e085e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Oct 2022 09:00:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171519

--00000000000029ace005ea6e085e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ross,

Ross Burton <Ross.Burton@arm.com> escreveu no dia quinta, 6/10/2022 =C3=A0(=
s)
11:50:

> On 30 Sep 2022, at 18:54, Jose Quaresma via lists.openembedded.org
> <quaresma.jose=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Prevents the default dependencies, namely the C compiler and standard C
> library (libc),
> > from being added to DEPENDS. This variable is usually used within
> recipes that do not
> > require any compilation using the C compiler.
> >
> > This also improves the speed as it will not populate the
> > native sysroot with the toolchain.
>
> But this is a native recipe, so it doesn=E2=80=99t depend on a cross-comp=
iler:
>
> $ bitbake-getvar -r kern-tools-native DEPENDS
> DEPENDS=3D" git-native=E2=80=9D
>

Right, sorry for my confusion that maybe it was ignorance of the reality of
this detail of native packages.
Please drop that patch and thanks for your time in reviewing it.

Jose


>
> Ross



--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000029ace005ea6e085e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Ross,</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Ross Burton &lt;<a href=3D"mailto:Ross.Burton=
@arm.com">Ross.Burton@arm.com</a>&gt; escreveu no dia quinta, 6/10/2022 =C3=
=A0(s) 11:50:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 30 Sep 2022, at 18:54, Jose Quaresma via <a href=3D"http://lists.openembed=
ded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> &l=
t;quaresma.jose=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" targe=
t=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; Prevents the default dependencies, namely the C compiler and standard =
C library (libc),<br>
&gt; from being added to DEPENDS. This variable is usually used within reci=
pes that do not<br>
&gt; require any compilation using the C compiler.<br>
&gt; <br>
&gt; This also improves the speed as it will not populate the<br>
&gt; native sysroot with the toolchain.<br>
<br>
But this is a native recipe, so it doesn=E2=80=99t depend on a cross-compil=
er:<br>
<br>
$ bitbake-getvar -r kern-tools-native DEPENDS<br>
DEPENDS=3D&quot; git-native=E2=80=9D<br></blockquote><div><br></div><div>Ri=
ght,=C2=A0sorry for my confusion that maybe it was ignorance of the reality=
 of this detail of native packages.</div><div>Please drop that patch and th=
anks for your time in reviewing it.<br><br>Jose<br>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<br>
Ross</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"=
ltr" class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=
=C3=A9 Quaresma</div></div></div></div>

--00000000000029ace005ea6e085e--

