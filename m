Received: from mail-pa0-f48.google.com ([209.85.220.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U0f3Q-0002kf-KB
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Jan 2013 22:19:10 +0100
Received: by mail-pa0-f48.google.com with SMTP id fa1so1304207pad.21
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2013 13:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=6EfNtQFeaecAPr9uaanXh+DyI2IUMQ+S/urkmc8jX/I=;
	b=Zq6uRf5cWA+WrvKy6AsCCnsPN/3WHykWzcKiZATB+3QIs28s9xDKZp2yzJpOnMz2NO
	c3xyPHzj5kHTX3utGlJCL+7X9AvZts5+7H68Eo0+PAjvryVL6kkbD/J41Qv3AMtxwqZc
	u8XZj1+sJntf7u3p0rT8O6NeFMlnrGiUlDU4aMgWaGpqYRuc2jSn/bx+yCx1I9tUN34J
	CsJIhEZgMvS4HhfgqnNqF7UF6xnPpO3MJkDATlZM2V8KzuTAMnSQPFWYVsN/kK7cN3gy
	8y9VojZlamqAw7Zz2Cj/QOZxbDujjxwK+NopDWhR2kuquxfy7lVGUnmoGrkQC8Yn8gzW
	O3Mw==
X-Received: by 10.68.135.133 with SMTP id ps5mr15501718pbb.132.1359579786131; 
	Wed, 30 Jan 2013 13:03:06 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id qt2sm2600972pbb.24.2013.01.30.13.03.02
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 30 Jan 2013 13:03:05 -0800 (PST)
Date: Wed, 30 Jan 2013 22:03:06 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20130130210306.GA2102@jama.dyndns-home.com>
References: <alpine.DEB.2.02.1301290359260.12134@oneiric>
	<20130129094422.GJ16904@jama.palm1.palmone.com>
	<alpine.DEB.2.02.1301290453220.12871@oneiric>
	<20130129112406.GK16904@jama.palm1.palmone.com>
	<alpine.DEB.2.02.1301301520430.3650@oneiric>
	<CABcZANmn_EP_qGszxtsEymkMFe4iHDsWvXGc2wtc0pSieMTjSQ@mail.gmail.com>
	<alpine.DEB.2.02.1301301535390.3782@oneiric>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1301301535390.3782@oneiric>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Chris Larson <clarson@kergoth.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: BB_NO_NETWORK = "1" causes fetch to fail for unnecessary u-boot parsing
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
X-List-Received-Date: Wed, 30 Jan 2013 21:19:13 -0000
X-Groupsio-MsgNum: 34727
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline

--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 30, 2013 at 03:37:45PM -0500, Robert P. J. Day wrote:
> On Wed, 30 Jan 2013, Chris Larson wrote:
>=20
> > It's worth bringing up the SRCREV_POLICY variable, which lets you
> > control how bitbake handles caching of srcrevs. By default, it
> > figures it needs to get the mapping every time (value =3D=3D clear, or
> > unset), which can make sense in certain cases. But you can tell it
> > to go ahead and use the values it has cached from a previous run, as
> > well (value =3D=3D cache). This can be useful if you know you're moving
> > into an offline state and want to prepare for it above and beyond
> > the -c fetchall.
>=20
>   i'm not in the least embarrassed to admit i didn't even know that
> variable existed.  and, yes, that pretty much solves the problem.
>=20
>   i'm still creeped out by that comment of using the tag name to deal
> with rebasing a public commit, though.  :-P

There is also rebaseable parameter for git:// fetcher to generate
versioned snapshot from repository and reuse that in future build
(like fetcher1 did, see https://bugzilla.yoctoproject.org/show_bug.cgi?id=
=3D1511).

That should be used in that SRC_URI.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEJiooACgkQN1Ujt2V2gByAHgCgmVT/m7axi2EW0iyEHWZNEXDt
cO8AnRIB0KdPVJBdyKwntVJ+E43kNeQR
=UFg6
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--
