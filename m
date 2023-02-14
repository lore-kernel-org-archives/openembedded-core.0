Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F27EC6379F
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 13:56:34 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.7437.1676382990832265786
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 05:56:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S4wAhetS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id m10so6824584wrn.4
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 05:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jZ9h/N6Va9UQeFEzaCntXdG7GI2N4cSEGrm2ZwWVDCY=;
        b=S4wAhetSSgOEAUPKVRw7ZL8DZHd2KyqMSuOqkUQEjLjgtpSoz9rMBzz/eH1z9Xx1BI
         vmE+Dgo9ipsu9duQJ5pnaSTQrSolCF83BxOS+L/w9ngJtZ12MXAPyEabT+2CviJEFhMK
         tVbJv42BEuA8Uowctgq5Zp62DZfMyLvV6Rb7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jZ9h/N6Va9UQeFEzaCntXdG7GI2N4cSEGrm2ZwWVDCY=;
        b=iYkJ0pAQx+X+vGASewn8w/n2iCz1ly/aj9/Aaf64FEAZbV0fS/k1TJNeeHzEcaFbA2
         Ovkx4MfZaEIrOzLYc8dbKxPmXhHo7momTLO2fWbMf3vkqyVYie1vEsoIYzSrBdcdPLJ8
         j/Yu96+8Fy03qF3oqUwdT0Z9+tenR37Tf98+Zmg4a0SU/0kmlAHH4pn1NGg4gyBh6QQv
         UMe/uVIfNMPglBfNzIAmySbwNoTcjlVcvOxAauRVgu++HheL3nhCNjFww39lSxm9Ms20
         aU2QOIVEHXtjTNmOAObQWpScPqUWHWzhPs1E0cefDVy9o1UoLOdzAjyKOg7hl5comDzG
         KFmA==
X-Gm-Message-State: AO0yUKWz//cmGyM2hFDydEIu3KR5c/Gk639/f4Wo0NcD6Qi/IHak7zz6
	x2foZ0/xxNf3m3RNKbVrGwP0yw==
X-Google-Smtp-Source: AK7set/NLemK4vZeklexV3LTIbiVqJDcwOSC5tsb2dKzcc0uLLFNSN+gSgTi9dNOupOoW04PYwqFyA==
X-Received: by 2002:a5d:518c:0:b0:2c3:f00c:ebaa with SMTP id k12-20020a5d518c000000b002c3f00cebaamr2828918wrv.4.1676382988953;
        Tue, 14 Feb 2023 05:56:28 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:22a9:5449:456e:31b7? ([2001:8b0:aba:5f3c:22a9:5449:456e:31b7])
        by smtp.gmail.com with ESMTPSA id h8-20020a05600c314800b003e11ad0750csm16895701wmo.47.2023.02.14.05.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 05:56:28 -0800 (PST)
Message-ID: <7f5ebf2315c969ce7c76d024ec373f45cc8eff3f.camel@linuxfoundation.org>
Subject: Re: [yocto] [OE-core] [PATCH 1/2] barebox: add initial support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>, Marco Felsch
	 <m.felsch@pengutronix.de>, openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de, barebox@lists.infradead.org
Date: Tue, 14 Feb 2023 13:56:27 +0000
In-Reply-To: <acf8b79c23675a2b4c7225e55e4ab369fbcf7f54.camel@pengutronix.de>
References: <20230203135011.2061939-1-m.felsch@pengutronix.de>
	 <12e370a3183d04572da1c5749d8e64dcf5091a0c.camel@linuxfoundation.org>
	 <acf8b79c23675a2b4c7225e55e4ab369fbcf7f54.camel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 13:56:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177147

On Tue, 2023-02-14 at 10:46 +0100, Enrico J=C3=B6rns wrote:
> Hi Richard,
>=20
> Am Freitag, dem 03.02.2023 um 14:17 +0000 schrieb Richard Purdie:
> > On Fri, 2023-02-03 at 14:50 +0100, Marco Felsch wrote:
> > > This adds the support for the barebox bootloader to oe-core. The reci=
pe
> > > is based on the recipe found in meta-ptx [1] with a few minor adaptio=
ns.
> > >=20
> > > This basic support includes the bootloader and the target tools to
> > > interact with the bootloader. The host tools support is not part of
> > > this commit. This will be added later on as separate recipe.
> > >=20
> > > [1] https://github.com/pengutronix/meta-ptx/tree/master/recipes-bsp/b=
arebox
> > >=20
> > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > ---
> > > =C2=A0meta/conf/documentation.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 7 +
> > > =C2=A0meta/recipes-bsp/barebox/barebox.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 123 ++++++++++++++++++
> > > =C2=A0meta/recipes-bsp/barebox/barebox_2023.01.0.bb |=C2=A0=C2=A0 5 +
> > > =C2=A0...IMAGE_COMPRESSION-per-default-to-lz4.patch |=C2=A0 40 ++++++
> > > =C2=A04 files changed, 175 insertions(+)
> > > =C2=A0create mode 100644 meta/recipes-bsp/barebox/barebox.inc
> > > =C2=A0create mode 100644 meta/recipes-bsp/barebox/barebox_2023.01.0.b=
b
> > > =C2=A0create mode 100644 meta/recipes-bsp/barebox/files/0001-pbl-set-=
IMAGE_COMPRESSION-per-default-
> > > to-lz4.patch
> >=20
> > In order to add something to OE-Core, we need to see it being used by a
> > reasonable portion of the ecosystem. Is there enough usage of barebox
> > on common boards that justifies this?
>=20
> I understand that not each and every package can and should be added to O=
E-core, so let me provide
> my view on why adding barebox could be reasonable.
>=20
> First of all, since it is a bootloader and oe-core's purpose is to provid=
e basic common recipes
> required to bring up a device, I found it to be a proper location for the=
 recipe.
> It does not add any further dependencies in the oe-core ecosystem so addi=
tional maintenance should
> be limited in scope.
>=20
> With over 300 individual contributors and regular monthly releases [1] I =
would call the barebox
> bootloader a common, stable and mature project that is around since ~2009=
 and provides support for a
> wide range of architectures, SoCs and platforms [2] including freely avai=
lable common boards like
> RPI, beaglebone, i.MX eval kits and UEFI in general.
>=20
> Ever since, barebox has also been used by different hardware vendors (e.g=
. [4]) and was chosen by
> Kalray [5] as their bootloader. Of course, as you know, it is always diff=
icult to have a reliable
> overview of the user base of an open source project as barebox.
>=20
> So far there are already a number of barebox oe recipes around [3] that I=
 find worth to consolidate
> with adding one reference recipe to oe-core.
>=20
> The question if these are sufficient arguments for adding barebox to oe-c=
ore probably needs to be
> answered by the broader community, but I found it to be a good added valu=
e to have a bootloader in
> oe-core that adapts many of the well-known schemes of Linux and focuses o=
n being developer-friendly
> and framework-driven.
> (Let me just drop [6] for those interested in a bit details on what I sum=
med up very roughly here.)

Fair enough, I'm open to the idea. It would be interesting/useful to
see if anyone else in the community is in favour of this or not. I'm
sure you appreciate why we need to ask the question and why we can't
just add everything! :)

The community usage does appear to be primarily phytec/ptx.

> > I noticed there is no maintainers entry being added so this will throw
> > QA errors on the autobuilder.
>=20
> I would take responsibility for the recipe, backed by other barebox devel=
opers here.

Ok, that helps. What about testing? I'm a bit worried that in adding
this, we'd be adding something which doesn't really get tested by the
autobuilder and is hence in an unknown state to us...

> > Also, I'm not sure adding doc varflags for individual recipe variables
> > to documentation.conf makes sense. We should probably have them in the
> > recipe or just put entries into the manual?
>=20
> To be honest, this was inspired by the UBOOT_ variables that are placed i=
n documentation.conf thus
> we assumed this could be a proper place. We can simply move them into the=
 recipe to limit intrusion
> into the rest of the oe ecosystem.

There are multiple u-boot pieces so there is a slightly different case
there but even then, I think we should likely be rethinking global
variables like that which are so specific. Sadly global content isn't
something which comes for free in bitbake. I'm not keen to add to the
problem if we don't need to.

Cheers,

Richard

