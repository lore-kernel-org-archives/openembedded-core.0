Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f52.google.com (unknown [209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id F0FF3660FD;
	Thu, 15 May 2014 13:01:41 +0000 (UTC)
Received: by mail-la0-f52.google.com with SMTP id gl10so774808lab.11
	for <multiple recipients>; Thu, 15 May 2014 06:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=6syA8NVIWCxzepknB6ZV4aKekns+tr3nlDgubBT5swE=;
	b=AV9SHubbjLyWKHfR0n+VVc5yc13/4FBpFmh9tXC0urFIGsGbfzAI1AWS5OAC8q5tJS
	jIhfCWSHtHEaAnOEnJxKW2xoBVHlKTJ4niGG6fjk88+bp1Z/rpzOZGrFzoYCTpyHoBNc
	PDKHGbdrw+zpt1fszEbda7akgW/zHiGEizs/O+A/4rMWmhH74ZMqyhVuSizxS7dHsluo
	dgdsFpy1u05Z+7aA2DhSrY58Wk0e548+EUuQLExJUQTtLHpppFTbcBDhjaq9CHe9x7Lt
	kB3BhYg83YEBUEmfMR+NaSiPVIwRA+/BCpj8eOhhuwBtIUZTD3NAJC+3kofXIdm7aeFh
	oS9Q==
X-Received: by 10.112.189.103 with SMTP id gh7mr7022981lbc.35.1400158901213;
	Thu, 15 May 2014 06:01:41 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id n3sm6017942lan.3.2014.05.15.06.01.39
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 May 2014 06:01:39 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 15 May 2014 15:02:10 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140515130210.GE2433@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, Failed tasks 2014-05-15
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
X-List-Received-Date: Thu, 15 May 2014 13:01:42 -0000
X-Groupsio-MsgNum: 53244
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jkO+KyKz7TfD21mV"
Content-Disposition: inline

--jkO+KyKz7TfD21mV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This build still contains huge patch setting B =3D S or inherit for
autotools-brokensep for all recipes which were failing in earlier
master builds.

abiword, libssh broken by libgcrypt upgrade (possible fix for libssh was se=
nt to ML today)
firefox broken by freetype upgrade (possible fix for harfbuzz was sent to M=
L yesterday)

grub.do_package failing again for some reason
openembedded-core/meta/recipes-rt/rt-tests/hwlatdetect_0.85.bb, do_install =
failing for some unknown reason as well

I plan to start new full test-dependencies build now, so builder will
be N/A for next 15 days.

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2014-05-15 =3D=3D

=3D=3D=3D common (3) =3D=3D=3D
    * meta-openembedded/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb, =
do_compile
    * meta-openembedded/meta-oe/recipes-support/libssh/libssh_git.bb, do_co=
mpile
    * openembedded-core/meta/recipes-rt/rt-tests/hwlatdetect_0.85.bb, do_in=
stall

=3D=3D=3D common-x86 (2) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
    * openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package

=3D=3D=3D qemuarm (0) =3D=3D=3D

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs=
_git.bb, do_compile

=3D=3D=3D Number of failed tasks =3D=3D=3D
{| class=3Dwikitable
|-
||qemuarm       ||3     ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140515_072544.log/
|-
||qemux86       ||5     ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140515_084100.log/
|-
||qemux86_64    ||6     ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140515_100259.log/
|}

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jkO+KyKz7TfD21mV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlN0utIACgkQN1Ujt2V2gBxBsgCeJsiTh+ElupryEsWLCXB9BXQ+
QQYAnjAEa5Ac3RmRjNCBUTiHN9y7pQeh
=q8cD
-----END PGP SIGNATURE-----

--jkO+KyKz7TfD21mV--
