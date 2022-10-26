Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 527C4C433FE
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 12:05:13 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.6736.1666785906352427541
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Oct 2022 05:05:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dw78i59u;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id j15so15428248wrq.3
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 05:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K18z5rjoeX2bwr2h+tTErV3EGFB4Ohpl8Q0jO+geCNI=;
        b=dw78i59uT2bucEc0zKVTZi1ImwqpEs94S4T4aZhVSgH4gGk7owbpDQ7X+WDwcSNYhz
         l8ViITKW5bpTPwewJM9Di48w17PhhcEEFcYlLbs8m4hXOl9wzqKTu6N6/N+2DKpiRBdw
         Cos7FS69OTWSaBoVkOEk4l4IopRKrCwQgThHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K18z5rjoeX2bwr2h+tTErV3EGFB4Ohpl8Q0jO+geCNI=;
        b=jlnOE6S2Ll0kjy3zCFxorfSzoWtDVPzp/O+SxO7s/hWcSxeSMLXrrQgA0Q23E7rPdM
         hBU6wNzTrY4lBibKuFSWOZb1aJeDK1V3OLpKsx64dPtkLDnANg/QbO3lGQ1Jp/ZvQZlE
         aooFfPV7HEp+XHcyNliB0VLHTRNwtemU0KpESa2Jc5pF/ObMqBVLGm70GaCmWBZ57/VP
         Arup5KcAmk3GbuzxQONsfQYjpPcggBgQqekN1eALmxxJIpnqFO+W0ChkRaIFjsa/2Ptx
         4ld4S96Ts42xrw4IcQwApkPhlJlNsNo2LLMWRjOhDuwd7bgBZeWM3X0tt1Xxj6KWEDkV
         CzEQ==
X-Gm-Message-State: ACrzQf0JXRlVY8rYd55XpqJ786WflwMtf91VsnopFRDCKpr08GrJVvDn
	0LSfcscG3zJxGePXbMidT6n4Uw==
X-Google-Smtp-Source: AMsMyM5IAFwxB+vFo1wiqIiLXM8Ne7tYQ2bcKaMvZHani3+sbyZA+nVCvETQGhjPixsU2QJ76hrHsA==
X-Received: by 2002:a5d:6d06:0:b0:232:b56c:e5c3 with SMTP id e6-20020a5d6d06000000b00232b56ce5c3mr27389875wrq.506.1666785904714;
        Wed, 26 Oct 2022 05:05:04 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:bd65:7511:b73b:c094? ([2001:8b0:aba:5f3c:bd65:7511:b73b:c094])
        by smtp.gmail.com with ESMTPSA id n185-20020a1ca4c2000000b003c6f3f6675bsm1656243wme.26.2022.10.26.05.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 05:05:04 -0700 (PDT)
Message-ID: <86df6c0c11e5881c968b1cfc6c4cfa04f1ca3835.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] qemu.inc: add virtio input in required
 dependencies
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Thomas Perrot <thomas.perrot@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 26 Oct 2022 13:05:03 +0100
In-Reply-To: <de91c8a8a867021ba226c9da0ea4e59bffdbf176.camel@bootlin.com>
References: <20221018093227.3753321-1-thomas.perrot@bootlin.com>
	 <2e7e3bf799fede599c134d21bed5fca3921cbc6b.camel@linuxfoundation.org>
	 <de91c8a8a867021ba226c9da0ea4e59bffdbf176.camel@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 12:05:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172152

On Wed, 2022-10-26 at 14:01 +0200, Thomas Perrot wrote:
> Hello Richard,
>=20
> On Wed, 2022-10-26 at 12:14 +0100, Richard Purdie wrote:
> > On Tue, 2022-10-18 at 11:32 +0200, Thomas Perrot via
> > lists.openembedded.org wrote:
> > > From: Thomas Perrot <thomas.perrot@bootlin.com>
> > >=20
> > > Otherwise, it isn't possible to interact with the UI of images
> > > that provide graphic support.
> > >=20
> > > This issue only occurs when NO_RECOMMENDATIONS =3D "1" for Qemu
> > > targets which are kernel-modules in MACHINE_EXTRA_RRECOMMENDS.
> > >=20
> > > Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> > > ---
> > > =C2=A0meta/conf/machine/include/qemu.inc | 2 ++
> > > =C2=A01 file changed, 2 insertions(+)
> > >=20
> > > diff --git a/meta/conf/machine/include/qemu.inc
> > > b/meta/conf/machine/include/qemu.inc
> > > index 0d71bcbbad0d..dabe7ed8f386 100644
> > > --- a/meta/conf/machine/include/qemu.inc
> > > +++ b/meta/conf/machine/include/qemu.inc
> > > @@ -10,6 +10,8 @@ XSERVER ?=3D "xserver-xorg \
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 xf86-video-fbdev \
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "
> > > =C2=A0
> > > +MACHINE_EXTRA_RDEPENDS +=3D "kernel-module-virtio-input"
> > > +
> > > =C2=A0MACHINE_FEATURES =3D "alsa bluetooth usbgadget screen vfat"
> > > =C2=A0
> > > =C2=A0MACHINEOVERRIDES =3D. "qemuall:"
> >=20
> > This will fail if the kernel has the module built in - kernel modules
> > are always recommends for that reason. We'll have to find a different
> > solution I'm afraid.
>=20
> When this kernel module is built in, so the Qemu boot process stalled:
> "please wait: booting..."
> For this reason, is the proposed solution acceptable?

Not really.=C2=A0

Is there some special reason building that module in could cause a
hang? That sounds rather like a kernel bug :(.

It would be near impossible to explain to users why some kernel modules
are reccommends and some are not which is why I don't really want to
start listing modules as RDEPENDS.

Cheers,

Richard

