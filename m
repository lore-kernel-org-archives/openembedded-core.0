Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id BEB9C6A613;
	Sat, 22 Jun 2013 18:16:22 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id d49so5103478eek.37
	for <multiple recipients>; Sat, 22 Jun 2013 11:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=yYlqg4B6aWTREmTL4yMXhKyVCbrKl3C7zn+nnQuRAFM=;
	b=bC3lRMWK5G1RD8mNM3fXtu8AVgW7b54neWVeMwtRvt5y8dbEtC0hYpp5mU6fU7WdNi
	2BAM9lce02stScSEEZn0x1sHzN6LzqCsX6sdlWEJLODfllhnAMSbBSwAeLwwPcOVCByt
	kUqKs/DBr9QAFqMEbSARoIWaRd+y+remDQNRnHhqw88JVuFdqTzINPysJL58yZBDQAYB
	pxn0b1EaTKw0zUsnFbAsA1CnM+s/22BIB17O3la7sSZD1Sxmu796rU6XfH7m0qzWVf+7
	7gb/kniq0ay44kaaGT8OuFaMX33G3Xev3khWbIdWgcNYhxdLtMxtUtBajQ4BcShRRlc4
	Cz6A==
X-Received: by 10.14.246.77 with SMTP id p53mr13225836eer.11.1371924982749;
	Sat, 22 Jun 2013 11:16:22 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	i2sm16083083eeu.4.2013.06.22.11.16.21 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 22 Jun 2013 11:16:21 -0700 (PDT)
Date: Sat, 22 Jun 2013 20:16:56 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Message-ID: <20130622181656.GK14021@jama>
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
	<20130427105400.GB3199@jama> <20130502151833.GC3206@jama>
	<20130516075215.GA24809@jama.dyndns-home.com>
	<20130520130635.GA32431@jama> <20130603151008.GC3279@jama>
	<20130611160434.GI3233@jama>
MIME-Version: 1.0
In-Reply-To: <20130611160434.GI3233@jama>
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
X-List-Received-Date: Sat, 22 Jun 2013 18:16:23 -0000
X-Groupsio-MsgNum: 40907
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="W/+CTqSGWdiRg+8j"
Content-Disposition: inline

--W/+CTqSGWdiRg+8j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2013 at 06:04:34PM +0200, Martin Jansa wrote:
> There weren't many (any) changes merged to meta-oe last week, I hope to
> get better builds now (started few minutes ago).
>=20
> qemuarm Summary: 14 tasks failed:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2=
0130610_065148.log/
>=20
> qemux86 Summary: 17 tasks failed:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2=
0130608_071258.log/
>=20
> qemux86-64 Summary: 18 tasks failed:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2=
0130609_081044.log/
>=20
> common:
>   meta-openembedded/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb, do=
_package
>   meta-openembedded/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_=
2.32.1.bb, do_compile
>   openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb, do=
_package
>   meta-openembedded/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.=
bb, do_compile
>   meta-openembedded/meta-oe/recipes-navigation/omgps/omgps_svn.bb, do_com=
pile
>   meta-openembedded/meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb, do_com=
pile
>   meta-openembedded/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb, do_=
compile
>   meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.5.8.bb, do_config=
ure
>   meta-openembedded/meta-networking/recipes-support/ipsec-tools/ipsec-too=
ls_0.7.2.bb, do_compile
>=20
> qemux86 common:
>   meta-openembedded/meta-oe/recipes-support/ode/ode_0.9.bb, do_configure
>   openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package
>   openembedded-core/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.=
21.6.bb, do_compile
>=20
> qemuarm:
>   meta-openembedded/meta-oe/recipes-support/libunwind/libunwind_1.1.bb, d=
o_compile
>   openembedded-core/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb, do_co=
mpile
>   meta-openembedded/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb=
, do_compile
>   openembedded-core/meta/recipes-devtools/qemu/qemu_1.4.1.bb, do_compile
>   meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb,=
 do_compile
>=20
> qemux86:
>   openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb, do_conf=
igure
>   openembedded-core/meta/recipes-devtools/cmake/cmake-native_2.8.11.bb, d=
o_configure
>   meta-openembedded/meta-gnome/recipes-support/goffice/goffice_0.10.1.bb,=
 do_configure
>   openembedded-core/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb, do_co=
mpile
>   meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode=
_2.11.14.bb, do_compile
>=20
> qemux86-64
>   meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
>   meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libimob=
iledevice_1.1.4.bb, do_configure
>   meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_compi=
le
>   openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package
>   meta-openembedded/meta-gnome/recipes-gnome/gnome-session/gnome-session_=
2.32.1.bb, do_compile
>   meta-openembedded/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb=
, do_compile
>   meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb,=
 do_compile
>   openembedded-core/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.=
21.6.bb, do_compile

Last week hero Khem, sent many world fixes, but it seems like some fixes we=
ren't enough
(tk, packagekit are still failing - I hope I haven't missed some other vN)
qemuarm: Summary: 11 tasks failed:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30620_105211.log/

qemux86: Summary: 14 tasks failed:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30621_023143.log/

qemux86_64: Summary: 15 tasks failed:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30621_181258.log/

common (9):
  openembedded-core/meta/recipes-qt/qt4/qt4-embedded_4.8.4.bb, do_compile
  openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb, do_p=
ackage
  meta-openembedded/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb, do_p=
ackage
  meta-openembedded/meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb, do=
_compile
  meta-openembedded/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb=
, do_compile
  meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_compile
  meta-openembedded/meta-gnome/recipes-gnome/eds/evolution-data-server_git.=
bb, do_compile
  meta-openembedded/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb,=
 do_compile
  meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb, d=
o_compile

qemuarm (2):
  openembedded-core/meta/recipes-devtools/qemu/qemu_1.5.0.bb, do_compile
  meta-openembedded/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb, =
do_compile

qemux86* common (4):
  openembedded-core/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21=
=2E9.bb, do_compile
  openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package
  meta-openembedded/meta-oe/recipes-support/ode/ode_0.9.bb, do_configure
  meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_compile

qemux86 (1):
  meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2=
=2E11.14.bb, do_compile

qemux86-64 (2):=20
  meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
  meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libimobil=
edevice_1.1.4.bb, do_configure


pinpoint and cluter-box2d were skipped:
ERROR: Nothing PROVIDES 'clutter-1.8' (but meta-openembedded/meta-oe/recipe=
s-graphics/clutter/clutter-box2d_git.bb, meta-openembedded/meta-gnome/recip=
es-apps/pinpoint/pinpoint_git.bb DEPENDS on or otherwise requires it)
ERROR: Nothing PROVIDES 'clutter-gst-1.8' (but meta-openembedded/meta-gnome=
/recipes-apps/pinpoint/pinpoint_git.bb DEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'clutter-box2d-dev' (but meta-openembedded/meta-oe=
/recipes-graphics/clutter/clutter-box2d_git.bb RDEPENDS on or otherwise req=
uires it)
ERROR: No eligible RPROVIDERs exist for 'clutter-box2d-dev'
NOTE: Runtime target 'clutter-box2d-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['clutter-box2d-dev']
ERROR: Nothing RPROVIDES 'clutter-box2d' (but meta-openembedded/meta-oe/rec=
ipes-graphics/clutter/clutter-box2d_git.bb RDEPENDS on or otherwise require=
s it)
ERROR: No eligible RPROVIDERs exist for 'clutter-box2d'
NOTE: Runtime target 'clutter-box2d' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['clutter-box2d']
NOTE: multiple providers are available for runtime e-wm-sysactions (e-wm, e=
-wm-sysactions-shr)
NOTE: consider defining a PREFERRED_PROVIDER entry to match e-wm-sysactions
ERROR: Nothing RPROVIDES 'pinpoint-dev' (but meta-openembedded/meta-gnome/r=
ecipes-apps/pinpoint/pinpoint_git.bb RDEPENDS on or otherwise requires it)
ERROR: No eligible RPROVIDERs exist for 'pinpoint-dev'
NOTE: Runtime target 'pinpoint-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['pinpoint-dev']
ERROR: Nothing RPROVIDES 'pinpoint' (but meta-openembedded/meta-gnome/recip=
es-apps/pinpoint/pinpoint_git.bb RDEPENDS on or otherwise requires it)
ERROR: No eligible RPROVIDERs exist for 'pinpoint'
NOTE: Runtime target 'pinpoint' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['pinpoint']

QA issues:
samba-3.6.8: Fixup Perms: Unable to correct directory link, target already =
exists: /var/run -> /run
samba-3.6.8: samba: Files/directories were installed but not shipped
  /run
  /run/lock
libav-0.8.4+gitAUTOINC+2c8ce46250: ELF binary '/home/jenkins/oe/shr-core-br=
anches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libav/0.8.4+gitAUT=
OINC+2c8ce46250-r8.0/packages-split/libswscale/usr/lib/libswscale.so.2.1.0'=
 has relocations in .text
libav-0.8.4+gitAUTOINC+2c8ce46250: ELF binary '/home/jenkins/oe/shr-core-br=
anches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libav/0.8.4+gitAUT=
OINC+2c8ce46250-r8.0/packages-split/libpostproc/usr/lib/libpostproc.so.52.0=
=2E0' has relocations in .text
libav-0.8.4+gitAUTOINC+2c8ce46250: ELF binary '/home/jenkins/oe/shr-core-br=
anches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libav/0.8.4+gitAUT=
OINC+2c8ce46250-r8.0/packages-split/libavutil/usr/lib/libavutil.so.51.22.1'=
 has relocations in .text
libav-0.8.4+gitAUTOINC+2c8ce46250: ELF binary '/home/jenkins/oe/shr-core-br=
anches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libav/0.8.4+gitAUT=
OINC+2c8ce46250-r8.0/packages-split/libavformat/usr/lib/libavformat.so.53.2=
1.0' has relocations in .text
libav-0.8.4+gitAUTOINC+2c8ce46250: ELF binary '/home/jenkins/oe/shr-core-br=
anches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libav/0.8.4+gitAUT=
OINC+2c8ce46250-r8.0/packages-split/libavfilter/usr/lib/libavfilter.so.2.15=
=2E0' has relocations in .text
libav-0.8.4+gitAUTOINC+2c8ce46250: ELF binary '/home/jenkins/oe/shr-core-br=
anches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libav/0.8.4+gitAUT=
OINC+2c8ce46250-r8.0/packages-split/libavdevice/usr/lib/libavdevice.so.53.2=
=2E0' has relocations in .text
libav-0.8.4+gitAUTOINC+2c8ce46250: ELF binary '/home/jenkins/oe/shr-core-br=
anches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libav/0.8.4+gitAUT=
OINC+2c8ce46250-r8.0/packages-split/libavcodec/usr/lib/libavcodec.so.53.35.=
0' has relocations in .text
qwt-6.0.1: File '/usr/lib/libqwt.so.6.0.1' from qwt was already stripped, t=
his will prevent future debugging!
qwt-6.0.1: File '/usr/lib/libqwtmathml.so.6.0.1' from qwt was already strip=
ped, this will prevent future debugging!
qwt-6.0.1: File '/usr/plugins/designer/libqwt_designer_plugin.so' from qwt =
was already stripped, this will prevent future debugging!
base-files-3.0.14: Fixup Perms: Unable to correct directory link, target al=
ready exists: /var/log -> /var/volatile/log
base-files-3.0.14: Fixup Perms: Unable to correct directory link, target al=
ready exists: /var/run -> /run
base-files-3.0.14: Fixup Perms: Unable to correct directory link, target al=
ready exists: /var/tmp -> /var/volatile/tmp
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
oscam-1.10+7974: File '/usr/bin/oscam' from oscam was already stripped, thi=
s will prevent future debugging!
cherokee-1.2.98: cherokee: Files/directories were installed but not shipped
  /run
gstreamer1.0-libav-1.0.7: ELF binary '/home/jenkins/oe/shr-core-branches/sh=
r-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gstreamer1.0-libav/1.0.7-r1=
/packages-split/gstreamer1.0-libav/usr/lib/gstreamer-1.0/libgstlibav.so' ha=
s relocations in .text
gdm-2.32.2: gdm: Files/directories were installed but not shipped
  /run
  /run/gdm
  /run/gdm/greeter
collectd-5.2.2: collectd: Files/directories were installed but not shipped
  /run
libpostproc-0.0.0+gitAUTOINC+3b7053f46d: ELF binary '/home/jenkins/oe/shr-c=
ore-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libpostproc/=
0.0.0+gitAUTOINC+3b7053f46d-r1/packages-split/libpostproc/usr/lib/libpostpr=
oc.so.52.0.100' has relocations in .text
tracker-0.14.2: tracker: Files/directories were installed but not shipped
  /usr/lib/tracker-0.14/writeback-modules/libwriteback-taglib.la
  /usr/lib/tracker-0.14/writeback-modules/libwriteback-taglib.so
nostromo-1.9.5: nostromo: Files/directories were installed but not shipped
  /run
  /run/nostromo

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--W/+CTqSGWdiRg+8j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHF6hgACgkQN1Ujt2V2gBw2xACfeGRKxJ96UD79uDezbEFjtyaC
dzIAoLOgcwlO6QFGlPpwM/oA4+NfCJEN
=FBtT
-----END PGP SIGNATURE-----

--W/+CTqSGWdiRg+8j--
