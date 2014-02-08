Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id AD3FC6E30D;
	Sat,  8 Feb 2014 18:37:32 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id b10so2180037eae.33
	for <multiple recipients>; Sat, 08 Feb 2014 10:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=DA1GigKCpACOtvf+TSKQk3fggTIcjxoEJvdmYUqSl1I=;
	b=crQshuNfVZ7ZZY9QbruF1JoaixrNXDigswIN5gepcDz7K5g9l3/4shs0DciJFipzkz
	z9ULR7wvjDzN9XGUdcjHginfKVQTEYqdqaJZkMlsr7dM6FESZ2nlmAdKMPRe7MmsSM9o
	7oihZR9Y1dSQy7VhTE8yhOss/MOsGgMojjMLgwXmHV3vM8NGT8rCgrOKnU39ArKb6yPx
	6W4x3LJDYj+ZHgDT6QVn5ZCQ3lVx+szGBObWN/pZeKGDeMFhAWlCol6LCljgpf/nNKqN
	vpuG5k6H6MB1Kl96eHHu0bfyI9g/DFBZJV9qrN7hmC770jodY+ADynTFNu5Z/syA110A
	pO2A==
X-Received: by 10.15.45.194 with SMTP id b42mr257410eew.103.1391884652593;
	Sat, 08 Feb 2014 10:37:32 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id k6sm31962307eep.17.2014.02.08.10.37.31
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 08 Feb 2014 10:37:31 -0800 (PST)
Date: Sat, 8 Feb 2014 19:37:48 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140208183748.GO3698@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: State of bitbake world, Failed tasks 2014-02-08
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
X-List-Received-Date: Sat, 08 Feb 2014 18:37:34 -0000
X-Groupsio-MsgNum: 49965
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uGrbifh0UoBBidu/"
Content-Disposition: inline

--uGrbifh0UoBBidu/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=3D=3D Failed tasks 2014-02-08 =3D=3D

=3D=3D=3D common (17) =3D=3D=3D
    * meta-openembedded/meta-efl/recipes-efl/e17/e-tasks_git.bb, do_compile
    * meta-openembedded/meta-efl/recipes-efl/e17/emprint_svn.bb, do_compile
    * meta-openembedded/meta-efl/recipes-efl/e17/news_svn.bb, do_compile
    * meta-openembedded/meta-efl/recipes-efl/e17/rage_svn.bb, do_compile
    * meta-openembedded/meta-gnome/recipes-gnome/devilspie/devilspie2_0.24.=
bb, do_compile
    * meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_12.2.=
bb, do_fetch
    * meta-openembedded/meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11.b=
b, do_compile
    * meta-openembedded/meta-networking/recipes-support/traceroute/tracerou=
te_2.0.18.bb, do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/daq/daq_2.0.1.bb, do_i=
nstall
    * meta-openembedded/meta-oe/recipes-core/libxml/libxml++_2.35.3.bb, do_=
compile
    * meta-openembedded/meta-oe/recipes-devtools/packagekit/packagekit_0.8.=
13.bb, do_configure
    * meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_comp=
ile
    * meta-openembedded/meta-oe/recipes-navigation/monav/monav_0.3.bb, do_c=
ompile
    * meta-qt5/recipes-qt/qt5/qtwebkit_5.2.0.bb, do_compile
    * meta-smartphone/meta-fso/recipes-freesmartphone/freesmartphone/zhone_=
git.bb, do_compile
    * meta-smartphone/meta-shr/recipes-shr/themes/e-wm-theme-illume-neo_git=
=2Ebb, do_compile
    * openembedded-core/meta/recipes-devtools/cmake/cmake-native_2.8.12.1.b=
b, do_configure

=3D=3D=3D common-x86 (4) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
    * meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_com=
pile
    * meta-openembedded/meta-oe/recipes-support/ode/ode_0.9.bb, do_configure
    * openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package

=3D=3D=3D qemuarm (3) =3D=3D=3D
    * meta-openembedded/meta-filesystems/recipes-filesystems/smbnetfs/smbne=
tfs_git.bb, do_packagedata
    * openembedded-core/meta/recipes-bsp/grub/grub_git.bb, do_package
    * openembedded-core/meta/recipes-support/ca-certificates/ca-certificate=
s_20130610.bb, do_packagedata

=3D=3D=3D qemux86 (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-geo=
de_2.11.14.bb, do_compile

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-devtools/python/python-m2crypto_0.2=
1.1.bb, do_compile

=3D=3D=3D Number of failed tasks =3D=3D=3D
{| class=3Dwikitable
|-
||qemuarm       ||20    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140205_201530.log/
|-
||qemux86       ||24    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140206_155623.log/
|-
||qemux86_64    ||22    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140207_100027.log/
|}

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--uGrbifh0UoBBidu/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlL2eXwACgkQN1Ujt2V2gBydIQCeJEfKaPMaH/5sKtMkfpAHjoyt
yKIAoJO2JYWJONc4RCs0FGQFR7X5+mWP
=5Zxa
-----END PGP SIGNATURE-----

--uGrbifh0UoBBidu/--
