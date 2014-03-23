Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id D0EF96FAF7;
	Sun, 23 Mar 2014 20:43:18 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id e49so3753573eek.31
	for <multiple recipients>; Sun, 23 Mar 2014 13:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=wTRoSDlXH9u8lkGZPLSsIB/fE1m8BJixIsGLmG5IpKs=;
	b=ljGxdTOlLjMKYWmflEh/ml6Xf2nZZeNOJw4KUc1t572VeWrlPCVvq/OVmom7oOTrTH
	0Mg6a4ojZbbdZ2EKqwRmoXWJYkwlEtuB3pTaAti2iPyUd4PgOsVRmTcmcz5BbtlZRx95
	os34Qsq5L8tuFGqjqf24yKbd0QDXR3Au0LHVdePkSmLDqVEjNawSmAYUQ4fZE85OLEvM
	eWtwTdDow9ebxkShWgEsyKjeNBTeTlEM70h/LvpVWfVFeAeA4xQpQQ8v7+KdW7LL8+J/
	V/v2fd0INvwfw0wzjxgNmLjCUmbCxL98Ny0R6N5id0uSP0lyyAu587DwQpN6v3gvqeUe
	EKvA==
X-Received: by 10.15.54.70 with SMTP id s46mr303590eew.83.1395607399555;
	Sun, 23 Mar 2014 13:43:19 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	x3sm28520651eep.17.2014.03.23.13.43.17 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Mar 2014 13:43:17 -0700 (PDT)
Date: Sun, 23 Mar 2014 21:43:24 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140323204324.GA3710@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: State of bitbake world, Failed tasks 2014-03-23
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
X-List-Received-Date: Sun, 23 Mar 2014 20:43:20 -0000
X-Groupsio-MsgNum: 51490
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Content-Disposition: inline

--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2014 at 07:50:08PM +0100, Martin Jansa wrote:
> On Sat, Mar 15, 2014 at 03:10:46PM +0100, Martin Jansa wrote:
> > On Tue, Mar 11, 2014 at 02:50:14PM +0100, Martin Jansa wrote:
> > > On Tue, Mar 11, 2014 at 02:45:04PM +0100, Martin Jansa wrote:
> > > > Biggest difference from last e-mail is aclocal changes which can po=
ssibly explain
> > > > increased number of do_configure failures, I've asked Richard to de=
lay merging B!=3DS
> > > > change until we resolve or at least analyze these new failures, so =
any help with
> > > > would be highly appreciated.

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2014-03-23 =3D=3D

=3D=3D=3D common (14) =3D=3D=3D
    * meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.b=
b, do_compile
    * meta-openembedded/meta-multimedia/recipes-multimedia/libdc1394/libdc1=
394_git.bb, do_configure
    * meta-openembedded/meta-networking/recipes-protocols/quagga/quagga_0.9=
9.21.bb, do_compile
    * meta-openembedded/meta-networking/recipes-support/traceroute/tracerou=
te_2.0.18.bb, do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb, do_i=
nstall
    * meta-openembedded/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb, do_c=
ompile
    * meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_comp=
ile
    * meta-openembedded/meta-oe/recipes-extended/gnuplot/gnuplot_4.4.4.bb, =
do_compile
    * meta-openembedded/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb,=
 do_compile
    * meta-openembedded/meta-oe/recipes-multimedia/sound-themes/sound-theme=
-freedesktop_0.8.bb, do_configure
    * meta-openembedded/meta-oe/recipes-navigation/monav/monav_0.3.bb, do_c=
ompile
    * meta-openembedded/meta-oe/recipes-support/asio/asio_1.4.1.bb, do_comp=
ile
    * meta-openembedded/meta-oe/recipes-support/inih/libinih_git.bb, do_ins=
tall
    * meta-openembedded/meta-oe/recipes-support/lvm2/lvm2_2.02.97.bb, do_co=
mpile

=3D=3D=3D common-x86 (9) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
    * meta-openembedded/meta-efl/recipes-efl/e17/eve_svn.bb, do_compile
    * meta-openembedded/meta-gnome/recipes-gnome/devilspie/devilspie2_0.24.=
bb, do_compile
    * meta-openembedded/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.=
30.3.bb, do_configure
    * meta-openembedded/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8=
=2E0.bb, do_compile
    * meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_com=
pile
    * meta-openembedded/meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb, =
do_configure
    * meta-openembedded/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb, =
do_configure
    * openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package

=3D=3D=3D qemuarm (4) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb, d=
o_install
    * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb, do_=
compile
    * openembedded-core/meta/recipes-bsp/grub/grub_git.bb, do_package
    * openembedded-core/meta/recipes-gnome/gtk+/gtk+_2.24.22.bb, do_compile

=3D=3D=3D qemux86 (1) =3D=3D=3D
    * meta-openembedded/meta-initramfs/recipes-kernel/linux/linux-yocto-tin=
y-kexecboot_3.10.bb, do_compile

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libim=
obiledevice_1.1.4.bb, do_configure

=3D=3D=3D Number of failed tasks =3D=3D=3D
{| class=3Dwikitable
|-
||qemuarm       ||18    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140321_202837.log/
|-
||qemux86       ||24    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140320_223155.log/
|-
||qemux86_64    ||24    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140322_111055.log/
|}

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMvR2wACgkQN1Ujt2V2gBwJ8wCgmUhKBg4uDSLYPtTFuAHaF/MH
uZ4AoJMhWQf9L8DGHEZIZO1tWsIO3RDC
=o38L
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--
