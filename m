Return-Path: <martin.jansa@gmail.com>
X-Greylist: delayed 417 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 09 May 2014 13:02:23 UTC
Received: from mail-la0-f44.google.com (unknown [209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 481F3601A0;
	Fri,  9 May 2014 13:02:23 +0000 (UTC)
Received: by mail-la0-f44.google.com with SMTP id hr17so417223lab.3
	for <multiple recipients>; Fri, 09 May 2014 06:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=vI/LwNrHvWigwMfLWusxCpk7+4G2nwwgej/V32K4cgI=;
	b=iJR/DwXsAZP6mVo3QCnepA6obWAz9m1V7yn5PdaGUlkOI5/shWTPsZtDEm5W1opvDo
	QONc4C+zUpguh1GwnUlH1Oe7qyeHDsz09ujvCrIip/OJGkpYh6D8T1kwh84jy+pcSNgr
	stgbt4F3TteD8yKxdeXfbLodckfZE+9TZ5tUsDBydM/gftIQwxJMTk59GO04aFsPnqT9
	8GsueB1EoEKefMWGNbmHlVXA+B6XSRg4hHuGFGbrAxmUiEvg95abYjHD6RezhSu34ogj
	lTo6mKKmG9ubY3FjNKA6jqF55mm4Kll0lX4va8t+bjJsQN1aHgWr2prh4cF3L6fSAosJ
	yxwg==
X-Received: by 10.152.1.199 with SMTP id 7mr1913382lao.15.1399640126906;
	Fri, 09 May 2014 05:55:26 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id d8sm4369031lbe.3.2014.05.09.05.55.25
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 May 2014 05:55:25 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 9 May 2014 14:55:49 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140509125549.GU30955@jama>
References: <20140418183632.GG2486@jama> <20140425010009.GN2486@jama>
	<20140506195144.GC30955@jama> <20140509113746.GS30955@jama>
MIME-Version: 1.0
In-Reply-To: <20140509113746.GS30955@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
X-List-Received-Date: Fri, 09 May 2014 13:02:27 -0000
X-Groupsio-MsgNum: 53025
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QOa9dl9wYIBIim/b"
Content-Disposition: inline

--QOa9dl9wYIBIim/b
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 09, 2014 at 01:37:46PM +0200, Martin Jansa wrote:
> On Tue, May 06, 2014 at 09:51:44PM +0200, Martin Jansa wrote:
> > On Fri, Apr 25, 2014 at 03:00:09AM +0200, Martin Jansa wrote:
> > > On Fri, Apr 18, 2014 at 08:36:32PM +0200, Martin Jansa wrote:
> > > > On Thu, Apr 03, 2014 at 03:06:09PM +0200, Martin Jansa wrote:
> > > > > I've just started this long test-dependencies build so jenkins wi=
ll be busy
> > > > > for next 14 days or so, but I'll send complete qa.log in advance =
as soon as
> > > > > it finishes building world from scratch.
> > >=20
> > > This one is only "incremental" (so testing only recipes which failed =
in
> > > previous run) and it took only 3,5 days to finish :).
> > >=20
> > > Mostly because of firefox (libnotify) and efl/lua fix we're down to 7=
2 recipes with
> > > issues (instead of 187 found in previous run or 100 w/o firefox*)
> >=20
> > I've sent couple of WIP patches to oe-devel ML and now we're down to 50
> > recipes with issues, there are still 2 days to send patches for daisy,
> > so hurry up.
> >=20
> > Complete logs:
> > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.depen=
dencies.20140506_041120.log/
>=20
> Big thanks to Tim Orling and Andreas M=FCller for sending fixes for vlc
> and xfce recipes we're down to=20

-ENOCOFFEE: down to 44 :)

recipes fixed in last iteration:

< console-tools
< gimp
< qtbase
< vlc
< xfce4-settings
< xfce4-weather-plugin

> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.depende=
ncies.20140508_095057.log/
>=20
> Just to make it clear, this build is using oe-core/daisy+known_fixes (con=
trib/jansa/daisy-backports)
> + meta-oe/master. I'll continue to run these incremental test-dependencie=
s builds even after branching
> daisy until we resolve all of them, so be prepared for more reports.
>=20
> I'll fix gst*, navit, python-e*, please help with the rest (some of these=
 errors are there
> for very long time and we should really provide reliable and reproducible=
 builds:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/2013/log.de=
pendencies.20130811_000000.log/
> )
>=20
> Found differences:=20
> ccid/ccid/latest lost dependency on  flex
> consolekit/consolekit/latest lost dependency on  polkit
> directfb/directfb/latest lost dependency on  libdrm libdrm-kms liblzma ti=
ff
> engrave/engrave/latest lost dependency on  flex
> epiphany/epiphany/latest lost dependency on  libavahi-client libavahi-com=
mon libavahi-gobject libnotify
> expedite/expedite/latest lost dependency on  libsdl
> flashrom/flashrom/latest lost dependency on  libftdi
> gammu/gammu/latest lost dependency on  glib-2.0 libgudev-1.0
> gammu/libgammu/latest lost dependency on  glib-2.0
> glade3/glade3/latest lost dependency on  dbus-glib dbus-lib gconf gnome-v=
fs libart-lgpl libavahi-client libavahi-common libavahi-glib libbonobo libb=
onoboui libcanberra libcap libgcrypt libgnome libgnome-keyring libgnomecanv=
as libgnomeui libgpg-error libice libltdl libogg libsm libvorbis libxcompos=
ite libxcursor libxdamage libxfixes libxrandr orbit2 popt util-linux-libuuid
> gmtk/gmtk/latest lost dependency on  cairo-gobject dbus-lib gtk+3 json-c =
libcap libice libpulse libpulse-mainloop-glib libpulsecommon libsm libsndfi=
le1 libx11-xcb libxi libxtst util-linux-libuuid
> gnokii/libgnokii/latest lost dependency on  bluez4 libical libusb-compat =
libusb1 pcsc-lite-lib
> gnome-panel/gnome-panel/latest lost dependency on  dbus-lib
> gst-plugins-bad/gst-plugins-bad-meta/latest lost dependency on  gst-plugi=
ns-bad-dc1394 gst-plugins-bad-faac gst-plugins-bad-schro
> gst-plugins-good/gst-plugins-good-ximagesrc/latest lost dependency on  li=
bxdamage
> gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ximagesrc/latest lost=
 dependency on  libxdamage
> guile/guile/latest lost dependency on  libgc ncurses-libncurses readline
> libmicrohttpd/libmicrohttpd-bin/latest lost dependency on  file
> libungif/libungif/latest lost dependency on  libice libsm libx11 libxau l=
ibxcb libxdmcp util-linux-libuuid
> libungif/libungif-utils/latest lost dependency on  libx11
> maliit-framework/maliit-framework-gtk/latest lost dependency on  eglibc g=
lib-2.0 gtk+ gtk+3 libgcc libqtcore4 maliit-framework pango
> midori/midori/latest lost dependency on  libxscrnsaver
> mongodb/mongodb/latest lost dependency on  libpcap
> mpd/mpd/latest lost dependency on  fluidsynth libao libcdio libcdio-cdda =
libcdio-paranoia libjack libmms libmodplug libopus mpg123 openal-soft wavpa=
ck yajl
> mpeg2dec/mpeg2dec/latest lost dependency on  libx11 libxext libxv
> mpg123/mpg123/latest lost dependency on  audiofile esound libjack libsdl =
openal-soft portaudio-v19 tslib
> navit/navit/latest lost dependency on  fribidi
> navit/navit-graphics-gtk/latest lost dependency on  imlib2
> navit/navit-graphics-sdl/latest lost dependency on  eglibc freetype libjp=
eg-turbo liblzma libpng libsdl libsdl-image tiff tslib zlib
> opencv/libopencv-highgui/latest lost dependency on  jasper libdc1394
> oscam/oscam/latest lost dependency on  pcsc-lite-lib
> piglit/piglit/latest lost dependency on  libxrender
> protobuf/protobuf/latest lost dependency on  zlib
> python-efl/python-edje/latest lost dependency on  edje eglibc eina libpyt=
hon2
> python-efl/python-elementary/latest lost dependency on  eglibc eina eleme=
ntary evas libpython2
> sox/sox/latest lost dependency on  libao
> stunnel/stunnel/latest lost dependency on  libwrap zlib
> synergy/synergy/latest lost dependency on  libxinerama
> tracker/tracker/latest lost dependency on  dbus-glib enca gnutls gtk+3 li=
bgee libgsf libgudev-1.0 libnmglib libnmutil libtasn1 libudev libunistring =
upower
> tracker/tracker-dev/latest lost dependency on  cairo enca expat fontconfi=
g freetype giflib gstreamer lcms libbz2 libgsf libgstpbutils-0.10 libgsttag=
-0.10 liblzma libpoppler libpoppler-glib libunistring libx11 libxau libxcb =
libxcb-render libxcb-shm libxdmcp libxext libxrender pixman taglib taglib-c=
 tiff
> tracker/tracker-nautilus-extension/latest lost dependency on  atk cairo e=
glibc expat fontconfig freetype gdk-pixbuf glib-2.0 gtk+ harfbuzz libffi li=
bpng libsqlite3 libunistring libx11 libxau libxcb libxcb-render libxcb-shm =
libxdmcp libxext libxrender pango pixman tracker util-linux-libuuid zlib
> tumbler/tumbler/latest lost dependency on  gstreamer1.0 libbz2 libgsf lib=
gsttag-1.0 libxml2
> vagalume/vagalume/latest lost dependency on  libproxy
> weston/weston/latest lost dependency on  lcms
> weston/weston-examples/latest lost dependency on  libpoppler-glib
> wv/wv/latest lost dependency on  libpng
> wvstreams/wvstreams/latest lost dependency on  dbus-lib libwvstreams-base=
 readline
> xdelta3/xdelta3/latest lost dependency on  liblzma
> xserver-xorg/xserver-xorg/latest lost dependency on  libunwind
> xserver-xorg/xserver-xorg-xvfb/latest lost dependency on  libunwind
> xterm/xterm/latest lost dependency on  fontconfig libxft
> perf/perf/latest lost dependency on  libunwind
>=20
> Found errors:=20
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
>=20
> 77587.36user 91276.42system 17:59:28elapsed 260%CPU (0avgtext+0avgdata 44=
78704maxresident)k
> 31330272inputs+25791528outputs (1501major+2660115942minor)pagefaults 0swa=
ps
>=20
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--QOa9dl9wYIBIim/b
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNs0FUACgkQN1Ujt2V2gBxLyQCfTe2OfB3TYlI+ZuQAWo60GvrC
tAsAnjKvC9OeK1eEJMWZlnu4Lu2LARvv
=3yOm
-----END PGP SIGNATURE-----

--QOa9dl9wYIBIim/b--
