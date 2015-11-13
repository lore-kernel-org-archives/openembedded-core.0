Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id DDE0677342;
	Fri, 13 Nov 2015 16:52:27 +0000 (UTC)
Received: by wmec201 with SMTP id c201so90524902wme.0;
	Fri, 13 Nov 2015 08:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=BXmi0SMyqKmPeTJOoWrM8WxUCchaLclAUyI6+hkKQas=;
	b=FqE4ww7+CK6DIjsEQ/5ZConiIaoCy5igwbUbYeyhxcGbMVvQDKFFBrBvv48efru/Kg
	w/S35hIVoTb76egcc9dq4pUfRTCHX7e1vi9To7tiL/eebuDW6wQ9KbaTj776EbFyfssE
	O7vqQPNi32Iu3j4HjBP4Asg1028iPdvJAW5EJEdzSTnEqLUfcRw8oceIARmNwK84BU9v
	9NIaiOR698NfTMgTocPsGS+vMxB3NRWAIeZCbd2ahFneYIr68fAVM4E4Oy5gs2kooZp+
	QeyYFBS+wXaD2zlNGqWisELQKqMznvyI05YXSM8dhoS1PXb8lsnteB2P6N5AMhasHGwU
	m1lA==
X-Received: by 10.28.30.3 with SMTP id e3mr5040747wme.78.1447433547491;
	Fri, 13 Nov 2015 08:52:27 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id u17sm4767513wmd.8.2015.11.13.08.52.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Nov 2015 08:52:26 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 13 Nov 2015 17:52:49 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20151113165249.GF2567@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: State of bitbake world, Failed tasks 2015-11-13
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
X-List-Received-Date: Fri, 13 Nov 2015 16:52:28 -0000
X-Groupsio-MsgNum: 73422
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1Ow488MNN9B9o/ov"
Content-Disposition: inline

--1Ow488MNN9B9o/ov
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2015 at 11:15:48AM +0100, Martin Jansa wrote:
> Finally some good results, only libsdl2 from oe-core is failing with
> default configuration (you need to disable wayland PACKAGECONFIG to get
> it built).
>=20
> Be aware that there are more issues in oe-core without these changes:
> icu, guile, mailx, gcc, opensp, gstreamer1.0-libav, libunwind, directfb, =
libunwind
> will all fail.
>=20
> There are many changes left in meta-networking waiting for Joe to merge
> them, but I'll update "jethro" branch for last time today and let Armin
> handle backporting for meta-networking changes worth getting into jethro.
>=20

Ross sent fix for libsdl2 which works, now only linux-yocto started to
fail again.

test-dependencies builds are running again now to see how many issues
are left after fixes I've sent yesterday

=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
9ae7b2e world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
c07615c DO-NOT-MERGE: distutils3.bbclass: Don't use MACHINE variable
3e101bd libsdl: Add support for libsdl-native
24fd00a WIP: Add KERNEL_EXTRA_ARGS?
6de353f sstate-sysroot-cruft: Add /usr/src/kernel/.* to whitelist
ed3bb3e qemux86copy
7c1414b Revert "qemux86: Add identical qemux86copy variant for tests"
f5997bf qemux86: Add identical qemux86copy variant for tests
0570309 report-error: Allow to upload reports automatically
7e33835 rootfs_*.bbclass: don't add BUILDNAME to do_rootfs vardepsexclude
b1aa323 feature-arm-vfp.inc: add -mfpu=3Dvfpv4 when vfpv4 is in TUNE_FEATUR=
ES
e240c92 feature-arm-vfp.inc: respect vfpv4 when setting -mfloat-abi and ARM=
PKGSFX_EABI
081cd0a arch-armv7ve: add tune include for armv7ve and use it from cortexa7=
 and cortexa15
4f0725f tune-*: use mcpu instead of mtune for ARM tunes
de7285e cortexa{7,15,17}: add VFPv4 tunes
b0d5717 libsdl2: require GLES when building Wayland support
4067541 gst-plugins-bad: add PACKAGECONFIGs for voamrwbenc, voaacenc, resin=
dvd
92f7434 gstreamer1.0-plugins-good: fix PACKAGECONFIG for gudev and add one =
for v4l2 and libv4l2
3b84258 gstreamer1.0-plugins-bad: fix dependencies for uvch264 PACKAGECONFIG
04a5504 gstreamer1.0-plugins-{base,good}: update PACKAGECONFIGs
28461f8 libunwind: fix build for qemuarm
187ab5a directfb: add fPIC to CFLAGS
6ec5fbb guile, mailx, gcc, opensp, gstreamer1.0-libav, libunwind: disable t=
humb where it fails for qemuarm
d441c6d icu: force arm mode

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
274d994 samba: fix dependencies and QA issues
cdcb9d1 gst-plugins-bad: add PACKAGECONFIGs for voamrwbenc, voaacenc, resin=
dvd
42e4395 xfce4-session: exclude machine-host dependency with SIGGEN_EXCLUDE_=
SAFE_RECIPE_DEPS
b450d7c dracut: exclude kernel-modules dependency with SIGGEN_EXCLUDE_SAFE_=
RECIPE_DEPS
e75b041 packagegroup-efl-sdk: exclude packagegroup-core-sdk dependency with=
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS
6a09f06 libauthen-sasl-perl, libdigest-hmac-perl, libio-socket-ssl-perl: do=
n't set PACKAGE_ARCH =3D "all"
f92b4c4 netmap-modules: disable building virtio_net drivers
762f98c netmap: set MACHINE_ARCH, because it depends on MACHINE_ARCH netmap=
-modules
7eb5b37 phpmyadmin: exclude bash dependency with SIGGEN_EXCLUDE_SAFE_RECIPE=
_DEPS
7bedd71 terminus-font, ttf*: exclude fontconfig dependency with SIGGEN_EXCL=
UDE_SAFE_RECIPE_DEPS
9ba49c2 lmsensors: drop LINUX=3D${STAGING_KERNEL_DIR} from EXTRA_OEMAKE
721920b xserver-common, xserver-nodm-init: drop allarch, depends on couple =
TUNE_PKGARCH recipes
887a909 zabbix: set MACHINE_ARCH, because it depends on MACHINE specific KE=
RNEL_VERSION
963716c xl2tpd: set MACHINE_ARCH, because it depends on kernel
028f50e tipcutils: set MACHINE_ARCH, because it depends on kernel
bdae804 linux-atm: set MACHINE_ARCH, because it depends on kernel
475b37e ipsec-tools: set MACHINE_ARCH, because it depends on kernel
e065373 gst-plugins-good: add PACKAGECONFIG for dv1394
6aba957 pinpoint: add librsvg dependency
36915e6 gammu: add missing dependency on libgudev
dd6ee40 fbida: add PACKAGECONFIG for lirc
a6f95ad devicekit-power: add missing dependency on libgudev
e602dfc gst-plugins-base: add PACKAGECONFIG for cdparanoia
d4ddb31 lldpd: Update to version 0.7.19
132ab31 lldpd: configure the systemd unit file dir
ee79c8f net-snmp: fix cross compilation
e471078 opensaf: remove unused service file
eb1b9ce ypbind-mt: set path of ypdomainname in ypbind script
3f591c0 netcat-openbsd: replace patch with quilt
c04fd54 postfix: premission of /var/spool/mail seems incorrect
a479807 tcpdump: add PACKAGECONFIG for libcap-ng
216aecf pure-ftpd: add PACKAGECONFIG for libsodium
29ba609 dovecot: add PACKAGECONFIG for lz4
c06b3f8 net-snmp: Modify snmpd.service
ef057d6 ntp: upgrade 4.2.8p3 -> 4.2.8p4
12a5717 netcat: add DESCRIPTION
62ab12b lldpad: remove obsolete recipe
e6df515 xl2tpd: Update git recipe and add release recipe

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
a4f5c42 auto-sysroot
20a89f6 qtwebengine: disable autodetection from sysroot
0e7358d README: mention Yocto Project Compatible
2211600 qt5-creator: upgrade to 3.5.1
0b13a9d qtwebengine: add dependency on flac
1fb8e76 qtwebengine: include chromium SRCREV in SRCPV
77c4bfd qtwebengine: add dependency on yasm-native and use it
58b21ec qtwebengine: fix QMAKE_AR variable
8d8d995 qtwebengine: add dependency on libxscrnsaver with x11 in DISTRO_FEA=
TURES
df83955 qtwebengine: bump SRCREV and re-add 0003-functions.prf-allow-build-=
for-linux-oe-g-platform.patch
d03313b qttranslations: add ${PN}-qtserialport
279c14f qtsvg: fix incorrect heart.svg installation path
059c030 qtbase: add glib to PACKAGECONFIG_X11
89cbdc7 qtbase: include oe-device-extra.pri unconditionally
8ee6119 qt5: upgrade to latest revision in 5.6 branch (5.6.0-alpha1+)

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
c2dea00 chromium: use PARALLEL_MAKE to control build parallelism
0baeb26 cef3: use PARALLEL_MAKE to control build parallelism

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
a2cf923 luna-sysmgr-ipc-messages: drop unnecessary DEPENDS

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
37d30d9 initscripts: fix bbappends
0263ed9 android-tools: exclude android-tools-conf dependency with SIGGEN_EX=
CLUDE_SAFE_RECIPE_DEPS
96c7dd4 icon-theme-neo: inherit allarch

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
||2015-11-13	||0	||1	||0	||0		||0		||0		||13		||1		||0		||0		||0		||0		||0	=
	||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2015-11-13 =3D=3D

INFO: jenkins-job.sh-1.6.0 Complete log available at http://logs.nslu2-linu=
x.org/buildlogs/oe/world/log.report.20151113_162318.log

=3D=3D=3D common () =3D=3D=3D

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (0) =3D=3D=3D

=3D=3D=3D qemux86 (1) =3D=3D=3D
    * /openembedded-core/meta/recipes-kernel/linux/linux-yocto_4.1.bb, do_c=
ompile

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (1) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 0	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.wo=
rld.20151112_112629.log// ||=20
|-
|| qemux86 	|| 1	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.wo=
rld.20151113_045216.log// || http://errors.yoctoproject.org:80/Errors/Build=
/9829/
|-
|| qemux86_64 	|| 0	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log=
=2Eworld.20151113_093131.log// ||=20
|}

=3D=3D=3D PNBLACKLISTs (90) =3D=3D=3D

=3D=3D=3D QA issues (14) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
|-
||0	||already-stripped
|-
||0	||host-user-contaminated
|-
||0	||installed-vs-shipped
|-
||0	||invalid-pkgconfig
|-
||0	||libdir
|-
||0	||pkgname
|-
||0	||symlink-to-sysroot
|-
||0	||textrel
|-
||0	||unknown-configure-option
|-
||0	||version-going-backwards
|-
||1	||file-rdeps
|-
||13	||build-deps
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


count: 0	issue: textrel


count: 13	issue: build-deps
enjoy-0.1.0+gitrAUTOINC+aa8fec69e8: enjoy rdepends on libunwind, but it isn=
't a build dependency? [build-deps]
samba-4.1.12: samba rdepends on cyrus-sasl, but it isn't a build dependency=
? [build-deps]
samba-4.1.12: samba rdepends on dmapi, but it isn't a build dependency? [bu=
ild-deps]
samba-4.1.12: samba rdepends on libbsd, but it isn't a build dependency? [b=
uild-deps]
samba-4.1.12: samba rdepends on libpam, but it isn't a build dependency? [b=
uild-deps]
samba-4.1.12: samba-python rdepends on libbsd, but it isn't a build depende=
ncy? [build-deps]
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


count: 1	issue: file-rdeps
tracker-0.14.2: /usr/lib/nautilus/extensions-2.0/libnautilus-tracker-tags.s=
o_tracker-nautilus-extension contained in package tracker-nautilus-extensio=
n requires libnautilus-extension.so.1, but no providers found in its RDEPEN=
DS [file-rdeps]


count: 0	issue: version-going-backwards


count: 0	issue: host-user-contaminated


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


--1Ow488MNN9B9o/ov
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZGFWAACgkQN1Ujt2V2gBzocQCdGwF/N0dFPS8NiUi2EXw/LOc9
1/EAoKU58x7DSurjr7kTNaP/0KnRuVqE
=DaRQ
-----END PGP SIGNATURE-----

--1Ow488MNN9B9o/ov--
