Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id DAFAF6AD01;
	Mon, 14 Jul 2014 19:43:11 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id hi2so3194485wib.10
	for <multiple recipients>; Mon, 14 Jul 2014 12:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=qE/hFaPufS3u4LQStcgy2/w41n7DgpjBSaYbAQhZlQI=;
	b=iqbzRI6SsWHHsu91G/CnRj/sBa2KrIPpMc3kfO3pfMq53lokCcjRSRy6Eg1ZJZ2eTs
	gvTzSJ+eVmwksaWlkM3gWZECc86TYwMTqRDAQKjD1ty9wXLhIPK7UWel4AbrIxHEyQeu
	1ChPeIsa7Ozt3yMQSzjF4M8M2d/PkRZkbf4Ho+JsuD4xbE0/1pKL+ImmPS+IFyBOqnrl
	kjWhO2B8aTred3lR/iaQDP4VnnluduRcjlQc4Xj3s7vR8m4/50iDHew1IOgwmw2FqbFM
	3WOxlgn5idSL/GCaor1HhaM5q6RKUtIMg94u/auiNaEDa+JH31t3qZub4l6/RV9T0z97
	12hA==
X-Received: by 10.194.7.167 with SMTP id k7mr21149199wja.11.1405366992091;
	Mon, 14 Jul 2014 12:43:12 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fb8sm34583414wib.15.2014.07.14.12.43.10 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jul 2014 12:43:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 14 Jul 2014 21:43:20 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140714194320.GK2433@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, test-dependencies 2014-06-27
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
X-List-Received-Date: Mon, 14 Jul 2014 19:43:14 -0000
X-Groupsio-MsgNum: 54864
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="w2xx78T4DcG3O+DJ"
Content-Disposition: inline

--w2xx78T4DcG3O+DJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This was again full 14-day pass, this time with even more failures, because
oe-core is now more strict about dependencies (I've sent couple of fixes for
missing pkgconfig/intltool-native/gtk-doc and triggered new incremental
build which should highlight more interesting issues).

Complete logs:
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20140627_23=
0813.log/

ERROR: 881 issues were found in these recipes: abiword adb ajenti
android-initscripts anjuta-remote-run apcupsd atd-over-fso aurora-daemon
aurora-systemmanager barnyard barnyard2 bigbuckbunny-1080p
bigbuckbunny-480p bigbuckbunny-720p ca-certificates-cross check cheese
chromium claws-mail claws-plugin-gtkhtml2-viewer claws-plugin-mailmbox
claws-plugin-rssyl clutter-box2d concurrencykit coriander cramfs curlpp
daemonize dbus-ptest ecore edbus edbus2 efl emacs emprint eve exo
farsight2 fbgrab ffalarms ffphonelog fim firefox flite-alsa florence
fltk frameworkd freerdp fso-gpsd fso-gsm0710muxd fsoaudiod fsogsmd gdal
genext2fs gnome-bluetooth gnome-control-center gnome-mplayer
gnome-settings-daemon gnome-system-monitor gnu-efi gnumeric gnuradio
goffice grub-efi gst-ffmpeg gstreamer1.0-meta-base gtkmathview
guitartune gummiboot gwaterpas hexedit hplip ifuse imake
initramfs-live-install initramfs-live-install-efi
initramfs-live-install-efi-testfs initramfs-live-install-testfs intone
ipython ipython3 js krb5 lcdproc libacpi libcmtspeechdata libeigen
libfso-glib libfso-qt libftdi libgc libgisi libgnomekbd libgnomeprint
libgsf libhybris libimobiledevice libjson libnice liboauth libotr
libphone-ui libphone-ui-shr libsamsung-ipc libsdl-ttf libsensmon
libshr-glib libusbg libwmf libxfce4ui linux-yocto-tiny-kexecboot llvm3.2
lttng-modules lua5.1 maliit-framework maliit-plugins mcnavi mickeyterm
mioctl mkvtoolnix mokomaze mplayer2 nasm nautilus navit
network-manager-applet networkmanager news numptyphysics ocf-linux omgps
openal-soft opencv opencv-samples openmotif opimd-utils orage orrery
osmocon owfs packagegroup-base packagegroup-basic packagegroup-boot
packagegroup-cli-tools packagegroup-core-basic packagegroup-core-boot
packagegroup-core-buildessential packagegroup-core-clutter
packagegroup-core-device-devel packagegroup-core-directfb
packagegroup-core-eclipse-debug packagegroup-core-full-cmdline
packagegroup-core-lsb packagegroup-core-nfs packagegroup-core-qt
packagegroup-core-qt4e packagegroup-core-sdk packagegroup-core-sdk-gmae
packagegroup-core-ssh-dropbear packagegroup-core-ssh-openssh
packagegroup-core-standalone-gmae-sdk-target
packagegroup-core-standalone-sdk-target packagegroup-core-tools-debug
packagegroup-core-tools-profile packagegroup-core-tools-testapps
packagegroup-core-x11 packagegroup-core-x11-base
packagegroup-core-x11-sato packagegroup-core-x11-xserver
packagegroup-fonts-truetype packagegroup-fso2-compliance
packagegroup-qt-toolchain-target packagegroup-qt5-qtcreator-debug
packagegroup-qt5-toolchain-target packagegroup-qte-toolchain-target
packagegroup-sdk-target packagegroup-self-hosted packagegroup-shr
packagegroup-shr-feed packagegroup-shr-minimal packagegroup-xfce-base
packagegroup-xfce-extended packagegroup-xfce-multimedia phonefsod
phoneui-shr-theme-neo phoneui-shr-theme-niebiee phoneui-shr-theme-o2
phoneui-shr-theme-sowka phoneuid pidgin pidgin-otr python-cython
python-phoneutils python-pyrtc python-pyyaml python-setuptools
python3-docutils python3-jinja python3-nose python3-pycurl python3-pyzmq
python3-sphinx qcanobserver qcanobserver-socketcan qconnman qconnman-e
qfsodbusxml2cpp qtjsbackend qtjsondb rage renderer-service-upnp
ristretto rpm-postinsts rtorrent screenshot sensmon shr-settings
shr-theme-neo shr-theme-niebiee shr-theme-o2 shr-wizard smbnetfs snort
soft66 subsurface sylpheed syslinux tearsofsteel-1080p thunar
thunar-archive-plugin thunar-media-tags-plugin thunar-volman tslib tsmd
tumbler u-boot-fw-utils uhd uhd-firmware usb-modeswitch
usb-modeswitch-data usbpath v86d vagalume vala-terminal valacompass
valgrind vlc web-webkit webkit-efl webmin wv wvdial wvstreams wxpython
wxwidgets xbmc xchat xf86-input-mtev xf86-input-vmmouse xf86-video-ati
xf86-video-geode xf86-video-intel xf86-video-nouveau xf86-video-vesa
xf86-video-vmware xfce4-appfinder xfce4-battery-plugin
xfce4-clipman-plugin xfce4-closebutton-plugin xfce4-cpufreq-plugin
xfce4-cpugraph-plugin xfce4-datetime-plugin xfce4-diskperf-plugin
xfce4-embed-plugin xfce4-equake-plugin xfce4-eyes-plugin
xfce4-fsguard-plugin xfce4-genmon-plugin xfce4-mixer xfce4-mount-plugin
xfce4-mpc-plugin xfce4-netload-plugin xfce4-notes-plugin xfce4-notifyd
xfce4-panel xfce4-places-plugin xfce4-power-manager xfce4-screenshooter
xfce4-session xfce4-settings xfce4-systemload-plugin xfce4-terminal
xfce4-time-out-plugin xfce4-vala xfce4-wavelan-plugin
xfce4-weather-plugin xfce4-xkb-plugin xfconf xfdesktop xfmpc xfwm4
xmlstarlet xorg-cf-files xwd zaurusd zenity zeromq zhone zile zsh

ccid/ccid/latest lost dependency on  flex
consolekit/consolekit/latest lost dependency on  polkit
directfb/directfb/latest lost dependency on  libdrm libdrm-kms liblzma tiff
e-wm/e-wm-utils/latest lost dependency on  bluez5
engrave/engrave/latest lost dependency on  flex
epiphany/epiphany/latest lost dependency on  libavahi-client libavahi-commo=
n libavahi-gobject libnotify
expedite/expedite/latest lost dependency on  libsdl
foxtrotgps/foxtrotgps/latest lost dependency on  bluez5
gammu/gammu/latest lost dependency on  glib-2.0 libgudev-1.0
gammu/libgammu/latest lost dependency on  glib-2.0
gawk/gawk/latest lost dependency on  gmp mpfr
gd/gd/latest lost dependency on  liblzma tiff
glade3/glade3/latest lost dependency on  dbus-glib dbus-lib gconf gnome-vfs=
 libart-lgpl libavahi-client libavahi-common libavahi-glib libbonobo libbon=
oboui libcanberra libcap libgcrypt libgnome libgnome-keyring libgnomecanvas=
 libgnomeui libgpg-error libice libltdl libogg libsm libvorbis libxcomposit=
e libxcursor libxdamage libxfixes libxrandr orbit2 popt util-linux-libuuid
gmtk/gmtk/latest lost dependency on  cairo-gobject dbus-lib gtk+3 json-c li=
bcap libice libpulse libpulse-mainloop-glib libpulsecommon libsm libsndfile=
1 libx11-xcb libxi libxtst util-linux-libuuid
gnokii/libgnokii/latest lost dependency on  bluez5 libical libusb-compat li=
busb1 pcsc-lite-lib
gnome-disk-utility/gnome-disk-utility-libs/latest lost dependency on  libca=
p libgcrypt libgnome-keyring libgpg-error
gnutls/gnutls-bin/latest lost dependency on  libidn
gpsd/gps-utils/latest lost dependency on  bluez5
gpsd/gpsd/latest lost dependency on  bluez5
gpsd/gpsd-gpsctl/latest lost dependency on  bluez5
gpsd/libgps/latest lost dependency on  bluez5
gpsd/libgpsd/latest lost dependency on  bluez5
gpsd/python-pygps/latest lost dependency on  bluez5
guile/guile/latest lost dependency on  ncurses-libncurses readline
gypsy/gypsy/latest lost dependency on  bluez5
gypsy/libgypsy/latest lost dependency on  bluez5
leptonica/leptonica/latest lost dependency on  giflib
libarchive/libarchive/latest lost dependency on  nettle
libarchive/libarchive-bin/latest lost dependency on  libxml2 nettle
libmicrohttpd/libmicrohttpd-bin/latest lost dependency on  file
libmikmod/libmikmod/latest lost dependency on  dbus-lib json-c libcap libic=
e libpulse libpulse-simple libpulsecommon libsm libsndfile1 libx11 libx11-x=
cb libxau libxcb libxdmcp libxext libxi libxtst util-linux-libuuid
libsyncml/libsyncml/latest lost dependency on  bluez5
libungif/libungif/latest lost dependency on  libice libsm libx11 libxau lib=
xcb libxdmcp util-linux-libuuid
libungif/libungif-utils/latest lost dependency on  libx11
libwebp/libwebp-gif2webp/latest lost dependency on  eglibc giflib libwebp
ltrace/ltrace/latest lost dependency on  libunwind
midori/midori/latest lost dependency on  libxscrnsaver
mpd/mpd/latest lost dependency on  fluidsynth libao libcdio libcdio-cdda li=
bcdio-paranoia libjack libmms libmodplug libopus libwrap wavpack yajl
mpeg2dec/mpeg2dec/latest lost dependency on  libx11 libxext libxv
mpg123/mpg123/latest lost dependency on  audiofile esound libjack libsdl po=
rtaudio-v19 tslib
obex-data-server/obex-data-server/latest lost dependency on  bluez5
obexd/obex-client/latest lost dependency on  bluez5
obexd/obexd/latest lost dependency on  bluez5
obexftp/obexftp/latest lost dependency on  bluez5
oscam/oscam/latest lost dependency on  pcsc-lite-lib
piglit/piglit/latest lost dependency on  libxrender
protobuf/protobuf/latest lost dependency on  zlib
python/python-tkinter/latest lost dependency on  eglibc libpython2 libx11 t=
cl-lib
python3/python3-tkinter/latest lost dependency on  eglibc libpython3 tcl-lib
qemu/qemu/latest lost dependency on  libusb1
qtbase/qtbase-plugins/latest lost dependency on  cups-lib
qtimageformats/qtimageformats-plugins/latest lost dependency on  jasper lib=
webp
qtsystems/qtsystems/latest lost dependency on  bluez5
qttools/qttools-plugins/latest lost dependency on  qtwebkit
qttools/qttools-tools/latest lost dependency on  qtwebkit
qtwebkit/qtwebkit/latest lost dependency on  libwebp
stunnel/stunnel/latest lost dependency on  libwrap zlib
synergy/synergy/latest lost dependency on  libxinerama
tesseract/tesseract/latest lost dependency on  giflib
tracker/tracker/latest lost dependency on  enca gtk+3 libgee libunistring u=
power
tracker/tracker-dev/latest lost dependency on  cairo enca expat fontconfig =
freetype giflib gstreamer lcms libgstpbutils-0.10 libgsttag-0.10 liblzma li=
bpoppler libpoppler-glib libunistring libx11 libxau libxcb libxcb-render li=
bxcb-shm libxdmcp libxext libxrender pixman taglib taglib-c tiff
udisks/udisks/latest lost dependency on  lvm2
weston/weston/latest lost dependency on  libwebp
weston/weston-examples/latest lost dependency on  libwebp
xserver-xorg/xserver-xorg/latest lost dependency on  libunwind libxshmfence=
 nettle
xserver-xorg/xserver-xorg-xvfb/latest lost dependency on  libunwind nettle
perf/perf/latest lost dependency on  libunwind

As bonus there is separate log file for each failing recipe, see
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20140627_23=
0813.log/3_min/failed/
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20140627_23=
0813.log/2_max/failed/

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--w2xx78T4DcG3O+DJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPEMtgACgkQN1Ujt2V2gBw5jQCglYwYlAMH8IBjASfehRaVZpy1
/x4AoKK2hcoEA4GNxxP5oBmzoXxOQZC/
=ZyA1
-----END PGP SIGNATURE-----

--w2xx78T4DcG3O+DJ--
