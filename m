Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id 48C4865DEF;
	Thu, 12 Jun 2014 17:41:29 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id x48so1639168wes.39
	for <multiple recipients>; Thu, 12 Jun 2014 10:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=WtuAO89CtUMFYO2yqZ9FsE/3T0TQzDsUzJKuBtYknY8=;
	b=CAxCJmyAZ3XvX2p07nBGI5tbPPBYaW4fkOCU76xeLBVWkKnGjaRJ88EN1AZZVbZ9Kd
	lJtGCiBKeahS8zXM7Rxo7yAEc9dfhwfj2ec4WrNCAP44XYU3ZZhU+/sCVjqHIS1s9hR6
	uate48Tj0RiPYFIJSZkf1Jxw7SP5XebWsZTYsAtbaPo/XDVshhF47ibud8CtNCJ6Iov/
	Gw/qj5io+/629lkoNZrEOl1rHdS0lYYx4wl++hxqb173ldvbKE2GU43W8Q/m9ZeBC179
	f/Nb/gf8P50Z/fsxKfxEKqne/5xJQd0Q5Eq39cqy54ynit87411YEaDNivJH7vpwND2p
	OSvA==
X-Received: by 10.194.82.170 with SMTP id j10mr64108093wjy.63.1402594886345;
	Thu, 12 Jun 2014 10:41:26 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	v43sm2240859eeo.14.2014.06.12.10.41.25 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Jun 2014 10:41:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 12 Jun 2014 19:41:47 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140612174147.GE2428@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, test-dependencies 2014-06-12
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
X-List-Received-Date: Thu, 12 Jun 2014 17:41:37 -0000
X-Groupsio-MsgNum: 54063
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3XA6nns4nE4KvaS/"
Content-Disposition: inline

--3XA6nns4nE4KvaS/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This time it was "incremental" and it's not really complete because
there is still a lot of failing recipes in "world" (see my other "State"
e-mails).

Complete logs:
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20140611_21=
3746.log/

failed recipes:
abiword:ERROR: Task 333 (meta-openembedded/meta-gnome/recipes-gnome/libgsf/=
libgsf_1.14.26.bb, do_compile) failed with exit code '1'
claws-mail:ERROR: Task 6 (meta-openembedded/meta-oe/recipes-sato/claws-mail=
/claws-mail_3.9.0.bb, do_compile) failed with exit code '1'
claws-plugin-gtkhtml2-viewer:ERROR: Task 206 (meta-openembedded/meta-oe/rec=
ipes-sato/claws-mail/claws-mail_3.9.0.bb, do_compile) failed with exit code=
 '1'
claws-plugin-mailmbox:ERROR: Task 183 (meta-openembedded/meta-oe/recipes-sa=
to/claws-mail/claws-mail_3.9.0.bb, do_compile) failed with exit code '1'
claws-plugin-rssyl:ERROR: Task 206 (meta-openembedded/meta-oe/recipes-sato/=
claws-mail/claws-mail_3.9.0.bb, do_compile) failed with exit code '1'
cups:ERROR: Task 6 (openembedded-core/meta/recipes-extended/cups/cups_1.7.3=
=2Ebb, do_compile) failed with exit code '1'
ghostscript:ERROR: Task 222 (openembedded-core/meta/recipes-extended/cups/c=
ups_1.7.3.bb, do_compile) failed with exit code '1'
gnumeric:ERROR: Task 206 (meta-openembedded/meta-gnome/recipes-gnome/libgsf=
/libgsf_1.14.26.bb, do_compile) failed with exit code '1'
goffice:ERROR: Task 255 (meta-openembedded/meta-gnome/recipes-gnome/libgsf/=
libgsf_1.14.26.bb, do_compile) failed with exit code '1'
libgsf:ERROR: Task 6 (meta-openembedded/meta-gnome/recipes-gnome/libgsf/lib=
gsf_1.14.26.bb, do_compile) failed with exit code '1'
libhybris:ERROR: Task 6 (meta-smartphone/meta-android/recipes-core/libhybri=
s/libhybris_git.bb, do_compile) failed with exit code '1'
liboauth:ERROR: Task 6 (meta-openembedded/meta-oe/recipes-support/liboauth/=
liboauth_1.0.3.bb, do_compile) failed with exit code '1'
mesa:ERROR: Task 5 (openembedded-core/meta/recipes-graphics/mesa/mesa_10.1.=
3.bb, do_configure) failed with exit code '1'
mesa-demos:ERROR: Task 182 (openembedded-core/meta/recipes-graphics/mesa/me=
sa_10.1.3.bb, do_configure) failed with exit code '1'
mesa-glut:ERROR: Task 221 (openembedded-core/meta/recipes-graphics/mesa/mes=
a_10.1.3.bb, do_configure) failed with exit code '1'
packagegroup-shr-feed:ERROR: Task 7931 (meta-smartphone/meta-shr/recipes-sh=
r/shr/python-phoneutils_git.bb, do_compile) failed with exit code '1'
packagegroup-shr-feed:ERROR: Task 7905 (meta-openembedded/meta-oe/recipes-d=
evtools/python/python-pyyaml_3.10.bb, do_compile) failed with exit code '1'
pidgin:ERROR: Task 5 (meta-openembedded/meta-oe/recipes-support/pidgin/pidg=
in_2.7.9.bb, do_configure) failed with exit code '1'
rtorrent:ERROR: Task 5 (meta-openembedded/meta-oe/recipes-connectivity/rtor=
rent/rtorrent_0.9.3.bb, do_configure) failed with exit code '1'
wv:ERROR: Task 183 (meta-openembedded/meta-gnome/recipes-gnome/libgsf/libgs=
f_1.14.26.bb, do_compile) failed with exit code '1'
xwd:ERROR: Task 5 (meta-openembedded/meta-oe/recipes-graphics/xorg-app/xwd_=
1.0.6.bb, do_configure) failed with exit code '1'

Found differences:=20
ccid/ccid/latest lost dependency on  flex
consolekit/consolekit/latest lost dependency on  polkit
directfb/directfb/latest lost dependency on  libdrm libdrm-kms liblzma libw=
ebp tiff
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
bcdio-paranoia libjack libmms libmodplug libopus libwrap mpg123 wavpack yajl
mpeg2dec/mpeg2dec/latest lost dependency on  libx11 libxext libxv
mpg123/mpg123/latest lost dependency on  audiofile esound libjack libsdl po=
rtaudio-v19 tslib
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
weston/weston/latest lost dependency on  libwebp
weston/weston-examples/latest lost dependency on  libwebp
wvstreams/wvstreams/latest lost dependency on  dbus-lib libwvstreams-base r=
eadline
xserver-xorg/xserver-xorg/latest lost dependency on  libunwind libxshmfence=
 nettle
xserver-xorg/xserver-xorg-xvfb/latest lost dependency on  libunwind nettle
perf/perf/latest lost dependency on  libunwind

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3XA6nns4nE4KvaS/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOZ5lsACgkQN1Ujt2V2gBwZWACcDp5HjSjVStcXZT3tQ3Lsrl9q
WlkAnR7lTlabcIOymD6bOgz2P7lq6w6V
=Lpjo
-----END PGP SIGNATURE-----

--3XA6nns4nE4KvaS/--
