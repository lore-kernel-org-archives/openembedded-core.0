Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E250D3B990
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 14:11:53 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.46870.1732630311037863575
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 06:11:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oJMKyc6F;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9D8D02000B;
	Tue, 26 Nov 2024 14:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732630309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9/0tIiwgu0XCtj1B9MQx7S2bZnvytu+RuGWQjX3pNVE=;
	b=oJMKyc6F23GrhdtTBokzFO4AgiZ3g4wbyeY+qV/L+TYTP23OTRDGh5GMy0OMuRIpH9mcpG
	hjB9IYCJbcBFcmktInqh+FRAM64WHa5yHLBXTY65eOvlGqyL+P20FVTiazWKvsqwTYhRoF
	7nduZdv/sJRRvSckLqbHPmJnZNt8w+TQZYZpiKUFbby9j3IGHxrnFpzdPbCU2gZLJlcwqI
	KsxuamJYIhBlRum+oUt5tXsS3DVwMIxnnGKT0XuqqZXyfhEx5JPXSFPId+9Ubx5hY1KAl0
	BTspwKPrDalBBcfjhSPTTrw4g2OESHtSMJnBMq5h9oMdJ0nvcN5G12zOTeUweQ==
Message-ID: <d4102dba59d94d0253b0ccfb56daaaef8a48decf.camel@bootlin.com>
Subject: Re: [OE-core] conflict between tcl8 and tcl
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: alex.kanavin@gmail.com, wangmy@fujitsu.com
Cc: thomas.perrot@bootlin.com, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Nov 2024 15:11:47 +0100
In-Reply-To: <CANNYZj82P1RMCicKPN5z9gvwbcVJgzXrVp7F09UbfFXok0ob-Q@mail.gmail.com>
References: 
	<TYWPR01MB11861AA75103D416B518D1CEEDC2F2@TYWPR01MB11861.jpnprd01.prod.outlook.com>
	 <CANNYZj82P1RMCicKPN5z9gvwbcVJgzXrVp7F09UbfFXok0ob-Q@mail.gmail.com>
Autocrypt: addr=thomas.perrot@bootlin.com; prefer-encrypt=mutual;
 keydata=mQGNBF+/ZOUBDAC2DghCjZvmgYcve02OG7dGZ7Iy58uEwne3LB7w7nRwdAxKw7ZaiVqwY
 O+yNGVi+GVx7oA6Wn4pv46z+QDRLQiq6OseuXhkSGCg7U/yBCUq12B/GRGO1Qt2Qi1mJJT1s+1qZ5
 Gxv6Nypz9qKVn94GM2bR1hXBga0t87vBpebThOHmX5d/0dqIcVxRCM7onNb0dDyRoVgLS5rBhQzrL
 CMrJaCy39xZUy0J1SOlH4Mgk6EhJIPYY4wlzikGX6urg+Tc9EjGd78ry0e0p5U5qgjFR5QGJDy1Gn
 U3CfwbT9sowdCASDbQDUoltlv2iWJCLa0xl97KVchCa0pr7HKbFA3J5SLKqFYUBCkFL+5WudYlz2n
 XxiUgyviMQxyK+ij66kEi6/2zFDAecd43pHV7790ptqZBC3Jc67Emj7Vo3ShX6RXPPxxbeCTOF2uk
 I45aJ9XcVFH/MFE96NjXj8uahnIsiTPyuCUoJu8tj7TSQyue874qJqVQvqlFyt2aZYJZ8ruq8AEQE
 AAbQpVGhvbWFzIFBlcnJvdCA8dGhvbWFzLnBlcnJvdEBib290bGluLmNvbT6JAc4EEwEIADgCGwMF
 CwkIBwIGFQoJCAsCBBYCAwECHgECF4AWIQSHQHfGpqMKIwOoEiGfwAsFcf4K7QUCX79mdwAKCRCfw
 AsFcf4K7fhbC/wP0kSl6id2E/K3+UdXk6CLMVRbCFLCREzQs5WFpQ6l/I0WGOamhrOgegdszheiVF
 orlUP8d37XSpFAqydhKGaN78V5Dps0Wmwm4lIlS4MtQXJtSLUHXDJLIZLW0pw8tiPLKsd1o/yDkXE
 dnpsjJTRG6SdDSHnyOB2/gh4p+yTaLytFdARk/r4/P26+L+FiH0fFl+RnBt19LPklfKgeDc7GwIif
 ja+nIWpp3W23DAUuI6xduEut25Q89yu7Ci8CliLfAiLy9bIGjBQWU2Y+1/j/7KuPj6VbBsZWLTZY0
 hUmpJSTnWAqc9SMsNxo7NSQuddgviz5e2tqucaRqxP02FGzNa8U4NAKdWaXrlHG5Dglj9XH0DK+SH
 +c96qqFewYD8VPQ6XAGxQcXbrtJmiMor1R2DfziispLRvJcfYs8xqabbCtoS3ouXB9XRi8hn7A2kh
 ME1ryS+Oh63JshXHnw6bmjCpVd/p+fGLIGU6A47pJOpviKR4jEO84pl2ejtDZ3Tc=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-bi48MebarxQBbIypzkOy"
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41) 
MIME-Version: 1.0
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 14:11:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207853


--=-bi48MebarxQBbIypzkOy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, 2024-11-26 at 12:18 +0100, Alexander Kanavin via
lists.openembedded.org wrote:
> On Tue, 26 Nov 2024 at 03:46, wangmy via lists.openembedded.org
> <wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
> > There're lots of conflicts between tcl8-doc and tcl-doc.
> > Currently considering two modification options:
> > 1. Using priority to resolve the conflict. For example, set the
> > priority of tcl to be high and setting the priority of tcl8 to be
> > low
> > 2. Rename the directory where the conflicting files of tcl8 are
> > located, such as adding the tcl8 version number, to distinguish it
> > from tcl
>=20
> I think option 2 is a better one. What is the reason for installing
> both though?
>=20

I have prepared a patch that replaces the suffix 'tcl' with 'tcl9'.
Both are installed because 'expect' depends on 'tcl8'.

Kind regards,
Thomas Perrot

> Alex
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207847):
> https://lists.openembedded.org/g/openembedded-core/message/207847
> Mute This Topic: https://lists.openembedded.org/mt/109784335/5443093
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


--=-bi48MebarxQBbIypzkOy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmdF1yMACgkQn8ALBXH+
Cu3aLgwAlptMd/RPHgPew5QLhYWgTEiHN7HZJZDvTKK8s27aQ9DCj/thXlYMw0ut
huCWTKqRCySR+DwHkS/BosXeP+jzdiad4e0t2z5yMVpfQ0sYt+xz4pN9NkxyYpeu
uvYgnjE+JPtG49tK/21Zi9Td/UKosAg5uDhl0RUxbCfKevnXamkLmCcFR7T+2uyo
jhT+aUoH1mEUOr1wQ9xm1tEq5esTWpBPxY4NsG+fDQuFAfaNVHuONlveAB/olSwg
oRfAbGB94HE5P4vBNiTzZ/zBzHDvpCqfc5kNu6BtuqPG8ojdkaJs/I2XvXQEiD1L
OFahxncx6g686xGayh5ugobLi4siYizRV+Na4c1BaHd7KFfuhRI+HCg4wgYnqj7j
xsfQby8zfeI3iR6klZkg+bn5ZjcpDu+Q1nrMHQzrgttTGaEmG/mppacx0eeYRofp
AZgKR6VD7g8iTGlFJjDJTAOs1Dmbl3Yb+9lONg0bVh6pSbf+ewNyDmliNGlvf6b8
IglTfZUP
=0z4E
-----END PGP SIGNATURE-----

--=-bi48MebarxQBbIypzkOy--

