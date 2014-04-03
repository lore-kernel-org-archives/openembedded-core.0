Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id A66686E4CC;
	Thu,  3 Apr 2014 13:06:20 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id w62so1834316wes.0
	for <multiple recipients>; Thu, 03 Apr 2014 06:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=1UXJ2eSdeF/SEVqy2wOZTlvVZm8Rv1a0yc2VVRypb8M=;
	b=qnnzwZ54ZSgqmArPwD78ob8FXyyjC6lA60hsaTFz1XQsVTAub3xO0hpxdCMZSkdGap
	eE1jUgNAJof07hwR2L1sxXnKdNeFrsYVDuj+8swe3l0NYhMsa9PPrVLx8WwGx2pvs/BZ
	0IKJko6gcosOt4hgHIdtVO8+ovPAsS0BhOJVlOvTwJU/HymZ9lvVieLwIZ2j3yrsiGkD
	udA89KZwFVODW0ByOHnAaG0W188Eu+/3/qKlflg2Q/rm9YudHt1ynQZhttpVjKuS84wo
	UE5pJMqzZKTURcVakNzfGxlThI1n0eMuN4XpCOkOLFzmbQELrSCERUmZ6Ezj0UQa6HhB
	RfMw==
X-Received: by 10.180.211.208 with SMTP id ne16mr37479147wic.21.1396530368705; 
	Thu, 03 Apr 2014 06:06:08 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u1sm11925427eex.31.2014.04.03.06.06.07 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Apr 2014 06:06:07 -0700 (PDT)
Date: Thu, 3 Apr 2014 15:06:09 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140403130609.GF2132@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: State of bitbake world, Failed tasks 2014-04-03
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
X-List-Received-Date: Thu, 03 Apr 2014 13:06:25 -0000
X-Groupsio-MsgNum: 52125
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="V4b9U9vrdWczvw78"
Content-Disposition: inline

--V4b9U9vrdWczvw78
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 30, 2014 at 01:28:00AM +0100, Martin Jansa wrote:
> Be aware that I plan to run test-dependencies script for next few days,
> so changes to meta-oe will be delayed until it's finished and I can use
> jenkins again to test incoming changes.

I've just started this long test-dependencies build so jenkins will be busy
for next 14 days or so, but I'll send complete qa.log in advance as soon as
it finishes building world from scratch.

The report looks a lot better, thanks to everybody who sent patches! Be awa=
re
that qemuarm still shows a lot more failures, that's because only last qemu=
x86-64
build contained all fixes from ML.

Here is just qemux86-64 build:
  meta-qt5/recipes-qt/qt5/qtbase_5.2.1.bb, do_configure
  meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
  openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package
  meta-openembedded/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb, do_insta=
ll
  meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libimobil=
edevice_1.1.4.bb, do_configure
  meta-openembedded/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb, do_c=
ompile
  meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_compile
  meta-openembedded/meta-multimedia/recipes-multimedia/openal/openal-soft_1=
=2E15.1.bb, do_compile
  meta-openembedded/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgr=
ounds_2.32.0.bb, do_configure
  meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_compile
  meta-openembedded/meta-gnome/recipes-gnome/devilspie/devilspie2_0.24.bb, =
do_compile
  openembedded-core/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb=
, do_configure
  meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb, d=
o_configure
  meta-openembedded/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb, do_compi=
le
  meta-openembedded/meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb, do_c=
onfigure

qtbase was broken by one patch from oe-devel ML, I've removed it for now.

abiword was upgraded to fix failure, but will need some more changes.

openal-soft, gst-ffmpeg and xbmc are failing because now world builds set P=
_V for libav
to use version 9 needed by newer mplayer (which was failing before because =
of live555),
xbmc was always failing, now it only fails a bit sooner in do_configure whe=
n checking ffmpeg.

emacs is failing because of segfault in qemu, the same symptoms as before:
http://git.openembedded.org/meta-openembedded/commit/?id=3D72e02b4625dceb0c=
c72e1edfc28215786c7de63a
maybe some something was lost in transition to oe-core, or there is new iss=
ue in pixman or somewhere else:
http://git.openembedded.org/openembedded-core/tree/meta/recipes-graphics/xo=
rg-lib/pixman/0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.pat=
ch

I'll look into gnome-backgrounds and mousepad, because I have pending patch=
es for them
which probably don't fix it completely.

Other recipes are still "free" for fixing, please fix them and send reply t=
o this thread
when you start looking into it, so that nobody duplicates work.

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2014-04-03 =3D=3D

=3D=3D=3D common (7) =3D=3D=3D
    * meta-openembedded/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-ba=
ckgrounds_2.32.0.bb, do_configure
    * meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.b=
b, do_configure
    * meta-openembedded/meta-multimedia/recipes-multimedia/openal/openal-so=
ft_1.15.1.bb, do_compile
    * meta-openembedded/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb, do_c=
ompile
    * meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_comp=
ile
    * meta-openembedded/meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb, =
do_configure
    * openembedded-core/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.1=
3.bb, do_configure

=3D=3D=3D common-x86 (5) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
    * meta-openembedded/meta-gnome/recipes-gnome/devilspie/devilspie2_0.24.=
bb, do_compile
    * meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_com=
pile
    * meta-qt5/recipes-qt/qt5/qtbase_5.2.1.bb, do_configure
    * openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package

=3D=3D=3D qemuarm (15) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-extended/gnuplot/gnuplot_4.4.4.bb, =
do_compile
    * meta-openembedded/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8=
=2E0.bb, do_compile
    * meta-openembedded/meta-oe/recipes-navigation/monav/monav_0.3.bb, do_c=
ompile
    * meta-openembedded/meta-oe/recipes-support/asio/asio_1.4.1.bb, do_comp=
ile
    * meta-openembedded/meta-oe/recipes-support/inih/libinih_git.bb, do_ins=
tall
    * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb, do_=
compile
    * meta-openembedded/meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8=
=2E3.bb, do_configure
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
    * meta-qt5/recipes-qt/qt5/qtwebkit-examples_5.2.1.bb, do_compile
    * openembedded-core/meta/recipes-bsp/grub/grub_git.bb, do_package
    * openembedded-core/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb, d=
o_compile


=3D=3D=3D qemux86 (1) =3D=3D=3D
    * meta-openembedded/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb, =
do_compile

=3D=3D=3D qemux86_64 (3) =3D=3D=3D
    * meta-openembedded/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb, =
do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb, do_i=
nstall
    * meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libim=
obiledevice_1.1.4.bb, do_configure

=3D=3D=3D Number of failed tasks =3D=3D=3D
{| class=3Dwikitable
|-
||qemuarm       ||22    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140401_012017.log/
|-
||qemux86       ||20    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140401_122021.log//
|-
||qemux86_64    ||15    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140402_111852.log/
|}

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--V4b9U9vrdWczvw78
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlM9XMEACgkQN1Ujt2V2gBxKrACfSiMMZ0se2djsRzcEZs3Mz7/g
caAAn2O+A/LJDBJq7XG5p/OPBTYsJ/KQ
=gATw
-----END PGP SIGNATURE-----

--V4b9U9vrdWczvw78--
