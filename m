Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 14C3D65D05;
	Fri, 25 Apr 2014 01:00:00 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id c13so2322360eek.24
	for <multiple recipients>; Thu, 24 Apr 2014 18:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5eRRPDej8yyG4ejQu9FuD1TTO3fM9c/Yi40juI56I4w=;
	b=IuNzHb/PKG9TjpUBZnz4zJFwlrP/En55Yz20Mspa7M1+d1SoYwD6vLtYaHCEq9XVYS
	W0ejDmVYyZFJf85A8FQFAcGJygJ1nP9JU9Trl8L73pgwJh21hsXYF0W58HBOqCtf3rwI
	6DFD7RkMmOh6Zos4v5MlBN7fT9abIMaLpXohDlViZE1imptCo8P0MDbmgwin/AdLeppW
	SiM9z9ETpmmkssrHAzMRH3ekbgipmwKUfrKUvNW0dGxCZFQMQUv/ciqyM0QcCq1sFSvz
	v04z+pUS/dh+nmtpQVPVQmDiCd9/qX2kK3yXUyVTNbpDsZpvFeSjtWAKGg1U4O7+iFnd
	IxSQ==
X-Received: by 10.15.31.70 with SMTP id x46mr6025807eeu.26.1398387601053;
	Thu, 24 Apr 2014 18:00:01 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	h47sm20388033eey.13.2014.04.24.17.59.59 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Apr 2014 17:59:59 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 25 Apr 2014 03:00:09 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140425010009.GN2486@jama>
References: <20140418183632.GG2486@jama>
MIME-Version: 1.0
In-Reply-To: <20140418183632.GG2486@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, test-dependencies 2014-04-25
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
X-List-Received-Date: Fri, 25 Apr 2014 01:00:04 -0000
X-Groupsio-MsgNum: 52588
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tSYSuzF6Gv/xq7Ry"
Content-Disposition: inline

--tSYSuzF6Gv/xq7Ry
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2014 at 08:36:32PM +0200, Martin Jansa wrote:
> On Thu, Apr 03, 2014 at 03:06:09PM +0200, Martin Jansa wrote:
> > I've just started this long test-dependencies build so jenkins will be =
busy
> > for next 14 days or so, but I'll send complete qa.log in advance as soo=
n as
> > it finishes building world from scratch.

This one is only "incremental" (so testing only recipes which failed in
previous run) and it took only 3,5 days to finish :).

Mostly because of firefox (libnotify) and efl/lua fix we're down to 72 reci=
pes with
issues (instead of 187 found in previous run or 100 w/o firefox*)

Complete logs:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
40421_140718.log/
=20
Interesting parts, (mostly) missing dependencies:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
40421_140718.log/min_failed/

Found differences:=20
abiword/abiword/latest lost dependency on  dbus-glib dbus-lib gconf libcame=
l libebook libecal libedataserver libical libsoup-2.4 libsqlite3 nspr nss
abiword/abiword-plugin-applix/latest lost dependency on  dbus-glib dbus-lib=
 gconf libcamel libebook libecal libedataserver libical libsoup-2.4 libsqli=
te3 nspr nss
abiword/abiword-plugin-babelfish/latest lost dependency on  dbus-glib dbus-=
lib gconf libcamel libebook libecal libedataserver libical libsoup-2.4 libs=
qlite3 nspr nss
abiword/abiword-plugin-bmp/latest lost dependency on  dbus-glib dbus-lib gc=
onf libcamel libebook libecal libedataserver libical libsoup-2.4 libsqlite3=
 nspr nss
abiword/abiword-plugin-clarisworks/latest lost dependency on  dbus-glib dbu=
s-lib gconf libcamel libebook libecal libedataserver libical libsoup-2.4 li=
bsqlite3 nspr nss
abiword/abiword-plugin-collab/latest lost dependency on  dbus-glib dbus-lib=
 gconf libcamel libebook libecal libedataserver libical nspr nss
abiword/abiword-plugin-docbook/latest lost dependency on  dbus-glib dbus-li=
b gconf libcamel libebook libecal libedataserver libical libsoup-2.4 libsql=
ite3 nspr nss
abiword/abiword-plugin-eml/latest lost dependency on  dbus-glib dbus-lib gc=
onf libcamel libebook libecal libedataserver libical libsoup-2.4 libsqlite3=
 nspr nss
abiword/abiword-plugin-epub/latest lost dependency on  dbus-glib dbus-lib g=
conf libcamel libebook libecal libedataserver libical libsoup-2.4 libsqlite=
3 nspr nss
abiword/abiword-plugin-freetranslation/latest lost dependency on  dbus-glib=
 dbus-lib gconf libcamel libebook libecal libedataserver libical libsoup-2.=
4 libsqlite3 nspr nss
abiword/abiword-plugin-garble/latest lost dependency on  dbus-glib dbus-lib=
 gconf libcamel libebook libecal libedataserver libical libsoup-2.4 libsqli=
te3 nspr nss
abiword/abiword-plugin-gdict/latest lost dependency on  dbus-glib dbus-lib =
gconf libcamel libebook libecal libedataserver libical libsoup-2.4 libsqlit=
e3 nspr nss
abiword/abiword-plugin-gimp/latest lost dependency on  dbus-glib dbus-lib g=
conf libcamel libebook libecal libedataserver libical libsoup-2.4 libsqlite=
3 nspr nss
abiword/abiword-plugin-google/latest lost dependency on  dbus-glib dbus-lib=
 gconf libcamel libebook libecal libedataserver libical libsoup-2.4 libsqli=
te3 nspr nss
abiword/abiword-plugin-hancom/latest lost dependency on  dbus-glib dbus-lib=
 gconf libcamel libebook libecal libedataserver libical libsoup-2.4 libsqli=
te3 nspr nss
abiword/abiword-plugin-hrtext/latest lost dependency on  dbus-glib dbus-lib=
 gconf libcamel libebook libecal libedataserver libical libsoup-2.4 libsqli=
te3 nspr nss
abiword/abiword-plugin-iscii/latest lost dependency on  dbus-glib dbus-lib =
gconf libcamel libebook libecal libedataserver libical libsoup-2.4 libsqlit=
e3 nspr nss
abiword/abiword-plugin-kword/latest lost dependency on  dbus-glib dbus-lib =
gconf libcamel libebook libecal libedataserver libical libsoup-2.4 libsqlit=
e3 nspr nss
abiword/abiword-plugin-latex/latest lost dependency on  dbus-glib dbus-lib =
gconf libcamel libebook libecal libedataserver libical libsoup-2.4 libsqlit=
e3 nspr nss
abiword/abiword-plugin-loadbindings/latest lost dependency on  dbus-glib db=
us-lib gconf libcamel libebook libecal libedataserver libical libsoup-2.4 l=
ibsqlite3 nspr nss
abiword/abiword-plugin-mathview/latest lost dependency on  dbus-glib dbus-l=
ib gconf libcamel libebook libecal libedataserver libical libsoup-2.4 libsq=
lite3 nspr nss
abiword/abiword-plugin-mht/latest lost dependency on  dbus-glib dbus-lib gc=
onf libcamel libebook libecal libedataserver libical libsoup-2.4 libsqlite3=
 nspr nss
abiword/abiword-plugin-mif/latest lost dependency on  dbus-glib dbus-lib gc=
onf libcamel libebook libecal libedataserver libical libsoup-2.4 libsqlite3=
 nspr nss
abiword/abiword-plugin-mswrite/latest lost dependency on  dbus-glib dbus-li=
b gconf libcamel libebook libecal libedataserver libical libsoup-2.4 libsql=
ite3 nspr nss
abiword/abiword-plugin-opendocument/latest lost dependency on  dbus-glib db=
us-lib gconf libcamel libebook libecal libedataserver libical libsoup-2.4 l=
ibsqlite3 nspr nss
abiword/abiword-plugin-openwriter/latest lost dependency on  dbus-glib dbus=
-lib gconf libcamel libebook libecal libedataserver libical libsoup-2.4 lib=
sqlite3 nspr nss
abiword/abiword-plugin-openxml/latest lost dependency on  dbus-glib dbus-li=
b gconf libcamel libebook libecal libedataserver libical libsoup-2.4 libsql=
ite3 nspr nss
abiword/abiword-plugin-opml/latest lost dependency on  dbus-glib dbus-lib g=
conf libcamel libebook libecal libedataserver libical libsoup-2.4 libsqlite=
3 nspr nss
abiword/abiword-plugin-paint/latest lost dependency on  dbus-glib dbus-lib =
gconf libcamel libebook libecal libedataserver libical libsoup-2.4 libsqlit=
e3 nspr nss
abiword/abiword-plugin-passepartout/latest lost dependency on  dbus-glib db=
us-lib gconf libcamel libebook libecal libedataserver libical libsoup-2.4 l=
ibsqlite3 nspr nss
abiword/abiword-plugin-pdb/latest lost dependency on  dbus-glib dbus-lib gc=
onf libcamel libebook libecal libedataserver libical libsoup-2.4 libsqlite3=
 nspr nss
abiword/abiword-plugin-pdf/latest lost dependency on  dbus-glib dbus-lib gc=
onf libcamel libebook libecal libedataserver libical libsoup-2.4 libsqlite3=
 nspr nss
abiword/abiword-plugin-presentation/latest lost dependency on  dbus-glib db=
us-lib gconf libcamel libebook libecal libedataserver libical libsoup-2.4 l=
ibsqlite3 nspr nss
abiword/abiword-plugin-s5/latest lost dependency on  dbus-glib dbus-lib gco=
nf libcamel libebook libecal libedataserver libical libsoup-2.4 libsqlite3 =
nspr nss
abiword/abiword-plugin-sdw/latest lost dependency on  dbus-glib dbus-lib gc=
onf libcamel libebook libecal libedataserver libical libsoup-2.4 libsqlite3=
 nspr nss
abiword/abiword-plugin-t602/latest lost dependency on  dbus-glib dbus-lib g=
conf libcamel libebook libecal libedataserver libical libsoup-2.4 libsqlite=
3 nspr nss
abiword/abiword-plugin-urldict/latest lost dependency on  dbus-glib dbus-li=
b gconf libcamel libebook libecal libedataserver libical libsoup-2.4 libsql=
ite3 nspr nss
abiword/abiword-plugin-wikipedia/latest lost dependency on  dbus-glib dbus-=
lib gconf libcamel libebook libecal libedataserver libical libsoup-2.4 libs=
qlite3 nspr nss
abiword/abiword-plugin-wml/latest lost dependency on  dbus-glib dbus-lib gc=
onf libcamel libebook libecal libedataserver libical libsoup-2.4 libsqlite3=
 nspr nss
abiword/abiword-plugin-xslfo/latest lost dependency on  dbus-glib dbus-lib =
gconf libcamel libebook libecal libedataserver libical libsoup-2.4 libsqlit=
e3 nspr nss
ccid/ccid/latest lost dependency on  flex
console-tools/console-tools/latest lost dependency on  flex
consolekit/consolekit/latest lost dependency on  polkit
daq/daq/latest lost dependency on  libdnet libmnl libnetfilter-queue libnfn=
etlink
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
guile/guile/latest lost dependency on  ncurses-libncurses readline
libmicrohttpd/libmicrohttpd-bin/latest lost dependency on  file
libungif/libungif/latest lost dependency on  libice libsm libx11 libxau lib=
xcb libxdmcp util-linux-libuuid
libungif/libungif-utils/latest lost dependency on  libx11
midori/midori/latest lost dependency on  libxscrnsaver
mongodb/mongodb/latest lost dependency on  libpcap
mpd/mpd/latest lost dependency on  fluidsynth libao libcdio libcdio-cdda li=
bcdio-paranoia libjack libmms libmodplug libopus mpg123 wavpack yajl
mpeg2dec/mpeg2dec/latest lost dependency on  libx11 libxext libxv
mpg123/mpg123/latest lost dependency on  audiofile esound libjack libsdl po=
rtaudio-v19 tslib
mplayer2/mplayer2/latest lost dependency on  libxscrnsaver mpg123
navit/navit/latest lost dependency on  fribidi
navit/navit-graphics-gtk/latest lost dependency on  imlib2
navit/navit-graphics-sdl/latest lost dependency on  eglibc freetype libjpeg=
-turbo liblzma libpng libsdl libsdl-image tiff tslib zlib
opencv/libopencv-highgui/latest lost dependency on  jasper libdc1394
oscam/oscam/latest lost dependency on  pcsc-lite-lib
piglit/piglit/latest lost dependency on  libxrender
protobuf/protobuf/latest lost dependency on  zlib
python-efl/python-elementary/latest lost dependency on  eglibc eina element=
ary evas libpython2
qtbase/qtbase-plugins/latest lost dependency on  libxcb-render libxkbcommon=
 xcb-util-renderutil
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

515927.92user 522701.44system 81:02:10elapsed 356%CPU (0avgtext+0avgdata 23=
231360maxresident)k
23399208inputs+113987936outputs (6960major+17902036605minor)pagefaults 0swa=
ps
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tSYSuzF6Gv/xq7Ry
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNZs5kACgkQN1Ujt2V2gBzV+QCgu+GtIsPr7MF9c4yO6+TeFUwb
/+gAnR+NJZtNyiZifhGFm5/3eyUT8CBh
=Yz1W
-----END PGP SIGNATURE-----

--tSYSuzF6Gv/xq7Ry--
