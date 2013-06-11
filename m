Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 66D9F61FEC;
	Tue, 11 Jun 2013 16:04:11 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id o10so3153233eaj.19
	for <multiple recipients>; Tue, 11 Jun 2013 09:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=V9kRaCHnxpVvDJEU57dN3bhAayEQaQboXefgRHzjZjw=;
	b=SDPRS+oFGgsHqEXRNUa2qEvNlgAVESlFblrHWHbzV+zuHQy+lNgImwYQdxeXdnNOF8
	cHVuyA8WYKgo8mxFL1GmSUPiktNOdr6xoI/1Gc5jInlitDXTmWQcsKK0qRI+BPFB+G+w
	wWPOXjwPM6mkgerhIbZx9slUHzG/Y+WhtMH+m907VXBR/NHts/FmKJHWZx4wY8oKfsBA
	NLDw7tEHO/eaKvm3KFh76A8QttRW8euHk7OSfpggLonQtVwsCBXe2C6SI+aZxt2VVNVU
	Wn+CI/+j+4o0OvABuvcHL04sfBrbtu0bf7UfRomm4vp9mYmUmMGg8tWFMRoaifH4WhjO
	S5nA==
X-Received: by 10.14.100.2 with SMTP id y2mr4704803eef.75.1370966651405;
	Tue, 11 Jun 2013 09:04:11 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n42sm31189457eeh.15.2013.06.11.09.04.10 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 11 Jun 2013 09:04:10 -0700 (PDT)
Date: Tue, 11 Jun 2013 18:04:34 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Message-ID: <20130611160434.GI3233@jama>
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
X-List-Received-Date: Tue, 11 Jun 2013 16:04:12 -0000
X-Groupsio-MsgNum: 40489
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DwoPkXS38qd3dnhB"
Content-Disposition: inline

--DwoPkXS38qd3dnhB
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

There weren't many (any) changes merged to meta-oe last week, I hope to
get better builds now (started few minutes ago).

qemuarm Summary: 14 tasks failed:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30610_065148.log/

qemux86 Summary: 17 tasks failed:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30608_071258.log/

qemux86-64 Summary: 18 tasks failed:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30609_081044.log/

common:
  meta-openembedded/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb, do_p=
ackage
  meta-openembedded/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.=
32.1.bb, do_compile
  openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb, do_p=
ackage
  meta-openembedded/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb=
, do_compile
  meta-openembedded/meta-oe/recipes-navigation/omgps/omgps_svn.bb, do_compi=
le
  meta-openembedded/meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb, do_compi=
le
  meta-openembedded/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb, do_co=
mpile
  meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.5.8.bb, do_configure
  meta-openembedded/meta-networking/recipes-support/ipsec-tools/ipsec-tools=
_0.7.2.bb, do_compile

qemux86 common:
  meta-openembedded/meta-oe/recipes-support/ode/ode_0.9.bb, do_configure
  openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package
  openembedded-core/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21=
=2E6.bb, do_compile

qemuarm:
  meta-openembedded/meta-oe/recipes-support/libunwind/libunwind_1.1.bb, do_=
compile
  openembedded-core/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb, do_comp=
ile
  meta-openembedded/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb, =
do_compile
  openembedded-core/meta/recipes-devtools/qemu/qemu_1.4.1.bb, do_compile
  meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb, d=
o_compile

qemux86:
  openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb, do_config=
ure
  openembedded-core/meta/recipes-devtools/cmake/cmake-native_2.8.11.bb, do_=
configure
  meta-openembedded/meta-gnome/recipes-support/goffice/goffice_0.10.1.bb, d=
o_configure
  openembedded-core/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb, do_comp=
ile
  meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2=
=2E11.14.bb, do_compile

qemux86-64
  meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
  meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libimobil=
edevice_1.1.4.bb, do_configure
  meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_compile
  openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package
  meta-openembedded/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.=
32.1.bb, do_compile
  meta-openembedded/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb, =
do_compile
  meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb, d=
o_compile
  openembedded-core/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21=
=2E6.bb, do_compile

And the list of QA issues:
samba-3.6.8: Fixup Perms: Unable to correct directory link, target already =
exists: /var/run -> /run
samba-3.6.8: samba: Files/directories were installed but not shipped
  /run
  /run/lock
base-files-3.0.14: Fixup Perms: Unable to correct directory link, target al=
ready exists: /var/log -> /var/volatile/log
base-files-3.0.14: Fixup Perms: Unable to correct directory link, target al=
ready exists: /var/run -> /run
base-files-3.0.14: Fixup Perms: Unable to correct directory link, target al=
ready exists: /var/tmp -> /var/volatile/tmp
usbmuxd-git: usbmuxd: Files/directories were installed but not shipped
  /usr/lib64
  /usr/lib64/libusbmuxd.so
  /usr/lib64/libusbmuxd.so.1.0.8
  /usr/lib64/libusbmuxd.so.2
  /usr/lib64/pkgconfig
  /usr/lib64/.debug
  /usr/lib64/pkgconfig/libusbmuxd.pc
  /usr/lib64/.debug/libusbmuxd.so.1.0.8
imagemagick-6.8.5: imagemagick: Files/directories were installed but not sh=
ipped
  /usr/lib/ImageMagick-6.8.5
  /usr/lib/ImageMagick-6.8.5/config-Q16
  /usr/lib/ImageMagick-6.8.5/config-Q16/configure.xml
  /usr/share/ImageMagick-6
  /usr/share/ImageMagick-6/locale.xml
  /usr/share/ImageMagick-6/francais.xml
  /usr/share/ImageMagick-6/english.xml
openldap-2.4.23: openldap: Files/directories were installed but not shipped
  /run
networkmanager-0.9.8.0: networkmanager: Files/directories were installed bu=
t not shipped
  /run
  /run/NetworkManager
hiawatha-9.1: hiawatha: Files/directories were installed but not shipped
  /run
oscam-1.10+7974: File '/usr/bin/oscam' from oscam was already stripped, thi=
s will prevent future debugging!
cherokee-1.2.98: cherokee: Files/directories were installed but not shipped
  /run
gdm-2.32.2: gdm: Files/directories were installed but not shipped
  /run
  /run/gdm
  /run/gdm/greeter
nostromo-1.9.5: nostromo: Files/directories were installed but not shipped
  /run
  /run/nostromo
collectd-5.2.2: collectd: Files/directories were installed but not shipped
  /run
lmbench-3.0-a9: lmbench: Files/directories were installed but not shipped
  /run
  /run/lmbench
android-initscripts-1.0: android-initscripts: Files/directories were instal=
led but not shipped
  /android_finish

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--DwoPkXS38qd3dnhB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlG3SpIACgkQN1Ujt2V2gBwCMACdGcE4ILIGslBEN22nP55bivcu
LNAAn2OkBXGoFZy2f3f6paB7FB/oJ8Qd
=kY9I
-----END PGP SIGNATURE-----

--DwoPkXS38qd3dnhB--
