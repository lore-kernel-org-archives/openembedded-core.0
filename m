Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id A03C66080F;
	Fri, 11 Mar 2016 16:10:42 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id p65so24060137wmp.1;
	Fri, 11 Mar 2016 08:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=kBQwURdcSLNcfSARgrmekKcO2JpzSuCuNT5dYVWoV3g=;
	b=Ezw8H/02SDTVNfOMP65RSnMhKs3h5rTbuaTrjXKNczIXGQ4n/HfmLAt3/7Zd+BuaW0
	VRbVBl82kMQiONVfI6Na7zfwjG742iamtNEOlWvsi5dB0jUNrt0VglAtI9NEq3pIi/UP
	kOyvxNPtaQL3UJ+T/T6zB8zG0BO3szWVXsO1NLlUfd0tVt8/AyI4SNtAgYK+gLRH/+gC
	xYZAgW5saDaMC8eB4kCh/c5gmpLE3PJmQlYMYoEAdtnH4wQt2SxglXVsqk/kRp0WHwXI
	pF8X7zrOD5wRxdyp+0wCpzPJMZ5nGTD/c0U9zsLj/ofXYYO4uPwT3UaAa7cG18HZtUzb
	qvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=kBQwURdcSLNcfSARgrmekKcO2JpzSuCuNT5dYVWoV3g=;
	b=isyM1WDNAKTZXIYGUy4ET0EZRQ0qb3kl0ktQfm08xq0hlytnarJWD1GM872mmM1TZB
	IGFIkAsDCDHVTvwuDHR+ujKORBd7PNypj1jvG5iXcrzlNA++kzaIx4dyysRsIVmL03dQ
	xIh7ppzLaGwQOJ/ivNPz+IKEDbEMz5tfdb9+av7R1rVwPT2iLd3/94qgWIuB8bFTwErT
	SxPAYPqD/CzO22cAo4DTGF79o4iI4F/GafnHqHYwFTZCUUcdP0JJ5AxrIDfoaCKQapfr
	CoQGOo9kxKEkRtZKE3pjf4ExIwvXhlracLeIQpt8O/dx219wBDX/HKmS3W+0trUC2D/9
	l9KA==
X-Gm-Message-State: AD7BkJI/Zwjf6R+9K1h/UQXuVy4qqYdpJqqv4J7LZrpCcFZbT9bbhUHurkVHx4Rp8FKdbw==
X-Received: by 10.194.189.7 with SMTP id ge7mr10675543wjc.72.1457712642795;
	Fri, 11 Mar 2016 08:10:42 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id 8sm2958801wmk.13.2016.03.11.08.10.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Mar 2016 08:10:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 11 Mar 2016 17:13:53 +0100
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <20160311161353.GA2646@jama>
References: <20160310115301.GC2573@jama> <56E2E731.1040005@windriver.com>
	<CADkTA4N43Zi=oLVRe99eEvvPjgYethKFNKH3J90Bss_AzqovVg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4N43Zi=oLVRe99eEvvPjgYethKFNKH3J90Bss_AzqovVg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2016-03-09
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
X-List-Received-Date: Fri, 11 Mar 2016 16:10:43 -0000
X-Groupsio-MsgNum: 79482
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Content-Disposition: inline

--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 11, 2016 at 10:52:14AM -0500, Bruce Ashfield wrote:
> On Fri, Mar 11, 2016 at 10:41 AM, Mark Hatle <mark.hatle@windriver.com>
> wrote:
>=20
> > On 3/10/16 5:53 AM, Martin Jansa wrote:
> > > Aggressive PNBLACKLISTing continues. But linux-yocto (and modules
> > depending on it)
> > > are still broken :/.
> > >
> > > I'll look at cef3 and chromium issue, my recent patch for meta-browser
> > > fixed the build for armv7a MACHINEs, so it probably needs to be exten=
ded
> > > a bit to cover warnings in x86 and then duplicate the same to cef3.
> > > This issue is there for so long, slowing down the builds significantly
> > > (and causing logs to be much bigger) - I don't use these recipes but I
> > > hate the failures even more.
> > >
> >
> > Is see the reported log failure, but I've been building with the oe-core
> > and
> > poky linux-yocto head of master for the last couple weeks, all arches
> > includes
> > qemux86.
> >
>=20
>=20
> I don't know what to say about those failures either. I've been chasing
> perf build
> races for the past week, and that includes building linux-yocto hundreds =
of
> times,
> and I've never seen the uapi headers not be in place like the logs show.

My guess (and supported by Andrea) is that it's caused by
linux-yocto-tiny which is built as part of bitbake world and probably
not included in your tests when you build the same linux-yocto.

That would also explain why these issues break almost every qemux86 and
I haven't seen them for qemuarm, linux-yocto-tiny has:
  COMPATIBLE_MACHINE =3D "(qemux86)"

Try to run
"bitbake linux-yocto linux-yocto-tiny" couple times and maybe you'll be
able to reproduce it.

For next runs I've PNBLACKLISTED linux-yocto-tiny and
linux-yocto-tiny-kexecboot:
https://github.com/shr-project/jenkins-jobs/commit/c168b7824c2c68bd5894532f=
c122929d2d9df9a7

> The Yocto AB is also not showing it to me.
>=20
> Unless I can get access to a broken build, I'm at a loss to actually debug
> and
> fix it.
>=20
> Bruce
>=20
>=20
> >
> > I don't see the error on my builder.  Is something changing the default
> > recipe/kernel configuration triggering the fault?
> >
> > --Mark
> >
> > > =3D=3D=3D qemux86 (2) =3D=3D=3D
> > >     * /meta-openembedded/meta-python/recipes-devtools/python/
> > python-m2crypto_0.23.0.bb, do_compile
> > >     * /openembedded-core/meta/recipes-kernel/linux/linux-yocto_4.4.bb,
> > do_compile
> >
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
>=20
>=20
>=20
> --=20
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbi7r8ACgkQN1Ujt2V2gBxIqACgl727VVGzEhWryBAEz33G2DRa
KK8An3hG5zOG2TiS+G9K7ObqEwTJ2q9e
=QwG9
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
