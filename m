Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id 46C95609A7;
	Sat, 19 Apr 2014 11:03:14 +0000 (UTC)
Received: by mail-lb0-f178.google.com with SMTP id s7so2041513lbd.9
	for <multiple recipients>; Sat, 19 Apr 2014 04:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=g2INWideO1fm9h6hO5411lGIs6YZEOUT59nBcPGMVrI=;
	b=HtG54c5bGPRq1zDo/m1uLcMk00wqrNT8ptbuk+jcOuPKLKINAngq6culoeNA1VhTSy
	fzshJSMPMGTp/1RE70mkytsI3VtXCpc/Dc+XlVl9n1AnAn+Gg38QJQsjlSacQZz0MLfA
	mCwvVHTfdWETEEMMWjSTO0zb0uNKrjb7G9c92osxVQqBAL2H7SxfdxsTdyi9LhzoWM6S
	G0fl471a/3QKgSZkI5pptdK1nf4ycHo+6Gw12hgFXXrtyqxT/GaSrQm+a35nBhLWLse9
	v6AVhxLl225tYD9X+eYI+8BJXSTw79MKArqGUMh5sIUF8J596Y5mWuJFM2LAvtCdvS9g
	n7vg==
MIME-Version: 1.0
X-Received: by 10.112.131.34 with SMTP id oj2mr930361lbb.43.1397905394957;
	Sat, 19 Apr 2014 04:03:14 -0700 (PDT)
Received: by 10.112.53.73 with HTTP; Sat, 19 Apr 2014 04:03:14 -0700 (PDT)
In-Reply-To: <20140418183632.GG2486@jama>
References: <20140418183632.GG2486@jama>
Date: Sat, 19 Apr 2014 13:03:14 +0200
Message-ID: <CAPbeDCnP_Qr1fUS9MAFZ4mLCRcoNJ=M1n8Umx-8m6m0b8Sxm0w@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, test-dependencies 2014-04-18
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
X-List-Received-Date: Sat, 19 Apr 2014 11:03:18 -0000
Content-Type: multipart/alternative; boundary=047d7b343ba67f033b04f76336c7

--047d7b343ba67f033b04f76336c7
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 18, 2014 at 8:36 PM, Martin Jansa <martin.jansa@gmail.com>wrote:

> And more importantly floating dependencies, reply here
> when you start working on some of these.
>
> Found differences:
> ccid/ccid/latest lost dependency on  flex
> console-tools/console-tools/latest lost dependency on  flex
>

I'll have a go at resolving the console-tools/flex floating dep.


> consolekit/consolekit/latest lost dependency on  polkit
> daq/daq/latest lost dependency on  libdnet libmnl libnetfilter-queue
> libnfnetlink
> directfb/directfb/latest lost dependency on  libdrm libdrm-kms liblzma tiff
> dovecot/dovecot/latest lost dependency on  libcap
> engrave/engrave/latest lost dependency on  flex
> epiphany/epiphany/latest lost dependency on  libavahi-client
> libavahi-common libavahi-gobject libnotify
> expedite/expedite/latest lost dependency on  libsdl
> fbida/fbida/latest lost dependency on  libx11 libxext libxpm libxt
> openmotif
> flashrom/flashrom/latest lost dependency on  libftdi
> gammu/gammu/latest lost dependency on  glib-2.0 libgudev-1.0
> gammu/libgammu/latest lost dependency on  glib-2.0
> gimp/gimp/latest lost dependency on  jasper libxmu libxpm
> glade3/glade3/latest lost dependency on  dbus-glib dbus-lib gconf
> gnome-vfs libart-lgpl libavahi-client libavahi-common libavahi-glib
> libbonobo libbonoboui libcanberra libcap libgcrypt libgnome
> libgnome-keyring libgnomecanvas libgnomeui libgpg-error libice libltdl
> libogg libsm libvorbis libxcomposite libxcursor libxdamage libxfixes
> libxrandr orbit2 popt util-linux-libuuid
> gmtk/gmtk/latest lost dependency on  cairo-gobject dbus-lib gtk+3 json-c
> libcap libice libpulse libpulse-mainloop-glib libpulsecommon libsm
> libsndfile1 libx11-xcb libxi libxtst util-linux-libuuid
> gnokii/libgnokii/latest lost dependency on  bluez4 libical libusb-compat
> libusb1 pcsc-lite-lib
> gnome-mplayer/gnome-mplayer/latest lost dependency on  cairo gtk+3
> gnome-mplayer/gnome-mplayer-nautilus-extension/latest lost dependency on
>  eglibc glib-2.0 gtk+
> gnome-panel/gnome-panel/latest lost dependency on  dbus-lib
> gst-plugins-bad/gst-plugins-bad-meta/latest lost dependency on
>  gst-plugins-bad-dc1394 gst-plugins-bad-faac gst-plugins-bad-schro
> gst-plugins-good/gst-plugins-good-ximagesrc/latest lost dependency on
>  libxdamage
> gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ximagesrc/latest lost
> dependency on  libxdamage
> guile/guile/latest lost dependency on  libgc ncurses-libncurses readline
> libarchive/libarchive/latest lost dependency on  lzo
> libarchive/libarchive-bin/latest lost dependency on  lzo
> libdc1394/libdc1394/latest lost dependency on  libx11 libxv
> libmicrohttpd/libmicrohttpd-bin/latest lost dependency on  file
> libungif/libungif/latest lost dependency on  libice libsm libx11 libxau
> libxcb libxdmcp util-linux-libuuid
> libungif/libungif-utils/latest lost dependency on  libx11
> mesa-demos/mesa-demos/latest lost dependency on  libhybris
> midori/midori/latest lost dependency on  libxscrnsaver
> mpd/mpd/latest lost dependency on  fluidsynth libao libcdio libcdio-cdda
> libcdio-paranoia libjack libmms libmodplug libopus mpg123 wavpack yajl
> mpeg2dec/mpeg2dec/latest lost dependency on  libx11 libxext libxv
> mpg123/mpg123/latest lost dependency on  audiofile esound libjack libsdl
> portaudio-v19 tslib
> mplayer2/mplayer2/latest lost dependency on  libpostproc libxscrnsaver
> mpg123
> mx-1.0/mx-1.0/latest lost dependency on  libhybris
> navit/navit/latest lost dependency on  fribidi
> navit/navit-graphics-gtk/latest lost dependency on  imlib2
> navit/navit-graphics-sdl/latest lost dependency on  eglibc freetype
> libjpeg-turbo liblzma libpng libsdl libsdl-image tiff tslib zlib
> opencv/libopencv-highgui/latest lost dependency on  jasper libdc1394
> oscam/oscam/latest lost dependency on  pcsc-lite-lib
> piglit/piglit/latest lost dependency on  libhybris libxrender
> protobuf/protobuf/latest lost dependency on  zlib
> python-efl/python-elementary/latest lost dependency on  eglibc eina
> elementary evas libpython2
> qtbase/qtbase-plugins/latest lost dependency on  libxcb-render
> libxkbcommon xcb-util-renderutil
> qtlocation/qtlocation-plugins/latest lost dependency on  gconf glib-2.0
> libgypsy
> qtwayland/qtwayland-plugins/latest lost dependency on  libhybris
> qtwebkit/qtwebkit/latest lost dependency on  qtmultimedia
> sox/sox/latest lost dependency on  libao
> stunnel/stunnel/latest lost dependency on  libwrap zlib
> synergy/synergy/latest lost dependency on  libxinerama
> tracker/tracker/latest lost dependency on  dbus-glib enca gnutls gtk+3
> libgee libgsf libgudev-1.0 libnmglib libnmutil libtasn1 libudev
> libunistring upower
> tracker/tracker-dev/latest lost dependency on  cairo enca expat fontconfig
> freetype giflib gstreamer lcms libbz2 libgsf libgstpbutils-0.10
> libgsttag-0.10 liblzma libpoppler libpoppler-glib libunistring libx11
> libxau libxcb libxcb-render libxcb-shm libxdmcp libxext libxrender pixman
> taglib taglib-c tiff
> tracker/tracker-nautilus-extension/latest lost dependency on  libunistring
> tumbler/tumbler/latest lost dependency on  gstreamer1.0 libbz2 libgsf
> libgsttag-1.0 libxml2
> vagalume/vagalume/latest lost dependency on  libproxy
> vlc/libvlc/latest lost dependency on  libidn
> vlc/vlc/latest lost dependency on  atk dbus-glib enca gconf gnome-vfs gtk+
> libass libavahi-glib libdc1394 libebml libidn libjpeg-turbo liblzma
> libmatroska libmodplug libmpeg2 libmtp libnotify libopencv-calib3d
> libopencv-contrib libopencv-core libopencv-features2d libopencv-flann
> libopencv-gpu libopencv-highgui libopencv-imgproc libopencv-legacy
> libopencv-ml libopencv-nonfree libopencv-objdetect libopencv-ocl
> libopencv-photo libopencv-stitching libopencv-superres libopencv-video
> libopencv-videostab libopus liborc-0.4 libpostproc libraw1394 libsdl-image
> libusb1 libxinerama libxpm schroedinger taglib tiff xcb-util-keysyms
> weston/weston/latest lost dependency on  libhybris
> weston/weston-examples/latest lost dependency on  libhybris libpoppler-glib
> wv/wv/latest lost dependency on  libpng
> wvstreams/wvstreams/latest lost dependency on  dbus-lib libwvstreams-base
> readline
> xdelta3/xdelta3/latest lost dependency on  liblzma
> xfce4-settings/xfce4-settings/latest lost dependency on  upower
> xfce4-weather-plugin/xfce4-weather-plugin/latest lost dependency on
>  dbus-glib dbus-lib upower
> xserver-xorg/xserver-xorg/latest lost dependency on  libunwind
> xserver-xorg/xserver-xorg-xvfb/latest lost dependency on  libunwind
> xterm/xterm/latest lost dependency on  fontconfig libxft
> zenity/zenity/latest lost dependency on  libnotify
> zile/zile/latest lost dependency on  bdwgc
> perf/perf/latest lost dependency on  libunwind
>
>
/Jacob

--047d7b343ba67f033b04f76336c7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On F=
ri, Apr 18, 2014 at 8:36 PM, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"=
mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>=
&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">And more importantly floating dependencies, =
reply here<br>
when you start working on some of these.<br>
<br>
Found differences:<br>
ccid/ccid/latest lost dependency on =C2=A0flex<br>
console-tools/console-tools/latest lost dependency on =C2=A0flex<br></block=
quote><div><br></div><div>I&#39;ll have a go at resolving the console-tools=
/flex floating dep.<br>=C2=A0<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">

consolekit/consolekit/latest lost dependency on =C2=A0polkit<br>
daq/daq/latest lost dependency on =C2=A0libdnet libmnl libnetfilter-queue l=
ibnfnetlink<br>
directfb/directfb/latest lost dependency on =C2=A0libdrm libdrm-kms liblzma=
 tiff<br>
dovecot/dovecot/latest lost dependency on =C2=A0libcap<br>
engrave/engrave/latest lost dependency on =C2=A0flex<br>
epiphany/epiphany/latest lost dependency on =C2=A0libavahi-client libavahi-=
common libavahi-gobject libnotify<br>
expedite/expedite/latest lost dependency on =C2=A0libsdl<br>
fbida/fbida/latest lost dependency on =C2=A0libx11 libxext libxpm libxt ope=
nmotif<br>
flashrom/flashrom/latest lost dependency on =C2=A0libftdi<br>
gammu/gammu/latest lost dependency on =C2=A0glib-2.0 libgudev-1.0<br>
gammu/libgammu/latest lost dependency on =C2=A0glib-2.0<br>
gimp/gimp/latest lost dependency on =C2=A0jasper libxmu libxpm<br>
glade3/glade3/latest lost dependency on =C2=A0dbus-glib dbus-lib gconf gnom=
e-vfs libart-lgpl libavahi-client libavahi-common libavahi-glib libbonobo l=
ibbonoboui libcanberra libcap libgcrypt libgnome libgnome-keyring libgnomec=
anvas libgnomeui libgpg-error libice libltdl libogg libsm libvorbis libxcom=
posite libxcursor libxdamage libxfixes libxrandr orbit2 popt util-linux-lib=
uuid<br>

gmtk/gmtk/latest lost dependency on =C2=A0cairo-gobject dbus-lib gtk+3 json=
-c libcap libice libpulse libpulse-mainloop-glib libpulsecommon libsm libsn=
dfile1 libx11-xcb libxi libxtst util-linux-libuuid<br>
gnokii/libgnokii/latest lost dependency on =C2=A0bluez4 libical libusb-comp=
at libusb1 pcsc-lite-lib<br>
gnome-mplayer/gnome-mplayer/latest lost dependency on =C2=A0cairo gtk+3<br>
gnome-mplayer/gnome-mplayer-nautilus-extension/latest lost dependency on =
=C2=A0eglibc glib-2.0 gtk+<br>
gnome-panel/gnome-panel/latest lost dependency on =C2=A0dbus-lib<br>
gst-plugins-bad/gst-plugins-bad-meta/latest lost dependency on =C2=A0gst-pl=
ugins-bad-dc1394 gst-plugins-bad-faac gst-plugins-bad-schro<br>
gst-plugins-good/gst-plugins-good-ximagesrc/latest lost dependency on =C2=
=A0libxdamage<br>
gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ximagesrc/latest lost d=
ependency on =C2=A0libxdamage<br>
guile/guile/latest lost dependency on =C2=A0libgc ncurses-libncurses readli=
ne<br>
libarchive/libarchive/latest lost dependency on =C2=A0lzo<br>
libarchive/libarchive-bin/latest lost dependency on =C2=A0lzo<br>
libdc1394/libdc1394/latest lost dependency on =C2=A0libx11 libxv<br>
libmicrohttpd/libmicrohttpd-bin/latest lost dependency on =C2=A0file<br>
libungif/libungif/latest lost dependency on =C2=A0libice libsm libx11 libxa=
u libxcb libxdmcp util-linux-libuuid<br>
libungif/libungif-utils/latest lost dependency on =C2=A0libx11<br>
mesa-demos/mesa-demos/latest lost dependency on =C2=A0libhybris<br>
midori/midori/latest lost dependency on =C2=A0libxscrnsaver<br>
mpd/mpd/latest lost dependency on =C2=A0fluidsynth libao libcdio libcdio-cd=
da libcdio-paranoia libjack libmms libmodplug libopus mpg123 wavpack yajl<b=
r>
mpeg2dec/mpeg2dec/latest lost dependency on =C2=A0libx11 libxext libxv<br>
mpg123/mpg123/latest lost dependency on =C2=A0audiofile esound libjack libs=
dl portaudio-v19 tslib<br>
mplayer2/mplayer2/latest lost dependency on =C2=A0libpostproc libxscrnsaver=
 mpg123<br>
mx-1.0/mx-1.0/latest lost dependency on =C2=A0libhybris<br>
navit/navit/latest lost dependency on =C2=A0fribidi<br>
navit/navit-graphics-gtk/latest lost dependency on =C2=A0imlib2<br>
navit/navit-graphics-sdl/latest lost dependency on =C2=A0eglibc freetype li=
bjpeg-turbo liblzma libpng libsdl libsdl-image tiff tslib zlib<br>
opencv/libopencv-highgui/latest lost dependency on =C2=A0jasper libdc1394<b=
r>
oscam/oscam/latest lost dependency on =C2=A0pcsc-lite-lib<br>
piglit/piglit/latest lost dependency on =C2=A0libhybris libxrender<br>
protobuf/protobuf/latest lost dependency on =C2=A0zlib<br>
python-efl/python-elementary/latest lost dependency on =C2=A0eglibc eina el=
ementary evas libpython2<br>
qtbase/qtbase-plugins/latest lost dependency on =C2=A0libxcb-render libxkbc=
ommon xcb-util-renderutil<br>
qtlocation/qtlocation-plugins/latest lost dependency on =C2=A0gconf glib-2.=
0 libgypsy<br>
qtwayland/qtwayland-plugins/latest lost dependency on =C2=A0libhybris<br>
qtwebkit/qtwebkit/latest lost dependency on =C2=A0qtmultimedia<br>
sox/sox/latest lost dependency on =C2=A0libao<br>
stunnel/stunnel/latest lost dependency on =C2=A0libwrap zlib<br>
synergy/synergy/latest lost dependency on =C2=A0libxinerama<br>
tracker/tracker/latest lost dependency on =C2=A0dbus-glib enca gnutls gtk+3=
 libgee libgsf libgudev-1.0 libnmglib libnmutil libtasn1 libudev libunistri=
ng upower<br>
tracker/tracker-dev/latest lost dependency on =C2=A0cairo enca expat fontco=
nfig freetype giflib gstreamer lcms libbz2 libgsf libgstpbutils-0.10 libgst=
tag-0.10 liblzma libpoppler libpoppler-glib libunistring libx11 libxau libx=
cb libxcb-render libxcb-shm libxdmcp libxext libxrender pixman taglib tagli=
b-c tiff<br>

tracker/tracker-nautilus-extension/latest lost dependency on =C2=A0libunist=
ring<br>
tumbler/tumbler/latest lost dependency on =C2=A0gstreamer1.0 libbz2 libgsf =
libgsttag-1.0 libxml2<br>
vagalume/vagalume/latest lost dependency on =C2=A0libproxy<br>
vlc/libvlc/latest lost dependency on =C2=A0libidn<br>
vlc/vlc/latest lost dependency on =C2=A0atk dbus-glib enca gconf gnome-vfs =
gtk+ libass libavahi-glib libdc1394 libebml libidn libjpeg-turbo liblzma li=
bmatroska libmodplug libmpeg2 libmtp libnotify libopencv-calib3d libopencv-=
contrib libopencv-core libopencv-features2d libopencv-flann libopencv-gpu l=
ibopencv-highgui libopencv-imgproc libopencv-legacy libopencv-ml libopencv-=
nonfree libopencv-objdetect libopencv-ocl libopencv-photo libopencv-stitchi=
ng libopencv-superres libopencv-video libopencv-videostab libopus liborc-0.=
4 libpostproc libraw1394 libsdl-image libusb1 libxinerama libxpm schroeding=
er taglib tiff xcb-util-keysyms<br>

weston/weston/latest lost dependency on =C2=A0libhybris<br>
weston/weston-examples/latest lost dependency on =C2=A0libhybris libpoppler=
-glib<br>
wv/wv/latest lost dependency on =C2=A0libpng<br>
wvstreams/wvstreams/latest lost dependency on =C2=A0dbus-lib libwvstreams-b=
ase readline<br>
xdelta3/xdelta3/latest lost dependency on =C2=A0liblzma<br>
xfce4-settings/xfce4-settings/latest lost dependency on =C2=A0upower<br>
xfce4-weather-plugin/xfce4-weather-plugin/latest lost dependency on =C2=A0d=
bus-glib dbus-lib upower<br>
xserver-xorg/xserver-xorg/latest lost dependency on =C2=A0libunwind<br>
xserver-xorg/xserver-xorg-xvfb/latest lost dependency on =C2=A0libunwind<br=
>
xterm/xterm/latest lost dependency on =C2=A0fontconfig libxft<br>
zenity/zenity/latest lost dependency on =C2=A0libnotify<br>
zile/zile/latest lost dependency on =C2=A0bdwgc<br>
perf/perf/latest lost dependency on =C2=A0libunwind<br>
<br></blockquote><div><br></div><div>/Jacob <br></div></div></div></div>

--047d7b343ba67f033b04f76336c7--
