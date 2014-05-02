Return-Path: <martin.jansa@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 639936059B;
	Fri,  2 May 2014 22:53:59 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id ey11so784327pad.32
	for <multiple recipients>; Fri, 02 May 2014 15:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=2o2OVlXEmJvJWHanRtICNAbsg+S1+rSSS12STxWiv3Q=;
	b=e4w+fq5JYbLfaAXdpkE3Qf3ZpZDvZaadIpNgmRjwhSaCb6CqryZEyTy9PaptpI97sr
	i/zzGvJsXzH5DjMkoicksZioN+k3k4zXDKqYJaD60KEldS/w9QnxjUKutiLgtor30cvf
	jUfIKbK7UqoQdRhAp+GW3EoB7UePidcwj5VvXG1XshcgnJzsKRWNE7X5iLocGzvizhMQ
	V2gwS8NFrB17MYKab3QvAUrGfo+/5iJGLaNLZ3ieVRx95smrtEitGNIrPuSIC6Zfgtm4
	AK7riFjbYULIAErzNGmrOeRhfJ2tO5ljax6JG9z18180Ux1Ao0t6+bsREN20qe/jzoZi
	NWIw==
X-Received: by 10.66.240.4 with SMTP id vw4mr39943424pac.26.1399071239969;
	Fri, 02 May 2014 15:53:59 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	z3sm2507683pas.15.2014.05.02.15.53.57 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 May 2014 15:53:59 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 3 May 2014 00:54:14 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140502225414.GY2486@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, Failed tasks 2014-05-02
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
X-List-Received-Date: Fri, 02 May 2014 22:54:04 -0000
X-Groupsio-MsgNum: 52766
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="L7gbXl6dnBG3y424"
Content-Disposition: inline

--L7gbXl6dnBG3y424
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Thanks to 2 fixes from Paul were down to only couple recipes.

As discussed on OEDAM today, I'll be more aggressive with removing, blackli=
sting
so today I'll send patch adding few PNBLACKLIST entries and inheriting blac=
klist
bbclass by default.

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2014-05-02 =3D=3D

=3D=3D=3D common (4) =3D=3D=3D
    * meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.b=
b, do_compile
    * meta-openembedded/meta-networking/recipes-support/lksctp-tools/lksctp=
-tools_1.0.16.bb, do_compile
    * meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_comp=
ile
    * meta-openembedded/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb,=
 do_configure

=3D=3D=3D common-x86 (3) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
    * meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_com=
pile
    * openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package

=3D=3D=3D qemuarm (2) =3D=3D=3D
    * openembedded-core/meta/recipes-bsp/grub/grub_git.bb, do_package
    * openembedded-core/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb, d=
o_compile

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (2) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb, do_i=
nstall
    * meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libim=
obiledevice_1.1.4.bb, do_configure

=3D=3D=3D Number of failed tasks =3D=3D=3D
{| class=3Dwikitable
|-
||qemuarm       ||6     ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140501_232147.log/
|-
||qemux86       ||7     ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140502_003255.log/
|-
||qemux86_64    ||9     ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140502_031644.log/
|}

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


--L7gbXl6dnBG3y424
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNkIhYACgkQN1Ujt2V2gBx0uQCfbVE3uGm2VceYImY8J7kOtkOa
r/4AnRgY1EtLMe/oXluNgltrbYO8jacx
=I4vJ
-----END PGP SIGNATURE-----

--L7gbXl6dnBG3y424--
