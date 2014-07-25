Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 842DC6FC43;
	Fri, 25 Jul 2014 15:40:04 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id u57so4510918wes.10
	for <multiple recipients>; Fri, 25 Jul 2014 08:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=Q81x4WaVlfVALrBfwDBkJJaitEiw4Bu0lDwClijUb3Y=;
	b=AW2IbWJJGkkmCpWR5j6d5f8z2SHA2io1GTQ15bzZwHexjtbeq00Q9Hp/X+Qmv6yPG5
	pHEdxTy2QYyGgrI4Lmo1mJcjMUax6PqwHCC5GovCob7Ti0878TfGAzy+2+LSPovRV4Cb
	3o0qG+w+/+GAa6PzWZevml6EK265WFvN4UGQaxTqrgn+jLCNhWRyIFHfPNJlm1ut9Zt0
	zJbi+1rcBUYD4MzHDspSYqlbdwcgItA92Zg9G0e0iw/Dqp+ZtMucTi0njwP/9amWBRsX
	Z1tLsTu9THFx1KFhO/+ZyMG3emt/6mX07gTkty+oueQFZfMidixE2NWCq8HnNm3IDfz+
	zIZQ==
X-Received: by 10.194.86.164 with SMTP id q4mr23326124wjz.88.1406302804037;
	Fri, 25 Jul 2014 08:40:04 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ja13sm7255758wic.8.2014.07.25.08.40.02 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jul 2014 08:40:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 25 Jul 2014 17:40:21 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140725154021.GW2492@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, test-dependencies 2014-07-25
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
X-List-Received-Date: Fri, 25 Jul 2014 15:40:08 -0000
X-Groupsio-MsgNum: 55573
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qD80nKKiJWXm4UaL"
Content-Disposition: inline

--qD80nKKiJWXm4UaL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Complete logs:
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20140724_14=
5905.log/

It looks good
lttng-modules fix is now merged
monkey work around is on ML waiting for proper fix

modemmanager fix is on ML

ERROR: 46 issues were found in these recipes: gst-ffmpeg lttng-modules mode=
mmanager monkey openal-soft ...

directfb/directfb/latest lost dependency on  libdrm libdrm-kms liblzma libw=
ebp tiff
engrave/engrave/latest lost dependency on  flex
epiphany/epiphany/latest lost dependency on  libavahi-client libavahi-commo=
n libavahi-gobject libnotify
expedite/expedite/latest lost dependency on  libsdl
gd/gd/latest lost dependency on  liblzma tiff
gmtk/gmtk/latest lost dependency on  cairo-gobject dbus-lib gtk+3 json-c li=
bcap libice libpulse libpulse-mainloop-glib libsm libsndfile1 libx11-xcb li=
bxi libxtst util-linux-libuuid
gnome-disk-utility/gnome-disk-utility-libs/latest lost dependency on  libca=
p libgcrypt libgnome-keyring libgpg-error
guile/guile/latest lost dependency on  ncurses-libncurses readline
leptonica/leptonica/latest lost dependency on  giflib
libarchive/libarchive/latest lost dependency on  nettle
libarchive/libarchive-bin/latest lost dependency on  libxml2 nettle
libmicrohttpd/libmicrohttpd-bin/latest lost dependency on  file
libmikmod/libmikmod/latest lost dependency on  dbus-lib json-c libcap libic=
e libpulse libpulse-simple libsm libsndfile1 libx11 libx11-xcb libxau libxc=
b libxdmcp libxext libxi libxtst util-linux-libuuid
libungif/libungif/latest lost dependency on  libice libsm libx11 libxau lib=
xcb libxdmcp util-linux-libuuid
libungif/libungif-utils/latest lost dependency on  libx11
libwebp/libwebp-gif2webp/latest lost dependency on  eglibc giflib libwebp
ltrace/ltrace/latest lost dependency on  libunwind
midori/midori/latest lost dependency on  libxscrnsaver
mpd/mpd/latest lost dependency on  fluidsynth libao libcdio libcdio-cdda li=
bcdio-paranoia libjack libmms libmodplug libopus libwrap mpg123 openal-soft=
 wavpack yajl
mpeg2dec/mpeg2dec/latest lost dependency on  libx11 libxext libxv
mpg123/mpg123/latest lost dependency on  audiofile esound libjack libsdl op=
enal-soft portaudio-v19 tslib
oscam/oscam/latest lost dependency on  pcsc-lite-lib
piglit/piglit/latest lost dependency on  libxrender
protobuf/protobuf/latest lost dependency on  zlib
qemu/qemu/latest lost dependency on  libusb1
qtimageformats/qtimageformats-plugins/latest lost dependency on  jasper lib=
webp
qttools/qttools-plugins/latest lost dependency on  qtwebkit
qttools/qttools-tools/latest lost dependency on  qtwebkit
snort/snort/latest lost dependency on  util-linux-libuuid
sox/sox/latest lost dependency on  libvorbis
stunnel/stunnel/latest lost dependency on  libwrap zlib
synergy/synergy/latest lost dependency on  libxinerama
tesseract/tesseract/latest lost dependency on  giflib
tracker/tracker/latest lost dependency on  enca gtk+3 libgee libunistring u=
power
tracker/tracker-dev/latest lost dependency on  cairo enca expat fontconfig =
freetype giflib gstreamer lcms libgstpbutils-0.10 libgsttag-0.10 liblzma li=
bpoppler libpoppler-glib libunistring libx11 libxau libxcb libxcb-render li=
bxcb-shm libxdmcp libxext libxrender pixman taglib taglib-c tiff
wireshark/wireshark/latest lost dependency on  libcap libnl libnl-genl libn=
l-nf libnl-route portaudio-v19 sbc
perf/perf/latest lost dependency on  libunwind

insane_qa check:
dconf-0.18.0: dconf-editor rdepends on libxml2 but its not a build dependen=
cy? [build-deps]
directfb-1.7.4: directfb rdepends on libdrm but its not a build dependency?=
 [build-deps]
directfb-1.7.4: directfb rdepends on libdrm-kms but its not a build depende=
ncy? [build-deps]
directfb-1.7.4: directfb rdepends on liblzma but its not a build dependency=
? [build-deps]
directfb-1.7.4: directfb rdepends on libwebp but its not a build dependency=
? [build-deps]
directfb-1.7.4: directfb rdepends on tiff but its not a build dependency? [=
build-deps]
engrave-0.0.0+svnr82070: engrave rdepends on flex but its not a build depen=
dency? [build-deps]
epiphany-2.30.6: epiphany rdepends on libavahi-client but its not a build d=
ependency? [build-deps]
epiphany-2.30.6: epiphany rdepends on libavahi-common but its not a build d=
ependency? [build-deps]
epiphany-2.30.6: epiphany rdepends on libavahi-gobject but its not a build =
dependency? [build-deps]
epiphany-2.30.6: epiphany rdepends on libnotify but its not a build depende=
ncy? [build-deps]
evopedia-0.4.2+gitrAUTOINC+36ca70acb4: evopedia rdepends on libbz2 but its =
not a build dependency? [build-deps]
expedite-1.7.9: expedite rdepends on evas-engine-fb but its not a build dep=
endency? [build-deps]
expedite-1.7.9: expedite rdepends on evas-engine-software-generic but its n=
ot a build dependency? [build-deps]
expedite-1.7.9: expedite rdepends on evas-loader-png but its not a build de=
pendency? [build-deps]
expedite-1.7.9: expedite rdepends on libsdl but its not a build dependency?=
 [build-deps]
gd-2.1.0: gd rdepends on liblzma but its not a build dependency? [build-dep=
s]
gd-2.1.0: gd rdepends on tiff but its not a build dependency? [build-deps]
gimp-2.8.10: gimp rdepends on libbz2 but its not a build dependency? [build=
-deps]
gmtk-1.0.5: gmtk rdepends on gtk+3 but its not a build dependency? [build-d=
eps]
gmtk-1.0.5: gmtk rdepends on json-c but its not a build dependency? [build-=
deps]
gmtk-1.0.5: gmtk rdepends on libcap but its not a build dependency? [build-=
deps]
gmtk-1.0.5: gmtk rdepends on libpulse but its not a build dependency? [buil=
d-deps]
gmtk-1.0.5: gmtk rdepends on libpulse-mainloop-glib but its not a build dep=
endency? [build-deps]
gmtk-1.0.5: gmtk rdepends on libsndfile1 but its not a build dependency? [b=
uild-deps]
gmtk-1.0.5: gmtk rdepends on libxi but its not a build dependency? [build-d=
eps]
gmtk-1.0.5: gmtk rdepends on libxtst but its not a build dependency? [build=
-deps]
gnome-disk-utility-2.32.0: gnome-disk-utility-libs rdepends on libgnome-key=
ring but its not a build dependency? [build-deps]
gtksourceview2-2.10.5: gtksourceview2 rdepends on libxml2 but its not a bui=
ld dependency? [build-deps]
guile-2.0.11: guile rdepends on ncurses-libncurses but its not a build depe=
ndency? [build-deps]
guile-2.0.11: guile rdepends on readline but its not a build dependency? [b=
uild-deps]
kernelshark-1.2+gitAUTOINC+7055ffd37b: kernelshark rdepends on libxml2 but =
its not a build dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-cat rdepends on libklibc but its not a build=
 dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-chroot rdepends on libklibc but its not a bu=
ild dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-cpio rdepends on libklibc but its not a buil=
d dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-dd rdepends on libklibc but its not a build =
dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-dmesg rdepends on libklibc but its not a bui=
ld dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-false rdepends on libklibc but its not a bui=
ld dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-fstype rdepends on libklibc but its not a bu=
ild dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-gunzip rdepends on libklibc but its not a bu=
ild dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-gzip rdepends on libklibc but its not a buil=
d dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-halt rdepends on libklibc but its not a buil=
d dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-ipconfig rdepends on libklibc but its not a =
build dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-kill rdepends on libklibc but its not a buil=
d dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-kinit rdepends on libklibc but its not a bui=
ld dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-kinit.shared rdepends on libklibc but its no=
t a build dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-ln rdepends on libklibc but its not a build =
dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-losetup rdepends on libklibc but its not a b=
uild dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-ls rdepends on libklibc but its not a build =
dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-minips rdepends on libklibc but its not a bu=
ild dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-mkdir rdepends on libklibc but its not a bui=
ld dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-mkfifo rdepends on libklibc but its not a bu=
ild dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-mknod rdepends on libklibc but its not a bui=
ld dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-mount rdepends on libklibc but its not a bui=
ld dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-mv rdepends on libklibc but its not a build =
dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-nfsmount rdepends on libklibc but its not a =
build dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-nuke rdepends on libklibc but its not a buil=
d dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-pivot-root rdepends on libklibc but its not =
a build dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-poweroff rdepends on libklibc but its not a =
build dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-readlink rdepends on libklibc but its not a =
build dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-reboot rdepends on libklibc but its not a bu=
ild dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-resume rdepends on libklibc but its not a bu=
ild dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-run-init rdepends on libklibc but its not a =
build dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-sh.shared rdepends on libklibc but its not a=
 build dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-sleep rdepends on libklibc but its not a bui=
ld dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-sync rdepends on libklibc but its not a buil=
d dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-true rdepends on libklibc but its not a buil=
d dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-umount rdepends on libklibc but its not a bu=
ild dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-uname rdepends on libklibc but its not a bui=
ld dependency? [build-deps]
klibc-utils-2.0.4: klibc-utils-zcat rdepends on libklibc but its not a buil=
d dependency? [build-deps]
leptonica-1.70: leptonica rdepends on giflib but its not a build dependency=
? [build-deps]
libarchive-3.1.2: libarchive rdepends on nettle but its not a build depende=
ncy? [build-deps]
libarchive-3.1.2: libarchive-bin rdepends on nettle but its not a build dep=
endency? [build-deps]
libextutils-helpers-perl-0.022: libextutils-helpers-perl rdepends on perl-m=
odule-module-load but its not a build dependency? [build-deps]
libmicrohttpd-0.9.34: libmicrohttpd rdepends on libssl but its not a build =
dependency? [build-deps]
libmicrohttpd-0.9.34: libmicrohttpd-bin rdepends on file but its not a buil=
d dependency? [build-deps]
libmikmod-3.3.6: libmikmod rdepends on dbus-lib but its not a build depende=
ncy? [build-deps]
libmikmod-3.3.6: libmikmod rdepends on json-c but its not a build dependenc=
y? [build-deps]
libmikmod-3.3.6: libmikmod rdepends on libcap but its not a build dependenc=
y? [build-deps]
libmikmod-3.3.6: libmikmod rdepends on libice but its not a build dependenc=
y? [build-deps]
libmikmod-3.3.6: libmikmod rdepends on libpulse but its not a build depende=
ncy? [build-deps]
libmikmod-3.3.6: libmikmod rdepends on libpulse-simple but its not a build =
dependency? [build-deps]
libmikmod-3.3.6: libmikmod rdepends on libsm but its not a build dependency=
? [build-deps]
libmikmod-3.3.6: libmikmod rdepends on libsndfile1 but its not a build depe=
ndency? [build-deps]
libmikmod-3.3.6: libmikmod rdepends on libx11 but its not a build dependenc=
y? [build-deps]
libmikmod-3.3.6: libmikmod rdepends on libx11-xcb but its not a build depen=
dency? [build-deps]
libmikmod-3.3.6: libmikmod rdepends on libxau but its not a build dependenc=
y? [build-deps]
libmikmod-3.3.6: libmikmod rdepends on libxcb but its not a build dependenc=
y? [build-deps]
libmikmod-3.3.6: libmikmod rdepends on libxdmcp but its not a build depende=
ncy? [build-deps]
libmikmod-3.3.6: libmikmod rdepends on libxext but its not a build dependen=
cy? [build-deps]
libmikmod-3.3.6: libmikmod rdepends on libxi but its not a build dependency=
? [build-deps]
libmikmod-3.3.6: libmikmod rdepends on libxtst but its not a build dependen=
cy? [build-deps]
libmikmod-3.3.6: libmikmod rdepends on util-linux-libuuid but its not a bui=
ld dependency? [build-deps]
libmodule-build-tiny-perl-0.036: libmodule-build-tiny-perl rdepends on perl=
-module-cpan-meta but its not a build dependency? [build-deps]
libmodule-build-tiny-perl-0.036: libmodule-build-tiny-perl rdepends on perl=
-module-module-load but its not a build dependency? [build-deps]
libungif-4.1.4: libungif rdepends on libice but its not a build dependency?=
 [build-deps]
libungif-4.1.4: libungif rdepends on libsm but its not a build dependency? =
[build-deps]
libungif-4.1.4: libungif rdepends on libx11 but its not a build dependency?=
 [build-deps]
libungif-4.1.4: libungif rdepends on libxau but its not a build dependency?=
 [build-deps]
libungif-4.1.4: libungif rdepends on libxcb but its not a build dependency?=
 [build-deps]
libungif-4.1.4: libungif rdepends on libxdmcp but its not a build dependenc=
y? [build-deps]
libungif-4.1.4: libungif rdepends on util-linux-libuuid but its not a build=
 dependency? [build-deps]
libungif-4.1.4: libungif-utils rdepends on libx11 but its not a build depen=
dency? [build-deps]
libwebp-0.4.0: libwebp-gif2webp rdepends on giflib but its not a build depe=
ndency? [build-deps]
libxklavier-5.3: libxklavier rdepends on libxml2 but its not a build depend=
ency? [build-deps]
ltrace-git: ltrace rdepends on libunwind but its not a build dependency? [b=
uild-deps]
midori-0.5.5: midori rdepends on libxscrnsaver but its not a build dependen=
cy? [build-deps]
modemmanager-0.6.0.0: modemmanager rdepends on dbus-glib but its not a buil=
d dependency? [build-deps]
mpd-0.18.9: mpd rdepends on fluidsynth but its not a build dependency? [bui=
ld-deps]
mpd-0.18.9: mpd rdepends on libao but its not a build dependency? [build-de=
ps]
mpd-0.18.9: mpd rdepends on libcdio but its not a build dependency? [build-=
deps]
mpd-0.18.9: mpd rdepends on libcdio-cdda but its not a build dependency? [b=
uild-deps]
mpd-0.18.9: mpd rdepends on libcdio-paranoia but its not a build dependency=
? [build-deps]
mpd-0.18.9: mpd rdepends on libjack but its not a build dependency? [build-=
deps]
mpd-0.18.9: mpd rdepends on libmms but its not a build dependency? [build-d=
eps]
mpd-0.18.9: mpd rdepends on libmodplug but its not a build dependency? [bui=
ld-deps]
mpd-0.18.9: mpd rdepends on libopus but its not a build dependency? [build-=
deps]
mpd-0.18.9: mpd rdepends on libwrap but its not a build dependency? [build-=
deps]
mpd-0.18.9: mpd rdepends on mpg123 but its not a build dependency? [build-d=
eps]
mpd-0.18.9: mpd rdepends on openal-soft but its not a build dependency? [bu=
ild-deps]
mpd-0.18.9: mpd rdepends on wavpack but its not a build dependency? [build-=
deps]
mpd-0.18.9: mpd rdepends on yajl but its not a build dependency? [build-dep=
s]
mpeg2dec-0.4.1: mpeg2dec rdepends on libxext but its not a build dependency=
? [build-deps]
mpeg2dec-0.4.1: mpeg2dec rdepends on libxv but its not a build dependency? =
[build-deps]
mpg123-1.19.0: mpg123 rdepends on audiofile but its not a build dependency?=
 [build-deps]
mpg123-1.19.0: mpg123 rdepends on esound but its not a build dependency? [b=
uild-deps]
mpg123-1.19.0: mpg123 rdepends on libjack but its not a build dependency? [=
build-deps]
mpg123-1.19.0: mpg123 rdepends on libsdl but its not a build dependency? [b=
uild-deps]
mpg123-1.19.0: mpg123 rdepends on openal-soft but its not a build dependenc=
y? [build-deps]
mpg123-1.19.0: mpg123 rdepends on portaudio-v19 but its not a build depende=
ncy? [build-deps]
mpg123-1.19.0: mpg123 rdepends on tslib but its not a build dependency? [bu=
ild-deps]
oscam-1.10+9164: oscam rdepends on pcsc-lite-lib but its not a build depend=
ency? [build-deps]
perf-1.0: perf rdepends on libunwind but its not a build dependency? [build=
-deps]
piglit-1.0+gitrAUTOINC+bbeff5d21b: piglit rdepends on libxrender but its no=
t a build dependency? [build-deps]
protobuf-2.4.1: protobuf rdepends on zlib but its not a build dependency? [=
build-deps]
qemu-2.0.0: qemu rdepends on libusb1 but its not a build dependency? [build=
-deps]
qtimageformats-5.3.1: qtimageformats-plugins rdepends on jasper but its not=
 a build dependency? [build-deps]
qtimageformats-5.3.1: qtimageformats-plugins rdepends on libwebp but its no=
t a build dependency? [build-deps]
qttools-5.3.1: qttools-plugins rdepends on qtwebkit but its not a build dep=
endency? [build-deps]
qttools-5.3.1: qttools-tools rdepends on qtwebkit but its not a build depen=
dency? [build-deps]
snort-2.9.6.0: snort rdepends on util-linux-libuuid but its not a build dep=
endency? [build-deps]
sox-14.4.0: sox rdepends on libvorbis but its not a build dependency? [buil=
d-deps]
stunnel-4.56: stunnel rdepends on libwrap but its not a build dependency? [=
build-deps]
stunnel-4.56: stunnel rdepends on zlib but its not a build dependency? [bui=
ld-deps]
synergy-1.3.8: synergy rdepends on libxinerama but its not a build dependen=
cy? [build-deps]
tesseract-3.02.02: tesseract rdepends on giflib but its not a build depende=
ncy? [build-deps]
tnftp-20130505: tnftp rdepends on libcrypto but its not a build dependency?=
 [build-deps]
tnftp-20130505: tnftp rdepends on libssl but its not a build dependency? [b=
uild-deps]
tracker-0.14.2: tracker rdepends on enca but its not a build dependency? [b=
uild-deps]
tracker-0.14.2: tracker rdepends on gtk+3 but its not a build dependency? [=
build-deps]
tracker-0.14.2: tracker rdepends on libgee but its not a build dependency? =
[build-deps]
tracker-0.14.2: tracker rdepends on libgnome-keyring but its not a build de=
pendency? [build-deps]
tracker-0.14.2: tracker rdepends on libunistring but its not a build depend=
ency? [build-deps]
tracker-0.14.2: tracker rdepends on upower but its not a build dependency? =
[build-deps]
tracker-0.14.2: tracker-dev rdepends on enca but its not a build dependency=
? [build-deps]
tracker-0.14.2: tracker-dev rdepends on giflib but its not a build dependen=
cy? [build-deps]
tracker-0.14.2: tracker-dev rdepends on lcms but its not a build dependency=
? [build-deps]
tracker-0.14.2: tracker-dev rdepends on libgstpbutils-0.10 but its not a bu=
ild dependency? [build-deps]
tracker-0.14.2: tracker-dev rdepends on libgsttag-0.10 but its not a build =
dependency? [build-deps]
tracker-0.14.2: tracker-dev rdepends on liblzma but its not a build depende=
ncy? [build-deps]
tracker-0.14.2: tracker-dev rdepends on libpoppler but its not a build depe=
ndency? [build-deps]
tracker-0.14.2: tracker-dev rdepends on libpoppler-glib but its not a build=
 dependency? [build-deps]
tracker-0.14.2: tracker-dev rdepends on libunistring but its not a build de=
pendency? [build-deps]
tracker-0.14.2: tracker-dev rdepends on taglib but its not a build dependen=
cy? [build-deps]
tracker-0.14.2: tracker-dev rdepends on taglib-c but its not a build depend=
ency? [build-deps]
tracker-0.14.2: tracker-dev rdepends on tiff but its not a build dependency=
? [build-deps]
ttf-mplus-027: ttf-mplus-1c-black rdepends on ttf-common but its not a buil=
d dependency? [build-deps]
ttf-mplus-027: ttf-mplus-1c-bold rdepends on ttf-common but its not a build=
 dependency? [build-deps]
ttf-mplus-027: ttf-mplus-1c-heavy rdepends on ttf-common but its not a buil=
d dependency? [build-deps]
ttf-mplus-027: ttf-mplus-1c-light rdepends on ttf-common but its not a buil=
d dependency? [build-deps]
ttf-mplus-027: ttf-mplus-1c-medium rdepends on ttf-common but its not a bui=
ld dependency? [build-deps]
ttf-mplus-027: ttf-mplus-1c-regular rdepends on ttf-common but its not a bu=
ild dependency? [build-deps]
ttf-mplus-027: ttf-mplus-1c-thin rdepends on ttf-common but its not a build=
 dependency? [build-deps]
ttf-mplus-027: ttf-mplus-1m-bold rdepends on ttf-common but its not a build=
 dependency? [build-deps]
ttf-mplus-027: ttf-mplus-1m-light rdepends on ttf-common but its not a buil=
d dependency? [build-deps]
ttf-mplus-027: ttf-mplus-1m-medium rdepends on ttf-common but its not a bui=
ld dependency? [build-deps]
ttf-mplus-027: ttf-mplus-1m-regular rdepends on ttf-common but its not a bu=
ild dependency? [build-deps]
ttf-mplus-027: ttf-mplus-1m-thin rdepends on ttf-common but its not a build=
 dependency? [build-deps]
ttf-mplus-027: ttf-mplus-1mn-bold rdepends on ttf-common but its not a buil=
d dependency? [build-deps]
ttf-mplus-027: ttf-mplus-1mn-light rdepends on ttf-common but its not a bui=
ld dependency? [build-deps]
ttf-mplus-027: ttf-mplus-1mn-medium rdepends on ttf-common but its not a bu=
ild dependency? [build-deps]
ttf-mplus-027: ttf-mplus-1mn-regular rdepends on ttf-common but its not a b=
uild dependency? [build-deps]
ttf-mplus-027: ttf-mplus-1mn-thin rdepends on ttf-common but its not a buil=
d dependency? [build-deps]
ttf-mplus-027: ttf-mplus-1p-black rdepends on ttf-common but its not a buil=
d dependency? [build-deps]
ttf-mplus-027: ttf-mplus-1p-bold rdepends on ttf-common but its not a build=
 dependency? [build-deps]
ttf-mplus-027: ttf-mplus-1p-heavy rdepends on ttf-common but its not a buil=
d dependency? [build-deps]
ttf-mplus-027: ttf-mplus-1p-light rdepends on ttf-common but its not a buil=
d dependency? [build-deps]
ttf-mplus-027: ttf-mplus-1p-medium rdepends on ttf-common but its not a bui=
ld dependency? [build-deps]
ttf-mplus-027: ttf-mplus-1p-regular rdepends on ttf-common but its not a bu=
ild dependency? [build-deps]
ttf-mplus-027: ttf-mplus-1p-thin rdepends on ttf-common but its not a build=
 dependency? [build-deps]
ttf-mplus-027: ttf-mplus-2c-black rdepends on ttf-common but its not a buil=
d dependency? [build-deps]
ttf-mplus-027: ttf-mplus-2c-bold rdepends on ttf-common but its not a build=
 dependency? [build-deps]
ttf-mplus-027: ttf-mplus-2c-heavy rdepends on ttf-common but its not a buil=
d dependency? [build-deps]
ttf-mplus-027: ttf-mplus-2c-light rdepends on ttf-common but its not a buil=
d dependency? [build-deps]
ttf-mplus-027: ttf-mplus-2c-medium rdepends on ttf-common but its not a bui=
ld dependency? [build-deps]
ttf-mplus-027: ttf-mplus-2c-regular rdepends on ttf-common but its not a bu=
ild dependency? [build-deps]
ttf-mplus-027: ttf-mplus-2c-thin rdepends on ttf-common but its not a build=
 dependency? [build-deps]
ttf-mplus-027: ttf-mplus-2m-bold rdepends on ttf-common but its not a build=
 dependency? [build-deps]
ttf-mplus-027: ttf-mplus-2m-light rdepends on ttf-common but its not a buil=
d dependency? [build-deps]
ttf-mplus-027: ttf-mplus-2m-medium rdepends on ttf-common but its not a bui=
ld dependency? [build-deps]
ttf-mplus-027: ttf-mplus-2m-regular rdepends on ttf-common but its not a bu=
ild dependency? [build-deps]
ttf-mplus-027: ttf-mplus-2m-thin rdepends on ttf-common but its not a build=
 dependency? [build-deps]
ttf-mplus-027: ttf-mplus-2p-black rdepends on ttf-common but its not a buil=
d dependency? [build-deps]
ttf-mplus-027: ttf-mplus-2p-bold rdepends on ttf-common but its not a build=
 dependency? [build-deps]
ttf-mplus-027: ttf-mplus-2p-heavy rdepends on ttf-common but its not a buil=
d dependency? [build-deps]
ttf-mplus-027: ttf-mplus-2p-light rdepends on ttf-common but its not a buil=
d dependency? [build-deps]
ttf-mplus-027: ttf-mplus-2p-medium rdepends on ttf-common but its not a bui=
ld dependency? [build-deps]
ttf-mplus-027: ttf-mplus-2p-regular rdepends on ttf-common but its not a bu=
ild dependency? [build-deps]
ttf-mplus-027: ttf-mplus-2p-thin rdepends on ttf-common but its not a build=
 dependency? [build-deps]
webmin-1.620: webmin rdepends on perl-module-timelocal but its not a build =
dependency? [build-deps]
webmin-1.620: webmin-module-proc rdepends on procps but its not a build dep=
endency? [build-deps]
webmin-1.620: webmin-module-raid rdepends on mdadm but its not a build depe=
ndency? [build-deps]
wireshark-1.12.0-rc2: wireshark rdepends on libcap but its not a build depe=
ndency? [build-deps]
wireshark-1.12.0-rc2: wireshark rdepends on libnl but its not a build depen=
dency? [build-deps]
wireshark-1.12.0-rc2: wireshark rdepends on libnl-genl but its not a build =
dependency? [build-deps]
wireshark-1.12.0-rc2: wireshark rdepends on libnl-nf but its not a build de=
pendency? [build-deps]
wireshark-1.12.0-rc2: wireshark rdepends on libnl-route but its not a build=
 dependency? [build-deps]
wireshark-1.12.0-rc2: wireshark rdepends on portaudio-v19 but its not a bui=
ld dependency? [build-deps]
wireshark-1.12.0-rc2: wireshark rdepends on sbc but its not a build depende=
ncy? [build-deps]

As bonus there is separate log file for each failing recipe, see
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20140724_14=
5905.log/3_min/failed/
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20140724_14=
5905.log/2_max/failed/

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qD80nKKiJWXm4UaL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEUEARECAAYFAlPSemUACgkQN1Ujt2V2gBwvqACfWORi/HVNi1p1z+LTpREitOze
kqQAmJgFqh1xpTENltML3eJAO1Wbk2U=
=rQw5
-----END PGP SIGNATURE-----

--qD80nKKiJWXm4UaL--
