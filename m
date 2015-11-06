Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 5A34A76E70;
	Fri,  6 Nov 2015 18:00:18 +0000 (UTC)
Received: by wmec201 with SMTP id c201so24223319wme.1;
	Fri, 06 Nov 2015 10:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=IQ4Z9qsm2NS75IW5uLTP/4Mt+1plGFHP/Z/BcUEKH7w=;
	b=FzCQsbiylzeexuY/RdAwNpNEQWw/Zcte6OD5NEEjaFq0ZcfUGeqQwpRpA22rn5CuOj
	2zEnb8C5Ok5Gg1Y2GDPCw9Rde1abkUZy0yWt1+I4LHFY9NBjbQW4ktqdLRTuJubkRcTN
	L9RMC6NJuzeAWx2PjHG4NvOF0OVlbjNH7K+6mnCVDbsxJrRUwtdKAw5R+oafftBXVp7L
	BDVgch7ybJYIwxhYePeC3SFcA7iEGSfhLFpBIVwUGUhRKuvlGEiEY8VKKLhj0DyWJYGx
	wLH7SwGkNrQxAW0hX9g8jEFzD2I6/WQ3u9zaVwyP8TnhuhRAEIUN9ePqjW7eI8EMYPgz
	yyzQ==
X-Received: by 10.28.131.11 with SMTP id f11mr11031966wmd.59.1446832818366;
	Fri, 06 Nov 2015 10:00:18 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	kd8sm1211278wjc.27.2015.11.06.10.00.17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Nov 2015 10:00:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 6 Nov 2015 19:00:36 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20151106180036.GH2550@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: State of bitbake world, Failed tasks 2015-11-06
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
X-List-Received-Date: Fri, 06 Nov 2015 18:00:23 -0000
X-Groupsio-MsgNum: 73027
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9jHkwA2TBA/ec6v+"
Content-Disposition: inline

--9jHkwA2TBA/ec6v+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
9ae7b2e world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
e0fcea0 gstreamer1.0-plugins-{base,good}: update PACKAGECONFIGs
7529c5e libunwind: fix build for qemuarm
e3bde21 Revert "mesa: upgrade llvm to 3.5"
87476fb mesa: upgrade llvm to 3.5
d7e0182 feature-arm-vfp.inc: add -mfpu=3Dvfpv4 when vfpv4 is in TUNE_FEATUR=
ES
2c31e02 feature-arm-vfp.inc: respect vfpv4 when setting -mfloat-abi and ARM=
PKGSFX_EABI
f369654 arch-armv7ve: add tune include for armv7ve and use it from cortexa7=
 and cortexa15
958890a tune-*: use mcpu instead of mtune for ARM tunes
2ab8410 cortexa{7,15,17}: add VFPv4 tunes
5b8abbb directfb: add fPIC to CFLAGS
821f516 guile, mailx, gcc, opensp, gstreamer1.0-libav, libunwind: disable t=
humb where it fails for qemuarm
bc9aac3 icu: force arm mode
189f639 DO-NOT-MERGE: distutils3.bbclass: Don't use MACHINE variable
4199420 libsdl: Add support for libsdl-native
3421dc1 WIP: Add KERNEL_EXTRA_ARGS?
0485850 sstate-sysroot-cruft: Add /usr/src/kernel/.* to whitelist
14f740a report-error: Allow to upload reports automatically
17c307b qemux86copy
9b13a93 Revert "qemux86: Add identical qemux86copy variant for tests"
0e18854 qemux86: Add identical qemux86copy variant for tests

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
8170c2b vlc
db07c4e sysdig: replace luajit with lua5.1
1d3d1ad wipe: add version 0.23
02f8ac3 tmux: update to 2.1
4d9b50e gateone: update to latest git
3b60302 python-html5lib: import recipe from meta-openstack
c69df81 Add libdvbpsi 1.3.0
31be37b VLC: make gnome-vfs configurable
cdd2e62 VLC: add an optional dependency on libdvbpsi
570afda VLC: make libnotify a configurable dependency
b8a07c8 VLC: depends on gst-plugins-bad only if gst is enabled
1825f4e net-snmp: fix cross compilation
d02b833 libsmi: add configure file
1e6c5bb python-pygpgme: add python-pygpgme 0.3
856cbd3 libtevent: add missing dependency on libcap
11afda1 opensaf: remove unused service file
55c4b35 ypbind-mt: set path of ypdomainname in ypbind script
9421b7e netcat-openbsd: replace patch with quilt
690134e gvfs: add missing libgudev to DEPENDS
67a16f9 mariadb: update to 5.5.46
7507066 ninja-native: add initial recipe, ninja 1.6.0
db4b532 llvm: Add recipe for llvm-3.7.0
d79cbe0 libubox: fix libdir
bcfbed8 python-pyqt: Fix build for aarch64.
f79c67a python-cffi: Update to version 1.3.0
373ac9d lldpd: Update to version 0.7.19
16bfa8f libssh2: specify the search dir to avoid host contamination
a006133 mousepad: inherit gsettings
8a1cf19 samba: install pam libraries to base_libdir
909a122 samba: add cups to DEPENDS
5d0f6fb luajit: drop a note for build machine requirements
751f060 cdrkit: initial add 1.1.11
8dbe574 xfce4-whiskermenu-plugin: update to 1.5.1
fc233b2 fontforge: avoid cloning uthash during do_compile
18d454b uthash: add native extend
a9f3167 fontforge: use autotools-bootstrap.bbclass
ee13cf6 gnulib: add native extend
066c193 netcf: use autotools-bootstrap.bbclass
d9fb9be autotools-bootstrap.bbclass: initial add
56347c2 gnulib: move meta-networking -> meta-oe
77616b9 gparted: add polkit support
7c9ffc4 gparted: add gtk-icon-cache to inherit
0522e0b gparted: update to 0.24.0
8b269d0 packagegroup-xfce-extended: xfce-polkit
2e42a43 xfce-polkit: initial add 0.2
a13f79f xfce4-vala: unbreak by telling configure vala API version
d784fcf lua5.1: Reintroduce and make it coexist with lua 5.3
ae8b5eb postfix: premission of /var/spool/mail seems incorrect
f4d5ede tcpdump: add PACKAGECONFIG for libcap-ng
6ae788a pure-ftpd: add PACKAGECONFIG for libsodium
dc8cbb7 dovecot: add PACKAGECONFIG for lz4
755b7c4 net-snmp: Modify snmpd.service
f70b93e snort: fix indentation
8cda033 snort: fix m4 causes out of memory during configure
123fad5 ntp: upgrade 4.2.8p3 -> 4.2.8p4
491b0c4 netcat: add DESCRIPTION
05fc0ea lldpad: remove obsolete recipe
00a2117 xl2tpd: Update git recipe and add release recipe

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
ee54c32 qttranslations: add ${PN}-qtserialport
c4d6604 qtwebengine-5.6
279c14f qtsvg: fix incorrect heart.svg installation path
059c030 qtbase: add glib to PACKAGECONFIG_X11
89cbdc7 qtbase: include oe-device-extra.pri unconditionally
8ee6119 qt5: upgrade to latest revision in 5.6 branch (5.6.0-alpha1+)

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
c3acadd chromium: fix gcc5 compile issues

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
cea35c2 qtwebkit: move to unused
e16ae4f qtwayland, qtwebengine: use webOS-ports/master-next branch compatib=
le with 5.6
fbffa49 README: update to depend on master branches
fc3bcbc connman: upgrade to 1.30 from oe-core
f62ade0 directfb: add fPIC
413e959 mesa: re-enabled fbdef, gallium-egl, gallium-gbm in 10.3.7 version
7192b62 mesa: temporary disable fbdev EGL platform
6ea4f87 mesa: remove unsupported PACKAGECONFIGs
b3bc8ad mesa: backport patch to fix build with gcc-5
5e42ca8 db8 mediaindexer imaccountvalidator imlibpurpleservice activitymana=
ger configurator filecache mojomail: add -fpermissive
c554b13 luna-service2: add -fgnu89-inline to use old semantics for inline
11109ab phonesim: Add -fPIC
0572460 leveldb-tl: use latest revision from gcc-4.9 branch
099f003 libpalmsocket: fix build with gcc-5
035cee2 systemd: update persistent-storage-rule-mmc-partname.patch to apply=
 for v225
3e15eda pmstatemachineengine: fix build with gcc-5
5cfc45f opkg: rename bbappend to match new oe-core version
839b18c packagegroup-luneos-extended: temporary drop keymanager, node-dbus,=
 node-sqlite3, node-taglib
04525e0 activitymanager: Fix build with boost-1.58.0
a1a753c python-tz-native: upgrade to 2015.4 and add fix for newer tzdata
e4a04cf vboxguestdrivers: use 4.3.30 version from meta-oe
f99a42d nodejs-module-webos-*: fix build for nodejs-0.12.2
2124dda nodejs: remove recipe in order to use 0.12.2 from meta-oe
6765155 packagegroup-webos-extended: drop sysvinit-pidof
58e3236 alsa-utils: rename .bbappend to match new version from oe-core
052a3b4 alsa-lib: rename .bbappend to match new version from oe-core
a6fa9ce glib-2.0: rename bbappend to match new version from oe-core
eeb3916 luneos-features: keep using bluez4
4c110c6 README: update to depend on jethro branches
545f373 enyo-submodules: Add bbclass with enyo submodules definitions

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D

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
||2015-11-06	||5	||7	||7	||0		||0		||2		||42		||3		||30		||9		||1		||1		||0=
		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2015-11-06 =3D=3D

INFO: jenkins-job.sh-1.4.7 Complete log available at http://logs.nslu2-linu=
x.org/buildlogs/oe/world/log.report.20151106_142815.log

=3D=3D=3D common (5) =3D=3D=3D
    * /meta-openembedded/meta-gnome/recipes-gnome/devilspie/devilspie2_0.33=
=2Ebb, do_compile
    * /meta-openembedded/meta-oe/recipes-core/llvm/llvm3.7.0_3.7.0.bb, do_c=
ompile
    * /meta-openembedded/meta-oe/recipes-extended/sysdig/sysdig_git.bb, do_=
compile
    * /meta-qt5/recipes-qt/qt5/qt5-creator_3.3.1.bb, do_compile
    * /openembedded-core/meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb, do=
_compile

=3D=3D=3D common-x86 (1) =3D=3D=3D
    * /meta-qt5/recipes-qt/qt5/qtwebengine_git.bb, do_fetch

=3D=3D=3D qemuarm (0) =3D=3D=3D

=3D=3D=3D qemux86 (1) =3D=3D=3D
    * /meta-browser/recipes-browser/chromium/cef3_280796.bb, do_compile

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * /meta-browser/recipes-browser/chromium/cef3_280796.bb, do_configure

=3D=3D=3D Number of failed tasks (19) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 5	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.wo=
rld.20151105_130121.log// || http://errors.yoctoproject.org:80/Errors/Build=
/9734/
|-
|| qemux86 	|| 7	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.wo=
rld.20151105_182506.log// || http://errors.yoctoproject.org:80/Errors/Build=
/9746/
|-
|| qemux86_64 	|| 7	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log=
=2Eworld.20151106_041957.log// || http://errors.yoctoproject.org:80/Errors/=
Build/9774/
|}

=3D=3D=3D PNBLACKLISTs (90) =3D=3D=3D

=3D=3D=3D QA issues (88) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
|-
||0	||already-stripped
|-
||0	||invalid-pkgconfig
|-
||0	||libdir
|-
||0	||pkgname
|-
||0	||symlink-to-sysroot
|-
||1	||installed-vs-shipped
|-
||1	||unknown-configure-option
|-
||2	||textrel
|-
||3	||file-rdeps
|-
||30	||version-going-backwards
|-
||42	||build-deps
|-
||9	||host-user-contaminated
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
count: 0	issue: already-stripped


count: 0	issue: libdir


count: 2	issue: textrel
chromium-40.0.2214.91: ELF binary '/tmp/work/i586-oe-linux/chromium/40.0.22=
14.91-r0/packages-split/chromium-codecs-ffmpeg/usr/lib/chromium/libffmpegsu=
mo.so' has relocations in .text [textrel]
webkit-efl-1.11.0: ELF binary '/tmp/work/i586-oe-linux/webkit-efl/1_1.11.0-=
r0/packages-split/webkit-efl/usr/lib/libjavascriptcore_efl.so.1.11.0' has r=
elocations in .text [textrel]


count: 42	issue: build-deps
cpu-0.0.1+svnr82070: cpu rdepends on libunwind, but it isn't a build depend=
ency? [build-deps]
e-wm-0.18.8: e-wm rdepends on libunwind, but it isn't a build dependency? [=
build-deps]
elementary-1.15.1: elementary rdepends on libunwind, but it isn't a build d=
ependency? [build-deps]
elementary-1.15.1: elementary-accessibility rdepends on libunwind, but it i=
sn't a build dependency? [build-deps]
elementary-1.15.1: elementary-tests rdepends on libunwind, but it isn't a b=
uild dependency? [build-deps]
elfe-0.0.1+gitrAUTOINC+1ec0e7713c: elfe rdepends on libunwind, but it isn't=
 a build dependency? [build-deps]
enjoy-0.1.0+gitrAUTOINC+aa8fec69e8: enjoy rdepends on libunwind, but it isn=
't a build dependency? [build-deps]
epdf-0.1.0+svnr82070: epdf rdepends on libunwind, but it isn't a build depe=
ndency? [build-deps]
estardict-0.7: estardict rdepends on libunwind, but it isn't a build depend=
ency? [build-deps]
exalt-0.9+svnr82070: exalt rdepends on libunwind, but it isn't a build depe=
ndency? [build-deps]
exalt-client-0.0.1+svnr82070: exalt-client rdepends on libunwind, but it is=
n't a build dependency? [build-deps]
flame-0.0.3+svnr82070: flame rdepends on libunwind, but it isn't a build de=
pendency? [build-deps]
forecasts-0.2.0+svnr82070: forecasts rdepends on libunwind, but it isn't a =
build dependency? [build-deps]
libeflvala-2011.01.13.1+svnr82070: libeflvala rdepends on libunwind, but it=
 isn't a build dependency? [build-deps]
libphone-ui-shr-0.0.1+gitrAUTOINC+25e6160710: libphone-ui-shr rdepends on l=
ibunwind, but it isn't a build dependency? [build-deps]
places-0.1.0+svnr82070: places rdepends on libunwind, but it isn't a build =
dependency? [build-deps]
rain-0.0.3+svnr82070: rain rdepends on libunwind, but it isn't a build depe=
ndency? [build-deps]
samba-4.1.12: samba rdepends on cyrus-sasl, but it isn't a build dependency=
? [build-deps]
samba-4.1.12: samba rdepends on dmapi, but it isn't a build dependency? [bu=
ild-deps]
samba-4.1.12: samba rdepends on libaio, but it isn't a build dependency? [b=
uild-deps]
samba-4.1.12: samba rdepends on libbsd, but it isn't a build dependency? [b=
uild-deps]
samba-4.1.12: samba rdepends on libpam, but it isn't a build dependency? [b=
uild-deps]
samba-4.1.12: samba-python rdepends on libbsd, but it isn't a build depende=
ncy? [build-deps]
shr-e-gadgets-0.0.0+gitrAUTOINC+42806ea24f: shr-e-gadgets rdepends on libun=
wind, but it isn't a build dependency? [build-deps]
shr-wizard-0.0.0+gitrAUTOINC+1dae79221f: shr-wizard rdepends on libunwind, =
but it isn't a build dependency? [build-deps]
tmux-2.1: tmux rdepends on libutempter, but it isn't a build dependency? [b=
uild-deps]
uptime-0.0.2+svnr82070: uptime rdepends on libunwind, but it isn't a build =
dependency? [build-deps]
vlc-2.2.1: vlc rdepends on cairo, but it isn't a build dependency? [build-d=
eps]
vlc-2.2.1: vlc rdepends on fontconfig, but it isn't a build dependency? [bu=
ild-deps]
vlc-2.2.1: vlc rdepends on freetype, but it isn't a build dependency? [buil=
d-deps]
vlc-2.2.1: vlc rdepends on gdk-pixbuf, but it isn't a build dependency? [bu=
ild-deps]
vlc-2.2.1: vlc rdepends on gnome-vfs, but it isn't a build dependency? [bui=
ld-deps]
vlc-2.2.1: vlc rdepends on harfbuzz, but it isn't a build dependency? [buil=
d-deps]
vlc-2.2.1: vlc rdepends on libavc1394, but it isn't a build dependency? [bu=
ild-deps]
vlc-2.2.1: vlc rdepends on libcroco, but it isn't a build dependency? [buil=
d-deps]
vlc-2.2.1: vlc rdepends on libdvdnav, but it isn't a build dependency? [bui=
ld-deps]
vlc-2.2.1: vlc rdepends on librsvg, but it isn't a build dependency? [build=
-deps]
vlc-2.2.1: vlc rdepends on libssh2, but it isn't a build dependency? [build=
-deps]
vlc-2.2.1: vlc rdepends on libupnp, but it isn't a build dependency? [build=
-deps]
vlc-2.2.1: vlc rdepends on libvorbis, but it isn't a build dependency? [bui=
ld-deps]
vlc-2.2.1: vlc rdepends on pango, but it isn't a build dependency? [build-d=
eps]
vlc-2.2.1: vlc rdepends on pixman, but it isn't a build dependency? [build-=
deps]


count: 3	issue: file-rdeps
ctdb-2.5.1: /usr/bin/onnode_ctdb contained in package ctdb requires /bin/ba=
sh, but no providers found in its RDEPENDS [file-rdeps]
tracker-0.14.2: /usr/lib/nautilus/extensions-2.0/libnautilus-tracker-tags.s=
o_tracker-nautilus-extension contained in package tracker-nautilus-extensio=
n requires libnautilus-extension.so.1()(64bit), but no providers found in i=
ts RDEPENDS [file-rdeps]
tracker-0.14.2: /usr/lib/nautilus/extensions-2.0/libnautilus-tracker-tags.s=
o_tracker-nautilus-extension contained in package tracker-nautilus-extensio=
n requires libnautilus-extension.so.1, but no providers found in its RDEPEN=
DS [file-rdeps]


count: 30	issue: version-going-backwards
libauthen-sasl-perl-2.16: Package version for package libauthen-sasl-perl w=
ent backwards which would break package feeds from (0:2.16-r0.128 ing-backw=
ards]
libdigest-hmac-perl-1.03: Package version for package libdigest-hmac-perl-d=
bg went backwards which would break package feeds from (0:1.03-r0.131 to 0:=
1.03-r0.129) [version-going-backwards]
libdigest-hmac-perl-1.03: Package version for package libdigest-hmac-perl-d=
ev went backwards which would break package feeds from (0:1.03-r0.131 to 0:=
1.03-r0.129) [version-going-backwards]
libdigest-hmac-perl-1.03: Package version for package libdigest-hmac-perl-d=
oc went backwards which would break package feeds from (0:1.03-r0.131 to 0:=
1.03-r0.129) [version-going-backwards]
libdigest-hmac-perl-1.03: Package version for package libdigest-hmac-perl-l=
ocale went backwards which would break package feeds from (0:1.03-r0.131 to=
 0:1.03-r0.129) [version-going-backwards]
libdigest-hmac-perl-1.03: Package version for package libdigest-hmac-perl-s=
taticdev went backwards which would break package feeds from (0:1.03-r0.131=
 to 0:1.03-r0.129) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-p=
erl went backwards which would break package feeds from (0:1.997-r0.126 to =
0:1.997-r0.124) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-p=
erl-dbg went backwards which would break package feeds from (0:1.997-r0.126=
 to 0:1.997-r0.124) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-p=
erl-dev went backwards which would break package feeds from (0:1.997-r0.126=
 to 0:1.997-r0.124) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-p=
erl-doc went backwards which would break package feeds from (0:1.997-r0.126=
 to 0:1.997-r0.124) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-p=
erl-locale went backwards which would break package feeds from (0:1.997-r0.=
126 to 0:1.997-r0.124) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-p=
erl-staticdev went backwards which would break package feeds from (0:1.997-=
r0.126 to 0:1.997-r0.124) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for=
 package luna-sysmgr-ipc-messages went backwards which would break package =
feeds from (0:2.0.0-1+git0+79155bd3f1-r0.167 to 0:2.0.0-1+git0+79155bd3f1-r=
0.165) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for=
 package luna-sysmgr-ipc-messages-dbg went backwards which would break pack=
age feeds from (0:2.0.0-1+git0+79155bd3f1-r0.167 to 0:2.0.0-1+git0+79155bd3=
f1-r0.165) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for=
 package luna-sysmgr-ipc-messages-dev went backwards which would break pack=
age feeds from (0:2.0.0-1+git0+79155bd3f1-r0.167 to 0:2.0.0-1+git0+79155bd3=
f1-r0.165) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for=
 package luna-sysmgr-ipc-messages-doc went backwards which would break pack=
age feeds from (0:2.0.0-1+git0+79155bd3f1-r0.167 to 0:2.0.0-1+git0+79155bd3=
f1-r0.165) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for=
 package luna-sysmgr-ipc-messages-locale went backwards which would break p=
ackage feeds from (0:2.0.0-1+git0+79155bd3f1-r0.167 to 0:2.0.0-1+git0+79155=
bd3f1-r0.165) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for=
 package luna-sysmgr-ipc-messages-staticdev went b xserver-common-doc went =
backwards which would break package feeds from (0:1.34-r8.159 to 0:1.34-r8.=
157) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-locale went=
 backwards which would break package feeds from (0:1.34-r8.159 to 0:1.34-r8=
=2E157) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-staticdev w=
ent backwards which would break package feeds from (0:1.34-r8.159 to 0:1.34=
-r8.157) [version-going-backwards]


count: 9	issue: host-user-contaminated
babiloo-efl-2.0.9-10: babiloo-efl: /babiloo-efl/usr/share/babiloo/core/test=
/test_dictionary.py is owned by uid 3004, which is the same as the user run=
ning bitbake. This may be due to host contamination [host-user-contaminated]
cinematicexperience-1.0: cinematicexperience: /cinematicexperience/usr/shar=
e/cinematicexperience-1.0/content/images/qt_logo.png is owned by uid 3004, =
which is the same as the user running bitbake. This may be due to host cont=
amination [host-user-contaminated]
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


count: 1	issue: installed-vs-shipped
qttranslations: 1 installed and not shipped files. [installed-vs-shipped]


count: 1	issue: unknown-configure-option
vlc-2.2.1: vlc: configure was passed unrecognised options: --disable-gnome-=
vfs [unknown-configure-option]


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname

--9jHkwA2TBA/ec6v+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlY86sIACgkQN1Ujt2V2gBxwCACeLtwAnXdMpYsKCAuUfWRzq2hg
s00AoIWukYg5cjhJoJlvECDYA51RqF9k
=gSf5
-----END PGP SIGNATURE-----

--9jHkwA2TBA/ec6v+--
