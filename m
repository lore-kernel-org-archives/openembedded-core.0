Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99CD1EB64DC
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 13:57:40 +0000 (UTC)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
 by mx.groups.io with SMTP id smtpd.web11.23552.1688651853267605678
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 06:57:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=LHCOBt8u;
 spf=pass (domain: gmail.com, ip: 209.85.217.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-44360717659so1357665137.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 06:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688651852; x=1691243852;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AugJnJ4RagaE07dhkdS5Yfa619EbAa3AtoqDPCk6Czs=;
        b=LHCOBt8ucN2VpSSLlYFsc51nwsgEOmMdpGKdh4pz/qeVdgktEVWtRZscpPYZ6Ah0g/
         jWzsHvEb/UKONDydfldMqPe+UqVywE9BXPYl7z6sINnlfGWM/q4dJVvInpJuuPNOsWT0
         10xwVDp99+e7sLTYtiwgk6PMmvxRshpCRFdrzd5VkjQUHCa2XD/GZACcGRRj6qnKDlQp
         B8Y2j8u35cpBnNIvJ0K2+W1g/fdDhIZ0YC18YPqvac+pX7Sax+tyMW06JqeZHaEqTnIL
         hDgos4pLiLJ8Kx9YoaEtBBz/UVI13lzjPEpSe1vWVPNEJryadg5UrW9J0E6xzKfJ+TMu
         Iogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688651852; x=1691243852;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AugJnJ4RagaE07dhkdS5Yfa619EbAa3AtoqDPCk6Czs=;
        b=aCWeZZF0bqdH/qPVxXajVQ1cR7u2/tUGaUtSAiczub+agjgeZxOhC5mcpg7nTVBp6O
         DIzty/Z9qSxyMtG1IOwUlmR4bcAZEkRe6uH86A1NPahecmSZDitg1w0HELWfCRG1J2lO
         7fbDLUGOaOTDKqHcE+2u6GCiJKH3qDUzy/n1SYhIqUh13mms2Gp15vDbqoBX3+21qR5m
         9DaHO+EmrWPA+H7CQusvVRc6jrFfLiDhh2JCNFbrQXu70L49JqCetnB24LmIhKvUlTLM
         0DOH4DrISZIMgr4HLDIRSUsqqaEUTiSDijz3RLhJZta5X86DZYJjNOcOIgUocFxasRRU
         x+TQ==
X-Gm-Message-State: ABy/qLYR15Hy56XwQB90XbaA0xSIHkgwVSBlW1kPz9YkDSBGvl8kcGE5
	w/2X71UseSiEvWPUWBLSM52MSAbWOdBhSggB1yc=
X-Google-Smtp-Source: APBJJlFDGrp5XQzvP6hklv7UhXNgGNCLv4acbQcmZxshE1tE0nPXEy/Ef4TLHUUNfhIZYJda4mwPQVxgPWCcbZ7q6EU=
X-Received: by 2002:a67:c997:0:b0:444:d7f0:d27c with SMTP id
 y23-20020a67c997000000b00444d7f0d27cmr1663819vsk.14.1688651852274; Thu, 06
 Jul 2023 06:57:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230706130338.7144-1-dl9pf@gmx.de>
In-Reply-To: <20230706130338.7144-1-dl9pf@gmx.de>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 6 Jul 2023 14:57:21 +0100
Message-ID: <CANPvuRm+NRgDpMXuMvHhVgLy4ddw3T66gMZ5TOgrFHoCi2GbxQ@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] backport reproducible build selftest
 user-facing settings
To: =?UTF-8?Q?Jan=2DSimon_M=C3=B6ller?= <dl9pf@gmx.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000cde1a305ffd1e5d6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 13:57:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183949

--000000000000cde1a305ffd1e5d6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I would be very happy if that were possible, currently I can only test
using the master branch.

Jose

Jan-Simon M=C3=B6ller <dl9pf@gmx.de> escreveu no dia quinta, 6/07/2023 =C3=
=A0(s)
14:03:

> Hi Steve!
>
> Please consider backporting these patches:
>
>     [kirkstone][PATCH 1/2] selftest reproducible.py: support different
>     [kirkstone][PATCH 2/2] selftest/reproducible: Allow chose the package
>
> For the autobuilder they are a no-op, but for users adopting the
> reproducible selftest, these are very important settings to expose.
>
> Best,
> Jan-Simon
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183940):
> https://lists.openembedded.org/g/openembedded-core/message/183940
> Mute This Topic: https://lists.openembedded.org/mt/99984920/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000cde1a305ffd1e5d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,<br><br>I would be very happy if that =
were possible, currently I can only test using the master branch.<br><br>Jo=
se</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">Jan-Simon M=C3=B6ller &lt;<a href=3D"mailto:dl9pf@gmx.de">dl9pf@gmx.de</a=
>&gt; escreveu no dia quinta, 6/07/2023 =C3=A0(s) 14:03:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">Hi Steve!<br>
<br>
Please consider backporting these patches:<br>
<br>
=C2=A0 =C2=A0 [kirkstone][PATCH 1/2] selftest reproducible.py: support diff=
erent<br>
=C2=A0 =C2=A0 [kirkstone][PATCH 2/2] selftest/reproducible: Allow chose the=
 package<br>
<br>
For the autobuilder they are a no-op, but for users adopting the<br>
reproducible selftest, these are very important settings to expose.<br>
<br>
Best,<br>
Jan-Simon<br>
<br>
<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#183940): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/183940" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/183940</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99984920/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/99984920/5052612</a><br>
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

--000000000000cde1a305ffd1e5d6--

