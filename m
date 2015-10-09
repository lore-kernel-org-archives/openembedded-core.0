Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id ECBD976AE2;
	Fri,  9 Oct 2015 16:51:00 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so76010801wic.1;
	Fri, 09 Oct 2015 09:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=jzt674ahVIabKebKJhP0S+JTGt+X4jUbl/9IrMp6Rys=;
	b=qshZqupOUT+EzUkLiZDC2pPxcYZXvpQhak1xivv57p9jLE1QxgaJTSt+O/AQJky3Mg
	J3hvfkMoTt5BThSrhGxov2U5nurrXQ/tO0i7wF9lqSS7TTvH9SM4Gi9a9hAkrVpO8nd3
	qzoBvgLPLesXYTjNGPPosBjm62CnylCqq/Bxf88ywd+DAinKEfStwz0ITVKEgqHsI32E
	4D1ux+2pLMDyYOSE4Vv9HhXLfylxKHxV5Tq1oqZKLjUlb0oU9MxADTWQX/czgkYkZOrz
	Pb0yoVAtRA4/429PkN/FRqwtJ5PsLY4HuMnuhDnm3huw1W3FrAXXpLt4KN2/PS4Kdk3f
	XH4A==
X-Received: by 10.180.74.47 with SMTP id q15mr266345wiv.73.1444409460495;
	Fri, 09 Oct 2015 09:51:00 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	gl4sm3081937wjb.29.2015.10.09.09.50.58
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Oct 2015 09:50:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 9 Oct 2015 18:51:16 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20151009165116.GD2384@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: State of bitbake world, Failed tasks 2015-10-09
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
X-List-Received-Date: Fri, 09 Oct 2015 16:51:03 -0000
X-Groupsio-MsgNum: 72056
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="d9ADC0YsG2v16Js0"
Content-Disposition: inline

--d9ADC0YsG2v16Js0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
b4175ee world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
f4fd11a gcr, libsecret, libunwind: force ARM mode
5a665d6 arch-armv7ve: add tune include for armv7ve and use it from cortexa7=
 and cortexa15
d7e9875 tune-*: use mcpu instead of mtune for ARM tunes
2f2d5fb cortexa{7,15,17}: add VFPv4 tunes
14245a4 directfb: add fPIC to CFLAGS
b34f989 guile, mailx, gcc, opensp, gstreamer1.0-libav, libunwind: disable t=
humb where it fails for qemuarm
f10333c icu: force arm mode
e890757 gdb: force arm mode
f8d8210 DO-NOT-MERGE: distutils3.bbclass: Don't use MACHINE variable
8fd5772 libsdl: Add support for libsdl-native
083ab12 WIP: Add KERNEL_EXTRA_ARGS?
86627e0 sstate-sysroot-cruft: Add /usr/src/kernel/.* to whitelist
1814907 report-error: Allow to upload reports automatically
74ea599 qemux86: Add identical qemux86copy variant for tests

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
076208a gnome-keyring: blacklist gnome-bluetooth, gvfs: try to build with l=
ibgnome-keyring only
c911a62 Remove toolchain-layer
ce06187 freerdp: get out of PNBLACKLIST, fix build, improve
5dabcde rygel: Add recipe
477edb2 iptraf: add new recipe
862c6cf openbox: fix sporadic race on compile
310f124 libcap-ng: remove package
7b10933 swig: remove package
6d8e7d8 netmap-modules: fix compilation failure
3328f57 libnetfilter: Avoid using VLAs
d262456 xf86-video-geode: blacklist, fails to build
0f246eb nautilus3: blacklist, fails to build
bd40c4a libmediaart-2.0: Add recipe
48d871a net-snmp: Fix build with gcc5
3bd5c04 libimobiledevice: fix gcc 5 link failure
f44dc82 Revert "freerdp: move to nonworking"
77cb78a Revert "epdfview: move to nonworking"
0a66c70 Revert "rage, emprint, news: Move to nonworking"
f1b5428 Revert "screenshot: Move to nonworking because depends on emprint"
4456401 Revert "gcalctool: move to nonworking"
0c4a2c3 Revert "gnome-terminal, system-tools-backends, slim, benchfft, sysl=
og-ng: move to nonworking directories"
a6ff44e Revert "qcanobserver: Move to nonworking"
113b83a Revert "gst123: move to nonworking directory"
84ceaaf gnome-panel*: Use GFDL-1.1 instead of GFDLv1.1
8ff27b3 meta-oe: recipes-devtools: add libubox recipe
96af49e meta-networking: recipes-connectivity: add relayd recipe
85db5db meta-oe: recipes-devtools: add debootstrap recipe
649b7b9 apache2: cleanup buildpaths for target stuffs
1557f3d tornado: upgrade to 4.2.1
00c6ec5 tsocks: Add tsocks to meta-network/recipes-protocols
d9e2b53 networkmanager: fix installed-vs-shipped warning
8157f55 polkit: fix relocation of polkit binaries
b734196 mariadb: Easy linkage of code using libmysqlclient_r
9d1db34 lvm2: add --with-systemdsystemunitdir in configuration
4035513 gd: cleanup buildpaths from gdlib.pc
4fce645 squid: disable atomic operations for powerpc/mips
ccd78a4 kexecboot_0.6: fix build with gcc 5
f215389 opencore-amr: add new recipe
b5ed7ec libiec61883: add new recipe
709af55 libavc1394: add new recipe
5e745ef cdparanoia: add new recipe
1636317 libgudev: skip recipe for distros not using systemd as init
79bc3e7 llvm.inc: fix PACKAGES_DYNAMIC
a705689 webkit-efl: fix build with cmake-3*
1bb614b sblim-sfcCommon: rename to sblim-sfc-common
9b91f3f libdbi-drivers: Blacklist, fails to build with gcc-5
bddf3e9 libuio: Blacklist, fails to build with gcc-5
597dd82 mplayer2: Blacklist, fails to build with gcc-5
4749313 mkvtoolnix: Blacklist, fails to build with gcc-5
c561b5d gtkextra: blacklist, fails to build with gcc-5
37354f0 gdal: blacklist, fails to build with gcc-5
28f9591 elmdentica, azy: blacklist because they are old and fail to build w=
ith gcc-5
5f442bc qt-creator: blacklist because fails to build and conflicts with qt5=
-creator
2d3b686 gnome-power-manager: Blacklist not compatible with current libnotify
ea497d0 epdf: Blacklist, old and not compatible with current poppler
2c14c4b sessreg: Blacklist, fails to build man pages
246a4d7 libnet-dns-perl: blacklist, fails to build with current perl
db320ce packagekit: blacklist, depends on disabled libopkg API
873bfdb nautilus3: Fix build with B !=3D S
f56b8dd wayland-fits: Add recipe
36a3e99 efl: support wayland, egl
4e2dfbe pyroute2: update to 0.3.14, fix depends, fix license
8933122 modemmanager: depend on libgudev not on udev
e6572b9 networkmanager: depend on libgudev not on udev
e3d4ba4 libgudev: exclude use with systemd <=3D220
1eaf5af xfce4-screenshooter: ensure output directory is created
1a9c82a plymouth: building documatation sometimes fails to download so disa=
ble it
8ab981e sshfs-fuse: correct definition of S
ff8c73c lldpd: Add recipe
5a2fbc0 opencv: backport commit to compile with ppc
f1738ce xl2tpd: 1.3.0 -> 1.3.6
1c31bfa inetutils: fix rcp to work with large file

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
51b4620 maliit-framework-qt5: fixed paths and enabled qt5-inputcontext
d8a4d97 qtwebengine: enable cmake
394345c qmake5_paths, qtbase: add OE_QMAKE_PATH_QT_FONTS
8f765ed qt5: upgrade to latest revision in 5.5 branches

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
48f6678 linux-asus-grouper, linux-samsung-tuna: bump SRCREV to fix build wi=
th gcc-5 and newer native perl
cf14864 mokomaze: add glib-2.0 dependency and gettext inherit
be6a678 packagegroup-shr-feed: drop blacklisted elmdentica
4c2403b shr-installer: blacklist, depends on blacklisted packagekit
f3eb29a linux-nokia900-meego: defconfig cleanup
945977f linux-nokia900-meego: nokia900-defconfig-min
854d837 linux-nokia900-meego: nokia900-defconfig-complete
0f3b811 linux-nokia900-meego: nokia900-defconfig-min
0c547b4 linux-nokia900-meego: upgrade to 3.13 from Arch linux
0cacc0b image_types_fastboot: add skeleton for fastboot image_type

=3D=3D Number of issues - stats =3D=3D
{| class=3D'wikitable'
!|Date		     !!colspan=3D'3'|Failed tasks			    !!colspan=3D'12'|QA !!Comme=
nt
|-
||		||qemuarm	||qemux86	||qemux86_64	||already-stripped	||libdir	||textrel	=
||build-deps	||file-rdeps	||version-going-backwards	||host-user-contaminate=
d	||installed-vs-shipped	||unknown-configure-option	||symlink-to-sysroot	||=
invalid-pkgconfig	||pkgname	||=09
|-
||2015-10-09	||6	||4	||4	||3		||0		||5		||25		||20		||80		||31		||1		||1		|=
|1		||3		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2015-10-09 =3D=3D

INFO: jenkins-job.sh-1.4.7 Complete log available at http://logs.nslu2-linu=
x.org/buildlogs/oe/world/log.report.20151009_162031.log

=3D=3D=3D common (2) =3D=3D=3D
    * /meta-openembedded/meta-multimedia/recipes-connectivity/rygel/rygel_0=
=2E26.1.bb, do_configure
    * /meta-openembedded/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb=
, do_compile

=3D=3D=3D common-x86 (1) =3D=3D=3D
    * /meta-browser/recipes-browser/chromium/chromium_40.0.2214.91.bb, do_c=
ompile

=3D=3D=3D qemuarm (4) =3D=3D=3D
    * /meta-openembedded/meta-oe/recipes-support/freerdp/freerdp_git.bb, do=
_compile
    * /openembedded-core/meta/recipes-gnome/gcr/gcr_3.16.0.bb, do_populate_=
sysroot
    * /openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb, do_co=
mpile
    * /openembedded-core/meta/recipes-support/libunwind/libunwind_1.1.bb, d=
o_compile

=3D=3D=3D qemux86 (1) =3D=3D=3D
    * /meta-browser/recipes-browser/chromium/cef3_280796.bb, do_compile

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * /meta-browser/recipes-browser/chromium/cef3_280796.bb, do_configure

=3D=3D=3D Number of failed tasks (14) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 6	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.wo=
rld.20151008_105254.log// || http://errors.yoctoproject.org:80/Errors/Build=
/9190/
|-
|| qemux86 	|| 4	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.wo=
rld.20151009_111340.log// || http://errors.yoctoproject.org:80/Errors/Build=
/9191/
|-
|| qemux86_64 	|| 4	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log=
=2Eworld.20151009_134136.log// || http://errors.yoctoproject.org:80/Errors/=
Build/9192/
|}

=3D=3D=3D PNBLACKLISTs (94) =3D=3D=3D

=3D=3D=3D QA issues (170) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
|-
||0	||libdir
|-
||0	||pkgname
|-
||1	||installed-vs-shipped
|-
||1	||symlink-to-sysroot
|-
||1	||unknown-configure-option
|-
||20	||file-rdeps
|-
||25	||build-deps
|-
||3	||already-stripped
|-
||3	||invalid-pkgconfig
|-
||31	||host-user-contaminated
|-
||5	||textrel
|-
||80	||version-going-backwards
|}


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-efl/recipes-efl/e17/diskio_svn.bb:PNBLACKLIST[diskio] ?=3D "broken: sw=
itch to https://git.enlightenment.org/enlightenment/modules/diskio.git/ and=
 fix 0.0.1+svnr82070-r0.0/E-MODULES-EXTRA/diskio/e-module-diskio.edc:58. in=
valid state name: 'off'. "default" state must always be first."
meta-efl/recipes-efl/e17/elmdentica_svn.bb:PNBLACKLIST[elmdentica] ?=3D "OL=
D and depends on broken azy"
meta-efl/recipes-efl/e17/emprint_svn.bb:PNBLACKLIST[emprint] ?=3D "if you w=
ant to use these modules with E18, then you need to update it to git recipe=
 fetching newer sources from http://git.enlightenment.org/apps/emprint.git/"
meta-efl/recipes-efl/e17/news_svn.bb:PNBLACKLIST[news] ?=3D "if you want to=
 use these modules with E18, then you need to update it to git recipe fetch=
ing newer sources from http://git.enlightenment.org/enlightenment/modules/n=
ews.git/"
meta-efl/recipes-efl/e17/rage_svn.bb:PNBLACKLIST[rage] ?=3D "if you want to=
 use these modules with E18, then you need to update it to git recipe fetch=
ing newer sources from  http://git.enlightenment.org/apps/rage.git/"
meta-efl/recipes-efl/e17/screenshot_svn.bb:PNBLACKLIST[screenshot] ?=3D "de=
pends on blacklisted emprint"
meta-efl/recipes-efl/efl/azy_svn.bb:PNBLACKLIST[azy] ?=3D "OLD and doesn't =
build with gcc-5"
meta-efl/recipes-efl/efl/entrance_svn.bb:PNBLACKLIST[entrance] ?=3D "broken=
: switch to https://git.enlightenment.org/misc/entrance.git and fix 0.0.4+s=
vnr82070-r7/entrance/data/themes/old/default.edc:678. invalid state name: '=
defaault'. "default" state must always be first."
meta-efl/recipes-efl/efl/epdf_svn.bb:PNBLACKLIST[epdf] ?=3D "BROKEN: fails =
to build with newer poppler"
meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb:PNBLACKLIST[mcnavi] ?=3D=
 "BROKEN: latest version 0.3.4 is 3 years old and now broken with more stri=
ct ejde_cc from efl-1.13"
meta-gnome/recipes-apps/epdfview/epdfview_0.1.8.bb:PNBLACKLIST[epdfview] ?=
=3D "BROKEN: images are not displayed anymore"
meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLACKLIST[gn=
ome-mplayer] ?=3D "rdepends on blacklisted mplayer"
meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb:PNBLACKLIST[gcalctoo=
l] ?=3D "broken at least since April 2013 http://permalink.gmane.org/gmane.=
comp.handhelds.openembedded/57920 and nobody complained, it's also replaced=
 by gnome calculator"
meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb:PNBLACKLIST[=
gnome-keyring] ?=3D "This version conflicts with gcr from oe-core"
meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb:PNBLACKLIST[gno=
me-menus3] ?=3D "CONFLICT: 24 files are conflicting with gnome-menus"
meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gnom=
e-panel3] ?=3D "CONFLICT: depends on libgweather3 which conflicts with libg=
weather"
meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb:=
PNBLACKLIST[gnome-power-manager] ?=3D "BROKEN: not compatible with current =
libnotify"
meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb:PNBLACKLIST[libgwea=
ther3] ?=3D "CONFLICT: 876 files are conflicting with libgweather"
meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb:PNBLACKLIST[nautilus3]=
 ?=3D "BROKEN: fails to build, maybe missing dependency on gnome-desktop-ut=
ils.h provider"
meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb:PNBLA=
CKLIST[system-tools-backends] ?=3D "does not build with distroless qemuarm =
as reported in 'State of bitbake world' thread, nobody volunteered to fix t=
hem"
meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb:PNBLACKLIST[zenity] ?=3D "=
BROKEN: doesn't build with B!=3DS"
meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb:PNBLACKLIST[xbmc] ?=3D=
 "/usr/include/c++/ctime:70:11: error: '::gmtime' has not been declared"
meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb:PNBLACKLIST[mkvtoo=
lnix] ?=3D "BROKEN: Failx to build with gcc-5"
meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb:PNBLACKLIST=
[coriander] ?=3D "BROKEN: fails to use SDL probably because libsdl-config w=
as removed, error: unknown type name 'SDL_Overlay'"
meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb:PN=
BLACKLIST[renderer-service-upnp] ?=3D "BROKEN: doesn't build with B!=3DS (t=
rying to install rendererconsole.py from ${B} instead of ${S})"
meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb:PNBLACKLIST[gs=
t123] ?=3D "gst123 is still "sometimes" using wrong sysroot"
meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb:PNBLACKLIST[sno=
rt] ?=3D "BROKEN: autotools processing causes OOM condition on configure"
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb:PNBLACK=
LIST[lksctp-tools] ?=3D "${@base_contains('DISTRO_FEATURES', 'ld-is-gold', =
"BROKEN: fails to link against sctp_connectx symbol", '', d)}"
meta-networking/recipes-support/nis/yp-tools_3.3.bb:PNBLACKLIST[yp-tools] ?=
=3D "BROKEN: fails to build for qemuarm."
meta-networking/recipes-support/nis/ypbind-mt_2.2.bb:PNBLACKLIST[ypbind-mt]=
 ?=3D "BROKEN: Depends on broken yp-tools"
meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb:PNBLACKLIST[bluez-h=
cidump] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 con=
flicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb:PNBLACKLIST[bluez4] ?=3D=
 "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with =
bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb:PNBLACKLIS=
T[gst-plugin-bluetooth] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'blue=
z5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURE=
S', '', d)}"
meta-oe/recipes-connectivity/obexftp/obexftp_0.23.bb:PNBLACKLIST[obexftp] ?=
=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts wi=
th bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft66] ?=3D =
"BROKEN: depends on broken libftdi"
meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb:PNBLACKLIST[zeroc=
-ice] ?=3D "BROKEN: not compatible with default db version"
meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb:PNBLACKLIST[cloud9] ?=3D "Not=
 comatible with current nodejs 0.12, but upstream is working on it for v3"
meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb:PNBLACKLIST[nodejs4] ?=3D=
 "Used only by currently blacklisted cloud9 and fails to build for qemuarm =
with thumb: error: #error For thumb inter-working we require an architectur=
e which supports blx"
meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb:PNBLACKLIST[package=
kit] ?=3D "BROKEN: depends on old deprecated libopkg which is currently dis=
abled and will be removed soon"
meta-oe/recipes-extended/libuio/libuio_0.2.1.bb:PNBLACKLIST[libuio] ?=3D "B=
ROKEN, fails to build with gcc-5"
meta-oe/recipes-extended/subsurface/subsurface_git.bb:PNBLACKLIST[subsurfac=
e] ?=3D "Needs to be upgraded for compatibility with new libdivecomputer"
meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb:PNBLACKLIST[gtkextra] ?=3D=
 "BROKEN: Fails to build with gcc-5"
meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb:PNBLACKLIST[clutter-b=
ox2d] ?=3D "BROKEN: doesn't build with B!=3DS"
meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:PNBLACKLIST[fim] ?=3D "BROKEN: =
doesn't build with B!=3DS (flex: can't open lex.lex)"
meta-oe/recipes-graphics/slim/slim_1.3.2.bb:PNBLACKLIST[slim] ?=3D "does no=
t build with distroless qemuarm as reported in 'State of bitbake world' thr=
ead, nobody volunteered to fix them"
meta-oe/recipes-graphics/xorg-app/sessreg_1.1.0.bb:PNBLACKLIST[sessreg] ?=
=3D "BROKEN: fails to generate man pages"
meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb:PNBLACKLIST[xf8=
6-input-mtev] ?=3D "BROKEN: doesn't build with B!=3DS (Makefile without ${S=
} in sed call)"
meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb:PNBLACKLIS=
T[xf86-video-geode] ?=3D "BROKEN, fails to build"
meta-oe/recipes-kernel/ktap/ktap-module_git.bb:PNBLACKLIST[ktap-module] ?=
=3D "Not compatible with 3.19 kernel"
meta-oe/recipes-kernel/ktap/ktap_git.bb:PNBLACKLIST[ktap] ?=3D "Depends on =
blacklisted kernel-module-ktapvm"
meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb:PNBLACKLIST[mplayer2] ?=
=3D "BROKEN, fails to build with gcc-5"
meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb:PNBLACKLIST[foxtr=
otgps] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conf=
licts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb:PNBLACKLIST[gdal] ?=3D "BROK=
EN: fails to build with gcc-5"
meta-oe/recipes-navigation/gypsy/gypsy.inc:PNBLACKLIST[gypsy] ?=3D "${@bb.u=
tils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 an=
d bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-navigation/navit/navit.inc:PNBLACKLIST[navit] ?=3D "${@bb.u=
tils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 an=
d bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-qt/qcanobserver/qcanobserver-socketcan_svn.bb:PNBLACKLIST[q=
canobserver-socketcan] ?=3D "depends on qwt-5 APIs"
meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb:PNBLACKLIST[qcanobserve=
r] ?=3D "depends on qwt-5 APIs"
meta-oe/recipes-qt/qconnman/qconnman-e_git.bb:PNBLACKLIST[qconnman-e] ?=3D =
"BROKEN: doesn't work with B!=3DS, ls: cannot access *.pro: No such file or=
 directory"
meta-oe/recipes-qt/qconnman/qconnman_git.bb:PNBLACKLIST[qconnman] ?=3D "BRO=
KEN: doesn't work with B!=3DS, ls: cannot access *.pro: No such file or dir=
ectory"
meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb:PNBLACKLIST[qt-creator] ?=
=3D "BROKEN: fails to build with gcc-5 and conflicts with qt5-creator"
meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb:PNBLACKLIST[apcupsd] ?=
=3D "BROKEN: doesn't build with B!=3DS"
meta-oe/recipes-support/emacs/emacs_23.4.bb:PNBLACKLIST[emacs] ?=3D "qemu: =
uncaught target signal 11 (Segmentation fault) - core dumped"
meta-oe/recipes-support/fftw/benchfft_3.1.bb:PNBLACKLIST[benchfft] ?=3D "do=
es not build with distroless qemuarm as reported in 'State of bitbake world=
' thread, nobody volunteered to fix them"
meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb:PNBLACKLIST[libdbi=
-drivers] ?=3D "BROKEN: fails to build with gcc-5"
meta-oe/recipes-support/maliit/maliit-framework_git.bb:PNBLACKLIST[maliit-f=
ramework] ?=3D "BROKEN: Wasn't updated to work with B!=3DS, maybe incorrect=
ly inherits autotools"
meta-oe/recipes-support/maliit/maliit-plugins_git.bb:PNBLACKLIST[maliit-plu=
gins] ?=3D "BROKEN: depends on broken maliit-framework"
meta-oe/recipes-support/mongodb/mongodb_git.bb:PNBLACKLIST[mongodb] ?=3D "F=
ails to build with system boost"
meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb:PNBLACKLIST[openmotif]=
 ?=3D "BROKEN: doesn't build with B!=3DS"
meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb:PNBLACKLIST[libsyncml] =
?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts w=
ith bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb:PNB=
LACKLIST[start-stop-daemon] ?=3D "BROKEN: fails because of gettext, partial=
 fix is available here http://patchwork.openembedded.org/patch/89867/"
meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST[vala=
-terminal] ?=3D "BROKEN: Doesn't work with B!=3DS, touch: cannot touch `src=
/.stamp': No such file or directory"
meta-perl/recipes-perl/libnet/libnet-dns-perl_0.81.bb:PNBLACKLIST[libnet-dn=
s-perl] ?=3D "BROKEN: Fails to build since some changes in perl recipe"
meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb:PNBLACKLIST[xfce4-vala=
] ?=3D "Fails to build since vala upgrade to 0.26.1"
meta-qt5:
meta-smartphone:
meta-shr/recipes-shr/3rdparty/emtooth2_svn.bb:PNBLACKLIST[emtooth2] ?=3D "$=
{@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with blu=
ez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-shr/recipes-shr/3rdparty/ffalarms_git.bb:PNBLACKLIST[ffalarms] =3D "Do=
esn't build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/3rdparty/gwaterpas_0.3.bb:PNBLACKLIST[gwaterpas] ?=3D =
"broken: depends on blacklisted fltk"
meta-shr/recipes-shr/3rdparty/iliwi_git.bb:PNBLACKLIST[iliwi] =3D "Doesn't =
build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/3rdparty/intone_git.bb:PNBLACKLIST[intone] =3D "rdepen=
ds on blacklisted mplayer2"
meta-shr/recipes-shr/3rdparty/pisi_0.5.3.bb:PNBLACKLIST[pisi] ?=3D "${@bb.u=
tils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 an=
d bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-shr/recipes-shr/3rdparty/podboy_svn.bb:PNBLACKLIST[podboy] ?=3D "${@bb=
=2Eutils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez=
4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-shr/recipes-shr/3rdparty/sensmon_git.bb:PNBLACKLIST[sensmon] =3D "Does=
n't build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/3rdparty/valacompass_git.bb:PNBLACKLIST[valacompass] =
=3D "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/shr/shr-installer_git.bb:PNBLACKLIST[shr-installer] ?=
=3D "Depends on blacklisted packagekit"
meta-webos-ports:
conf/world_fixes.inc:PNBLACKLIST[android-system] =3D "depends on lxc from m=
eta-virtualiazation which isn't included in my world builds"
conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-1080p] =3D "big and doesn't r=
eally need to be tested so much"
conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-480p] =3D "big and doesn't re=
ally need to be tested so much"
conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't re=
ally need to be tested so much"
conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't re=
ally need to be tested so much"
conf/world_fixes.inc:PNBLACKLIST[tearsofsteel-1080p] =3D "big and doesn't r=
eally need to be tested so much"
conf/world_mask.inc:PNBLACKLIST[evince] =3D "fails to build"
conf/world_mask.inc:PNBLACKLIST[epiphany] =3D "fails to build"
conf/world_mask.inc:PNBLACKLIST[gnome-power-manager] =3D "fails to build"
conf/world_mask.inc:PNBLACKLIST[gnome-bluetooth] =3D "fails to build"
conf/world_mask.inc:PNBLACKLIST[media-ctl] =3D "fails to build"
QA issues by type:
count: 3	issue: already-stripped
qwt-6.0.1: File '/usr/lib/libqwt.so.6.0.1' from qwt was already stripped, t=
his will prevent future debugging! [already-stripped]
qwt-6.0.1: File '/usr/lib/libqwtmathml.so.6.0.1' from qwt was already strip=
ped, this will prevent future debugging! [already-stripped]
qwt-6.0.1: File '/usr/lib/qt4/plugins/designer/libqwt_designer_plugin.so' f=
rom qwt was already stripped, this will prevent future debugging! [already-=
stripped]


count: 0	issue: libdir


count: 5	issue: textrel
efl-1.15.1: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/efl/2_1.15.1-r0/p=
ackages-split/evas/usr/lib/evas/cserve2/bin/v-1.15/evas_cserve2_slave' has =
relocations in .text [textrel]
gstreamer1.0-libav-1.4.5: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/gst=
reamer1.0-libav/1.4.5-r0/packages-split/gstreamer1.0-libav/usr/lib/gstreame=
r-1.0/libgstlibav.so' has relocations in .text [textrel]
libav-9.18: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/libav/9.18-r0/pac=
kages-split/libavcodec/usr/lib/libavcodec.so.54.35.0' has relocations in .t=
ext [textrel]
libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary '/tmp/work/armv5te-oe-=
linux-gnueabi/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split/li=
bpostproc/usr/lib/libpostproc.so.52.3.0' has relocations in .text [textrel]
matchbox-keyboard-0.0+gitAUTOINC+217f1bfe14: ELF binary '/tmp/work/armv5te-=
oe-linux-gnueabi/matchbox-keyboard/0.0+gitAUTOINC+217f1bfe14-r4/packages-sp=
lit/matchbox-keyboard/usr/bin/matchbox-keyboard' has relocations in .text [=
textrel]


count: 25	issue: build-deps
cheese-2.30.1: cheese rdepends on libgudev, but it isn't a build dependency=
? [build-deps]
cifs-utils-6.4: cifs-utils rdepends on samba, but it isn't a build dependen=
cy? [build-deps]
clutter-gst-3.0-3.0.8: clutter-gst-3.0 rdepends on libgudev, but it isn't a=
 build dependency? [build-deps]
devicekit-power-014: devicekit-power rdepends on libgudev, but it isn't a b=
uild dependency? [build-deps]
dovecot-2.2.18: dovecot rdepends on lz4, but it isn't a build dependency? [=
build-deps]
dovecot-2.2.18: dovecot-dev rdepends on lz4, but it isn't a build dependenc=
y? [build-deps]
gammu-1.32.0: gammu rdepends on libgudev, but it isn't a build dependency? =
[build-deps]
gst-plugins-good-0.10.31: gst-plugins-good-video4linux2 rdepends on libgude=
v, but it isn't a build dependency? [build-deps]
gstreamer1.0-plugins-bad-1.4.5: gstreamer1.0-plugins-bad-uvch264 rdepends o=
n libgudev, but it isn't a build dependency? [build-deps]
gstreamer1.0-plugins-good-1.4.5: gstreamer1.0-plugins-good-video4linux2 rde=
pends on libgudev, but it isn't a build dependency? [build-deps]
imsettings-1.6.8: imsettings rdepends on xfconf, but it isn't a build depen=
dency? [build-deps]
pinpoint-0.1.4+gitrAUTOINC+80a056c57e: pinpoint rdepends on librsvg, but it=
 isn't a build dependency? [build-deps]
pure-ftpd-1.0.42: pure-ftpd rdepends on libsodium, but it isn't a build dep=
endency? [build-deps]
qt-mobility-embedded-1.2.0: qt-mobility-embedded rdepends on libgstapp-0.10=
, but it isn't a build dependency? [build-deps]
qt-mobility-embedded-1.2.0: qt-mobility-embedded rdepends on libgstvideo-0.=
10, but it isn't a build depende-client, but it isn't a build dependency? [=
build-deps]
samba-4.1.12: samba rdepends on libavahi-common, but it isn't a build depen=
dency? [build-deps]
sox-14.4.0: sox rdepends on libflac, but it isn't a build dependency? [buil=
d-deps]
sox-14.4.0: sox rdepends on opencore-amr, but it isn't a build dependency? =
[build-deps]
vlc-2.2.1: vlc rdepends on libavc1394, but it isn't a build dependency? [bu=
ild-deps]
webmin-1.750: webmin rdepends on perl-module-sdbm, but it isn't a build dep=
endency? [build-deps]


count: 20	issue: file-rdeps
chkconfig-1.3.58: /usr/sbin/ntsysv_chkconfig contained in package chkconfig=
 requires libnewt.so, but no providers found in its RDEPENDS [file-rdeps]
ctdb-2.5.1: /usr/bin/onnode_ctdb contained in package ctdb requires /bin/ba=
sh, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbdate_dvbdate contained in package dvbdate requi=
res libucsi.so, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbnet_dvbnet contained in package dvbnet requires=
 libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbscan_dvb-scan contained in package dvb-scan req=
uires libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbtraffic_dvbtraffic contained in package dvbtraf=
fic requires libdvbapi.so, but no providers found in its RDEPENDS [file-rde=
ps]
dvb-apps-1.1.1: /usr/bin/femon_dvb-femon contained in package dvb-femon req=
uires libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/gotox_dvb-apps contained in package dvb-apps requi=
res libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
fakeroot-1.18.4: /usr/bin/fakeroot_fakeroot contained in package fakeroot r=
equires /bin/bash, but no providers found in its RDEPENDS [file-rdeps]
gnome-desktop-2.32.1: /usr/bin/gnome-about_gnome-desktop contained in packa=
ge gnome-desktop requires /usr/bin/python, but no providers found in its RD=
EPENDS [file-rdeps]
gupnp-0.20.12: /usr/bin/gupnp-binding-tool_gupnp-dev contained in package g=
upnp-dev requires /usr/bin/python, but no providers found in its RDEPENDS [=
file-rdeps]
libbonobo-2.32.1: /usr/bin/bonobo-slay_libbonobo contained in package libbo=
nobo requires /usr/bin/perl, but no providers found in its RDEPENDS [file-r=
deps]
libnewt-0.52.18: /usr/bin/whiptail_whiptail contained in package whiptail r=
equires libnewt.so, but no providers found in its RDEPENDS [file-rdeps]
libnewt-python-0.52.18: /usr/lib/python2.7/site-packages/@underscore@snack.=
so_libnewt-python contained in package libnewt-python requires libnewt.so, =
but no providers found in its RDEPENDS [file-rdeps]
networkmanager-1.0.4: /usr/bin/nmtui-connect_networkmanager contained in pa=
ckage networkmanager requires libnewt.so, but no providers found in its RDE=
PENDS [file-rdeps]
numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert@underscore@all.=
sh_numptyphysics contained in package numptyphysics requires /bin/bash, but=
 no providers found in its RDEPENDS [file-rdeps]
rrdtool-1.5.4: /usr/share/rrdtool/examples/stripes.py_rrdtool-perl containe=
d in package rrdtool-perl requires /usr/bin/python, but no providers found =
in its RDEPENDS [file-rdeps]
tracker-0.14.2: /usr/lib/nautilus/extensions-2.0/libnautilus-tracker-tags.s=
o_tracker-nautilus-extension contained in package tracker-nautilus-extensio=
n requires libnautilus-extension.so.1()(64bit), but no providers found in i=
ts RDEPENDS [file-rdeps]
tracker-0.14.2: /usr/lib/nautilus/extensions-2.0/libnautilus-tracker-tags.s=
o_tracker-nautilus-extension containedckage efibootmgr-dbg went backwards w=
hich would break package feeds from (0:0.12-r0.2 to 0:0.6.0-r0.8) [version-=
going-backwards]
efibootmgr-0.6.0: Package version for package efibootmgr-dev went backwards=
 which would break package feeds from (0:0.12-r0.2 to 0:0.6.0-r0.8) [versio=
n-going-backwards]
efibootmgr-0.6.0: Package version for package efibootmgr-doc went backwards=
 which would break package feeds from (0:0.12-r0.2 to 0:0.6.0-r0.8) [versio=
n-going-backwards]
efibootmgr-0.6.0: Package version for package efibootmgr-locale went backwa=
rds which would break package feeds from (0:0.12-r0.2 to 0:0.6.0-r0.8) [ver=
sion-going-backwards]
efibootmgr-0.6.0: Package version for package efibootmgr-staticdev went bac=
kwards which would break package feeds from (0:0.12-r0.2 to 0:0.6.0-r0.8) [=
version-going-backwards]
freerdp-1.2.5+gitrAUTOINC+62da9d28c6: Package version for package freerdp w=
ent backwards which would break package feeds from (0:1.0.2+gitr0+f311acaff=
b-r0.13 to 0:1.0.0-7677-g62da9d2-r0.0) [version-going-backwards]
freerdp-1.2.5+gitrAUTOINC+62da9d28c6: Package version for package freerdp w=
ent backwards which would break package feeds from (0:1.0.2+gitr0+f311acaff=
b-r0.21 to 0:1.0.0-7677-g62da9d2-r0.0) [version-going-backwards]
freerdp-1.2.5+gitrAUTOINC+62da9d28c6: Package version for package freerdp-d=
bg went backwards which would break package feeds from (0:1.0.2+gitr0+f311a=
caffb-r0.13 to 0:1.0.0-7677-g62da9d2-r0.0) [version-going-backwards]
freerdp-1.2.5+gitrAUTOINC+62da9d28c6: Package version for package freerdp-d=
bg went backwards which would break package feeds from (0:1.0.2+gitr0+f311a=
caffb-r0.21 to 0:1.0.0-7677-g62da9d2-r0.0) [version-going-backwards]
freerdp-1.2.5+gitrAUTOINC+62da9d28c6: Package version for package freerdp-d=
ev went backwards which would break package feeds from (0:1.0.2+gitr0+f311a=
caffb-r0.13 to 0:1.0.0-7677-g62da9d2-r0.0) [version-going-backwards]
freerdp-1.2.5+gitrAUTOINC+62da9d28c6: Package version for package freerdp-d=
ev went backwards which would break package feeds from (0:1.0.2+gitr0+f311a=
caffb-r0.21 to 0:1.0.0-7677-g62da9d2-r0.0) [version-going-backwards]
freerdp-1.2.5+gitrAUTOINC+62da9d28c6: Package version for package freerdp-d=
oc went backwards which would break package feeds from (0:1.0.2+gitr0+f311a=
caffb-r0.13 to 0:1.0.0-7677-g62da9d2-r0.0) [version-going-backwards]
freerdp-1.2.5+gitrAUTOINC+62da9d28c6: Package version for package freerdp-d=
oc went backwards which would break package feeds from (0:1.0.2+gitr0+f311a=
caffb-r0.21 to 0:1.0.0-7677-g62da9d2-r0.0) [version-going-backwards]
freerdp-1.2.5+gitrAUTOINC+62da9d28c6: Package version for package freerdp-l=
ocale went backwards which would break package feeds from (0:1.0.2+gitr0+f3=
11acaffb-r0.13 to 0:1.0.0-7677-g62da9d2-r0.0) [version-going-backwards]
freerdp-1.2.5+gitrAUTOINC+62da9d28c6: Package version for package freerdp-l=
ocale went backwards which would break package feeds from (0:1.0.2+gitr0+f3=
11acaffb-r0.21 to 0:1.0.0-7677-g62da9d2-r0.0) [version-going-backwards]
freerdp-1.2.5+gitrAUTOINC+62da9d28c6: Package version for package freerdp-s=
taticdev went backwards which would break package feeds from (0:1.0.2+gitr0=
+f311acaffb-r0.13 to 0:1.0.0-7677-g62da9d2-r0.0) [version-going-backwards]
freerdp-1.2.5+gitrAUTOINC+62da9d28c6: Package version for package freerdp-s=
taticdev went backwards which would break package feeds from (0:1.0.2+gitr0=
+f311acaffb-r0.21 to 0:1.0.0-7677-g62da9d2-r0.0) [version-going-backwards]
freerdp-1.2.5+gitrAUTOINC+62da9d28c6: Package version for package libfreerd=
p went backwards which would break package feeds from (0:rsion-going-backwa=
rds]
gupnp-dlna-0.9.2: Package version for package gupnp-dlna went backwards whi=
ch would break package feeds from (0:0.9.4-r0.0 to 0:0.9.2-r0.35) [version-=
going-backwards]
gupnp-dlna-0.9.2: Package version for package gupnp-dlna went backwards whi=
ch would break package feeds from (0:0.9.4-r0.0 to 0:0.9.2-r0.37) [version-=
going-backwards]
gupnp-dlna-0.9.2: Package version for package gupnp-dlna-dbg went backwards=
 which would break package feeds from (0:0.9.4-r0.0 to 0:0.9.2-r0.34) [vers=
ion-going-backwards]
gupnp-dlna-0.9.2: Package version for package gupnp-dlna-dbg went backwards=
 which would break package feeds from (0:0.9.4-r0.0 to 0:0.9.2-r0.35) [vers=
ion-going-backwards]
gupnp-dlna-0.9.2: Package version for package gupnp-dlna-dbg went backwards=
 which would break package feeds from (0:0.9.4-r0.0 to 0:0.9.2-r0.37) [vers=
ion-going-backwards]
gupnp-dlna-0.9.2: Package version for package gupnp-dlna-dev went backwards=
 which would break package feeds from (0:0.9.4-r0.0 to 0:0.9.2-r0.34) [vers=
ion-going-backwards]
gupnp-dlna-0.9.2: Package version for package gupnp-dlna-dev went backwards=
 which would break package feeds from (0:0.9.4-r0.0 to 0:0.9.2-r0.35) [vers=
ion-going-backwards]
gupnp-dlna-0.9.2: Package version for package gupnp-dlna-dev went backwards=
 which would break package feeds from (0:0.9.4-r0.0 to 0:0.9.2-r0.37) [vers=
ion-going-backwards]
gupnp-dlna-0.9.2: Package version for package gupnp-dlna-doc went backwards=
 which would break package feeds from (0:0.9.4-r0.0 to 0:0.9.2-r0.34) [vers=
ion-going-backwards]
gupnp-dlna-0.9.2: Package version for package gupnp-dlna-doc went backwards=
 which would break package feeds from (0:0.9.4-r0.0 to 0:0.9.2-r0.35) [vers=
ion-going-backwards]
gupnp-dlna-0.9.2: Package version for package gupnp-dlna-doc went backwards=
 which would break package feeds from (0:0.9.4-r0.0 to 0:0.9.2-r0.37) [vers=
ion-going-backwards]
gupnp-dlna-0.9.2: Package version for package gupnp-dlna-locale went backwa=
rds which would break package feeds from (0:0.9.4-r0.0 to 0:0.9.2-r0.34) [v=
ersion-going-backwards]
gupnp-dlna-0.9.2: Package version for package gupnp-dlna-locale went backwa=
rds which would break package feeds from (0:0.9.4-r0.0 to 0:0.9.2-r0.35) [v=
ersion-going-backwards]
gupnp-dlna-0.9.2: Package version for package gupnp-dlna-locale went backwa=
rds which would break package feeds from (0:0.9.4-r0.0 to 0:0.9.2-r0.37) [v=
ersion-going-backwards]
gupnp-dlna-0.9.2: Package version for package gupnp-dlna-staticdev went bac=
kwards which would break package feeds from (0:0.9.4-r0.0 to 0:0.9.2-r0.34)=
 [version-going-backwards]
gupnp-dlna-0.9.2: Package version for package gupnp-dlna-staticdev went bac=
kwards which would break package feeds from (0:0.9.4-r0.0 to 0:0.9.2-r0.35)=
 [version-going-backwards]
gupnp-dlna-0.9.2: Package version for package gupnp-dlna-staticdev went bac=
kwards which would break package feeds from (0:0.9.4-r0.0 to 0:0.9.2-r0.37)=
 [version-going-backwards]
libauthen-sasl-perl-2.16: Package version for package libauthen-sasl-perl w=
ent backwards which would break package feeds from (0:2.16-r0.112 to 0:2.16=
-r0.111) [version-going-backwards]
libauthen-sasl-perl-2.16: Package version for package libauthen-sasl-perl-d=
bg went backwards which would break package feeds from (0:2.16-r0.112 to 0:=
2.16-r0.111) [version-going-backwards]
libauthen-sasl-perl-2.16: Package version for package libauthen-sasl-perl-d=
ev went backwards which would break package feeds from (0:2.16-r0.112 to 0:=
2.16-r0.111) [version-going-backwards]
libauthen-sasl-perl-2.16: Package version for package libauthen-sasl-perrds]
libdigest-hmac-perl-1.03: Package version for package libdigest-hmac-perl-d=
bg went backwards which would break package feeds from (0:1.03-r0.115 to 0:=
1.03-r0.114) [version-going-backwards]
libdigest-hmac-perl-1.03: Package version for package libdigest-hmac-perl-d=
ev went backwards which would break package feeds from (0:1.03-r0.115 to 0:=
1.03-r0.114) [version-going-backwards]
libdigest-hmac-perl-1.03: Package version for package libdigest-hmac-perl-d=
oc went backwards which would break package feeds from (0:1.03-r0.115 to 0:=
1.03-r0.114) [version-going-backwards]
libdigest-hmac-perl-1.03: Package version for package libdigest-hmac-perl-l=
ocale went backwards which would break package feeds from (0:1.03-r0.115 to=
 0:1.03-r0.114) [version-going-backwards]
libdigest-hmac-perl-1.03: Package version for package libdigest-hmac-perl-s=
taticdev went backwards which would break package feeds from (0:1.03-r0.115=
 to 0:1.03-r0.114) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-p=
erl went backwards which would break package feeds from (0:1.997-r0.110 to =
0:1.997-r0.109) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-p=
erl-dbg went backwards which would break package feeds from (0:1.997-r0.110=
 to 0:1.997-r0.109) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-p=
erl-dev went backwards which would break package feeds from (0:1.997-r0.110=
 to 0:1.997-r0.109) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-p=
erl-doc went backwards which would break package feeds from (0:1.997-r0.110=
 to 0:1.997-r0.109) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-p=
erl-locale went backwards which would break package feeds from (0:1.997-r0.=
110 to 0:1.997-r0.109) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-p=
erl-staticdev went backwards which would break package feeds from (0:1.997-=
r0.110 to 0:1.997-r0.109) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for=
 package luna-sysmgr-ipc-messages went backwards which would break package =
feeds from (0:2.0.0-1+git0+79155bd3f1-r0.144 to 0:2.0.0-1+git0+79155bd3f1-r=
0.142) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for=
 package luna-sysmgr-ipc-messages went backwards which would break package =
feeds from (0:2.0.0-1+git0+79155bd3f1-r0.145 to 0:2.0.0-1+git0+79155bd3f1-r=
0.144) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for=
 package luna-sysmgr-ipc-messages-dbg went backwards which would break pack=
age feeds from (0:2.0.0-1+git0+79155bd3f1-r0.144 to 0:2.0.0-1+git0+79155bd3=
f1-r0.142) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for=
 package luna-sysmgr-ipc-messages-dbg went backwards which would break pack=
age feeds from (0:2.0.0-1+git0+79155bd3f1-r0.145 to 0:2.0.0-1+git0+79155bd3=
f1-r0.144) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for=
 package luna-sysmgr-ipc-messages-dev went backwards which would break pack=
age feeds from (0:2.0.0-1+git0+79155bd3f1-r0.144 to 0:2.0.0-1+git0+79155bd3=
f1-r0.142) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for=
 package luna-sysmgr-ipc-messages-dev went backwards which would brAUTOINC+=
79155bd3f1: Package version for package luna-sysmgr-ipc-messages-doc went b=
ackwards which would break package feeds from (0:2.0.0-1+git0+79155bd3f1-r0=
=2E145 to 0:2.0.0-1+git0+79155bd3f1-r0.144) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for=
 package luna-sysmgr-ipc-messages-locale went backwards which would break p=
ackage feeds from (0:2.0.0-1+git0+79155bd3f1-r0.144 to 0:2.0.0-1+git0+79155=
bd3f1-r0.142) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for=
 package luna-sysmgr-ipc-messages-locale went backwards which would break p=
ackage feeds from (0:2.0.0-1+git0+79155bd3f1-r0.145 to 0:2.0.0-1+git0+79155=
bd3f1-r0.144) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for=
 package luna-sysmgr-ipc-messages-staticdev went backwards which would brea=
k package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.144 to 0:2.0.0-1+git0+79=
155bd3f1-r0.142) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for=
 package luna-sysmgr-ipc-messages-staticdev went backwards which would brea=
k package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.145 to 0:2.0.0-1+git0+79=
155bd3f1-r0.144) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common went backwa=
rds which would break package feeds from (0:1.34-r8.137 to 0:1.34-r8.135) [=
version-going-backwards]
xserver-common-1.34: Package version for package xserver-common went backwa=
rds which would break package feeds from (0:1.34-r8.138 to 0:1.34-r8.137) [=
version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-dbg went ba=
ckwards which would break package feeds from (0:1.34-r8.137 to 0:1.34-r8.13=
5) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-dbg went ba=
ckwards which would break package feeds from (0:1.34-r8.138 to 0:1.34-r8.13=
7) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-dev went ba=
ckwards which would break package feeds from (0:1.34-r8.137 to 0:1.34-r8.13=
5) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-dev went ba=
ckwards which would break package feeds from (0:1.34-r8.138 to 0:1.34-r8.13=
7) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-doc went ba=
ckwards which would break package feeds from (0:1.34-r8.137 to 0:1.34-r8.13=
5) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-doc went ba=
ckwards which would break package feeds from (0:1.34-r8.138 to 0:1.34-r8.13=
7) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-locale went=
 backwards which would break package feeds from (0:1.34-r8.137 to 0:1.34-r8=
=2E135) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-locale went=
 backwards which would break package feeds from (0:1.34-r8.138 to 0:1.34-r8=
=2E137) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-staticdev w=
ent backwards which would break package feeds from (0:1.34-r8.137 to 0:1.34=
-r8.135) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-staticdev w=
ent backwards which would break package feeds from (0:1.34-r8.138 to 0:1.34=
-r8.137) [version-going-backwards]


count: 31	issue: host-user-contaminated
apache2-2.4.16: apache2: /apache2-dev/usr/share/apache2/icons/small/uu.png =
is owned by uid 3er-contaminated]
cim-schema-exper-2.39.0: cim-schema-exper: /cim-schema-exper/usr/share/mof/=
cimv2.39.0/Application/CIM_AGPSoftwareFeature.mof is owned by uid 3004, whi=
ch is the same as the user running bitbake. This may be due to host contami=
nation [host-user-contaminated]
cim-schema-final-2.40.0: cim-schema-final: /cim-schema-final/usr/share/mof/=
cimv2.40.0/Application/CIM_AGPSoftwareFeature.mof is owned by uid 3004, whi=
ch is the same as the user running bitbake. This may be due to host contami=
nation [host-user-contaminated]
cinematicexperience-1.0: cinematicexperience: /cinematicexperience/usr/shar=
e/cinematicexperience-1.0/content/images/qt_logo.png is owned by uid 3004, =
which is the same as the user running bitbake. This may be due to host cont=
amination [host-user-contaminated]
debootstrap-1.0.67: debootstrap: /debootstrap/usr/share/debootstrap/scripts=
/breezy is owned by uid 3004, which is the same as the user running bitbake=
=2E This may be due to host contamination [host-user-contaminated]
dracut-043+giteab03540cd695d940062af5b55c02e8829aaa526: dracut: /dracut/usr=
/lib/dracut/modules.d/99uefi-lib/uefi-lib.sh is owned by uid 3004, which is=
 the same as the user running bitbake. This may be due to host contaminatio=
n [host-user-contaminated]
espeak-1.37: espeak: /espeak/usr/share/espeak-data/mbrola_ph/es4_phtrans is=
 owned by uid 3004, which is the same as the user running bitbake. This may=
 be due to host contamination [host-user-contaminated]
firefox-10.0.12esr: firefox: /firefox-dev/usr/share/idl/firefox-10.0/nsIBro=
wserHandler.idl is owned by uid 3004, which is the same as the user running=
 bitbake. This may be due to host contamination [host-user-contaminated]
firefox-10.0.12esr: firefox: /firefox-staticdev/usr/lib/firefox-devel-10.0/=
sdk/lib/libnssutil.a is owned by uid 3004, which is the same as the user ru=
nning bitbake. This may be due to host contamination [host-user-contaminate=
d]
libvpx-1.4.0: libvpx: /libvpx-dev/usr/lib/pkgconfig/vpx.pc is owned by uid =
3004, which is the same as the user running bitbake. This may be due to hos=
t contamination [host-user-contaminated]
libvpx-1.4.0: libvpx: /libvpx/usr/bin/vpxenc is owned by uid 3004, which is=
 the same as the user running bitbake. This may be due to host contaminatio=
n [host-user-contaminated]
logwatch-7.4.1: logwatch: /logwatch/usr/share/logwatch/default.conf/logfile=
s/mysql-mmm.conf is owned by uid 3004, which is the same as the user runnin=
g bitbake. This may be due to host contamination [host-user-contaminated]
monav-0.3: monav: /monav/usr/share/monav/images/directions/left.svg is owne=
d by uid 3004, which is the same as the user running bitbake. This may be d=
ue to host contamination [host-user-contaminated]
numptyphysics-0.2+svnr109: numptyphysics: /numptyphysics/usr/share/numptyph=
ysics/org_level/L50_nautilus.nph is owned by uid 3004, which is the same as=
 the user running bitbake. This may be due to host contamination [host-user=
-contaminated]
orrery-2.7: orrery: /orrery/usr/share/orrery/constellations/Andromeda is ow=
ned by uid 3004, which is the same as the user running bitbake. This may be=
 due to host contamination [host-user-contaminated]
phpmyadmin-4.4.9: phpmyadmin: /phpmyadmin/usr/share/phpmyadmin/doc/_ext/con=
figext.py is owned by uid 3004, which is the same as the user running bitba=
ke. This may be due to host contamination [host-user-contaminated]
qt5everywheredemo-1.0: qt5everywheredemo: /qt5everywheredemo/usr/share/qt5e=
verywheredemo-1.0/qml/QtDemo/images/tv.png is owned by uid 3004, which is t=
he same as the user running bitbake. This may be due to host contamination =
[host-user-contaminated]
qt5ledscreen-1.0: qt5ledscreen: /qt5ledscreen/usr/share/qt5ledscreen-1.0/im=
ages/logo1.png is owned by uid 3004, which is the same as the user running =
bitbake. This may be due to host contamination [host-user-contaminated]
qt5nmapcarousedemo-1.0: qt5nmapcarousedemo: /qt5nmapcarousedemo/usr/share/q=
t5nmapcarousedemo-1.0/content/images/arrow-right.png is owned by uid 3004, =
which is the same as the user running bitbake. This may be due to host cont=
amination [host-user-contaminated]
qt5nmapper-1.0: qt5nmapper: /qt5nmapper/usr/share/qt5nmapper-1.0/content/im=
ages/switch_thumb.png is owned by uid 3004, which is the same as the user r=
unning bitbake. This may be due to host contamination [host-user-contaminat=
ed]
qtbase-5.5.0+gitAUTOINC+c619d2daac: qtbase: /qtbase-dev/usr/lib/libqtpcre.p=
rl is owned by uid 3004, which is the same as the user running bitbake. Thi=
s may be due to host contamination [host-user-contaminated]
qtbase-5.5.0+gitAUTOINC+c619d2daac: qtbase: /qtbase-staticdev/usr/lib/libqt=
pcre.a is owned by uid 3004, which is the same as the user running bitbake.=
 This may be due to host contamination [host-user-contaminated]
qtsmarthome-1.0: qtsmarthome: /qtsmarthome/usr/share/qtsmarthome-1.0/qml/sm=
arthome/components/tabwidget/VTabBar.qml is owned by uid 3004, which is the=
 same as the user running bitbake. This may be due to host contamination [h=
ost-user-contaminated]
quitbattery-1.0.0: quitbattery: /quitbattery/usr/share/quitbattery-1.0.0/qm=
l/QUItBattery/images/glass.png is owned by uid 3004, which is the same as t=
he user running bitbake. This may be due to host contamination [host-user-c=
ontaminated]
quitindicators-1.0.1: quitindicators: /quitindicators/usr/share/quitindicat=
ors-1.0.1/qml/QUItIndicators/images/dots_512.png is owned by uid 3004, whic=
h is the same as the user running bitbake. This may be due to host contamin=
ation [host-user-contaminated]
qwt-6.0.1: qwt: /qwt-examples/usr/bin/realtime is owned by uid 3004, which =
is the same as the user running bitbake. This may be due to host contaminat=
ion [host-user-contaminated]
thone-0.7: thone: /thone/usr/bin/thone-toggle is owned by uid 3004, which i=
s the same as the user running bitbake. This may be due to host contaminati=
on [host-user-contaminated]
tipcutils-2.0.6: tipcutils: /tipcutils/etc/init.d/tipcutils is owned by uid=
 3004, which is the same as the user running bitbake. This may be due to ho=
st contamination [host-user-contaminated]


count: 1	issue: installed-vs-shipped
rrdtool: 5 installed and not shipped files. [installed-vs-shipped]


count: 1	issue: unknown-configure-option
polkit-gnome-0.105: polkit-gnome: configure was passed unrecognised options=
: --disable-examples --disable-introspection [unknown-configure-option]


count: 1	issue: symlink-to-sysroot
netkit-ftp-0.17: Symlink /usr/bin/pftp in netkit-ftp points to TMPDIR [syml=
ink-to-sysroot]


count: 3	issue: invalid-pkgconfig
gpsd-3.14: gpsd: invalid PACKAGECONFIG: bluez5 [invalid-pkgconfig]
qt-mobility-embedded-1.2.0: qt-mobility-embedded: invalid PACKAGECONFIG: bl=
uez5 [invalid-pkgconfig]
qt-mobility-x11-1.2.0: qt-mobility-x11: invalid PACKAGECONFIG: bluez5 [inva=
lid-pkgconfig]


count: 0	issue: pkgname


--d9ADC0YsG2v16Js0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYX8IMACgkQN1Ujt2V2gBzz4QCgikM34HyMcofZ1onuQMv9718Q
HXwAoKquBsyL6utT9F7GJ1FOSzZp65q4
=Ia1J
-----END PGP SIGNATURE-----

--d9ADC0YsG2v16Js0--
