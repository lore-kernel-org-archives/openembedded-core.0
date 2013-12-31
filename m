Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1643160DD6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Dec 2013 09:45:59 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id n15so5473150ead.36
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Dec 2013 01:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5Ff2HvODInhne23a59HgzkHwW0j+hZZHtKYzcBBqQNY=;
	b=neB0EgeuURxJTX018nMEwgHOzNRFnY7mWUQ3o+9VJp3SruWDKi5wLLUwpLmN65o8bj
	t1ed9x7n1zd7r+tNsEohIIyXrb0BsUtqR9EfGOa2XWlXglN2iWs/RHxFWvPDQY8i3bOg
	g/mgj1RQfemtgkk1nVuByIDGlw9Pyqwrz3UY04HQXEQX6uWgHIf+ApwM+ym5uR/hURx4
	vx2CZE/JcdUNotZgN/lkceqQy4fLbYcDEhaYBT6N+nBRmVsWfX7AO11YmtDEXoPyn4L2
	AuE+Hn+o/pxXIwDM07ijUYuCs/DLLuilelX36Wmye7dJ5kj17nK8teyZfMDyHRv+dca8
	ttsw==
X-Received: by 10.14.199.1 with SMTP id w1mr58863117een.29.1388483160847;
	Tue, 31 Dec 2013 01:46:00 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id m1sm116607947eeg.0.2013.12.31.01.45.59
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 31 Dec 2013 01:45:59 -0800 (PST)
Date: Tue, 31 Dec 2013 10:45:59 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Message-ID: <20131231094559.GB3705@jama>
References: <52C222A1.6030705@windriver.com>
MIME-Version: 1.0
In-Reply-To: <52C222A1.6030705@windriver.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Why do we allow empty -dev/-dbg packages ?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Dec 2013 09:46:00 -0000
X-Groupsio-MsgNum: 48531
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/WwmFnJnmDyWGHa4"
Content-Disposition: inline

--/WwmFnJnmDyWGHa4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 31, 2013 at 09:49:21AM +0800, ChenQi wrote:
> Hi All,
>=20
> This might be a dummy question, but it has been puzzling me for some=20
> time. So if someone could give me some explanation, that would be really=
=20
> appreciated.
>=20
> In bitbake.conf, we have:
> ALLOW_EMPTY_${PN}-dev =3D "1"
> ALLOW_EMPTY_${PN}-dbg =3D "1"
>=20
> That means we allow emtpy -dev/-dbg packages. But what are the benefits=
=20
> of these empty -dev/-dbg packages?

In some cases it's useful to satisfy default dependcencies:
bitbake.conf:RDEPENDS_${PN}-staticdev =3D "${PN}-dev (=3D ${EXTENDPKGV})"

and -dev needs ${PN} even when it's empty in some recipes where all
files are split into separate packages
bitbake.conf:RDEPENDS_${PN}-dev =3D "${PN} (=3D ${EXTENDPKGV})"

Not sure about -dbg one.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/WwmFnJnmDyWGHa4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLCklcACgkQN1Ujt2V2gBxIUwCgrEnBT0RvJ+zF+OQ3BajaXxqn
h40An06f9A1S/C6lm6qe17Pk6uz9LyxM
=e8hQ
-----END PGP SIGNATURE-----

--/WwmFnJnmDyWGHa4--
