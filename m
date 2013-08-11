Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id C2D3661965;
	Sun, 11 Aug 2013 11:43:15 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id e52so2923513eek.16
	for <multiple recipients>; Sun, 11 Aug 2013 04:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Pi8EyzIJ0ew0/C+2w3JlMhjrFwJ9JNOUGZkmg8euYuE=;
	b=QMMzuXqUV8BOAoX6ckmKHAE5MOS/p/wCPBJQf8ytPe7iTdqNiWQ9xR8BenmEupyvTn
	9F0R/N9kVePWht4/Cj7mB3iTP4GCVSS+kSqy1iUQQE+uHWkZ670QRkdsR75OmEVPO9on
	45ManfymaHrjHQKN5sNDYNJcP4JQ/YGyfCmTd7UgW44M5baV3R7eXulmYn/wTokexceT
	hE2RmcCO8ty9ddJR1JCYYYJaLtxOvuxVVah0HD6ideYSIYGe6Tf5qWvHbRaJkc0UdKk1
	xyRAI2uffujhpq8+YvKieyAabFEwWKz9EL0V/2iidy8z2xUfVrohAUaBWRjGyuAQwcdc
	OEkA==
X-Received: by 10.14.210.129 with SMTP id u1mr20692183eeo.68.1376221395734;
	Sun, 11 Aug 2013 04:43:15 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a4sm47547571eez.0.2013.08.11.04.43.14 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 11 Aug 2013 04:43:15 -0700 (PDT)
Date: Sun, 11 Aug 2013 13:44:03 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Message-ID: <20130811114403.GG17945@jama>
References: <20130415141253.GC10628@jama.dyndns-home.com>
	<20130427105400.GB3199@jama> <20130502151833.GC3206@jama>
	<20130516075215.GA24809@jama.dyndns-home.com>
	<20130520130635.GA32431@jama> <20130603151008.GC3279@jama>
	<20130611160434.GI3233@jama> <20130622181656.GK14021@jama>
	<20130725162341.GA3280@jama> <20130808225419.GB17945@jama>
MIME-Version: 1.0
In-Reply-To: <20130808225419.GB17945@jama>
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
X-List-Received-Date: Sun, 11 Aug 2013 11:43:16 -0000
X-Groupsio-MsgNum: 43195
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UKNXkkdQCYZ6W5l3"
Content-Disposition: inline

--UKNXkkdQCYZ6W5l3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 09, 2013 at 12:54:19AM +0200, Martin Jansa wrote:
> On Thu, Jul 25, 2013 at 06:23:41PM +0200, Martin Jansa wrote:
> > On Sat, Jun 22, 2013 at 08:16:56PM +0200, Martin Jansa wrote:
> > > On Tue, Jun 11, 2013 at 06:04:34PM +0200, Martin Jansa wrote:
> > > Last week hero Khem, sent many world fixes, but it seems like some fi=
xes weren't enough
> > > (tk, packagekit are still failing - I hope I haven't missed some othe=
r vN)
> > > qemuarm: Summary: 11 tasks failed:
> > > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.wor=
ld.20130620_105211.log/
> > >=20
> > > qemux86: Summary: 14 tasks failed:
> > > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.wor=
ld.20130621_023143.log/
> > >=20
> > > qemux86_64: Summary: 15 tasks failed:
> > > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.wor=
ld.20130621_181258.log/
> > >=20
> > > common (9):
> > >   openembedded-core/meta/recipes-qt/qt4/qt4-embedded_4.8.4.bb, do_com=
pile
> > >   openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb=
, do_package
> > >   meta-openembedded/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb=
, do_package
> > >   meta-openembedded/meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.=
bb, do_compile
> > >   meta-openembedded/meta-oe/recipes-devtools/packagekit/packagekit_0.=
5.6.bb, do_compile
> > >   meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_co=
mpile
> > >   meta-openembedded/meta-gnome/recipes-gnome/eds/evolution-data-serve=
r_git.bb, do_compile
> > >   meta-openembedded/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32=
=2E0.bb, do_compile
> > >   meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git=
=2Ebb, do_compile
> > >=20
> > > qemuarm (2):
> > >   openembedded-core/meta/recipes-devtools/qemu/qemu_1.5.0.bb, do_comp=
ile
> > >   meta-openembedded/meta-oe/recipes-connectivity/gnuradio/gnuradio_gi=
t.bb, do_compile
> > >=20
> > > qemux86* common (4):
> > >   openembedded-core/meta/recipes-graphics/xorg-driver/xf86-video-inte=
l_2.21.9.bb, do_compile
> > >   openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package
> > >   meta-openembedded/meta-oe/recipes-support/ode/ode_0.9.bb, do_config=
ure
> > >   meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_c=
ompile
> > >=20
> > > qemux86 (1):
> > >   meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-g=
eode_2.11.14.bb, do_compile
> > >=20
> > > qemux86-64 (2):=20
> > >   meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_comp=
ile
> > >   meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/lib=
imobiledevice_1.1.4.bb, do_configure
> >=20
> > This time only qemuarm build:
> > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world=
=2E20130724_125425.log/
> >=20
> > Summary: 8 tasks failed
> >   openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb, =
do_package
> >   meta-openembedded/meta-gnome/recipes-gnome/eds/evolution-data-server_=
git.bb, do_compile
> >   meta-openembedded/meta-oe/recipes-navigation/monav/monav_0.3.bb, do_c=
ompile
> >   meta-openembedded/meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb=
, do_compile
> >   meta-openembedded/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.0.bb, =
do_compile
> >   meta-openembedded/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0=
=2Ebb, do_compile
> >   meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_comp=
ile
> >   meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.b=
b, do_compile
>=20
> Again just qemuarm build, but together with test-dependencies.sh run
>=20
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2=
0130806_055749.log/
>=20
> Summary: 7 tasks failed:
>   meta-qt5/recipes-qt/qt5/qtdeclarative_5.0.2.bb, do_configure
>   meta-openembedded/meta-oe/recipes-multimedia/mikmod/libmikmod_3.1.12.bb=
, do_compile
>   meta-openembedded/meta-oe/recipes-navigation/monav/monav_0.3.bb, do_com=
pile
>   meta-openembedded/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.0.bb, do=
_compile
>   meta-openembedded/meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb, =
do_compile
>   meta-openembedded/meta-networking/recipes-protocols/quagga/quagga_0.99.=
21.bb, do_compile
>   meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_compile
>=20
> Most recipes failing with minimal dependencies are fixed in my
> jansa/test branches:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2=
0130806_055749.log/min_failed/failed/
>=20
> But many packages still have autodetected deps:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2=
0130806_055749.log/dependency-changes.warn
>=20
> Some recipes create few packages only when dependencies available:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2=
0130806_055749.log/dependency-changes.error
>=20
> Next run shouldn't take long, because I'll be building only recipes
> where issues were found.

With fixes sent to ML lately it's a bit better, let me know if someone else=
 plans to
work on this, otherwise I'll start first with oe-core/meta-oe/meta-efl reci=
pes and
leave meta-gnome/meta-xfce last as they have dedicated maintainer.

http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30808_230701.log

http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30808_230701.log/complete.log
Summary: 8 tasks failed:
  meta-qt5/recipes-qt/qt5/qtdeclarative_5.0.2.bb, do_configure
  meta-openembedded/meta-oe/recipes-multimedia/mikmod/libmikmod_3.1.12.bb, =
do_compile
  meta-openembedded/meta-oe/recipes-navigation/monav/monav_0.3.bb, do_compi=
le
  meta-openembedded/meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb, do=
_compile
  meta-openembedded/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.0.bb, do_c=
ompile
  meta-openembedded/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb=
, do_compile
  meta-openembedded/meta-networking/recipes-protocols/quagga/quagga_0.99.21=
=2Ebb, do_compile
  meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_compile

26 recipes with missing deps:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30808_230701.log/min_failed/
  cheese                 gnome-panel3           libgnomekbd            nump=
typhysics          qt-creator             xfce4-icon-theme
  devicekit-power        gnome-power-manager    monav                  omgp=
s                  samsung-rfs-mgr
  devilspie2             gnome-system-monitor   mousepad               open=
moocow             ubi-utils-klibc
  gcr                    kexec-tools-klibc      mpg123                 pack=
agegroup-shr-feed  webkit-efl
  gnome-panel            kexecboot-klibc        nautilus3              qcan=
observer           xbmc

134 packages with autodetected deps:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30808_230701.log/dependency-changes.warn
WARN: packages/armv5te-oe-linux-gnueabi/abiword/abiword/latest lost depende=
ncy on  enchant
WARN: packages/armv5te-oe-linux-gnueabi/abiword/abiword-meta/latest lost de=
pendency on  abiword-plugin-collab
WARN: packages/armv5te-oe-linux-gnueabi/aspell/aspell/latest lost dependenc=
y on  ncurses-libncurses ncurses-libtinfo
WARN: packages/armv5te-oe-linux-gnueabi/cherokee/cherokee/latest lost depen=
dency on  gnutls libavcodec libavformat libavutil libbz2 libcap libgcrypt l=
ibgpg-error libtasn1 openldap
WARN: packages/armv5te-oe-linux-gnueabi/claws-mail/claws-mail/latest lost d=
ependency on  dbus-glib enchant openldap startup-notification
WARN: packages/armv5te-oe-linux-gnueabi/collectd/collectd/latest lost depen=
dency on  iptables libdbi libmemcached libmodbus libow libowcapi libpq libu=
sb-compat libusb1 lmsensors-libsensors util-linux-libuuid
WARN: packages/armv5te-oe-linux-gnueabi/consolekit/consolekit/latest lost d=
ependency on  polkit
WARN: packages/armv5te-oe-linux-gnueabi/e-wm/e-wm/latest lost dependency on=
  libpam
WARN: packages/armv5te-oe-linux-gnueabi/edb/edb-tests/latest lost dependenc=
y on  ncurses-libncurses ncurses-libtinfo
WARN: packages/armv5te-oe-linux-gnueabi/entrance/entrance/latest lost depen=
dency on  consolekit dbus-lib
WARN: packages/armv5te-oe-linux-gnueabi/epiphany/epiphany/latest lost depen=
dency on  libavahi-client libavahi-common libavahi-gobject libnotify
WARN: packages/armv5te-oe-linux-gnueabi/evolution-data-server/evolution-dat=
a-server/latest lost dependency on  firefox
WARN: packages/armv5te-oe-linux-gnueabi/evolution-data-server/libcamel/late=
st lost dependency on  firefox
WARN: packages/armv5te-oe-linux-gnueabi/evolution-data-server/libebook/late=
st lost dependency on  firefox
WARN: packages/armv5te-oe-linux-gnueabi/evolution-data-server/libedata-book=
/latest lost dependency on  firefox
WARN: packages/armv5te-oe-linux-gnueabi/evolution-data-server/libedataserve=
rui/latest lost dependency on  firefox
WARN: packages/armv5te-oe-linux-gnueabi/expedite/expedite/latest lost depen=
dency on  libsdl
WARN: packages/armv5te-oe-linux-gnueabi/fbida/fbida/latest lost dependency =
on  libx11 libxext libxpm libxt openmotif
WARN: packages/armv5te-oe-linux-gnueabi/firefox/firefox/latest lost depende=
ncy on  libnotify3 nspr
WARN: packages/armv5te-oe-linux-gnueabi/firefox/firefox-dev/latest lost dep=
endency on  nspr
WARN: packages/armv5te-oe-linux-gnueabi/fluidsynth/fluidsynth/latest lost d=
ependency on  dbus-lib libcap libice libjack libjson libpulse libpulse-simp=
le libpulsecommon libsm libsndfile1 libx11 libx11-xcb libxau libxcb libxdmc=
p libxext libxi libxtst ncurses-libncurses portaudio-v19 readline util-linu=
x-libuuid
WARN: packages/armv5te-oe-linux-gnueabi/foxtrotgps/foxtrotgps/latest lost d=
ependency on  bluez4
WARN: packages/armv5te-oe-linux-gnueabi/gammu/gammu/latest lost dependency =
on  glib-2.0 libgudev-1.0
WARN: packages/armv5te-oe-linux-gnueabi/gammu/libgammu/latest lost dependen=
cy on  glib-2.0
WARN: packages/armv5te-oe-linux-gnueabi/gegl/gegl/latest lost dependency on=
  jasper libavcodec libavformat
WARN: packages/armv5te-oe-linux-gnueabi/gimp/gimp/latest lost dependency on=
  jasper libbz2 libgudev-1.0 libudev libxmu libxpm
WARN: packages/armv5te-oe-linux-gnueabi/glade3/glade3/latest lost dependenc=
y on  dbus-glib dbus-lib gconf gnome-vfs libart-lgpl libavahi-client libava=
hi-common libavahi-glib libbonobo libbonoboui libcanberra libcap libgcrypt =
libgnome libgnome-keyring libgnomecanvas libgnomeui libgpg-error libice lib=
ltdl libogg libsm libvorbis libxcomposite libxcursor libxdamage libxfixes l=
ibxrandr orbit2 popt util-linux-libuuid
WARN: packages/armv5te-oe-linux-gnueabi/glib-networking/glib-networking/lat=
est lost dependency on  p11-kit
WARN: packages/armv5te-oe-linux-gnueabi/gmtk/gmtk/latest lost dependency on=
  cairo-gobject dbus-lib gtk+3 libcap libice libjson libpulse libpulse-main=
loop-glib libpulsecommon libsm libsndfile1 libx11-xcb libxi libxtst util-li=
nux-libuuid
WARN: packages/armv5te-oe-linux-gnueabi/gnome-control-center/gnome-control-=
center/latest lost dependency on  libcanberra libcanberra-gtk2 libxscrnsaver
WARN: packages/armv5te-oe-linux-gnueabi/gnome-desktop/libgnome-desktop/late=
st lost dependency on  libx11-xcb startup-notification xcb-util
WARN: packages/armv5te-oe-linux-gnueabi/gnome-desktop3/libgnome-desktop3/la=
test lost dependency on  libx11-xcb startup-notification xcb-util
WARN: packages/armv5te-oe-linux-gnueabi/gnome-mplayer/gnome-mplayer/latest =
lost dependency on  cairo gtk+3 libnotify3
WARN: packages/armv5te-oe-linux-gnueabi/gnome-mplayer/gnome-mplayer-nautilu=
s-extension/latest lost dependency on  eglibc glib-2.0 gtk+
WARN: packages/armv5te-oe-linux-gnueabi/gnome-settings-daemon/gnome-setting=
s-daemon/latest lost dependency on  firefox libcanberra libcanberra-gtk2 li=
bcap libjson libltdl libogg libpulse libpulse-mainloop-glib libpulsecommon =
libsndfile1 libvorbis libx11-xcb libxtst startup-notification xcb-util
WARN: packages/armv5te-oe-linux-gnueabi/gnome-vfs/gnome-vfs/latest lost dep=
endency on  libavahi-client libavahi-common libavahi-glib
WARN: packages/armv5te-oe-linux-gnueabi/gnome-vfs/gnome-vfs-plugin-bzip2/la=
test lost dependency on  libavahi-client libavahi-common libavahi-glib
WARN: packages/armv5te-oe-linux-gnueabi/gnome-vfs/gnome-vfs-plugin-computer=
/latest lost dependency on  libavahi-client libavahi-common libavahi-glib
WARN: packages/armv5te-oe-linux-gnueabi/gnome-vfs/gnome-vfs-plugin-dns-sd/l=
atest lost dependency on  libavahi-client libavahi-common libavahi-glib
WARN: packages/armv5te-oe-linux-gnueabi/gnome-vfs/gnome-vfs-plugin-file/lat=
est lost dependency on  libattr libavahi-client libavahi-common libavahi-gl=
ib libgamin
WARN: packages/armv5te-oe-linux-gnueabi/gnome-vfs/gnome-vfs-plugin-ftp/late=
st lost dependency on  libavahi-client libavahi-common libavahi-glib
WARN: packages/armv5te-oe-linux-gnueabi/gnome-vfs/gnome-vfs-plugin-gzip/lat=
est lost dependency on  libavahi-client libavahi-common libavahi-glib
WARN: packages/armv5te-oe-linux-gnueabi/gnome-vfs/gnome-vfs-plugin-http/lat=
est lost dependency on  libavahi-client libavahi-common libavahi-glib
WARN: packages/armv5te-oe-linux-gnueabi/gnome-vfs/gnome-vfs-plugin-network/=
latest lost dependency on  libavahi-client libavahi-common libavahi-glib
WARN: packages/armv5te-oe-linux-gnueabi/gnome-vfs/gnome-vfs-plugin-nntp/lat=
est lost dependency on  libavahi-client libavahi-common libavahi-glib
WARN: packages/armv5te-oe-linux-gnueabi/gnome-vfs/gnome-vfs-plugin-sftp/lat=
est lost dependency on  libavahi-client libavahi-common libavahi-glib
WARN: packages/armv5te-oe-linux-gnueabi/gnome-vfs/gnome-vfs-plugin-tar/late=
st lost dependency on  libavahi-client libavahi-common libavahi-glib
WARN: packages/armv5te-oe-linux-gnueabi/gnome-vfs/gnome-vfs-plugin-vfs-test=
/latest lost dependency on  libavahi-client libavahi-common libavahi-glib
WARN: packages/armv5te-oe-linux-gnueabi/gnuplot/gnuplot/latest lost depende=
ncy on  cairo glib-2.0 pango
WARN: packages/armv5te-oe-linux-gnueabi/gnuradio/gnuradio/latest lost depen=
dency on  libjack libpython3 portaudio-v19
WARN: packages/armv5te-oe-linux-gnueabi/gpsd/gps-utils/latest lost dependen=
cy on  bluez4
WARN: packages/armv5te-oe-linux-gnueabi/gpsd/gpsd/latest lost dependency on=
  bluez4
WARN: packages/armv5te-oe-linux-gnueabi/gpsd/gpsd-gpsctl/latest lost depend=
ency on  bluez4
WARN: packages/armv5te-oe-linux-gnueabi/gpsd/libgps/latest lost dependency =
on  bluez4
WARN: packages/armv5te-oe-linux-gnueabi/gpsd/libgpsd/latest lost dependency=
 on  bluez4
WARN: packages/armv5te-oe-linux-gnueabi/gpsd/python-pygps/latest lost depen=
dency on  bluez4
WARN: packages/armv5te-oe-linux-gnueabi/gstreamer1.0-libav/gstreamer1.0-lib=
av/latest lost dependency on  liborc-0.4
WARN: packages/armv5te-oe-linux-gnueabi/guile/guile/latest lost dependency =
on  ncurses-libncurses readline
WARN: packages/armv5te-oe-linux-gnueabi/gvfs/gvfs/latest lost dependency on=
  bluez4 dbus-glib expat libarchive libcdio libcdio-cdda libcdio-paranoia
WARN: packages/armv5te-oe-linux-gnueabi/imagemagick/imagemagick/latest lost=
 dependency on  jasper
WARN: packages/armv5te-oe-linux-gnueabi/imlib2/imlib2-loaders/latest lost d=
ependency on  giflib libbz2 libid3tag liblzma tiff
WARN: packages/armv5te-oe-linux-gnueabi/lame/lame/latest lost dependency on=
  ncurses-libtinfo
WARN: packages/armv5te-oe-linux-gnueabi/libav/libavdevice/latest lost depen=
dency on  libx11 libxext libxfixes
WARN: packages/armv5te-oe-linux-gnueabi/libetpan/libetpan/latest lost depen=
dency on  libcurl
WARN: packages/armv5te-oe-linux-gnueabi/libgnome/libgnome/latest lost depen=
dency on  libavahi-client libavahi-common libavahi-glib
WARN: packages/armv5te-oe-linux-gnueabi/libgsf/libgsf/latest lost dependenc=
y on  gdk-pixbuf
WARN: packages/armv5te-oe-linux-gnueabi/libgtop/libgtop/latest lost depende=
ncy on  libxau
WARN: packages/armv5te-oe-linux-gnueabi/libmatchbox/libmatchbox/latest lost=
 dependency on  libpng12
WARN: packages/armv5te-oe-linux-gnueabi/libmemcached/libmemcached/latest lo=
st dependency on  cyrus-sasl
WARN: packages/armv5te-oe-linux-gnueabi/librsvg/rsvg/latest lost dependency=
 on  gdk-pixbuf gtk+
WARN: packages/armv5te-oe-linux-gnueabi/libungif/libungif/latest lost depen=
dency on  libice libsm libx11 libxau libxcb libxdmcp util-linux-libuuid
WARN: packages/armv5te-oe-linux-gnueabi/libungif/libungif-utils/latest lost=
 dependency on  libx11
WARN: packages/armv5te-oe-linux-gnueabi/libunique/libunique/latest lost dep=
endency on  dbus-glib dbus-lib
WARN: packages/armv5te-oe-linux-gnueabi/libwnck/libwnck/latest lost depende=
ncy on  libxres
WARN: packages/armv5te-oe-linux-gnueabi/libwnck3/libwnck3/latest lost depen=
dency on  libxres
WARN: packages/armv5te-oe-linux-gnueabi/libxklavier/libxklavier/latest lost=
 dependency on  libxext libxi
WARN: packages/armv5te-oe-linux-gnueabi/lightmediascanner/lightmediascanner=
/latest lost dependency on  libvorbis
WARN: packages/armv5te-oe-linux-gnueabi/maliit-framework/maliit-framework-g=
tk/latest lost dependency on  gtk+3
WARN: packages/armv5te-oe-linux-gnueabi/matchbox-wm/matchbox-wm/latest lost=
 dependency on  libxcursor libxfixes
WARN: packages/armv5te-oe-linux-gnueabi/metacity/metacity/latest lost depen=
dency on  libgtop
WARN: packages/armv5te-oe-linux-gnueabi/midori/midori/latest lost dependenc=
y on  libnotify3 libxscrnsaver
WARN: packages/armv5te-oe-linux-gnueabi/mkvtoolnix/mkvtoolnix/latest lost d=
ependency on  libflac
WARN: packages/armv5te-oe-linux-gnueabi/mpd/mpd/latest lost dependency on  =
audiofile libcdio libcdio-cdda libcdio-paranoia libjack libmms libmodplug l=
ibsoup-2.4 mpg123 wavpack yajl
WARN: packages/armv5te-oe-linux-gnueabi/mpeg2dec/mpeg2dec/latest lost depen=
dency on  libx11 libxext libxv
WARN: packages/armv5te-oe-linux-gnueabi/mplayer2/mplayer2/latest lost depen=
dency on  libxscrnsaver libxxf86dga mpg123
WARN: packages/armv5te-oe-linux-gnueabi/navit/navit/latest lost dependency =
on  fribidi
WARN: packages/armv5te-oe-linux-gnueabi/navit/navit-graphics-gtk/latest los=
t dependency on  imlib2
WARN: packages/armv5te-oe-linux-gnueabi/navit/navit-graphics-sdl/latest los=
t dependency on  eglibc freetype libjpeg-turbo liblzma libpng libsdl libsdl=
-image tiff tslib zlib
WARN: packages/armv5te-oe-linux-gnueabi/network-manager-applet/network-mana=
ger-applet/latest lost dependency on  libnotify3
WARN: packages/armv5te-oe-linux-gnueabi/networkmanager/networkmanager/lates=
t lost dependency on  libsoup-2.4
WARN: packages/armv5te-oe-linux-gnueabi/nss/nss/latest lost dependency on  =
firefox
WARN: packages/armv5te-oe-linux-gnueabi/openbox/openbox-core/latest lost de=
pendency on  imlib2 libxcursor libxinerama libxrandr startup-notification
WARN: packages/armv5te-oe-linux-gnueabi/opencv/libopencv-highgui/latest los=
t dependency on  jasper
WARN: packages/armv5te-oe-linux-gnueabi/openmotif/openmotif/latest lost dep=
endency on  libjpeg-turbo libpng zlib
WARN: packages/armv5te-oe-linux-gnueabi/orage/orage/latest lost dependency =
on  libnotify3 popt
WARN: packages/armv5te-oe-linux-gnueabi/packagekit/packagekit/latest lost d=
ependency on  libarchive libattr
WARN: packages/armv5te-oe-linux-gnueabi/proftpd/proftpd/latest lost depende=
ncy on  ncurses-libncurses ncurses-libtinfo
WARN: packages/armv5te-oe-linux-gnueabi/python3/python3-misc/latest lost de=
pendency on  liblzma
WARN: packages/armv5te-oe-linux-gnueabi/qemu/qemu/latest lost dependency on=
  cairo firefox gdk-pixbuf gnutls gtk+ libvte ncurses-libncurses ncurses-li=
btinfo nspr util-linux-libuuid
WARN: packages/armv5te-oe-linux-gnueabi/sox/sox/latest lost dependency on  =
libid3tag libmad libmp3lame
WARN: packages/armv5te-oe-linux-gnueabi/subversion/subversion/latest lost d=
ependency on  file
WARN: packages/armv5te-oe-linux-gnueabi/synergy/synergy/latest lost depende=
ncy on  libxinerama
WARN: packages/armv5te-oe-linux-gnueabi/systemd/systemd/latest lost depende=
ncy on  cryptsetup
WARN: packages/armv5te-oe-linux-gnueabi/tcl/tcl-lib/latest lost dependency =
on  zlib
WARN: packages/armv5te-oe-linux-gnueabi/telepathy-mission-control/telepathy=
-mission-control/latest lost dependency on  libnmglib upower
WARN: packages/armv5te-oe-linux-gnueabi/thunar/thunar/latest lost dependenc=
y on  libnotify3 libpcre
WARN: packages/armv5te-oe-linux-gnueabi/thunar-volman/thunar-volman/latest =
lost dependency on  libnotify3
WARN: packages/armv5te-oe-linux-gnueabi/tracker/tracker/latest lost depende=
ncy on  cairo dbus-glib enca expat fontconfig freetype giflib gnome-panel3 =
gnutls gstreamer gtk+3 lcms libbz2 libgee libgsf libgstpbutils-0.10 libgstt=
ag-0.10 libgudev-1.0 liblzma libnmglib libnmutil libpoppler libpoppler-glib=
 libtasn1 libudev libunistring libx11 libxau libxcb libxcb-render libxcb-sh=
m libxdmcp libxext libxrender pixman tiff upower
WARN: packages/armv5te-oe-linux-gnueabi/tracker/tracker-nautilus-extension/=
latest lost dependency on  libunistring
WARN: packages/armv5te-oe-linux-gnueabi/tumbler/tumbler/latest lost depende=
ncy on  gstreamer1.0 libbz2 libgsf libgsttag-1.0 libxml2
WARN: packages/armv5te-oe-linux-gnueabi/udisks/udisks/latest lost dependenc=
y on  parted
WARN: packages/armv5te-oe-linux-gnueabi/uhd/uhd/latest lost dependency on  =
liborc-0.4
WARN: packages/armv5te-oe-linux-gnueabi/upower/upower/latest lost dependenc=
y on  libimobiledevice libplist
WARN: packages/armv5te-oe-linux-gnueabi/v4l-utils/v4l-utils/latest lost dep=
endency on  libx11
WARN: packages/armv5te-oe-linux-gnueabi/vagalume/vagalume/latest lost depen=
dency on  libnotify3
WARN: packages/armv5te-oe-linux-gnueabi/vlc/vlc/latest lost dependency on  =
atk dbus-glib enca gconf gnome-vfs gtk+ libass libavahi-glib libebml libjac=
k libjpeg-turbo liblzma libmatroska libmodplug libmpeg2 libmtp libnotify3 l=
ibproxy libpulse-simple libsdl-image libsmbclient libusb1 libv4l ncurses-li=
bncurses portaudio-v19 readline taglib tiff xcb-util-keysyms
WARN: packages/armv5te-oe-linux-gnueabi/weston/weston-examples/latest lost =
dependency on  libpoppler-glib
WARN: packages/armv5te-oe-linux-gnueabi/wget/wget/latest lost dependency on=
  libpcre
WARN: packages/armv5te-oe-linux-gnueabi/wv/wv/latest lost dependency on  li=
bpng
WARN: packages/armv5te-oe-linux-gnueabi/x11vnc/x11vnc/latest lost dependenc=
y on  libxdamage libxfixes libxinerama libxrandr libxtst
WARN: packages/armv5te-oe-linux-gnueabi/xchat/xchat/latest lost dependency =
on  dbus-glib libcrypto libssl
WARN: packages/armv5te-oe-linux-gnueabi/xdpyinfo/xdpyinfo/latest lost depen=
dency on  libxcomposite
WARN: packages/armv5te-oe-linux-gnueabi/xf86-input-synaptics/xf86-input-syn=
aptics/latest lost dependency on  libxtst
WARN: packages/armv5te-oe-linux-gnueabi/xfce4-clipman-plugin/xfce4-clipman-=
plugin/latest lost dependency on  libunique
WARN: packages/armv5te-oe-linux-gnueabi/xfce4-closebutton-plugin/xfce4-clos=
ebutton-plugin/latest lost dependency on  libxres
WARN: packages/armv5te-oe-linux-gnueabi/xfce4-panel/xfce4-panel-plugin-page=
r/latest lost dependency on  libxres
WARN: packages/armv5te-oe-linux-gnueabi/xfce4-panel/xfce4-panel-plugin-show=
desktop/latest lost dependency on  libxres
WARN: packages/armv5te-oe-linux-gnueabi/xfce4-panel/xfce4-panel-plugin-task=
list/latest lost dependency on  libxres
WARN: packages/armv5te-oe-linux-gnueabi/xfce4-panel/xfce4-panel-plugin-wind=
owmenu/latest lost dependency on  libxres
WARN: packages/armv5te-oe-linux-gnueabi/xfce4-places-plugin/xfce4-places-pl=
ugin/latest lost dependency on  libnotify3
WARN: packages/armv5te-oe-linux-gnueabi/xfce4-power-manager/xfce4-power-man=
ager/latest lost dependency on  libnotify3
WARN: packages/armv5te-oe-linux-gnueabi/xfce4-settings/xfce4-settings/lates=
t lost dependency on  libnotify3
WARN: packages/armv5te-oe-linux-gnueabi/xfdesktop/xfdesktop/latest lost dep=
endency on  libnotify3
WARN: packages/armv5te-oe-linux-gnueabi/xterm/xterm/latest lost dependency =
on  fontconfig libxft

5 autocreated packages based on deps:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30808_230701.log/dependency-changes.error
ERROR: test-dependencies/1376003221/3_min/packages/armv5te-oe-linux-gnueabi=
/abiword/abiword-plugin-collab/latest doesn't exist
ERROR: test-dependencies/1376003221/3_min/packages/armv5te-oe-linux-gnueabi=
/qemu/qemu-locale-de-de/latest doesn't exist
ERROR: test-dependencies/1376003221/3_min/packages/armv5te-oe-linux-gnueabi=
/qemu/qemu-locale-fr-fr/latest doesn't exist
ERROR: test-dependencies/1376003221/3_min/packages/armv5te-oe-linux-gnueabi=
/qemu/qemu-locale-it/latest doesn't exist
ERROR: test-dependencies/1376003221/3_min/packages/armv5te-oe-linux-gnueabi=
/qemu/qemu-locale-tr/latest doesn't exist

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UKNXkkdQCYZ6W5l3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlIHeQMACgkQN1Ujt2V2gBxH7wCgrABKZQP0dajjLGixbQ523n+g
WmIAn3Mhjbw7M0HjI4tINTlMkq4IXgMS
=RXh3
-----END PGP SIGNATURE-----

--UKNXkkdQCYZ6W5l3--
