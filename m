Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0A8D66079E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 10:59:26 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id a20so9849454wme.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 02:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Wuq+TjQO6HUM+VMcaDpoVviCvwo5boFa5ryYnCNwaZQ=;
	b=BD0eI/pYZ7iNmBfoohbrojEnODhDx8yH9qmfYG1iej9R4chNuAx8fz2SEyF+h+cREt
	EkecLQrtJ42/G9fPuhZQPMecEY7CkPLB50aB1nXD4FB37m72BySReOOJS2y2+p3xtZSR
	TItzjiWB+PPOGlEbdE9twZM3RzLhLw6ZZRhsfA7KC3qWBtLWd9q8stOjfAWNhJ+UNaZg
	PfGFqFw353PYbNRrkRhY+B33NJtwaU/b5lvZ2ZGKtG7PlL6Q8LIYKBt4PPmRIjx6u6Ur
	bA9bTFFLEB6x2ipS2ehEAOTOICtqHXhXoHnYxXGiU5P1zl9FvRIYLY0EdOlSFkkQa24x
	xQ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Wuq+TjQO6HUM+VMcaDpoVviCvwo5boFa5ryYnCNwaZQ=;
	b=Tm7SKUxWMaE/bsAfD6V1XRWSKrS71+c3HQ4N5k2+j05oBhwj9SOUZqkjmEQyd5Fzk6
	RnH2TWDigVmqC+OzZWgXdhyOIbzM2Famd+YuOFzkPy1bNgc4C2M21Pv541dmWBi4vCGy
	XEHipa1vZHdAYEObIGPe42i5sqZOnezeVvPEmjIa1POJpqx87BdelXyOuUcKvo5Bo/8C
	LbH2httOMY6/1XO7PnV+N9NrtrheKcrt2sTXRMIdf608StlKimKRQ4xFkL+b7R32BXqJ
	23MAqoyW8awqkLku/okQs5NGawIrhvpK0eD4MDfhOJMLYN2yAYLfNOLItzyzziF4K9kC
	Z5Zw==
X-Gm-Message-State: ABUngvf2/iTxxjyTdKou4FcnI3lFZjV4u/X6yM9qctEQbuaNHldrY4qZTO1J8bnaHpwvkA==
X-Received: by 10.28.129.81 with SMTP id c78mr9326008wmd.94.1479293968074;
	Wed, 16 Nov 2016 02:59:28 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	ei2sm25752570wjd.47.2016.11.16.02.59.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 16 Nov 2016 02:59:27 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 16 Nov 2016 11:59:27 +0100
To: =?iso-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
Message-ID: <20161116105927.GB16451@jama>
References: <20161115154311.30118-1-git@andred.net>
	<1479230361.3131.6.camel@andred.net>
	<1479287229.3131.10.camel@andred.net>
MIME-Version: 1.0
In-Reply-To: <1479287229.3131.10.camel@andred.net>
User-Agent: Mutt/1.7.1 (2016-10-04)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: \n in DESCRIPTION creates invalid (ipk) packages? (was: Re: [oe][meta-networking][PATCH 0/2] ncp - a fast file copy tool for LANs)
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
X-List-Received-Date: Wed, 16 Nov 2016 10:59:28 -0000
X-Groupsio-MsgNum: 89455
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yEPQxsgoJgBvi8ip"
Content-Disposition: inline

--yEPQxsgoJgBvi8ip
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 16, 2016 at 09:07:09AM +0000, Andr=E9 Draszik wrote:
> On Tue, 2016-11-15 at 17:19 +0000, Andr=E9 Draszik wrote:
> > On Tue, 2016-11-15 at 15:43 +0000, Andr=E9 Draszik wrote:
> > > "ncp" is a utility for copying files in a LAN. It has absolutely
> > > no security or integrity checking, no throttling, no features,
> > > except one:
> > > =A0 you don't have to type the coordinates of your peer.
> >=20
> > Hm, hold on. Something went wrong along the way. I can't actually insta=
ll
> > it
> > anymore:
> >=20
> > root@poky:~# opkg update
> > Package ncp-dbg version 1.2.4-r0 has no valid architecture, ignoring.
> > Package ncp-dev version 1.2.4-r0 has no valid architecture, ignoring.
> > Package ncp-doc version 1.2.4-r0 has no valid architecture, ignoring.
> > Package ncp version 1.2.4-r0 has no valid architecture, ignoring.
> >=20
> > root@poky:~# opkg install ncp
> > Package ncp-dbg version 1.2.4-r0 has no valid architecture, ignoring.
> > Package ncp-dev version 1.2.4-r0 has no valid architecture, ignoring.
> > Package ncp-doc version 1.2.4-r0 has no valid architecture, ignoring.
> > Package ncp version 1.2.4-r0 has no valid architecture, ignoring.
> > Collected errors:
> > =A0* opkg_prepare_url_for_install: Couldn't find anything to satisfy 'n=
cp'.
>=20
> It looks like this was caused by additional \n in the DESCRIPTION string.=
 Is
> it expected that those cause the packaging process to create apparently
> invalid ipk packages?

Was the \n at the end of DESCRIPTION?
If it leads into empty line in status file, then it's considered
separator for next package, see:
http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/commit/?id=3D7f0a7976c=
29b34feaf4f6b00f0a63626614d1c7d

>=20
>=20
>=20
>=20
> Cheers,
> Andre'
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--yEPQxsgoJgBvi8ip
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlgsPA4ACgkQN1Ujt2V2gBxOcwCfRC9M0GI295YsTdouGJW6LrIi
xNgAn3vgfjP3LBaY0em+rvmWTd/OFMF1
=Bz3a
-----END PGP SIGNATURE-----

--yEPQxsgoJgBvi8ip--
