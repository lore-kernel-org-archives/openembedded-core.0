Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 071146E2D8;
	Fri,  4 Apr 2014 12:07:05 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id y10so3278900wgg.1
	for <multiple recipients>; Fri, 04 Apr 2014 05:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=KzRBAbRZ1JPqOCHvPkYPaLi+n35EuTKcFSCRpKaqVNM=;
	b=be2kWfF5lJOSEfZx/X+Bt9TyX5OpEFMOTf/6Ctuwk2zVa/31jCCDJ3aC2V/TsvuNPG
	QSlsJ0FzpcMsjIrMNgrYCjMyr3P+Kc97UP9FPOFJ496fSZ/1DUWLbGY3NhSFFQeV4rdD
	4K1Y6o2WDi60qDvejJy36X/gEBYokB/jv5dljtaJkr5tEwZOPTxSvxRSnyWf9fbtc7SQ
	MRTfAsrUl0csALQO79jVarcx2N06rTwol8rXwawgIU/ZTHmX+TTqqYHWkW8jC5mLEHbR
	7uk9ht2AuzWrizUecWq/vfcg3/0WGlgwRkwz/KqgH2XZGqpiAFDgSK1pdEqBTONst/kZ
	L2fA==
X-Received: by 10.194.63.236 with SMTP id j12mr19469947wjs.5.1396613225836;
	Fri, 04 Apr 2014 05:07:05 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	q41sm19156780eez.7.2014.04.04.05.07.03 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Apr 2014 05:07:04 -0700 (PDT)
Date: Fri, 4 Apr 2014 14:07:06 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140404120706.GJ2132@jama>
References: <20140403130609.GF2132@jama>
MIME-Version: 1.0
In-Reply-To: <20140403130609.GF2132@jama>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: State of bitbake world, Failed tasks 2014-04-03
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
X-List-Received-Date: Fri, 04 Apr 2014 12:07:08 -0000
X-Groupsio-MsgNum: 52166
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cN519qCC4CN1mUcX"
Content-Disposition: inline

--cN519qCC4CN1mUcX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 03, 2014 at 03:06:09PM +0200, Martin Jansa wrote:
> On Sun, Mar 30, 2014 at 01:28:00AM +0100, Martin Jansa wrote:
> > Be aware that I plan to run test-dependencies script for next few days,
> > so changes to meta-oe will be delayed until it's finished and I can use
> > jenkins again to test incoming changes.
>=20
> I've just started this long test-dependencies build so jenkins will be bu=
sy
> for next 14 days or so, but I'll send complete qa.log in advance as soon =
as
> it finishes building world from scratch.

Here is newer qemuarm log with metadata matching what was used in
last qemux86-64 build (except removed qtbase review)

http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
40403_143715.log/test-dependencies.log

Summary: 13 tasks failed:
  meta-openembedded/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb, do_insta=
ll
  meta-openembedded/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb, do_c=
ompile
  openembedded-core/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb, do_co=
mpile
  meta-openembedded/meta-multimedia/recipes-multimedia/openal/openal-soft_1=
=2E15.1.bb, do_compile
  meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb, do_comp=
ile
  meta-openembedded/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgr=
ounds_2.32.0.bb, do_configure
  meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_compile
  openembedded-core/meta/recipes-bsp/grub/grub_git.bb, do_package
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
Summary: There were 245 WARNING messages shown.

and more importantly new qa.log with all entries (because it was building f=
rom
scratch without sstate-cache, surprisingly not so many now:

http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
40403_143715.log/qa.log

> The report looks a lot better, thanks to everybody who sent patches! Be a=
ware
> that qemuarm still shows a lot more failures, that's because only last qe=
mux86-64
> build contained all fixes from ML.
>=20
> Here is just qemux86-64 build:
>   meta-qt5/recipes-qt/qt5/qtbase_5.2.1.bb, do_configure
>   meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
>   openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package
>   meta-openembedded/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb, do_ins=
tall
>   meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libimob=
iledevice_1.1.4.bb, do_configure
>   meta-openembedded/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb, do=
_compile
>   meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_compi=
le
>   meta-openembedded/meta-multimedia/recipes-multimedia/openal/openal-soft=
_1.15.1.bb, do_compile
>   meta-openembedded/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-back=
grounds_2.32.0.bb, do_configure
>   meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_compile
>   meta-openembedded/meta-gnome/recipes-gnome/devilspie/devilspie2_0.24.bb=
, do_compile
>   openembedded-core/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.=
bb, do_configure
>   meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb,=
 do_configure
>   meta-openembedded/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb, do_com=
pile
>   meta-openembedded/meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb, do=
_configure

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cN519qCC4CN1mUcX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlM+oGoACgkQN1Ujt2V2gBxpOwCgoyUo15uNgFEn3zT9ekRmPwKQ
wJwAoLb+3GSxb8y0SlWjsFNQp8fUyZH0
=eM+a
-----END PGP SIGNATURE-----

--cN519qCC4CN1mUcX--
