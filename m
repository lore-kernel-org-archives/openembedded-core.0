Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 682F861222;
	Mon, 12 Aug 2013 11:49:56 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id b45so3422826eek.15
	for <multiple recipients>; Mon, 12 Aug 2013 04:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=eh1YNBHeZSbdNHQuXjlQptZSD5tK57XqWisJqWuDZnw=;
	b=IIhkWQ33OAwBY7M2mP3yfdmIE7VGAionOAaVD6CYBk2b+hR6Mgi69A6o5QgHYuelaT
	fodq+6TuU1+ZuFBqSnFXN4Z8FI4bQQ261ZxFG4wZ4tM0dLnPhq3iGIrqVmA/f71Vs+sJ
	vJHZj3ShNoyecLmLBMOrZAASTA3djtEZhO7HLFiEPm0fMWptme5HJ+x2eroQm+JlWtrg
	Xu3d8FQ2BkAk2bvegOZThnDtnjFt9XQOQdHojiZjYw7x5ZfGvnFK52IaZyALTIDmrziG
	8kodnAyRwRCfLM/wh3K02iJrNGB6kB2TdypyZG85ZZpRxi0zwDnCUOUjMAu6Gd3yJL8U
	ssxg==
X-Received: by 10.14.69.206 with SMTP id n54mr25237376eed.118.1376308196471;
	Mon, 12 Aug 2013 04:49:56 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	f49sm51040666eec.7.2013.08.12.04.49.55 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 12 Aug 2013 04:49:55 -0700 (PDT)
Date: Mon, 12 Aug 2013 13:50:45 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Joe MacDonald <Joe.MacDonald@windriver.com>
Message-ID: <20130812115045.GK17945@jama>
References: <20130502151833.GC3206@jama>
	<20130516075215.GA24809@jama.dyndns-home.com>
	<20130520130635.GA32431@jama> <20130603151008.GC3279@jama>
	<20130611160434.GI3233@jama> <20130622181656.GK14021@jama>
	<20130725162341.GA3280@jama> <20130808225419.GB17945@jama>
	<20130811114403.GG17945@jama> <20130812113228.GB3634@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20130812113228.GB3634@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Mon, 12 Aug 2013 11:49:58 -0000
X-Groupsio-MsgNum: 43201
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LQ77YLfPrO/qF/pM"
Content-Disposition: inline

--LQ77YLfPrO/qF/pM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2013 at 07:32:28AM -0400, Joe MacDonald wrote:
> [Re: [OE-core] State of bitbake world] On 13.08.11 (Sun 13:44) Martin Jan=
sa wrote:
>=20
> > On Fri, Aug 09, 2013 at 12:54:19AM +0200, Martin Jansa wrote:
> > > On Thu, Jul 25, 2013 at 06:23:41PM +0200, Martin Jansa wrote:
> > > > On Sat, Jun 22, 2013 at 08:16:56PM +0200, Martin Jansa wrote:
> > > > > On Tue, Jun 11, 2013 at 06:04:34PM +0200, Martin Jansa wrote:
> > > > > Last week hero Khem, sent many world fixes, but it seems like som=
e fixes weren't enough
> > > > > (tk, packagekit are still failing - I hope I haven't missed some =
other vN)
> > > > > qemuarm: Summary: 11 tasks failed:
> > > > > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log=
=2Eworld.20130620_105211.log/
> > > > >=20
> > > > > qemux86: Summary: 14 tasks failed:
> > > > > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log=
=2Eworld.20130621_023143.log/
> > > > >=20
> > > > > qemux86_64: Summary: 15 tasks failed:
> > > > > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log=
=2Eworld.20130621_181258.log/
> > > > >=20
> > > > > common (9):
> > > > >   openembedded-core/meta/recipes-qt/qt4/qt4-embedded_4.8.4.bb, do=
_compile
> > > > >   openembedded-core/meta/recipes-core/base-files/base-files_3.0.1=
4.bb, do_package
> > > > >   meta-openembedded/meta-oe/recipes-connectivity/samba/samba_3.6.=
8.bb, do_package
> > > > >   meta-openembedded/meta-oe/recipes-qt/qcanobserver/qcanobserver_=
svn.bb, do_compile
> > > > >   meta-openembedded/meta-oe/recipes-devtools/packagekit/packageki=
t_0.5.6.bb, do_compile
> > > > >   meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, d=
o_compile
> > > > >   meta-openembedded/meta-gnome/recipes-gnome/eds/evolution-data-s=
erver_git.bb, do_compile
> > > > >   meta-openembedded/meta-gnome/recipes-gnome/gcalctool/gcalctool_=
5.32.0.bb, do_compile
> > > > >   meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc=
_git.bb, do_compile
> > > > >=20
> > > > > qemuarm (2):
> > > > >   openembedded-core/meta/recipes-devtools/qemu/qemu_1.5.0.bb, do_=
compile
> > > > >   meta-openembedded/meta-oe/recipes-connectivity/gnuradio/gnuradi=
o_git.bb, do_compile
> > > > >=20
> > > > > qemux86* common (4):
> > > > >   openembedded-core/meta/recipes-graphics/xorg-driver/xf86-video-=
intel_2.21.9.bb, do_compile
> > > > >   openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package
> > > > >   meta-openembedded/meta-oe/recipes-support/ode/ode_0.9.bb, do_co=
nfigure
> > > > >   meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, =
do_compile
> > > > >=20
> > > > > qemux86 (1):
> > > > >   meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-vid=
eo-geode_2.11.14.bb, do_compile
> > > > >=20
> > > > > qemux86-64 (2):=20
> > > > >   meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_=
compile
> > > > >   meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice=
/libimobiledevice_1.1.4.bb, do_configure
> > > >=20
> > > > This time only qemuarm build:
> > > > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.w=
orld.20130724_125425.log/
> > > >=20
> > > > Summary: 8 tasks failed
> > > >   openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.=
bb, do_package
> > > >   meta-openembedded/meta-gnome/recipes-gnome/eds/evolution-data-ser=
ver_git.bb, do_compile
> > > >   meta-openembedded/meta-oe/recipes-navigation/monav/monav_0.3.bb, =
do_compile
> > > >   meta-openembedded/meta-oe/recipes-qt/qcanobserver/qcanobserver_sv=
n.bb, do_compile
> > > >   meta-openembedded/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.0.=
bb, do_compile
> > > >   meta-openembedded/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.=
32.0.bb, do_compile
> > > >   meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_=
compile
> > > >   meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_g=
it.bb, do_compile
> > >=20
> > > Again just qemuarm build, but together with test-dependencies.sh run
> > >=20
> > > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.wor=
ld.20130806_055749.log/
> > >=20
> > > Summary: 7 tasks failed:
> > >   meta-qt5/recipes-qt/qt5/qtdeclarative_5.0.2.bb, do_configure
> > >   meta-openembedded/meta-oe/recipes-multimedia/mikmod/libmikmod_3.1.1=
2.bb, do_compile
> > >   meta-openembedded/meta-oe/recipes-navigation/monav/monav_0.3.bb, do=
_compile
> > >   meta-openembedded/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.0.bb=
, do_compile
> > >   meta-openembedded/meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.=
bb, do_compile
> > >   meta-openembedded/meta-networking/recipes-protocols/quagga/quagga_0=
=2E99.21.bb, do_compile
> > >   meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_co=
mpile
> > >=20
> > > Most recipes failing with minimal dependencies are fixed in my
> > > jansa/test branches:
> > > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.wor=
ld.20130806_055749.log/min_failed/failed/
> > >=20
> > > But many packages still have autodetected deps:
> > > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.wor=
ld.20130806_055749.log/dependency-changes.warn
> > >=20
> > > Some recipes create few packages only when dependencies available:
> > > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.wor=
ld.20130806_055749.log/dependency-changes.error
> > >=20
> > > Next run shouldn't take long, because I'll be building only recipes
> > > where issues were found.
> >=20
> > With fixes sent to ML lately it's a bit better, let me know if someone =
else plans to
> > work on this, otherwise I'll start first with oe-core/meta-oe/meta-efl =
recipes and
> > leave meta-gnome/meta-xfce last as they have dedicated maintainer.
>=20
> If you haven't already gotten to quagga, I'll take care of it.

OK, leaving quagga to you.

>=20
> -J.
>=20
> >=20
> > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world=
=2E20130808_230701.log
> >=20
> > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world=
=2E20130808_230701.log/complete.log
> > Summary: 8 tasks failed:
> >   meta-qt5/recipes-qt/qt5/qtdeclarative_5.0.2.bb, do_configure
> >   meta-openembedded/meta-oe/recipes-multimedia/mikmod/libmikmod_3.1.12.=
bb, do_compile
> >   meta-openembedded/meta-oe/recipes-navigation/monav/monav_0.3.bb, do_c=
ompile
> >   meta-openembedded/meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb=
, do_compile
> >   meta-openembedded/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.0.bb, =
do_compile
> >   meta-openembedded/meta-oe/recipes-devtools/packagekit/packagekit_0.5.=
6.bb, do_compile
> >   meta-openembedded/meta-networking/recipes-protocols/quagga/quagga_0.9=
9.21.bb, do_compile
> >   meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_comp=
ile
> >=20
> > 26 recipes with missing deps:
> > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world=
=2E20130808_230701.log/min_failed/
> >   cheese                 gnome-panel3           libgnomekbd            =
numptyphysics          qt-creator             xfce4-icon-theme
> >   devicekit-power        gnome-power-manager    monav                  =
omgps                  samsung-rfs-mgr
> >   devilspie2             gnome-system-monitor   mousepad               =
openmoocow             ubi-utils-klibc
> >   gcr                    kexec-tools-klibc      mpg123                 =
packagegroup-shr-feed  webkit-efl
> >   gnome-panel            kexecboot-klibc        nautilus3              =
qcanobserver           xbmc
> >=20
> > 134 packages with autodetected deps:
> > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world=
=2E20130808_230701.log/dependency-changes.warn
> > WARN: packages/armv5te-oe-linux-gnueabi/abiword/abiword/latest lost dep=
endency on  enchant
> > WARN: packages/armv5te-oe-linux-gnueabi/abiword/abiword-meta/latest los=
t dependency on  abiword-plugin-collab
> > WARN: packages/armv5te-oe-linux-gnueabi/aspell/aspell/latest lost depen=
dency on  ncurses-libncurses ncurses-libtinfo
> > WARN: packages/armv5te-oe-linux-gnueabi/cherokee/cherokee/latest lost d=
ependency on  gnutls libavcodec libavformat libavutil libbz2 libcap libgcry=
pt libgpg-error libtasn1 openldap
> > WARN: packages/armv5te-oe-linux-gnueabi/claws-mail/claws-mail/latest lo=
st dependency on  dbus-glib enchant openldap startup-notification
> > WARN: packages/armv5te-oe-linux-gnueabi/collectd/collectd/latest lost d=
ependency on  iptables libdbi libmemcached libmodbus libow libowcapi libpq =
libusb-compat libusb1 lmsensors-libsensors util-linux-libuuid
> > WARN: packages/armv5te-oe-linux-gnueabi/consolekit/consolekit/latest lo=
st dependency on  polkit
> > WARN: packages/armv5te-oe-linux-gnueabi/e-wm/e-wm/latest lost dependenc=
y on  libpam
> > WARN: packages/armv5te-oe-linux-gnueabi/edb/edb-tests/latest lost depen=
dency on  ncurses-libncurses ncurses-libtinfo
> > WARN: packages/armv5te-oe-linux-gnueabi/entrance/entrance/latest lost d=
ependency on  consolekit dbus-lib
> > WARN: packages/armv5te-oe-linux-gnueabi/epiphany/epiphany/latest lost d=
ependency on  libavahi-client libavahi-common libavahi-gobject libnotify
> > WARN: packages/armv5te-oe-linux-gnueabi/evolution-data-server/evolution=
-data-server/latest lost dependency on  firefox
> > WARN: packages/armv5te-oe-linux-gnueabi/evolution-data-server/libcamel/=
latest lost dependency on  firefox
> > WARN: packages/armv5te-oe-linux-gnueabi/evolution-data-server/libebook/=
latest lost dependency on  firefox
> > WARN: packages/armv5te-oe-linux-gnueabi/evolution-data-server/libedata-=
book/latest lost dependency on  firefox
> > WARN: packages/armv5te-oe-linux-gnueabi/evolution-data-server/libedatas=
erverui/latest lost dependency on  firefox
> > WARN: packages/armv5te-oe-linux-gnueabi/expedite/expedite/latest lost d=
ependency on  libsdl
> > WARN: packages/armv5te-oe-linux-gnueabi/fbida/fbida/latest lost depende=
ncy on  libx11 libxext libxpm libxt openmotif
> > WARN: packages/armv5te-oe-linux-gnueabi/firefox/firefox/latest lost dep=
endency on  libnotify3 nspr
> > WARN: packages/armv5te-oe-linux-gnueabi/firefox/firefox-dev/latest lost=
 dependency on  nspr
> > WARN: packages/armv5te-oe-linux-gnueabi/fluidsynth/fluidsynth/latest lo=
st dependency on  dbus-lib libcap libice libjack libjson libpulse libpulse-=
simple libpulsecommon libsm libsndfile1 libx11 libx11-xcb libxau libxcb lib=
xdmcp libxext libxi libxtst ncurses-libncurses portaudio-v19 readline util-=
linux-libuuid
> > WARN: packages/armv5te-oe-linux-gnueabi/foxtrotgps/foxtrotgps/latest lo=
st dependency on  bluez4
> > WARN: packages/armv5te-oe-linux-gnueabi/gammu/gammu/latest lost depende=
ncy on  glib-2.0 libgudev-1.0
> > WARN: packages/armv5te-oe-linux-gnueabi/gammu/libgammu/latest lost depe=
ndency on  glib-2.0
> > WARN: packages/armv5te-oe-linux-gnueabi/gegl/gegl/latest lost dependenc=
y on  jasper libavcodec libavformat
> > WARN: packages/armv5te-oe-linux-gnueabi/gimp/gimp/latest lost dependenc=
y on  jasper libbz2 libgudev-1.0 libudev libxmu libxpm
> > WARN: packages/armv5te-oe-linux-gnueabi/glade3/glade3/latest lost depen=
dency on  dbus-glib dbus-lib gconf gnome-vfs libart-lgpl libavahi-client li=
bavahi-common libavahi-glib libbonobo libbonoboui libcanberra libcap libgcr=
ypt libgnome libgnome-keyring libgnomecanvas libgnomeui libgpg-error libice=
 libltdl libogg libsm libvorbis libxcomposite libxcursor libxdamage libxfix=
es libxrandr orbit2 popt util-linux-libuuid
> > WARN: packages/armv5te-oe-linux-gnueabi/glib-networking/glib-networking=
/latest lost dependency on  p11-kit
> > WARN: packages/armv5te-oe-linux-gnueabi/gmtk/gmtk/latest lost dependenc=
y on  cairo-gobject dbus-lib gtk+3 libcap libice libjson libpulse libpulse-=
mainloop-glib libpulsecommon libsm libsndfile1 libx11-xcb libxi libxtst uti=
l-linux-libuuid
> > WARN: packages/armv5te-oe-linux-gnueabi/gnome-control-center/gnome-cont=
rol-center/latest lost dependency on  libcanberra libcanberra-gtk2 libxscrn=
saver
> > WARN: packages/armv5te-oe-linux-gnueabi/gnome-desktop/libgnome-desktop/=
latest lost dependency on  libx11-xcb startup-notification xcb-util
> > WARN: packages/armv5te-oe-linux-gnueabi/gnome-desktop3/libgnome-desktop=
3/latest lost dependency on  libx11-xcb startup-notification xcb-util
> > WARN: packages/armv5te-oe-linux-gnueabi/gnome-mplayer/gnome-mplayer/lat=
est lost dependency on  cairo gtk+3 libnotify3
> > WARN: packages/armv5te-oe-linux-gnueabi/gnome-mplayer/gnome-mplayer-nau=
tilus-extension/latest lost dependency on  eglibc glib-2.0 gtk+
> > WARN: packages/armv5te-oe-linux-gnueabi/gnome-settings-daemon/gnome-set=
tings-daemon/latest lost dependency on  firefox libcanberra libcanberra-gtk=
2 libcap libjson libltdl libogg libpulse libpulse-mainloop-glib libpulsecom=
mon libsndfile1 libvorbis libx11-xcb libxtst startup-notification xcb-util
> > WARN: packages/armv5te-oe-linux-gnueabi/gnome-vfs/gnome-vfs/latest lost=
 dependency on  libavahi-client libavahi-common libavahi-glib
> > WARN: packages/armv5te-oe-linux-gnueabi/gnome-vfs/gnome-vfs-plugin-bzip=
2/latest lost dependency on  libavahi-client libavahi-common libavahi-glib
> > WARN: packages/armv5te-oe-linux-gnueabi/gnome-vfs/gnome-vfs-plugin-comp=
uter/latest lost dependency on  libavahi-client libavahi-common libavahi-gl=
ib
> > WARN: packages/armv5te-oe-linux-gnueabi/gnome-vfs/gnome-vfs-plugin-dns-=
sd/latest lost dependency on  libavahi-client libavahi-common libavahi-glib
> > WARN: packages/armv5te-oe-linux-gnueabi/gnome-vfs/gnome-vfs-plugin-file=
/latest lost dependency on  libattr libavahi-client libavahi-common libavah=
i-glib libgamin
> > WARN: packages/armv5te-oe-linux-gnueabi/gnome-vfs/gnome-vfs-plugin-ftp/=
latest lost dependency on  libavahi-client libavahi-common libavahi-glib
> > WARN: packages/armv5te-oe-linux-gnueabi/gnome-vfs/gnome-vfs-plugin-gzip=
/latest lost dependency on  libavahi-client libavahi-common libavahi-glib
> > WARN: packages/armv5te-oe-linux-gnueabi/gnome-vfs/gnome-vfs-plugin-http=
/latest lost dependency on  libavahi-client libavahi-common libavahi-glib
> > WARN: packages/armv5te-oe-linux-gnueabi/gnome-vfs/gnome-vfs-plugin-netw=
ork/latest lost dependency on  libavahi-client libavahi-common libavahi-glib
> > WARN: packages/armv5te-oe-linux-gnueabi/gnome-vfs/gnome-vfs-plugin-nntp=
/latest lost dependency on  libavahi-client libavahi-common libavahi-glib
> > WARN: packages/armv5te-oe-linux-gnueabi/gnome-vfs/gnome-vfs-plugin-sftp=
/latest lost dependency on  libavahi-client libavahi-common libavahi-glib
> > WARN: packages/armv5te-oe-linux-gnueabi/gnome-vfs/gnome-vfs-plugin-tar/=
latest lost dependency on  libavahi-client libavahi-common libavahi-glib
> > WARN: packages/armv5te-oe-linux-gnueabi/gnome-vfs/gnome-vfs-plugin-vfs-=
test/latest lost dependency on  libavahi-client libavahi-common libavahi-gl=
ib
> > WARN: packages/armv5te-oe-linux-gnueabi/gnuplot/gnuplot/latest lost dep=
endency on  cairo glib-2.0 pango
> > WARN: packages/armv5te-oe-linux-gnueabi/gnuradio/gnuradio/latest lost d=
ependency on  libjack libpython3 portaudio-v19
> > WARN: packages/armv5te-oe-linux-gnueabi/gpsd/gps-utils/latest lost depe=
ndency on  bluez4
> > WARN: packages/armv5te-oe-linux-gnueabi/gpsd/gpsd/latest lost dependenc=
y on  bluez4
> > WARN: packages/armv5te-oe-linux-gnueabi/gpsd/gpsd-gpsctl/latest lost de=
pendency on  bluez4
> > WARN: packages/armv5te-oe-linux-gnueabi/gpsd/libgps/latest lost depende=
ncy on  bluez4
> > WARN: packages/armv5te-oe-linux-gnueabi/gpsd/libgpsd/latest lost depend=
ency on  bluez4
> > WARN: packages/armv5te-oe-linux-gnueabi/gpsd/python-pygps/latest lost d=
ependency on  bluez4
> > WARN: packages/armv5te-oe-linux-gnueabi/gstreamer1.0-libav/gstreamer1.0=
-libav/latest lost dependency on  liborc-0.4
> > WARN: packages/armv5te-oe-linux-gnueabi/guile/guile/latest lost depende=
ncy on  ncurses-libncurses readline
> > WARN: packages/armv5te-oe-linux-gnueabi/gvfs/gvfs/latest lost dependenc=
y on  bluez4 dbus-glib expat libarchive libcdio libcdio-cdda libcdio-parano=
ia
> > WARN: packages/armv5te-oe-linux-gnueabi/imagemagick/imagemagick/latest =
lost dependency on  jasper
> > WARN: packages/armv5te-oe-linux-gnueabi/imlib2/imlib2-loaders/latest lo=
st dependency on  giflib libbz2 libid3tag liblzma tiff
> > WARN: packages/armv5te-oe-linux-gnueabi/lame/lame/latest lost dependenc=
y on  ncurses-libtinfo
> > WARN: packages/armv5te-oe-linux-gnueabi/libav/libavdevice/latest lost d=
ependency on  libx11 libxext libxfixes
> > WARN: packages/armv5te-oe-linux-gnueabi/libetpan/libetpan/latest lost d=
ependency on  libcurl
> > WARN: packages/armv5te-oe-linux-gnueabi/libgnome/libgnome/latest lost d=
ependency on  libavahi-client libavahi-common libavahi-glib
> > WARN: packages/armv5te-oe-linux-gnueabi/libgsf/libgsf/latest lost depen=
dency on  gdk-pixbuf
> > WARN: packages/armv5te-oe-linux-gnueabi/libgtop/libgtop/latest lost dep=
endency on  libxau
> > WARN: packages/armv5te-oe-linux-gnueabi/libmatchbox/libmatchbox/latest =
lost dependency on  libpng12
> > WARN: packages/armv5te-oe-linux-gnueabi/libmemcached/libmemcached/lates=
t lost dependency on  cyrus-sasl
> > WARN: packages/armv5te-oe-linux-gnueabi/librsvg/rsvg/latest lost depend=
ency on  gdk-pixbuf gtk+
> > WARN: packages/armv5te-oe-linux-gnueabi/libungif/libungif/latest lost d=
ependency on  libice libsm libx11 libxau libxcb libxdmcp util-linux-libuuid
> > WARN: packages/armv5te-oe-linux-gnueabi/libungif/libungif-utils/latest =
lost dependency on  libx11
> > WARN: packages/armv5te-oe-linux-gnueabi/libunique/libunique/latest lost=
 dependency on  dbus-glib dbus-lib
> > WARN: packages/armv5te-oe-linux-gnueabi/libwnck/libwnck/latest lost dep=
endency on  libxres
> > WARN: packages/armv5te-oe-linux-gnueabi/libwnck3/libwnck3/latest lost d=
ependency on  libxres
> > WARN: packages/armv5te-oe-linux-gnueabi/libxklavier/libxklavier/latest =
lost dependency on  libxext libxi
> > WARN: packages/armv5te-oe-linux-gnueabi/lightmediascanner/lightmediasca=
nner/latest lost dependency on  libvorbis
> > WARN: packages/armv5te-oe-linux-gnueabi/maliit-framework/maliit-framewo=
rk-gtk/latest lost dependency on  gtk+3
> > WARN: packages/armv5te-oe-linux-gnueabi/matchbox-wm/matchbox-wm/latest =
lost dependency on  libxcursor libxfixes
> > WARN: packages/armv5te-oe-linux-gnueabi/metacity/metacity/latest lost d=
ependency on  libgtop
> > WARN: packages/armv5te-oe-linux-gnueabi/midori/midori/latest lost depen=
dency on  libnotify3 libxscrnsaver
> > WARN: packages/armv5te-oe-linux-gnueabi/mkvtoolnix/mkvtoolnix/latest lo=
st dependency on  libflac
> > WARN: packages/armv5te-oe-linux-gnueabi/mpd/mpd/latest lost dependency =
on  audiofile libcdio libcdio-cdda libcdio-paranoia libjack libmms libmodpl=
ug libsoup-2.4 mpg123 wavpack yajl
> > WARN: packages/armv5te-oe-linux-gnueabi/mpeg2dec/mpeg2dec/latest lost d=
ependency on  libx11 libxext libxv
> > WARN: packages/armv5te-oe-linux-gnueabi/mplayer2/mplayer2/latest lost d=
ependency on  libxscrnsaver libxxf86dga mpg123
> > WARN: packages/armv5te-oe-linux-gnueabi/navit/navit/latest lost depende=
ncy on  fribidi
> > WARN: packages/armv5te-oe-linux-gnueabi/navit/navit-graphics-gtk/latest=
 lost dependency on  imlib2
> > WARN: packages/armv5te-oe-linux-gnueabi/navit/navit-graphics-sdl/latest=
 lost dependency on  eglibc freetype libjpeg-turbo liblzma libpng libsdl li=
bsdl-image tiff tslib zlib
> > WARN: packages/armv5te-oe-linux-gnueabi/network-manager-applet/network-=
manager-applet/latest lost dependency on  libnotify3
> > WARN: packages/armv5te-oe-linux-gnueabi/networkmanager/networkmanager/l=
atest lost dependency on  libsoup-2.4
> > WARN: packages/armv5te-oe-linux-gnueabi/nss/nss/latest lost dependency =
on  firefox
> > WARN: packages/armv5te-oe-linux-gnueabi/openbox/openbox-core/latest los=
t dependency on  imlib2 libxcursor libxinerama libxrandr startup-notificati=
on
> > WARN: packages/armv5te-oe-linux-gnueabi/opencv/libopencv-highgui/latest=
 lost dependency on  jasper
> > WARN: packages/armv5te-oe-linux-gnueabi/openmotif/openmotif/latest lost=
 dependency on  libjpeg-turbo libpng zlib
> > WARN: packages/armv5te-oe-linux-gnueabi/orage/orage/latest lost depende=
ncy on  libnotify3 popt
> > WARN: packages/armv5te-oe-linux-gnueabi/packagekit/packagekit/latest lo=
st dependency on  libarchive libattr
> > WARN: packages/armv5te-oe-linux-gnueabi/proftpd/proftpd/latest lost dep=
endency on  ncurses-libncurses ncurses-libtinfo
> > WARN: packages/armv5te-oe-linux-gnueabi/python3/python3-misc/latest los=
t dependency on  liblzma
> > WARN: packages/armv5te-oe-linux-gnueabi/qemu/qemu/latest lost dependenc=
y on  cairo firefox gdk-pixbuf gnutls gtk+ libvte ncurses-libncurses ncurse=
s-libtinfo nspr util-linux-libuuid
> > WARN: packages/armv5te-oe-linux-gnueabi/sox/sox/latest lost dependency =
on  libid3tag libmad libmp3lame
> > WARN: packages/armv5te-oe-linux-gnueabi/subversion/subversion/latest lo=
st dependency on  file
> > WARN: packages/armv5te-oe-linux-gnueabi/synergy/synergy/latest lost dep=
endency on  libxinerama
> > WARN: packages/armv5te-oe-linux-gnueabi/systemd/systemd/latest lost dep=
endency on  cryptsetup
> > WARN: packages/armv5te-oe-linux-gnueabi/tcl/tcl-lib/latest lost depende=
ncy on  zlib
> > WARN: packages/armv5te-oe-linux-gnueabi/telepathy-mission-control/telep=
athy-mission-control/latest lost dependency on  libnmglib upower
> > WARN: packages/armv5te-oe-linux-gnueabi/thunar/thunar/latest lost depen=
dency on  libnotify3 libpcre
> > WARN: packages/armv5te-oe-linux-gnueabi/thunar-volman/thunar-volman/lat=
est lost dependency on  libnotify3
> > WARN: packages/armv5te-oe-linux-gnueabi/tracker/tracker/latest lost dep=
endency on  cairo dbus-glib enca expat fontconfig freetype giflib gnome-pan=
el3 gnutls gstreamer gtk+3 lcms libbz2 libgee libgsf libgstpbutils-0.10 lib=
gsttag-0.10 libgudev-1.0 liblzma libnmglib libnmutil libpoppler libpoppler-=
glib libtasn1 libudev libunistring libx11 libxau libxcb libxcb-render libxc=
b-shm libxdmcp libxext libxrender pixman tiff upower
> > WARN: packages/armv5te-oe-linux-gnueabi/tracker/tracker-nautilus-extens=
ion/latest lost dependency on  libunistring
> > WARN: packages/armv5te-oe-linux-gnueabi/tumbler/tumbler/latest lost dep=
endency on  gstreamer1.0 libbz2 libgsf libgsttag-1.0 libxml2
> > WARN: packages/armv5te-oe-linux-gnueabi/udisks/udisks/latest lost depen=
dency on  parted
> > WARN: packages/armv5te-oe-linux-gnueabi/uhd/uhd/latest lost dependency =
on  liborc-0.4
> > WARN: packages/armv5te-oe-linux-gnueabi/upower/upower/latest lost depen=
dency on  libimobiledevice libplist
> > WARN: packages/armv5te-oe-linux-gnueabi/v4l-utils/v4l-utils/latest lost=
 dependency on  libx11
> > WARN: packages/armv5te-oe-linux-gnueabi/vagalume/vagalume/latest lost d=
ependency on  libnotify3
> > WARN: packages/armv5te-oe-linux-gnueabi/vlc/vlc/latest lost dependency =
on  atk dbus-glib enca gconf gnome-vfs gtk+ libass libavahi-glib libebml li=
bjack libjpeg-turbo liblzma libmatroska libmodplug libmpeg2 libmtp libnotif=
y3 libproxy libpulse-simple libsdl-image libsmbclient libusb1 libv4l ncurse=
s-libncurses portaudio-v19 readline taglib tiff xcb-util-keysyms
> > WARN: packages/armv5te-oe-linux-gnueabi/weston/weston-examples/latest l=
ost dependency on  libpoppler-glib
> > WARN: packages/armv5te-oe-linux-gnueabi/wget/wget/latest lost dependenc=
y on  libpcre
> > WARN: packages/armv5te-oe-linux-gnueabi/wv/wv/latest lost dependency on=
  libpng
> > WARN: packages/armv5te-oe-linux-gnueabi/x11vnc/x11vnc/latest lost depen=
dency on  libxdamage libxfixes libxinerama libxrandr libxtst
> > WARN: packages/armv5te-oe-linux-gnueabi/xchat/xchat/latest lost depende=
ncy on  dbus-glib libcrypto libssl
> > WARN: packages/armv5te-oe-linux-gnueabi/xdpyinfo/xdpyinfo/latest lost d=
ependency on  libxcomposite
> > WARN: packages/armv5te-oe-linux-gnueabi/xf86-input-synaptics/xf86-input=
-synaptics/latest lost dependency on  libxtst
> > WARN: packages/armv5te-oe-linux-gnueabi/xfce4-clipman-plugin/xfce4-clip=
man-plugin/latest lost dependency on  libunique
> > WARN: packages/armv5te-oe-linux-gnueabi/xfce4-closebutton-plugin/xfce4-=
closebutton-plugin/latest lost dependency on  libxres
> > WARN: packages/armv5te-oe-linux-gnueabi/xfce4-panel/xfce4-panel-plugin-=
pager/latest lost dependency on  libxres
> > WARN: packages/armv5te-oe-linux-gnueabi/xfce4-panel/xfce4-panel-plugin-=
showdesktop/latest lost dependency on  libxres
> > WARN: packages/armv5te-oe-linux-gnueabi/xfce4-panel/xfce4-panel-plugin-=
tasklist/latest lost dependency on  libxres
> > WARN: packages/armv5te-oe-linux-gnueabi/xfce4-panel/xfce4-panel-plugin-=
windowmenu/latest lost dependency on  libxres
> > WARN: packages/armv5te-oe-linux-gnueabi/xfce4-places-plugin/xfce4-place=
s-plugin/latest lost dependency on  libnotify3
> > WARN: packages/armv5te-oe-linux-gnueabi/xfce4-power-manager/xfce4-power=
-manager/latest lost dependency on  libnotify3
> > WARN: packages/armv5te-oe-linux-gnueabi/xfce4-settings/xfce4-settings/l=
atest lost dependency on  libnotify3
> > WARN: packages/armv5te-oe-linux-gnueabi/xfdesktop/xfdesktop/latest lost=
 dependency on  libnotify3
> > WARN: packages/armv5te-oe-linux-gnueabi/xterm/xterm/latest lost depende=
ncy on  fontconfig libxft
> >=20
> > 5 autocreated packages based on deps:
> > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world=
=2E20130808_230701.log/dependency-changes.error
> > ERROR: test-dependencies/1376003221/3_min/packages/armv5te-oe-linux-gnu=
eabi/abiword/abiword-plugin-collab/latest doesn't exist
> > ERROR: test-dependencies/1376003221/3_min/packages/armv5te-oe-linux-gnu=
eabi/qemu/qemu-locale-de-de/latest doesn't exist
> > ERROR: test-dependencies/1376003221/3_min/packages/armv5te-oe-linux-gnu=
eabi/qemu/qemu-locale-fr-fr/latest doesn't exist
> > ERROR: test-dependencies/1376003221/3_min/packages/armv5te-oe-linux-gnu=
eabi/qemu/qemu-locale-it/latest doesn't exist
> > ERROR: test-dependencies/1376003221/3_min/packages/armv5te-oe-linux-gnu=
eabi/qemu/qemu-locale-tr/latest doesn't exist
> >=20
> --=20
> -Joe MacDonald.
> :wq



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--LQ77YLfPrO/qF/pM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlIIzBUACgkQN1Ujt2V2gBxlCQCeOIIEVrqIZ3DsOq7hqyMILjoN
3eYAnij80xFr4dbiX/ax+LQj9swVC5Ds
=Ondl
-----END PGP SIGNATURE-----

--LQ77YLfPrO/qF/pM--
