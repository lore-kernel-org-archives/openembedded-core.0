Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B30EFC433FE
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 09:50:27 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web09.3944.1665049819096927285
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Oct 2022 02:50:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XM4rfmct;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200,
 mailfrom: thomas.perrot@bootlin.com)
Received: (Authenticated sender: thomas.perrot@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D13FE2000D;
	Thu,  6 Oct 2022 09:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665049817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=szjUAt141oFyRBoLTeGuTNGGbAtQbgl6txDjdqMbiFs=;
	b=XM4rfmctULc1OpNDsfMqxz0+pn/ijcnaZPFDR8/za1jKsuoOZQ8Sl6fca0cn8zvnlPHSXZ
	CpMIg9uiEdW3nUC7vgKaSPwyXUQbvDympoBr8Bnruag2zdK2OE9TOewE2PRWXlVCE8qHmr
	MwXsfnPn1oHfhkKLqL5HSUi0gACLd4vOUCceLQFiuxPDOVQ7OwRM4oHwSK6F+3iAdyRBIe
	CWv2+sUzH4yG37p5wnRz/pfP+UPIvUIo6NtFsZSzUVLCqDPWqxuZ/VF81yH4Yx5Z6o2/hF
	quy5DS30YuABxPNDXqSHc7lqrH2SacdELLka1J8qZdHjBnJAquFCHfkktEKhUw==
Message-ID: <70cf0d217d5f78a7a8d9c358cad8f586078bfec1.camel@bootlin.com>
Subject: Re: [OE-core][PATCH] core-image-sato: install virtio input for Qemu
 targets
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org,
  Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 06 Oct 2022 11:50:15 +0200
In-Reply-To: 
 <CADkTA4Nh6uWd1H5LxSRCNiPzh3LJM3yS4bwZa2VZSgWN7rbVbA@mail.gmail.com>
References: <20221005150138.2538539-1-thomas.perrot@bootlin.com>
	 <CAMKF1sps-=A9OpQK86jX=EkYDVxWVfabD84G27+75VdMiguJHg@mail.gmail.com>
	 <3a9e20001ec3677f73b451708c0932d7daf4f838.camel@bootlin.com>
	 <CADkTA4Nh6uWd1H5LxSRCNiPzh3LJM3yS4bwZa2VZSgWN7rbVbA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-N1N8AH2MilbD8AHWgOhN"
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Oct 2022 09:50:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171488


--=-N1N8AH2MilbD8AHWgOhN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Bruce,

On Wed, 2022-10-05 at 13:19 -0400, Bruce Ashfield wrote:
> On Wed, Oct 5, 2022 at 12:51 PM Thomas Perrot via
> lists.openembedded.org
> <thomas.perrot=3Dbootlin.com@lists.openembedded.org> wrote:
> >=20
> > Hello Khem,
> >=20
> > On Wed, 2022-10-05 at 09:19 -0700, Khem Raj wrote:
> > > On Wed, Oct 5, 2022 at 8:01 AM Thomas Perrot via
> > > lists.openembedded.org
> > > <thomas.perrot=3Dbootlin.com@lists.openembedded.org> wrote:
> > > >=20
> > > > Otherwise, it isn't possible to interact with the UI.
> > >=20
> > > I wonder if it should be in the MACHINE_EXTRA_RRECOMMENDS in
> > > machine
> > > configs, it will help a wide range of users who may be using
> > > graphical images.
> >=20
> > I hesitated to put it in MACHINE_EXTRA_RDEPENDS for Qemu targets.
> >=20
> > Currently, kernel-modules are in MACHINE_EXTRA_RRECOMMENDS of Qemu
> > RISC-V and PPC64, which are not installed when
> > NO_RECOMMENDATIONS=3D"1"
> >=20
>=20
> We don't control the kernel configuration to the point where we can
> guarantee that something is built as a module or not.
>=20
> Have you tried assembling the image with that option built-in, versus
> a module ?=C2=A0

I tried to use a built-in virtio-input on Qemu targets, so the boot
process stalled with the following message: "please wait: booting..."
Then it seems necessary to use this driver as a kernel module on Qemu
targets.

Kind regards,
Thomas

> Last I checked, a kernel-module* dependency won't be
> provided by the built-ins, and this will trigger an error.
>=20
> With that option appended, it isn't something that can be overridden
> easily, and the qemu* + core images are used as a starting point for
> demos, etc (whether or not that is a good idea is also debatable). If
> a non-core kernel provider and qemu are used in a scenario like that
> .. they can trigger the error.
>=20
> Bruce
>=20
> > Kind regards,
> > Thomas
> >=20
> > >=20
> > > >=20
> > > > Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> > > > ---
> > > > =C2=A0meta/recipes-sato/images/core-image-sato.bb | 2 ++
> > > > =C2=A01 file changed, 2 insertions(+)
> > > >=20
> > > > diff --git a/meta/recipes-sato/images/core-image-sato.bb
> > > > b/meta/recipes-sato/images/core-image-sato.bb
> > > > index e63a229d1257..0e37c15097b3 100644
> > > > --- a/meta/recipes-sato/images/core-image-sato.bb
> > > > +++ b/meta/recipes-sato/images/core-image-sato.bb
> > > > @@ -12,6 +12,8 @@ inherit core-image
> > > > =C2=A0TOOLCHAIN_HOST_TASK:append =3D " nativesdk-intltool nativesdk=
-
> > > > glib-
> > > > 2.0"
> > > > =C2=A0TOOLCHAIN_HOST_TASK:remove:task-populate-sdk-ext =3D "
> > > > nativesdk-
> > > > intltool nativesdk-glib-2.0"
> > > >=20
> > > > +IMAGE_INSTALL:append:qemuall =3D " kernel-module-virtio-input"
> > > > +
> > > > =C2=A0QB_MEM =3D '${@bb.utils.contains("DISTRO_FEATURES", "opengl",=
 "-
> > > > m
> > > > 512", "-m 256", d)}'
> > > > =C2=A0QB_MEM:qemuarmv5 =3D "-m 256"
> > > > =C2=A0QB_MEM:qemumips =3D "-m 256"
> > > > --
> > > > 2.37.3
> > > >=20
> > > >=20
> > > >=20
> > > >=20
> >=20
> > --
> > Thomas Perrot, Bootlin
> > Embedded Linux and kernel engineering
> > https://bootlin.com
> >=20
> >=20
> >=20
> >=20
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171473):
> https://lists.openembedded.org/g/openembedded-core/message/171473
> Mute This Topic: https://lists.openembedded.org/mt/94137249/5443093
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> thomas.perrot@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


--=-N1N8AH2MilbD8AHWgOhN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmM+pNcACgkQn8ALBXH+
Cu3byAv7BnYhVWnTKfCQGPoz0L864aiN40UlxjfjVHRutH5BJVgLDEUa/m+9J7UI
lxvygNprRTwp2r8UW8Rh317aShJcimbfznThjv2ExoQFVwFMwcpOEc6ELnk53K4g
wXmPdIQw30MlbCnm0tlXoHCACdfAAXV+l3bHx9FgXozmYCLHh2msuNeDWWH7p/Ur
2cfT5JxkP3bObC/sjZD48+6xDPRoWDb5g3NTEDsZOfs8oV/s5RxrWkOioKn93wpc
YYIeZmQX8A9jTvtCLGNnYCO8rB2ebKhQWSMBPO542y41BZvnx8G2LqbvKUYv3hJO
jQ5Fin52EY5F1NVwSfkCoe8j9KW4wpeKLKjbOM1Eni7Q51ZlCqXDImdi+WO+EUvM
zucGFF43vERDQl+CpEtO+w+/RWsRKl/MrWG+2yZQKEGan85n9n4N5sp4PAkKwl75
Pl9v5fwqMxJm/eliFV7oDwyaVQl1CKOK/OBMQM+SKIvKvkboiNd8ReRUNDbFySHD
pQAWxIph
=Wmsy
-----END PGP SIGNATURE-----

--=-N1N8AH2MilbD8AHWgOhN--

