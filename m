Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1THfON-0000JT-EO
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 20:34:27 +0200
Received: by mail-wi0-f169.google.com with SMTP id hq4so27311wib.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2012 11:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5/yAtM28rUm7tSUfywVExDys/xrp/6M0S1UzaIuCrr0=;
	b=XPJEQ+XO9zfJ0q9nvhZyWwh5wQuu7j9uwIYeILhFpz7hWgIB8xqvs1Y3j0kpkr6dcc
	g71PrcNiL/KakxrStxCI6gAxob+BZKuHTQyw7GbgEXjg+vIkGNvZQalrlj8cu4lQECYO
	GuJNaedV2uWrlISPOr9o1djgresDIcC+HOw8M3cK4f5tpjV8lYXMtUIrtj5rCxfXcMIE
	wkNJVBZJivO2dYri/R4eqGBGlszQFBh5fJxvKbIykXYrGOcjaKW1ewDZTiSrMOv+2pOr
	DBQfI201SrGq/dvdznx9CxQzSvJtYpB3cORvjRS+zW2+qnKhN4XYXCloca2FV6jLlcAS
	758w==
Received: by 10.180.79.100 with SMTP id i4mr5443327wix.12.1348856491354;
	Fri, 28 Sep 2012 11:21:31 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cn6sm702717wib.9.2012.09.28.11.21.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 28 Sep 2012 11:21:30 -0700 (PDT)
Date: Fri, 28 Sep 2012 20:21:42 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Phil Blundell <philb@gnu.org>
Message-ID: <20120928182142.GD3049@jama.jama.net>
References: <cover.1348330479.git.Martin.Jansa@gmail.com>
	<5ac0bc525f5ac3f07c5749efc31e91c3fe6145c1.1348330479.git.Martin.Jansa@gmail.com>
	<1348335944.10108.211.camel@ted>
	<20120927083701.GC3454@jama.jama.net>
	<5064A1DB.40506@windriver.com>
	<1348830171.32611.47.camel@phil-desktop>
MIME-Version: 1.0
In-Reply-To: <1348830171.32611.47.camel@phil-desktop>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC 2/5] tune-xscale, tune-arm926ejs: add OPTDEFAULTTUNE variable and use more generic DEFAULTTUNE as default
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
X-List-Received-Date: Fri, 28 Sep 2012 18:34:27 -0000
X-Groupsio-MsgNum: 30122
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="48TaNjbzBVislYPb"
Content-Disposition: inline

--48TaNjbzBVislYPb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 28, 2012 at 12:02:50PM +0100, Phil Blundell wrote:
> On Thu, 2012-09-27 at 13:58 -0500, Mark Hatle wrote:
> > I've been an advocate for a while that the processor optimization (CCAR=
GS) does=20
> > make it into the PKGARCH.  ARMPKGSFX_CPU seems like a reasonable approa=
ch to do=20
> > this.  It allows each tune to set something to tell people what that bi=
nary is=20
> > really built for, and for the 'base' tunes (i.e. armv5) it can be left =
off.
>=20
> I think we've discussed this before but, just to reiterate, this sort of
> thing is a matter of DISTRO policy.  It is perfectly legitimate to want
> to build binaries with, say, -march=3Darmv5te -mtune=3Darm926ej-s and have
> them end up with PACKAGE_ARCH=3D"armv5te" or even just "arm".
>=20
> It seems to me that we are in danger of adding a lot of complicated and
> hard-to-understand machinery to oe-core in an attempt to solve a problem
> that ought to be getting solved by the DISTRO, and that by doing so we
> might be making life harder rather than easier for DISTROs which happen
> to want a slightly different labelling model to the default.

That's already there with DEFAULTUNE/AVAILTUNES machinery, isn't it?

Having that with better default values doesn't make things worse for
such DISTROs.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--48TaNjbzBVislYPb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBl6rYACgkQN1Ujt2V2gBy01QCfVH+c66rcOS7u6xhx70KUTaBf
VxYAoKN20b/t9QnNNjI9bhgSa/umpjGx
=8cw+
-----END PGP SIGNATURE-----

--48TaNjbzBVislYPb--
