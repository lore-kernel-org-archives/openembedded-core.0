Received: from mail-da0-f54.google.com ([209.85.210.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TwJzM-0005fC-2j
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 23:00:48 +0100
Received: by mail-da0-f54.google.com with SMTP id n2so1810361dad.27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2013 13:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=53sigKZyGeS6RLBBMH4Bhi3/lvX3kzqA+WQXBiryKeY=;
	b=pMG/RCEvkfBV0XFJQMKP9O8+bDLem2/4FYk+dDv2XJZbF2yPMX+n3DAPFLZbgj8X93
	hyzf02y0WTy3FteotyfULT4P18Rq6LCV9nZjSfiwIy3imhKydl9h1RBsQRiAbdk+otQa
	VX9NeA8ATg3GyGb2KMlJJaHnOoT5yIcKfsCjj+UKAj4ZnY/JODfArGm9LFragd/w6ZY8
	RNc9+qSBlUQg4S7QXZDEQhzmd6pE+qRAuadIbsGQtI+gVfNypNfsF6hQ6YIIAL6Tgk6W
	6Fth8FGAY2T2VN3sgZPyl2cZYKD5I36SpqWqBLOQHAcCTxJyGzj2Vio7yxyrVx4Dzk7m
	BP9w==
X-Received: by 10.66.82.170 with SMTP id j10mr27544664pay.9.1358545514248;
	Fri, 18 Jan 2013 13:45:14 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id a1sm3973517pav.2.2013.01.18.13.45.11
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 18 Jan 2013 13:45:13 -0800 (PST)
Date: Fri, 18 Jan 2013 22:45:09 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20130118214509.GC29386@jama.palm1.palmone.com>
References: <alpine.DEB.2.02.1301181633360.23942@oneiric>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1301181633360.23942@oneiric>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: what means PROV_class-native = ""?
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
X-List-Received-Date: Fri, 18 Jan 2013 22:00:49 -0000
X-Groupsio-MsgNum: 34050
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iFRdW5/EC4oqxDHL"
Content-Disposition: inline

--iFRdW5/EC4oqxDHL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 18, 2013 at 04:35:34PM -0500, Robert P. J. Day wrote:
>=20
>   perusing oe-core for examples to demonstrate the concept of
> "PROVIDES =3D", and i ran across this in recipes-devtools/dpkg/dpkg.inc:
>=20
> PROV =3D "virtual/update-alternatives"
> PROV_class-native =3D ""

PROV is variable with no special meaning
class-native is standard override for native recipe (like
virtclass-native was before).

> PROVIDES +=3D "${PROV}"
>=20
>   i'm not sure what to make of that -- what's the purpose of assigning
> to PROV, then subsequently assigning to PROVIDES, but with that
>=20
> PROV_class-native =3D ""
>=20
> line in between?  i did a grep and saw nothing else like it throughout
> oe-core.
>=20
> rday
>=20
> --=20
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>=20
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--iFRdW5/EC4oqxDHL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlD5wmUACgkQN1Ujt2V2gBxs5gCZAZpiN6y764Dy/yq4SrR7huqG
33oAoLZx5N30OdTOZF43pALz1RoNHS35
=Nufd
-----END PGP SIGNATURE-----

--iFRdW5/EC4oqxDHL--
