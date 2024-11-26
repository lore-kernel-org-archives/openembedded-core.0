Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44187D3B996
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 14:28:43 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.46924.1732631315472796943
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 06:28:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QnM/aYOH;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 85A97FF80D;
	Tue, 26 Nov 2024 14:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732631313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Wu/fT6p9R6H9CMwy47DVvInsUcGReAHcWBCa8DO/V94=;
	b=QnM/aYOHXoJ/a0f5ra6SRaDKZ7IjrflLxY+AC/9ZUfQ4gZxWnXUloF8+OXMu0aItHXkpbk
	DD7AUcirXEGkwSPrq9/WPa9WXWLrjpP7yt3VtFWtLmzdlnpKR+KYj3b6b9A5XllJ6SKjJT
	ByUbVwoI35+eYB4bZtZtUkyzKvHh7gk2UyB2tukirkygkkiESWIpOc863thh4syDkfclcE
	/6GFVL/olG5ITShWfKPAm88IBAtHTCNTEXuMbkfYloZd/CtHG7sBwGtVI5eYTDIoTdGUet
	fIKLFnpB6ySfPy28kTPdE8wFdNTONicQv6mcqXkV6Qq/OvSWyBqTTksnP98+YQ==
Message-ID: <b78a4ff9e6dfcf8beb78a0b36946ed470e03c424.camel@bootlin.com>
Subject: Re: [OE-core] conflict between tcl8 and tcl
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: thomas.perrot@bootlin.com, wangmy@fujitsu.com, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Nov 2024 15:28:31 +0100
In-Reply-To: <CANNYZj8G4B84MOEH2LL=cDFUzB--jKx8zYo_KG1Vv7cgtxd-+A@mail.gmail.com>
References: 
	<TYWPR01MB11861AA75103D416B518D1CEEDC2F2@TYWPR01MB11861.jpnprd01.prod.outlook.com>
	 <CANNYZj82P1RMCicKPN5z9gvwbcVJgzXrVp7F09UbfFXok0ob-Q@mail.gmail.com>
	 <d4102dba59d94d0253b0ccfb56daaaef8a48decf.camel@bootlin.com>
	 <CANNYZj8G4B84MOEH2LL=cDFUzB--jKx8zYo_KG1Vv7cgtxd-+A@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-+PZ2ouvIN77jezAzRrRO"
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41) 
MIME-Version: 1.0
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 14:28:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207858


--=-+PZ2ouvIN77jezAzRrRO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, 2024-11-26 at 15:17 +0100, Alexander Kanavin wrote:
> On Tue, 26 Nov 2024 at 15:11, Thomas Perrot
> <thomas.perrot@bootlin.com> wrote:
> > > > There're lots of conflicts between tcl8-doc and tcl-doc.
> > > > Currently considering two modification options:
> > > > 1. Using priority to resolve the conflict. For example, set the
> > > > priority of tcl to be high and setting the priority of tcl8 to
> > > > be
> > > > low
> > > > 2. Rename the directory where the conflicting files of tcl8 are
> > > > located, such as adding the tcl8 version number, to distinguish
> > > > it
> > > > from tcl
> > >=20
> > > I think option 2 is a better one. What is the reason for
> > > installing
> > > both though?
> > >=20
> >=20
> > I have prepared a patch that replaces the suffix 'tcl' with 'tcl9'.
> > Both are installed because 'expect' depends on 'tcl8'.
>=20
> That doesn't explain why tcl-doc and tcl8-doc would be both
> installed.
> Expect doesn't need them.

We build an image that contains all the documentation (e.g. doc-pkgs).

Kind regards,
Thomas Perrot

>=20
> Alex

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


--=-+PZ2ouvIN77jezAzRrRO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmdF2xAACgkQn8ALBXH+
Cu3oMAv/Y9/hmIvGxA7TXBFWV1SwgucjKnt9C//OExD84qYFrxG5pIPc6G8bwoVo
gQlaw4kJzCSPV/YdUkrxEMXsw6WjgTDLCMkso7goW7lYnpW+4cE3vRbdz7b0Kcjb
VXDaDDBLTsczlHASt8hlW+aueiVIKcsmTnNjpl+/fvgTbffqPU/J7HZO/kDBeYRn
UUY8b+hyIjbcHiMFLT/wbvxoD4TlOWp4kdkpMDa0bBjfcQo4/hiSA0qJmjYyRTh6
QBG0JTCdmREHO2ekl9qaT0oaRNPZNBfMWGbWw7BSemDtwnUc9C8WknJZpZhuoF94
Be5xp3DUMttZHZ+Bx8I+mJJ7LihgXAY6DYyCI1NLVgsDVjcIOfZ2cX89og9RqfeB
1JiX88e/x/B7CaFg51W21HjAqFfy64tmTbHqhMdE6iTng3asn0am/aEHKTthZ9Hh
ziveY22V9x9YaGLvy4+Mhv0M92cu8hL6n+Nuja5dfCym0y00l47jGQWjG94gk8A/
isnBU1SB
=trBF
-----END PGP SIGNATURE-----

--=-+PZ2ouvIN77jezAzRrRO--

