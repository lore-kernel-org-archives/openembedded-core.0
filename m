Return-Path: <ticotimo@gmail.com>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5A99165E8C;
	Tue,  6 May 2014 20:41:47 +0000 (UTC)
Received: by mail-lb0-f169.google.com with SMTP id s7so41149lbd.28
	for <multiple recipients>; Tue, 06 May 2014 13:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=xrJInbslU8tdChSqDYjAsx3/GpX8fUdfTALlhlOnu6M=;
	b=HmoG6lnb29gypQgerM2V2DZPaJI4FC0bNTm0qQ1xkMaT1W9FV5jFFcyvtNuc5kzO7v
	PSnzFH7cr2PxnZqFYhfHnaeig1+XwNJQIUJ5AMvMQVIdIkr3ce9/oVVactjy9BFUDH3B
	AfYUrBOu5c8nVQxxPGUKTTvcICgPSKR/DWO7iZUrVMH2uLrS1/wgEYhWSf0q3MSVtEbr
	jGPhaK7qBnTwOsHU5Z9DiiS4R/KdjUkNGkViVDI7pmgqQbsAVshHVskEek5NQSktZ1kL
	603NhH5e78LSuv4JqS8lJXZPlACuOIf5EfChaWqrbQforsgkYC5CTJurO4PEgqdMWcAA
	ut4g==
MIME-Version: 1.0
X-Received: by 10.112.35.202 with SMTP id k10mr34168871lbj.14.1399408907709;
	Tue, 06 May 2014 13:41:47 -0700 (PDT)
Received: by 10.114.216.4 with HTTP; Tue, 6 May 2014 13:41:47 -0700 (PDT)
In-Reply-To: <20140506195144.GC30955@jama>
References: <20140418183632.GG2486@jama> <20140425010009.GN2486@jama>
	<20140506195144.GC30955@jama>
Date: Tue, 6 May 2014 13:41:47 -0700
Message-ID: <CANx9H-CbwytcOd-j3UZNLUPHvp4JhyMkXuvOBF0p8yBrYaVxVw@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: State of bitbake world, test-dependencies 2014-05-06
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
X-List-Received-Date: Tue, 06 May 2014 20:41:52 -0000
Content-Type: multipart/alternative; boundary=001a11c36bb2d774d604f8c14630

--001a11c36bb2d774d604f8c14630
Content-Type: text/plain; charset=UTF-8

I will work on vlc/libvlc.

--Tim


On Tue, May 6, 2014 at 12:51 PM, Martin Jansa <martin.jansa@gmail.com>wrote:

> On Fri, Apr 25, 2014 at 03:00:09AM +0200, Martin Jansa wrote:
> > On Fri, Apr 18, 2014 at 08:36:32PM +0200, Martin Jansa wrote:
> > > On Thu, Apr 03, 2014 at 03:06:09PM +0200, Martin Jansa wrote:
> > > > I've just started this long test-dependencies build so jenkins will
> be busy
> > > > for next 14 days or so, but I'll send complete qa.log in advance as
> soon as
> > > > it finishes building world from scratch.
> >
> > This one is only "incremental" (so testing only recipes which failed in
> > previous run) and it took only 3,5 days to finish :).
> >
> > Mostly because of firefox (libnotify) and efl/lua fix we're down to 72
> recipes with
> > issues (instead of 187 found in previous run or 100 w/o firefox*)
>
> I've sent couple of WIP patches to oe-devel ML and now we're down to 50
> recipes with issues, there are still 2 days to send patches for daisy,
> so hurry up.
>
> Complete logs:
>
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.dependencies.20140506_041120.log/
>
> No min or max failed issues (all these were fixed in WIP patches)
>
> I'll look at qtbase, python-edje, python-elementary than maybe gst* and
> libao.
>
> Found differences:
> ccid/ccid/latest lost dependency on  flex
> console-tools/console-tools/latest lost dependency on  flex
> consolekit/consolekit/latest lost dependency on  polkit
> directfb/directfb/latest lost dependency on  libdrm libdrm-kms liblzma tiff
> engrave/engrave/latest lost dependency on  flex
> epiphany/epiphany/latest lost dependency on  libavahi-client
> libavahi-common libavahi-gobject libnotify
> expedite/expedite/latest lost dependency on  libsdl
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
> gnome-panel/gnome-panel/latest lost dependency on  dbus-lib
> gst-plugins-bad/gst-plugins-bad-meta/latest lost dependency on
>  gst-plugins-bad-dc1394 gst-plugins-bad-faac gst-plugins-bad-schro
> gst-plugins-good/gst-plugins-good-ximagesrc/latest lost dependency on
>  libxdamage
> gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ximagesrc/latest lost
> dependency on  libxdamage
> guile/guile/latest lost dependency on  libgc ncurses-libncurses readline
> libmicrohttpd/libmicrohttpd-bin/latest lost dependency on  file
> libungif/libungif/latest lost dependency on  libice libsm libx11 libxau
> libxcb libxdmcp util-linux-libuuid
> libungif/libungif-utils/latest lost dependency on  libx11
> maliit-framework/maliit-framework-gtk/latest lost dependency on  eglibc
> glib-2.0 gtk+ gtk+3 libgcc libqtcore4 maliit-framework pango
> midori/midori/latest lost dependency on  libxscrnsaver
> mongodb/mongodb/latest lost dependency on  libpcap
> mpd/mpd/latest lost dependency on  fluidsynth libao libcdio libcdio-cdda
> libcdio-paranoia libjack libmms libmodplug libopus mpg123 openal-soft
> wavpack yajl
> mpeg2dec/mpeg2dec/latest lost dependency on  libx11 libxext libxv
> mpg123/mpg123/latest lost dependency on  audiofile esound libjack libsdl
> openal-soft portaudio-v19 tslib
> navit/navit/latest lost dependency on  fribidi
> navit/navit-graphics-gtk/latest lost dependency on  imlib2
> navit/navit-graphics-sdl/latest lost dependency on  eglibc freetype
> libjpeg-turbo liblzma libpng libsdl libsdl-image tiff tslib zlib
> opencv/libopencv-highgui/latest lost dependency on  jasper libdc1394
> oscam/oscam/latest lost dependency on  pcsc-lite-lib
> piglit/piglit/latest lost dependency on  libxrender
> protobuf/protobuf/latest lost dependency on  zlib
> python-efl/python-edje/latest lost dependency on  edje eglibc eina
> libpython2
> python-efl/python-elementary/latest lost dependency on  eglibc eina
> elementary evas libpython2
> qtbase/qtbase-plugins/latest lost dependency on  libxcb-render
> xcb-util-renderutil
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
> tracker/tracker-nautilus-extension/latest lost dependency on  atk cairo
> eglibc expat fontconfig freetype gdk-pixbuf glib-2.0 gtk+ harfbuzz libffi
> libpng libsqlite3 libunistring libx11 libxau libxcb libxcb-render
> libxcb-shm libxdmcp libxext libxrender pango pixman tracker
> util-linux-libuuid zlib
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
> libopencv-videostab libopus liborc-0.4 libraw1394 libsdl-image libusb1
> libxinerama libxpm schroedinger taglib tiff xcb-util-keysyms
> weston/weston/latest lost dependency on  lcms
> weston/weston-examples/latest lost dependency on  libpoppler-glib
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
> perf/perf/latest lost dependency on  libunwind
>
> Found errors:
> gst-plugins-bad/gst-plugins-bad-dc1394/latest doesn't exist
> gst-plugins-bad/gst-plugins-bad-dc1394-dev/latest doesn't exist
> gst-plugins-bad/gst-plugins-bad-faac/latest doesn't exist
> gst-plugins-bad/gst-plugins-bad-faac-dev/latest doesn't exist
> gst-plugins-bad/gst-plugins-bad-schro/latest doesn't exist
> gst-plugins-bad/gst-plugins-bad-schro-dev/latest doesn't exist
> libao/libao-plugin-libalsa/latest doesn't exist
> libao/libao-plugin-libalsa-dbg/latest doesn't exist
> libao/libao-plugin-libpulse/latest doesn't exist
> libao/libao-plugin-libpulse-dbg/latest doesn't exist
>
> 62696.90user 72534.50system 15:04:50elapsed 249%CPU (0avgtext+0avgdata
> 4476160maxresident)k
> 5358728inputs+23799696outputs (1082major+2565040779minor)pagefaults 0swaps
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a11c36bb2d774d604f8c14630
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I will work on vlc/libvlc.<br><br></div>--Tim<br></di=
v><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Tue, May=
 6, 2014 at 12:51 PM, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:=
martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;</s=
pan> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">On Fri, Apr 25, 2014 at 03:00:09AM +0200, Ma=
rtin Jansa wrote:<br>
&gt; On Fri, Apr 18, 2014 at 08:36:32PM +0200, Martin Jansa wrote:<br>
&gt; &gt; On Thu, Apr 03, 2014 at 03:06:09PM +0200, Martin Jansa wrote:<br>
&gt; &gt; &gt; I&#39;ve just started this long test-dependencies build so j=
enkins will be busy<br>
&gt; &gt; &gt; for next 14 days or so, but I&#39;ll send complete qa.log in=
 advance as soon as<br>
&gt; &gt; &gt; it finishes building world from scratch.<br>
&gt;<br>
&gt; This one is only &quot;incremental&quot; (so testing only recipes whic=
h failed in<br>
&gt; previous run) and it took only 3,5 days to finish :).<br>
&gt;<br>
&gt; Mostly because of firefox (libnotify) and efl/lua fix we&#39;re down t=
o 72 recipes with<br>
&gt; issues (instead of 187 found in previous run or 100 w/o firefox*)<br>
<br>
I&#39;ve sent couple of WIP patches to oe-devel ML and now we&#39;re down t=
o 50<br>
recipes with issues, there are still 2 days to send patches for daisy,<br>
so hurry up.<br>
<br>
Complete logs:<br>
<a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/lo=
g.dependencies.20140506_041120.log/" target=3D"_blank">http://logs.nslu2-li=
nux.org/buildlogs/oe/oe-shr-core-branches/log.dependencies.20140506_041120.=
log/</a><br>

<br>
No min or max failed issues (all these were fixed in WIP patches)<br>
<br>
I&#39;ll look at qtbase, python-edje, python-elementary than maybe gst* and=
 libao.<br>
<br>
Found differences:<br>
ccid/ccid/latest lost dependency on =C2=A0flex<br>
console-tools/console-tools/latest lost dependency on =C2=A0flex<br>
consolekit/consolekit/latest lost dependency on =C2=A0polkit<br>
directfb/directfb/latest lost dependency on =C2=A0libdrm libdrm-kms liblzma=
 tiff<br>
engrave/engrave/latest lost dependency on =C2=A0flex<br>
epiphany/epiphany/latest lost dependency on =C2=A0libavahi-client libavahi-=
common libavahi-gobject libnotify<br>
expedite/expedite/latest lost dependency on =C2=A0libsdl<br>
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
gnome-panel/gnome-panel/latest lost dependency on =C2=A0dbus-lib<br>
gst-plugins-bad/gst-plugins-bad-meta/latest lost dependency on =C2=A0gst-pl=
ugins-bad-dc1394 gst-plugins-bad-faac gst-plugins-bad-schro<br>
gst-plugins-good/gst-plugins-good-ximagesrc/latest lost dependency on =C2=
=A0libxdamage<br>
gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ximagesrc/latest lost d=
ependency on =C2=A0libxdamage<br>
guile/guile/latest lost dependency on =C2=A0libgc ncurses-libncurses readli=
ne<br>
libmicrohttpd/libmicrohttpd-bin/latest lost dependency on =C2=A0file<br>
libungif/libungif/latest lost dependency on =C2=A0libice libsm libx11 libxa=
u libxcb libxdmcp util-linux-libuuid<br>
libungif/libungif-utils/latest lost dependency on =C2=A0libx11<br>
maliit-framework/maliit-framework-gtk/latest lost dependency on =C2=A0eglib=
c glib-2.0 gtk+ gtk+3 libgcc libqtcore4 maliit-framework pango<br>
midori/midori/latest lost dependency on =C2=A0libxscrnsaver<br>
mongodb/mongodb/latest lost dependency on =C2=A0libpcap<br>
mpd/mpd/latest lost dependency on =C2=A0fluidsynth libao libcdio libcdio-cd=
da libcdio-paranoia libjack libmms libmodplug libopus mpg123 openal-soft wa=
vpack yajl<br>
mpeg2dec/mpeg2dec/latest lost dependency on =C2=A0libx11 libxext libxv<br>
mpg123/mpg123/latest lost dependency on =C2=A0audiofile esound libjack libs=
dl openal-soft portaudio-v19 tslib<br>
navit/navit/latest lost dependency on =C2=A0fribidi<br>
navit/navit-graphics-gtk/latest lost dependency on =C2=A0imlib2<br>
navit/navit-graphics-sdl/latest lost dependency on =C2=A0eglibc freetype li=
bjpeg-turbo liblzma libpng libsdl libsdl-image tiff tslib zlib<br>
opencv/libopencv-highgui/latest lost dependency on =C2=A0jasper libdc1394<b=
r>
oscam/oscam/latest lost dependency on =C2=A0pcsc-lite-lib<br>
piglit/piglit/latest lost dependency on =C2=A0libxrender<br>
protobuf/protobuf/latest lost dependency on =C2=A0zlib<br>
python-efl/python-edje/latest lost dependency on =C2=A0edje eglibc eina lib=
python2<br>
python-efl/python-elementary/latest lost dependency on =C2=A0eglibc eina el=
ementary evas libpython2<br>
qtbase/qtbase-plugins/latest lost dependency on =C2=A0libxcb-render xcb-uti=
l-renderutil<br>
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

tracker/tracker-nautilus-extension/latest lost dependency on =C2=A0atk cair=
o eglibc expat fontconfig freetype gdk-pixbuf glib-2.0 gtk+ harfbuzz libffi=
 libpng libsqlite3 libunistring libx11 libxau libxcb libxcb-render libxcb-s=
hm libxdmcp libxext libxrender pango pixman tracker util-linux-libuuid zlib=
<br>

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
4 libraw1394 libsdl-image libusb1 libxinerama libxpm schroedinger taglib ti=
ff xcb-util-keysyms<br>

weston/weston/latest lost dependency on =C2=A0lcms<br>
weston/weston-examples/latest lost dependency on =C2=A0libpoppler-glib<br>
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
perf/perf/latest lost dependency on =C2=A0libunwind<br>
<br>
Found errors:<br>
gst-plugins-bad/gst-plugins-bad-dc1394/latest doesn&#39;t exist<br>
gst-plugins-bad/gst-plugins-bad-dc1394-dev/latest doesn&#39;t exist<br>
gst-plugins-bad/gst-plugins-bad-faac/latest doesn&#39;t exist<br>
gst-plugins-bad/gst-plugins-bad-faac-dev/latest doesn&#39;t exist<br>
gst-plugins-bad/gst-plugins-bad-schro/latest doesn&#39;t exist<br>
gst-plugins-bad/gst-plugins-bad-schro-dev/latest doesn&#39;t exist<br>
libao/libao-plugin-libalsa/latest doesn&#39;t exist<br>
libao/libao-plugin-libalsa-dbg/latest doesn&#39;t exist<br>
libao/libao-plugin-libpulse/latest doesn&#39;t exist<br>
libao/libao-plugin-libpulse-dbg/latest doesn&#39;t exist<br>
<br>
62696.90user 72534.50system 15:04:50elapsed 249%CPU (0avgtext+0avgdata 4476=
160maxresident)k<br>
5358728inputs+23799696outputs (1082major+2565040779minor)pagefaults 0swaps<=
br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
Martin &#39;JaMa&#39; Jansa =C2=A0 =C2=A0 jabber: <a href=3D"mailto:Martin.=
Jansa@gmail.com">Martin.Jansa@gmail.com</a><br>
</font></span><br>--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
<br></blockquote></div><br></div>

--001a11c36bb2d774d604f8c14630--
