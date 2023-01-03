Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A07EDC53210
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 16:50:12 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.69019.1672764607431765637
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jan 2023 08:50:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EaaVyPM0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so21271770wmb.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 08:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/oqpRpDuSRf21YtLO/W9AQ4tVbZxWnbjKKtAdj1oFo8=;
        b=EaaVyPM0U/EFBwzaz1GO/Uiirji2CfczgHCMSbIEEwCVhGw+8y3sX5ieX6LxmoVntN
         m4s45oC5zpm+Hye7sLMEWUOTy9eGuub+Ng5mQl5ScL/zeian21HNYZ81NusZ737pmUUZ
         +ZPIaQm8EPERuu+m0/iRgoPWE3JsHzdkeTJ9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/oqpRpDuSRf21YtLO/W9AQ4tVbZxWnbjKKtAdj1oFo8=;
        b=DXDJesjyWcSL4fuynssKJ1TFEhFjM5G7TF3kfC6tpgb2azr+et2EPRhLZz5pSQKs5l
         jjzLw1V13r7+mqUwH/CvJ0olqDClqrZuJljTR82Z6rAqEoGiGrhQBCbyaLcZkchQo2R4
         uk7E1nFOM9crQ5q2PjMSIE3DapGH5pcFZShTVivN9cKupcHSkNSu+B8UWSyWQ/S+GKj2
         gGJyGb53Lv78fxGVBSR5J0ixaOLDhh0TouIijJiC+eVtZhSNnA5wsYxOu3Y1gKaK6Mln
         zwKLVmDatwy8D0ICtqvY/QE5iFZLzIgrzZCTLYuylvyYBBnfjGCglVg425hxJs20ouE8
         PqVg==
X-Gm-Message-State: AFqh2kqen/OCw/TlV494erPZd6inSVOeCZN7E0MVqG6O6xigJjz0mVkK
	Bw7kpYa/FknntS0fxw1qDUQOkQ==
X-Google-Smtp-Source: AMrXdXthERG2tEnvcNvGfoYYPyDqwArJgHhoWZ2UVdGqjDJGfNhrcJJBteBxmsu9EenpGY5cDMeGuw==
X-Received: by 2002:a05:600c:a4e:b0:3d1:baf7:ceae with SMTP id c14-20020a05600c0a4e00b003d1baf7ceaemr31623762wmq.39.1672764605790;
        Tue, 03 Jan 2023 08:50:05 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:d934:7269:d594:9ac2? ([2001:8b0:aba:5f3c:d934:7269:d594:9ac2])
        by smtp.gmail.com with ESMTPSA id q2-20020a1cf302000000b003d1cc0464a2sm42549481wmq.8.2023.01.03.08.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 08:50:05 -0800 (PST)
Message-ID: <919d75f731314ea5c9081194a6c2a41f23991a69.camel@linuxfoundation.org>
Subject: Re: [OE-core] Struggling to get QEMU sound working on
 core-image-base
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Jonas <toertel@gmail.com>, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 03 Jan 2023 16:50:04 +0000
In-Reply-To: <CAEE5dN1TENw=V_29LjifF6a3ns5cvXzPtqsKywveOSJc7dZe3Q@mail.gmail.com>
References: <1736893AC5253C05.4716@lists.openembedded.org>
	 <CAEE5dN1TENw=V_29LjifF6a3ns5cvXzPtqsKywveOSJc7dZe3Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 16:50:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175362

On Tue, 2023-01-03 at 14:29 +0100, Mark Jonas wrote:
> Hi,
>=20
> > I have difficulties getting core-image-base and QEMU x86-64 sound
> > output working. I do not even get to the point of having a visible
> > ALSA sound device.
> >=20
> > What part of the puzzle am I missing?
> >=20
> > Alternatively, can someone point me to a (simple) YP image where sound
> > works with QEMU x86 or x86-64?
> >=20
> > I built a core-image-base image from latest YP Poky [dunfell,langdale]
> > with the following additions in a default local.conf:
> >=20
> > MACHINE =3D "qemux86-64"
> >=20
> > # Load kernel modules matching QEMU audio support
> > KERNEL_MODULE_AUTOLOAD +=3D "snd-ens1370"
> >=20
> > # Check ALSA cards available
> > IMAGE_INSTALL:append =3D " alsa-utils"
> >=20
> > EXTRA_IMAGE_FEATURES +=3D "debug-tweaks"
>=20
> I was able to solve part of the riddle. Now I am wondering whether I
> hit a bug in the meta/conf/machine/qemux86*.conf files.
>=20
> The conf/machine/qemux86*.conf recommends the installation of the
> snd-ens1370 module.
> (since https://git.openembedded.org/openembedded-core/commit/?id=3D112775=
995158cf6c504fd6beef345ee446f4f11d)
>=20
> MACHINE_EXTRA_RRECOMMENDS =3D "kernel-module-snd-ens1370
> kernel-module-snd-rawmidi"
>=20
> Thus, I assumed that (as suggested by
> https://docs.yoctoproject.org/dev-manual/qemu.html) QEMU would create
> an ENS1370 device.
>=20
> - ``audio``: Enables audio in QEMU. The MACHINE option must be either
> "qemux86" or "qemux86-64" in order for audio to be enabled.
> Additionally, the ``snd_intel8x0`` or ``snd_ens1370`` driver must be
> installed in linux guest.
>=20
> Actually, the sound device in the virtual machine is an Intel 8x0 type.
>=20
> root@qemux86-64:~# lspci
> [..]
> 00:04.0 Multimedia audio controller: Intel Corporation 82801AA AC'97
> Audio Controller (rev 01)
> [..]
>=20
> After installing the snd-intel8x0 module into the image and adding it
> to the auto-loaded modules, I can finally see an ALSA card.
>=20
> IMAGE_INSTALL:append =3D " kernel-module-snd-intel8x0"
> KERNEL_MODULE_AUTOLOAD +=3D "snd-ens1370 snd-intel8x0"
>=20
> (see https://gitlab.com/toertel/meta-qemusound)
>=20
> root@qemux86-64:~# cat /proc/asound/cards
>  0 [I82801AAICH    ]: ICH - Intel 82801AA-ICH
>                       Intel 82801AA-ICH with STAC9700,83,84 at irq 20
>=20
> Then, isn't it a bug in the meta/conf/machine/qemux86*.conf files that
> (only?) the kernel-module-snd-ens1370 is recommended? Shouldn't the
> kernel-module-snd-intel8x0 be recommended (additionally?)?
>=20
> Staying in line with the Poky QEMU documentation I offer to send a
> patch which adds kernel-module-snd-intel8x0 to
> MACHINE_EXTRA_RRECOMMENDS of the meta/conf/machine/qemux86*.conf files.
>=20
> Shouldn't then also linux-yocto.inc be amended such that the
> KERNEL_MODULE_AUTOLOAD is set in case it is a qemux86* kernel and the
> DISTRO_FEATURES contain alsa?
>=20
> ALSA_MODULES =3D "${@bb.utils.contains("DISTRO_FEATURES", "alsa", "
> snd-ens1370 snd-intel8x0", "", d)}"
> KERNEL_MODULE_AUTOLOAD:qemux86 +=3D "${ALSA_MODULES}"
> KERNEL_MODULE_AUTOLOAD:qemux86-64 +=3D "${ALSA_MODULES}"

Thanks for debugging this, please do send some patches as we should fix
this. Without having gone into the details the direction sounds right
to me.

Cheers,

Richard


