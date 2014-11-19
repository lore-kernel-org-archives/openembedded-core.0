Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id EC0E66AC82;
	Wed, 19 Nov 2014 14:01:43 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id bs8so9554309wib.3
	for <multiple recipients>; Wed, 19 Nov 2014 06:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=kucYBtM0Mr1YyywhvMpUZS9LO3yMA1vMyZ4Mj2F5Dfw=;
	b=vLtGhtDRGxN330w1OtsivqxjBhuXsN0kfCzEW51Nhzr4gxnfdnN6yrfxjiQoaDOfuP
	RHPprbyiybpYQGM9r1zI1Zf8dnTZK3HmMJJ2/Q/mIoVwhTMNnuzp6BR36EmZzsGHFPcE
	xgDgjGJbLxu0UhDpRxPdW06H7N0Cr7iagpY90daPq/VBnBLe89K6lHucKwUfPC77bg9u
	mcoGKa+ztprgUhjzFgiUPqOJG4ps0X74dnf8E5oI90QLyiVamgzbHk5iykA+NFJlAUpw
	V2ZgMc8ciPxfqQxSWKGyeeHAGMX9NXrVd1N0m+Jkd4rX3cgWTErdj5RjGx1pwW0wR4HZ
	R7hQ==
X-Received: by 10.194.57.81 with SMTP id g17mr59823708wjq.12.1416405703118;
	Wed, 19 Nov 2014 06:01:43 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id y5sm2349995wix.9.2014.11.19.06.01.42
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Nov 2014 06:01:42 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 19 Nov 2014 15:01:43 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20141119140143.GB3315@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, Failed tasks 2014-11-19
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
X-List-Received-Date: Wed, 19 Nov 2014 14:01:49 -0000
X-Groupsio-MsgNum: 59758
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3lcZGd9BuhuYXNfi"
Content-Disposition: inline

--3lcZGd9BuhuYXNfi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2014-11-19 =3D=3D

=3D=3D=3D common (12) =3D=3D=3D
    * meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc-static-=
utils_2.0.4.bb, do_compile
    * meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc_2.0.4.b=
b, do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/umip/umip_1.0.bb, do_c=
ompile
    * meta-openembedded/meta-oe/recipes-devtools/php/php_5.4.33.bb, do_comp=
ile
    * meta-openembedded/meta-oe/recipes-extended/acpica/acpitests_20140828.=
bb, do_compile
    * meta-openembedded/meta-oe/recipes-extended/ddrescue/ddrescue_1.19.bb,=
 do_unpack
    * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb, do_=
compile
    * meta-openembedded/meta-oe/recipes-support/mysql/mysql-python_1.2.4.bb=
, do_compile
    * meta-openembedded/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.b=
b, do_configure
    * meta-smartphone/meta-shr/recipes-shr/3rdparty/iliwi_git.bb, do_compile
    * meta-smartphone/meta-shr/recipes-shr/3rdparty/sensmon_git.bb, do_comp=
ile
    * meta-smartphone/meta-shr/recipes-shr/3rdparty/valacompass_git.bb, do_=
compile

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (2) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs=
_git.bb, do_fetch
    * meta-smartphone/meta-android/recipes-multimedia/android-audiosystem/a=
ndroid-audiosystem_bzr.bb, do_compile

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks =3D=3D=3D
{| class=3Dwikitable
|-
||qemuarm       ||14    ||http://logs.nslu2-linux.org/buildlogs/oe/world//l=
og.world.20141110_065307.log/||http://errors.yoctoproject.org:80/Errors/Sea=
rch/1/3219/
|-
||qemux86       ||12    ||http://logs.nslu2-linux.org/buildlogs/oe/world//l=
og.world.20141110_221551.log/||http://errors.yoctoproject.org:80/Errors/Sea=
rch/1/3220/
|-
||qemux86_64    ||13    ||http://logs.nslu2-linux.org/buildlogs/oe/world//l=
og.world.20141111_143018.log/||http://errors.yoctoproject.org:80/Errors/Sea=
rch/1/3241/
|}

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3lcZGd9BuhuYXNfi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRsoscACgkQN1Ujt2V2gByvdgCfbEppz9hi1F0hWsRBrOm3kuxX
2oEAoLpMJxlGVzO0e24MoiXR+wp69CNk
=istu
-----END PGP SIGNATURE-----

--3lcZGd9BuhuYXNfi--
