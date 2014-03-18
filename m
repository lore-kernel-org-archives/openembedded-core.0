Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 64F836F7D2;
	Tue, 18 Mar 2014 18:50:09 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id c13so5693952eek.24
	for <multiple recipients>; Tue, 18 Mar 2014 11:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=xwwV6PyLhTWKmF+/HSdKImVy9de5SgACYp1ra70bTyM=;
	b=Txora9NRj7GoyFOctHnNe0uaL7JJ3cu5vH2ta+E8ZHv1WDA0zc1AX4oXJhSSZ5mWiB
	ZxhiIY49qWY7KfQMPoMEuE6rpA+h9YCBNTG6SwgPRJbAxlSmJlFwAYVSdLLDLryJvwEH
	2xERk5IsQh6gU0wosD316ZTjckkZeUl3LuMsdyLw8mc6IV86uf85jjlRfSvHMxF0oJZB
	cMQubW2dwxuWul1GSX2N0Fs8WIYwRRLRoqsiY8TwAQT+z9Abtttz+h/D78f9u6BECVGM
	5+btq0AcRXv3eiDZAL8bAavQ9q56D8+4WJZHYelSpKOTwAzd+0awoVg9tnHBV1vW/6V1
	7W1g==
X-Received: by 10.15.102.74 with SMTP id bq50mr31798358eeb.21.1395168610590;
	Tue, 18 Mar 2014 11:50:10 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	a4sm47249968eep.12.2014.03.18.11.50.08 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Mar 2014 11:50:08 -0700 (PDT)
Date: Tue, 18 Mar 2014 19:50:08 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140318185008.GA3725@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: State of bitbake world, Failed tasks 2014-03-18
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
X-List-Received-Date: Tue, 18 Mar 2014 18:50:11 -0000
X-Groupsio-MsgNum: 51341
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Content-Disposition: inline

--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 15, 2014 at 03:10:46PM +0100, Martin Jansa wrote:
> On Tue, Mar 11, 2014 at 02:50:14PM +0100, Martin Jansa wrote:
> > On Tue, Mar 11, 2014 at 02:45:04PM +0100, Martin Jansa wrote:
> > > Biggest difference from last e-mail is aclocal changes which can poss=
ibly explain
> > > increased number of do_configure failures, I've asked Richard to dela=
y merging B!=3DS
> > > change until we resolve or at least analyze these new failures, so an=
y help with
> > > would be highly appreciated.

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2014-03-18 =3D=3D

=3D=3D=3D common (13) =3D=3D=3D
    * meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.b=
b, do_compile
    * meta-openembedded/meta-multimedia/recipes-multimedia/libdc1394/libdc1=
394_git.bb, do_configure
    * meta-openembedded/meta-networking/recipes-protocols/quagga/quagga_0.9=
9.21.bb, do_compile
    * meta-openembedded/meta-networking/recipes-support/traceroute/tracerou=
te_2.0.18.bb, do_compile
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

=3D=3D=3D common-x86 (10) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
    * meta-openembedded/meta-efl/recipes-efl/e17/eve_svn.bb, do_compile
    * meta-openembedded/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.=
30.3.bb, do_configure
    * meta-openembedded/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8=
=2E0.bb, do_compile
    * meta-openembedded/meta-oe/recipes-graphics/lxdm/lxdm_git.bb, do_confi=
gure
    * meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_com=
pile
    * meta-openembedded/meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb, =
do_configure
    * meta-openembedded/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb, =
do_configure
    * meta-openembedded/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0=
=2Ebb, do_configure
    * openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package

=3D=3D=3D qemuarm (6) =3D=3D=3D
    * meta-openembedded/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18=
=2E4.bb, do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb, do_i=
nstall
    * meta-openembedded/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb, d=
o_install
    * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb, do_=
compile
    * openembedded-core/meta/recipes-bsp/grub/grub_git.bb, do_package
    * openembedded-core/meta/recipes-gnome/gtk+/gtk+_2.24.22.bb, do_compile

=3D=3D=3D qemux86 (2) =3D=3D=3D
    * meta-openembedded/meta-gnome/recipes-gnome/devilspie/devilspie2_0.24.=
bb, do_compile
    * meta-openembedded/meta-initramfs/recipes-kernel/linux/linux-yocto-tin=
y-kexecboot_3.10.bb, do_compile

=3D=3D=3D qemux86_64 (2) =3D=3D=3D
    * meta-openembedded/meta-networking/recipes-support/netcf/netcf_git.bb,=
 do_configure
    * meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libim=
obiledevice_1.1.4.bb, do_configure

=3D=3D=3D Number of failed tasks =3D=3D=3D
{| class=3Dwikitable
|-
||qemuarm       ||19    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140315_151659.log/
|-
||qemux86       ||27    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140316_065743.log/
|-
||qemux86_64    ||25    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140318_003256.log/
|}

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMolWAACgkQN1Ujt2V2gBzSywCgg6Uv+eDKPMR3JUwl9TAkhLWB
/2cAoKu+TAjTsWTJEx1XVJz/CWKRinCu
=eBza
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--
