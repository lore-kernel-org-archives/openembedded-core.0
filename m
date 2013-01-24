Received: from mail-pa0-f45.google.com ([209.85.220.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TyNV7-0002J8-1K
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 15:09:57 +0100
Received: by mail-pa0-f45.google.com with SMTP id bg2so5504464pad.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 05:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=4GZzy16aCV5JUMaHPFSKA5q1dfZIjYuC1sEuLABXH1o=;
	b=06DZGjbfVYHsrwBh/KDjkizEGbmZDG3y3mXkzlbMCtIfb9UxpNkWXnE1zEqiC0gAUr
	UmMkFA18+UPGXE4mLmKXZifb253FIrsjiTxdqUwsn1TQBJbQfAHoQC63EKNFHxmTsoYq
	x6f5Ez6fnozrcBgeYGNYz7CjtcpcdQG1D09auFJWAqO1quQf+nC4hjEzVx4vYC0pJfZc
	dEgKNgVl/PekUXmAwkwIV421Du724K0jt4g37iWVZcBjQv4RCoQL6uaU+A1QlPaiGC1X
	L3jMa8ZF6mO7KrL303e4twbHUAjqcz/HkzzbwL8/INNT+HciYZ8tsXSbu4WgJgnUTALh
	leLg==
X-Received: by 10.69.0.74 with SMTP id aw10mr5028169pbd.87.1359035663382;
	Thu, 24 Jan 2013 05:54:23 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id o6sm15735930paw.37.2013.01.24.05.54.18
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 24 Jan 2013 05:54:22 -0800 (PST)
Date: Thu, 24 Jan 2013 14:54:15 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: "Ciobanu, Emilia Maria Silvia" <emilia.maria.silvia.ciobanu@intel.com>
Message-ID: <20130124135415.GE3012@jama>
References: <985E5BBDA0968D48ABDF343456A521B3F1301C@IRSMSX102.ger.corp.intel.com>
	<20130124124319.GC3012@jama>
	<985E5BBDA0968D48ABDF343456A521B3F13082@IRSMSX102.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <985E5BBDA0968D48ABDF343456A521B3F13082@IRSMSX102.ger.corp.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Meta-web-kiosk Layer
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
X-List-Received-Date: Thu, 24 Jan 2013 14:09:57 -0000
X-List-Received-Date: Thu, 24 Jan 2013 14:09:57 -0000
X-Groupsio-MsgNum: 34361
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EgVrEAR5UttbsTXg"
Content-Disposition: inline

--EgVrEAR5UttbsTXg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 24, 2013 at 01:46:04PM +0000, Ciobanu, Emilia Maria Silvia wrot=
e:
> Hi,
>=20
> I've updated the repository with the dependencies changes.

Great, thank you.

I'm not sure if this settings will work for everybody, maybe some other
default config or generate that from some variables in recipe (easier to
override from distro).

http://git.yoctoproject.org/cgit/cgit.cgi/meta-web-kiosk/tree/recipes-brows=
er/midori-session/files/config
default-encoding=3DISO-8859-1
http-proxy=3Dhttps://proxy-ir.intel.com
http-proxy-port=3D911

Cheers,

>=20
> Thanks,
> Ema
> ________________________________________
> From: Martin Jansa [martin.jansa@gmail.com]
> Sent: Thursday, January 24, 2013 2:43 PM
> To: Ciobanu, Emilia Maria Silvia
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] Meta-web-kiosk Layer
>=20
> On Thu, Jan 24, 2013 at 12:05:00PM +0000, Ciobanu, Emilia Maria Silvia wr=
ote:
> > Hi,
> >
> > I've created a new layer that can be used for kiosk devices.
> > You can check it out at:
> >     http://git.yoctoproject.org/cgit/cgit.cgi/meta-web-kiosk/
> >
> > It contains a new bitbake target that automatically
> > starts a web browser right after boot and enables the
> > use of a virtual keyboard if there is support for it.
> >
> > The layer currently includes recipes for the web browser,
> > and bsp configurations.
> >
> > I'm open to receiving feedback, patches and any suggestions.
>=20
> Why not add dependency on meta-openembedded/meta-oe and meta-gnome?
>=20
> At least 4 duplicated recipes could be removed and newer midori from
> meta-gnome would be used:
>=20
> OE @ ~/meta-openembedded $ find . -name ca-certificates_\*
> ./meta-oe/recipes-support/ca-certificates/ca-certificates_20120623.bb
> OE @ ~/meta-openembedded $ find . -name vala_\*
> ./meta-oe/recipes-devtools/vala/vala_0.16.0.bb
> OE @ ~/meta-openembedded $ find . -name midori_\*
> ./meta-gnome/recipes-connectivity/midori/midori_0.4.7.bb
> OE @ ~/meta-openembedded $ find . -name python-docutils_\*
> ./meta-oe/recipes-devtools/python/python-docutils_0.5.bb
>=20
> Cheers,
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--EgVrEAR5UttbsTXg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEBPQcACgkQN1Ujt2V2gBxOcwCfccy2aMLLPxGfqBbzMwlDSZIl
yvQAnjG7Kvn2E2aFW3RWu66cs3G9LAzz
=j2yt
-----END PGP SIGNATURE-----

--EgVrEAR5UttbsTXg--
