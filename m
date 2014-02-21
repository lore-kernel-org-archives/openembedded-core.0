Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8BF5F6B5D9;
	Fri, 21 Feb 2014 16:01:08 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id g15so1677274eak.29
	for <multiple recipients>; Fri, 21 Feb 2014 08:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=3UdP4nJXxP+qhqN1CefB8BQB+iYN/rOhRS+bVwPhzBM=;
	b=gP0pronME4zvf81s4wlPoWbDHlJEaw8qESURfxxixD45aRtOpz6RLauVt9zRxAUb9Q
	Q3i1tjQO3NhpKMTaEvQwqML+V56JOKr2syFKKvmhJa07B02HYFxGAu48q2/PRQh6WEhI
	4NfUAkNt/by9CDAJ5pri/y6gv8CfvQReCoWEczE3B53ejhitiX36276LEEBWK2eAdZXA
	VVhFyjNFE3HjRn6NpYnRCeklstGmy0AnxzssyGbkYk0eUovMJ3On4XIX2GElNVU1Ayoq
	Z6qI+HcNBW4Nt2O7a2XokPOx2snDe4J1N5OFGrlA4CPqbfrDwn/ew/3L8bLlVT3rAqxC
	2TgQ==
X-Received: by 10.14.1.68 with SMTP id 44mr9469391eec.0.1392998469536;
	Fri, 21 Feb 2014 08:01:09 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	f45sm27929847eeg.5.2014.02.21.08.01.07 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Feb 2014 08:01:07 -0800 (PST)
Date: Fri, 21 Feb 2014 17:01:42 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140221160142.GH3854@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: State of bitbake world, Failed tasks 2014-02-21
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
X-List-Received-Date: Fri, 21 Feb 2014 16:01:12 -0000
X-Groupsio-MsgNum: 50427
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/Gk0KcsbyUMelFU1"
Content-Disposition: inline

--/Gk0KcsbyUMelFU1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2014-02-21 =3D=3D

=3D=3D=3D common (20) =3D=3D=3D
    * meta-openembedded/meta-efl/recipes-efl/e17/e-tasks_git.bb, do_compile
    * meta-openembedded/meta-efl/recipes-efl/e17/emprint_svn.bb, do_compile
    * meta-openembedded/meta-efl/recipes-efl/e17/news_svn.bb, do_compile
    * meta-openembedded/meta-efl/recipes-efl/e17/rage_svn.bb, do_compile
    * meta-openembedded/meta-efl/recipes-efl/webkit/webkit-efl_2.3.2+svnr15=
9807.bb, do_configure
    * meta-openembedded/meta-gnome/recipes-gnome/devilspie/devilspie2_0.24.=
bb, do_compile
    * meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_12.2.=
bb, do_fetch
    * meta-openembedded/meta-multimedia/recipes-multimedia/musicbrainz/libm=
usicbrainz_git.bb, do_configure
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
    * meta-openembedded/meta-oe/recipes-support/inih/libinih_git.bb, do_ins=
tall
    * meta-qt5/recipes-qt/qt5/qtwayland_git.bb, do_compile
    * meta-smartphone/meta-fso/recipes-freesmartphone/freesmartphone/zhone_=
git.bb, do_compile
    * meta-smartphone/meta-shr/recipes-shr/themes/e-wm-theme-illume-neo_git=
=2Ebb, do_compile
    * openembedded-core/meta/recipes-graphics/wayland/weston_1.4.0.bb, do_c=
onfigure

=3D=3D=3D common-x86 (5) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
    * meta-openembedded/meta-initramfs/recipes-bsp/images/initramfs-kexecbo=
ot-klibc-image.bb, do_rootfs
    * meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_com=
pile
    * meta-openembedded/meta-oe/recipes-support/ode/ode_0.9.bb, do_configure
    * openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package

=3D=3D=3D qemuarm (2) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb, do_=
compile
    * openembedded-core/meta/recipes-bsp/grub/grub_git.bb, do_package

=3D=3D=3D qemux86 (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-geo=
de_2.11.14.bb, do_compile

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libim=
obiledevice_1.1.4.bb, do_configure

=3D=3D=3D Number of failed tasks =3D=3D=3D
{| class=3Dwikitable
|-
||qemuarm       ||22    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140219_131156.log/
|-
||qemux86       ||26    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140220_075930.log/
|-
||qemux86_64    ||26    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140218_180012.log/
|}

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/Gk0KcsbyUMelFU1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMHeGYACgkQN1Ujt2V2gBwdUACeOB++o4fwrtPgeQwVci+sjYof
jHEAniP49Sh3uK8ZQGnPffuIM/RYjDxY
=1l4X
-----END PGP SIGNATURE-----

--/Gk0KcsbyUMelFU1--
