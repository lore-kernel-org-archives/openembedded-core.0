Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id D4487605BD;
	Thu, 10 Apr 2014 12:29:55 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id d17so3002075eek.4
	for <multiple recipients>; Thu, 10 Apr 2014 05:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=vshUJb9MLeengPe9zLSHs7rdD9ZVQfbkTqTvoNvYADI=;
	b=KJloGDCuuVTi3vbrTCBTRLRT3KVEAG3tkwco1YsbdlHvnfGjLpveWZK3X9I2oFnA9q
	mICwiTILi7d0nDBxex+193ss+mMDPcXecFYTA9Bdbg1ACvAzfeC5RLBZpWMAAZk/g/5l
	tiDaprFi116pISAAZotGReprLstIpbiNnHX4L1sEuESLxg/lpOpVJpgnB+ita1hNIX5T
	yAlMBFfYUmPCtH/iX5wCpGmGMGGsJ160wBgekY+O77D1BLJlVFwVgAi5b+1GCgjj0nif
	uYZuQoBDhie40pUpkDArb9bUYokj5Jmx/BAec7ZqNFGJ9jbG1E6d9LYCVcQ/urLMaAJF
	P7RQ==
X-Received: by 10.14.94.5 with SMTP id m5mr20590469eef.23.1397132996154;
	Thu, 10 Apr 2014 05:29:56 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o7sm9610177eew.25.2014.04.10.05.29.54 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Apr 2014 05:29:55 -0700 (PDT)
Date: Thu, 10 Apr 2014 14:30:03 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140410123003.GS2132@jama>
References: <20140403130609.GF2132@jama>
 <20140404120706.GJ2132@jama>
MIME-Version: 1.0
In-Reply-To: <20140404120706.GJ2132@jama>
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
X-List-Received-Date: Thu, 10 Apr 2014 12:29:58 -0000
X-Groupsio-MsgNum: 52339
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/7+LvQqw8N5lf/3J"
Content-Disposition: inline

--/7+LvQqw8N5lf/3J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 04, 2014 at 02:07:06PM +0200, Martin Jansa wrote:
> On Thu, Apr 03, 2014 at 03:06:09PM +0200, Martin Jansa wrote:
> > On Sun, Mar 30, 2014 at 01:28:00AM +0100, Martin Jansa wrote:
> > > Be aware that I plan to run test-dependencies script for next few day=
s,
> > > so changes to meta-oe will be delayed until it's finished and I can u=
se
> > > jenkins again to test incoming changes.
> >=20
> > I've just started this long test-dependencies build so jenkins will be =
busy
> > for next 14 days or so, but I'll send complete qa.log in advance as soo=
n as
> > it finishes building world from scratch.
>=20
> Here is newer qemuarm log with metadata matching what was used in
> last qemux86-64 build (except removed qtbase review)
>=20
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2=
0140403_143715.log/test-dependencies.log
>=20
> Summary: 13 tasks failed:
>   meta-openembedded/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb, do_ins=
tall
>   meta-openembedded/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb, do=
_compile
>   openembedded-core/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb, do_=
compile
>   meta-openembedded/meta-multimedia/recipes-multimedia/openal/openal-soft=
_1.15.1.bb, do_compile
>   meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb, do_co=
mpile
>   meta-openembedded/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-back=
grounds_2.32.0.bb, do_configure
>   meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_compile
>   openembedded-core/meta/recipes-bsp/grub/grub_git.bb, do_package
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
> Summary: There were 245 WARNING messages shown.
>=20
> and more importantly new qa.log with all entries (because it was building=
 from
> scratch without sstate-cache, surprisingly not so many now:
>=20
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2=
0140403_143715.log/qa.log

FYI: the test-dependencies build is in 2nd half - 3rd build (so should fini=
sh next
week as planned):
Building recipe: cracklib (142/1776)

> > The report looks a lot better, thanks to everybody who sent patches! Be=
 aware
> > that qemuarm still shows a lot more failures, that's because only last =
qemux86-64
> > build contained all fixes from ML.
> >=20
> > Here is just qemux86-64 build:
> >   meta-qt5/recipes-qt/qt5/qtbase_5.2.1.bb, do_configure
> >   meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
> >   openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package
> >   meta-openembedded/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb, do_i=
nstall
> >   meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libim=
obiledevice_1.1.4.bb, do_configure
> >   meta-openembedded/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb, =
do_compile
> >   meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_com=
pile
> >   meta-openembedded/meta-multimedia/recipes-multimedia/openal/openal-so=
ft_1.15.1.bb, do_compile
> >   meta-openembedded/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-ba=
ckgrounds_2.32.0.bb, do_configure
> >   meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_comp=
ile
> >   meta-openembedded/meta-gnome/recipes-gnome/devilspie/devilspie2_0.24.=
bb, do_compile
> >   openembedded-core/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.1=
3.bb, do_configure
> >   meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.b=
b, do_configure
> >   meta-openembedded/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb, do_c=
ompile
> >   meta-openembedded/meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb, =
do_configure
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/7+LvQqw8N5lf/3J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNGjssACgkQN1Ujt2V2gBwUzQCfS0rS428dbyS3+I6hMVklk+1u
XlEAnRereqiUHIydN1WtbvDsaCbkie7k
=Kei8
-----END PGP SIGNATURE-----

--/7+LvQqw8N5lf/3J--
