Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 15B307733D;
	Sat, 18 Feb 2017 02:23:38 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id r141so21213911wmg.1;
	Fri, 17 Feb 2017 18:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=HdrJBdM14niNTgwdU9Myn81TFum2w2YixkKgTwLzVPE=;
	b=Hkip0oPCfz9fJmUyLMGQx8uK1OK5KcyDp4/mPbK9/ZtA6SVHwDEJTIdQ4oxECx17PB
	jwpzOKpMltOf7Z4GKr/yQd8BP3phHygdfkz/9y+gTH2IxP6uFTC2CziTzhciWc2LCBgr
	X+zFqE1ccUZDOZDPwgY7KZHhoxoLt/4entZQUyAYyURaS79XOSZswpQWCvBqBlicKI6C
	VCapS2YCIVC88PZ+hHhsF80cWh67XQfdScblS5aoWCybpdgbm/vmUA7m1sm5OFXQh9cd
	3TO6NlDSuKqb5DH2UEYrgnuekEUrEqz3FvNn7l5SmwMROlRwrQYzQoDNpdoS4dY6EtdK
	meJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=HdrJBdM14niNTgwdU9Myn81TFum2w2YixkKgTwLzVPE=;
	b=edNoqX9gh1je0c4EiuOCVhW12tb+Rm1xHuLZJVa4HOYCmhJXmzg0Fp9RZlE6A5i1Nm
	MBq9zNBnEMEaVg3HWrLku+HLLX0VSEUqg5EEvRB4pZD7EkRJLlBJGvUEHMAiMJhSMPqb
	7+AHeWBNE9lFvvWM8h81RNW2y8YPjKjNGz3ihODirbahrVgbqV0nNXeSeF9SzjLT8kAO
	q56EZCIs6fey0GMol2cv4xvaS4iGwvD5YbS85oE9JSDHqx/e16wrC9zMlYU/CWG8erUY
	LPV4yrlmT7ILvOsQOt6Vfxkh+NHPpz7stPU7rjPeHh4CGygxqomXrI6I+gIWiTkIvl3W
	cKKw==
X-Gm-Message-State: AMke39lnWdSZA8qFqblArfl/AoJhI0zYgGffkAF2/Jb0geFoD/xL6UxzlzdDiTeK4dBDSQ==
X-Received: by 10.28.173.74 with SMTP id w71mr6256007wme.14.1487384618532;
	Fri, 17 Feb 2017 18:23:38 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	y145sm3807665wmc.17.2017.02.17.18.23.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 17 Feb 2017 18:23:37 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 18 Feb 2017 03:23:38 +0100
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20170218022338.GA29441@jama>
References: <20170216124415.GC3621@jama>
	<CA+chaQe=BDKT49-jnDzsTObntQ-wte4J4cmBcdjmBxUq2_XZYA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQe=BDKT49-jnDzsTObntQ-wte4J4cmBcdjmBxUq2_XZYA@mail.gmail.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: Re: State of bitbake world, Failed tasks 2017-02-14
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
X-List-Received-Date: Sat, 18 Feb 2017 02:23:39 -0000
X-Groupsio-MsgNum: 93520
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Content-Disposition: inline

--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2017 at 11:08:25PM +0100, Martin Jansa wrote:
> There are 2 more issues in oe-core once I enable ptest (together with
> already enabled gold):

Both issues still exist in master:

apr: http://errors.yoctoproject.org/Errors/Details/133693/
parted: http://errors.yoctoproject.org/Errors/Details/133692/

> oe-core/meta/recipes-support/apr/apr_1.5.2.bb:do_compile_ptest_base
>=20
> | ../.libs/libapr-1.so: error: undefined reference to 'pthread_mutexattr_=
init'
> | ../.libs/libapr-1.so: error: undefined reference to
> 'pthread_mutexattr_settype'
> | ../.libs/libapr-1.so: error: undefined reference to
> 'pthread_mutexattr_destroy'
> | ../.libs/libapr-1.so: error: undefined reference to 'pthread_mutex_tryl=
ock'
> | ../.libs/libapr-1.so: error: undefined reference to 'pthread_sigmask'
> | ../.libs/libapr-1.so: error: undefined reference to
> 'pthread_attr_setstacksize'
> | ../.libs/libapr-1.so: error: undefined reference to 'pthread_create'
> | ../.libs/libapr-1.so: error: undefined reference to 'pthread_join'
> | ../.libs/libapr-1.so: error: undefined reference to 'pthread_detach'
> | ../.libs/libapr-1.so: error: undefined reference to 'pthread_once'
> | ../.libs/libapr-1.so: error: undefined reference to 'pthread_key_create'
> | ../.libs/libapr-1.so: error: undefined reference to 'pthread_getspecifi=
c'
> | ../.libs/libapr-1.so: error: undefined reference to 'pthread_setspecifi=
c'
> | ../.libs/libapr-1.so: error: undefined reference to 'pthread_key_delete'
> | collect2: error: ld returned 1 exit status
> | make[1]: *** [globalmutexchild] Error 1
>=20
>=20
> oe-core/meta/recipes-extended/parted/parted_3.2.bb:do_compile_ptest_base
>=20
> | ../libparted/fs/.libs/libparted-fs-resize.so: error: undefined
> reference to 'uuid_generate'
> | collect2: error: ld returned 1 exit status
> | make: *** [fs-resize] Error 1
>=20
>=20
> Once my morty builds are finished I'll try to reproduce this in
> master, but I think I've seen this failure with ptest before yesterday
> for master as well.
>=20
>=20
> On Thu, Feb 16, 2017 at 1:44 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>=20
> > Another run with couple unblacklists
> >
> > =3D=3D Number of issues - stats =3D=3D
> > {| class=3D'wikitable'
> > !|Date               !!colspan=3D'3'|Failed tasks
> >  !!colspan=3D'6'|Failed depencencies                    !!|Signatures
> >     !!colspan=3D'12'|QA !!Comment
> > |-
> > ||              ||qemuarm       ||qemux86       ||qemux86_64
> > ||qemuarm||max||min     ||qemux86||max||min     ||all   ||already-strip=
ped
> >     ||libdir        ||textrel       ||build-deps    ||file-rdeps
> > ||version-going-backwards       ||host-user-contaminated
> > ||installed-vs-shipped  ||unknown-configure-option
> > ||symlink-to-sysroot    ||invalid-pkgconfig     ||pkgname       ||
> > |-
> > ||2017-02-14    ||0     ||1     ||0     ||N/A   ||N/A   ||N/A   ||N/A
> >  ||N/A   ||N/A   ||0     ||0             ||0             ||0
> >  ||0             ||0             ||198           ||0             ||0
> >      ||0             ||0             ||0             ||0             ||
> > |}
> >
> > http://www.openembedded.org/wiki/Bitbake_World_Status
> >
> > =3D=3D Failed tasks 2017-02-14 =3D=3D
> >
> > INFO: jenkins-job.sh-1.8.17 Complete log available at
> > http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.
> > report.20170214_164708.log
> >
> > =3D=3D=3D common () =3D=3D=3D
> >
> > =3D=3D=3D common-x86 (0) =3D=3D=3D
> >
> > =3D=3D=3D qemuarm (0) =3D=3D=3D
> >
> > =3D=3D=3D qemux86 (1) =3D=3D=3D
> >     * meta-browser/recipes-browser/chromium/chromium-wayland_53.
> > 0.2785.143.bb:do_compile
> >
> > =3D=3D=3D qemux86_64 (0) =3D=3D=3D
> >
> > =3D=3D=3D Number of failed tasks (1) =3D=3D=3D
> > {| class=3Dwikitable
> > |-
> > || qemuarm      || 0     || http://logs.nslu2-linux.org/
> > buildlogs/oe/world/pyro/log.world.qemuarm.20170214_135645.log/ ||
> > |-
> > || qemux86      || 1     || http://logs.nslu2-linux.org/
> > buildlogs/oe/world/pyro/log.world.qemux86.20170214_135710.log/ ||
> > http://errors.yoctoproject.org/Errors/Build/32480/
> > |-
> > || qemux86_64   || 0     || http://logs.nslu2-linux.org/
> > buildlogs/oe/world/pyro/log.world.qemux86-64.20170214_151408.log/ ||
> > |}
> >
> > =3D=3D=3D PNBLACKLISTs (445) =3D=3D=3D
> >
> > =3D=3D=3D QA issues (198) =3D=3D=3D
> > {| class=3Dwikitable
> > !| Count                ||Issue
> > |-
> > ||0     ||already-stripped
> > |-
> > ||0     ||build-deps
> > |-
> > ||0     ||file-rdeps
> > |-
> > ||0     ||host-user-contaminated
> > |-
> > ||0     ||installed-vs-shipped
> > |-
> > ||0     ||invalid-pkgconfig
> > |-
> > ||0     ||libdir
> > |-
> > ||0     ||pkgname
> > |-
> > ||0     ||symlink-to-sysroot
> > |-
> > ||0     ||textrel
> > |-
> > ||0     ||unknown-configure-option
> > |-
> > ||198   ||version-going-backwards
> > |}
> >
> >
> >
> > =3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D
> >
> > Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.
> > signatures.20170214_151247.log/
> >
> > No issues detected
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWKewKQAKCRA3VSO3ZXaA
HMl8AJ44w4IK9q3dtpvDv1fbQ4cUdfwhGQCfW3tff1lUU051N/RUe6c58GYDRo8=
=gX7a
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--
