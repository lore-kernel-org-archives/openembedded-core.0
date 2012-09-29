Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1THsq7-0008Sh-Su
	for openembedded-core@lists.openembedded.org;
	Sat, 29 Sep 2012 10:55:59 +0200
Received: by weyt44 with SMTP id t44so1918098wey.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2012 01:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=XJ5PKNHI3AFWTNjCi87L5qJ3SqvRnDmF2bmpkTupQT8=;
	b=fG8yl/BB3YCADW4FBrocZRRgnBoTf9IVXBLsO9wslGmL6IZwlXFsykzDTj/S9j/nQY
	iaLgwAuArxkGlPPuDsKDyNP6Jpn0cGU7ApA7A5/WCVDHYqGQlRXV7O5k2Pnqy8YxdSmK
	sLqTqkOyplyb8p0nIji9hiaDMQkTX/i2iysUkKvCkj/aRRy1rCATbuweCAfwcm7d7p31
	OvTtENpJ0leSmNr0Mzk6uNFt3jsQ3kbW1+4ozX62HKB7KjmQ764A3QzgzPDYgo1s4WXJ
	uVjs1zYiYZB3LuuGYucD82rZNdVzHuHywk3nTlHpvLcupurCjn8vF+63usWoxKi8slUU
	rk6w==
Received: by 10.216.134.97 with SMTP id r75mr5011808wei.127.1348908185708;
	Sat, 29 Sep 2012 01:43:05 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b7sm3789030wiz.3.2012.09.29.01.43.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 29 Sep 2012 01:43:04 -0700 (PDT)
Date: Sat, 29 Sep 2012 10:43:17 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20120929084317.GH3049@jama.jama.net>
References: <20120927142926.CA9C5103AC@opal>
	<20120927153419.GD3454@jama.jama.net>
	<20120927175531.GF3454@jama.jama.net>
	<CAP9ODKr0nC2WbN=gCieWRnf4=-9SiiB6NUiubVrTxnnvbAaGtg@mail.gmail.com>
	<5064D5FF.2050409@windriver.com>
	<CA+chaQdL+UTXrMsUJkzrEbpqMSxdQ3v7uCycumO9aUqmm9cnkg@mail.gmail.com>
	<CAP9ODKpKzc2T7MpMckyTabvuAkAe1ABCyZLKSz0=z83gJjAh1Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKpKzc2T7MpMckyTabvuAkAe1ABCyZLKSz0=z83gJjAh1Q@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Martin Jansa : xserver-xorg: use EXTENDPKGV instead of PV in RCONFLICTS_${PN}-module-exa
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
X-List-Received-Date: Sat, 29 Sep 2012 08:56:00 -0000
X-Groupsio-MsgNum: 30136
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="smOfPzt+Qjm5bNGJ"
Content-Disposition: inline

--smOfPzt+Qjm5bNGJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 28, 2012 at 09:02:47AM -0300, Otavio Salvador wrote:
> On Thu, Sep 27, 2012 at 7:50 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Fri, Sep 28, 2012 at 12:41 AM, Mark Hatle <mark.hatle@windriver.com>=
 wrote:
> >> Just an FYI -- Martin Jansa found a problem with the implement of the
> >> package version comparison.
> >>
> >> In deb and ipk, they do not support '<' or '>', instead it's '<<' and =
'>>'.
> >> (Odd, historical reasons apparently).
> >>
> >> While RPM doesn't have any idea what '<<' or '>>' is.
> >>
> >> Talking with RP and others it seems like the best approach is to imple=
ment a
> >> conversion, in the deb and ipk packaging classes, to convert '<' and '=
>' to
> >> the '<<' and '>>' equivalents.  As well as add a sanity check that nob=
ody is
> >> using '<<' or '>>'.
> >>
> >> I'm in the process of doing that now.
> >>
> >> --Mark
> >
> > There is still some problem in opkg, now when I'm testing << with opkg
> > which should work as LESS (and < as LESS_EQUAL), it still shows <=3D in
> > opkg status and behaves like <=3D. So there is probably some bug in opkg
> > still hidden :/
>=20
> Yes; it seems the right fix is in opkg.
>=20
> Using RCONFLICTS with << also fails to me as said yestarday on IRC.

Reported upstream with simple test case
http://code.google.com/p/opkg/issues/detail?id=3D94

will attach patch there + send here when I have it.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--smOfPzt+Qjm5bNGJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBmtKUACgkQN1Ujt2V2gBz8WwCeNTIDlGN4Eukrj29ZhFNpOHKs
rS0AnRRuJOqoBIEiqDwTbZKhVDwkpiJK
=4x3r
-----END PGP SIGNATURE-----

--smOfPzt+Qjm5bNGJ--
