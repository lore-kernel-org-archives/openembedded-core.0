Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4F9866013D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Mar 2016 15:53:55 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id n186so10396686wmn.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Mar 2016 07:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=nSWLqbXoYyVbeOYBQ99kx3MGOp8E5nVRJaZKVYjZXno=;
	b=AMCQN3tfTulzXBQzX5mgGuoQWovlOjLhzwxPUWy0BxoTaTm88oiMBjhxBC7lsWhVd3
	ISSAbzE6al+E0qWUDtSM3LeQCyySAZB7q0xeoXzqOG5Yhwtr813MhM+83w0NIiAJFQOo
	TQsUnEKc7+31yL89OJ7m+x+LSUCgIJeKCm+T05aqZs0l3wjkKLvA/4N06ynbKwSbdBjK
	molQjMZQ5ME5EpLI3j2a1n2WHL2HAMHofVvZyN+Ylp84JrNRosMvq8b5rb0LQApxG/px
	251q1uq3QtMpSAweQAazf1jsBXUkOla1vjccUh0VwbD+o7vlgUP0EeIX7yWYoc8FFkB9
	UCEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=nSWLqbXoYyVbeOYBQ99kx3MGOp8E5nVRJaZKVYjZXno=;
	b=BH0J9PYV8ees9c9OPimR/9cE++LfLeeJxB1XZoAEcuF2g1M/rp637tQ+Od2XfMOiUo
	xSCAC3R2Y7vQYUdwxfKYshXXOHTXGL94bkRQDN2egUCj9WPYn+KFnj9FgjrtdvZl1eLh
	jvH95Ho7I3/m5varHF1ZP5aXkgzB7F77e+UMDw1f5DU9bmUdYniXQAYulAbJ9sJlD/0C
	Af2uQdSkTQfQ03k3QtzboBHAmS118PF6iHBFW/k8bVhAa07+7c99HwzUaftQntTMXkeP
	6M8LjpWDLkPidUHWjjhalMANoGeYQ5+rsRgKIOF1hgfIsTBBJrGi4eeyjEP9o4OAqA5N
	Ptcw==
X-Gm-Message-State: AD7BkJL6rEN5vNGBdTeZXGKzlk2upCuSPxts89M2J4dUkd3aAGuOEISVzqs2wUqgX+BIYQ==
X-Received: by 10.194.112.165 with SMTP id ir5mr32063533wjb.113.1456934036394; 
	Wed, 02 Mar 2016 07:53:56 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id v2sm4759448wmd.24.2016.03.02.07.53.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Mar 2016 07:53:55 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 2 Mar 2016 16:55:54 +0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20160302155554.GD10529@jama>
References: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
	<549d5d18a9fe89af398559b3f8df60bb66643392.1456415870.git.alexander.kanavin@linux.intel.com>
	<89F0A1C5-6710-4F62-A646-0A2FDDDC75D8@gmail.com>
	<56D5A3B1.8080008@linux.intel.com>
	<CAMKF1sqDVjNH_XLhbY+86BdFx9vZZpaw8j-XNDTM67st=LWW=Q@mail.gmail.com>
	<56D6F62C.2020000@linux.intel.com>
	<CAMKF1sqNKzREAVcpQQry9preJf0Jnj6U245CcTE-vpubQ9jJ1w@mail.gmail.com>
	<1456932205.25131.33.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1456932205.25131.33.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/19] nspr: update to 4.12
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
X-List-Received-Date: Wed, 02 Mar 2016 15:53:57 -0000
X-Groupsio-MsgNum: 79040
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GpGaEY17fSl8rd50"
Content-Disposition: inline

--GpGaEY17fSl8rd50
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 02, 2016 at 03:23:25PM +0000, Richard Purdie wrote:
> On Wed, 2016-03-02 at 06:30 -0800, Khem Raj wrote:
> > On Wed, Mar 2, 2016 at 6:18 AM, Alexander Kanavin
> > <alexander.kanavin@linux.intel.com> wrote:
> > > his probably could be however OE-Core supports musl and poky
> > > > -tiny
> > > > defaults to it. It will be good to test
> > > > changes for it when changing OE-Core at the least bitbake -cpatch
> > > > <recipe>
> > >=20
> > >=20
> > > Yes, but that's a job for autobuilder,
> >=20
> > There is a musl job on autobuilder. Not sure if its run daily. Ross ?
>=20
> Its run manually at the moment. We've been working to get to the point
> where its reliable, then we'll add it to the list of build tests we
> run. I think we're now at that point actually.
>=20
> Beth: Should we enable musl and no-x11 by default?

Can someone enable also read-only and thumb on one of qemuarm builds?

You can probably just change current qemuarm builds to do read-only and
thumb, because this combination will catch more issues that read-write
and without-thumb. See:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9155
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9155

>=20
> Cheers,
>=20
> Richard
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GpGaEY17fSl8rd50
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbXDQkACgkQN1Ujt2V2gBwZ0ACfZpTGALvChRUSKlXPYAcrAxac
TMwAnAt3BC6/dskVzKtyT3rqq5Vr3HrH
=9ALb
-----END PGP SIGNATURE-----

--GpGaEY17fSl8rd50--
