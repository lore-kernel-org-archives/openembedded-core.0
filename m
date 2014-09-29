Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 419E4605B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Sep 2014 18:47:43 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id k14so13700950wgh.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Sep 2014 11:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=t0GBVDDgueIw9rNmOQvO8rdG3o1pUNQ8ETILc77dMJw=;
	b=i7A1QXfM/XBdpjwYOTyfAdLXG2S99K09uj38Sn6APIUgTmyohc52oOgK0ioVB8AZYb
	qt7vFLHtLkFkJwOOBLrpngbCGtqHdWaoKOYjF7V7Bq4Ov0e2Rwz+mGfUHwJNX+p4G/a8
	YIj7KC6N0olvpITP5GqGXDw08AdoKo6PmFB9I0G25XqJgHC0a6qRzscLR+vA5fNFifmV
	mYRoRb5hB2n7O47PpADYY5I1cc5gCCA1Yv3plLpiYJKygoSSQ6/kyM5Rb7Qae0Yhlqvj
	jCPcJZ9rpvfBvBqkXksfuftKQqEmmjyCrqX1qXLG2nlppAFmewNo7pJSCJzPWkFGVwyQ
	YWzQ==
X-Received: by 10.195.13.14 with SMTP id eu14mr17537978wjd.22.1412016464221;
	Mon, 29 Sep 2014 11:47:44 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u8sm12558465wia.24.2014.09.29.11.47.42 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Sep 2014 11:47:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 29 Sep 2014 20:48:35 +0200
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20140929184835.GU25706@jama>
References: <1412001614-15126-1-git-send-email-ross.burton@intel.com>
	<201722111.zmNURQEFnj@comp-006-thk>
	<CAJTo0LZ4RCk5eqdXb2MxchvQkZgiT3+4+yUnNuNwQZcX+0Vm4w@mail.gmail.com>
	<20140929171445.GT25706@jama>
	<CAJTo0LZQCt67M1L7KyPWLoj=fQOf7eccnMsnVioc-kANHD_DLg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZQCt67M1L7KyPWLoj=fQOf7eccnMsnVioc-kANHD_DLg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: add SRCREV to do_fetch() hash
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
X-List-Received-Date: Mon, 29 Sep 2014 18:47:51 -0000
X-Groupsio-MsgNum: 58226
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VvnGyWaJ9JuxX38U"
Content-Disposition: inline

--VvnGyWaJ9JuxX38U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 29, 2014 at 06:23:39PM +0100, Burton, Ross wrote:
> On 29 September 2014 18:14, Martin Jansa <martin.jansa@gmail.com> wrote:
> > It will be still mandatory for recipes with multiple SRCREVs (and
> > SRCREV_FORMAT).
>=20
> Hm, should SRCREV_FORMAT also be in the hash?

That probably won't be enough, you would need to include all
SRCREV_foo
SRCREV_bar
variables when
SRCREV_FORMAT =3D "foo_bar"

Maybe we can include SRCPV in hash to cover both cases.
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VvnGyWaJ9JuxX38U
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQpqYMACgkQN1Ujt2V2gBwbRACdHbLGZH+iXJToVa2HoxqQGGTd
OtAAoKHwstGOZRvxRYk7EunLW8Jh4ziW
=ULG2
-----END PGP SIGNATURE-----

--VvnGyWaJ9JuxX38U--
