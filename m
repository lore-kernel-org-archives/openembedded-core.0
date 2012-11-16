Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TZHAW-0005vP-Qf
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Nov 2012 09:20:56 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so935218eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2012 00:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=P5/F+adohRnwFXgjeguTLSref7eApV9IDUnCJisBqs0=;
	b=bpCdQOceQC+IwJN6x6dPGTE+1zutdl/Awg5VBmPBbz0NyoAnsZzeCHns46QJtpvCFT
	yR4bEh8nBGI91D/Qk1NXqgLtDvpKLSiOA1AGcVrIfzyMooM2sYMEWECgolyG7f5JRa80
	jkwpuYRdDQIYIIQIRP38pU/dhMx9Sa5LoDMEPa0f+6qzf8f76G1m/MCCEn6wKFzZtD8N
	VT9P5JdPhsHgDbQIGcpieWC9ujUjN+Wjw/jDAtRY5Zy7eYvrnntheD9WM03B01OolSy7
	35zzwSqcDzkvolb5O6+8x1/DZnfv9IdtNKCcA/D2yIBAbIwJJzrUHHH8JrI0UMTpvTpr
	T3sQ==
Received: by 10.14.209.136 with SMTP id s8mr11323997eeo.33.1353053218843;
	Fri, 16 Nov 2012 00:06:58 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f3sm1984649eeo.13.2012.11.16.00.06.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Nov 2012 00:06:58 -0800 (PST)
Date: Fri, 16 Nov 2012 09:07:12 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20121116080712.GA3411@jama.jama.net>
References: <CAMKF1sokpajrms4PACKOSt8CYFt+6JEQ2Fre=QpzJfQF-KLrKA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sokpajrms4PACKOSt8CYFt+6JEQ2Fre=QpzJfQF-KLrKA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: binutils 2.23 call for testing the recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Nov 2012 08:20:56 -0000
X-Groupsio-MsgNum: 31440
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Content-Disposition: inline

--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 08, 2012 at 10:45:19AM -0700, Khem Raj wrote:
> Hi
>=20
> Binutils 2.23 branch has started upstream. Given that toolchain
> components require a lot of soak time, I have created the recipes
> for binutils 2.23 and pushed it here
>=20
> http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/binut=
ils-2.23
>=20
> If you are using angstrom set
>=20
> ANGSTROM_BINUTILS_VERSION =3D "2.23" in local.conf after pulling that bra=
nch
> for OE-Core it will work as it is
>=20
> Let me know if you see any errors.
>=20
> I will keep updating it until 2.23 release

Now with danny released, can this be merged? Maybe updated to 2.23.1 too.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCl9DAACgkQN1Ujt2V2gBze+gCfTcq4CDjZfsPX4ZYz1OYQAe3o
9CMAn2GulVsAcTfLEfXtxjr0OS15fXWJ
=F3Hs
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--
