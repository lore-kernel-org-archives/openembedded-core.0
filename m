Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51AAEC433FE
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 12:01:33 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web12.6507.1666785683428502085
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Oct 2022 05:01:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ONEjRd3g;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: thomas.perrot@bootlin.com)
Received: (Authenticated sender: thomas.perrot@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 365B224000D;
	Wed, 26 Oct 2022 12:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666785681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ay7I/Yx2mz1x9vsQxV30an5I71w1YsTKAebapgldZPw=;
	b=ONEjRd3gJ46W3feZ82/H0GVIapHn3obFLvjj1tYtqYOlbssAT+AoE02/HNibvTS3gpIqR2
	4T+txKBPX6/clH7Mpoo6jXEFxEtqhE4YDKngjrH4i6i09XMkr/6Z7W+MzV3ZQndEQmspCU
	MmeN/Q+r48Xq17qZE3q5sRmWagyaM9tOU7aCpPxI+Zzj18htt2RkUDGD/wcRrFNg6Om8Lt
	cjAq/7VyglmQEEX6ChdWfBjqXla3Zon2YNsgwsl/JzTb1AFdlj+uy6BwHtcJaunZGdH5kr
	e7Dd35KqQ05D365Neg4d0g4S0yRVK8VIf3H+4M6DcMb5uV4rgtuTb53I2TfcSg==
Message-ID: <de91c8a8a867021ba226c9da0ea4e59bffdbf176.camel@bootlin.com>
Subject: Re: [OE-core][PATCH] qemu.inc: add virtio input in required
 dependencies
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 26 Oct 2022 14:01:20 +0200
In-Reply-To: <2e7e3bf799fede599c134d21bed5fca3921cbc6b.camel@linuxfoundation.org>
References: <20221018093227.3753321-1-thomas.perrot@bootlin.com>
	 <2e7e3bf799fede599c134d21bed5fca3921cbc6b.camel@linuxfoundation.org>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-z7lhvtdyekF12O9bGEQ4"
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 12:01:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172151


--=-z7lhvtdyekF12O9bGEQ4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Richard,

On Wed, 2022-10-26 at 12:14 +0100, Richard Purdie wrote:
> On Tue, 2022-10-18 at 11:32 +0200, Thomas Perrot via
> lists.openembedded.org wrote:
> > From: Thomas Perrot <thomas.perrot@bootlin.com>
> >=20
> > Otherwise, it isn't possible to interact with the UI of images
> > that provide graphic support.
> >=20
> > This issue only occurs when NO_RECOMMENDATIONS =3D "1" for Qemu
> > targets which are kernel-modules in MACHINE_EXTRA_RRECOMMENDS.
> >=20
> > Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> > ---
> > =C2=A0meta/conf/machine/include/qemu.inc | 2 ++
> > =C2=A01 file changed, 2 insertions(+)
> >=20
> > diff --git a/meta/conf/machine/include/qemu.inc
> > b/meta/conf/machine/include/qemu.inc
> > index 0d71bcbbad0d..dabe7ed8f386 100644
> > --- a/meta/conf/machine/include/qemu.inc
> > +++ b/meta/conf/machine/include/qemu.inc
> > @@ -10,6 +10,8 @@ XSERVER ?=3D "xserver-xorg \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 xf86-video-fbdev \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "
> > =C2=A0
> > +MACHINE_EXTRA_RDEPENDS +=3D "kernel-module-virtio-input"
> > +
> > =C2=A0MACHINE_FEATURES =3D "alsa bluetooth usbgadget screen vfat"
> > =C2=A0
> > =C2=A0MACHINEOVERRIDES =3D. "qemuall:"
>=20
> This will fail if the kernel has the module built in - kernel modules
> are always recommends for that reason. We'll have to find a different
> solution I'm afraid.

When this kernel module is built in, so the Qemu boot process stalled:
"please wait: booting..."
For this reason, is the proposed solution acceptable?

Kind regards,
Thomas

>=20
> Cheers,
>=20
> Richard
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172150):
> https://lists.openembedded.org/g/openembedded-core/message/172150
> Mute This Topic: https://lists.openembedded.org/mt/94404446/5443093
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


--=-z7lhvtdyekF12O9bGEQ4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmNZIZAACgkQn8ALBXH+
Cu2gFAv/dO2g8jBOgvoiuamB/Yvutk/126k+/F38wObp/N86C94C2zYzBi6f2wCA
dCS3+RQRciiSct4fJrSvc1MhxOfngZgD/0yPzPPvzr107vRmp2VGoPKzBTZjYbTN
V62zQEIy2GRJi1ixo0ztUBlGtVGTBYpzVxp9zIe7MiXyv9LX/Bd3V8cKB+kBm7c7
WNiV8k6LzTQ9SByySeq+URVPWun7MG4XZr0owBZlVMBuhXAFHQLxjYKz+0RK8von
Byvp179j9PG59OA49HsabZuZx20cBoPdy/XlidBoJE9Y3b7GXyI14LVGUfXPFtYE
/fZacGcYphkyeLZKdaAJwMJeT3zatCY2B47ocnU7iyFPWzDLldiPytQhz9oXsHuU
OM2BF2Dybqxd7WykEzMCss2D6eqaDGRZCfuLlo1OtuEKi1o9wGVTFz2D15nuhy51
RTqQ2lpAyLE0tRXOuFUKQJw/4xcaJdD573KfsiJ9Cq7SvmE21Cr2/o5yRNGbge7t
2D2QysGf
=V2qh
-----END PGP SIGNATURE-----

--=-z7lhvtdyekF12O9bGEQ4--

