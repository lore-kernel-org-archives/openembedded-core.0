Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RseyT-0000Am-70
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 19:32:05 +0100
Received: by eaal10 with SMTP id l10so124274eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2012 10:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dorV7VnPOoVMqLMACasGrlbdP6hhjM+oGcYZUDrOMTM=;
	b=WkT4YhXLE4MYotSQ4ZnZR/YUVGV68xnVsLW5lQKJMzqZgl5qAB9q1V2Cf6onURy/e0
	RH5uoA1xWp0uELI9E+RoeL7YcYJaTvKsX1LomEfG/ajlP2igt0sl58gekns8C5N3BGqZ
	u8av+hNz6/iaxZwCJDs+DxSjlRrAUqzAaePLw=
Received: by 10.213.9.134 with SMTP id l6mr4331336ebl.52.1328120648566;
	Wed, 01 Feb 2012 10:24:08 -0800 (PST)
Received: from localhost ([94.230.152.246]) by mx.google.com with ESMTPS id
	y12sm101664059eeb.11.2012.02.01.10.24.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Feb 2012 10:24:07 -0800 (PST)
Date: Wed, 1 Feb 2012 19:24:06 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120201182405.GD6969@jama.jama.net>
References: <CALbNGRSKUfru5Z-jAJmywTieJUALfLAZgxW_NEhLBK8W5pw1VA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRSKUfru5Z-jAJmywTieJUALfLAZgxW_NEhLBK8W5pw1VA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: accessing variables
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Feb 2012 18:32:05 -0000
X-Groupsio-MsgNum: 16857
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uxuisgdDHaNETlh8"
Content-Disposition: inline

--uxuisgdDHaNETlh8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 01, 2012 at 07:15:19PM +0100, Andreas M=FCller wrote:
> another stupid question from my side:
>=20
> do
>=20
> bb.data.getVar('foo', d, 1)
>=20
> and
>=20
> d.getVar('foo', 1)
>=20
> access the same data?

Should be and later is preferred AFAIK, see:
http://git.openembedded.org/openembedded-core/commit/?id=3Db22831fd63164c4d=
b9c0b72934d7d734a6585251

Cheers,

>=20
> Thanks in advance
>=20
> Andreas
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--uxuisgdDHaNETlh8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8pg0UACgkQN1Ujt2V2gBzCzQCePyxLnQq8454pcc3Yr28TIm+z
M+8AniIs6mBAfFuDeLJjCHzpMDujsjGd
=fLUO
-----END PGP SIGNATURE-----

--uxuisgdDHaNETlh8--
