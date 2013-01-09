Received: from mail-da0-f48.google.com ([209.85.210.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tswy1-0003Dk-7M
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 15:49:41 +0100
Received: by mail-da0-f48.google.com with SMTP id k18so779335dae.21
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2013 06:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=Z0ltnx5D9j4EXhHKkLCEDyJzNj9VSgmEqWYpdmwlHe0=;
	b=EyJXY9F9aFPD5aauyO3HXNtsUbLgqfiu4869eyabZ/DVT4OT/e+Zi8ptCDYXvYDQti
	3HaH9QGGcn3lTYYyFFQF5/gY4DFoqJSaI6PtKv1fBSBv0RNEAVx3dRawXEMlEWxOeMX1
	SPiMK0z+Lz6jdFfSGxKRr+L03IxC0/UZ+K1BUWnl1H9je/vM2teCeNzBrx6/y3BIshv4
	MYx1a2xN3n7b7q7NUEwIpBlq9UeWxikUR2QSStbe8zn+ux14TDY7DaX5PTVcUJsaLMB4
	4rsx/rDqUDTnWa9nf512o4n7EeY4QJPktf+QUqwJot9FaEeEchcATZLbWgdf6u5IADjC
	LgZA==
X-Received: by 10.66.84.195 with SMTP id b3mr190667039paz.30.1357742048426;
	Wed, 09 Jan 2013 06:34:08 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id
	mt15sm41722774pbc.49.2013.01.09.06.34.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Jan 2013 06:34:07 -0800 (PST)
Date: Wed, 9 Jan 2013 15:34:11 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20130109143411.GQ3722@jama.palm1.palmone.com>
References: <alpine.DEB.2.02.1301090752510.25391@oneiric>
	<7E75003D-F6FC-4B4B-9FB8-A84DB5CCEDC8@gmail.com>
	<alpine.DEB.2.02.1301090923001.10155@oneiric>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1301090923001.10155@oneiric>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: for a quad-core machine, shouldn't parallelism be set to 8?
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
X-List-Received-Date: Wed, 09 Jan 2013 14:49:50 -0000
X-Groupsio-MsgNum: 33601
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ubuMVesmirrCclZT"
Content-Disposition: inline

--ubuMVesmirrCclZT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 09, 2013 at 09:26:10AM -0500, Robert P. J. Day wrote:
> On Wed, 9 Jan 2013, Elvis Dowson wrote:
>=20
> > Hi Robert,
>=20
> > On my i7 quad core machine, I've set both values to 6. Setting it to
> > 6 appears to be nearly the same as setting it to 8, I dare say a
> > marginally faster by a minute. I can build core image console in
> > around 22 minutes.
> >
> > Elvis
>=20
>   i recall someone (richard purdie?) once benchmarked to check the
> benefits of increasing parallelism and while it's obvious you'll hit
> the wall eventually, it would still be nice for the documentation to
> be consistent.

You can use openembedded-core/scripts/contrib/bb-perf/bb-matrix.sh to
find best value for your HW and bitbake target.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ubuMVesmirrCclZT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDtf+MACgkQN1Ujt2V2gByYLwCdHoo4KCLAuKAJxfELCh8fubtc
9HEAn3gZVGbvozwP9t9nBGr5vid5MmfF
=j3H8
-----END PGP SIGNATURE-----

--ubuMVesmirrCclZT--
