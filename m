Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 6B9DC6BE62
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2013 18:28:23 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id n15so3189997ead.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2013 11:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=PyxxO5KJ3CE5w8c1K7obK6x6trZQokzZba27tt+y1y4=;
	b=LkE7APsfCduipNwl6lddjvadJGCCbzt3Y94jb/oI8mWkXzfJmsXjNyo8mTD4As4swV
	P8beQJdd8YSYIQj76TwHmbBruBqZ6oxPGv0gvqRE5eQStn/J3IUsoSMNxvSGkHMT0eQE
	NmXBLvRK83y0HzZvjyd45xK4tzLnfaWht08NWUg3g1HsKChpyE4W3chLCiWfhbRwolhw
	yGh+KyNOnp2r75Zmg7f096mE01FEZbZvKwoYWYtwB3nUivfIySk2/cFMYPBJYIi8/eUz
	5WZ3SmTXEV6qyqoD8FhpdvHgemw28OJjSpKpBr8IReGrScqb1k18v1n5Es4zJ2+cnJpW
	HcIg==
X-Received: by 10.14.202.132 with SMTP id d4mr360202eeo.105.1378232903547;
	Tue, 03 Sep 2013 11:28:23 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a1sm33652251eem.1.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 03 Sep 2013 11:28:23 -0700 (PDT)
Date: Tue, 3 Sep 2013 20:29:41 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20130903182941.GD11500@jama>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
	<e6abe1f4e6a41cf4ac4070971b6ec1757d79b9ab.1377792006.git.Martin.Jansa@gmail.com>
	<CAJTo0LbU5XC59qQ6mn5s161z4d3mvb+tdyjc5GNj-9-SFkNxSg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbU5XC59qQ6mn5s161z4d3mvb+tdyjc5GNj-9-SFkNxSg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [WIP][PATCH 06/20] libmatchbox: Add PACKAGECONFIG for png
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
X-List-Received-Date: Tue, 03 Sep 2013 18:28:23 -0000
X-Groupsio-MsgNum: 44438
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="C1iGAkRnbeBonpVg"
Content-Disposition: inline

--C1iGAkRnbeBonpVg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 02, 2013 at 03:02:39PM +0100, Burton, Ross wrote:
> On 29 August 2013 17:02, Martin Jansa <martin.jansa@gmail.com> wrote:
> > +PACKAGECONFIG ??=3D "png"
>=20
> For completeness consider adding "jpeg", although I doubt anyone
> actually uses the JPEG support...

jpeg is already in DEPENDS

>=20
> Ross

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--C1iGAkRnbeBonpVg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlImKpUACgkQN1Ujt2V2gBwUgwCeO2yrflRXzTfJlhB+u6qMoZ3t
DzEAn1uw1lBwFCL1ify28jQZoZuZte8s
=I33U
-----END PGP SIGNATURE-----

--C1iGAkRnbeBonpVg--
