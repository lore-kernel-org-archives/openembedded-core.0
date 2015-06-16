Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id EF86A601F7;
	Tue, 16 Jun 2015 14:40:06 +0000 (UTC)
Received: by wgv5 with SMTP id 5so13953539wgv.1;
	Tue, 16 Jun 2015 07:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=3g+5qgT+Qb7OCSrUS2FTPcp0HLrxcuVBvsnUQNXWP4g=;
	b=p90ns+IkOYh3SvaHo3/W+NkAPKKC8CrjRZFks7/D+BXjIdtvK3o4j7jNj3xXEndR5n
	eUwmxacUbJINFn9vVk8KRez7SLZBeHsrJWy767xq4pSnv+7yYXlQ/yaieezdmoUJ7ozs
	r405LgdiK+FYQiwvrJCbfFLzxRl69ebsvjTQCNnGZxSkp+16BgmgU8E9tjjyr2ODKA4u
	pDIee16kfktUlBvIRBFo45sVZP0VJ4xOOnhXSv2krrnStu3rj/LUjXj1OouhlT3Q/Ykd
	6f9WWE9Nhk1dJH5GqlbMQ4lEKv63B5DmyQTHBcM8ska91xU4CSmU2tmebQcYTnTncvua
	76Jw==
X-Received: by 10.180.20.12 with SMTP id j12mr43056226wie.4.1434465604912;
	Tue, 16 Jun 2015 07:40:04 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id yz3sm1967586wjc.19.2015.06.16.07.40.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Jun 2015 07:40:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 16 Jun 2015 16:40:13 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150616144013.GC17938@jama>
References: <55802EE1.6040703@dresearch-fe.de>
MIME-Version: 1.0
In-Reply-To: <55802EE1.6040703@dresearch-fe.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] multiple git repos vs. AUTOREV?
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
X-List-Received-Date: Tue, 16 Jun 2015 14:40:10 -0000
X-Groupsio-MsgNum: 66804
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+nBD6E3TurpgldQp"
Content-Disposition: inline

--+nBD6E3TurpgldQp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2015 at 04:12:49PM +0200, Steffen Sledz wrote:
> For development purposes we use this method to build always from the HEAD=
 revision of a git repository.
>=20
> -------------> snip <--------------
> SRCREV=3D"${AUTOREV}"
> PV =3D "gitr${SRCPV}"
>=20
> SRC_URI =3D "git://git@bitbucket.org/.../foo.git;protocol=3Dssh"
> -------------> snap <--------------
>=20
> Now we like to do the same in one recipe which uses sources from two git =
repos.
>=20
> Our first try was this one. But if failed..
>=20
> -------------> snip <--------------
> SRCREV_foo=3D"${AUTOREV_foo}"
> SRCREV_bar=3D"${AUTOREV_bar}"
> PV =3D "gitr${SRCPV_foo}+${SRCPV_bar}"
>=20
> SRC_URI =3D " \
> 	git://git@bitbucket.org/.../foo.git;protocol=3Dssh,name=3Dfoo \
> 	git://git@bitbucket.org/.../bar.git;protocol=3Dssh,name=3Dbar \
> "
> -------------> snap <--------------
>=20
> Is it possible to do what we want? And what's the right way to do it?

You need to set SRCREV_FORMAT variable.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+nBD6E3TurpgldQp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWANU0ACgkQN1Ujt2V2gBwWlwCfWE7OgBkljhULTw49TjXXH0uM
/wgAn0vIoe3bsctOaFW9asZ2d1HTfKN6
=C8Y+
-----END PGP SIGNATURE-----

--+nBD6E3TurpgldQp--
