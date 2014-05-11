Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f47.google.com (unknown [209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id B070460167;
	Sun, 11 May 2014 06:59:02 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id pn19so1021250lab.34
	for <multiple recipients>; Sat, 10 May 2014 23:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=4HvF5oNFLSC9H/+dcwk/K+aC2cMf1boAxEB0hLGyCBA=;
	b=amKE7MM2LtFZwm+clcMVIWMPbcbDCVBuO/v+t8thyYEQFch9OUqHZtAk5ohxF3UujL
	iMHuZJnz+cHtJL+1Yoid24LRT4EEBCrzGcMy5m7zQLge6CYeHY2htG04v+47tL8k2AvV
	L42mDMC+XCvh1qQbp+dfATxWEJfkfxybvUPlaUMujmfKEQVWR4KLHLsTIgr0HdJVJ93p
	Y+uKsqEn6gkjs37cfYNmqY0aSloLdQPlIaP7y6aDgfb4COnAkFqifTtGKy3CCW/b6/U6
	PtqqW3CrBAT8DiDQyVaZmxJAGJfa5NFCDWBWrbOiS8iSgd3h3uIGK/DdG8a8/oNxFm+g
	3DOw==
X-Received: by 10.152.23.42 with SMTP id j10mr7287956laf.19.1399791542208;
	Sat, 10 May 2014 23:59:02 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	n6sm7002864laj.17.2014.05.10.23.59.00 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 10 May 2014 23:59:01 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 11 May 2014 08:59:27 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140511065927.GD22774@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, test-dependencies 2014-05-11
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
X-List-Received-Date: Sun, 11 May 2014 06:59:06 -0000
X-Groupsio-MsgNum: 53068
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bajzpZikUji1w+G9"
Content-Disposition: inline

--bajzpZikUji1w+G9
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 09, 2014 at 02:55:49PM +0200, Martin Jansa wrote:
> On Fri, May 09, 2014 at 01:37:46PM +0200, Martin Jansa wrote:
> > On Tue, May 06, 2014 at 09:51:44PM +0200, Martin Jansa wrote:
> > > On Fri, Apr 25, 2014 at 03:00:09AM +0200, Martin Jansa wrote:
> > > > On Fri, Apr 18, 2014 at 08:36:32PM +0200, Martin Jansa wrote:
> > > > > On Thu, Apr 03, 2014 at 03:06:09PM +0200, Martin Jansa wrote:
> > > > > > I've just started this long test-dependencies build so jenkins =
will be busy
> > > > > > for next 14 days or so, but I'll send complete qa.log in advanc=
e as soon as
> > > > > > it finishes building world from scratch.
> > > >=20
> > > > This one is only "incremental" (so testing only recipes which faile=
d in
> > > > previous run) and it took only 3,5 days to finish :).
> > > >=20
> > > > Mostly because of firefox (libnotify) and efl/lua fix we're down to=
 72 recipes with
> > > > issues (instead of 187 found in previous run or 100 w/o firefox*)
> > >=20
> > > I've sent couple of WIP patches to oe-devel ML and now we're down to =
50
> > > recipes with issues, there are still 2 days to send patches for daisy,
> > > so hurry up.
> > >=20
> > > Complete logs:
> > > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.dep=
endencies.20140506_041120.log/
> >=20
> > Big thanks to Tim Orling and Andreas M=FCller for sending fixes for vlc
> > and xfce recipes we're down to=20
>=20
> -ENOCOFFEE: down to 44 :)
>=20
> recipes fixed in last iteration:
>=20
> < console-tools
> < gimp
> < qtbase
> < vlc
> < xfce4-settings
> < xfce4-weather-plugin

Complete logs:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.dependenc=
ies.20140510_150213.log/

Recipes fixed in last iteration (patches on ML)
< tk
< gst-plugins-bad
< gst-plugins-good
< gstreamer1.0-plugins-good
< libao
< navit
< sox
< xterm

I'm still looking into python-efl and now also mongodb and maliit-framework=
 which I would like to finish before branching daisy

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
gnome-panel/gnome-panel/latest lost dependency on  dbus-lib
guile/guile/latest lost dependency on  libgc ncurses-libncurses readline
libmicrohttpd/libmicrohttpd-bin/latest lost dependency on  file
libungif/libungif/latest lost dependency on  libice libsm libx11 libxau lib=
xcb libxdmcp util-linux-libuuid
libungif/libungif-utils/latest lost dependency on  libx11
maliit-framework/maliit-framework-gtk/latest lost dependency on  eglibc gli=
b-2.0 gtk+ gtk+3 libgcc libqtcore4 maliit-framework pango
midori/midori/latest lost dependency on  libxscrnsaver
mongodb/mongodb/latest lost dependency on  libpcap
mpd/mpd/latest lost dependency on  fluidsynth libao libcdio libcdio-cdda li=
bcdio-paranoia libjack libmms libmodplug libopus mpg123 openal-soft wavpack=
 yajl
mpeg2dec/mpeg2dec/latest lost dependency on  libx11 libxext libxv
mpg123/mpg123/latest lost dependency on  audiofile esound libjack libsdl op=
enal-soft portaudio-v19 tslib
opencv/libopencv-highgui/latest lost dependency on  jasper libdc1394
oscam/oscam/latest lost dependency on  pcsc-lite-lib
piglit/piglit/latest lost dependency on  libxrender
protobuf/protobuf/latest lost dependency on  zlib
python-efl/python-edje/latest lost dependency on  edje eglibc eina libpytho=
n2
python-efl/python-elementary/latest lost dependency on  eglibc eina element=
ary evas libpython2
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
weston/weston/latest lost dependency on  lcms
weston/weston-examples/latest lost dependency on  libpoppler-glib
wv/wv/latest lost dependency on  libpng
wvstreams/wvstreams/latest lost dependency on  dbus-lib libwvstreams-base r=
eadline
xdelta3/xdelta3/latest lost dependency on  liblzma
xserver-xorg/xserver-xorg/latest lost dependency on  libunwind
xserver-xorg/xserver-xorg-xvfb/latest lost dependency on  libunwind
perf/perf/latest lost dependency on  libunwind

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bajzpZikUji1w+G9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNvH88ACgkQN1Ujt2V2gBySpwCbBp4VDPJQUVhNh1SXIRijisUH
UfcAoK4AR3iz2G1jQme1xjugOHHMRJPv
=/MeM
-----END PGP SIGNATURE-----

--bajzpZikUji1w+G9--
