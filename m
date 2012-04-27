Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SNku3-0006dK-I1
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 15:08:03 +0200
Received: by wera1 with SMTP id a1so442494wer.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2012 05:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Wsn+cNOeXeCsY1V7NT7SmnRL0MdTPhwBnN/6XI5NM0U=;
	b=OikGkB6VOIHAh/e1YpvD0RMBcgh2WgDId4F29n1GDtUCy/5Q7rBdI2sbgAmsqQZbo4
	6U/jzK6Y76ysaE43nBQXrf2otBKo1XLaiBhcyv2rZAhZWqfoQdcX5arIi/SxEm1dFjfB
	0ctwcgqM6WF9jk5xpI3qqRMf15tMzWP/hy2PjvetyIb5+HaVSFzshiyMa+zvtPZl4DUo
	vLHKnsimEzo2vLGnkynolGXdprdbo9sjMGdVMbIYR8i62EN/USV1rK3PWerD1cd8u/tJ
	jP4iZpF06sWwuohId8wzBA8TnteSjwvsoS2qgbbVtGQDX4BlK77n+1UZ8uDOBYA06x7I
	GDHw==
Received: by 10.180.100.230 with SMTP id fb6mr6623124wib.3.1335531505520;
	Fri, 27 Apr 2012 05:58:25 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fn2sm7363717wib.0.2012.04.27.05.58.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Apr 2012 05:58:24 -0700 (PDT)
Date: Fri, 27 Apr 2012 14:58:28 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120427125827.GC3635@jama.jama.net>
References: <1335526751.20130.73.camel@ted>
	<D68D089B-A0F5-4CE3-9124-4DA8AD02287E@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <D68D089B-A0F5-4CE3-9124-4DA8AD02287E@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: gcc default version change (and qt4)
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
X-List-Received-Date: Fri, 27 Apr 2012 13:08:03 -0000
X-Groupsio-MsgNum: 21247
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kVXhAStRUZ/+rrGn"
Content-Disposition: inline

--kVXhAStRUZ/+rrGn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 27, 2012 at 02:02:19PM +0200, Koen Kooi wrote:
>=20
> Op 27 apr. 2012, om 13:39 heeft Richard Purdie het volgende geschreven:
>=20
> > I'd like to warn people that I'm pretty close to throwing the version
> > switch to default to gcc 4.7 at the same time as merging in Khem's
> > patches. I don't think this will surprise anyone, we've talked about
> > doing it post release for long enough.
> >=20
> > It also appears that qt 4.7.4 has issues with gcc 4.7 and 4.8.1 is fixed
> > so I'm going to change the default version on that at the same time.
> >=20
> > Since the tests on the autobuilder are looking pretty good now, I'll
> > probably do this sooner than later, maybe on Monday.
> >=20
> > I'll probably then give it a week, then assuming no reason to change
> > back to the older version, I'll remove gcc 4.6 and qt 4.7.4 from
> > OE-Core. They may get added to meta-oe's toolchain layer at that point
> > but that is up to the appropriate maintainers.
>=20
> FWIW angstrom will be using 4.5 for 'denzil' and 4.7 for 'master'. No 4.6=
 anywhere :)

My test build on armv4t is still running, hopefully the result will be
better than when I've tried to enable gold..

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--kVXhAStRUZ/+rrGn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+al/MACgkQN1Ujt2V2gBwO7QCgozAWN5jWoNJUIHaL1yr+q3jw
jRkAoLNESooQaoYWdoRnm8b0tfiqwKdo
=y7rp
-----END PGP SIGNATURE-----

--kVXhAStRUZ/+rrGn--
