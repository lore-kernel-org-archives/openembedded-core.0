Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id AF42F6A442;
	Mon,  3 Jun 2013 15:09:54 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id e11so3344947wgh.14
	for <multiple recipients>; Mon, 03 Jun 2013 08:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=kionEyHYVZainY80hHrkTZjpqSGfzus3JlaDpCYR3D0=;
	b=HP3m3kCCYWRueFB1q7CwamwoN6l39mcgVCogI4gQxIrBKJq8W1uKd01yCbw3yRjajx
	X8mNPRv4trKQlvSsYLRj/8bN2cYm/5FUbRvJOFzekW10I1IgE+D1eOAN3oqfo9rnviKe
	ghbUQR207iwUgRq3RAZr5GDWpqPsUEf3HfvpYo8HwHvLr+DfFmxDJMoO6fBYs3908Wb/
	x/50jXsgqkBmgktDtrE8LCoog+i5L/gpCXOcOdfsDvIHYcXpxFjQwq8vI7m+tHQ1jaFo
	DK76LMeZ4SxvDXEKFTLr/bbu7AgMtw6bjXn+ZSyPNMyzDGsFaJvY1DwXiZtt10KkOeBX
	3vUw==
X-Received: by 10.180.108.168 with SMTP id hl8mr13278850wib.23.1370272194000; 
	Mon, 03 Jun 2013 08:09:54 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	h8sm24037520wiz.9.2013.06.03.08.09.52 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 03 Jun 2013 08:09:53 -0700 (PDT)
Date: Mon, 3 Jun 2013 17:10:08 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Message-ID: <20130603151008.GC3279@jama>
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
	<20130427105400.GB3199@jama> <20130502151833.GC3206@jama>
	<20130516075215.GA24809@jama.dyndns-home.com>
	<20130520130635.GA32431@jama>
MIME-Version: 1.0
In-Reply-To: <20130520130635.GA32431@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: State of bitbake world
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
X-List-Received-Date: Mon, 03 Jun 2013 15:09:55 -0000
X-Groupsio-MsgNum: 40119
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O3RTKUHj+75w1tg5"
Content-Disposition: inline

--O3RTKUHj+75w1tg5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 20, 2013 at 03:06:35PM +0200, Martin Jansa wrote:
> Couple of issues from last email were fixed, so here is updated status:
>=20
> qemuarm Summary: 14 tasks failed:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2=
0130520_090009.log
> qemux86 Summary: 19 tasks failed:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2=
0130519_170509.log
> qemux86-64 Summary: 20 tasks failed:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2=
0130520_005747.log

Hi,

updated status, still building with gcc-4.8
shr-version issue already fixed
llvm2.9 also fixed
so if we don't count these 3 failures it's a bit better than last status

qemuarm Summary: 15 tasks failed:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30601_225651.log

qemux86 Summary: 18 tasks failed:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30603_011743.log/

qemux86-64: Summary: 21 tasks failed:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30602_103752.log

common (13):
  meta-openembedded/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.=
32.1.bb, do_compile
  meta-openembedded/meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb, do_compi=
le
  virtual:native:meta-openembedded/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb=
, do_compile
  meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_compile
  meta-openembedded/meta-oe/recipes-navigation/omgps/omgps_svn.bb, do_compi=
le
  meta-openembedded/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb=
, do_compile
  meta-openembedded/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb, =
do_compile
  meta-openembedded/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb, do_co=
mpile
  meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.5.8.bb, do_configure
  meta-openembedded/meta-networking/recipes-support/ipsec-tools/ipsec-tools=
_0.7.2.bb, do_compile
  meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb, d=
o_compile
  meta-smartphone/meta-shr/recipes-shr/shr/shr-version.bb, do_configure
  meta-smartphone/meta-shr/recipes-shr/shr/shr-version.bb, do_populate_lic

qemuarm (2):
  meta-openembedded/meta-oe/recipes-support/libunwind/libunwind_1.1.bb, do_=
compile
  openembedded-core/meta/recipes-devtools/qemu/qemu_1.4.1.bb, do_compile

qemux86* common (3):
  openembedded-core/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21=
=2E6.bb, do_compile
  meta-openembedded/meta-oe/recipes-support/ode/ode_0.9.bb, do_configure
  openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package

qemux86 (2):
  meta-browser/recipes-browser/chromium/chromium_29.0.1518.2.bb, do_compile
  meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2=
=2E11.14.bb, do_compile

qemux86-64 (5):
  meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
  meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libimobil=
edevice_1.1.4.bb, do_configure
  meta-openembedded/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.=
32.1.bb, do_compile
  meta-browser/recipes-browser/chromium/chromium_29.0.1518.2.bb, do_compile
  meta-openembedded/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2=
=2E1.26.bb, do_configure

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--O3RTKUHj+75w1tg5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGssdAACgkQN1Ujt2V2gBw1vwCgtX0F649EVbTFAOQrVhXPwm7E
RaAAn3aiHAMq7PYQnCdY6p8W/awpfbGC
=AJGR
-----END PGP SIGNATURE-----

--O3RTKUHj+75w1tg5--
