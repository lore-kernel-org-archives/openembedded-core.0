Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f172.google.com (mail-ea0-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 10AD96B254;
	Thu, 25 Jul 2013 16:23:17 +0000 (UTC)
Received: by mail-ea0-f172.google.com with SMTP id q10so1061775eaj.3
	for <multiple recipients>; Thu, 25 Jul 2013 09:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8hn3J3eROTnNxVG9IaHHeFWWX8O3Vrg+eI/ActsDX5E=;
	b=MIq4hpvvdlMehIp13+WsSm0+F+eM8B/WMEC+wqCb5JrC71/Pzxo3woPfK91eoFKVoL
	p4eZaADl7vPHe4sBVGn5LXP12XgiHEnLmQRS5Ta64FUxjr+Qwg/+IWRKMqNckO2E8tN9
	2j1sF2ju9fBHXf70SZfr8KQqq6Zd5O1rb51e8W56AsEFJX8CXXoaKp34ySV1ZTbkiHpm
	6BMO2Abxu9QFvPmrKczDb9W0DkQ7B7l/JQ/wjjsuqCEYChz56gl2yAtyXPR4EXtMdNgj
	Rxwe3x1KpP2eZYeS6pL0WqIkKkgvBIsY7EErpzp3GH3kCTMYNJlkIP08vOca0aOs6RhT
	bf4g==
X-Received: by 10.15.10.8 with SMTP id f8mr43636221eet.110.1374769397900;
	Thu, 25 Jul 2013 09:23:17 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n5sm74719317eed.9.2013.07.25.09.23.16 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 25 Jul 2013 09:23:17 -0700 (PDT)
Date: Thu, 25 Jul 2013 18:23:41 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Message-ID: <20130725162341.GA3280@jama>
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
	<20130427105400.GB3199@jama> <20130502151833.GC3206@jama>
	<20130516075215.GA24809@jama.dyndns-home.com>
	<20130520130635.GA32431@jama> <20130603151008.GC3279@jama>
	<20130611160434.GI3233@jama> <20130622181656.GK14021@jama>
MIME-Version: 1.0
In-Reply-To: <20130622181656.GK14021@jama>
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
X-List-Received-Date: Thu, 25 Jul 2013 16:23:19 -0000
X-Groupsio-MsgNum: 42458
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Content-Disposition: inline

--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 22, 2013 at 08:16:56PM +0200, Martin Jansa wrote:
> On Tue, Jun 11, 2013 at 06:04:34PM +0200, Martin Jansa wrote:
> Last week hero Khem, sent many world fixes, but it seems like some fixes =
weren't enough
> (tk, packagekit are still failing - I hope I haven't missed some other vN)
> qemuarm: Summary: 11 tasks failed:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2=
0130620_105211.log/
>=20
> qemux86: Summary: 14 tasks failed:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2=
0130621_023143.log/
>=20
> qemux86_64: Summary: 15 tasks failed:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2=
0130621_181258.log/
>=20
> common (9):
>   openembedded-core/meta/recipes-qt/qt4/qt4-embedded_4.8.4.bb, do_compile
>   openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb, do=
_package
>   meta-openembedded/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb, do=
_package
>   meta-openembedded/meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb, =
do_compile
>   meta-openembedded/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.=
bb, do_compile
>   meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_compile
>   meta-openembedded/meta-gnome/recipes-gnome/eds/evolution-data-server_gi=
t.bb, do_compile
>   meta-openembedded/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.b=
b, do_compile
>   meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb,=
 do_compile
>=20
> qemuarm (2):
>   openembedded-core/meta/recipes-devtools/qemu/qemu_1.5.0.bb, do_compile
>   meta-openembedded/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb=
, do_compile
>=20
> qemux86* common (4):
>   openembedded-core/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.=
21.9.bb, do_compile
>   openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package
>   meta-openembedded/meta-oe/recipes-support/ode/ode_0.9.bb, do_configure
>   meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_compi=
le
>=20
> qemux86 (1):
>   meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode=
_2.11.14.bb, do_compile
>=20
> qemux86-64 (2):=20
>   meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
>   meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libimob=
iledevice_1.1.4.bb, do_configure

This time only qemuarm build:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30724_125425.log/

Summary: 8 tasks failed
  openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb, do_p=
ackage
  meta-openembedded/meta-gnome/recipes-gnome/eds/evolution-data-server_git.=
bb, do_compile
  meta-openembedded/meta-oe/recipes-navigation/monav/monav_0.3.bb, do_compi=
le
  meta-openembedded/meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb, do=
_compile
  meta-openembedded/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.0.bb, do_c=
ompile
  meta-openembedded/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb,=
 do_compile
  meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_compile
  meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb, d=
o_compile

182 Warnings about multiple shlibs providers:
WARNING: gtk-immodule-am-et-2.24.18 is already registered as shlib provider=
 for im-am-et.so, ignoring gtk3-immodule-am-et-3.8.2 trying to register the=
 same
WARNING: gtk-immodule-cedilla-2.24.18 is already registered as shlib provid=
er for im-cedilla.so, ignoring gtk3-immodule-cedilla-3.8.2 trying to regist=
er the same
WARNING: gtk-immodule-cyrillic-translit-2.24.18 is already registered as sh=
lib provider for im-cyrillic-translit.so, ignoring gtk3-immodule-cyrillic-t=
ranslit-3.8.2 trying to register the same
WARNING: gtk-immodule-inuktitut-2.24.18 is already registered as shlib prov=
ider for im-inuktitut.so, ignoring gtk3-immodule-inuktitut-3.8.2 trying to =
register the same
WARNING: gtk-immodule-ipa-2.24.18 is already registered as shlib provider f=
or im-ipa.so, ignoring gtk3-immodule-ipa-3.8.2 trying to register the same
WARNING: gtk-immodule-multipress-2.24.18 is already registered as shlib pro=
vider for im-multipress.so, ignoring gtk3-immodule-multipress-3.8.2 trying =
to register the same
WARNING: gtk-immodule-thai-2.24.18 is already registered as shlib provider =
for im-thai.so, ignoring gtk3-immodule-thai-3.8.2 trying to register the sa=
me
WARNING: gtk-immodule-ti-er-2.24.18 is already registered as shlib provider=
 for im-ti-er.so, ignoring gtk3-immodule-ti-er-3.8.2 trying to register the=
 same
WARNING: gtk-immodule-ti-et-2.24.18 is already registered as shlib provider=
 for im-ti-et.so, ignoring gtk3-immodule-ti-et-3.8.2 trying to register the=
 same
WARNING: gtk-immodule-viqr-2.24.18 is already registered as shlib provider =
for im-viqr.so, ignoring gtk3-immodule-viqr-3.8.2 trying to register the sa=
me
WARNING: gtk-immodule-xim-2.24.18 is already registered as shlib provider f=
or im-xim.so, ignoring gtk3-immodule-xim-3.8.2 trying to register the same
WARNING: gtk-printbackend-file-2.24.18 is already registered as shlib provi=
der for libprintbackend-file.so, ignoring gtk3-printbackend-file-3.8.2 tryi=
ng to register the same
WARNING: gtk-printbackend-lpr-2.24.18 is already registered as shlib provid=
er for libprintbackend-lpr.so, ignoring gtk3-printbackend-lpr-3.8.2 trying =
to register the same
WARNING: gstreamer-0.10.36 is already registered as shlib provider for libg=
stcoreelements.so, ignoring gstreamer1.0-1.0.7 trying to register the same
WARNING: xfce4-panel-plugin-showdesktop-4.10.1 is already registered as shl=
ib provider for libshowdesktop.so, ignoring matchbox-panel-2-2.0+git3+26a3a=
67b41 trying to register the same
WARNING: xfce4-panel-plugin-systray-4.10.1 is already registered as shlib p=
rovider for libsystray.so, ignoring matchbox-panel-2-2.0+git3+26a3a67b41 tr=
ying to register the same
WARNING: xfce4-panel-plugin-launcher-4.10.1 is already registered as shlib =
provider for liblauncher.so, ignoring matchbox-panel-2-2.0+git3+26a3a67b41 =
trying to register the same
WARNING: xfce4-panel-plugin-clock-4.10.1 is already registered as shlib pro=
vider for libclock.so, ignoring matchbox-panel-2-2.0+git3+26a3a67b41 trying=
 to register the same
WARNING: gst-plugins-base-adder-0.10.36 is already registered as shlib prov=
ider for libgstadder.so, ignoring gstreamer1.0-plugins-base-adder-1.0.7 try=
ing to register the same
WARNING: gst-plugins-base-alsa-0.10.36 is already registered as shlib provi=
der for libgstalsa.so, ignoring gstreamer1.0-plugins-base-alsa-1.0.7 trying=
 to register the same
WARNING: gst-plugins-base-app-0.10.36 is already registered as shlib provid=
er for libgstapp.so, ignoring gstreamer1.0-plugins-base-app-1.0.7 trying to=
 register the same
WARNING: gst-plugins-base-audioconvert-0.10.36 is already registered as shl=
ib provider for libgstaudioconvert.so, ignoring gstreamer1.0-plugins-base-a=
udioconvert-1.0.7 trying to register the same
WARNING: gst-plugins-base-audiorate-0.10.36 is already registered as shlib =
provider for libgstaudiorate.so, ignoring gstreamer1.0-plugins-base-audiora=
te-1.0.7 trying to register the same
WARNING: gst-plugins-base-audioresample-0.10.36 is already registered as sh=
lib provider for libgstaudioresample.so, ignoring gstreamer1.0-plugins-base=
-audioresample-1.0.7 trying to register the same
WARNING: gst-plugins-base-audiotestsrc-0.10.36 is already registered as shl=
ib provider for libgstaudiotestsrc.so, ignoring gstreamer1.0-plugins-base-a=
udiotestsrc-1.0.7 trying to register the same
WARNING: gst-plugins-base-encodebin-0.10.36 is already registered as shlib =
provider for libgstencodebin.so, ignoring gstreamer1.0-plugins-base-encodeb=
in-1.0.7 trying to register the same
WARNING: gst-plugins-base-gio-0.10.36 is already registered as shlib provid=
er for libgstgio.so, ignoring gstreamer1.0-plugins-base-gio-1.0.7 trying to=
 register the same
WARNING: gst-plugins-base-ivorbisdec-0.10.36 is already registered as shlib=
 provider for libgstivorbisdec.so, ignoring gstreamer1.0-plugins-base-ivorb=
isdec-1.0.7 trying to register the same
WARNING: gst-plugins-base-ogg-0.10.36 is already registered as shlib provid=
er for libgstogg.so, ignoring gstreamer1.0-plugins-base-ogg-1.0.7 trying to=
 register the same
WARNING: gst-plugins-base-subparse-0.10.36 is already registered as shlib p=
rovider for libgstsubparse.so, ignoring gstreamer1.0-plugins-base-subparse-=
1.0.7 trying to register the same
WARNING: gst-plugins-base-tcp-0.10.36 is already registered as shlib provid=
er for libgsttcp.so, ignoring gstreamer1.0-plugins-base-tcp-1.0.7 trying to=
 register the same
WARNING: gst-plugins-base-theora-0.10.36 is already registered as shlib pro=
vider for libgsttheora.so, ignoring gstreamer1.0-plugins-base-theora-1.0.7 =
trying to register the same
WARNING: gst-plugins-base-typefindfunctions-0.10.36 is already registered a=
s shlib provider for libgsttypefindfunctions.so, ignoring gstreamer1.0-plug=
ins-base-typefindfunctions-1.0.7 trying to register the same
WARNING: gst-plugins-base-videorate-0.10.36 is already registered as shlib =
provider for libgstvideorate.so, ignoring gstreamer1.0-plugins-base-videora=
te-1.0.7 trying to register the same
WARNING: gst-plugins-base-videoscale-0.10.36 is already registered as shlib=
 provider for libgstvideoscale.so, ignoring gstreamer1.0-plugins-base-video=
scale-1.0.7 trying to register the same
WARNING: gst-plugins-base-videotestsrc-0.10.36 is already registered as shl=
ib provider for libgstvideotestsrc.so, ignoring gstreamer1.0-plugins-base-v=
ideotestsrc-1.0.7 trying to register the same
WARNING: gst-plugins-base-volume-0.10.36 is already registered as shlib pro=
vider for libgstvolume.so, ignoring gstreamer1.0-plugins-base-volume-1.0.7 =
trying to register the same
WARNING: gst-plugins-base-vorbis-0.10.36 is already registered as shlib pro=
vider for libgstvorbis.so, ignoring gstreamer1.0-plugins-base-vorbis-1.0.7 =
trying to register the same
WARNING: gst-plugins-base-ximagesink-0.10.36 is already registered as shlib=
 provider for libgstximagesink.so, ignoring gstreamer1.0-plugins-base-ximag=
esink-1.0.7 trying to register the same
WARNING: gst-plugins-base-xvimagesink-0.10.36 is already registered as shli=
b provider for libgstxvimagesink.so, ignoring gstreamer1.0-plugins-base-xvi=
magesink-1.0.7 trying to register the same
WARNING: firefox-10.0.11esr is already registered as shlib provider for lib=
nss3.so, ignoring nss-3.13.3 trying to register the same
WARNING: firefox-10.0.11esr is already registered as shlib provider for lib=
freebl3.so, ignoring nss-3.13.3 trying to register the same
WARNING: firefox-10.0.11esr is already registered as shlib provider for lib=
nssckbi.so, ignoring nss-3.13.3 trying to register the same
WARNING: firefox-10.0.11esr is already registered as shlib provider for lib=
smime3.so, ignoring nss-3.13.3 trying to register the same
WARNING: firefox-10.0.11esr is already registered as shlib provider for lib=
nssutil3.so, ignoring nss-3.13.3 trying to register the same
WARNING: firefox-10.0.11esr is already registered as shlib provider for lib=
nssdbm3.so, ignoring nss-3.13.3 trying to register the same
WARNING: firefox-10.0.11esr is already registered as shlib provider for lib=
ssl3.so, ignoring nss-3.13.3 trying to register the same
WARNING: firefox-10.0.11esr is already registered as shlib provider for lib=
softokn3.so, ignoring nss-3.13.3 trying to register the same
WARNING: imlib2-loaders-1.4.5+svnr82070 is already registered as shlib prov=
ider for png.so, ignoring lightmediascanner-0.4.4 trying to register the sa=
me
WARNING: imlib2-loaders-1.4.5+svnr82070 is already registered as shlib prov=
ider for id3.so, ignoring lightmediascanner-0.4.4 trying to register the sa=
me
WARNING: imlib2-loaders-1.4.5+svnr82070 is already registered as shlib prov=
ider for jpeg.so, ignoring lightmediascanner-0.4.4 trying to register the s=
ame
WARNING: python-gst-0.10.22 is already registered as shlib provider for aud=
io.so, ignoring fsodeviced-0.12.0 trying to register the same
WARNING: fsoaudiod-0.12.0 is already registered as shlib provider for route=
r_alsa.so, ignoring fsodeviced-0.12.0 trying to register the same
WARNING: fsousaged-0.12.0 is already registered as shlib provider for lowle=
vel_openmoko.so, ignoring fsogsmd-module-lowlevel-openmoko-0.12.0 trying to=
 register the same
WARNING: fsousaged-0.12.0 is already registered as shlib provider for dbus_=
service.so, ignoring fsogsmd-0.12.0 trying to register the same
WARNING: gtk-xfce-engine-3.0.1 is already registered as shlib provider for =
libxfce.so, ignoring gtk3-xfce-engine-3.0.1 trying to register the same
WARNING: xfce4-session-4.10.1 is already registered as shlib provider for l=
ibsimple.so, ignoring libpurple-protocol-simple-2.7.9 trying to register th=
e same
WARNING: apache2-2.4.4 is already registered as shlib provider for mod_alia=
s.so, ignoring lighttpd-module-alias-1.4.32 trying to register the same
WARNING: apache2-2.4.4 is already registered as shlib provider for mod_prox=
y.so, ignoring lighttpd-module-proxy-1.4.32 trying to register the same
WARNING: apache2-2.4.4 is already registered as shlib provider for mod_rewr=
ite.so, ignoring lighttpd-module-rewrite-1.4.32 trying to register the same
WARNING: apache2-2.4.4 is already registered as shlib provider for mod_stat=
us.so, ignoring lighttpd-module-status-1.4.32 trying to register the same
WARNING: apache2-2.4.4 is already registered as shlib provider for mod_user=
dir.so, ignoring lighttpd-module-userdir-1.4.32 trying to register the same
WARNING: matchbox-keyboard-applet-0.0+git1+b38f24036c is already registered=
 as shlib provider for libkeyboard.so, ignoring gnome-settings-daemon-2.32.=
1 trying to register the same
WARNING: gnome-vfs-plugin-http-2.24.4 is already registered as shlib provid=
er for libhttp.so, ignoring qmmp-plugin-transports-http-0.6.6 trying to reg=
ister the same
WARNING: imlib2-loaders-1.4.5+svnr82070 is already registered as shlib prov=
ider for bmp.so, ignoring abiword-plugin-bmp-2.8.6 trying to register the s=
ame
WARNING: matchbox-panel-2-2.0+git3+26a3a67b41 is already registered as shli=
b provider for libbattery.so, ignoring xfce4-battery-plugin-1.0.5 trying to=
 register the same
WARNING: libgphoto2-camlibs-2.4.11 is already registered as shlib provider =
for disk.so, ignoring libfreerdp-plugin-disk-gitr1+f311acaffb trying to reg=
ister the same
WARNING: systemd-204 is already registered as shlib provider for libnss_myh=
ostname.so.2, ignoring nss-myhostname-0.3 trying to register the same
WARNING: gst-plugins-bad-adpcmdec-0.10.23 is already registered as shlib pr=
ovider for libgstadpcmdec.so, ignoring gstreamer1.0-plugins-bad-adpcmdec-1.=
0.7 trying to register the same
WARNING: gst-plugins-bad-adpcmenc-0.10.23 is already registered as shlib pr=
ovider for libgstadpcmenc.so, ignoring gstreamer1.0-plugins-bad-adpcmenc-1.=
0.7 trying to register the same
WARNING: gst-plugins-bad-asfmux-0.10.23 is already registered as shlib prov=
ider for libgstasfmux.so, ignoring gstreamer1.0-plugins-bad-asfmux-1.0.7 tr=
ying to register the same
WARNING: gst-plugins-bad-audiovisualizers-0.10.23 is already registered as =
shlib provider for libgstaudiovisualizers.so, ignoring gstreamer1.0-plugins=
-bad-audiovisualizers-1.0.7 trying to register the same
WARNING: gst-plugins-bad-autoconvert-0.10.23 is already registered as shlib=
 provider for libgstautoconvert.so, ignoring gstreamer1.0-plugins-bad-autoc=
onvert-1.0.7 trying to register the same
WARNING: gst-plugins-bad-bayer-0.10.23 is already registered as shlib provi=
der for libgstbayer.so, ignoring gstreamer1.0-plugins-bad-bayer-1.0.7 tryin=
g to register the same
WARNING: gst-plugins-bad-bz2-0.10.23 is already registered as shlib provide=
r for libgstbz2.so, ignoring gstreamer1.0-plugins-bad-bz2-1.0.7 trying to r=
egister the same
WARNING: gst-plugins-bad-camerabin2-0.10.23 is already registered as shlib =
provider for libgstcamerabin2.so, ignoring gstreamer1.0-plugins-bad-camerab=
in2-1.0.7 trying to register the same
WARNING: gst-plugins-bad-coloreffects-0.10.23 is already registered as shli=
b provider for libgstcoloreffects.so, ignoring gstreamer1.0-plugins-bad-col=
oreffects-1.0.7 trying to register the same
WARNING: gst-plugins-bad-curl-0.10.23 is already registered as shlib provid=
er for libgstcurl.so, ignoring gstreamer1.0-plugins-bad-curl-1.0.7 trying t=
o register the same
WARNING: gst-plugins-bad-dataurisrc-0.10.23 is already registered as shlib =
provider for libgstdataurisrc.so, ignoring gstreamer1.0-plugins-bad-datauri=
src-1.0.7 trying to register the same
WARNING: gst-plugins-bad-debugutilsbad-0.10.23 is already registered as shl=
ib provider for libgstdebugutilsbad.so, ignoring gstreamer1.0-plugins-bad-d=
ebugutilsbad-1.0.7 trying to register the same
WARNING: gst-plugins-bad-dtmf-0.10.23 is already registered as shlib provid=
er for libgstdtmf.so, ignoring gstreamer1.0-plugins-bad-dtmf-1.0.7 trying t=
o register the same
WARNING: gst-plugins-bad-dvb-0.10.23 is already registered as shlib provide=
r for libgstdvb.so, ignoring gstreamer1.0-plugins-bad-dvb-1.0.7 trying to r=
egister the same
WARNING: gst-plugins-bad-dvbsuboverlay-0.10.23 is already registered as shl=
ib provider for libgstdvbsuboverlay.so, ignoring gstreamer1.0-plugins-bad-d=
vbsuboverlay-1.0.7 trying to register the same
WARNING: gst-plugins-bad-dvdspu-0.10.23 is already registered as shlib prov=
ider for libgstdvdspu.so, ignoring gstreamer1.0-plugins-bad-dvdspu-1.0.7 tr=
ying to register the same
WARNING: gst-plugins-bad-festival-0.10.23 is already registered as shlib pr=
ovider for libgstfestival.so, ignoring gstreamer1.0-plugins-bad-festival-1.=
0.7 trying to register the same
WARNING: gst-plugins-bad-fieldanalysis-0.10.23 is already registered as shl=
ib provider for libgstfieldanalysis.so, ignoring gstreamer1.0-plugins-bad-f=
ieldanalysis-1.0.7 trying to register the same
WARNING: gst-plugins-bad-fragmented-0.10.23 is already registered as shlib =
provider for libgstfragmented.so, ignoring gstreamer1.0-plugins-bad-fragmen=
ted-1.0.7 trying to register the same
WARNING: gst-plugins-bad-frei0r-0.10.23 is already registered as shlib prov=
ider for libgstfrei0r.so, ignoring gstreamer1.0-plugins-bad-frei0r-1.0.7 tr=
ying to register the same
WARNING: gst-plugins-bad-gaudieffects-0.10.23 is already registered as shli=
b provider for libgstgaudieffects.so, ignoring gstreamer1.0-plugins-bad-gau=
dieffects-1.0.7 trying to register the same
WARNING: gst-plugins-base-gdp-0.10.36 is already registered as shlib provid=
er for libgstgdp.so, ignoring gstreamer1.0-plugins-bad-gdp-1.0.7 trying to =
register the same
WARNING: gst-plugins-bad-geometrictransform-0.10.23 is already registered a=
s shlib provider for libgstgeometrictransform.so, ignoring gstreamer1.0-plu=
gins-bad-geometrictransform-1.0.7 trying to register the same
WARNING: gst-plugins-bad-id3tag-0.10.23 is already registered as shlib prov=
ider for libgstid3tag.so, ignoring gstreamer1.0-plugins-bad-id3tag-1.0.7 tr=
ying to register the same
WARNING: gst-plugins-bad-inter-0.10.23 is already registered as shlib provi=
der for libgstinter.so, ignoring gstreamer1.0-plugins-bad-inter-1.0.7 tryin=
g to register the same
WARNING: gst-plugins-bad-interlace-0.10.23 is already registered as shlib p=
rovider for libgstinterlace.so, ignoring gstreamer1.0-plugins-bad-interlace=
-1.0.7 trying to register the same
WARNING: gst-plugins-bad-jpegformat-0.10.23 is already registered as shlib =
provider for libgstjpegformat.so, ignoring gstreamer1.0-plugins-bad-jpegfor=
mat-1.0.7 trying to register the same
WARNING: gst-plugins-bad-liveadder-0.10.23 is already registered as shlib p=
rovider for libgstliveadder.so, ignoring gstreamer1.0-plugins-bad-liveadder=
-1.0.7 trying to register the same
WARNING: gst-plugins-bad-mpegpsmux-0.10.23 is already registered as shlib p=
rovider for libgstmpegpsmux.so, ignoring gstreamer1.0-plugins-bad-mpegpsmux=
-1.0.7 trying to register the same
WARNING: gst-plugins-bad-mpegtsdemux-0.10.23 is already registered as shlib=
 provider for libgstmpegtsdemux.so, ignoring gstreamer1.0-plugins-bad-mpegt=
sdemux-1.0.7 trying to register the same
WARNING: gst-plugins-bad-mpegtsmux-0.10.23 is already registered as shlib p=
rovider for libgstmpegtsmux.so, ignoring gstreamer1.0-plugins-bad-mpegtsmux=
-1.0.7 trying to register the same
WARNING: gst-plugins-bad-pcapparse-0.10.23 is already registered as shlib p=
rovider for libgstpcapparse.so, ignoring gstreamer1.0-plugins-bad-pcapparse=
-1.0.7 trying to register the same
WARNING: gst-plugins-bad-pnm-0.10.23 is already registered as shlib provide=
r for libgstpnm.so, ignoring gstreamer1.0-plugins-bad-pnm-1.0.7 trying to r=
egister the same
WARNING: gst-plugins-bad-rawparse-0.10.23 is already registered as shlib pr=
ovider for libgstrawparse.so, ignoring gstreamer1.0-plugins-bad-rawparse-1.=
0.7 trying to register the same
WARNING: gst-plugins-bad-removesilence-0.10.23 is already registered as shl=
ib provider for libgstremovesilence.so, ignoring gstreamer1.0-plugins-bad-r=
emovesilence-1.0.7 trying to register the same
WARNING: gst-plugins-bad-rtpmux-0.10.23 is already registered as shlib prov=
ider for libgstrtpmux.so, ignoring gstreamer1.0-plugins-bad-rtpmux-1.0.7 tr=
ying to register the same
WARNING: gst-plugins-bad-rtpvp8-0.10.23 is already registered as shlib prov=
ider for libgstrtpvp8.so, ignoring gstreamer1.0-plugins-bad-rtpvp8-1.0.7 tr=
ying to register the same
WARNING: gst-plugins-bad-scaletempoplugin-0.10.23 is already registered as =
shlib provider for libgstscaletempoplugin.so, ignoring gstreamer1.0-plugins=
-bad-scaletempoplugin-1.0.7 trying to register the same
WARNING: gst-plugins-bad-sdpelem-0.10.23 is already registered as shlib pro=
vider for libgstsdpelem.so, ignoring gstreamer1.0-plugins-bad-sdpelem-1.0.7=
 trying to register the same
WARNING: gst-plugins-bad-segmentclip-0.10.23 is already registered as shlib=
 provider for libgstsegmentclip.so, ignoring gstreamer1.0-plugins-bad-segme=
ntclip-1.0.7 trying to register the same
WARNING: gst-plugins-bad-shm-0.10.23 is already registered as shlib provide=
r for libgstshm.so, ignoring gstreamer1.0-plugins-bad-shm-1.0.7 trying to r=
egister the same
WARNING: gst-plugins-bad-siren-0.10.23 is already registered as shlib provi=
der for libgstsiren.so, ignoring gstreamer1.0-plugins-bad-siren-1.0.7 tryin=
g to register the same
WARNING: gst-plugins-bad-smooth-0.10.23 is already registered as shlib prov=
ider for libgstsmooth.so, ignoring gstreamer1.0-plugins-bad-smooth-1.0.7 tr=
ying to register the same
WARNING: gst-plugins-bad-speed-0.10.23 is already registered as shlib provi=
der for libgstspeed.so, ignoring gstreamer1.0-plugins-bad-speed-1.0.7 tryin=
g to register the same
WARNING: gst-plugins-bad-subenc-0.10.23 is already registered as shlib prov=
ider for libgstsubenc.so, ignoring gstreamer1.0-plugins-bad-subenc-1.0.7 tr=
ying to register the same
WARNING: gst-plugins-bad-videoparsersbad-0.10.23 is already registered as s=
hlib provider for libgstvideoparsersbad.so, ignoring gstreamer1.0-plugins-b=
ad-videoparsersbad-1.0.7 trying to register the same
WARNING: gst-plugins-bad-y4mdec-0.10.23 is already registered as shlib prov=
ider for libgsty4mdec.so, ignoring gstreamer1.0-plugins-bad-y4mdec-1.0.7 tr=
ying to register the same
WARNING: gst-plugins-good-alaw-0.10.31 is already registered as shlib provi=
der for libgstalaw.so, ignoring gstreamer1.0-plugins-good-alaw-1.0.7 trying=
 to register the same
WARNING: gst-plugins-good-alpha-0.10.31 is already registered as shlib prov=
ider for libgstalpha.so, ignoring gstreamer1.0-plugins-good-alpha-1.0.7 try=
ing to register the same
WARNING: gst-plugins-good-alphacolor-0.10.31 is already registered as shlib=
 provider for libgstalphacolor.so, ignoring gstreamer1.0-plugins-good-alpha=
color-1.0.7 trying to register the same
WARNING: gst-plugins-good-apetag-0.10.31 is already registered as shlib pro=
vider for libgstapetag.so, ignoring gstreamer1.0-plugins-good-apetag-10.31 =
is already registered as shlib provider for libgstavi.so, ignoring gstreame=
r1.0-plugins-good-avi-1.0.7 trying to register the same
WARNING: gst-plugins-good-cairo-0.10.31 is already registered as shlib prov=
ider for libgstcairo.so, ignoring gstreamer1.0-plugins-good-cairo-1.0.7 try=
ing to register the same
WARNING: gst-plugins-good-cutter-0.10.31 is already registered as shlib pro=
vider for libgstcutter.so, ignoring gstreamer1.0-plugins-good-cutter-1.0.7 =
trying to register the same
WARNING: gst-plugins-good-debug-0.10.31 is already registered as shlib prov=
ider for libgstdebug.so, ignoring gstreamer1.0-plugins-good-debug-1.0.7 try=
ing to register the same
WARNING: gst-plugins-good-deinterlace-0.10.31 is already registered as shli=
b provider for libgstdeinterlace.so, ignoring gstreamer1.0-plugins-good-dei=
nterlace-1.0.7 trying to register the same
WARNING: gst-plugins-good-effectv-0.10.31 is already registered as shlib pr=
ovider for libgsteffectv.so, ignoring gstreamer1.0-plugins-good-effectv-1.0=
=2E7 trying to register the same
WARNING: gst-plugins-good-equalizer-0.10.31 is already registered as shlib =
provider for libgstequalizer.so, ignoring gstreamer1.0-plugins-good-equaliz=
er-1.0.7 trying to register the same
WARNING: gst-plugins-good-flac-0.10.31 is already registered as shlib provi=
der for libgstflac.so, ignoring gstreamer1.0-plugins-good-flac-1.0.7 trying=
 to register the same
WARNING: gst-plugins-good-flv-0.10.31 is already registered as shlib provid=
er for libgstflv.so, ignoring gstreamer1.0-plugins-good-flv-1.0.7 trying to=
 register the same
WARNING: gst-plugins-good-flxdec-0.10.31 is already registered as shlib pro=
vider for libgstflxdec.so, ignoring gstreamer1.0-plugins-good-flxdec-1.0.7 =
trying to register the same
WARNING: gst-plugins-good-goom-0.10.31 is already registered as shlib provi=
der for libgstgoom.so, ignoring gstreamer1.0-plugins-good-goom-1.0.7 trying=
 to register the same
WARNING: gst-plugins-good-goom2k1-0.10.31 is already registered as shlib pr=
ovider for libgstgoom2k1.so, ignoring gstreamer1.0-plugins-good-goom2k1-1.0=
=2E7 trying to register the same
WARNING: gst-plugins-good-icydemux-0.10.31 is already registered as shlib p=
rovider for libgsticydemux.so, ignoring gstreamer1.0-plugins-good-icydemux-=
1.0.7 trying to register the same
WARNING: gst-plugins-good-id3demux-0.10.31 is already registered as shlib p=
rovider for libgstid3demux.so, ignoring gstreamer1.0-plugins-good-id3demux-=
1.0.7 trying to register the same
WARNING: gst-plugins-good-imagefreeze-0.10.31 is already registered as shli=
b provider for libgstimagefreeze.so, ignoring gstreamer1.0-plugins-good-ima=
gefreeze-1.0.7 trying to register the same
WARNING: gst-plugins-good-interleave-0.10.31 is already registered as shlib=
 provider for libgstinterleave.so, ignoring gstreamer1.0-plugins-good-inter=
leave-1.0.7 trying to register the same
WARNING: gst-plugins-good-isomp4-0.10.31 is already registered as shlib pro=
vider for libgstisomp4.so, ignoring gstreamer1.0-plugins-good-isomp4-1.0.7 =
trying to register the same
WARNING: gst-plugins-good-jpeg-0.10.31 is already registered as shlib provi=
der for libgstjpeg.so, ignoring gstreamer1.0-plugins-good-jpeg-1.0.7 trying=
 to register the same
WARNING: gst-plugins-good-level-0.10.31 is already registered as shlib prov=
ider for libgstlevel.so, ignoring gstreamer1.0-plugins-good-level-1.0.7 try=
ing to register the same
WARNING: gst-plugins-good-matroska-0.10.31 is already registered as shlib p=
rovider for libgstmatroska.so, ignoring gstreamer1.0-plugins-good-matroska-=
1.0.7 trying to register the same
WARNING: gst-plugins-good-mulaw-0.10.31 is already registered as shlib prov=
ider for libgstmulaw.so, ignoring gstreamer1.0-plugins-good-mulaw-1.0.7 try=
ing to register the same
WARNING: gst-plugins-good-multifile-0.10.31 is already registered as shlib =
provider for libgstmultifile.so, ignoring gstreamer1.0-plugins-good-multifi=
le-1.0.7 trying to register the same
WARNING: gst-plugins-good-multipart-0.10.31 is already registered as shlib =
provider for libgstmultipart.so, ignoring gstreamer1.0-plugins-good-multipa=
rt-1.0.7 trying to registe

Other warnings
WARNING: qt3d: No generic license file exists for: PREVIEW.COMMERCIAL in an=
y provider
WARNING: The recipe python3 is trying to install files into a shared area w=
hen those files already exist. Those files and their manifest location are:
WARNING: Building libpam but 'pam' isn't in DISTRO_FEATURES, PAM won't work=
 correctly
WARNING: The recipe python3-distribute-native is trying to install files in=
to a shared area when those files already exist. Those files and their mani=
fest location are:
WARNING: The recipe qt4-embedded is trying to install files into a shared a=
rea when those files already exist. Those files and their manifest location=
 are:
WARNING: The recipe nss is trying to install files into a shared area when =
those files already exist. Those files and their manifest location are:
WARNING: The recipe libungif is trying to install files into a shared area =
when those files already exist. Those files and their manifest location are:
WARNING: The recipe fftwf is trying to install files into a shared area whe=
n those files already exist. Those files and their manifest location are:
WARNING: The recipe qcanobserver-socketcan is trying to install files into =
a shared area when those files already exist. Those files and their manifes=
t location are:
WARNING: The recipe qconnman is trying to install files into a shared area =
when those files already exist. Those files and their manifest location are:
WARNING: The recipe qt-mobility-embedded is trying to install files into a =
shared area when those files already exist. Those files and their manifest =
location are:
WARNING: The recipe python-distribute is trying to install files into a sha=
red area when those files already exist. Those files and their manifest loc=
ation are:
WARNING: The recipe php is trying to install files into a shared area when =
those files already exist. Those files and their manifest location are:
WARNING: The recipe python-setuptools is trying to install files into a sha=
red area when those files already exist. Those files and their manifest loc=
ation are:
WARNING: The recipe gcr is trying to install files into a shared area when =
those files already exist. Those files and their manifest location are:
WARNING: The recipe libnewt-python is trying to install files into a shared=
 area when those files already exist. Those files and their manifest locati=
on are:
WARNING: The recipe nss-myhostname is trying to install files into a shared=
 area when those files already exist. Those files and their manifest locati=
on are:
WARNING: The recipe fftwl is trying to install files into a shared area whe=
n those files already exist. Those files and their manifest location are:
WARNING: The recipe lzma is trying to install files into a shared area when=
 those files already exist. Those files and their manifest location are:
WARNING: The recipe python-matplotlib is trying to install files into a sha=
red area when those files already exist. Those files and their manifest loc=
ation are:
WARNING: The recipe libgweather3 is trying to install files into a shared a=
rea when those files already exist. Those files and their manifest location=
 are:
WARNING: The recipe bluez5 is trying to install files into a shared area wh=
en those files already exist. Those files and their manifest location are:
WARNING: The recipe bluez5 is trying to install files into a shared area wh=
en those files already exist. Those files and their manifest location are:
WARNING: The recipe libpostproc is trying to install files into a shared ar=
ea when those files already exist. Those files and their manifest location =
are:
WARNING: The recipe libpostproc is trying to install files into a shared ar=
ea when those files already exist. Those files and their manifest location =
are:
WARNING: The recipe python3-pycurl is trying to install files into a shared=
 area when those files already exist. Those files and their manifest locati=
on are:


QA issues:
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
qwt-6.0.1: qwt-plugins: found library in wrong location: /usr/plugins/desig=
ner/libqwt_designer_plugin.so
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
  /usr/share/ImageMagick-6/english.xml
  /usr/share/ImageMagick-6/francais.xml
  /usr/share/ImageMagick-6/locale.xml
qtwebkit-5.0.2: package qtwebkit contains bad RPATH /home/jenkins/oe/shr-co=
re-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/qtwebkit/5.0.=
2-r0.0/build/lib in file /home/jenkins/oe/shr-core-branches/shr-core/tmp-eg=
libc/work/armv5te-oe-linux-gnueabi/qtwebkit/5.0.2-r0.0/packages-split/qtweb=
kit/usr/lib/qt5/libexec/QtWebProcess
python3-jinja-1.2: python3-jinja: Files/directories were installed but not =
shipped
  /usr/share
  /usr/share/docs
  /usr/share/docs/html
  /usr/share/docs/txt
  /usr/share/docs/html/watermark.png
  /usr/share/docs/html/translators.html
  /usr/share/docs/html/tests.html
  /usr/share/docs/html/templatei18n.html
  /usr/share/docs/html/style.css
  /usr/share/docs/html/streaming.html
  /usr/share/docs/html/scopes.html
  /usr/share/docs/html/recipies.html
  /usr/share/docs/html/objects.html
  /usr/share/docs/html/loaders.html
  /usr/share/docs/html/jinjalogo.png
  /usr/share/docs/html/jinjabanner.png
  /usr/share/docs/html/installation.html
  /usr/share/docs/html/inheritance.html
  /usr/share/docs/html/index.html
  /usr/share/docs/html/i18n.html
  /usr/share/docs/html/fromdjango.html
  /usr/share/docs/html/frameworks.html
  /usr/share/docs/html/filters.html
  /usr/share/docs/html/escaping.html
  /usr/share/docs/html/devrecipies.html
  /usr/share/docs/html/devintro.html
  /usr/share/docs/html/designerdoc.html
  /usr/share/docs/html/debugging.html
  /usr/share/docs/html/changelog.html
  /usr/share/docs/html/builtins.html
  /usr/share/docs/html/api.html
  /usr/share/docs/html/altsyntax.html
  /usr/share/docs/txt/translators.txt
  /usr/share/docs/txt/tests.txt
  /usr/share/docs/txt/templatei18n.txt
  /usr/share/docs/txt/streaming.txt
  /usr/share/docs/txt/scopes.txt
  /usr/share/docs/txt/recipies.txt
  /usr/share/docs/txt/objects.txt
  /usr/share/docs/txt/loaders.txt
  /usr/share/docs/txt/installation.txt
  /usr/share/docs/txt/inheritance.txt
  /usr/share/docs/txt/index.txt
  /usr/share/docs/txt/i18n.txt
  /usr/share/docs/txt/fromdjango.txt
  /usr/share/docs/txt/frameworks.txt
  /usr/share/docs/txt/filters.txt
  /usr/share/docs/txt/escaping.txt
  /usr/share/docs/txt/devrecipies.txt
  /usr/share/docs/txt/devintro.txt
  /usr/share/docs/txt/designerdoc.txt
  /usr/share/docs/txt/debugging.txt
  /usr/share/docs/txt/changelog.txt
  /usr/share/docs/txt/builtins.txt
  /usr/share/docs/txt/api.txt
  /usr/share/docs/txt/altsyntax.txt
ed-1.8: The /usr/share/info/dir file is not meant to be shipped in a partic=
ular package.
qcanobserver-socketcan-0.5+svnr48: qcanobserver-socketcan: found library in=
 wrong location: /usr/share/qcanobserver/lib/libSocketCAN.so.1
qcanobserver-socketcan: found library in wrong location: /usr/share/qcanobs=
erver/lib/libSocketCAN.so.1.0.0
qcanobserver-socketcan: found library in wrong location: /usr/share/qcanobs=
erver/lib/libSocketCAN.so.1.0
qcanobserver-socketcan: found library in wrong location: /usr/share/qcanobs=
erver/lib/libSocketCAN.so
qcanobserver-socketcan-dbg: found library in wrong location: /usr/share/qca=
nobserver/lib/.debug/libSocketCAN.so.1.0
qcanobserver-socketcan-dbg: found library in wrong location: /usr/share/qca=
nobserver/lib/.debug/libSocketCAN.so
qcanobserver-socketcan-dbg: found library in wrong location: /usr/share/qca=
nobserver/lib/.debug/libSocketCAN.so.1.0.0
qcanobserver-socketcan-dbg: found library in wrong location: /usr/share/qca=
nobserver/lib/.debug/libSocketCAN.so.1
emacs-23.4: The /usr/share/info/dir file is not meant to be shipped in a pa=
rticular package.
oscam-1.10+7974: File '/usr/bin/oscam' from oscam was already stripped, thi=
s will prevent future debugging!
aurora-daemon-0.1+gitrAUTOINC+b65354ad6c: aurora-daemon: found library in w=
rong location: /usr/share/aurora/applications/settings/libaurora-app-settin=
gs.so
quagga-0.99.21: The /usr/share/info/dir file is not meant to be shipped in =
a particular package.
gstreamer1.0-libav-1.0.7: ELF binary '/home/jenkins/oe/shr-core-branches/sh=
r-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gstreamer1.0-libav/1.0.7-r1=
/packages-split/gstreamer1.0-libav/usr/lib/gstreamer-1.0/libgstlibav.so' ha=
s relocations in .text
inetutils-1.9.1: inetutils: Files/directories were installed but not shipped
  /usr/lib
lzip-1.14: The /usr/share/info/dir file is not meant to be shipped in a par=
ticular package.
bluez5-5.7: bluez5: Files/directories were installed but not shipped
  /usr/lib/systemd
  /usr/lib/systemd/user
  /usr/lib/systemd/user/obex.service
libpostproc-0.0.0+gitAUTOINC+3b7053f46d: ELF binary '/home/jenkins/oe/shr-c=
ore-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libpostproc/=
0.0.0+gitAUTOINC+3b7053f46d-r1/packages-split/libpostproc/usr/lib/libpostpr=
oc.so.52.0.100' has relocations in .text
tracker-0.14.2: tracker: Files/directories were installed but not shipped
  /usr/lib/tracker-0.14/writeback-modules/libwriteback-taglib.so
  /usr/lib/tracker-0.14/writeback-modules/libwriteback-taglib.la

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHxUQ0ACgkQN1Ujt2V2gBzmOwCgpulmiK2tFEebj491VqkNKE0v
suMAn3bVVMzQ3bLWD0nEub3ZvuYdOLMR
=MqG6
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--
