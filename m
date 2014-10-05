Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id EEC36702D2;
	Sun,  5 Oct 2014 05:35:49 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id fb4so1950020wid.4
	for <multiple recipients>; Sat, 04 Oct 2014 22:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=8JtaECrGtdif/Odj3ZTRkf3Dd66RL4gkE5eF7LwupWM=;
	b=a+KarozZKYTaIz2jiRgpmCwvUsTXiA3W0qZE0j2XPWPuWcQ1ggD5oKp3TMehX0rJd/
	NWI8a3ysDWMHexBBKhtG3XIinkRdE92K5JIiwbG5ViJIGNYPN+WVRG10z3DuNeUolguy
	Js6+N3qzHOBdoTi+LIvjc+QUOYlirE2BjYDdLW1mlEfxPlSUS5ksiQsZxncc3rUk/cu3
	tijKKK6IdJa1k+9ISpNOoohWnO8zIaymC/GTpMci3JV/4zyfVzXxixHYPMbZz9ylaJ5I
	K9vOv2RDVL6w7dw+M8lKL+CU2HK2CulfIyrAU5hzGCbKgtxhB2UTdcy1iPC9DzfZmraQ
	zu7A==
X-Received: by 10.194.89.225 with SMTP id br1mr19922417wjb.51.1412487349841;
	Sat, 04 Oct 2014 22:35:49 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	li17sm6903942wic.13.2014.10.04.22.35.49 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 04 Oct 2014 22:35:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 5 Oct 2014 07:36:48 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20141005053648.GQ25706@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, Failed tasks 2014-10-05
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
X-List-Received-Date: Sun, 05 Oct 2014 05:35:52 -0000
X-Groupsio-MsgNum: 58362
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vjTL8WsyNLGAy3AI"
Content-Disposition: inline

--vjTL8WsyNLGAy3AI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Fix for gypsy (navit) and network-something was sent to oe-core
(reverting one change in systemd).

Fix for qtwebengine on qemux86-64 is on oe-devel ML.

I'll look into gdal and subsurface issue shortly. Interestingly gdal is sti=
ll
failing even after I've removed pending patch to upgrade it.

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2014-10-05 =3D=3D

=3D=3D=3D common (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb, do_=
compile

=3D=3D=3D common-x86 (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-extended/subsurface/subsurface_git.=
bb, do_compile

=3D=3D=3D qemuarm (0) =3D=3D=3D

=3D=3D=3D qemux86 (2) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-connectivity/networkmanager/network=
manager_0.9.8.10.bb, do_populate_sysroot
    * meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-geo=
de_2.11.16.bb, do_compile

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks =3D=3D=3D
{| class=3Dwikitable
|-
||qemuarm       ||1     ||http://logs.nslu2-linux.org/buildlogs/oe/world//l=
og.world.20141003_222714.log/||http://errors.yoctoproject.org:80/Errors/Sea=
rch/1/2865/
|-
||qemux86       ||4     ||http://logs.nslu2-linux.org/buildlogs/oe/world//l=
og.world.20141004_044247.log/||http://errors.yoctoproject.org:80/Errors/Sea=
rch/1/2871/
|-
||qemux86_64    ||2     ||http://logs.nslu2-linux.org/buildlogs/oe/world//l=
og.world.20141005_000933.log/||http://errors.yoctoproject.org:80/Errors/Sea=
rch/1/2873/
|}

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vjTL8WsyNLGAy3AI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQw2PAACgkQN1Ujt2V2gBxOSACfW8ntpbeA4tKYOcUYOTNlpQMp
d+MAoJ29nJnJKl2m4v427H762hY/hLuo
=Gdt7
-----END PGP SIGNATURE-----

--vjTL8WsyNLGAy3AI--
