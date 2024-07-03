Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B10C2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 18:57:48 +0000 (UTC)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
 by mx.groups.io with SMTP id smtpd.web11.59029.1720033060176258138
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jul 2024 11:57:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ciRkvOBQ;
 spf=pass (domain: gmail.com, ip: 209.85.217.53, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-48f44f892d5so2072549137.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 11:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720033059; x=1720637859; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VTyp2M+i3Jau+VKnSDZk9CGfqsri45zDQ5T4o3zLubE=;
        b=ciRkvOBQ7BmWuBZLO3/iO3DV2Eq7kiOymRs6Hc2vT1qnNGxZ7Jxeh4c+Rl+UldGotp
         1ERWELDSaB550gR1S9Nbfx8mOSZxfTAwLdD7fxGsV5EBn62oD9ylWp1caa0gqdDKb/7F
         O+AymilVilim8n+CdALV+c+2YAp3nwjG2CBy8IsRJkzugvrcEnipNVH6lnnW5VQ78clY
         pezlOzS7eKZEdHKnERlH3p0kb0Z9zzPHl0j7jpUomAge0iQFpF+IaAk2L3LY0vjFppDE
         Y5/qT4BrB7GOtsuLiUOXyWLBIzUOnJsXdjoT24gG12d5gwvSzuGhcFgoDTLeuK0nJC4V
         eaQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720033059; x=1720637859;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VTyp2M+i3Jau+VKnSDZk9CGfqsri45zDQ5T4o3zLubE=;
        b=O2AuZUaIXYSlVy4pcUGVnC9OSynrspGAwuYSieVh+nqRpz3cVXCxtl0EmDYzBe4+Fu
         oCewIbODMi6EfD/19X+YFhrRQkkn6jMTrsF4tYeZ3nJVmK64p9ikDp3yfTI3Uq0LsVWB
         aGctoELssMnKR4t5czQvSH5JZB97+rUsa8nDRZ26MuJtxYBZysktl/LivxxcOrtpT0ux
         3m4U4ZsIDC00yTJl6R6Mpi9wux6j2dEYj1J9yfW/hOSfOsf6z9XqAcLmW13KxhrKcJET
         ppMIshmrCpnYuXs8meRpjJfDpUkHp8RdKxA/Eeq9ca2kFBNmFObHAQ9hmFYdk4dCwsjT
         uA5A==
X-Gm-Message-State: AOJu0YzBPJe4S5+OD8++qlGfbRbK52Fw+ekgQZJoHqL3lbi5TR99Uz53
	Ro9sQMNv9/IfXWXa5oFqOFbhR4R6/MN3Eym5rOxK5BBjFgpDB/rDm/bvfDAOPl0QKB+i58IVVa2
	UvEvU9fQ2qwy3ixx23SRiBkoMp60=
X-Google-Smtp-Source: AGHT+IFPb9gPD+gnPoISLGOZehhMUgd6ZOGdXAjF4Pec0e1Sy2LOgULmSTwW5Y+xZt3AJZgmzBYPhizepzgmTXYvFWc=
X-Received: by 2002:a05:6102:2907:b0:48f:5a6b:196 with SMTP id
 ada2fe7eead31-48faf16aa7emr14057784137.34.1720033059208; Wed, 03 Jul 2024
 11:57:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240703154004.2632376-1-jose.quaresma@foundries.io> <ce52f2465b097e9b1fedb37bee9f65ae0c24606a.camel@linuxfoundation.org>
In-Reply-To: <ce52f2465b097e9b1fedb37bee9f65ae0c24606a.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 3 Jul 2024 19:57:27 +0100
Message-ID: <CANPvuRm3rkmxJWYHE_yk-zV9ri5p+oVkhOfYt_sxRFa6q=bSjA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] openssh: upgrade 9.7p1 -> 9.8p1
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="0000000000007f0614061c5c6775"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 18:57:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201498

--0000000000007f0614061c5c6775
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu (quarta,
3/07/2024 =C3=A0(s) 18:41):

> On Wed, 2024-07-03 at 16:40 +0100, Jose Quaresma via
> lists.openembedded.org wrote:
> > Release notes at https://www.openssh.com/txt/release-9.8
>
> Thanks for the upgrade, it does look important. Unfortunately it had a
> build failure for musl:
>
> https://valkyrie.yoctoproject.org/#/builders/3/builds/68
>
> Also may be related:
>
>
> https://valkyrie.yoctoproject.org/#/builders/74/builds/60/steps/15/logs/s=
tdio
>
> https://valkyrie.yoctoproject.org/#/builders/18/builds/61/steps/12/logs/s=
tdio
>
> The build is still ongoing.
>

Tomorrow I will take a look at this and will try to fix it.

Thanks

Jose


>
> Cheers,
>
> Richard
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000007f0614061c5c6775
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; escreveu (quarta, 3/07/2024 =C3=A0(s) 18:41):<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On Wed, 2024-07-03 at 16:40 +0100, Jose Q=
uaresma via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" ta=
rget=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; Release notes at <a href=3D"https://www.openssh.com/txt/release-9.8" r=
el=3D"noreferrer" target=3D"_blank">https://www.openssh.com/txt/release-9.8=
</a><br>
<br>
Thanks for the upgrade, it does look important. Unfortunately it had a buil=
d failure for musl:<br>
<br>
<a href=3D"https://valkyrie.yoctoproject.org/#/builders/3/builds/68" rel=3D=
"noreferrer" target=3D"_blank">https://valkyrie.yoctoproject.org/#/builders=
/3/builds/68</a><br>
<br>
Also may be related:<br>
<br>
<a href=3D"https://valkyrie.yoctoproject.org/#/builders/74/builds/60/steps/=
15/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://valkyrie.yoctop=
roject.org/#/builders/74/builds/60/steps/15/logs/stdio</a><br>
<a href=3D"https://valkyrie.yoctoproject.org/#/builders/18/builds/61/steps/=
12/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://valkyrie.yoctop=
roject.org/#/builders/18/builds/61/steps/12/logs/stdio</a><br>
<br>
The build is still ongoing.<br></blockquote><div><br>Tomorrow=C2=A0I will t=
ake a look at this and will try to fix it.<br><br>Thanks=C2=A0<br><br>Jose<=
br>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--0000000000007f0614061c5c6775--

