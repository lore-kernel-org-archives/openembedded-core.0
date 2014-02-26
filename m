Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1E7736F1A4;
	Wed, 26 Feb 2014 23:50:00 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id a15so1348071eae.23
	for <multiple recipients>; Wed, 26 Feb 2014 15:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=BvdhzAqNuNCjtC8zz3nyUY5JZhRl+wi8cYlPtTCNz6Y=;
	b=D1upzZsw4tUK05QdQRmGrRz+VcluHstDuCAHWGC31bMJJrUWA8GgPuM+A/8qhzvjDK
	Qga9fG74XjMRAJ8yCmJhhHZt9xY2nFmdySrTTVyFcB5apIS4Uar5SI3/Ogsp0hoMt3Tt
	ey54qM3BZUEc8JddjBeydn2Ks17RT4eaI3/1GrXMJ0MIkr+5wh2THQ45PtiAHIMTWr+6
	0G+up/uqFdMLA3UIaosF1ykQx2vGtxCkol4bnRFq/ydYIj2A7RXlfI/gIDQsKxnGybh0
	k35LO+aM/L/g0vzUHy5CSjRE66fXOmV1CC/yDM3uHa+/AO/nK21HqvvjtcmrPj3myTtU
	JEpw==
X-Received: by 10.15.73.134 with SMTP id h6mr9965699eey.15.1393458601629;
	Wed, 26 Feb 2014 15:50:01 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	j42sm9856274eep.21.2014.02.26.15.49.59 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Feb 2014 15:50:00 -0800 (PST)
Date: Thu, 27 Feb 2014 00:50:01 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140226235001.GW26981@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: State of bitbake world, Failed tasks 2014-02-27
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
X-List-Received-Date: Wed, 26 Feb 2014 23:50:02 -0000
X-Groupsio-MsgNum: 50633
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hblleJHDxiLJUoyx"
Content-Disposition: inline

--hblleJHDxiLJUoyx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2014-02-26 =3D=3D

=3D=3D=3D common (8) =3D=3D=3D
    * meta-openembedded/meta-gnome/recipes-gnome/devilspie/devilspie2_0.24.=
bb, do_compile
    * meta-openembedded/meta-multimedia/recipes-multimedia/musicbrainz/libm=
usicbrainz_git.bb, do_configure
    * meta-openembedded/meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11.b=
b, do_compile
    * meta-openembedded/meta-networking/recipes-support/traceroute/tracerou=
te_2.0.18.bb, do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/networkmanager/network=
manager_0.9.8.0.bb, do_configure
    * meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_comp=
ile
    * meta-openembedded/meta-oe/recipes-navigation/monav/monav_0.3.bb, do_c=
ompile
    * meta-openembedded/meta-oe/recipes-support/inih/libinih_git.bb, do_ins=
tall

=3D=3D=3D common-x86 (5) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
    * meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.b=
b, do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/daq/daq_2.0.1.bb, do_i=
nstall
    * meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_com=
pile
    * openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package

=3D=3D=3D qemuarm (7) =3D=3D=3D
    * meta-openembedded/meta-efl/recipes-efl/webkit/webkit-efl_2.3.2+svnr15=
9807.bb, do_compile
    * meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_12.2.=
bb, do_fetch
    * meta-openembedded/meta-oe/recipes-core/libxml/libxml++_2.35.3.bb, do_=
compile
    * meta-openembedded/meta-oe/recipes-devtools/packagekit/packagekit_0.8.=
13.bb, do_configure
    * meta-openembedded/meta-oe/recipes-extended/gnuplot/gnuplot_4.4.4.bb, =
do_compile
    * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb, do_=
compile
    * openembedded-core/meta/recipes-bsp/grub/grub_git.bb, do_package

=3D=3D=3D qemux86 (1) =3D=3D=3D
    * meta-openembedded/meta-initramfs/recipes-kernel/linux/linux-yocto-tin=
y-kexecboot_3.10.bb, do_compile

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libim=
obiledevice_1.1.4.bb, do_configure

=3D=3D=3D Number of failed tasks =3D=3D=3D
{| class=3Dwikitable
|-
||qemuarm       ||15    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140224_083255.log/
|-
||qemux86       ||14    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140224_180733.log/
|-
||qemux86_64    ||14    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140225_233246.log/
|}

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hblleJHDxiLJUoyx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMOfakACgkQN1Ujt2V2gBwwDQCeP+C78zn1BArz5QzBSp5Pn1Xw
3ssAoJhfn8ay99KxUfqOJfZS8l2V/9/t
=9A27
-----END PGP SIGNATURE-----

--hblleJHDxiLJUoyx--
