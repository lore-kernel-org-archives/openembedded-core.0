Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 38F2F60C02;
	Sat, 29 Mar 2014 22:54:30 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id c41so5233717eek.22
	for <multiple recipients>; Sat, 29 Mar 2014 15:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=aMShy379O/U1MddT1/3rr68iWFZUctuKdbH+GnYIBWk=;
	b=pczfOeeKrbG5+a6N7ftrL+IaHAZg3QzDEYlfY/2M1JgeIrsIFrWPKyLBgPgfWNR7jD
	zOGtSeitXjf5wVBFC0rqBomsG6Ah1Znez1t9XGAk9fpoBkBhWoPQ1lwc4ZtjOAnvac1Z
	gW2YvCLaZbXwvZ9FqOauhtFqglyDgDoDbX9N6O2gv8pJVqpo8x1Y76Qbb+79twbD/U2q
	CWytBKPrzs+qzEgVpBEEc0T2zgSauVaFO1blvrJ2AUPoDMbe3bs6MQNvhRo7GVQOCsL/
	P5sI9qtn+11M99h0H1IVGfmeX/XI/pAqsvTBhxXzEl1rn+N4gsGOUpgF2uK3KT3psV7d
	sUSA==
X-Received: by 10.15.54.137 with SMTP id t9mr19864631eew.39.1396133669655;
	Sat, 29 Mar 2014 15:54:29 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	x45sm21651323eef.15.2014.03.29.15.54.28 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 29 Mar 2014 15:54:28 -0700 (PDT)
Date: Sat, 29 Mar 2014 23:54:32 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140329225432.GA2428@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: State of bitbake world, Failed tasks 2014-03-29
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
X-List-Received-Date: Sat, 29 Mar 2014 22:54:34 -0000
X-Groupsio-MsgNum: 51863
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="r5Pyd7+fXNt84Ff3"
Content-Disposition: inline

--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2014 at 06:11:36PM +0100, Martin Jansa wrote:
> On Sun, Mar 23, 2014 at 09:43:24PM +0100, Martin Jansa wrote:
> > On Tue, Mar 18, 2014 at 07:50:08PM +0100, Martin Jansa wrote:
> > > On Sat, Mar 15, 2014 at 03:10:46PM +0100, Martin Jansa wrote:
> > > > On Tue, Mar 11, 2014 at 02:50:14PM +0100, Martin Jansa wrote:
> > > > > On Tue, Mar 11, 2014 at 02:45:04PM +0100, Martin Jansa wrote:
> > > > > > Biggest difference from last e-mail is aclocal changes which ca=
n possibly explain
> > > > > > increased number of do_configure failures, I've asked Richard t=
o delay merging B!=3DS
> > > > > > change until we resolve or at least analyze these new failures,=
 so any help with
> > > > > > would be highly appreciated.

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2014-03-29 =3D=3D

=3D=3D=3D common (23) =3D=3D=3D
    * meta-openembedded/meta-gnome/recipes-gnome/devilspie/devilspie2_0.24.=
bb, do_compile
    * meta-openembedded/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.=
30.3.bb, do_configure
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
    * meta-openembedded/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8=
=2E0.bb, do_compile
    * meta-openembedded/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb,=
 do_configure
    * meta-openembedded/meta-oe/recipes-multimedia/sound-themes/sound-theme=
-freedesktop_0.8.bb, do_configure
    * meta-openembedded/meta-oe/recipes-navigation/monav/monav_0.3.bb, do_c=
ompile
    * meta-openembedded/meta-oe/recipes-support/asio/asio_1.4.1.bb, do_comp=
ile
    * meta-openembedded/meta-oe/recipes-support/inih/libinih_git.bb, do_ins=
tall
    * meta-openembedded/meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8=
=2E3.bb, do_configure
    * meta-openembedded/meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb, =
do_configure
    * meta-openembedded/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb, =
do_configure
    * meta-openembedded/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-task=
manager_git.bb, do_configure
    * meta-openembedded/meta-xfce/recipes-panel-plugins/closebutton/xfce4-c=
losebutton-plugin_git.bb, do_configure
    * meta-openembedded/meta-xfce/recipes-xfce/xfce4-settings/xfce4-setting=
s_git.bb, do_configure
    * meta-openembedded/meta-xfce/recipes-xfce/xfwm4/xfwm4_git.bb, do_confi=
gure

=3D=3D=3D common-x86 (3) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
    * meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_com=
pile
    * openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package

=3D=3D=3D qemuarm (3) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb, do_=
compile
    * openembedded-core/meta/recipes-bsp/grub/grub_git.bb, do_package
    * openembedded-core/meta/recipes-support/libunistring/libunistring_0.9.=
3.bb, do_compile

=3D=3D=3D qemux86 (1) =3D=3D=3D
    * meta-openembedded/meta-initramfs/recipes-kernel/linux/linux-yocto-tin=
y-kexecboot_3.10.bb, do_compile

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libim=
obiledevice_1.1.4.bb, do_configure

=3D=3D=3D Number of failed tasks =3D=3D=3D
{| class=3Dwikitable
|-
||qemuarm       ||26    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140327_005335.log/
|-
||qemux86       ||27    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140327_235230.log/
|-
||qemux86_64    ||27    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140329_001343.log/
|}

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--r5Pyd7+fXNt84Ff3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlM3TygACgkQN1Ujt2V2gBwHsACfZyboX8tZWAq5jbI7rbbt10jE
rHgAn2dNZKgTSvn3TeY0u0rM1/vDzwUz
=OrTr
-----END PGP SIGNATURE-----

--r5Pyd7+fXNt84Ff3--
