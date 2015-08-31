Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id CDCC774197;
	Mon, 31 Aug 2015 12:56:27 +0000 (UTC)
Received: by widfa3 with SMTP id fa3so24154608wid.1;
	Mon, 31 Aug 2015 05:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=Q6Kozi5byyrUtIBo3zI6u2bpfdPtLVcalcASCjOYuHk=;
	b=G7P4GXhDhLKR4+RQyQvS5fwUlZtkbkPH6lRCVOYpGrhxggjHMXpMSj5dkxfHBj9MH8
	bmWWizdDDCi3ki5O3pTe0nJ4SXeoQC9UOq8wEpOnqB+5rwYmc2D0UiXYkhIf0R8ceJsd
	zl3LB++D6ueD9RYQOCq3lfwGDoCZYMfLTl1zwZe5SxEVKKwi0ClHfi4XDzUgNmcFcVuP
	Ee6Dy5b+SbX3SMKmaiSJpANX8pQ8SdYOyIZ0Z5ad5kndULKqNY90KKxHLCJWdxCX+nnv
	3lm2OK5QIP95ZZbZi/eJJG8Mrq/aHA5Dozsmx8YS/U/Yycro4dvsFjbjETTMHLsIj9TE
	yfWg==
X-Received: by 10.180.211.10 with SMTP id my10mr19412225wic.41.1441025787094; 
	Mon, 31 Aug 2015 05:56:27 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	mz12sm17910378wic.4.2015.08.31.05.56.26
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Aug 2015 05:56:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 31 Aug 2015 14:56:32 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20150831125632.GA2465@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: State of bitbake world, Failed tasks 2015-08-30
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
X-List-Received-Date: Mon, 31 Aug 2015 12:56:28 -0000
X-Groupsio-MsgNum: 70338
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qDbXVdCdHGoSgWSk"
Content-Disposition: inline

--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

OE @ ~/openembedded-core $ git log --oneline origin/master..contrib/jansa/m=
aster=20
8a4935f pulseaudio: improve PACKAGECONFIG for dbus/consolekit dependencies
125ca28 guile, mailx, gcc, opensp, gstreamer1.0-libav, libunwind: disable t=
humb where it fails for qemuarm
e223862 initramfs-framework: Drop allarch
d51627d linux-firmware: Drop allarch
ee54e69 ppp-dialin: Drop allarch
2ff92fc usbinit, weston-init, run-postinsts, qt-demo-init: Drop allarch
913639d resolvconf: Drop allarch
fb0f4d3 icu: force arm mode
00671a5 gdb: force arm mode
b403ca3 DO-NOT-MERGE: distutils3.bbclass: Don't use MACHINE variable
ada51b5 libsdl: Add support for libsdl-native
d15d53b WIP: Add KERNEL_EXTRA_ARGS?
b3eeef0 sstate-sysroot-cruft: Add /usr/src/kernel/.* to whitelist
f49d8ca report-error: Allow to upload reports automatically
758bb0b qemux86: Add identical qemux86copy variant for tests

=3D=3D Failed tasks 2015-08-30 =3D=3D

INFO: jenkins-job.sh-1.3.1 Complete log available at http://logs.nslu2-linu=
x.org/buildlogs/oe/world/log.report.20150830_101221.log

=3D=3D=3D common (16) =3D=3D=3D
    * /meta-openembedded/meta-efl/recipes-efl/efl/epdf_svn.bb, do_compile
    * /meta-openembedded/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.=
bb, do_fetch
    * /meta-openembedded/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-blu=
etooth_2.32.0.bb, do_compile
    * /meta-openembedded/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-=
disk-utility_2.32.0.bb, do_compile
    * /meta-openembedded/meta-gnome/recipes-gnome/gnome-power-manager/gnome=
-power-manager_2.32.0.bb, do_compile
    * /meta-openembedded/meta-gnome/recipes-gnome/gnome-settings-daemon/gno=
me-settings-daemon_2.32.1.bb, do_compile
    * /meta-openembedded/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.=
bb, do_fetch
    * /meta-openembedded/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_=
git.bb, do_compile
    * /meta-openembedded/meta-multimedia/recipes-multimedia/vlc/vlc_2.2.1.b=
b, do_compile
    * /meta-openembedded/meta-networking/recipes-connectivity/inetutils/ine=
tutils_1.9.4.bb, do_patch
    * /meta-openembedded/meta-oe/recipes-support/gd/gd_2.1.1.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.=
3-1.bb, do_compile
    * /meta-openembedded/meta-python/recipes-devtools/python/python-pyopens=
sl_0.15.1.bb, do_populate_sysroot
    * /meta-openembedded/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd=
_0.2.4.bb, do_compile
    * /meta-openembedded/meta-xfce/recipes-art/xfce4-icon-theme/xfce4-icon-=
theme_4.4.3.bb, do_populate_sysroot
    * /meta-webos-ports/meta-luneui/recipes-luneui/luna-next/luna-next.bb, =
do_compile

=3D=3D=3D common-x86 (3) =3D=3D=3D
    * /meta-openembedded/meta-efl/recipes-efl/webkit/webkit-efl_1.11.0.bb, =
do_compile
    * /meta-openembedded/meta-networking/recipes-kernel/netmap/netmap-modul=
es_git.bb, do_compile
    * /meta-qt5/recipes-qt/qt5/qtwebengine_git.bb, do_compile

=3D=3D=3D qemuarm (0) =3D=3D=3D

=3D=3D=3D qemux86 (1) =3D=3D=3D
    * /meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-ge=
ode_2.11.16.bb, do_compile

=3D=3D=3D qemux86_64 (3) =3D=3D=3D
    * /meta-browser/recipes-browser/chromium/cef3_280796.bb, do_configure
    * /meta-openembedded/meta-oe/recipes-extended/collectd/collectd_5.5.0.b=
b, do_compile
    * /meta-openembedded/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb=
, do_compile

=3D=3D=3D Number of failed tasks (58) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 16	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.w=
orld.20150829_114024.log// || http://errors.yoctoproject.org:80/Errors/Buil=
d/8422/
|-
|| qemux86 	|| 20	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.w=
orld.20150829_180544.log// ||=20
|-
|| qemux86_64 	|| 22	 || http://logs.nslu2-linux.org/buildlogs/oe/world//lo=
g.world.20150830_052357.log// ||=20
|}

=3D=3D=3D PNBLACKLISTs (66) =3D=3D=3D

=3D=3D=3D QA issues (68) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
|-
||0	||already-stripped
|-
||0	||libdir
|-
||2	||build-deps
|-
||2	||textrel
|-
||4	||file-rdeps
|-
||60	||version-going-backwards
|}


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-efl/recipes-efl/e17/diskio_svn.bb:PNBLACKLIST[diskio] ?=3D "broken: sw=
itch to https://git.enlightenment.org/enlightenment/modules/diskio.git/ and=
 fix 0.0.1+svnr82070-r0.0/E-MODULES-EXTRA/diskio/e-module-diskio.edc:58. in=
valid state name: 'off'. "default" state must always be first."
meta-efl/recipes-efl/efl/entrance_svn.bb:PNBLACKLIST[entrance] ?=3D "broken=
: switch to https://git.enlightenment.org/misc/entrance.git and fix 0.0.4+s=
vnr82070-r7/entrance/data/themes/old/default.edc:678. invalid state name: '=
defaault'. "default" state must always be first."
meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb:PNBLACKLIST[mcnavi] ?=3D=
 "BROKEN: latest version 0.3.4 is 3 years old and now broken with more stri=
ct ejde_cc from efl-1.13"
meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLACKLIST[gn=
ome-mplayer] ?=3D "rdepends on blacklisted mplayer"
meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb:PNBLACKLIST[gcr] ?=3D "CONFLICT: =
4 files conflict with gnome-keyring"
meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb:PNBLACKLIST[gno=
me-menus3] ?=3D "CONFLICT: 24 files are conflicting with gnome-menus"
meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gnom=
e-panel3] ?=3D "CONFLICT: depends on libgweather3 which conflicts with libg=
weather"
meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb:PNBLACKLIST[libgwea=
ther3] ?=3D "CONFLICT: 876 files are conflicting with libgweather"
meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb:PNBLACKLIST[zenity] ?=3D "=
BROKEN: doesn't build with B!=3DS"
meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb:PNBLACKLIST[xbmc] ?=3D=
 "/usr/include/c++/ctime:70:11: error: '::gmtime' has not been declared"
meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb:PNBLACKLIST=
[coriander] ?=3D "BROKEN: fails to use SDL probably because libsdl-config w=
as removed, error: unknown type name 'SDL_Overlay'"
meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb:PN=
BLACKLIST[renderer-service-upnp] ?=3D "BROKEN: doesn't build with B!=3DS (t=
rying to install rendererconsole.py from ${B} instead of ${S})"
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
meta-oe/recipes-extended/subsurface/subsurface_git.bb:PNBLACKLIST[subsurfac=
e] ?=3D "Needs to be upgraded for compatibility with new libdivecomputer"
meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb:PNBLACKLIST[clutter-b=
ox2d] ?=3D "BROKEN: doesn't build with B!=3DS"
meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:PNBLACKLIST[fim] ?=3D "BROKEN: =
doesn't build with B!=3DS (flex: can't open lex.lex)"
meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb:PNBLACKLIST[xf8=
6-input-mtev] ?=3D "BROKEN: doesn't build with B!=3DS (Makefile without ${S=
} in sed call)"
meta-oe/recipes-kernel/ktap/ktap-module_git.bb:PNBLACKLIST[ktap-module] ?=
=3D "Not compatible with 3.19 kernel"
meta-oe/recipes-kernel/ktap/ktap_git.bb:PNBLACKLIST[ktap] ?=3D "Depends on =
blacklisted kernel-module-ktapvm"
meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb:PNBLACKLIST[foxtr=
otgps] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conf=
licts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-navigation/gypsy/gypsy.inc:PNBLACKLIST[gypsy] ?=3D "${@bb.u=
tils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 an=
d bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-navigation/navit/navit.inc:PNBLACKLIST[navit] ?=3D "${@bb.u=
tils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 an=
d bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-qt/qconnman/qconnman-e_git.bb:PNBLACKLIST[qconnman-e] ?=3D =
"BROKEN: doesn't work with B!=3DS, ls: cannot access *.pro: No such file or=
 directory"
meta-oe/recipes-qt/qconnman/qconnman_git.bb:PNBLACKLIST[qconnman] ?=3D "BRO=
KEN: doesn't work with B!=3DS, ls: cannot access *.pro: No such file or dir=
ectory"
meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb:PNBLACKLIST[apcupsd] ?=
=3D "BROKEN: doesn't build with B!=3DS"
meta-oe/recipes-support/emacs/emacs_23.4.bb:PNBLACKLIST[emacs] ?=3D "qemu: =
uncaught target signal 11 (Segmentation fault) - core dumped"
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
meta-webos-ports:
conf/world_fixes.inc:PNBLACKLIST[mplayer2] =3D ""
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
gimp-2.8.14: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/gimp/2.8.14-r0/=
packages-split/gimp/usr/lib/gimp/2.0/plug-ins/file-ico' has relocations in =
=2Etext [textrel]


count: 2	issue: build-deps
imsettings-1.6.8: imsettings rdepends on xfconf, but it isn't a build depen=
dency? [build-deps]
qt5-creator-3.3.1: qt5-creator rdepends on qt-creator, but it isn't a build=
 dependency? [build-deps]


count: 4	issue: file-rdeps
gnome-desktop-2.32.1: /usr/bin/gnome-about_gnome-desktop contained in packa=
ge gnome-desktop requires /usr/bin/python, but no providers found in its RD=
EPENDS [file-rdeps]
libbonobo-2.32.1: /usr/bin/bonobo-slay_libbonobo contained in package libbo=
nobo requires /usr/bin/perl, but no providers found in its RDEPENDS [file-r=
deps]
networkmanager-1.0.4: /usr/bin/nmtui-connect_networkmanager contained in pa=
ckage networkmanager requires libnewt.so, but no providers found in its RDE=
PENDS [file-rdeps]
tracker-0.14.2: /usr/lib/nautilus/extensions-2.0/libnautilus-tracker-tags.s=
o_tracker-nautilus-extension contained in package tracker-nautilus-extensio=
n requires libnautilus-extension.so.1, but no providers found in its RDEPEN=
DS [file-rdeps]


count: 60	issue: version-going-backwards
cpushareholder-stub-2.0.1-2+gitAUTOINC+3a3169ca28: Package version for pack=
age cpushareholder-stub went backwards which would break package feeds from=
 (0:2.0.1-2+git0+3a3169ca28-r0.111 to 0:2.0.1-2+git0+3a3169ca28-r0.109) [ve=
rsion-going-backwards]
cpushareholder-stub-2.0.1-2+gitAUTOINC+3a3169ca28: Package version for pack=
age cpushareholder-stub-dbg went backwards which would break package feeds =
=66rom (0:2.0.1-2+git0+3a3169ca28-r0.111 to 0:2.0.1-2+git0+3a3169ca28-r0.10=
9) [version-going-backwards]
cpushareholder-stub-2.0.1-2+gitAUTOINC+3a3169ca28: Package version for pack=
age cpushareholder-stub-dev went backwards which would break package feeds =
=66rom (0:2.0.1-2+git0+3a3169ca28-r0.111 to 0:2.0.1-2+git0+3a3169ca28-r0.10=
9) [version-going-backwards]
cpushareholder-stub-2.0.1-2+gitAUTOINC+3a3169ca28: Package version for pack=
age cpushareholder-stub-doc went backwards which would break package feeds =
=66rom (0:2.0.1-2+git0+3a3169ca28-r0.111 to 0:2.0.1-2+git0+3a3169ca28-r0.10=
9) [version-going-backwards]
cpushareholder-stub-2.0.1-2+gitAUTOINC+3a3169ca28: Package version for pack=
age cpushareholder-stub-locale went backwards which would break package fee=
ds from (0:2.0.1-2+git0+3a3169ca28-r0.111 to 0:2.0.1-2+git0+3a3169ca28-r0.1=
09) [version-going-backwards]
cpushareholder-stub-2.0.1-2+gitAUTOINC+3a3169ca28: Package version for pack=
age cpushareholder-stub-staticdev went backwards which would break package =
feeds from (0:2.0.1-2+git0+3a3169ca28-r0.111 t break package feeds from (0:=
2.16-r0.89 to 0:2.16-r0.88) [version-going-backwards]
libauthen-sasl-perl-2.16: Package version for package libauthen-sasl-perl-d=
oc went backwards which would break package feeds from (0:2.16-r0.89 to 0:2=
=2E16-r0.88) [version-going-backwards]
libauthen-sasl-perl-2.16: Package version for package libauthen-sasl-perl-l=
ocale went backwards which would break package feeds from (0:2.16-r0.89 to =
0:2.16-r0.88) [version-going-backwards]
libauthen-sasl-perl-2.16: Package version for package libauthen-sasl-perl-s=
taticdev went backwards which would break package feeds from (0:2.16-r0.89 =
to 0:2.16-r0.88) [version-going-backwards]
libdigest-hmac-perl-1.03: Package version for package libdigest-hmac-perl w=
ent backwards which would break package feeds from (0:1.03-r0.91 to 0:1.03-=
r0.90) [version-going-backwards]
libdigest-hmac-perl-1.03: Package version for package libdigest-hmac-perl-d=
bg went backwards which would break package feeds from (0:1.03-r0.91 to 0:1=
=2E03-r0.90) [version-going-backwards]
libdigest-hmac-perl-1.03: Package version for package libdigest-hmac-perl-d=
ev went backwards which would break package feeds from (0:1.03-r0.91 to 0:1=
=2E03-r0.90) [version-going-backwards]
libdigest-hmac-perl-1.03: Package version for package libdigest-hmac-perl-d=
oc went backwards which would break package feeds from (0:1.03-r0.91 to 0:1=
=2E03-r0.90) [version-going-backwards]
libdigest-hmac-perl-1.03: Package version for package libdigest-hmac-perl-l=
ocale went backwards which would break package feeds from (0:1.03-r0.91 to =
0:1.03-r0.90) [version-going-backwards]
libdigest-hmac-perl-1.03: Package version for package libdigest-hmac-perl-s=
taticdev went backwards which would break package feeds from (0:1.03-r0.91 =
to 0:1.03-r0.90) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-p=
erl went backwards which would break package feeds from (0:1.997-r0.87 to 0=
:1.997-r0.86) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-p=
erl-dbg went backwards which would break package feeds from (0:1.997-r0.87 =
to 0:1.997-r0.86) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-p=
erl-dev went backwards which would break package feeds from (0:1.997-r0.87 =
to 0:1.997-r0.86) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-p=
erl-doc went backwards which would break package feeds from (0:1.997-r0.87 =
to 0:1.997-r0.86) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-p=
erl-locale went backwards which would break package feeds from (0:1.997-r0.=
87 to 0:1.997-r0.86) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-p=
erl-staticdev went backwards which would break package feeds from (0:1.997-=
r0.87 to 0:1.997-r0.86) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for=
 package luna-sysmgr-ipc-messages went backwards which would break package =
feeds from (0:2.0.0-1+git0+79155bd3f1-r0.117 to 0:2.0.0-1+git0+79155bd3f1-r=
0.115) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for=
 package luna-sysmgr-ipc-messages-dbg went backwards which would break pack=
age feeds from (0:2.0.0-1+git0+79155bd3f1-r0.117 to 0:2.0.0-1+git0+79155bd3=
f1-r0.115) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for=
 package luna-sysmgr-ipc-messages-dev went backwards which would break pack=
age feeds from (0:2.0.0-1+git0+79155bd3f1-r0.117 to 0:2.0.0-1+git0+79155bd3=
f1-r0.115) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for=
 package luna-sysmgr-ipc-messages-doc went backwards which would break pack=
age feeds from (0:2.0.0-1+git0+79155bd3f1-r0.117 to 0:2.0.0-1+git0+79155bd3=
f1-r0.115) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for=
 package luna-sysmgr-ipc-messages-locale went backwards which would break p=
ackage feeds from (0:2.0.0-1+git0+79155bd3f1-r0.117 to 0:2.0.0-1+git0+79155=
bd3f1-r0.115) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for=
 package luna-sysmgr-ipc-messages-staticdev went backwards which would brea=
k package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.117 to 0:2.0.0-1+git0+79=
155bd3f1-r0.115) [version-going-backwards]
luna-webkit-api-2.0.0-1+gitAUTOINC+d0b393ac0c: Package version for package =
luna-webkit-api went backwards which would break package feeds from (0:2.0.=
0-1+git0+d0b393ac0c-r0.116 to 0:2.0.0-1+git0+d0b393ac0c-r0.114) [version-go=
ing-backwards]
luna-webkit-api-2.0.0-1+gitAUTOINC+d0b393ac0c: Package version for package =
luna-webkit-api-dbg went backwards which would break package feeds from (0:=
2.0.0-1+git0+d0b393ac0c-r0.116 to 0:2.0.0-1+git0+d0b393ac0c-r0.114) [versio=
n-going-backwards]
luna-webkit-api-2.0.0-1+gitAUTOINC+d0b393ac0c: Package version for package =
luna-webkit-api-dev went backwards which would break package feeds from (0:=
2.0.0-1+git0+d0b393ac0c-r0.116 to 0:2.0.0-1+git0+d0b393ac0c-r0.114) [versio=
n-going-backwards]
luna-webkit-api-2.0.0-1+gitAUTOINC+d0b393ac0c: Package version for package =
luna-webkit-api-doc went backwards which would break package feeds from (0:=
2.0.0-1+git0+d0b393ac0c-r0.116 to 0:2.0.0-1+git0+d0b393ac0c-r0.114) [versio=
n-going-backwards]
luna-webkit-api-2.0.0-1+gitAUTOINC+d0b393ac0c: Package version for package =
luna-webkit-api-locale went backwards which would break package feeds from =
(0:2.0.0-1+git0+d0b393ac0c-r0.116 to 0:2.0.0-1+git0+d0b393ac0c-r0.114) [ver=
sion-going-backwards]
luna-webkit-api-2.0.0-1+gitAUTOINC+d0b393ac0c: Package version for package =
luna-webkit-api-staticdev went backwards which would break package feeds fr=
om (0:2.0.0-1+git0+d0b393ac0c-r0.116 to 0:2.0.0-1+git0+d0b393ac0c-r0.114) [=
version-going-backwards]
polkit-group-rule-datetime-1.0: Package version for package polkit-group-ru=
le-datetime went backwards which would break package feeds from (0:1.0-r0.1=
06 to 0:1.0-r0.104) [version-going-backwards]
polkit-group-rule-datetime-1.0: Package version for package polkit-group-ru=
le-datetime-dbg went backwards which would break package feeds from (0:1.0-=
r0.106 to 0:1.0-r0.104) [version-going-backwards]
polkit-group-rule-datetime-1.0: Package version for package polkit-group-ru=
le-datetime-dev went backwards which would break package feeds from (0:1.0-=
r0.106 to 0:1.0-r0.104) [version-going-backwards]
polkit-group-rule-datetime-1.0: Package version for package polkit-group-ru=
le-datetime-doc went backwards which would break package feeds from (0:1.0-=
r0.106 to 0:1.0-r0.104) [version-going-backwards]
polkit-group-rule-datetime-1.0: Package version for package polkit-group-ru=
le-datetime-locale went backwards which would break package feeds from (0:1=
=2E0-r0.106 to 0:1.0-r0.104) [version-going-backwards]
polkit-group-rule-datetime-1.0: Package version for package polkit-group-ru=
le-datetime-staticdev went backwards which would break package feeds from (=
0:1.0-r0.106 to 0:1.0-r0.104) [version-going-backwards]
polkit-group-rule-network-1.0: Package version for package polkit-group-rul=
e-network went backwards which would break package feeds from (0:1.0-r0.106=
 to 0:1.0-r0.104) [version-going-backwards]
polkit-group-rule-network-1.0: Package version for package polkit-group-rul=
e-network-dbg went backwards which would break package feeds from (0:1.0-r0=
=2E106 to 0:1.0-r0.104) [version-going-backwards]
polkit-group-rule-network-1.0: Package version for package polkit-group-rul=
e-network-dev went backwards which would break package feeds from (0:1.0-r0=
=2E106 to 0:1.0-r0.104) [version-going-backwards]
polkit-group-rule-network-1.0: Package version for package polkit-group-rul=
e-network-doc went backwards which would break package feeds from (0:1.0-r0=
=2E106 to 0:1.0-r0.104) [version-going-backwards]
polkit-group-rule-network-1.0: Package version for package polkit-group-rul=
e-network-locale went backwards which would break package feeds from (0:1.0=
-r0.106 to 0:1.0-r0.104) [version-going-backwards]
postub-2.0.0-1+gitAUTOINC+51341059f7: Package version for package rdx-utils=
-stub-locale went backwards which would break package feeds from (0:2.0.0-1=
+git0+51341059f7-r0.111 to 0:2.0.0-1+git0+51341059f7-r0.109) [version-going=
-backwards]
rdx-utils-stub-2.0.0-1+gitAUTOINC+51341059f7: Package version for package r=
dx-utils-stub-staticdev went backwards which would break package feeds from=
 (0:2.0.0-1+git0+51341059f7-r0.111 to 0:2.0.0-1+git0+51341059f7-r0.109) [ve=
rsion-going-backwards]
xserver-common-1.34: Package version for package xserver-common went backwa=
rds which would break package feeds from (0:1.34-r8.110 to 0:1.34-r8.108) [=
version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-dbg went ba=
ckwards which would break package feeds from (0:1.34-r8.110 to 0:1.34-r8.10=
8) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-dev went ba=
ckwards which would break package feeds from (0:1.34-r8.110 to 0:1.34-r8.10=
8) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-doc went ba=
ckwards which would break package feeds from (0:1.34-r8.110 to 0:1.34-r8.10=
8) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-locale went=
 backwards which would break package feeds from (0:1.34-r8.110 to 0:1.34-r8=
=2E108) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-staticdev w=
ent backwards which would break package feeds from (0:1.34-r8.110 to 0:1.34=
-r8.108) [version-going-backwards]

--qDbXVdCdHGoSgWSk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXkTr4ACgkQN1Ujt2V2gByySgCfS1+z7iTf7NpYbvJQ3fw/Dxu7
GY0AnjHrzckDGk3cR/7FYV8KmWVgZSIh
=krcU
-----END PGP SIGNATURE-----

--qDbXVdCdHGoSgWSk--
