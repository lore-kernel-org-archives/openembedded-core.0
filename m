Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1C8FE6A463;
	Thu,  9 Jan 2014 14:46:14 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id d17so1380092eek.39
	for <multiple recipients>; Thu, 09 Jan 2014 06:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=HSrJsz5nSyFzFJqZCi0D9HZ7oExlW+MBf/IESmcNHc8=;
	b=zF6olyBFZBCa5k9w6DPSy2Y7b6tSmPPBfE8osia/dMaGfFOjKdWr0/G8vEOVlpZw82
	UoP6ewsDF+EobkmCD7qUcL4gFsAPgJt1FUepivof4qp//otyhVk+2FCE1A/0HZNo+HUx
	PQCVR1W6K7HqPX+nwSnfUGVCDkvQCfqpM3tfwX+S+KLC8kBrXoGRLoseuggKmfsijZuV
	WagmlvK0E7T+7sT8vitRWdsard3vrAOIzVQnQjEbwwis6ID/DU3Ya6zelv7XlgD+ow2H
	+t25OU6jkM8IxQuTZqK+qkzQtx6tBp4+A2xhqFXma+pjGhahzVW6GEfe62cqY7rhBALH
	KlDQ==
X-Received: by 10.14.148.138 with SMTP id v10mr3765427eej.37.1389278775792;
	Thu, 09 Jan 2014 06:46:15 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id o47sm6136082eem.21.2014.01.09.06.46.14
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Jan 2014 06:46:14 -0800 (PST)
Date: Thu, 9 Jan 2014 15:46:26 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140109144626.GG3709@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: State of bitbake world, Failed tasks 2014-01-09
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
X-List-Received-Date: Thu, 09 Jan 2014 14:46:16 -0000
X-Groupsio-MsgNum: 48767
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wnLTWEf+vlzHZaR9"
Content-Disposition: inline

--wnLTWEf+vlzHZaR9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2014-01-09 =3D=3D

=3D=3D=3D common (6) =3D=3D=3D
    * meta-openembedded/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb, do_c=
onfigure
    * meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.b=
b, do_fetch
    * meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_comp=
ile
    * meta-openembedded/meta-oe/recipes-extended/gnuplot/gnuplot_4.4.4.bb, =
do_compile
    * meta-openembedded/meta-oe/recipes-navigation/monav/monav_0.3.bb, do_c=
ompile
    * meta-qt5/recipes-qt/qt5/qtwayland_git.bb, do_compile

=3D=3D=3D common-x86 (5) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
    * meta-openembedded/meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11.b=
b, do_compile
    * meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_com=
pile
    * meta-openembedded/meta-oe/recipes-support/ode/ode_0.9.bb, do_configure
    * openembedded-core/meta/recipes-devtools/autogen/autogen-native_5.18.2=
=2Ebb, do_compile

=3D=3D=3D qemuarm (5) =3D=3D=3D
    * meta-openembedded/meta-gnome/recipes-gnome/devilspie/devilspie2_0.24.=
bb, do_compile
    * meta-openembedded/meta-networking/recipes-support/traceroute/tracerou=
te_2.0.18.bb, do_compile
    * meta-openembedded/meta-oe/recipes-support/bash-completion/bash-comple=
tion_2.0.bb, do_install
    * openembedded-core/meta/recipes-devtools/make/make_4.0.bb, do_compile
    * openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0=
=2E10.23.bb, do_compile

=3D=3D=3D qemux86 (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-geo=
de_2.11.14.bb, do_compile

=3D=3D=3D qemux86_64 (4) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs=
_git.bb, do_fetch
    * meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libim=
obiledevice_1.1.4.bb, do_configure
    * meta-openembedded/meta-oe/recipes-core/libxml/libxml++_2.35.3.bb, do_=
compile
    * meta-openembedded/meta-oe/recipes-devtools/python/python-m2crypto_0.2=
1.1.bb, do_compile

=3D=3D=3D Number of failed tasks =3D=3D=3D
{| class=3Dwikitable
|-
||qemuarm       ||11    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140107_145350.log/
|-
||qemux86       ||12    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140108_115626.log/
|-
||qemux86_64    ||15    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140109_011732.log/
|}

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wnLTWEf+vlzHZaR9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLOtkIACgkQN1Ujt2V2gBxiFQCgrDDHoylKm1qswftUNsAMTmcv
tokAoJdHy8746rYN/g4e0S/G6HyeqcIc
=7jEh
-----END PGP SIGNATURE-----

--wnLTWEf+vlzHZaR9--
