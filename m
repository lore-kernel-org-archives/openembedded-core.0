Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 1613B612D1;
	Thu,  3 Oct 2013 15:27:57 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id o10so1171044eaj.41
	for <multiple recipients>; Thu, 03 Oct 2013 08:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=CfedvjK5ejg4cGCoIBCZGOKX/QuynX5gb7gGwBmPnnw=;
	b=J1qZc0ILmNPQ+CUXPvS3Jst6USMgqrrp2T5cq6JDKZ7p6PirfFadK/t/msSODGtekZ
	/gBGcdiQqaqP5kmiN5x34wUBFgPaViWm3wMHUk1QfOEQxGTMVScOJ6WLa/g2Pjjovlzm
	Y/SLTp2sZzwx//dOTtvbsgC7SJ7GeNfGwyrEmxogbtLhQ/CbXX+C0lzfS+dqlT+h1+uF
	ar7TZnjV7pAOjXuWqr4AH7nydYBQQoWpN/gC92kEG800CM+mzrZSjEZOOGgf9uHdmVtv
	BRNvSEk5GXS4x08qziIl/toUe367oU6deMC28pZ9gvkPqcmn1HK6wVwIqCVfuqmaWX4T
	leSA==
X-Received: by 10.14.180.73 with SMTP id i49mr4301184eem.55.1380814079118;
	Thu, 03 Oct 2013 08:27:59 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n48sm16969750eeg.17.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 03 Oct 2013 08:27:57 -0700 (PDT)
Date: Thu, 3 Oct 2013 17:28:02 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Message-ID: <20131003152802.GB6240@jama>
References: <20130502151833.GC3206@jama>
	<20130516075215.GA24809@jama.dyndns-home.com>
	<20130520130635.GA32431@jama> <20130603151008.GC3279@jama>
	<20130611160434.GI3233@jama> <20130622181656.GK14021@jama>
	<20130725162341.GA3280@jama> <20130808225419.GB17945@jama>
	<20130811114403.GG17945@jama> <20130917123058.GC7313@jama>
MIME-Version: 1.0
In-Reply-To: <20130917123058.GC7313@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: State of bitbake world - test-dependencies
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
X-List-Received-Date: Thu, 03 Oct 2013 15:28:00 -0000
X-Groupsio-MsgNum: 45563
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2B/JsCI69OhZNC5r"
Content-Disposition: inline

--2B/JsCI69OhZNC5r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2013 at 02:30:58PM +0200, Martin Jansa wrote:
> On Sun, Aug 11, 2013 at 01:44:03PM +0200, Martin Jansa wrote:
>=20
> I haven't updated this status for few weeks because there were always
> some issue deeper in the dependency tree so it was hiding a lot of other
> issues, now it's good time to update all qemu* statuses. All these
> builds had both my dependency-fixes patchsets included.
>=20
> qemuarm: Summary: 5 tasks failed:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2=
0130915_024550.log
>=20
> qemux86: Summary: 10 tasks failed:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2=
0130915_190536.log
>=20
> qemux86-64: Summary: 14 tasks failed:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2=
0130916_160509.log
>=20
> common (4):
>   meta-openembedded/meta-oe/recipes-navigation/monav/monav_0.3.bb, do_com=
pile
>   meta-openembedded/meta-oe/recipes-connectivity/daq/daq_2.0.1.bb, do_ins=
tall
>   meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_compile
>   meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb,=
 do_compile
>=20
> qemuarm (1):
>   openembedded-core/meta/recipes-gnome/gtk+/gtk+_2.24.20.bb, do_compile
>=20
> qemux86* common (5):
>   openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package
>   meta-openembedded/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-=
kexecboot_3.8.bb, do_package
>   meta-openembedded/meta-oe/recipes-support/ode/ode_0.9.bb, do_configure
>   meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_compi=
le
>   meta-openembedded/meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11.bb,=
 do_compile
>=20
> qemux86 (1):
>   meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode=
_2.11.14.bb, do_compile
>=20
> qemux86-64 (5):
>   meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
>   meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libimob=
iledevice_1.1.4.bb, do_configure
>   meta-openembedded/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.=
bb, do_compile
>   meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_g=
it.bb, do_compile
>   meta-openembedded/meta-oe/recipes-devtools/python/python-m2crypto_0.21.=
1.bb, do_compile
>=20
> QA (incomplete because many recipes were reused from sstate):
> qwt-6.0.1: File '/usr/lib/libqwt.so.6.0.1' from qwt was already stripped,=
 this will prevent future debugging!
> qwt-6.0.1: File '/usr/lib/libqwtmathml.so.6.0.1' from qwt was already str=
ipped, this will prevent future debugging!
> qwt-6.0.1: File '/usr/lib/qt4/plugins/designer/libqwt_designer_plugin.so'=
 from qwt was already stripped, this will prevent future debugging!
> qtwebkit-5.1.0: package qtwebkit contains bad RPATH /home/jenkins/oe/shr-=
core-branches/shr-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.0-r0/bu=
ild/lib in file /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work=
/x86_64-oe-linux/qtwebkit/5.1.0-r0/packages-split/qtwebkit/usr/lib/qt5/libe=
xec/QtWebPluginProcess
> qtwebkit-5.1.0: package qtwebkit contains bad RPATH /home/jenkins/oe/shr-=
core-branches/shr-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.0-r0/bu=
ild/lib in file /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work=
/x86_64-oe-linux/qtwebkit/5.1.0-r0/packages-split/qtwebkit/usr/lib/qt5/libe=
xec/QtWebProcess
> ed-1.9: The /usr/share/info/dir file is not meant to be shipped in a part=
icular package.
> qt-creator-2.8.1: qt-creator: found library in wrong location: /usr/share=
/qtcreator/qbs/lib/qbs/plugins/libqbs_qt_scanner.so
> qt-creator: found library in wrong location: /usr/share/qtcreator/qbs/lib=
/qbs/plugins/libqbs_cpp_scanner.so
> qt-creator-dbg: found library in wrong location: /usr/share/qtcreator/qbs=
/lib/qbs/plugins/.debug/libqbs_cpp_scanner.so
> qt-creator-dbg: found library in wrong location: /usr/share/qtcreator/qbs=
/lib/qbs/plugins/.debug/libqbs_qt_scanner.so
> oscam-1.10+7974: File '/usr/bin/oscam' from oscam was already stripped, t=
his will prevent future debugging!
> aurora-daemon-0.1+gitrAUTOINC+b65354ad6c: aurora-daemon: found library in=
 wrong location: /usr/share/aurora/applications/settings/libaurora-app-sett=
ings.so
> wxpython-2.9.5.0: wxpython: Files/directories were installed but not ship=
ped
>   /home
>   /home/jenkins
>   /home/jenkins/oe
>   /home/jenkins/oe/shr-core-branches
>   /home/jenkins/oe/shr-core-branches/shr-core
>   /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc
> chromium-29.0.1518.2: chromium: found library in wrong location: /usr/bin=
/chrome/libffmpegsumo.so
> chromium-dbg: found library in wrong location: /usr/bin/chrome/.debug/lib=
ffmpegsumo.so
> lzip-1.14: The /usr/share/info/dir file is not meant to be shipped in a p=
articular package.
> atftp-0.7.1+gitAUTOINC+be3291a18c: atftp: Files/directories were installe=
d but not shipped
>   /etc
> tracker-0.14.2: tracker: Files/directories were installed but not shipped
>   /usr/lib/tracker-0.14/writeback-modules/libwriteback-taglib.so
>   /usr/lib/tracker-0.14/writeback-modules/libwriteback-taglib.la

This time longer log from very long test-dependencies.sh build (took 11days)

This build has all dependency fixes from my 2 WIP patchsets.

Complete logs are here:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30921_185909.log/

Found differences:=20
WARN: packages/armv5te-oe-linux-gnueabi/consolekit/consolekit/latest lost d=
ependency on  polkit
WARN: packages/armv5te-oe-linux-gnueabi/daq/daq/latest lost dependency on  =
libdnet libmnl libnetfilter-queue libnfnetlink
WARN: packages/armv5te-oe-linux-gnueabi/epiphany/epiphany/latest lost depen=
dency on  libnotify
WARN: packages/armv5te-oe-linux-gnueabi/expedite/expedite/latest lost depen=
dency on  libsdl
WARN: packages/armv5te-oe-linux-gnueabi/fbida/fbida/latest lost dependency =
on  libx11 libxext libxpm libxt openmotif
WARN: packages/armv5te-oe-linux-gnueabi/flashrom/flashrom/latest lost depen=
dency on  libftdi
WARN: packages/armv5te-oe-linux-gnueabi/gammu/gammu/latest lost dependency =
on  libgudev-1.0
WARN: packages/armv5te-oe-linux-gnueabi/gimp/gimp/latest lost dependency on=
  libxmu
WARN: packages/armv5te-oe-linux-gnueabi/glade3/glade3/latest lost dependenc=
y on  dbus-glib dbus-lib gconf gnome-vfs libart-lgpl libavahi-client libava=
hi-common libavahi-glib libbonobo libbonoboui libcanberra libcap libgcrypt =
libgnome libgnome-keyring libgnomecanvas libgnomeui libgpg-error libice lib=
ltdl libogg libsm libvorbis libxcomposite libxcursor libxdamage libxfixes l=
ibxrandr orbit2 popt util-linux-libuuid
WARN: packages/armv5te-oe-linux-gnueabi/gmtk/gmtk/latest lost dependency on=
  cairo-gobject dbus-lib gtk+3 libcap libice libjson libpulse libpulse-main=
loop-glib libpulsecommon libsm libsndfile1 libx11-xcb libxi libxtst util-li=
nux-libuuid
WARN: packages/armv5te-oe-linux-gnueabi/gnome-mplayer/gnome-mplayer-nautilu=
s-extension/latest lost dependency on  eglibc glib-2.0 gtk+
WARN: packages/armv5te-oe-linux-gnueabi/gnome-panel/gnome-panel/latest lost=
 dependency on  dbus-lib
WARN: packages/armv5te-oe-linux-gnueabi/gnuradio/gnuradio/latest lost depen=
dency on  libpython3
WARN: packages/armv5te-oe-linux-gnueabi/gst-plugins-good/gst-plugins-good-x=
imagesrc/latest lost dependency on  libxdamage
WARN: packages/armv5te-oe-linux-gnueabi/gstreamer1.0-plugins-bad/gstreamer1=
=2E0-plugins-bad-meta/latest lost dependency on  gstreamer1.0-plugins-bad-f=
luidsynthmidi gstreamer1.0-plugins-bad-openal
WARN: packages/armv5te-oe-linux-gnueabi/gstreamer1.0-plugins-good/gstreamer=
1.0-plugins-good-ximagesrc/latest lost dependency on  libxdamage
WARN: packages/armv5te-oe-linux-gnueabi/guile/guile/latest lost dependency =
on  ncurses-libncurses readline
WARN: packages/armv5te-oe-linux-gnueabi/libhybris/libhybris/latest lost dep=
endency on  libegl-mesa libgles2-mesa
WARN: packages/armv5te-oe-linux-gnueabi/libmatchbox/libmatchbox/latest lost=
 dependency on  libpng12
WARN: packages/armv5te-oe-linux-gnueabi/libungif/libungif/latest lost depen=
dency on  libice libsm util-linux-libuuid
WARN: packages/armv5te-oe-linux-gnueabi/libxfce4ui/libxfce4ui/latest lost d=
ependency on  cairo-gobject gtk+3
WARN: packages/armv5te-oe-linux-gnueabi/maliit-framework/maliit-framework-g=
tk/latest lost dependency on  gtk+
WARN: packages/armv5te-oe-linux-gnueabi/midori/midori/latest lost dependenc=
y on  libxscrnsaver
WARN: packages/armv5te-oe-linux-gnueabi/mpd/mpd/latest lost dependency on  =
libao yajl
WARN: packages/armv5te-oe-linux-gnueabi/mpeg2dec/mpeg2dec/latest lost depen=
dency on  libx11 libxext libxv
WARN: packages/armv5te-oe-linux-gnueabi/mpg123/mpg123/latest lost dependenc=
y on  audiofile esound libjack libsdl openal-soft portaudio-v19 tslib
WARN: packages/armv5te-oe-linux-gnueabi/mplayer2/mplayer2/latest lost depen=
dency on  libxxf86dga
WARN: packages/armv5te-oe-linux-gnueabi/navit/navit/latest lost dependency =
on  fribidi
WARN: packages/armv5te-oe-linux-gnueabi/navit/navit-graphics-gtk/latest los=
t dependency on  imlib2
WARN: packages/armv5te-oe-linux-gnueabi/navit/navit-graphics-sdl/latest los=
t dependency on  eglibc freetype libjpeg-turbo liblzma libpng libsdl libsdl=
-image tiff tslib zlib
WARN: packages/armv5te-oe-linux-gnueabi/opencv/libopencv-highgui/latest los=
t dependency on  jasper
WARN: packages/armv5te-oe-linux-gnueabi/protobuf/protobuf/latest lost depen=
dency on  zlib
WARN: packages/armv5te-oe-linux-gnueabi/python/python-tkinter/latest lost d=
ependency on  eglibc libpython2 libx11
WARN: packages/armv5te-oe-linux-gnueabi/python3/python3-tkinter/latest lost=
 dependency on  eglibc libpython3
WARN: packages/armv5te-oe-linux-gnueabi/qemu/qemu/latest lost dependency on=
  cairo gdk-pixbuf gnutls gtk+ libvte
WARN: packages/armv5te-oe-linux-gnueabi/qtbase/qtbase-plugins/latest lost d=
ependency on  libxcb-render libxkbcommon xcb-util-renderutil
WARN: packages/armv5te-oe-linux-gnueabi/qtjsondb/qtjsondb/latest lost depen=
dency on  libedit
WARN: packages/armv5te-oe-linux-gnueabi/qtlocation/qtlocation-plugins/lates=
t lost dependency on  gconf glib-2.0 gypsy
WARN: packages/armv5te-oe-linux-gnueabi/qtwebkit/qtwebkit/latest lost depen=
dency on  gstreamer1.0 libgstapp-1.0 libgstaudio-1.0 libgstpbutils-1.0 libg=
stvideo-1.0
WARN: packages/armv5te-oe-linux-gnueabi/snort/snort/latest lost dependency =
on  libcrypto
WARN: packages/armv5te-oe-linux-gnueabi/sox/sox/latest lost dependency on  =
libao
WARN: packages/armv5te-oe-linux-gnueabi/stunnel/stunnel/latest lost depende=
ncy on  libwrap zlib
WARN: packages/armv5te-oe-linux-gnueabi/synergy/synergy/latest lost depende=
ncy on  libxinerama
WARN: packages/armv5te-oe-linux-gnueabi/tracker/tracker/latest lost depende=
ncy on  dbus-glib enca gnutls gtk+3 libgee libgudev-1.0 liblzma libnmglib l=
ibnmutil libtasn1 libudev libunistring tiff
WARN: packages/armv5te-oe-linux-gnueabi/tracker/tracker-nautilus-extension/=
latest lost dependency on  libunistring
WARN: packages/armv5te-oe-linux-gnueabi/tumbler/tumbler/latest lost depende=
ncy on  libbz2 libgsf libxml2
WARN: packages/armv5te-oe-linux-gnueabi/weston/weston-examples/latest lost =
dependency on  libpoppler-glib
WARN: packages/armv5te-oe-linux-gnueabi/wv/wv/latest lost dependency on  li=
bpng

Found errors:=20
ERROR: test-dependencies/1379789967/3_min/packages/armv5te-oe-linux-gnueabi=
/evas/evas-engine-gl-x11/latest doesn't exist
ERROR: test-dependencies/1379789967/3_min/packages/armv5te-oe-linux-gnueabi=
/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-fluidsynthmidi/latest do=
esn't exist
ERROR: test-dependencies/1379789967/3_min/packages/armv5te-oe-linux-gnueabi=
/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-fluidsynthmidi-dev/lates=
t doesn't exist
ERROR: test-dependencies/1379789967/3_min/packages/armv5te-oe-linux-gnueabi=
/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-openal/latest doesn't ex=
ist
ERROR: test-dependencies/1379789967/3_min/packages/armv5te-oe-linux-gnueabi=
/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-openal-dev/latest doesn'=
t exist
ERROR: test-dependencies/1379789967/3_min/packages/armv5te-oe-linux-gnueabi=
/qemu/qemu-locale-de-de/latest doesn't exist
ERROR: test-dependencies/1379789967/3_min/packages/armv5te-oe-linux-gnueabi=
/qemu/qemu-locale-fr-fr/latest doesn't exist
ERROR: test-dependencies/1379789967/3_min/packages/armv5te-oe-linux-gnueabi=
/qemu/qemu-locale-it/latest doesn't exist
ERROR: test-dependencies/1379789967/3_min/packages/armv5te-oe-linux-gnueabi=
/qemu/qemu-locale-tr/latest doesn't exist
ERROR: test-dependencies/1379789967/3_min/packages/armv5te-oe-linux-gnueabi=
/qt4-embedded/qt4-embedded-plugin-sqldriver-sqlite2/latest doesn't exist
ERROR: test-dependencies/1379789967/3_min/packages/armv5te-oe-linux-gnueabi=
/qt4-embedded/qt4-embedded-plugin-sqldriver-sqlite2-dbg/latest doesn't exist
ERROR: test-dependencies/1379789967/3_min/packages/armv5te-oe-linux-gnueabi=
/qt4-x11-free/qt4-plugin-sqldriver-sqlite2/latest doesn't exist
ERROR: test-dependencies/1379789967/3_min/packages/armv5te-oe-linux-gnueabi=
/qt4-x11-free/qt4-plugin-sqldriver-sqlite2-dbg/latest doesn't exist

24 recipes failed in "maximal" build
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30921_185909.log/max_failed/
packagegroup-shr-feed                              24-Sep-2013 19:10       =
        93386
packagekit                                         24-Sep-2013 19:31       =
       539619
u-boot-fw-utils                                    25-Sep-2013 20:17       =
         7312
vlc                                                25-Sep-2013 22:05       =
       378643
webkit-gtk                                         25-Sep-2013 23:39       =
         7625
xbmc                                               26-Sep-2013 00:47       =
       312834
xserver-xorg                                       26-Sep-2013 06:27       =
      2330676
xterm                                              26-Sep-2013 06:35       =
        26082
xtrans                                             26-Sep-2013 06:37       =
        10718
xtscal                                             26-Sep-2013 06:38       =
         7567
xvideo-tests                                       26-Sep-2013 06:40       =
         7576
xvinfo                                             26-Sep-2013 06:41       =
         9256
xwininfo                                           26-Sep-2013 06:42       =
         7572
yasm                                               26-Sep-2013 06:45       =
         7948
yavta                                              26-Sep-2013 06:46       =
         7993
yp-tools                                           26-Sep-2013 06:47       =
         8029
ypbind-mt                                          26-Sep-2013 06:48       =
         8039
zaurusd                                            26-Sep-2013 06:49       =
         9274
zenity                                             26-Sep-2013 06:50       =
         8035
zeroconf                                           26-Sep-2013 06:51       =
         6124
zhone                                              26-Sep-2013 06:53       =
         7589
znc                                                26-Sep-2013 06:56       =
         7963
zram                                               26-Sep-2013 06:57       =
         7953
zsh                                                26-Sep-2013 06:58       =
         7956

21 recipes failed in "minimal" build
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30921_185909.log/min_failed/
abootimg                                           26-Sep-2013 07:41       =
        79111
android-tools                                      26-Sep-2013 09:10       =
        99764
apache2                                            26-Sep-2013 09:26       =
       144734
devicekit-power                                    26-Sep-2013 21:55       =
       428916
evopedia                                           27-Sep-2013 09:39       =
       588170
gcr                                                28-Sep-2013 05:16       =
       798971
mousepad                                           30-Sep-2013 11:27       =
       303040
packagegroup-shr-feed                              01-Oct-2013 04:14       =
      1501825
packagekit                                         01-Oct-2013 05:27       =
       888605
qt-mobility-embedded                               01-Oct-2013 20:41       =
      1465043
qtquick1                                           02-Oct-2013 01:51       =
       548471
qtwayland-native                                   02-Oct-2013 03:06       =
        35388
u-boot-fw-utils                                    02-Oct-2013 19:15       =
       126723
vlc                                                02-Oct-2013 22:03       =
       862957
xbmc                                               03-Oct-2013 01:43       =
       779208
xdebug                                             03-Oct-2013 02:34       =
       209219
xfce4-icon-theme                                   03-Oct-2013 06:22       =
       264459
xfce4-settings                                     03-Oct-2013 08:06       =
       364304
xfce4-weather-plugin                               03-Oct-2013 08:52       =
       525205
xfce4-xkb-plugin                                   03-Oct-2013 08:59       =
       377215
xfwm4                                              03-Oct-2013 09:41       =
       363532

Next build will be testing only these 88 recipes with issues detected:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30921_185909.log/failed.recipes
so it should take only few hours instead of 11days needed to test 1660 reci=
pes.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2B/JsCI69OhZNC5r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlJNjQIACgkQN1Ujt2V2gByxWACdGJzAMMORiXMMaw6bm9jRbFuX
MvMAn0BhewjejkyeQCNVzDYNLUcoj5mu
=WgMy
-----END PGP SIGNATURE-----

--2B/JsCI69OhZNC5r--
