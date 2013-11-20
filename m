Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id F33526D7BB;
	Wed, 20 Nov 2013 12:21:22 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id e51so3698018eek.13
	for <multiple recipients>; Wed, 20 Nov 2013 04:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=PB4wgjJ1n2o/XAjv9g8o+M3I9t556O72CEy5jQVaJtU=;
	b=Y2Z1kQuL77ftnwBTrYD+jf/YCJAPWAwJ/G1JAUeE7maPlPXLvNK3IUPwkX8puQwjkp
	yu7iGdv7FfF7O1Ac4Pphdbc1dTtCzP1eDNvD5XnOtpeWANpcI7foi3mxAphssazFuRLM
	x2HDJASYPrknuWAjNYOocSMJBYCvnyoNG/HUKgIsWcIQsrx0UL5YOoIDRvurxMNAbG7k
	HdMo93FaaV1QE0PDrn4K+7PKYGLh1YWndkZpVxH3ytTmg8dCz4fXlZ4+fvJycaKADEqt
	zdPzASfyR8DfZneZl6N2SUbbgRpBktr9UT2xqI2Fs1gMlua3GE8DyIahyvjmOK+ja2Ks
	LAYw==
X-Received: by 10.14.210.8 with SMTP id t8mr412064eeo.39.1384950083801;
	Wed, 20 Nov 2013 04:21:23 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id b42sm59277458eem.9.2013.11.20.04.21.22
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Nov 2013 04:21:23 -0800 (PST)
Date: Wed, 20 Nov 2013 13:21:26 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, 
	openembedded-core@lists.openembedded.org
Message-ID: <20131120122126.GM3708@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: State of bitbake world, Failed tasks Wed Nov 20
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
X-List-Received-Date: Wed, 20 Nov 2013 12:21:23 -0000
X-Groupsio-MsgNum: 47332
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QqzFzR/RUlLahzby"
Content-Disposition: inline

--QqzFzR/RUlLahzby
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks Wed Nov 20 12:20:32 UTC 2013 =3D=3D

=3D=3D=3D common (13) =3D=3D=3D
    * meta-browser/recipes-mozilla/mozilla-devscripts/mozilla-devscripts_gi=
t.bb, do_fetch
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
    * openembedded-core/meta/recipes-graphics/wayland/weston_1.3.0.bb, do_p=
atch
    * openembedded-core/meta/recipes-graphics/xorg-driver/xf86-video-omapfb=
_git.bb, do_fetch
    * openembedded-core/meta/recipes-support/ca-certificates/ca-certificate=
s_20130610.bb, do_fetch

=3D=3D=3D common-x86 (5) =3D=3D=3D
    * meta-browser/recipes-browser/chromium/chromium_29.0.1518.2.bb, do_com=
pile
    * meta-openembedded/meta-initramfs/recipes-bsp/images/initramfs-kexecbo=
ot-klibc-image.bb, do_rootfs
    * meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_com=
pile
    * meta-openembedded/meta-oe/recipes-support/ode/ode_0.9.bb, do_configure
    * openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package

=3D=3D=3D qemuarm (1) =3D=3D=3D
    * meta-qt5/recipes-qt/qt5/qtlocation_git.bb, do_compile

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
||qemuarm       ||14    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20131119_093807.log/
|-
||qemux86       ||20    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20131119_200735.log/
|-
||qemux86_64    ||21    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20131120_065548.log/
|}

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--QqzFzR/RUlLahzby
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKMqUYACgkQN1Ujt2V2gByy4ACggKesJv/n9hH0Wu9c9uZWQYEs
79UAoJpfCwPEQobhog1kC0Y6dRRE2Dtk
=ZR09
-----END PGP SIGNATURE-----

--QqzFzR/RUlLahzby--
