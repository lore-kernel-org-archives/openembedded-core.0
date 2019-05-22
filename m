Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id CE8A17D40F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 20:48:11 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id n25so3560321wmk.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 13:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=M/Q274CQ7RvJY0UrKRoggH73qSoYOzmx4wd0goMb7w4=;
	b=pJYhpVBhOfpyO4iSPabZ/RrmW4NgmUM3kN/9WE5ZJvJ62ZGp3hN2nfPa03yhrIWMx/
	8mJ2hiTnNc0JmjQAZfHKdPurinD2y7Mva783eFSPIpxVsBWuWFwgEwhDTMxYvToMbN2m
	tjFxBeGbNy7mXqK41J5+6F4oZHxTxMPq+8LTZUugD1kQcUNA6tzDzv9P2MDP8bUu7UDy
	cgkpwg8jr3e4SN7KZC5sdqiaj9FterQgqhR1N7BWec6HQFrx3ftPyYW0x9kk1AETPeWd
	HfZO+lkFOwKqqDF6i8fRUCoBYh7D+epQnHjmehShszTu5xQM3TrHn6zpF+5wuyNHwZwE
	Ug7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=M/Q274CQ7RvJY0UrKRoggH73qSoYOzmx4wd0goMb7w4=;
	b=XyCN5+DGW+e94aK/+tE11sFQmfCwaP6NnMQgZDkvf1iV0ja5WSxnztlCMvcj9TNYxm
	/Rz+cIQmIBl8dAhgsJmJYh0GQWxCqRlmoNNr/gXSYo0+VisIo+ZPpmih+nO/YWw4ybph
	RrnntLFZth5qTX6LAoEEdNpPSoY6SvACkvf5DJpnTf2d476Id8K9WhR7jpGNpu85XrbE
	Hdi66Xtu5ZZ0d2Kx85YTy4QlnS443wqtN2nGA9syoM9TUx6MiEzrjFgwrJf/7ibFIb7I
	Rvsez3Edse7rcraCOiQ+dLJRKE+cu3REQLzgv8zpZ9K0SgwbSe/QiGrLRXk5fIxfeza5
	x2AQ==
X-Gm-Message-State: APjAAAVTIjiWykuyW2nSDypFdN1cLvgBJF9UfEj20NHmZe+IXZfxzJw1
	7vfXDqMOxRgAipDCDcxmQmw=
X-Google-Smtp-Source: APXvYqzFWHDUboBc6/TR9Fw98FNN2NbKTmNqwzdwTNggW0SVUxZpsubHd5knfvp7usOCZWWEoovRFA==
X-Received: by 2002:a1c:6c1a:: with SMTP id h26mr8643410wmc.89.1558558092532; 
	Wed, 22 May 2019 13:48:12 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	f6sm27029779wro.12.2019.05.22.13.48.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 13:48:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 22 May 2019 22:48:21 +0200
To: Adrian Bunk <bunk@stusta.de>
Message-ID: <20190522204821.GB1421@jama>
References: <cover.1558300553.git.just.another.mariano@gmail.com>
	<c7d776cebebd9bf2c28d43aad3fd911101283572.1558300553.git.just.another.mariano@gmail.com>
	<CA+chaQdu3hKa6ogM=9_iG1GS67YdrwoF=J2YWdh6RX3V1r7qbA@mail.gmail.com>
	<20190522141825.GA7379@localhost> <20190522200916.GA1421@jama>
MIME-Version: 1.0
In-Reply-To: <20190522200916.GA1421@jama>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] util-linux: Add missing ptest dependencies
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
X-List-Received-Date: Wed, 22 May 2019 20:48:12 -0000
X-Groupsio-MsgNum: 124870
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QKdGvSO+nmPlgiQ/"
Content-Disposition: inline

--QKdGvSO+nmPlgiQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2019 at 10:09:16PM +0200, Martin Jansa wrote:
> On Wed, May 22, 2019 at 05:18:25PM +0300, Adrian Bunk wrote:
> > On Wed, May 22, 2019 at 01:03:37PM +0200, Martin Jansa wrote:
> > > This pulls bc to many images with busybox, causing busybox postinst t=
o fail
> > > with:
> > >=20
> > > update-alternatives: Error: not linking /usr/bin/bc to /bin/busybox.n=
osuid
> > > since /usr/bin/bc exists and is not a link
> >=20
> > Are you enabling CONFIG_BC in your busybox config?
> > It is not enabled in meta/recipes-core/busybox/busybox/defconfig
>=20
> It's not disabled in my defconfig like it is in
> meta/recipes-core/busybox/busybox/defconfig, maybe it got auto enabled.
>=20
> In log.do_configure I see:
> ...
> *
> * Miscellaneous Utilities
> *
> adjtimex (4.7 kb) (ADJTIMEX) [N/y/?] n
> bbconfig (9.7 kb) (BBCONFIG) [N/y/?] n
> bc (45 kb) (BC) [Y/n/?] (NEW) dc (36 kb) (DC) [Y/n/?] y
>   Use bc code base for dc (larger, more features) (FEATURE_DC_BIG) [Y] (N=
EW) y
>     Interactive mode (+4kb) (FEATURE_BC_INTERACTIVE) [Y/n/?] (NEW)     En=
able bc/dc long options (FEATURE_BC_LONG_OPTIONS) [Y/n] (NEW) beep (2.4 kb)=
 (BEEP) [N/y/?] n
> chat (6.3 kb) (CHAT) [N/y/?] n
> conspy (10 kb) (CONSPY) [N/y/?] n
> ...
>=20
> > > I'll check which busybox defconfig entry enables BC and send patch to=
 use
> > > u-a for bc in ./meta/recipes-extended/bc/bc_1.07.1.bb
> > >=20
> > > There already is:
> > > ALTERNATIVE_${PN} =3D "dc"
> > > ALTERNATIVE_PRIORITY =3D "100"
> > > but maybe dc is a typo.
> >=20
> > bc and dc are two different binaries built from bc.
> >=20
> > busybox used to only have dc, bc was added 6 months ago.
>=20
> Thanks I've never noticed dc before.
>=20
> I see both dc and bc in 1.06 version from meta-gplv2 which was released
> on 2000-11-15
>=20
> bc/1.06-r3/image/usr/bin/bc

Ah you were talking about busybox having only dc until 6 months ago.

Makes sense now, thanks.

> As there is already u-a for dc, I will sent u-a for bc as well.
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--QKdGvSO+nmPlgiQ/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXOW1lQAKCRA3VSO3ZXaA
HMN4AJ4+8qYUUh0FCsjYSX4p7rkplY0KrwCbBBSGpXBxJS4U3ocYWLYLBfIseu0=
=z+1C
-----END PGP SIGNATURE-----

--QKdGvSO+nmPlgiQ/--
