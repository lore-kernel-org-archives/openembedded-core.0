Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 039FB731A3;
	Wed, 23 Dec 2015 10:04:47 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id p187so142002633wmp.0;
	Wed, 23 Dec 2015 02:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=5u/088kPbIUoh/EX4QK09kcK7t/8uZoG+wDRf+yWonU=;
	b=h2K4/NzARWBZE6ThAAyyNYlW0sr7nOnFcplDHxrv+bes8RWLMGQfc0k+v0ZoZ83fpm
	7WT8yi4FkKE/BKH/vHz8xdCa3azK8TNMQ/33tRULPjwejyOXdV6KiUXHXUa3d2aGI20r
	HvyD0wkqd+KTsr4ddIt7+wTZJgW+1dKQyC7a4nSPkX16A4/icW5b+Z/ZB/6Uv4kfqjhF
	UEfxCpvEP4UWWjtH36Mr1sy673VBUDBCZeeU6eaaq0XbH+b7CyJA9J5BtPUPtAjKdDZe
	Y4KBG4kcQFekGv2qZ23aj+0PyFyj4kCwuT5Skx/DXuf+MpWZoW0wtb8s8D2W6+0Jpa1M
	99bg==
X-Received: by 10.28.20.197 with SMTP id 188mr34827466wmu.46.1450865087936;
	Wed, 23 Dec 2015 02:04:47 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	s11sm28522849wmb.14.2015.12.23.02.04.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Dec 2015 02:04:46 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 23 Dec 2015 11:07:57 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20151223100757.GB2569@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: State of bitbake world, test-dependencies 2015-12-23
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
X-List-Received-Date: Wed, 23 Dec 2015 10:04:48 -0000
X-Groupsio-MsgNum: 75209
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EuxKj2iCbKjpUGkD"
Content-Disposition: inline

--EuxKj2iCbKjpUGkD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 14, 2015 at 08:03:47PM +0100, Martin Jansa wrote:
> This time full build (testing all recipes available in "my world" - 2503
> recipes), it took record-breaking 25days to finish.
>=20
> Complete log:
> http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20151120_=
144802.log/
> =20
> I've already sent patches for few of them, will send one for pulseaudio-l=
irc as well
> as I already have it in out local recipes. For the rest I would appreciat=
e some help
> from people actually using these recipes.
>=20
> I'll trigger new incremental build after that huge meta-oe patch queue fr=
om master-next
> is in master.
>=20
> ERROR: 34 issues were found in these recipes: clutter-gst-3.0 cryptodev-m=
odule ctdb gnome-panel jasper lcdproc libftdi mpd places pulseaudio python =
python3 rain rygel samba shr-e-gadgets shr-wizard snort sysdig tmux uptime =
vboxguestdrivers xfce4-clipman-plugin

And it just got a lot worse, because more task are failing even in
regular world builds (report will be sent later this week), but the
missing and autodetected dependencies improved.

Most of the issues seems to be caused by gnutls upgrade which isn't
compatible with the rest of the recipes depending on it, e.g.
iksemel, libetpan, pidgin, ...

qemux86:
Complete log:
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20151218_17=
2159.log/

ERROR: 125 issues were found in these recipes:
android-image-utils-native chkconfig-alternatives-native
compat-wireless-all core-image-rt core-image-rt-sdk core-image-sato-dev
core-image-sato-sdk core-image-testmaster cryptodev-module
dfu-util-native fftwf fftwl freerdp gnome-desktop gnome-panel iksemel
iscsitarget jasper libetpan libftdi libx11-diet linux-dummy
linux-yocto-rt linux-yocto-tiny lldpd ltp-ddt mesa-gl mini-iconv netmap
netmap-modules openlmi-networking openlmi-providers openlmi-storage perf
php pidgin proxy-libintl pty-forward-native python python3 qwt-e remake
rsyslog rygel samba samsung-modem-mgr samsung-rfs-mgr shr-image
shr-image-all shr-lite-image snort synergy system-config-keyboard
vboxguestdrivers xdg-utils xf86-video-ati xf86-video-nouveau
xfce4-clipman-plugin

Found differences:=20
WARN: libftdi: libftdi rdepends on libgcc, but it isn't a build dependency?
WARN: libftdi: libftdi rdepends on libstdc++, but it isn't a build dependen=
cy?
WARN: python: python-tkinter rdepends on glibc, but it isn't a build depend=
ency?
WARN: python: python-tkinter rdepends on libpython2, but it isn't a build d=
ependency?
WARN: python: python-tkinter rdepends on tcl-lib, but it isn't a build depe=
ndency?
WARN: python3: python3-tkinter rdepends on glibc, but it isn't a build depe=
ndency?
WARN: python3: python3-tkinter rdepends on libpython3, but it isn't a build=
 dependency?
WARN: python3: python3-tkinter rdepends on tcl-lib, but it isn't a build de=
pendency?
WARN: rygel: rygel-plugin-media-export rdepends on libunistring, but it isn=
't a build dependency?
WARN: snort: snort rdepends on liblzma, but it isn't a build dependency?
WARN: xfce4-clipman-plugin: xfce4-clipman-plugin rdepends on qrencode, but =
it isn't a build dependency?
Found errors:=20
ERROR: pulseaudio: pulseaudio-module-lirc package isn't created when buildi=
ng with minimal dependencies?

qemuarm:
Complete log:
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20151220_19=
4614.log/

ERROR: 1233 issues were found in these recipes: activitymanager
android-headers-grouper android-headers-maguro
android-image-utils-native android-property-service android-system
android-system-image-grouper android-system-image-maguro
android-system-image-toro apcupsd app-services asus-grouper-firmware
audio-service azy bcm4330-firmware benchfft binutils-cross
binutils-cross-canadian binutils-crosssdk bluez4 build-appliance-image
c-ares certmgrd chkconfig-alternatives-native cloud9 clutter-box2d
cmtspeechtest compat-wireless-all configurator cordova core-apps
core-image-directfb core-image-lsb core-image-lsb-dev core-image-lsb-sdk
core-image-rt core-image-rt-sdk core-image-sato-dev core-image-sato-sdk
core-image-testmaster coriander cpuburn-neon crash-handler
cryptodev-module db8 dbus-hlid dfu-util-native diskio elmdentica emacs
emprint emtooth2 entrance enyo-1.0 epdfview ffalarms fftwf fftwl
filecache fim foundation-frameworks foxtrotgps freerdp fso-alsa
fso-monitord gcalctool gcc-cross gcc-cross-canadian gcc-cross-initial
gcc-crosssdk gcc-crosssdk-initial gcc-source gdal gdb-cross
gdb-cross-canadian gnome-desktop gnome-keyring gnome-menus3
gnome-mplayer gnome-panel gnome-panel3 gnome-power-manager gsmd2
gst-plugin-bluetooth gst123 gta04-gps-handler gtkextra gwaterpas gypsy
hunspell iksemel iliwi imaccountvalidator imlibpurpleservice imsettings
intone ipmiutil iscsitarget jemalloc keymanager ktap ktap-module
leveldb-tl libdbi-drivers libetpan libfreesmartphone-glib libftdi
libgfortran libgles-omap4 libgweather3 libhybris libiconv libmsmcomm
libmsmhll libmsmrpc libpalmsocket libpersistence libpfm4 librdx-stub
libsandbox libsuspend libsyncml libwebos-application libx11-diet
linux-acer-a500 linux-asus-grouper linux-dummy linux-samsung-crespo
linux-samsung-tuna linux-yocto-dev linux-yocto-rt linux-yocto-tiny
lksctp-tools lldpd lm loadable-frameworks location-service ltp-ddt
luna-applauncher luna-appmanager luna-init luna-next-cardshell
luna-qml-launcher luna-sysmgr luna-sysmgr-conf luna-sysservice
luna-systemui luna-universalsearchmgr luna-webappmanager
luneos-components luneos-default-wallpapers
luneos-dev-emulator-appliance luneos-dev-image luneos-dev-package
luneos-emulator-appliance luneos-image luneos-package luneos-sdk lxc
maliit-framework maliit-plugins mcnavi media-permission-service
mediaindexer memnotify-module mesa-gl meta-environment
meta-environment-extsdk mini-iconv mkvtoolnix mmsd mojoloader
mojolocation-stub mojomail-common mojomail-imap mojomail-pop
mojomail-smtp mojoservice-frameworks mojoservicelauncher mongodb
mplayer2 msmcommd msmcommd-specs mtp-server nautilus3 navit
nemo-qml-plugin-dbus netmap netmap-modules netperf news node-dbus
node-gyp-native node-gyp-packages-native node-sqlite3 node-taglib nodejs
nodejs-module-webos-dynaload nodejs-module-webos-pmlog
nodejs-module-webos-sysbus nodejs4 novacomd nss-myhostname nyx-conf
nyx-modules nyx-modules-hybris nyx-utils obexftp ofono-conf
openlmi-networking openlmi-providers openlmi-storage openmotif
org.webosinternals.ipkgservice org.webosinternals.preware
org.webosinternals.tweaks org.webosports.app.browser
org.webosports.app.calculator org.webosports.app.calendar
org.webosports.app.contacts org.webosports.app.filemanager
org.webosports.app.firstuse org.webosports.app.maps
org.webosports.app.memos org.webosports.app.messaging
org.webosports.app.pdf org.webosports.app.phone
org.webosports.app.photos org.webosports.app.settings
org.webosports.app.testr org.webosports.cdav
org.webosports.service.devmode org.webosports.service.licenses
org.webosports.service.lumberjack org.webosports.service.messaging
org.webosports.service.update packagegroup-cross-canadian
packagegroup-luneos-development packagegroup-luneos-extended
packagegroup-webos-extended packagegroup-webos-telephony packagekit perf
phonesim php pidgin pisi pmcertificatemgr pmklogd pmlogctl pmlogdaemon
pmstatemachineengine podboy powerd powerstat presage proxy-libintl
ptmalloc3 pty-forward-native pulseaudio pulseaudio-distro-conf
pulseaudio-modules-droid python python-tz-native python3 qcanobserver
qcanobserver-socketcan qconnman qconnman-e qi qi-bootchart qi-debug
qi-ubi qt-creator qt4-x11-free qt5-qpa-hwcomposer-plugin
qtscenegraph-adaptation qtsensors-sensorfw-plugin qtwebengine rage
remake renderer-service-upnp rsyslog rygel samba samsung-crespo-firmware
samsung-fb-console samsung-modem-mgr samsung-rfs-mgr
samsung-tuna-firmware screenshot sdl2-opengles-test sensmon sensorfw
shr-config shr-image shr-image-all shr-installer shr-launcher
shr-lite-image sleepd slim smemstat snort soft66 start-stop-daemon
subsurface synergy system-config-keyboard system-tools-backends sysvinit
tidy-html5 u-boot u-boot-fw-utils uclibc uclibc-initial underscore
vala-terminal valacompass vboxguestdrivers ventura voicecall
webos-connman-adapter webos-keyboard webos-system-update
webos-systemd-services webos-systemsounds webos-telephonyd xbmc
xdg-utils xf86-input-mtev xf86-video-geode xfce4-clipman-plugin zenity
zeroc-ice zhone2

Found differences:=20
WARN: jasper: jasper-bin rdepends on libgl-mesa, but it isn't a build depen=
dency?
WARN: jasper: jasper-bin rdepends on libglu, but it isn't a build dependenc=
y?
WARN: jasper: jasper-bin rdepends on mesa-glut, but it isn't a build depend=
ency?
WARN: libftdi: libftdi rdepends on libgcc, but it isn't a build dependency?
WARN: libftdi: libftdi rdepends on libstdc++, but it isn't a build dependen=
cy?
WARN: python: python-tkinter rdepends on glibc, but it isn't a build depend=
ency?
WARN: python: python-tkinter rdepends on libpython2, but it isn't a build d=
ependency?
WARN: python: python-tkinter rdepends on tcl-lib, but it isn't a build depe=
ndency?
WARN: python3: python3-tkinter rdepends on glibc, but it isn't a build depe=
ndency?
WARN: python3: python3-tkinter rdepends on libpython3, but it isn't a build=
 dependency?
WARN: python3: python3-tkinter rdepends on tcl-lib, but it isn't a build de=
pendency?
WARN: rygel: rygel-plugin-media-export rdepends on libunistring, but it isn=
't a build dependency?
WARN: snort: snort rdepends on liblzma, but it isn't a build dependency?
WARN: xfce4-clipman-plugin: xfce4-clipman-plugin rdepends on qrencode, but =
it isn't a build dependency?
WARN: cryptodev-module: kernel-module-cryptodev rdepends on kernel-3.19.5-y=
octo-tiny, but it isn't a build dependency?
WARN: vboxguestdrivers: kernel-module-vboxguest rdepends on kernel-3.19.5-y=
octo-tiny, but it isn't a build dependency?
WARN: vboxguestdrivers: kernel-module-vboxsf rdepends on kernel-3.19.5-yoct=
o-tiny, but it isn't a build dependency?
WARN: vboxguestdrivers: kernel-module-vboxvideo rdepends on kernel-3.19.5-y=
octo-tiny, but it isn't a build dependency?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--EuxKj2iCbKjpUGkD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZ6cnwACgkQN1Ujt2V2gBwKPACgishYeTGVifI3dFoawe2yhQLD
bucAn2J+XjpamcQeWH1xiLNOC1lY9XD7
=1bXp
-----END PGP SIGNATURE-----

--EuxKj2iCbKjpUGkD--
