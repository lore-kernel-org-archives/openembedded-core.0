Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 0214A6E891;
	Thu, 13 Feb 2014 03:11:36 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id d17so4797732eek.9
	for <multiple recipients>; Wed, 12 Feb 2014 19:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=vUKINmrKLp+iXWyK7K9PNz6GqTD+noSbWHhOvREkhvk=;
	b=fusPkMCbFb5YTvgDY5cQwsRyiW1OmUtcwN9O6Le8PVH7J8cfLV8O3WuDKHqS6T9j13
	CQ5xHykNAFuJo8WYkB3wSmnX90Wpdj9db0OGScKQ6arm0w46/PjBazHE0yW5LgwMcdBA
	e6PjqRMCSl8MVGqueCCjx6+IpneMd6F91sp/PjEmk1Ydobn4nAjgjtDgE2bGOObnf/HH
	Uor58S9z0jIkmENSfAGMq2irpmlnE1uDBZQWvnaMFKX8n0h/1l32CQeCFY+4A6WyA8rf
	Z3MmuPtjuEZS78bjPKNcOcrsR0HceGa91pXlaDAkUXsjM4YL9R6fZzsuJExamKhc7uWp
	QRJA==
X-Received: by 10.14.94.3 with SMTP id m3mr7952639eef.54.1392261097213;
	Wed, 12 Feb 2014 19:11:37 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id m9sm1450868eeh.3.2014.02.12.19.11.33
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Feb 2014 19:11:34 -0800 (PST)
Date: Thu, 13 Feb 2014 04:11:55 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140213031155.GA7092@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: State of bitbake world, Failed tasks 2014-02-13
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
X-List-Received-Date: Thu, 13 Feb 2014 03:11:38 -0000
X-Groupsio-MsgNum: 50093
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Content-Disposition: inline

--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Biggest difference from last update is inclusion of eglibc_2.19 and qt5 upg=
raded to 5.2.1.

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2014-02-13 =3D=3D

=3D=3D=3D common (15) =3D=3D=3D
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
    * meta-smartphone/meta-fso/recipes-freesmartphone/freesmartphone/zhone_=
git.bb, do_compile
    * meta-smartphone/meta-shr/recipes-shr/themes/e-wm-theme-illume-neo_git=
=2Ebb, do_compile

=3D=3D=3D common-x86 (10) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
    * meta-openembedded/meta-efl/recipes-efl/webkit/webkit-efl_2.3.2+svnr15=
9807.bb, do_configure
    * meta-openembedded/meta-multimedia/recipes-multimedia/musicbrainz/libm=
usicbrainz_git.bb, do_configure
    * meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_com=
pile
    * meta-openembedded/meta-oe/recipes-support/inih/libinih_git.bb, do_ins=
tall
    * meta-openembedded/meta-oe/recipes-support/ode/ode_0.9.bb, do_configure
    * meta-qt5/recipes-qt/qt5/qtbase-native_5.2.1.bb, do_patch
    * meta-qt5/recipes-qt/qt5/qtbase_5.2.1.bb, do_patch
    * openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package
    * openembedded-core/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb, d=
o_configure

=3D=3D=3D qemuarm (4) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb, do_=
compile
    * meta-qt5/recipes-qt/qt5/qtwebkit_5.2.0.bb, do_compile
    * openembedded-core/meta/recipes-bsp/grub/grub_git.bb, do_package
    * openembedded-core/meta/recipes-devtools/cmake/cmake-native_2.8.12.1.b=
b, do_configure

=3D=3D=3D qemux86_64 (3) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libim=
obiledevice_1.1.4.bb, do_configure
    * meta-openembedded/meta-oe/recipes-devtools/python/python-m2crypto_0.2=
1.1.bb, do_compile
    * meta-openembedded/meta-oe/recipes-support/bash-completion/bash-comple=
tion_2.0.bb, do_install

=3D=3D=3D Number of failed tasks =3D=3D=3D
{| class=3Dwikitable
|-
||qemuarm       ||19    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140208_182651.log/
|-
||qemux86       ||26    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140209_122919.log/
|-
||qemux86_64    ||28    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140210_065844.log/
|}

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlL8N/sACgkQN1Ujt2V2gBycugCcDrvMHw8Q7LnfZ3uo5oJyQ7MX
K3AAn2V6QaGicWHe3vkU3fWLHmYHTmGf
=I71T
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--
