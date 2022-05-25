Return-Path: <ernstp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70C97C433EF
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 10:04:15 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web10.5013.1653473045577351912
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 03:04:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UCZpO7gu;
 spf=pass (domain: gmail.com, ip: 209.85.166.176, mailfrom: ernstp@gmail.com)
Received: by mail-il1-f176.google.com with SMTP id v7so926046ilj.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 03:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fPxM53BC81r8mLVadqPoIZe9V+6rOSyHDSjrrL/oaxY=;
        b=UCZpO7gu6LFA1gcXsPDKiKtVQ9RglD29gNuN2RyL7A7uj5QuZD9xCSeN/IGYQuoCq0
         dGwQR8AcoqnSn4b3YxMJTphGayoOFj22fpmUA3QC7etOtDlLOEqCnggW5aHRDBk/jcmm
         7E3vVk1KX/Kd6bcl6jj9eu+qOQpDpREcRZhxkodPHRhSvYnkhT9FjvMTr+Nz7AVV7wyX
         uKboFJioL4KNk3RDggqWE2jbiz+c4kRK9qGOPJ20NCSgiAKH0qP2eru05gdgyliCftgv
         MMDeTj81NKSpRq6Y6hY4eSjF4MLjdlhLZ7zWV3dAbKIuFyAZMeH/khbbEFMc8ZssR1YU
         hqQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fPxM53BC81r8mLVadqPoIZe9V+6rOSyHDSjrrL/oaxY=;
        b=BPwCLDAInq3yddnyoSZF5wgqvaDnbi+2YuxHM2PIUPAz37U6kQFEGz4Zqmz7JWzQ1s
         WrbfotBiFqHsXPAvHqzmiZBrUReL9a0KLvOX2ZYadGPM9fOTKs9uLhuc2//gBO6UMxHh
         YUREbpcFSd099eD7MlHCXMoPjpgYmIw4Ma4ODsvQBhSplxLm5MlD2teSX37HjFysnNf4
         ukbJpkUpXZEPUy9Vlo9Jo7CPkHtpzC1xBDyA76KUlp0Kl+UL0WBrxqQTOIOtjlg2u3SV
         OouwPPIoxfrjLH8KxxEOPyumYNaBpmjRIUfDRF8kjU3Xiq27Bq7p/PxOScBu9oh2s8T1
         PQHA==
X-Gm-Message-State: AOAM530IeyANKQhgjsmmOZQIgSawAUq4AOsi5b/nkMLz/vjRc6mSRioU
	QlAnwi1PnQD/TAupcT5dbudc41eXVo5CPeQfAPc=
X-Google-Smtp-Source: 
 ABdhPJy3Sgyx6FJBBW+ci8O9Tnx3UoF8A8XvldlHp9RFlBjIuH0fqw01//o3a1EHR8O+91QCJ7Hpkrfb8tTx6GCXUnQ=
X-Received: by 2002:a05:6e02:1d01:b0:2d1:5bd4:c021 with SMTP id
 i1-20020a056e021d0100b002d15bd4c021mr16031271ila.61.1653473044929; Wed, 25
 May 2022 03:04:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220524115021.38862-1-ernstp@gmail.com>
 <20220524115021.38862-2-ernstp@gmail.com>
 <CAApg2=SOhYpjtM+cM-QwLfmuHXH=afPHrVABE3K590_nqKdODQ@mail.gmail.com>
In-Reply-To: 
 <CAApg2=SOhYpjtM+cM-QwLfmuHXH=afPHrVABE3K590_nqKdODQ@mail.gmail.com>
From: =?UTF-8?Q?Ernst_Sj=C3=B6strand?= <ernstp@gmail.com>
Date: Wed, 25 May 2022 12:03:53 +0200
Message-ID: 
 <CAD=4a=WCK5e7HZYSRsbMutu7Ka1hC_0UdezNfkc96DQRucDAdw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] cve-check: Only include installed packages
 for rootfs manifest
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000007d237a05dfd331ee"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 10:04:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166112

--0000000000007d237a05dfd331ee
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

it will not miss any installed package that Yocto knows about, i.e it will
be exact compared to the rootfs.manifest and so on.
There are of course ways to "fool" it like bundling a copy of a library in
another project and similar things.
And I think statically linked libraries are not really handled by Yocto
here either, they don't show up in the rootfs.manifest or the COPY_LIC_*
stuff either for example.

Regards
//Ernst

PS. My patch didn't show up on Patchwork?

Den ons 25 maj 2022 kl 11:42 skrev Marta Rybczynska <rybczynska@gmail.com>:

> On Tue, May 24, 2022 at 1:50 PM Ernst Sj=C3=B6strand <ernstp@gmail.com> w=
rote:
> >
> > Before this the rootfs manifest and the summary were identical.
> > We should separate the summary and rootfs manifest more clearly,
> > now the summary is for all CVEs and the rootfs manifest is only for
> > things in that image. This is even more useful if you build multiple
> > images.
> >
> > Signed-off-by: Ernst Sj=C3=B6strand <ernstp@gmail.com>
>
> > +    for pkg in list(image_list_installed_packages(d)):
>
> Thank you for submitting a new version of this patch. The references
> posted on IRC suggested that using this way may cause us to skip
> packages that should be included. Or I did misunderstand?
>
> Kind regards,
> Marta
>

--0000000000007d237a05dfd331ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">Hi,</div><div class=3D"gmail_default" style=3D"font-fam=
ily:arial,helvetica,sans-serif"><br></div><div class=3D"gmail_default" styl=
e=3D"font-family:arial,helvetica,sans-serif">it will not miss any installed=
 package that Yocto knows about, i.e it will be exact compared to the rootf=
s.manifest and so on.</div><div class=3D"gmail_default" style=3D"font-famil=
y:arial,helvetica,sans-serif">There are of course ways to &quot;fool&quot; =
it like bundling a copy of a library in another project and similar things.=
</div><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,san=
s-serif">And I think statically linked libraries are not really handled by =
Yocto here either, they don&#39;t show up in the rootfs.manifest or the COP=
Y_LIC_*</div><div class=3D"gmail_default" style=3D"font-family:arial,helvet=
ica,sans-serif">stuff either for example.</div><div class=3D"gmail_default"=
 style=3D"font-family:arial,helvetica,sans-serif"><br></div><div class=3D"g=
mail_default" style=3D"font-family:arial,helvetica,sans-serif">Regards</div=
><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-ser=
if">//Ernst</div><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif"><br></div><div class=3D"gmail_default" style=3D"font-fa=
mily:arial,helvetica,sans-serif">PS. My patch didn&#39;t show up on Patchwo=
rk?<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">Den ons 25 maj 2022 kl 11:42 skrev Marta Rybczynska &lt;<a hre=
f=3D"mailto:rybczynska@gmail.com" target=3D"_blank">rybczynska@gmail.com</a=
>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, M=
ay 24, 2022 at 1:50 PM Ernst Sj=C3=B6strand &lt;<a href=3D"mailto:ernstp@gm=
ail.com" target=3D"_blank">ernstp@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Before this the rootfs manifest and the summary were identical.<br>
&gt; We should separate the summary and rootfs manifest more clearly,<br>
&gt; now the summary is for all CVEs and the rootfs manifest is only for<br=
>
&gt; things in that image. This is even more useful if you build multiple<b=
r>
&gt; images.<br>
&gt;<br>
&gt; Signed-off-by: Ernst Sj=C3=B6strand &lt;<a href=3D"mailto:ernstp@gmail=
.com" target=3D"_blank">ernstp@gmail.com</a>&gt;<br>
<br>
&gt; +=C2=A0 =C2=A0 for pkg in list(image_list_installed_packages(d)):<br>
<br>
Thank you for submitting a new version of this patch. The references<br>
posted on IRC suggested that using this way may cause us to skip<br>
packages that should be included. Or I did misunderstand?<br>
<br>
Kind regards,<br>
Marta<br>
</blockquote></div>

--0000000000007d237a05dfd331ee--

