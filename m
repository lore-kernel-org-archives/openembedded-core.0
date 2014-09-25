Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 03FF0609B2;
	Thu, 25 Sep 2014 19:18:28 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id y10so8639873wgg.2
	for <multiple recipients>; Thu, 25 Sep 2014 12:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=xnQUA7sYYysg2mb8ABlTyrUhnL09iLNyFiJqfsG8cyE=;
	b=gDaCaY+YfYYEqCtDUXWnzRLfTiqbIhmqa2H2gILE66Xoso3wS68GJmFDxIg88kYp2v
	rrbHG8PXbdBx8T1mV/I50ao3GVmeGp26Jt7JHp3RXrjPlLkbqGVjknLYPi6uJMEWDkyt
	3bO0aR/jpdtLVmkkHy2Tz8tYTx/rZveQ7nS3ZgnlnhT5eUgcjkwotcgH0Etp9vltbZSc
	Puh7DyE+7UMa0zy4hQBBxz65d1NOQlNIUc5UYRt3urjCJe11mkcY/HUSETeYz65UmVWp
	47aF6m+61fw3+l3cFByDBywSIjcnyrWnQDRkxlzY66iA/Qb51EcMoY4IrLEXAhhwhEXz
	y3cw==
X-Received: by 10.194.78.4 with SMTP id x4mr18502715wjw.44.1411672709087;
	Thu, 25 Sep 2014 12:18:29 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	iy10sm4149334wic.5.2014.09.25.12.18.28 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Sep 2014 12:18:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 25 Sep 2014 21:19:16 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140925191916.GO25706@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, Failed tasks 2014-09-25
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
X-List-Received-Date: Thu, 25 Sep 2014 19:18:39 -0000
X-Groupsio-MsgNum: 58153
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NKtYx2Ppz7d1tORf"
Content-Disposition: inline

--NKtYx2Ppz7d1tORf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

BTW: I've forgot to update date in my previous test-dependencies status, it=
 should be 2014-09-01.

http://www.openembedded.org/wiki/Bitbake_World_Status

Chromium and firefox seem to be fixed now, but there are couple new issues,=
 some of them
only as pending patches on e-mail.

=3D=3D Failed tasks 2014-09-25 =3D=3D

=3D=3D=3D common (5) =3D=3D=3D
    * meta-openembedded/meta-multimedia/recipes-multimedia/musicpd/libmpd_1=
1.8.17.bb, do_compile
    * meta-openembedded/meta-networking/recipes-connectivity/cyassl/cyassl_=
3.2.0.bb, do_fetch
    * meta-openembedded/meta-oe/recipes-extended/haveged/haveged_1.9.1.bb, =
do_install
    * meta-openembedded/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb, do_=
compile
    * meta-openembedded/meta-oe/recipes-navigation/navit/navit_svn.bb, do_c=
ompile

=3D=3D=3D common-x86 (2) =3D=3D=3D
    * meta-openembedded/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb=
, do_compile
    * meta-openembedded/meta-oe/recipes-support/vala-terminal/vala-terminal=
_git.bb, do_configure

=3D=3D=3D qemuarm (5) =3D=3D=3D
    * meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_13.2.=
bb, do_compile
    * meta-openembedded/meta-networking/recipes-support/pimd/pimd_2.1.8.bb,=
 do_fetch
    * meta-openembedded/meta-oe/recipes-support/opencv/opencv_3.0.0.bb, do_=
compile
    * meta-qt5/recipes-qt/qt5/qtmultimedia_5.3.1.bb, do_fetch
    * openembedded-core/meta/recipes-kernel/perf/perf.bb, do_compile

=3D=3D=3D qemux86 (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-geo=
de_2.11.16.bb, do_compile

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * meta-qt5/recipes-qt/qt5/qtwebengine_git.bb, do_compile

=3D=3D=3D Number of failed tasks =3D=3D=3D
{| class=3Dwikitable
|-
||qemuarm       ||10    ||http://logs.nslu2-linux.org/buildlogs/oe/world//l=
og.world.20140923_174903.log/||http://errors.yoctoproject.org:80/Errors/Sea=
rch/1/2624/
|-
||qemux86       ||10    ||http://logs.nslu2-linux.org/buildlogs/oe/world//l=
og.world.20140924_093628.log/||http://errors.yoctoproject.org:80/Errors/Sea=
rch/1/2635/
|-
||qemux86_64    ||9     ||http://logs.nslu2-linux.org/buildlogs/oe/world//l=
og.world.20140925_022951.log/||http://errors.yoctoproject.org:80/Errors/Sea=
rch/1/2644/
|}

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NKtYx2Ppz7d1tORf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQkarQACgkQN1Ujt2V2gBzvTgCeMMqSpIXYgUf57OHZuOocCp1q
FCUAn2VfhjmJD12KLLBEOnJniYCOM3Qp
=zIZa
-----END PGP SIGNATURE-----

--NKtYx2Ppz7d1tORf--
