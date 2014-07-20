Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id E2ADF6AC74;
	Sun, 20 Jul 2014 08:42:11 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id x48so6417407wes.33
	for <multiple recipients>; Sun, 20 Jul 2014 01:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=vINiAZszX0oKKorZD6On5zJXwIQDk92cZJRw//vRqXE=;
	b=iC5VqFftX5Qf2yNLlTzVt4aoD4DU6+hwep1XS1bwT3S0I7w/3RNx10LwRufMizueab
	c4RT4at6L+FoPmEMKl9kfM6Wy0j4x/pxmMmY7Ht+fOXWsNOpHKZTSJKC6uaVzopVIXb6
	DC+qyqcjWQT7ZyQUFSQlgTEvUOY3eKEukU2HtIEEs0bl1aSTAk1PUDFADf66eczoNj6U
	j8JfdwBbvZHT0Mf3i4xde6c3ZEB/QFfLIWM2XXJKntZq0MT9IUfWp9Uf4fxpzRHrqop5
	dkzPeTxB/Qg7j3OrqaW6HojAmfEXOaxSNMMvUQ8CJhtKfySuMIYsTlBT2saG/SODFJH/
	AwHA==
X-Received: by 10.180.85.101 with SMTP id g5mr46767309wiz.51.1405845732205;
	Sun, 20 Jul 2014 01:42:12 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ub11sm27729039wib.1.2014.07.20.01.42.10 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Jul 2014 01:42:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 20 Jul 2014 10:42:25 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140720084225.GV2433@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, test-dependencies 2014-07-19
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
X-List-Received-Date: Sun, 20 Jul 2014 08:42:13 -0000
X-Groupsio-MsgNum: 55238
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tkNMN34SQOq6NafI"
Content-Disposition: inline

--tkNMN34SQOq6NafI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Another incremental with many fixes for foreign automake and missing
dependencies for m4 macro providers.

Complete logs:
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20140719_04=
1555.log/

ERROR: 158 issues were found in these recipes: clutter-box2d exo firefox
fso-gpsd gmtk gst-ffmpeg libgnomeprint libhybris liboauth libxfce4ui
lksctp-tools llvm2 llvm3 lttng-modules mkvtoolnix mokomaze monkey
openal-soft orage packagegroup-shr packagegroup-shr-feed
packagegroup-shr-minimal packagegroup-xfce-base
packagegroup-xfce-multimedia pidgin pseudo python-efl rtorrent sensmon
ser2net shr-settings shr-wizard snort thunar thunar-archive-plugin
thunar-media-tags-plugin thunar-volman valacompass vlc wireshark
xfce4-appfinder xfce4-battery-plugin xfce4-clipman-plugin
xfce4-closebutton-plugin xfce4-cpufreq-plugin xfce4-cpugraph-plugin
xfce4-datetime-plugin xfce4-diskperf-plugin xfce4-embed-plugin
xfce4-equake-plugin xfce4-eyes-plugin xfce4-fsguard-plugin
xfce4-genmon-plugin xfce4-mixer xfce4-mount-plugin xfce4-mpc-plugin
xfce4-netload-plugin xfce4-notes-plugin xfce4-notifyd xfce4-panel
xfce4-places-plugin xfce4-screenshooter xfce4-session xfce4-settings
xfce4-systemload-plugin xfce4-terminal xfce4-time-out-plugin xfce4-vala
xfce4-wavelan-plugin xfce4-weather-plugin xfce4-xkb-plugin xfdesktop
xfmpc xfwm4 xwd zeroc-ice zhone

ccid rdepends on flex but its not a build dependency? [build-deps]
engrave rdepends on flex but its not a build dependency? [build-deps]
epiphany rdepends on libavahi-client but its not a build dependency? [build=
-deps]
epiphany rdepends on libavahi-common but its not a build dependency? [build=
-deps]
epiphany rdepends on libavahi-gobject but its not a build dependency? [buil=
d-deps]
epiphany rdepends on libnotify but its not a build dependency? [build-deps]
evopedia rdepends on libbz2 but its not a build dependency? [build-deps]
expedite rdepends on evas-engine-fb but its not a build dependency? [build-=
deps]
expedite rdepends on evas-engine-software-generic but its not a build depen=
dency? [build-deps]
expedite rdepends on evas-loader-png but its not a build dependency? [build=
-deps]
expedite rdepends on libsdl but its not a build dependency? [build-deps]
gammu rdepends on glib-2.0 but its not a build dependency? [build-deps]
gammu rdepends on libgudev-1.0 but its not a build dependency? [build-deps]
gimp rdepends on libbz2 but its not a build dependency? [build-deps]
glade3 rdepends on dbus-glib but its not a build dependency? [build-deps]
glade3 rdepends on dbus-lib but its not a build dependency? [build-deps]
glade3 rdepends on gconf but its not a build dependency? [build-deps]
glade3 rdepends on gnome-vfs but its not a build dependency? [build-deps]
glade3 rdepends on libart-lgpl but its not a build dependency? [build-deps]
glade3 rdepends on libavahi-client but its not a build dependency? [build-d=
eps]
glade3 rdepends on libavahi-common but its not a build dependency? [build-d=
eps]
glade3 rdepends on libavahi-glib but its not a build dependency? [build-dep=
s]
glade3 rdepends on libbonobo but its not a build dependency? [build-deps]
glade3 rdepends on libbonoboui but its not a build dependency? [build-deps]
glade3 rdepends on libcanberra but its not a build dependency? [build-deps]
glade3 rdepends on libcap but its not a build dependency? [build-deps]
glade3 rdepends on libgcrypt but its not a build dependency? [build-deps]
glade3 rdepends on libgnome but its not a build dependency? [build-deps]
glade3 rdepends on libgnome-keyring but its not a build dependency? [build-=
deps]
glade3 rdepends on libgnomecanvas but its not a build dependency? [build-de=
ps]
glade3 rdepends on libgnomeui but its not a build dependency? [build-deps]
glade3 rdepends on libgpg-error but its not a build dependency? [build-deps]
glade3 rdepends on libltdl but its not a build dependency? [build-deps]
glade3 rdepends on libogg but its not a build dependency? [build-deps]
glade3 rdepends on libvorbis but its not a build dependency? [build-deps]
glade3 rdepends on orbit2 but its not a build dependency? [build-deps]
glade3 rdepends on popt but its not a build dependency? [build-deps]
gnokii rdepends on readline but its not a build dependency? [build-deps]
gtksourceview2 rdepends on libxml2 but its not a build dependency? [build-d=
eps]
imagemagick rdepends on libwebp but its not a build dependency? [build-deps]
kernelshark rdepends on libxml2 but its not a build dependency? [build-deps]
libgammu rdepends on glib-2.0 but its not a build dependency? [build-deps]
libgnokii rdepends on bluez4 but its not a build dependency? [build-deps]
libgnokii rdepends on libical but its not a build dependency? [build-deps]
libgnokii rdepends on libusb-compat but its not a build dependency? [build-=
deps]
libgnokii rdepends on libusb1 but its not a build dependency? [build-deps]
libgnokii rdepends on pcsc-lite-lib but its not a build dependency? [build-=
deps]
liboauth rdepends on libcrypto but its not a build dependency? [build-deps]
midori rdepends on libxscrnsaver but its not a build dependency? [build-dep=
s]
modemmanager rdepends on dbus-glib but its not a build dependency? [build-d=
eps]
mpg123 rdepends on audiofile but its not a build dependency? [build-deps]
mpg123 rdepends on esound but its not a build dependency? [build-deps]
mpg123 rdepends on libjack but its not a build dependency? [build-deps]
mpg123 rdepends on libsdl but its not a build dependency? [build-deps]
mpg123 rdepends on openal-soft but its not a build dependency? [build-deps]
mpg123 rdepends on portaudio-v19 but its not a build dependency? [build-dep=
s]
mpg123 rdepends on tslib but its not a build dependency? [build-deps]
piglit rdepends on libxrender but its not a build dependency? [build-deps]
qemu rdepends on libusb1 but its not a build dependency? [build-deps]
qtbase-plugins rdepends on cups-lib but its not a build dependency? [build-=
deps]
qtimageformats-plugins rdepends on jasper but its not a build dependency? [=
build-deps]
qtimageformats-plugins rdepends on libwebp but its not a build dependency? =
[build-deps]
qttools-plugins rdepends on qtwebkit but its not a build dependency? [build=
-deps]
qttools-tools rdepends on qtwebkit but its not a build dependency? [build-d=
eps]
qtwebkit rdepends on libwebp but its not a build dependency? [build-deps]
rtorrent rdepends on ncurses-libncursesw but its not a build dependency? [b=
uild-deps]
rtorrent rdepends on ncurses-libtinfo but its not a build dependency? [buil=
d-deps]
sox rdepends on libvorbis but its not a build dependency? [build-deps]
tracker rdepends on enca but its not a build dependency? [build-deps]
tracker rdepends on gtk+3 but its not a build dependency? [build-deps]
tracker rdepends on libgee but its not a build dependency? [build-deps]
tracker rdepends on libgnome-keyring but its not a build dependency? [build=
-deps]
tracker rdepends on libunistring but its not a build dependency? [build-dep=
s]
tracker rdepends on upower but its not a build dependency? [build-deps]
tracker-dev rdepends on enca but its not a build dependency? [build-deps]
tracker-dev rdepends on giflib but its not a build dependency? [build-deps]
tracker-dev rdepends on lcms but its not a build dependency? [build-deps]
tracker-dev rdepends on libgstpbutils-0.10 but its not a build dependency? =
[build-deps]
tracker-dev rdepends on libgsttag-0.10 but its not a build dependency? [bui=
ld-deps]
tracker-dev rdepends on liblzma but its not a build dependency? [build-deps]
tracker-dev rdepends on libpoppler but its not a build dependency? [build-d=
eps]
tracker-dev rdepends on libpoppler-glib but its not a build dependency? [bu=
ild-deps]
tracker-dev rdepends on libunistring but its not a build dependency? [build=
-deps]
tracker-dev rdepends on taglib but its not a build dependency? [build-deps]
tracker-dev rdepends on taglib-c but its not a build dependency? [build-dep=
s]
tracker-dev rdepends on tiff but its not a build dependency? [build-deps]
ttf-mplus-1c-black rdepends on ttf-common but its not a build dependency? [=
build-deps]
ttf-mplus-1c-bold rdepends on ttf-common but its not a build dependency? [b=
uild-deps]
ttf-mplus-1c-heavy rdepends on ttf-common but its not a build dependency? [=
build-deps]
ttf-mplus-1c-light rdepends on ttf-common but its not a build dependency? [=
build-deps]
ttf-mplus-1c-medium rdepends on ttf-common but its not a build dependency? =
[build-deps]
ttf-mplus-1c-regular rdepends on ttf-common but its not a build dependency?=
 [build-deps]
ttf-mplus-1c-thin rdepends on ttf-common but its not a build dependency? [b=
uild-deps]
ttf-mplus-1m-bold rdepends on ttf-common but its not a build dependency? [b=
uild-deps]
ttf-mplus-1m-light rdepends on ttf-common but its not a build dependency? [=
build-deps]
ttf-mplus-1m-medium rdepends on ttf-common but its not a build dependency? =
[build-deps]
ttf-mplus-1m-regular rdepends on ttf-common but its not a build dependency?=
 [build-deps]
ttf-mplus-1m-thin rdepends on ttf-common but its not a build dependency? [b=
uild-deps]
ttf-mplus-1mn-bold rdepends on ttf-common but its not a build dependency? [=
build-deps]
ttf-mplus-1mn-light rdepends on ttf-common but its not a build dependency? =
[build-deps]
ttf-mplus-1mn-medium rdepends on ttf-common but its not a build dependency?=
 [build-deps]
ttf-mplus-1mn-regular rdepends on ttf-common but its not a build dependency=
? [build-deps]
ttf-mplus-1mn-thin rdepends on ttf-common but its not a build dependency? [=
build-deps]
ttf-mplus-1p-black rdepends on ttf-common but its not a build dependency? [=
build-deps]
ttf-mplus-1p-bold rdepends on ttf-common but its not a build dependency? [b=
uild-deps]
ttf-mplus-1p-heavy rdepends on ttf-common but its not a build dependency? [=
build-deps]
ttf-mplus-1p-light rdepends on ttf-common but its not a build dependency? [=
build-deps]
ttf-mplus-1p-medium rdepends on ttf-common but its not a build dependency? =
[build-deps]
ttf-mplus-1p-regular rdepends on ttf-common but its not a build dependency?=
 [build-deps]
ttf-mplus-1p-thin rdepends on ttf-common but its not a build dependency? [b=
uild-deps]
ttf-mplus-2c-black rdepends on ttf-common but its not a build dependency? [=
build-deps]
ttf-mplus-2c-bold rdepends on ttf-common but its not a build dependency? [b=
uild-deps]
ttf-mplus-2c-heavy rdepends on ttf-common but its not a build dependency? [=
build-deps]
ttf-mplus-2c-light rdepends on ttf-common but its not a build dependency? [=
build-deps]
ttf-mplus-2c-medium rdepends on ttf-common but its not a build dependency? =
[build-deps]
ttf-mplus-2c-regular rdepends on ttf-common but its not a build dependency?=
 [build-deps]
ttf-mplus-2c-thin rdepends on ttf-common but its not a build dependency? [b=
uild-deps]
ttf-mplus-2m-bold rdepends on ttf-common but its not a build dependency? [b=
uild-deps]
ttf-mplus-2m-light rdepends on ttf-common but its not a build dependency? [=
build-deps]
ttf-mplus-2m-medium rdepends on ttf-common but its not a build dependency? =
[build-deps]
ttf-mplus-2m-regular rdepends on ttf-common but its not a build dependency?=
 [build-deps]
ttf-mplus-2m-thin rdepends on ttf-common but its not a build dependency? [b=
uild-deps]
ttf-mplus-2p-black rdepends on ttf-common but its not a build dependency? [=
build-deps]
ttf-mplus-2p-bold rdepends on ttf-common but its not a build dependency? [b=
uild-deps]
ttf-mplus-2p-heavy rdepends on ttf-common but its not a build dependency? [=
build-deps]
ttf-mplus-2p-light rdepends on ttf-common but its not a build dependency? [=
build-deps]
ttf-mplus-2p-medium rdepends on ttf-common but its not a build dependency? =
[build-deps]
ttf-mplus-2p-regular rdepends on ttf-common but its not a build dependency?=
 [build-deps]
ttf-mplus-2p-thin rdepends on ttf-common but its not a build dependency? [b=
uild-deps]
xwd rdepends on libxkbfile but its not a build dependency? [build-deps]

and some which weren't detected by insane_qa check:
WARN: packages/armv5te-oe-linux-gnueabi/gmtk/gmtk/latest lost dependency on=
  cairo-gobject dbus-lib gtk+3 json-c libcap libice libpulse libpulse-mainl=
oop-glib libsm libsndfile1 libx11-xcb libxi libxtst util-linux-libuuid
WARN: packages/armv5te-oe-linux-gnueabi/vagalume/vagalume/latest lost depen=
dency on  libproxy

As bonus there is separate log file for each failing recipe, see
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20140719_04=
1555.log/3_min/failed/
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20140719_04=
1555.log/2_max/failed/

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tkNMN34SQOq6NafI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPLgPEACgkQN1Ujt2V2gBxxrwCeJAlSLuNNc1pgP51xy6ofgZtS
/lAAniMhS2ClTGwACrlkSqftglFPXjvK
=HD8Y
-----END PGP SIGNATURE-----

--tkNMN34SQOq6NafI--
