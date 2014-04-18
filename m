Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id C7878609C0;
	Fri, 18 Apr 2014 18:36:30 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id t10so1847444eei.19
	for <multiple recipients>; Fri, 18 Apr 2014 11:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=pmK2TzdSPdzW/0zVIxzirOnuPdJkInavhLUjUg6EljY=;
	b=WvvxsnWq8uutEvu2ngRizfTHNurKqAXB/+FGvb4ufGzB5Q8jK4MA5NZ97KqDJCrElz
	sxMR1LMwbsZoKbgRBEZWcZ8UzViZG78rVVGv/SxL2ndpT71p93AknRbMewrO7NZSWJZM
	+pah7/vdCymcHffKHw5UBt+DvaXpZTinBzKbNbuxN7AA7rBUiM08vVj8Fuyj8m1YVl4D
	lp+h2bKD1yxnd1WClc4eM1p455Imv93aQg3lfIl8GYWgd7R9kE61hHIoq0jtBXo1+8Ep
	+n+/JzGI6x9dXmfpaodCQzAYu466Kir6sCJBda0cOhMfNjpD8OS4+i/zdljQhR+EywaD
	7g5A==
X-Received: by 10.15.81.135 with SMTP id x7mr24149777eey.61.1397846190594;
	Fri, 18 Apr 2014 11:36:30 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	a4sm78802188eep.12.2014.04.18.11.36.28 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Apr 2014 11:36:29 -0700 (PDT)
Date: Fri, 18 Apr 2014 20:36:32 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140418183632.GG2486@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, test-dependencies 2014-04-18
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
X-List-Received-Date: Fri, 18 Apr 2014 18:36:31 -0000
X-Groupsio-MsgNum: 52460
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KR/qxknboQ7+Tpez"
Content-Disposition: inline

--KR/qxknboQ7+Tpez
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 03, 2014 at 03:06:09PM +0200, Martin Jansa wrote:
> I've just started this long test-dependencies build so jenkins will be bu=
sy
> for next 14 days or so, but I'll send complete qa.log in advance as soon =
as
> it finishes building world from scratch.

The build finally finished today, here are results:

Complete logs:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
40403_143715.log/

Interesting parts, (mostly) missing dependencies:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
40403_143715.log/min_failed/

I'll take care of failing meta-efl, meta-shr recipes and=20
firefox*:
| checking for libnotify >=3D 0.4... Package dbus-glib-1 was not found in t=
he pkg-config search path. Perhaps you should add the directory containing =
`dbus-glib-1.pc' to the PKG_CONFIG_PATH environment variable Package 'dbus-=
glib-1', required by 'libnotify', not found
| configure: error: Library requirements (libnotify >=3D 0.4) not met; cons=
ider adjusting the PKG_CONFIG_PATH environment variable if your libraries a=
re in a nonstandard prefix so pkg-config can find them.

And more importantly floating dependencies, reply here
when you start working on some of these.

Found differences:=20
ccid/ccid/latest lost dependency on  flex
console-tools/console-tools/latest lost dependency on  flex
consolekit/consolekit/latest lost dependency on  polkit
daq/daq/latest lost dependency on  libdnet libmnl libnetfilter-queue libnfn=
etlink
directfb/directfb/latest lost dependency on  libdrm libdrm-kms liblzma tiff
dovecot/dovecot/latest lost dependency on  libcap
engrave/engrave/latest lost dependency on  flex
epiphany/epiphany/latest lost dependency on  libavahi-client libavahi-commo=
n libavahi-gobject libnotify
expedite/expedite/latest lost dependency on  libsdl
fbida/fbida/latest lost dependency on  libx11 libxext libxpm libxt openmotif
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
gnome-mplayer/gnome-mplayer/latest lost dependency on  cairo gtk+3
gnome-mplayer/gnome-mplayer-nautilus-extension/latest lost dependency on  e=
glibc glib-2.0 gtk+
gnome-panel/gnome-panel/latest lost dependency on  dbus-lib
gst-plugins-bad/gst-plugins-bad-meta/latest lost dependency on  gst-plugins=
-bad-dc1394 gst-plugins-bad-faac gst-plugins-bad-schro
gst-plugins-good/gst-plugins-good-ximagesrc/latest lost dependency on  libx=
damage
gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ximagesrc/latest lost d=
ependency on  libxdamage
guile/guile/latest lost dependency on  libgc ncurses-libncurses readline
libarchive/libarchive/latest lost dependency on  lzo
libarchive/libarchive-bin/latest lost dependency on  lzo
libdc1394/libdc1394/latest lost dependency on  libx11 libxv
libmicrohttpd/libmicrohttpd-bin/latest lost dependency on  file
libungif/libungif/latest lost dependency on  libice libsm libx11 libxau lib=
xcb libxdmcp util-linux-libuuid
libungif/libungif-utils/latest lost dependency on  libx11
mesa-demos/mesa-demos/latest lost dependency on  libhybris
midori/midori/latest lost dependency on  libxscrnsaver
mpd/mpd/latest lost dependency on  fluidsynth libao libcdio libcdio-cdda li=
bcdio-paranoia libjack libmms libmodplug libopus mpg123 wavpack yajl
mpeg2dec/mpeg2dec/latest lost dependency on  libx11 libxext libxv
mpg123/mpg123/latest lost dependency on  audiofile esound libjack libsdl po=
rtaudio-v19 tslib
mplayer2/mplayer2/latest lost dependency on  libpostproc libxscrnsaver mpg1=
23
mx-1.0/mx-1.0/latest lost dependency on  libhybris
navit/navit/latest lost dependency on  fribidi
navit/navit-graphics-gtk/latest lost dependency on  imlib2
navit/navit-graphics-sdl/latest lost dependency on  eglibc freetype libjpeg=
-turbo liblzma libpng libsdl libsdl-image tiff tslib zlib
opencv/libopencv-highgui/latest lost dependency on  jasper libdc1394
oscam/oscam/latest lost dependency on  pcsc-lite-lib
piglit/piglit/latest lost dependency on  libhybris libxrender
protobuf/protobuf/latest lost dependency on  zlib
python-efl/python-elementary/latest lost dependency on  eglibc eina element=
ary evas libpython2
qtbase/qtbase-plugins/latest lost dependency on  libxcb-render libxkbcommon=
 xcb-util-renderutil
qtlocation/qtlocation-plugins/latest lost dependency on  gconf glib-2.0 lib=
gypsy
qtwayland/qtwayland-plugins/latest lost dependency on  libhybris
qtwebkit/qtwebkit/latest lost dependency on  qtmultimedia
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
tracker/tracker-nautilus-extension/latest lost dependency on  libunistring
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
postproc libraw1394 libsdl-image libusb1 libxinerama libxpm schroedinger ta=
glib tiff xcb-util-keysyms
weston/weston/latest lost dependency on  libhybris
weston/weston-examples/latest lost dependency on  libhybris libpoppler-glib
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
zenity/zenity/latest lost dependency on  libnotify
zile/zile/latest lost dependency on  bdwgc
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
qt4-embedded/qt4-embedded-plugin-sqldriver-sqlite2/latest doesn't exist
qt4-embedded/qt4-embedded-plugin-sqldriver-sqlite2-dbg/latest doesn't exist
qt4-x11-free/qt4-plugin-sqldriver-sqlite2/latest doesn't exist
qt4-x11-free/qt4-plugin-sqldriver-sqlite2-dbg/latest doesn't exist

1269037.64user 1751615.09system 362:59:06elapsed 231%CPU (0avgtext+0avgdata=
 23234768maxresident)k
35659776inputs+203611424outputs (19691major+46210231064minor)pagefaults 0sw=
aps
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--KR/qxknboQ7+Tpez
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNRcLAACgkQN1Ujt2V2gBy9nwCfaQimaG4fgT6LBfQxy0nvhNeS
FvkAnjVyPyYPiLcTLO40A56UQbQM6q0X
=ZTbI
-----END PGP SIGNATURE-----

--KR/qxknboQ7+Tpez--
