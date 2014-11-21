Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id C0BBA65C91;
	Fri, 21 Nov 2014 18:50:44 +0000 (UTC)
Received: by mail-wg0-f53.google.com with SMTP id l18so7200576wgh.26
	for <multiple recipients>; Fri, 21 Nov 2014 10:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=G13gXxRBro/kzSAfyLunIvWWd0eXcdwXxFG+K93LyNU=;
	b=TbkM2CxM+2KRSrBm5xTqHJyO7yFxasPkM2Dw4cUExcnMztTcZRKg7N4YVAkqm/CqiH
	mA+xi/Ng4QV53iqxXu7vJiZDVTqFwcUViofTry6k0sAxlSg4V7N2KQ9MvFHHpR0FRTIm
	oRUABwMh8keZ/DaUQHSj5QLv3++mO9r4/3DKtpaAQScgtzcxvMfF+0WljlZJyiGQBJmW
	fDZZKkxShGJjzjxsFhviEC3Hzn/o1/ZPcA3arAvqP96X0mvzGZK7+sw+pQLeoKJoJLYG
	VgfPMsoEKmyeGNy7XRk/SfQHsGrYWdAF/QraUN/X0q1+6Az4xFFtx5Y2KNKmMZ44ZrKb
	xRjw==
X-Received: by 10.180.126.104 with SMTP id mx8mr13830232wib.21.1416595844508; 
	Fri, 21 Nov 2014 10:50:44 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	mw7sm217081wib.14.2014.11.21.10.50.43 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Nov 2014 10:50:43 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 21 Nov 2014 19:50:46 +0100
To: Andrea Adami <andrea.adami@gmail.com>
Message-ID: <20141121185046.GN2163@jama>
References: <20141119140143.GB3315@jama>
	<CAAQYJAtMvgZXe4SAuvet3-rtt5oXoXWMt3CnuzJ2dQy+HTLQHQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAQYJAtMvgZXe4SAuvet3-rtt5oXoXWMt3CnuzJ2dQy+HTLQHQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2014-11-19
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
X-List-Received-Date: Fri, 21 Nov 2014 18:50:45 -0000
X-Groupsio-MsgNum: 59845
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9v2bTOXBzuB5Piju"
Content-Disposition: inline

--9v2bTOXBzuB5Piju
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2014 at 06:24:26PM +0100, Andrea Adami wrote:
> On Wed, Nov 19, 2014 at 3:01 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > http://www.openembedded.org/wiki/Bitbake_World_Status
> >
> > =3D=3D Failed tasks 2014-11-19 =3D=3D
> >
> > =3D=3D=3D common (12) =3D=3D=3D
> >     * meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc-sta=
tic-utils_2.0.4.bb, do_compile
> >     * meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc_2.0=
=2E4.bb, do_compile
>=20
> Hi Martin,
>=20
> thanks for the huge build-tests!
>=20
> About klibc, I'm under the impression your git pull was done just
> before the klibc fix went in meta-initramfs.
> This is supposedly fixed now.
>=20
> Yes, klibc is especially fragile with regard to the toolchain changes
> in oe-core ;)

Yes it was most likely triggered before them.

Current builds don't show klibc issue anymore (will send report in 2-3
days).

Thanks!

>=20
> Cheers
> Andrea
>=20
>=20
> >     * meta-openembedded/meta-oe/recipes-connectivity/umip/umip_1.0.bb, =
do_compile
> >     * meta-openembedded/meta-oe/recipes-devtools/php/php_5.4.33.bb, do_=
compile
> >     * meta-openembedded/meta-oe/recipes-extended/acpica/acpitests_20140=
828.bb, do_compile
> >     * meta-openembedded/meta-oe/recipes-extended/ddrescue/ddrescue_1.19=
=2Ebb, do_unpack
> >     * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb,=
 do_compile
> >     * meta-openembedded/meta-oe/recipes-support/mysql/mysql-python_1.2.=
4.bb, do_compile
> >     * meta-openembedded/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10=
=2E3.bb, do_configure
> >     * meta-smartphone/meta-shr/recipes-shr/3rdparty/iliwi_git.bb, do_co=
mpile
> >     * meta-smartphone/meta-shr/recipes-shr/3rdparty/sensmon_git.bb, do_=
compile
> >     * meta-smartphone/meta-shr/recipes-shr/3rdparty/valacompass_git.bb,=
 do_compile
> >
> > =3D=3D=3D common-x86 (0) =3D=3D=3D
> >
> > =3D=3D=3D qemuarm (2) =3D=3D=3D
> >     * meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/libhuget=
lbfs_git.bb, do_fetch
> >     * meta-smartphone/meta-android/recipes-multimedia/android-audiosyst=
em/android-audiosystem_bzr.bb, do_compile
> >
> > =3D=3D=3D qemux86 (0) =3D=3D=3D
> >
> > =3D=3D=3D qemux86_64 (0) =3D=3D=3D
> >
> > =3D=3D=3D Number of failed tasks =3D=3D=3D
> > {| class=3Dwikitable
> > |-
> > ||qemuarm       ||14    ||http://logs.nslu2-linux.org/buildlogs/oe/worl=
d//log.world.20141110_065307.log/||http://errors.yoctoproject.org:80/Errors=
/Search/1/3219/
> > |-
> > ||qemux86       ||12    ||http://logs.nslu2-linux.org/buildlogs/oe/worl=
d//log.world.20141110_221551.log/||http://errors.yoctoproject.org:80/Errors=
/Search/1/3220/
> > |-
> > ||qemux86_64    ||13    ||http://logs.nslu2-linux.org/buildlogs/oe/worl=
d//log.world.20141111_143018.log/||http://errors.yoctoproject.org:80/Errors=
/Search/1/3241/
> > |}
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9v2bTOXBzuB5Piju
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRviYYACgkQN1Ujt2V2gBwGSwCgrxOXs46cLM+szQ//AYAmESLs
ZEYAoINHt7h1MtNQaiM4cdPvrkGlnhYO
=BH1x
-----END PGP SIGNATURE-----

--9v2bTOXBzuB5Piju--
