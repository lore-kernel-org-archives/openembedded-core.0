Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 2072661F16;
	Tue, 24 Jun 2014 21:12:55 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id bs8so6831745wib.7
	for <multiple recipients>; Tue, 24 Jun 2014 14:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=JnuFpenl5yq/EStZpqe+IjPlPstIXs8wBfe6b2dULVM=;
	b=gJnFAKVMWRYDxReOhO/dVL53TxBw7522QkTcDV4raWfPCJM0nrlbpICC+Knl9FqFWQ
	Z/oW8n6mTX5luLqGQNnDxCS8oXvhGrzqgJzhno/zBnBNc5gygXPUdMeaxs+1dFxyvjT/
	drv/p5tkA2V2607ju1iuoizrSzvMt04rvSnV3npntzsICacqODtr7thUbg1jar05HLnP
	CLSMeXvOzd6DqR90+tjpv41ImIg8D7vSPH30lRkWKSOhqc6c6ckHrF3N2klvPfP40XJt
	Whcn5CPAdyMOmp4rGL5LC+UC2HcsuA2/ffXJegKJlAqnPCLf+U8S/0JktEy+YywEdwL9
	flBw==
X-Received: by 10.181.12.76 with SMTP id eo12mr26894225wid.15.1403644375525;
	Tue, 24 Jun 2014 14:12:55 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fw4sm5154437wib.19.2014.06.24.14.12.54 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Jun 2014 14:12:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 24 Jun 2014 23:12:57 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140624211257.GQ2437@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, test-dependencies 2014-06-23
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
X-List-Received-Date: Tue, 24 Jun 2014 21:13:00 -0000
X-Groupsio-MsgNum: 54353
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6tPipYVl+OcoAvSh"
Content-Disposition: inline

--6tPipYVl+OcoAvSh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Complete logs:
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20140623_19=
1616.log/

ERROR: 143 issues were found in these recipes: abiword claws-mail
claws-plugin-gtkhtml2-viewer claws-plugin-mailmbox claws-plugin-rssyl
clutter-box2d daemonize fbgrab firefox flite-alsa fltk gdal gnumeric
goffice gst-ffmpeg hexedit hplip libgsf libhybris libnice liboauth
libotr libsdl-ttf lksctp-tools lttng-modules mkvtoolnix monkey orrery
owfs packagegroup-shr-feed phonet-utils pidgin python-efl rtorrent
subsurface tumbler usb-modeswitch vlc wv wvstreams xmlstarlet xpext xwd

Found differences:=20
ccid/ccid/latest lost dependency on  flex
consolekit/consolekit/latest lost dependency on  polkit
directfb/directfb/latest lost dependency on  libdrm libdrm-kms liblzma libw=
ebp tiff
engrave/engrave/latest lost dependency on  flex
epiphany/epiphany/latest lost dependency on  libavahi-client libavahi-commo=
n libavahi-gobject libnotify
expedite/expedite/latest lost dependency on  libsdl
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
gnutls/gnutls-bin/latest lost dependency on  libidn
guile/guile/latest lost dependency on  libgc ncurses-libncurses readline
libarchive/libarchive/latest lost dependency on  nettle
libarchive/libarchive-bin/latest lost dependency on  libxml2 nettle
libmicrohttpd/libmicrohttpd-bin/latest lost dependency on  file
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
tracker/tracker/latest lost dependency on  enca gtk+3 libgee libunistring u=
power
tracker/tracker-dev/latest lost dependency on  cairo enca expat fontconfig =
freetype giflib gstreamer lcms libgstpbutils-0.10 libgsttag-0.10 liblzma li=
bpoppler libpoppler-glib libunistring libx11 libxau libxcb libxcb-render li=
bxcb-shm libxdmcp libxext libxrender pixman taglib taglib-c tiff
vagalume/vagalume/latest lost dependency on  libproxy
weston/weston/latest lost dependency on  libwebp
weston/weston-examples/latest lost dependency on  libwebp
xserver-xorg/xserver-xorg/latest lost dependency on  libunwind libxshmfence=
 nettle
xserver-xorg/xserver-xorg-xvfb/latest lost dependency on  libunwind nettle
perf/perf/latest lost dependency on  libunwind

Summary: 28 tasks failed:
meta-openembedded/meta-efl/recipes-devtools/python/python-efl_1.10.0.bb, do=
_compile
meta-openembedded/meta-oe/recipes-support/farsight/libnice_0.0.13.bb, do_co=
nfigure
meta-openembedded/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb, do_c=
onfigure
meta-openembedded/meta-oe/recipes-support/fltk/fltk_1.1.10.bb, do_install
meta-openembedded/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.10.bb, =
do_compile
meta-openembedded/meta-oe/recipes-support/pidgin/libotr_4.0.0.bb, do_compile
meta-openembedded/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb, do_confi=
gure
meta-openembedded/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb, d=
o_install
meta-openembedded/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.0=
=2E1.bb, do_install
meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
meta-openembedded/meta-oe/recipes-navigation/orrery/orrery_2.7.bb, do_compi=
le
openembedded-core/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb, do_comp=
ile
meta-openembedded/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb, do_c=
onfigure
meta-openembedded/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.5.0.bb, d=
o_compile
meta-openembedded/meta-oe/recipes-support/daemonize/daemonize_git.bb, do_co=
nfigure
meta-openembedded/meta-oe/recipes-extended/hexedit/hexedit_1.2.13.bb, do_co=
mpile
meta-openembedded/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb, do_install
meta-openembedded/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.b=
b, do_configure
meta-openembedded/meta-filesystems/recipes-filesystems/owfs/owfs_2.9p1.bb, =
do_compile
meta-openembedded/meta-oe/recipes-extended/subsurface/subsurface_git.bb, do=
_compile
openembedded-core/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb, =
do_configure
meta-openembedded/meta-oe/recipes-graphics/fbgrab/fbgrab_1.2.bb, do_install
meta-openembedded/meta-networking/recipes-support/lksctp-tools/lksctp-tools=
_1.0.16.bb, do_compile
meta-openembedded/meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb, do=
_compile
meta-openembedded/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb, do_compile
meta-openembedded/meta-webserver/recipes-httpd/monkey/monkey_1.5.1.bb, do_p=
ackage
meta-openembedded/meta-oe/recipes-connectivity/phonet-utils/phonet-utils_gi=
t.bb, do_install
meta-openembedded/meta-oe/recipes-support/flite/flite-alsa_1.3.bb, do_insta=
ll

As bonus there is separate log file for each failing recipe, see
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20140623_19=
1616.log/3_min/failed/
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20140623_19=
1616.log/2_max/failed/
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6tPipYVl+OcoAvSh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOp6dkACgkQN1Ujt2V2gByEfACfdPkPcCCJOxGNBG0Dlo2WZzx0
84AAniWEqteoMvPqLyqAhGKheu2mwUYW
=Dc8l
-----END PGP SIGNATURE-----

--6tPipYVl+OcoAvSh--
