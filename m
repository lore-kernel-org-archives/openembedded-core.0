Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 03EF465D67;
	Wed, 30 Apr 2014 16:06:12 +0000 (UTC)
Received: by mail-la0-f50.google.com with SMTP id gl10so1386307lab.37
	for <multiple recipients>; Wed, 30 Apr 2014 09:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=RPvw4XJYtz9odt1cZL+2rpUToEO8cbKzpv+GznKRl8o=;
	b=C+6yHkxOsa2rgblJGuSFhDG4KB3gCaCGOjVBop4saZKh+9SBU6mqSAJIeYgURBiEWs
	uubLD7+1keYWXgyAxYDhFPTpCqbX/Td8C4vICAqdcREoE82xKRYv/uRvcckaYmV5Jp3t
	txYfHnawQryOiFPrVqg9CprWAXPa4Y6b/SaGWG2ILEnhHS7BMEIfnQQasJq3MrVr9iAl
	k5vIALs3vYfZlls6V8wiTiZMDvgB2Ub7dqDwQurSmBb2yLoeagz4GQe5aF0QWFrqjzIN
	dIeK4rBYEDj7xq1qvr0M5w8IIzllwQJq3Tf1lenP06JOVAQQvlmec6eUfnm++PSjhRR1
	RttA==
X-Received: by 10.152.19.65 with SMTP id c1mr2185761lae.35.1398873972883;
	Wed, 30 Apr 2014 09:06:12 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fa8sm26732889lbc.18.2014.04.30.09.06.10 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Apr 2014 09:06:11 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 30 Apr 2014 18:06:26 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140430160626.GN2486@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, Failed tasks 2014-04-30
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
X-List-Received-Date: Wed, 30 Apr 2014 16:06:16 -0000
X-Groupsio-MsgNum: 52716
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="roczexVbllXyERLp"
Content-Disposition: inline

--roczexVbllXyERLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Khem sent couple of patches for B!=3DS issues, bit thanks to him!
>=20
> I have local patch to set B=3DS/autotools-brokensep for remaining failing
> recipes, but I'll wait a bit more for people to send fixes.

This patch was included in this build, that's why there is only few
issues, next build will include oe-core/daisy to help with meta-oe/daisy
stabilization.

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2014-04-30 =3D=3D

=3D=3D=3D common (6) =3D=3D=3D
    * meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.b=
b, do_compile
    * meta-openembedded/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb, do_c=
onfigure
    * meta-openembedded/meta-oe/recipes-devtools/log4cplus/log4cplus_1.1.1.=
bb, do_configure
    * meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_comp=
ile
    * meta-openembedded/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb,=
 do_configure
    * meta-openembedded/meta-webserver/recipes-php/xdebug/xdebug_2.2.3.bb, =
do_configure

=3D=3D=3D common-x86 (3) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
    * meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_com=
pile
    * openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package

=3D=3D=3D qemuarm (1) =3D=3D=3D
    * openembedded-core/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb, d=
o_compile

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libim=
obiledevice_1.1.4.bb, do_configure

=3D=3D=3D Number of failed tasks =3D=3D=3D
{| class=3Dwikitable
|-
||qemuarm       ||7     ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140429_174836.log/
|-
||qemux86       ||9     ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140429_192931.log//
|-
||qemux86_64    ||10    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140429_215135.log//
|}

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--roczexVbllXyERLp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNhH4IACgkQN1Ujt2V2gBw9mwCeKiIy4tCOOtw9NbVDJ0D4GmAH
OHcAoI2IP0kp7x2VPkR6LAIh/WsaS0IW
=cARX
-----END PGP SIGNATURE-----

--roczexVbllXyERLp--
