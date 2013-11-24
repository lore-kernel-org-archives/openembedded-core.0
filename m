Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 56DFB6D8EE;
	Sun, 24 Nov 2013 16:59:34 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id f15so1851696eak.39
	for <multiple recipients>; Sun, 24 Nov 2013 08:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=mX2NaTY4ljANDtspM4zaMn2SEFwhcoPscsc1umbpN0Y=;
	b=Ive+4NziENiPaXWxRVBOwG5S5knMyKPNerXBdGEGq1ZHN3sBV5A02BJLTzhdkLjkSg
	RJG9IE0mf/MqkdDnjUieh0XjG70CCPzWK5Z3g+Z+NnCJcEvtP++Bl7U192eUHtGaMT34
	vb24Dgms4I8oj4Dm2eMF7oXGUE75Zh6DDqtswpWM/DO4gUGg1aomeZ8VAouNBuCK/fGA
	l50pFA6S950KaARlPNKOOyyaZMhDIFbUVbOAHQgNqu2gWocCwN4Qe6DeeC9fB5cn7NXb
	SXW6JT9OIYUDkdLd3P2R5O/lSXQd8FoxX8pVLbxQsUd4HB/wcMU1fq3w/wYBi+C5n+ol
	LunQ==
X-Received: by 10.14.1.130 with SMTP id 2mr30693688eed.24.1385312373352;
	Sun, 24 Nov 2013 08:59:33 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 44sm93371715eek.5.2013.11.24.08.59.32
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Nov 2013 08:59:32 -0800 (PST)
Date: Sun, 24 Nov 2013 17:59:33 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, 
	openembedded-core@lists.openembedded.org
Message-ID: <20131124165933.GD2870@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: State of bitbake world, Failed tasks Wed Nov 24
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
X-List-Received-Date: Sun, 24 Nov 2013 16:59:35 -0000
X-Groupsio-MsgNum: 47558
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qGV0fN9tzfkG3CxV"
Content-Disposition: inline

--qGV0fN9tzfkG3CxV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks Sun Nov 24 16:58:31 UTC 2013 =3D=3D

=3D=3D=3D common (10) =3D=3D=3D
    * meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.b=
b, do_compile
    * meta-openembedded/meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11.b=
b, do_compile
    * meta-openembedded/meta-networking/recipes-support/lowpan-tools/lowpan=
-tools_git.bb, do_install
    * meta-openembedded/meta-oe/recipes-connectivity/daq/daq_2.0.1.bb, do_i=
nstall
    * meta-openembedded/meta-oe/recipes-core/libxml/libxml++_2.35.3.bb, do_=
compile
    * meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_comp=
ile
    * meta-openembedded/meta-oe/recipes-navigation/monav/monav_0.3.bb, do_c=
ompile
    * meta-qt5/recipes-qt/qt5/qtwayland_git.bb, do_compile
    * meta-smartphone/meta-fso/recipes-freesmartphone/cornucopia/fsogsmd_0.=
12.0.bb, do_compile
    * openembedded-core/meta/recipes-devtools/expect/expect_5.45.bb, do_con=
figure

=3D=3D=3D common-x86 (5) =3D=3D=3D
    * meta-browser/recipes-browser/chromium/chromium_29.0.1518.2.bb, do_com=
pile
    * meta-openembedded/meta-initramfs/recipes-bsp/images/initramfs-kexecbo=
ot-klibc-image.bb, do_rootfs
    * meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_com=
pile
    * meta-openembedded/meta-oe/recipes-support/ode/ode_0.9.bb, do_configure
    * openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package

=3D=3D=3D qemuarm (0) =3D=3D=3D

=3D=3D=3D qemux86 (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-geo=
de_2.11.14.bb, do_compile

=3D=3D=3D qemux86_64 (3) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libim=
obiledevice_1.1.4.bb, do_configure
    * meta-openembedded/meta-oe/recipes-devtools/python/python-m2crypto_0.2=
1.1.bb, do_compile

=3D=3D=3D Number of failed tasks =3D=3D=3D
{| class=3Dwikitable
|-
||qemuarm       ||10    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20131120_224445.log/
|-
||qemux86       ||16    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20131121_135401.log/
|-
||qemux86_64    ||18    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20131122_060242.log/
|}

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qGV0fN9tzfkG3CxV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKSMHUACgkQN1Ujt2V2gBzh3ACcDf7VXAnubJMb62aICl12VS2l
PCgAn1BLzAdZtzuA2D0Y210FaRqKK2R7
=mkCk
-----END PGP SIGNATURE-----

--qGV0fN9tzfkG3CxV--
