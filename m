Received: from mail-pb0-f46.google.com ([209.85.160.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TlgDh-0005ci-9a
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 14:31:29 +0100
Received: by mail-pb0-f46.google.com with SMTP id wy7so1975155pbc.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2012 05:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=ushEvvhDiumzbOKH8Po891qUybL/lA1h18FVzlnLOI0=;
	b=NEDb+XtZQj61v8sCsZFKrHRQZ6RjQDhJ6jOwAyd7J20+l6rIVmYnC+8UHB3ru7lIuB
	tafV+1l6ggQPjg8Bb10mwRcqRUs7Gk0tfPO1WCzp1+q9FCTlWhF/Rb/ogf9k4KVxfhdz
	+8kVFrfETxJhUuPmYoPPWpQqGJ5sJWGldp53MCojApwMmA2TVvjEhZ8uWb0/fIXUVuii
	YEFea+0XODPOCTBqqzsByWLJMHrN3+GCy+RA+6321j5YR7IYw1hO5rBDiSsjDY4sJnSi
	Bjl4QGTjI8RLAcWpOHcSfqe0Qcy1d9zPZ7Na7gNGrnyUpjvOI0G6kIPiN9wcamNcHZ7u
	8wFA==
X-Received: by 10.68.189.102 with SMTP id gh6mr29504862pbc.37.1356009404106;
	Thu, 20 Dec 2012 05:16:44 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id pu5sm5032672pbb.73.2012.12.20.05.16.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Dec 2012 05:16:43 -0800 (PST)
Date: Thu, 20 Dec 2012 14:16:41 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20121220131641.GI14543@jama.palm1.palmone.com>
References: <1356008353-12375-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1356008353-12375-1-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] python: add -crypt as a dependency on -math
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
X-List-Received-Date: Thu, 20 Dec 2012 13:31:31 -0000
X-Groupsio-MsgNum: 32941
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CNK/L7dwKXQ4Ub8J"
Content-Disposition: inline

--CNK/L7dwKXQ4Ub8J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 20, 2012 at 12:59:13PM +0000, Ross Burton wrote:
> random.py imports hashlib, so add this missing dependency.

Please follow warning in that file:
# WARNING: This file is AUTO GENERATED: Manual edits will be lost next time=
 I regenerate the file.
# Generator: 'scripts/contrib/python/generate-manifest-2.7.py' Version 2011=
0222.2 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
# Visit the Python for Embedded Systems Site =3D> http://www.Vanille.de/pro=
jects/python.spy

and change it in=20
openembedded-core/scripts/contrib/python/generate-manifest-2.7.py
first and then regenerate python-2.7-manifest.inc

Cheers,

>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-devtools/python/python-2.7-manifest.inc |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/python/python-2.7-manifest.inc b/meta/=
recipes-devtools/python/python-2.7-manifest.inc
> index 1e16c6b..3c7be7e 100644
> --- a/meta/recipes-devtools/python/python-2.7-manifest.inc
> +++ b/meta/recipes-devtools/python/python-2.7-manifest.inc
> @@ -139,7 +139,7 @@ RDEPENDS_${PN}-mailbox=3D"${PN}-core ${PN}-mime"
>  FILES_${PN}-mailbox=3D"${libdir}/python2.7/mailbox.* "
> =20
>  DESCRIPTION_${PN}-math=3D"Python Math Support"
> -RDEPENDS_${PN}-math=3D"${PN}-core"
> +RDEPENDS_${PN}-math=3D"${PN}-core ${PN}-crypt"
>  FILES_${PN}-math=3D"${libdir}/python2.7/lib-dynload/cmath.so ${libdir}/p=
ython2.7/lib-dynload/math.so ${libdir}/python2.7/lib-dynload/_random.so ${l=
ibdir}/python2.7/random.* ${libdir}/python2.7/sets.* "
> =20
>  DESCRIPTION_${PN}-mime=3D"Python MIME Handling APIs"
> --=20
> 1.7.10
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--CNK/L7dwKXQ4Ub8J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDTD7kACgkQN1Ujt2V2gBylLACgoaSbpS0jhRBPW8l3gzTAAaQ/
zfwAoIk1R/JHZ6YD4WO2JOnofgJKeT8c
=It4G
-----END PGP SIGNATURE-----

--CNK/L7dwKXQ4Ub8J--
