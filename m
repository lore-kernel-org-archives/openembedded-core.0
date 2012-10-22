Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TQEhv-0004CG-EG
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 11:54:03 +0200
Received: by mail-ea0-f175.google.com with SMTP id c1so724187eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2012 02:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=oA7uLk/IG9HhA376I2hhA0RSaEiiYqbdkrVzlIaO2Dw=;
	b=0X+g8arMLNc3Eu/ExGRvmA/gmsjmNFk/c0c5REsHMk/ltD20AlA04LW2NNVjG8e0my
	PU6+FjJGpJ4r1uJTGaLnTOOYbSGnNmaVYdjwqg8PiwDiGNquXjGmnkkLACv2QgQsX3tB
	heeOaLvJCt9UTvndUFnXdCpkATQ4E6MGPQBqOsVOfTlGF0N9LfwBwRhryQ8WKzMEGi/x
	BgNm6bfrZSzhiEOEfsTrcdV/wcZaPSN13WiDHXsK5FffzQycwJ44WR+Ymtivd/DE3Bd3
	xAlar3iVh8sXgzii82LxELkGtcN2jgsK+6n31WNg66k8UotRzJnA/U1AyohftPpc3vPe
	GUng==
Received: by 10.14.179.1 with SMTP id g1mr11266979eem.14.1350898838911;
	Mon, 22 Oct 2012 02:40:38 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k2sm15088443eep.15.2012.10.22.02.40.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 22 Oct 2012 02:40:27 -0700 (PDT)
Date: Mon, 22 Oct 2012 11:40:42 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Jack Mitchell <ml@communistcode.co.uk>
Message-ID: <20121022094042.GB3269@jama.jama.net>
References: <508513C8.8070304@communistcode.co.uk>
MIME-Version: 1.0
In-Reply-To: <508513C8.8070304@communistcode.co.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: build failures: rpath - gettext related?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Oct 2012 09:54:03 -0000
X-Groupsio-MsgNum: 30785
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZfOjI3PrQbgiZnxM"
Content-Disposition: inline

--ZfOjI3PrQbgiZnxM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 22, 2012 at 10:37:12AM +0100, Jack Mitchell wrote:
> On my weekly 'git pull master' build I am facing rpath errors which seem=
=20
> to be related to gettext?

http://lists.linuxtogo.org/pipermail/openembedded-core/2012-October/031120.=
html

>=20
> Parsing recipes: 100% |#########################################| ETA: =
=20
> 00:00:00
> Parsing of 888 .bb files complete (0 cached, 888 parsed). 1196 targets,=
=20
> 61 skipped, 8 masked, 0 errors.
>=20
> Build Configuration:
> BB_VERSION        =3D "1.16.0"
> TARGET_ARCH       =3D "arm"
> TARGET_OS         =3D "linux-gnueabi"
> MACHINE           =3D "beaglebone"
> DISTRO            =3D "poky"
> DISTRO_VERSION    =3D "1.3+snapshot-20121022"
> TUNE_FEATURES     =3D "armv7a vfp neon cortexa8"
> TARGET_FPU        =3D "vfp-neon"
> meta
> meta-yocto        =3D "master:7090cbe2c94f37baeb4e67cf3a822974d7dd0e61"
> meta-ti           =3D "master:4f3522a9dc7f04e2f650199d66badb08dad214c6"
> meta-db           =3D "master:4dbfea5ae4acf397d4e28a3b164860f4c8064801"
>=20
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> ERROR: Function failed: do_configure (see=20
> /mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/work/x86_6=
4-linux/bison-native-2.5.1-r0/temp/log.do_configure.3008=20
> for further information)
> ERROR: Logfile of failure stored in:=20
> /mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/work/x86_6=
4-linux/bison-native-2.5.1-r0/temp/log.do_configure.3008
> Log data follows:
> | DEBUG: Executing python function sysroot_cleansstate
> | DEBUG: Python function sysroot_cleansstate finished
> | DEBUG: Executing shell function autotools_preconfigure
> | DEBUG: Shell function autotools_preconfigure finished
> | DEBUG: Executing shell function do_configure
> | automake (GNU automake) 1.12.3
> | Copyright (C) 2012 Free Software Foundation, Inc.
> | License GPLv2+: GNU GPL version 2 or later=20
> <http://gnu.org/licenses/gpl-2.0.html>
> | This is free software: you are free to change and redistribute it.
> | There is NO WARRANTY, to the extent permitted by law.
> |
> | Written by Tom Tromey <tromey@redhat.com>
> |        and Alexandre Duret-Lutz <adl@gnu.org>.
> | AUTOV is 1.12
> | cp: cannot stat=20
> '/mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/sysroots/=
x86_64-linux/usr/share/gettext/config.rpath':=20
> No such file or directory
> | ERROR: Function failed: do_configure (see=20
> /mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/work/x86_6=
4-linux/bison-native-2.5.1-r0/temp/log.do_configure.3008=20
> for further information)
> ERROR: Task 707=20
> (virtual:native:/mnt/storage/yoctoBuilds/poky-beaglebone.git/meta/recipes=
-devtools/bison/bison_2.5.1.bb,=20
> do_configure) failed with exit code '1'
> ERROR: Function failed: do_configure (see=20
> /mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/work/x86_6=
4-linux/flex-native-2.5.35-r3/temp/log.do_configure.3009=20
> for further information)
> ERROR: Logfile of failure stored in:=20
> /mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/work/x86_6=
4-linux/flex-native-2.5.35-r3/temp/log.do_configure.3009
> Log data follows:
> | DEBUG: Executing python function sysroot_cleansstate
> | DEBUG: Python function sysroot_cleansstate finished
> | DEBUG: Executing shell function autotools_preconfigure
> | DEBUG: Shell function autotools_preconfigure finished
> | DEBUG: Executing shell function do_configure
> | automake (GNU automake) 1.12.3
> | Copyright (C) 2012 Free Software Foundation, Inc.
> | License GPLv2+: GNU GPL version 2 or later=20
> <http://gnu.org/licenses/gpl-2.0.html>
> | This is free software: you are free to change and redistribute it.
> | There is NO WARRANTY, to the extent permitted by law.
> |
> | Written by Tom Tromey <tromey@redhat.com>
> |        and Alexandre Duret-Lutz <adl@gnu.org>.
> | AUTOV is 1.12
> | cp: cannot stat=20
> '/mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/sysroots/=
x86_64-linux/usr/share/gettext/config.rpath':=20
> No such file or directory
> | ERROR: Function failed: do_configure (see=20
> /mnt/storage/yoctoBuilds/poky-beaglebone.git/beaglebone-db/tmp/work/x86_6=
4-linux/flex-native-2.5.35-r3/temp/log.do_configure.3009=20
> for further information)
> ERROR: Task 1566=20
> (virtual:native:/mnt/storage/yoctoBuilds/poky-beaglebone.git/meta/recipes=
-devtools/flex/flex_2.5.35.bb,=20
> do_configure) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 122 tasks of which 116 didn't need to be=
=20
> rerun and 2 failed.
> Waiting for 0 running tasks to finish:
>=20
> Summary: 2 tasks failed:
> virtual:native:/mnt/storage/yoctoBuilds/poky-beaglebone.git/meta/recipes-=
devtools/bison/bison_2.5.1.bb,=20
> do_configure
> virtual:native:/mnt/storage/yoctoBuilds/poky-beaglebone.git/meta/recipes-=
devtools/flex/flex_2.5.35.bb,=20
> do_configure
> Summary: There were 2 ERROR messages shown, returning a non-zero exit cod=
e.
>=20
> Any ideas? Would Richards patch '[OE-core] [PATCH] gettext: Add=20
> config.rpath and Makefile.in.in to gettext-minimal-native' possibly fix=
=20
> the issue?
>=20
> Regards,
>=20
> --=20
>=20
>    Jack Mitchell (jack@embed.me.uk)
>    Embedded Systems Engineer
>    http://www.embed.me.uk
>=20
> --
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZfOjI3PrQbgiZnxM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCFFJoACgkQN1Ujt2V2gBwq1gCfZh3rxfBWIpt1jY3GyN0HE1Pj
eSkAoLJ3v0eCeGXTYGrKF9kaNdw5vSAx
=pvjn
-----END PGP SIGNATURE-----

--ZfOjI3PrQbgiZnxM--
