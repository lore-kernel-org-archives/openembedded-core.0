Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id BE6F06065C;
	Tue,  4 Jun 2013 11:58:35 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id n57so109087wev.28
	for <multiple recipients>; Tue, 04 Jun 2013 04:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ZrLPOVeMDgrij+WUzb1PwHF/eO/xBVNhzt9mXKMMQAg=;
	b=lVn7E/wUEX/EWhHSoge4f8KvoWyxOrl8POMDYBXgI1whXjOP2mvyL9vMYEf+uhH4nj
	GK/8UR/lp7pwuuF5BVTZ3UZm8KmABhFo5ZObhNAuT6qXy3M+Boan//sn4V+jDAyW99AB
	aJIWCBLDyIe2LbuqbbuoCOLCoPjC9nHkaEzAJR1db6n4Sks1J3a5J5KXBYQQDeaHlKrM
	ufw4CwyqppdM38cQSeV8tjAPzgxuyuZ7LCk07IHnx6jVUpaouz4QGvfQbth4P+iZbSj+
	TVp6Q9mJnQwXsOX8vEAFPHYg91zA2N8xiU+5J/t7b5a6a5uweN2ByHvg3KlCb+LilaGy
	82ww==
X-Received: by 10.180.21.193 with SMTP id x1mr1054853wie.31.1370347115532;
	Tue, 04 Jun 2013 04:58:35 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	dj7sm2172172wib.6.2013.06.04.04.58.34 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 04 Jun 2013 04:58:34 -0700 (PDT)
Date: Tue, 4 Jun 2013 13:58:51 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Message-ID: <20130604115851.GD3279@jama>
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
	<20130427105400.GB3199@jama> <20130502151833.GC3206@jama>
	<20130516075215.GA24809@jama.dyndns-home.com>
	<20130520130635.GA32431@jama> <20130603151008.GC3279@jama>
MIME-Version: 1.0
In-Reply-To: <20130603151008.GC3279@jama>
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
X-List-Received-Date: Tue, 04 Jun 2013 11:58:36 -0000
X-Groupsio-MsgNum: 40151
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="u65IjBhB3TIa72Vp"
Content-Disposition: inline

--u65IjBhB3TIa72Vp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 03, 2013 at 05:10:08PM +0200, Martin Jansa wrote:
> On Mon, May 20, 2013 at 03:06:35PM +0200, Martin Jansa wrote:
> > Couple of issues from last email were fixed, so here is updated status:
> >=20
> > qemuarm Summary: 14 tasks failed:
> > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world=
=2E20130520_090009.log
> > qemux86 Summary: 19 tasks failed:
> > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world=
=2E20130519_170509.log
> > qemux86-64 Summary: 20 tasks failed:
> > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world=
=2E20130520_005747.log
>=20
> Hi,
>=20
> updated status, still building with gcc-4.8
> shr-version issue already fixed
> llvm2.9 also fixed
> so if we don't count these 3 failures it's a bit better than last status
>=20
> qemuarm Summary: 15 tasks failed:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2=
0130601_225651.log
>=20
> qemux86 Summary: 18 tasks failed:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2=
0130603_011743.log/
>=20
> qemux86-64: Summary: 21 tasks failed:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2=
0130602_103752.log
>=20
> common (13):
>   meta-openembedded/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_=
2.32.1.bb, do_compile
>   meta-openembedded/meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb, do_com=
pile
>   virtual:native:meta-openembedded/meta-oe/recipes-core/llvm/llvm2.9_2.9.=
bb, do_compile
>   meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_compi=
le
>   meta-openembedded/meta-oe/recipes-navigation/omgps/omgps_svn.bb, do_com=
pile
>   meta-openembedded/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.=
bb, do_compile
>   meta-openembedded/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb=
, do_compile
>   meta-openembedded/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb, do_=
compile
>   meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.5.8.bb, do_config=
ure
>   meta-openembedded/meta-networking/recipes-support/ipsec-tools/ipsec-too=
ls_0.7.2.bb, do_compile
>   meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb,=
 do_compile
>   meta-smartphone/meta-shr/recipes-shr/shr/shr-version.bb, do_configure
>   meta-smartphone/meta-shr/recipes-shr/shr/shr-version.bb, do_populate_lic
>=20
> qemuarm (2):
>   meta-openembedded/meta-oe/recipes-support/libunwind/libunwind_1.1.bb, d=
o_compile
>   openembedded-core/meta/recipes-devtools/qemu/qemu_1.4.1.bb, do_compile
>=20
> qemux86* common (3):
>   openembedded-core/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.=
21.6.bb, do_compile
>   meta-openembedded/meta-oe/recipes-support/ode/ode_0.9.bb, do_configure
>   openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package
>=20
> qemux86 (2):
>   meta-browser/recipes-browser/chromium/chromium_29.0.1518.2.bb, do_compi=
le
>   meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode=
_2.11.14.bb, do_compile
>=20
> qemux86-64 (5):
>   meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
>   meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libimob=
iledevice_1.1.4.bb, do_configure
>   meta-openembedded/meta-gnome/recipes-gnome/gnome-session/gnome-session_=
2.32.1.bb, do_compile
>   meta-browser/recipes-browser/chromium/chromium_29.0.1518.2.bb, do_compi=
le
>   meta-openembedded/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl=
_2.1.26.bb, do_configure

I forgot to mention that many packages now detect /run directory and
install unshipped files, causing many new QA warnings, this isn't complete =
list,=20
because some packages were reused from sstate-cache:

usbmuxd-git: usbmuxd: Files/directories were installed but not shipped
  /usr/lib64
  /usr/lib64/libusbmuxd.so
  /usr/lib64/libusbmuxd.so.1.0.8
  /usr/lib64/libusbmuxd.so.2
  /usr/lib64/pkgconfig
  /usr/lib64/.debug
  /usr/lib64/pkgconfig/libusbmuxd.pc
  /usr/lib64/.debug/libusbmuxd.so.1.0.8
openldap-2.4.23: openldap: Files/directories were installed but not shipped
  /run
networkmanager-0.9.8.0: networkmanager: Files/directories were installed bu=
t not shipped
  /run
  /run/NetworkManager
cherokee-1.2.98: cherokee: Files/directories were installed but not shipped
  /run
nostromo-1.9.5: nostromo: Files/directories were installed but not shipped
  /run
  /run/nostromo
gdm-2.32.2: gdm: Files/directories were installed but not shipped
  /run
  /run/gdm
  /run/gdm/greeter
collectd-5.2.2: collectd: Files/directories were installed but not shipped
  /run

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--u65IjBhB3TIa72Vp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGt1nsACgkQN1Ujt2V2gByskgCgmFduHkehMSZp3edWgu681MYm
4l4An3WpV+6bNfq5xlFik5BeP+804FYt
=7ctA
-----END PGP SIGNATURE-----

--u65IjBhB3TIa72Vp--
