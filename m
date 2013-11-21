Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id D946C6C73E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 00:10:27 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id o10so5231896eaj.41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 16:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tYaX70buUwSbIw4W/MuWNB7WonPkht7Nkoh+4kXJcwA=;
	b=L+lQDcfN4baluETBzsqRPTEdiAed7L7FiT9Gxq1UWpCkNmk7OaIC4rBY7XYdXUB6sG
	HiAuMX0NOb3AWuSEMneupZoeT/FH3EsxPwCq3014WGAmOFS9KUOdgpPgIaeRNJCQAgA8
	/MUSKCwOR7ZfczddxFn4JO1Xf2mSViZVbatzAMQ/fD+jok102FZj86U7hCC5xJk0Q9fh
	MU5zCS6hynTeQyUvzTmSDSKhDunAGaAZhxxjtBq81JyHRPKR1Ip3uKoLwfk0IFWInj5c
	2h5KToi5QtLT4xp4rI84TuuT8FAkF/jVVLMiinO3b7FywXeH6q3DcQ0vzuMQ2oHReaM2
	zxcw==
X-Received: by 10.14.212.72 with SMTP id x48mr4460912eeo.0.1384992627687;
	Wed, 20 Nov 2013 16:10:27 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 1sm64780394eeg.4.2013.11.20.16.10.26
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Nov 2013 16:10:26 -0800 (PST)
Date: Thu, 21 Nov 2013 01:10:30 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20131121001030.GV3708@jama>
References: <528D2429.7040705@emagii.com>
 <1384982956.16887.94.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1384982956.16887.94.camel@ted>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>,
	Ulf Samuelsson <angstrom-dev@emagii.com>
Subject: Re: Improving Build Speed
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Nov 2013 00:10:28 -0000
X-Groupsio-MsgNum: 47365
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kD0q5DIPXzY/lIlp"
Content-Disposition: inline

--kD0q5DIPXzY/lIlp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2013 at 09:29:16PM +0000, Richard Purdie wrote:
> Hi Ulf,
>=20
> > (3) Creating the rootfs seems to have zero parallelism.
> >      But I have not investigated if anything can be done.
>=20
> This is something I do want to fix in 1.6. We need to convert the core
> to python to gain access to easier threading mechanisms though.
> Certainly parallel image type generation and compression would be a win
> here.

If you're building .bz2 images, then installing lbzip2/pbzip2 saves a
lot of time in FSTYPES creation.

> > DEPENDENCY BUGS
> > pangomm    needs to depend on "pango"
> >      Otherwise, the required pangocairo might not be available when=20
> > pangomm is configured
> >=20
> > goffice needs to depend on "librsvg gdk-pixbuf"
> >      Also on "gobject-2.0 gmodule-2.0 gio-2.0", but I  did not find=20
> > those packages,
> >      so I assume they are generated somewhere. Did not investigate furt=
her.
>=20
> I'm sure patches would be most welcome for bugs like this.

But please upgrade to latest layers first, because there 2 weren't
detected in my last test-dependencies.sh so I guess they were fixed
already.

http://lists.openembedded.org/pipermail/openembedded-core/2013-October/0849=
05.html

You can use the same script to keep your new toy busy for a while :).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--kD0q5DIPXzY/lIlp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKNT3YACgkQN1Ujt2V2gByv4wCfcWwHX47qvpZ/1Y/THEbV/Lyv
9dIAn0BZcWtY8aOI5anem+PKJPiO988j
=3PKK
-----END PGP SIGNATURE-----

--kD0q5DIPXzY/lIlp--
