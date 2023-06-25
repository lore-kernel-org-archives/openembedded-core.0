Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB4BCEB64DC
	for <webhook@archiver.kernel.org>; Sun, 25 Jun 2023 18:56:46 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web10.17591.1687719404948707307
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jun 2023 11:56:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: aehs29@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1a991886254so2584148fac.2
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 11:56:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687719404; x=1690311404;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KIV4AdiwVHbIIBHm13Yqix2VElcCvO4YTOtf4QDjPcY=;
        b=j++3YNi/24fHky1rsAgaR5WSyTOSw80zrcYP4bi+CLRIp+qm5h2uYx4gRNQxdxGPJI
         msRogpY8FMySMwjTmlVcm6tkeR5xrEWThXaSe6+aPf4eEcJXKlmaAX/dvQPstvr00p/f
         9eT5NeZ9pZDyxxlJ5OWyOGBUtiQ12eJD+pE1XUrslxmThAL224qaI5zFY+VtQhdomy2+
         yUfWJ1uowCmDPNzbwF1PPwAJJqF8eOtQ9RLp/jbea/o/GPqF+8vRdgFGjlYhU18O7+k7
         1ZVIXd/QH8/WQWKEBUcmj8qelFyJOFodR9wcPIjV5bmrie73b/wTXfCUIef2I2WqxQA/
         Yc2Q==
X-Gm-Message-State: AC+VfDwbg29yCO90XZ2s2a0CvCVht//OWVAfPigtkUbLSArDybyr5HPH
	izQqY+X+4hLkgMCmmqSMkRIEAycXMtUfwQ==
X-Google-Smtp-Source: ACHHUZ5Yk+USsDHFVfmKf4CNNQjuVKUmH+F/C0oXHsMCC4iBBBAqFOmF/IEhyJJ/dRueF9TAjfhH0A==
X-Received: by 2002:a05:6871:6a8f:b0:1a6:a5ac:6c7 with SMTP id zf15-20020a0568716a8f00b001a6a5ac06c7mr24787616oab.53.1687719403882;
        Sun, 25 Jun 2023 11:56:43 -0700 (PDT)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com. [209.85.161.51])
        by smtp.gmail.com with ESMTPSA id em15-20020a0568705b8f00b0019e6b96f909sm2626226oab.22.2023.06.25.11.56.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jun 2023 11:56:43 -0700 (PDT)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-56314bd1c34so1658605eaf.1
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 11:56:43 -0700 (PDT)
X-Received: by 2002:a4a:c807:0:b0:555:91b1:546a with SMTP id
 s7-20020a4ac807000000b0055591b1546amr22848928ooq.2.1687719403261; Sun, 25 Jun
 2023 11:56:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230625042706.3998722-1-alejandro@enedino.org> <469ea730c421b65ca54af1ec0c9462fa411ccdfa.camel@gmail.com>
In-Reply-To: <469ea730c421b65ca54af1ec0c9462fa411ccdfa.camel@gmail.com>
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Date: Sun, 25 Jun 2023 12:56:32 -0600
X-Gmail-Original-Message-ID: <CAHMutrYh1PDttQhEEikCR2iakt7JLQmsyv0eKfMzdrB3S0dhJA@mail.gmail.com>
Message-ID: <CAHMutrYh1PDttQhEEikCR2iakt7JLQmsyv0eKfMzdrB3S0dhJA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] runqemu: Fix automated call to runqemu-ifup
To: adrian.freihofer@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000083179605fef8cbba"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 18:56:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183375

--00000000000083179605fef8cbba
Content-Type: text/plain; charset="UTF-8"

Sounds good to me!, to be fair, I do believe we are moving in the right
direction,
perhaps we're just missing a couple of test cases to expand our testing
spectrum.

Cheers,

Alejandro

On Sun, 25 Jun 2023 at 02:46, <adrian.freihofer@gmail.com> wrote:

> Hi Alejandro
>
> Thank you.
> I will prepare another patch to bring the ifdown script to the same
> level. There is still the <native-sysroot-basedir> parameter. But maybe
> after learning from ifup part of the story, when the autobuilder
> confirmed that everything is consistent again.
>
> Regards,
> Adrian
>
>

--00000000000083179605fef8cbba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,sa=
ns-serif;font-size:small">Sounds good to me!, to be fair, I do believe we a=
re moving in the right direction,=C2=A0</div><div class=3D"gmail_default" s=
tyle=3D"font-family:arial,sans-serif;font-size:small">perhaps we&#39;re jus=
t missing a couple of test cases to expand our testing spectrum.</div><div =
class=3D"gmail_default" style=3D"font-family:arial,sans-serif;font-size:sma=
ll"><br></div><div class=3D"gmail_default" style=3D"font-family:arial,sans-=
serif;font-size:small">Cheers,</div><div class=3D"gmail_default" style=3D"f=
ont-family:arial,sans-serif;font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-family:arial,sans-serif;font-size:small">Alejandro</=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Sun, 25 Jun 2023 at 02:46, &lt;<a href=3D"mailto:adrian.freihofer@gm=
ail.com">adrian.freihofer@gmail.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Hi Alejandro<br>
<br>
Thank you.<br>
I will prepare another patch to bring the ifdown script to the same<br>
level. There is still the &lt;native-sysroot-basedir&gt; parameter. But may=
be<br>
after learning from ifup part of the story, when the autobuilder<br>
confirmed that everything is consistent again.<br>
<br>
Regards,<br>
Adrian<br>
<br>
</blockquote></div>

--00000000000083179605fef8cbba--

