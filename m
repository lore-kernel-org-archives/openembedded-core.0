Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RRVeR-0004Nd-F2
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Nov 2011 22:07:11 +0100
Received: by bkbzs2 with SMTP id zs2so3881124bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2011 13:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Wl32emmUWn6b0yhMgLQU9troTsY+gXzclXULrsvQueM=;
	b=OCH72a6MBWwID0tL5qhsY0PVHpFKDQC1mPITVFF4SLBg/sh+VaP7CEXm9UZvMzXiud
	7hX/ODhg7UAfnI9taHKrHcifUDK3ihTzKXhev+y/6dncCSMzFb/7z7/laevtxuosDHRI
	HL53urltr15gbbcswRYqajmpkDLwXFN1gYdcI=
Received: by 10.204.152.4 with SMTP id e4mr4890091bkw.56.1321650044847;
	Fri, 18 Nov 2011 13:00:44 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y17sm6437033faa.22.2011.11.18.13.00.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 Nov 2011 13:00:43 -0800 (PST)
Date: Fri, 18 Nov 2011 22:00:31 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111118210031.GE3549@jama.jama.net>
References: <AcyeIrWWrQbxrcnUTeiV6gfV9UFbBg==>
	<4E4787E2B8CABC46A0EF2ED925CDD8DD08FF5B@DFLE30.ent.ti.com>
	<CAMKF1sour_8rk2RTEMFPXLjmidmVFcinYVCeCb0AD1XmfAgM3A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sour_8rk2RTEMFPXLjmidmVFcinYVCeCb0AD1XmfAgM3A@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: uClibc Errors
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
X-List-Received-Date: Fri, 18 Nov 2011 21:07:11 -0000
X-Groupsio-MsgNum: 12643
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cYtjc4pxslFTELvY"
Content-Disposition: inline

--cYtjc4pxslFTELvY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 18, 2011 at 12:14:54PM -0800, Khem Raj wrote:
> On Tue, Nov 8, 2011 at 6:28 AM, Ambrose, Martin <martin@ti.com> wrote:
> > Hello.
> >
> > My goal is to get a baseline uClibc image for an arm architecture.
> > I've tried various mechanisms but eventually end up with build/run-time=
 errors.
> >
> > First attempt was to only use oe-core and specify the following in loca=
l.conf
> > =A0 =A0TCLIBC =3D "uclibc"
>=20
> generally above setting should only be what you need.
>=20
> e.g.
>=20
> $ TCLIBC=3Duclibc bitbake core-image-minimal
>=20
> > =A0 =A0USE_NLS =3D "no"
> > =A0 =A0USE_NLS_glib-2.0 =3D "no"
> > =A0 =A0USE_NLS_glib-2.0-native =3D "yes"
> > =A0 =A0USE_NLS_gcc-cross =3D "no"
> >
> > I try to build core-image-minimal but get an armv5te-oe-linux-uclibceab=
i/glib-2.0-1_2.30.0-r2/glib-2.30.0 build error:
> > =A0 =A0 =A0 =A0./.libs/libglib-2.0.so: undefined reference to `qsort_r'
>=20
> uclibc does not have qsort_r implemented so I think glib is being built w=
rongly

This was fixed today
http://git.openembedded.org/openembedded-core/commit/?id=3D812342e44e9e361a=
0fa93cfcfe65cf4dd6f2fb57

> > I'm surprised this is even trying to build given my settings in local.c=
onf.
> >
> > Next I tried with the meta-micro layer and replace the above conf chang=
es with just
> > =A0 =A0DISTRO=3D "micro-uclibc"
> >
> > Then build micro-base-image and get this packaging error
> > =A0 =A0 =A0 =A0ERROR: QA Issue: non -dev/-dbg/-nativesdk package contai=
ns symlink .so: uclibc-thread-db path \
> > =A0 =A0 =A0 =A0'/work/armv5te-oe-linux-uclibceabi/uclibc-0.9.32-r4.3/pa=
ckages-split/uclibc-thread-db/lib/libthread_db.so'
>=20
> this should be fixed seems like a bug in uclibc packaging
>=20
> >
> > I worked around this by overriding the OE packaging variables in local.=
conf (moved dev-so).
> > =A0 =A0 =A0 =A0WARN_QA =3D "ldflags useless-rpaths rpaths dev-so"
> > =A0 =A0 =A0 =A0ERROR_QA =3D "debug-deps dev-deps debug-files arch la2 p=
kgconfig la perms"
> >
> > Once built I get an immediate error on boot
> > =A0 =A0 =A0 =A0/sbin/init: can't resolve symbol '__register_frame_info'
> > =A0 =A0 =A0 =A0Kernel panic - not syncing: Attempted to kill init!
> >
> > I'm wondering if there is a simple mechanism to clean up the unwind bin=
dings via OE settings.
> >
> > In general, is there a "known-good" procedure for building/using uClibc=
 via oe-core +/- layers?
>=20
> oe-core should be able to build working images with uclibc for all
> supported architectures like eglibc
> however its not tested as much as eglibc images are. I will try to
> spin builds using uclibc and see
> how it goes.
>=20
> >
> > Regards,
> > Martin
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cYtjc4pxslFTELvY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7Gx28ACgkQN1Ujt2V2gBx8IACfajPi+Xg+lP+nqB88F7Uc9wze
zwUAnR1FzctsBKzHhtu7y/ABj+i+Wo/4
=zdc9
-----END PGP SIGNATURE-----

--cYtjc4pxslFTELvY--
