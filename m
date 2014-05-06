Return-Path: <martin.jansa@gmail.com>
Received: from mail-ve0-f177.google.com (mail-ve0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id B4FFA60D67;
	Tue,  6 May 2014 19:51:24 +0000 (UTC)
Received: by mail-ve0-f177.google.com with SMTP id db11so6408640veb.22
	for <multiple recipients>; Tue, 06 May 2014 12:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=hTm6y2rqKw9mCjAdEA5dcMMxgmOVywHAsBpthnDrjp0=;
	b=GzjUkHyRfn8mJi4dY2wtUXdsuK1mUrwxl6geRDkdrUkTy4PawBXr0smbc9wPcwAKA0
	k34Ru8qohkkUsPvfP6ZPp9isQ4ph/3+k1psrt/4HhJdfoYcdz6TgOOghAZkK/3lsnGQo
	TIdRxxWIqEx4GtOtj6Amg35ADMBdtyfzSuNQLaiU6yb042JFkyNccm3ByEVQA16eTg5g
	PoAcRbgAeCiM2IO3EveYW4zcexiStrvwHuGIsoe5IA1PGDmKgvZImYUtoZvnnaJ4r94/
	ihS9doXAKNBFSlrB4pHdlpE0yPcjpt2gVXAjvPWpo7o6XmnM0ofZVWmcF3LSuZQGqmtN
	TtYA==
X-Received: by 10.58.76.163 with SMTP id l3mr128074vew.74.1399405885185;
	Tue, 06 May 2014 12:51:25 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ee5sm27548835vdb.8.2014.05.06.12.51.22 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 May 2014 12:51:23 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 6 May 2014 21:51:44 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140506195144.GC30955@jama>
References: <20140418183632.GG2486@jama>
 <20140425010009.GN2486@jama>
MIME-Version: 1.0
In-Reply-To: <20140425010009.GN2486@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, test-dependencies 2014-05-06
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
X-List-Received-Date: Tue, 06 May 2014 19:51:25 -0000
X-Groupsio-MsgNum: 52886
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E13BgyNx05feLLmH"
Content-Disposition: inline

--E13BgyNx05feLLmH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2014 at 03:00:09AM +0200, Martin Jansa wrote:
> On Fri, Apr 18, 2014 at 08:36:32PM +0200, Martin Jansa wrote:
> > On Thu, Apr 03, 2014 at 03:06:09PM +0200, Martin Jansa wrote:
> > > I've just started this long test-dependencies build so jenkins will b=
e busy
> > > for next 14 days or so, but I'll send complete qa.log in advance as s=
oon as
> > > it finishes building world from scratch.
>=20
> This one is only "incremental" (so testing only recipes which failed in
> previous run) and it took only 3,5 days to finish :).
>=20
> Mostly because of firefox (libnotify) and efl/lua fix we're down to 72 re=
cipes with
> issues (instead of 187 found in previous run or 100 w/o firefox*)

I've sent couple of WIP patches to oe-devel ML and now we're down to 50
recipes with issues, there are still 2 days to send patches for daisy,
so hurry up.

Complete logs:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.dependenc=
ies.20140506_041120.log/

No min or max failed issues (all these were fixed in WIP patches)

I'll look at qtbase, python-edje, python-elementary than maybe gst* and lib=
ao.

Found differences:=20
ccid/ccid/latest lost dependency on  flex
console-tools/console-tools/latest lost dependency on  flex
consolekit/consolekit/latest lost dependency on  polkit
directfb/directfb/latest lost dependency on  libdrm libdrm-kms liblzma tiff
engrave/engrave/latest lost dependency on  flex
epiphany/epiphany/latest lost dependency on  libavahi-client libavahi-commo=
n libavahi-gobject libnotify
expedite/expedite/latest lost dependency on  libsdl
flashrom/flashrom/latest lost dependency on  libftdi
gammu/gammu/latest lost dependency on  glib-2.0 libgudev-1.0
gammu/libgammu/latest lost dependency on  glib-2.0
gimp/gimp/latest lost dependency on  jasper libxmu libxpm
glade3/glade3/latest lost dependency on  dbus-glib dbus-lib gconf gnome-vfs=
 libart-lgpl libavahi-client libavahi-common libavahi-glib libbonobo libbon=
oboui libcanberra libcap libgcrypt libgnome libgnome-keyring libgnomecanvas=
 libgnomeui libgpg-error libice libltdl libogg libsm libvorbis libxcomposit=
e libxcursor libxdamage libxfixes libxrandr orbit2 popt util-linux-libuuid
gmtk/gmtk/latest lost dependency on  cairo-gobject dbus-lib gtk+3 json-c li=
bcap libice libpulse libpulse-mainloop-glib libpulsecommon libsm libsndfile=
1 libx11-xcb libxi libxtst util-linux-libuuid
gnokii/libgnokii/latest lost dependency on  bluez4 libical libusb-compat li=
busb1 pcsc-lite-lib
gnome-panel/gnome-panel/latest lost dependency on  dbus-lib
gst-plugins-bad/gst-plugins-bad-meta/latest lost dependency on  gst-plugins=
-bad-dc1394 gst-plugins-bad-faac gst-plugins-bad-schro
gst-plugins-good/gst-plugins-good-ximagesrc/latest lost dependency on  libx=
damage
gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ximagesrc/latest lost d=
ependency on  libxdamage
guile/guile/latest lost dependency on  libgc ncurses-libncurses readline
libmicrohttpd/libmicrohttpd-bin/latest lost dependency on  file
libungif/libungif/latest lost dependency on  libice libsm libx11 libxau lib=
xcb libxdmcp util-linux-libuuid
libungif/libungif-utils/latest lost dependency on  libx11
maliit-framework/maliit-framework-gtk/latest lost dependency on  eglibc gli=
b-2.0 gtk+ gtk+3 libgcc libqtcore4 maliit-framework pango
midori/midori/latest lost dependency on  libxscrnsaver
mongodb/mongodb/latest lost dependency on  libpcap
mpd/mpd/latest lost dependency on  fluidsynth libao libcdio libcdio-cdda li=
bcdio-paranoia libjack libmms libmodplug libopus mpg123 openal-soft wavpack=
 yajl
mpeg2dec/mpeg2dec/latest lost dependency on  libx11 libxext libxv
mpg123/mpg123/latest lost dependency on  audiofile esound libjack libsdl op=
enal-soft portaudio-v19 tslib
navit/navit/latest lost dependency on  fribidi
navit/navit-graphics-gtk/latest lost dependency on  imlib2
navit/navit-graphics-sdl/latest lost dependency on  eglibc freetype libjpeg=
-turbo liblzma libpng libsdl libsdl-image tiff tslib zlib
opencv/libopencv-highgui/latest lost dependency on  jasper libdc1394
oscam/oscam/latest lost dependency on  pcsc-lite-lib
piglit/piglit/latest lost dependency on  libxrender
protobuf/protobuf/latest lost dependency on  zlib
python-efl/python-edje/latest lost dependency on  edje eglibc eina libpytho=
n2
python-efl/python-elementary/latest lost dependency on  eglibc eina element=
ary evas libpython2
qtbase/qtbase-plugins/latest lost dependency on  libxcb-render xcb-util-ren=
derutil
sox/sox/latest lost dependency on  libao
stunnel/stunnel/latest lost dependency on  libwrap zlib
synergy/synergy/latest lost dependency on  libxinerama
tracker/tracker/latest lost dependency on  dbus-glib enca gnutls gtk+3 libg=
ee libgsf libgudev-1.0 libnmglib libnmutil libtasn1 libudev libunistring up=
ower
tracker/tracker-dev/latest lost dependency on  cairo enca expat fontconfig =
freetype giflib gstreamer lcms libbz2 libgsf libgstpbutils-0.10 libgsttag-0=
=2E10 liblzma libpoppler libpoppler-glib libunistring libx11 libxau libxcb =
libxcb-render libxcb-shm libxdmcp libxext libxrender pixman taglib taglib-c=
 tiff
tracker/tracker-nautilus-extension/latest lost dependency on  atk cairo egl=
ibc expat fontconfig freetype gdk-pixbuf glib-2.0 gtk+ harfbuzz libffi libp=
ng libsqlite3 libunistring libx11 libxau libxcb libxcb-render libxcb-shm li=
bxdmcp libxext libxrender pango pixman tracker util-linux-libuuid zlib
tumbler/tumbler/latest lost dependency on  gstreamer1.0 libbz2 libgsf libgs=
ttag-1.0 libxml2
vagalume/vagalume/latest lost dependency on  libproxy
vlc/libvlc/latest lost dependency on  libidn
vlc/vlc/latest lost dependency on  atk dbus-glib enca gconf gnome-vfs gtk+ =
libass libavahi-glib libdc1394 libebml libidn libjpeg-turbo liblzma libmatr=
oska libmodplug libmpeg2 libmtp libnotify libopencv-calib3d libopencv-contr=
ib libopencv-core libopencv-features2d libopencv-flann libopencv-gpu libope=
ncv-highgui libopencv-imgproc libopencv-legacy libopencv-ml libopencv-nonfr=
ee libopencv-objdetect libopencv-ocl libopencv-photo libopencv-stitching li=
bopencv-superres libopencv-video libopencv-videostab libopus liborc-0.4 lib=
raw1394 libsdl-image libusb1 libxinerama libxpm schroedinger taglib tiff xc=
b-util-keysyms
weston/weston/latest lost dependency on  lcms
weston/weston-examples/latest lost dependency on  libpoppler-glib
wv/wv/latest lost dependency on  libpng
wvstreams/wvstreams/latest lost dependency on  dbus-lib libwvstreams-base r=
eadline
xdelta3/xdelta3/latest lost dependency on  liblzma
xfce4-settings/xfce4-settings/latest lost dependency on  upower
xfce4-weather-plugin/xfce4-weather-plugin/latest lost dependency on  dbus-g=
lib dbus-lib upower
xserver-xorg/xserver-xorg/latest lost dependency on  libunwind
xserver-xorg/xserver-xorg-xvfb/latest lost dependency on  libunwind
xterm/xterm/latest lost dependency on  fontconfig libxft
perf/perf/latest lost dependency on  libunwind

Found errors:=20
gst-plugins-bad/gst-plugins-bad-dc1394/latest doesn't exist
gst-plugins-bad/gst-plugins-bad-dc1394-dev/latest doesn't exist
gst-plugins-bad/gst-plugins-bad-faac/latest doesn't exist
gst-plugins-bad/gst-plugins-bad-faac-dev/latest doesn't exist
gst-plugins-bad/gst-plugins-bad-schro/latest doesn't exist
gst-plugins-bad/gst-plugins-bad-schro-dev/latest doesn't exist
libao/libao-plugin-libalsa/latest doesn't exist
libao/libao-plugin-libalsa-dbg/latest doesn't exist
libao/libao-plugin-libpulse/latest doesn't exist
libao/libao-plugin-libpulse-dbg/latest doesn't exist

62696.90user 72534.50system 15:04:50elapsed 249%CPU (0avgtext+0avgdata 4476=
160maxresident)k
5358728inputs+23799696outputs (1082major+2565040779minor)pagefaults 0swaps
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--E13BgyNx05feLLmH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNpPVAACgkQN1Ujt2V2gByCzwCePV1mIinyJVQ39h9AdRVqVvi9
QqMAn2XASifXAQN14/D7qTZ3XkwjpZH4
=Lq8f
-----END PGP SIGNATURE-----

--E13BgyNx05feLLmH--
