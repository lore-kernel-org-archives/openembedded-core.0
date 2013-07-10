Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id CF58D6204F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 11:51:44 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id k10so4921247eaj.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 04:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=km0bDHi6uZG1uCTe5UnUOphr5LaJtcC+3G5ORg7ROfE=;
	b=omcMb2tVg8KJpo8nvLsGi5K7HCUq0I2FPhHc+yxUi+gUgoLsSF1+VKxjZPEyVq18A4
	uqBOIXC31ze6wvKL4qLRaRkvZRc8tJTKA8dddN3xnr94QKzgqnzw7feAUXuFnRJ8qXZd
	f5CSYAKV0bhBEBLbDbhUGbr8lCGSKvStuVAP4G4SUjq5wMCRgZDQzHvmnx5b5yuqsURu
	U0lIm3TAYeW24yTG4wtSQSunz3IAVQF5zQw0fgl2vItgFpgi/sYE8jT5Sfx4LUKn8I1f
	7BZfwCuh2CsaT/iTnKJ8eCODOIps8/TaKVP9Doa5WBQjKlsYGPFJIL8MxKdNfhIhvoZC
	agmA==
X-Received: by 10.15.31.9 with SMTP id x9mr35742991eeu.103.1373457104914;
	Wed, 10 Jul 2013 04:51:44 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	e44sm59313858eeh.11.2013.07.10.04.51.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 10 Jul 2013 04:51:44 -0700 (PDT)
Date: Wed, 10 Jul 2013 13:51:54 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130710115154.GA3288@jama>
References: <1373152387-19393-1-git-send-email-Martin.Jansa@gmail.com>
	<1373152387-19393-2-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1373152387-19393-2-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [RFC][PATCH 2/4] package.bbclass: show warning when package is trying to provide already provided shlib
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
X-List-Received-Date: Wed, 10 Jul 2013 11:51:45 -0000
X-Groupsio-MsgNum: 41728
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="apg+fY3UKMMABzWO"
Content-Disposition: inline

--apg+fY3UKMMABzWO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 07, 2013 at 01:13:05AM +0200, Martin Jansa wrote:
> * move read_shlib_providers before registering package as provider
>   and don't change provider if it already exists, show warning instead
>=20
> [YOCTO #4628]
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

List of WARNINGs about multiple providers for the same shlib from world
build follows:

I'll take care of meta-efl recipes where modules.so is always installed
in separate directory and shouldn't be included in shlibs providers at
all.

WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring evas-engine-gl-x11-1.7.7 trying to register the same
WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring evas-engine-software-16-1.7.7 trying to register the same
WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring evas-engine-software-16-x11-1.7.7 trying to register the=
 same
WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring evas-engine-software-x11-1.7.7 trying to register the sa=
me
WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring evas-engine-wayland-shm-1.7.7 trying to register the same
WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring evas-cserve2-bmp-1.7.7 trying to register the same
WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring evas-cserve2-eet-1.7.7 trying to register the same
WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring evas-cserve2-ico-1.7.7 trying to register the same
WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring evas-cserve2-jpeg-1.7.7 trying to register the same
WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring evas-cserve2-pmaps-1.7.7 trying to register the same
WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring evas-cserve2-png-1.7.7 trying to register the same
WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring evas-cserve2-psd-1.7.7 trying to register the same
WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring evas-cserve2-tga-1.7.7 trying to register the same
WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring evas-cserve2-tiff-1.7.7 trying to register the same
WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring evas-cserve2-wbmp-1.7.7 trying to register the same
WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring evas-cserve2-xpm-1.7.7 trying to register the same
WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring evas-loader-bmp-1.7.7 trying to register the same
WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring evas-loader-generic-1.7.7 trying to register the same
WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring evas-loader-gif-1.7.7 trying to register the same
WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring evas-loader-ico-1.7.7 trying to register the same
WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring evas-loader-jpeg-1.7.7 trying to register the same
WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring evas-loader-pmaps-1.7.7 trying to register the same
WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring evas-loader-png-1.7.7 trying to register the same
WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring evas-loader-psd-1.7.7 trying to register the same
WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring evas-loader-tga-1.7.7 trying to register the same
WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring evas-loader-tiff-1.7.7 trying to register the same
WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring evas-loader-wbmp-1.7.7 trying to register the same
WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring evas-loader-xpm-1.7.7 trying to register the same
WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring evas-saver-jpeg-1.7.7 trying to register the same
WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring evas-saver-png-1.7.7 trying to register the same
WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring evas-saver-tiff-1.7.7 trying to register the same
WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring emotion-1.7.7 trying to register the same
WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring elementary-1.7.7 trying to register the same
WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring elementary-tests-1.7.7 trying to register the same
WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring elementary-accessibility-1.7.7 trying to register the sa=
me
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
WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring e-wm-0.17.3 trying to register the same
WARNING: gstreamer-0.10.36 is already registered as shlib provider for libg=
stcoreelements.so, ignoring gstreamer1.0-1.0.7 trying to register the same
WARNING: xfce4-panel-plugin-launcher-4.10.1 is already registered as shlib =
provider for liblauncher.so, ignoring matchbox-panel-2-2.0+git3+26a3a67b41 =
trying to register the same
WARNING: xfce4-panel-plugin-systray-4.10.1 is already registered as shlib p=
rovider for libsystray.so, ignoring matchbox-panel-2-2.0+git3+26a3a67b41 tr=
ying to register the same
WARNING: xfce4-panel-plugin-clock-4.10.1 is already registered as shlib pro=
vider for libclock.so, ignoring matchbox-panel-2-2.0+git3+26a3a67b41 trying=
 to register the same
WARNING: xfce4-panel-plugin-showdesktop-4.10.1 is already registered as shl=
ib provider for libshowdesktop.so, ignoring matchbox-panel-2-2.0+git3+26a3a=
67b41 trying to register the same
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
nssutil3.so, ignoring nss-3.13.3 trying to register the same
WARNING: firefox-10.0.11esr is already registered as shlib provider for lib=
smime3.so, ignoring nss-3.13.3 trying to register the same
WARNING: firefox-10.0.11esr is already registered as shlib provider for lib=
nssckbi.so, ignoring nss-3.13.3 trying to register the same
WARNING: firefox-10.0.11esr is already registered as shlib provider for lib=
nssdbm3.so, ignoring nss-3.13.3 trying to register the same
WARNING: firefox-10.0.11esr is already registered as shlib provider for lib=
softokn3.so, ignoring nss-3.13.3 trying to register the same
WARNING: firefox-10.0.11esr is already registered as shlib provider for lib=
ssl3.so, ignoring nss-3.13.3 trying to register the same
WARNING: imlib2-loaders-1.4.5+svnr82070 is already registered as shlib prov=
ider for png.so, ignoring lightmediascanner-0.4.4 trying to register the sa=
me
WARNING: imlib2-loaders-1.4.5+svnr82070 is already registered as shlib prov=
ider for jpeg.so, ignoring lightmediascanner-0.4.4 trying to register the s=
ame
WARNING: imlib2-loaders-1.4.5+svnr82070 is already registered as shlib prov=
ider for id3.so, ignoring lightmediascanner-0.4.4 trying to register the sa=
me
WARNING: python-gst-0.10.22 is already registered as shlib provider for aud=
io.so, ignoring fsodeviced-0.12.0 trying to register the same
WARNING: fsoaudiod-0.12.0 is already registered as shlib provider for route=
r_alsa.so, ignoring fsodeviced-0.12.0 trying to register the same
WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring elfe-0.0.1+svnr82070 trying to register the same
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
WARNING: matchbox-panel-2-2.0+git3+26a3a67b41 is already registered as shli=
b provider for libbattery.so, ignoring xfce4-battery-plugin-1.0.5 trying to=
 register the same
WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring shr-e-gadgets-0.0.0+gitr1+27b6c17d73 trying to register =
the same
WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring cpu-0.0.1+svnr82070 trying to register the same
WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring places-0.1.0+svnr82070 trying to register the same
WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring forecasts-0.2.0+svnr82070 trying to register the same
WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring uptime-0.0.2+svnr82070 trying to register the same
WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring screenshot-0.3.0+svnr82070 trying to register the same
WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring exalt-client-0.0.1+svnr82070 trying to register the same
WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring diskio-0.0.1+svnr82070 trying to register the same
WARNING: libgphoto2-camlibs-2.4.11 is already registered as shlib provider =
for serial.so, ignoring libfreerdp-plugin-serial-gitr1+f311acaffb trying to=
 register the same
WARNING: libgphoto2-camlibs-2.4.11 is already registered as shlib provider =
for disk.so, ignoring libfreerdp-plugin-disk-gitr1+f311acaffb trying to reg=
ister the same
WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring rain-0.0.3+svnr82070 trying to register the same
WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring news-0.1.0+svnr82070 trying to register the same
WARNING: evas-engine-fb-1.7.7 is already registered as shlib provider for m=
odule.so, ignoring flame-0.0.3+svnr82070 trying to register the same
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
vider for libgstapetag.so, ignoring gstreamer1.0-plugins-good-apetag-1.0.7 =
trying to register the same
WARNING: gst-plugins-good-audiofx-0.10.31 is already registered as shlib pr=
ovider for libgstaudiofx.so, ignoring gstreamer1.0-plugins-good-audiofx-1.0=
=2E7 trying to register the same
WARNING: gst-plugins-good-audioparsers-0.10.31 is already registered as shl=
ib provider for libgstaudioparsers.so, ignoring gstreamer1.0-plugins-good-a=
udioparsers-1.0.7 trying to register the same
WARNING: gst-plugins-good-auparse-0.10.31 is already registered as shlib pr=
ovider for libgstauparse.so, ignoring gstreamer1.0-plugins-good-auparse-1.0=
=2E7 trying to register the same
WARNING: gst-plugins-good-autodetect-0.10.31 is already registered as shlib=
 provider for libgstautodetect.so, ignoring gstreamer1.0-plugins-good-autod=
etect-1.0.7 trying to register the same
WARNING: gst-plugins-good-avi-0.10.31 is already registered as shlib provid=
er for libgstavi.so, ignoring gstreamer1.0-plugins-good-avi-1.0.7 trying to=
 register the same
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
WARNING: gst-plugins-good-gdkpixbuf-0.10.31 is already registered as shlib =
provider for libgstgdkpixbuf.so, ignoring gstreamer1.0-plugins-good-gdkpixb=
uf-1.0.7 trying to register the same
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
rt-1.0.7 trying to register the same
WARNING: gst-plugins-good-navigationtest-0.10.31 is already registered as s=
hlib provider for libgstnavigationtest.so, ignoring gstreamer1.0-plugins-go=
od-navigationtest-1.0.7 trying to register the same
WARNING: gst-plugins-good-png-0.10.31 is already registered as shlib provid=
er for libgstpng.so, ignoring gstreamer1.0-plugins-good-png-1.0.7 trying to=
 register the same
WARNING: gst-plugins-good-pulse-0.10.31 is already registered as shlib prov=
ider for libgstpulse.so, ignoring gstreamer1.0-plugins-good-pulse-1.0.7 try=
ing to register the same
WARNING: gst-plugins-good-replaygain-0.10.31 is already registered as shlib=
 provider for libgstreplaygain.so, ignoring gstreamer1.0-plugins-good-repla=
ygain-1.0.7 trying to register the same
WARNING: gst-plugins-good-rtp-0.10.31 is already registered as shlib provid=
er for libgstrtp.so, ignoring gstreamer1.0-plugins-good-rtp-1.0.7 trying to=
 register the same
WARNING: gst-plugins-good-rtpmanager-0.10.31 is already registered as shlib=
 provider for libgstrtpmanager.so, ignoring gstreamer1.0-plugins-good-rtpma=
nager-1.0.7 trying to register the same
WARNING: gst-plugins-good-rtsp-0.10.31 is already registered as shlib provi=
der for libgstrtsp.so, ignoring gstreamer1.0-plugins-good-rtsp-1.0.7 trying=
 to register the same
WARNING: gst-plugins-good-shapewipe-0.10.31 is already registered as shlib =
provider for libgstshapewipe.so, ignoring gstreamer1.0-plugins-good-shapewi=
pe-1.0.7 trying to register the same
WARNING: gst-plugins-good-smpte-0.10.31 is already registered as shlib prov=
ider for libgstsmpte.so, ignoring gstreamer1.0-plugins-good-smpte-1.0.7 try=
ing to register the same
WARNING: gst-plugins-good-souphttpsrc-0.10.31 is already registered as shli=
b provider for libgstsouphttpsrc.so, ignoring gstreamer1.0-plugins-good-sou=
phttpsrc-1.0.7 trying to register the same
WARNING: gst-plugins-good-spectrum-0.10.31 is already registered as shlib p=
rovider for libgstspectrum.so, ignoring gstreamer1.0-plugins-good-spectrum-=
1.0.7 trying to register the same
WARNING: gst-plugins-good-speex-0.10.31 is already registered as shlib prov=
ider for libgstspeex.so, ignoring gstreamer1.0-plugins-good-speex-1.0.7 try=
ing to register the same
WARNING: gst-plugins-good-udp-0.10.31 is already registered as shlib provid=
er for libgstudp.so, ignoring gstreamer1.0-plugins-good-udp-1.0.7 trying to=
 register the same
WARNING: gst-plugins-good-video4linux2-0.10.31 is already registered as shl=
ib provider for libgstvideo4linux2.so, ignoring gstreamer1.0-plugins-good-v=
ideo4linux2-1.0.7 trying to register the same
WARNING: gst-plugins-good-videobox-0.10.31 is already registered as shlib p=
rovider for libgstvideobox.so, ignoring gstreamer1.0-plugins-good-videobox-=
1.0.7 trying to register the same
WARNING: gst-plugins-good-videocrop-0.10.31 is already registered as shlib =
provider for libgstvideocrop.so, ignoring gstreamer1.0-plugins-good-videocr=
op-1.0.7 trying to register the same
WARNING: gst-plugins-good-videofilter-0.10.31 is already registered as shli=
b provider for libgstvideofilter.so, ignoring gstreamer1.0-plugins-good-vid=
eofilter-1.0.7 trying to register the same
WARNING: gst-plugins-good-videomixer-0.10.31 is already registered as shlib=
 provider for libgstvideomixer.so, ignoring gstreamer1.0-plugins-good-video=
mixer-1.0.7 trying to register the same
WARNING: gst-plugins-good-wavenc-0.10.31 is already registered as shlib pro=
vider for libgstwavenc.so, ignoring gstreamer1.0-plugins-good-wavenc-1.0.7 =
trying to register the same
WARNING: gst-plugins-good-wavparse-0.10.31 is already registered as shlib p=
rovider for libgstwavparse.so, ignoring gstreamer1.0-plugins-good-wavparse-=
1.0.7 trying to register the same
WARNING: gst-plugins-good-ximagesrc-0.10.31 is already registered as shlib =
provider for libgstximagesrc.so, ignoring gstreamer1.0-plugins-good-ximages=
rc-1.0.7 trying to register the same
WARNING: gst-plugins-good-y4menc-0.10.31 is already registered as shlib pro=
vider for libgsty4menc.so, ignoring gstreamer1.0-plugins-good-y4menc-1.0.7 =
trying to register the same
WARNING: gst-plugins-ugly-a52dec-0.10.19 is already registered as shlib pro=
vider for libgsta52dec.so, ignoring gstreamer1.0-plugins-ugly-a52dec-1.0.7 =
trying to register the same
WARNING: gst-plugins-ugly-asf-0.10.19 is already registered as shlib provid=
er for libgstasf.so, ignoring gstreamer1.0-plugins-ugly-asf-1.0.7 trying to=
 register the same
WARNING: gst-plugins-ugly-lame-0.10.19 is already registered as shlib provi=
der for libgstlame.so, ignoring gstreamer1.0-plugins-ugly-lame-1.0.7 trying=
 to register the same
WARNING: gst-plugins-ugly-mad-0.10.19 is already registered as shlib provid=
er for libgstmad.so, ignoring gstreamer1.0-plugins-ugly-mad-1.0.7 trying to=
 register the same
WARNING: gst-plugins-ugly-mpeg2dec-0.10.19 is already registered as shlib p=
rovider for libgstmpeg2dec.so, ignoring gstreamer1.0-plugins-ugly-mpeg2dec-=
1.0.7 trying to register the same
WARNING: gst-plugins-ugly-rmdemux-0.10.19 is already registered as shlib pr=
ovider for libgstrmdemux.so, ignoring gstreamer1.0-plugins-ugly-rmdemux-1.0=
=2E7 trying to register the same
WARNING: libgphoto2-camlibs-2.4.11 is already registered as shlib provider =
for serial.so, ignoring collectd-5.2.2 trying to register the same
WARNING: gegl-0.2.0 is already registered as shlib provider for load.so, ig=
noring collectd-5.2.2 trying to register the same
WARNING: libgphoto2-camlibs-2.4.11 is already registered as shlib provider =
for disk.so, ignoring collectd-5.2.2 trying to register the same
WARNING: gegl-0.2.0 is already registered as shlib provider for threshold.s=
o, ignoring collectd-5.2.2 trying to register the same
WARNING: libfsotest-0.12.0 is already registered as shlib provider for plug=
in.so, ignoring gnumeric-1.12.0 trying to register the same
WARNING: fsodeviced-0.12.0 is already registered as shlib provider for kern=
el26_firmwareloader.so, ignoring fsosystemd-0.12.0 trying to register the s=
ame
WARNING: gst-openmax-0.10.1 is already registered as shlib provider for lib=
gstomx.so, ignoring gstreamer1.0-omx-1.0.0 trying to register the same
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--apg+fY3UKMMABzWO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHdStoACgkQN1Ujt2V2gByXkQCeM8Y8P6huf9+yao5CaI04clj1
QC0AnAt5SfEThmVdu7JlCJYYLKdTO8wZ
=IRE3
-----END PGP SIGNATURE-----

--apg+fY3UKMMABzWO--
