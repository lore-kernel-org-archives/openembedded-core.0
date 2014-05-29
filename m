Return-Path: <martin.jansa@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id E79CA6FD15;
	Thu, 29 May 2014 20:46:36 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id z10so142612pdj.34
	for <multiple recipients>; Thu, 29 May 2014 13:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=xgFs6+KRwm+XXCT2NeXQOpzejC5VcPP6E3PVxm60loM=;
	b=OmS7PTQnuwAdNABl/PGoW2w9rUetqflux0Dd1wzZ95ZOZyA8iHwB+HLzjODb3PMji4
	1QxQvcguW2BZcWd3CzZCY4v/xBYrUL35vWPeYaJBBni5daOvjBYxpNPrEf8VuS9VWd4u
	Cgr+21jKqafFt78YrVhYwf9xEiekQAfapm4RPxuqBwyww1A/ie3oCE84bIXA2tw00Unk
	gO+S64sPJgYWpIOHZuX5+c8MqH0iGBY/+oJwli0JUk4fmf/4SBesQwGdd6yZooDZ5QMM
	4uWyTZ9D4wecUV453teG0DlPb2LDonFSubGJwvjW9Ht0ZbAWF7JsqSAiZEO2NguSUCnb
	5B/A==
X-Received: by 10.68.125.164 with SMTP id mr4mr12040219pbb.27.1401396396926;
	Thu, 29 May 2014 13:46:36 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	tu3sm7966858pab.1.2014.05.29.13.46.34 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 May 2014 13:46:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 29 May 2014 22:46:41 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140529204641.GG2426@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, test-dependencies 2014-05-29
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
X-List-Received-Date: Thu, 29 May 2014 20:46:44 -0000
X-Groupsio-MsgNum: 53693
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9/eUdp+dLtKXvemk"
Content-Disposition: inline

--9/eUdp+dLtKXvemk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This time it wasn't "incremental" build so it took 14 days.

Complete logs:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.dependenc=
ies.20140515_124327.log/

I'll look at meta-efl issues, it looks like it undeterministicly links
against lua or lua5.1, I have pending efl upgrade to 1.10 so I'll double ch=
eck it.

Big part of max/min failures is caused by libgsf failing and then this efl =
issue.

max_failed/abiword
max_failed/gnumeric
max_failed/goffice
max_failed/hwlatdetect
max_failed/libgsf
max_failed/libhybris
max_failed/libpostproc
max_failed/packagegroup-shr-feed
max_failed/wv

min_failed/abiword
min_failed/claws-mail
min_failed/claws-plugin-gtkhtml2-viewer
min_failed/claws-plugin-mailmbox
min_failed/claws-plugin-rssyl
min_failed/cpu
min_failed/cups
min_failed/diskio
min_failed/e-tasks
min_failed/e-wm
min_failed/e-wm-config-illume2-shr
min_failed/e-wm-theme-b-and-w
min_failed/e-wm-theme-illume-efenniht
min_failed/e-wm-theme-illume-neo
min_failed/ghostscript
min_failed/gnumeric
min_failed/goffice
min_failed/hwlatdetect
min_failed/libgsf
min_failed/libhybris
min_failed/liboauth
min_failed/libpostproc
min_failed/mesa
min_failed/mesa-demos
min_failed/mesa-glut
min_failed/packagegroup-shr-feed
min_failed/pidgin
min_failed/rtorrent
min_failed/wv
min_failed/xwd

Found differences:=20
ccid/ccid/latest lost dependency on  flex
consolekit/consolekit/latest lost dependency on  polkit
directfb/directfb/latest lost dependency on  libdrm libdrm-kms liblzma tiff
engrave/engrave/latest lost dependency on  flex
epiphany/epiphany/latest lost dependency on  libavahi-client libavahi-commo=
n libavahi-gobject libnotify
expedite/expedite/latest lost dependency on  libsdl
flashrom/flashrom/latest lost dependency on  libftdi
gammu/gammu/latest lost dependency on  glib-2.0 libgudev-1.0
gammu/libgammu/latest lost dependency on  glib-2.0
gd/gd/latest lost dependency on  liblzma tiff
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
gnome-disk-utility/gnome-disk-utility-libs/latest lost dependency on  libca=
p libgcrypt libgnome-keyring libgpg-error
gnome-panel/gnome-panel/latest lost dependency on  dbus-lib
gnutls/gnutls-bin/latest lost dependency on  libidn
guile/guile/latest lost dependency on  libgc ncurses-libncurses readline
libarchive/libarchive/latest lost dependency on  nettle
libarchive/libarchive-bin/latest lost dependency on  libxml2 nettle
libmicrohttpd/libmicrohttpd-bin/latest lost dependency on  file
libssh/libssh/latest lost dependency on  krb5
libungif/libungif/latest lost dependency on  libice libsm libx11 libxau lib=
xcb libxdmcp util-linux-libuuid
libungif/libungif-utils/latest lost dependency on  libx11
ltrace/ltrace/latest lost dependency on  libunwind
midori/midori/latest lost dependency on  libxscrnsaver
mpd/mpd/latest lost dependency on  fluidsynth libao libcdio libcdio-cdda li=
bcdio-paranoia libjack libmms libmodplug libopus libwrap mpg123 openal-soft=
 wavpack yajl
mpeg2dec/mpeg2dec/latest lost dependency on  libx11 libxext libxv
mpg123/mpg123/latest lost dependency on  audiofile esound libjack libsdl op=
enal-soft portaudio-v19 tslib
opencv/libopencv-highgui/latest lost dependency on  jasper libdc1394
oscam/oscam/latest lost dependency on  pcsc-lite-lib
piglit/piglit/latest lost dependency on  libxrender
protobuf/protobuf/latest lost dependency on  zlib
python/python-tkinter/latest lost dependency on  eglibc libpython2 libx11 t=
cl-lib
python3/python3-tkinter/latest lost dependency on  eglibc libpython3 tcl-lib
samba/libnetapi/latest lost dependency on  talloc
samba/libnss-winbind/latest lost dependency on  talloc
samba/libsmbclient/latest lost dependency on  talloc
samba/samba/latest lost dependency on  talloc
samba/swat/latest lost dependency on  talloc
samba/winbind/latest lost dependency on  talloc
stunnel/stunnel/latest lost dependency on  libwrap zlib
synergy/synergy/latest lost dependency on  libxinerama
tracker/tracker/latest lost dependency on  dbus-glib enca gmp gnutls gtk+3 =
libgee libgudev-1.0 libnmglib libnmutil libudev libunistring nettle upower
tracker/tracker-dev/latest lost dependency on  cairo enca expat fontconfig =
freetype giflib gstreamer lcms libgstpbutils-0.10 libgsttag-0.10 liblzma li=
bpoppler libpoppler-glib libunistring libx11 libxau libxcb libxcb-render li=
bxcb-shm libxdmcp libxext libxrender pixman taglib taglib-c tiff
tracker/tracker-nautilus-extension/latest lost dependency on  atk cairo egl=
ibc expat fontconfig freetype gdk-pixbuf glib-2.0 gtk+ harfbuzz libffi libp=
ng libsqlite3 libunistring libx11 libxau libxcb libxcb-render libxcb-shm li=
bxdmcp libxext libxrender pango pixman tracker util-linux-libuuid zlib
tumbler/tumbler/latest lost dependency on  gstreamer1.0 libgsttag-1.0
vagalume/vagalume/latest lost dependency on  libproxy
weston/weston/latest lost dependency on  lcms
weston/weston-examples/latest lost dependency on  libpoppler-glib
wvstreams/wvstreams/latest lost dependency on  dbus-lib libwvstreams-base r=
eadline
xserver-xorg/xserver-xorg/latest lost dependency on  libunwind nettle
xserver-xorg/xserver-xorg-xvfb/latest lost dependency on  libunwind nettle
zile/zile/latest lost dependency on  bdwgc
perf/perf/latest lost dependency on  libunwind

QA issues:
libgcrypt-1.6.1: ELF binary '/home/jenkins/oe/shr-core-branches/shr-core/tm=
p-eglibc/work/armv5te-oe-linux-gnueabi/libgcrypt/1.6.1-r0/packages-split/li=
bgcrypt/usr/lib/libgcrypt.so.20.0.1' has relocations in .text
liblockfile-1.09: liblockfile: configure was passed unrecognised options: -=
-enable-static
cairomm-1.10.0: cairomm: configure was passed unrecognised options: --disab=
le-egl --enable-tee --with-x --disable-glesv2 --disable-valgrind --disable-=
some-floating-point
libxaw-1.0.10: libxaw: configure was passed unrecognised options: --disable=
-docs
libav-0.8.9: ELF binary '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eg=
libc/work/armv5te-oe-linux-gnueabi/libav/0.8.9-r0/packages-split/libswscale=
/usr/lib/libswscale.so.2.1.0' has relocations in .text
libav-0.8.9: ELF binary '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eg=
libc/work/armv5te-oe-linux-gnueabi/libav/0.8.9-r0/packages-split/libpostpro=
c/usr/lib/libpostproc.so.52.0.0' has relocations in .text
libav-0.8.9: ELF binary '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eg=
libc/work/armv5te-oe-linux-gnueabi/libav/0.8.9-r0/packages-split/libavutil/=
usr/lib/libavutil.so.51.22.1' has relocations in .text
libav-0.8.9: ELF binary '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eg=
libc/work/armv5te-oe-linux-gnueabi/libav/0.8.9-r0/packages-split/libavforma=
t/usr/lib/libavformat.so.53.21.1' has relocations in .text
libav-0.8.9: ELF binary '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eg=
libc/work/armv5te-oe-linux-gnueabi/libav/0.8.9-r0/packages-split/libavfilte=
r/usr/lib/libavfilter.so.2.15.0' has relocations in .text
libav-0.8.9: ELF binary '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eg=
libc/work/armv5te-oe-linux-gnueabi/libav/0.8.9-r0/packages-split/libavdevic=
e/usr/lib/libavdevice.so.53.2.0' has relocations in .text
libav-0.8.9: ELF binary '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eg=
libc/work/armv5te-oe-linux-gnueabi/libav/0.8.9-r0/packages-split/libavcodec=
/usr/lib/libavcodec.so.53.35.0' has relocations in .text
libgsf-1.14.26: libgsf: configure was passed unrecognised options: --withou=
t-python --without-gnome-vfs --without-bonobo
openobex-1.5: openobex: configure was passed unrecognised options: --with-u=
sb --with-bluez
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: evolution-data-server: c=
onfigure was passed unrecognised options: --with-dbus --without-bug-buddy -=
-without-weather --disable-uoa --with-soup
claws-mail-3.9.0: claws-mail: configure was passed unrecognised options: --=
disable-gnomeprint --disable-clamav-plugin --disable-aspell-test --enable-a=
spell
imagemagick-6.8.8: imagemagick: configure was passed unrecognised options: =
--without-jp2
fuse-2.9.3: fuse: configure was passed unrecognised options: --disable-kern=
el-module
gypsy-0.9: gypsy: configure was passed unrecognised options: --with-distro
metacity-2.34.13: metacity: configure was passed unrecognised options: --di=
sable-verbose
polkit-gnome-0.102: polkit-gnome: configure was passed unrecognised options=
: --disable-scrollkeeper --disable-man-pages
gnome-settings-daemon-2.32.1: gnome-settings-daemon: configure was passed u=
nrecognised options: --disable-esd
qwt-6.0.1: File '/usr/lib/libqwt.so.6.0.1' from qwt was already stripped, t=
his will prevent future debugging!
qwt-6.0.1: File '/usr/lib/libqwtmathml.so.6.0.1' from qwt was already strip=
ped, this will prevent future debugging!
qwt-6.0.1: File '/usr/lib/qt4/plugins/designer/libqwt_designer_plugin.so' f=
rom qwt was already stripped, this will prevent future debugging!
links-x11-2.7: links-x11: configure was passed unrecognised options: --enab=
le-javascript --with-libfl --without-sdl
sylpheed-2.7.1: sylpheed: configure was passed unrecognised options: --enab=
le-gnutls
expedite-1.7.9: expedite: configure was passed unrecognised options: --disa=
ble-software-16-ddraw --disable-software-sdl --disable-opengl-glew
oscam-1.10+9164: File '/usr/bin/oscam' from oscam was already stripped, thi=
s will prevent future debugging!
links-2.7: links: configure was passed unrecognised options: --enable-javas=
cript --with-libfl --without-sdl
gnome-themes-2.32.1: gnome-themes: configure was passed unrecognised option=
s: --disable-hicolor-check
start-stop-daemon-1.16.0.2: start-stop-daemon: configure was passed unrecog=
nised options: --without-deselect
openbox-3.5.0: openbox: configure was passed unrecognised options: --with-p=
lugins
gstreamer1.0-libav-1.2.4: ELF binary '/home/jenkins/oe/shr-core-branches/sh=
r-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gstreamer1.0-libav/1.2.4-r0=
/packages-split/gstreamer1.0-libav/usr/lib/gstreamer-1.0/libgstlibav.so' ha=
s relocations in .text
owfs-2.9p1: owfs: configure was passed unrecognised options: --enable-cache=
 --enable-mt
vsftpd-3.0.0: vsftpd: Files/directories were installed but not shipped
  /run
  /run/vsftpd
  /run/vsftpd/empty
gst-fluendo-mpegdemux-0.10.72: gst-fluendo-mpegdemux: configure was passed =
unrecognised options: --disable-debug
talloc-2.0.1: talloc: Files/directories were installed but not shipped
  /usr/bin
libmicrohttpd-0.9.34: libmicrohttpd: configure was passed unrecognised opti=
ons: --enable-gnutls
bluez5-5.18: bluez5: configure was passed unrecognised options: --with-syst=
emdunitdir

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9/eUdp+dLtKXvemk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlOHnLEACgkQN1Ujt2V2gBwc7QCdFr42RRl0hgqiYr09+ksqa50h
OlkAnRDKPkZ8xXN3LFKgc5cIJkfgDBpO
=gjtj
-----END PGP SIGNATURE-----

--9/eUdp+dLtKXvemk--
