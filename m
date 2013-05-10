Received: from mail-ea0-f171.google.com ([209.85.215.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Uauol-0002yw-JG
	for openembedded-core@lists.openembedded.org;
	Fri, 10 May 2013 23:25:32 +0200
Received: by mail-ea0-f171.google.com with SMTP id b15so635476eae.30
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2013 14:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=Rl0U1a08N+CJr0mRHCX/7DZsD0a3y1vKX4UyJehvuSQ=;
	b=FYGdpeJeLQrfpllokVRI7kGGVlzI9dKciAsPEAJbiIP1zOukXnbSCOylHnqPvY+GYv
	13f5NZylnZNgFaICZmcMmCJ1A+aqe/1QUbi2vxOQjpGIYlUUe90WMky7o6YkHSGcR1pt
	ExDfxb9Q0kJ4dtxoPIPUh0KuzZKvw16/j0roHVqbmgjqpWZ7d0zl4p9+df4wsRv+CGoL
	mAiaey/0YrbYqDIKa494JfVuS7kJ4G0I79mel7ps888Qsz47eYe+dTwyNqf0Fx3lRU0K
	A1hUnfmCSTdDMm6kc7WUb9N9tFGDuJWPbZHqXyU51hxxRYhkKCAYGM7y+SpqyeZWgiBJ
	Mm3g==
X-Received: by 10.14.3.137 with SMTP id 9mr45996464eeh.0.1368220045985;
	Fri, 10 May 2013 14:07:25 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id n7sm5959173eeo.0.2013.05.10.14.07.24
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 10 May 2013 14:07:25 -0700 (PDT)
Date: Fri, 10 May 2013 23:07:27 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20130510210727.GH12329@jama.dyndns-home.com>
References: <518A6B25.5000108@r-finger.com> <1368026618.27116.52.camel@ted>
	<518A7B37.8050308@r-finger.com> <1368176725.11129.9.camel@ted>
	<518CD26F.3090901@r-finger.com> <1368185566.11129.28.camel@ted>
	<518D22CC.1040002@r-finger.com> <1368206371.11129.46.camel@ted>
	<CAP9ODKqGThBAjFkc1ViF9TJhW6z-xuVwwmDOa9mXg+h=TALJpw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKqGThBAjFkc1ViF9TJhW6z-xuVwwmDOa9mXg+h=TALJpw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: proposal to move cogl, clutter and related recipes from oe-core to dedicated meta-clutter layer
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
X-List-Received-Date: Fri, 10 May 2013 21:25:34 -0000
X-Groupsio-MsgNum: 39047
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="U3BNvdZEnlJXqmh+"
Content-Disposition: inline

--U3BNvdZEnlJXqmh+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2013 at 05:22:47PM -0300, Otavio Salvador wrote:
> Well if layers make life harder it invalidates one of points of Yocto
> which I always liked and depends on heavily - modular design.

+1

people are using many layers, so oe-core being regularly tested together wi=
th
some other layers is just another test for propagated modular design.

> I am sure we all want a solid release so I am also sure Tomas wouldn't
> put experimental version of clutter near of release. We are eating our
> own dog food so we are all interested in make it work, not the
> opposed. In this case I think it can be well coordinated.

he can even put experimental version there if it's in recipe with
negative DEFAULT_PREFERRENCE, unfortunately he cannot do the same if
experimantal recipes are in meta-clutter with higher priority and stable
recipes in oe-core (unless he makes sure that everybody who is using
meta-clutter will understand why he needs to set PREFERRED_VERSION to
prevent experimental being used).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--U3BNvdZEnlJXqmh+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlGNYY8ACgkQN1Ujt2V2gBxF5wCgm8iaF3WKeCpVnDeSP1Tov/bT
kvYAnjImwRGBGA9MoTOh0BFiQ+7rqAQj
=ZTgn
-----END PGP SIGNATURE-----

--U3BNvdZEnlJXqmh+--
