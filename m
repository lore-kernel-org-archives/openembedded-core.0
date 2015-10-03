Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2CC4877080;
	Sat,  3 Oct 2015 13:32:33 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so62000683wic.1;
	Sat, 03 Oct 2015 06:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=ifvJ/Rh19KWsw7yCKI+B0+9GVhd4t60X5f1bDFQHu2A=;
	b=SrrlPc/Xef4iXoZ+2x4QeKR3CXzmmG0UZhoXE4GWgHlFW58HLtdEK4iU1HW4eUZPtm
	ssL7KdRSPoG5WJip9nmiYbQwQ13J25ASj7kmdgOfcr6ojW769gPme2WuUW35qQx/EYUS
	0/BVzcu18KthtISzIPfmKhxp4dJ5fcmP69dyNXhi7k6WCV6JsjBXyIoj4Crrq92rukjc
	9KSlVTqOYM98Uvt1OL5ZRnYWlg61UJ22aRBJGwIOrkb2J5FBHEDVDKfmYxEQ5iOk2wL+
	ctA0bh5Q21pDjporaC4PGCjFFceveOCXClyA+ni8cxPwyE7DfZP4OoIky2h2ge9ejhj0
	zozA==
X-Received: by 10.194.190.75 with SMTP id go11mr20365810wjc.80.1443879153481; 
	Sat, 03 Oct 2015 06:32:33 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id g5sm4203825wix.13.2015.10.03.06.32.31
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 03 Oct 2015 06:32:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 3 Oct 2015 15:33:43 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20151003133343.GC2381@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: State of bitbake world, Failed tasks 2015-10-02
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
X-List-Received-Date: Sat, 03 Oct 2015 13:32:36 -0000
X-Groupsio-MsgNum: 71901
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3Gf/FFewwPeBMqCJ"
Content-Disposition: inline

--3Gf/FFewwPeBMqCJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2015 at 01:54:58PM +0200, Martin Jansa wrote:
> On Wed, Aug 26, 2015 at 03:56:04PM +0200, Martin Jansa wrote:
> > Time for even more PNBLACKLISTs..
>=20
> And it got even worse.

PNBLACKLISTs sent to ML, they will be included in next report.

Again executed without sstate and format of report was changed to list
individual QA issues separately instead of counting them per MACHINE.

=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
c7b19fa world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
df9423f fontcache: allow to pass extra parameters and environment to fc-cac=
he
47940a6 guile, mailx, gcc, opensp, gstreamer1.0-libav, libunwind: disable t=
humb where it fails for qemuarm
5678be5 icu: force arm mode
70c98db gdb: force arm mode
c3f3b52 DO-NOT-MERGE: distutils3.bbclass: Don't use MACHINE variable
02d8bc7 libsdl: Add support for libsdl-native
77fc6e3 WIP: Add KERNEL_EXTRA_ARGS?
8083415 sstate-sysroot-cruft: Add /usr/src/kernel/.* to whitelist
84c77b9 report-error: Allow to upload reports automatically
4e11200 qemux86: Add identical qemux86copy variant for tests

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
444c897 webkit-efl: fix build with cmake-3*
4592441 sblim-sfcCommon: rename to sblim-sfc-common
68624b4 efibootmgr: 0.6.0 -> 0.12
be555aa webkit-efl: temporary disable as-needed
f126b0b wayland-fits: Add recipe
908ebb3 efl: support wayland, egl
2b93c87 pyroute2: update to 0.3.14, fix depends, fix license
8aa5510 modemmanager: depend on libgudev not on udev
4bd1745 networkmanager: depend on libgudev not on udev
94411dc libgudev: exclude use with systemd <=3D220
ea3e661 xfce4-screenshooter: ensure output directory is created
1ea1b9c plymouth: building documatation sometimes fails to download so disa=
ble it
5a3ce32 sshfs-fuse: correct definition of S
7371f20 lldpd: Add recipe
f6451da opencv: backport commit to compile with ppc
779eb5e xl2tpd: 1.3.0 -> 1.3.6
4165253 net-snmp: Fix build with gcc5
1c31bfa inetutils: fix rcp to work with large file

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
394345c qmake5_paths, qtbase: add OE_QMAKE_PATH_QT_FONTS
8f765ed qt5: upgrade to latest revision in 5.5 branches

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
6e9d5b8 chromium: Rework the evaluation of the Wayland feature.
06cff07 chromium: Clean the definitions of some ozone-wayland variables.
f80eaa8 chromium: Allow to build in Debug mode.

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
2916688 mesa: backport patch to fix build with gcc-5
f813a09 Revert "lxc: Drop imported recipes from meta-virtualization"
b56902f lxc: Drop imported recipes from meta-virtualization
d9f8ffd mesa: re-enabled fbdef, gallium-egl, gallium-gbm in 10.3.7 version
1ede816 mesa: temporary disable fbdev EGL platform
162ab4b mesa: remove unsupported PACKAGECONFIGs

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
f3eb29a linux-nokia900-meego: defconfig cleanup
945977f linux-nokia900-meego: nokia900-defconfig-min
854d837 linux-nokia900-meego: nokia900-defconfig-complete
0f3b811 linux-nokia900-meego: nokia900-defconfig-min
0c547b4 linux-nokia900-meego: upgrade to 3.13 from Arch linux
0cacc0b image_types_fastboot: add skeleton for fastboot image_type

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2015-10-02 =3D=3D

INFO: jenkins-job.sh-1.4.3 Complete log available at http://logs.nslu2-linu=
x.org/buildlogs/oe/world/log.report.20151003_131055.log

=3D=3D=3D common (17) =3D=3D=3D
    * /meta-openembedded/meta-efl/recipes-efl/efl/azy_svn.bb, do_compile
    * /meta-openembedded/meta-efl/recipes-efl/efl/epdf_svn.bb, do_compile
    * /meta-openembedded/meta-gnome/recipes-gnome/gnome-power-manager/gnome=
-power-manager_2.32.0.bb, do_compile
    * /meta-openembedded/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.=
bb, do_configure
    * /meta-openembedded/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6=
=2Ebb, do_compile
    * /meta-openembedded/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_=
git.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libi=
mobiledevice_1.1.4.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-devtools/packagekit/packagekit_0.5=
=2E6.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.1=
2.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb, d=
o_compile
    * /meta-openembedded/meta-oe/recipes-extended/sblim-sfc-common/sblim-sf=
c-common_1.0.1.bb, do_configure
    * /meta-openembedded/meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb, =
do_compile
    * /meta-openembedded/meta-oe/recipes-graphics/xorg-app/sessreg_1.1.0.bb=
, do_compile
    * /meta-openembedded/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb=
, do_compile
    * /meta-openembedded/meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb, do=
_compile
    * /meta-openembedded/meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.=
3-1.bb, do_compile
    * /meta-openembedded/meta-perl/recipes-perl/libnet/libnet-dns-perl_0.81=
=2Ebb, do_configure

=3D=3D=3D common-x86 (3) =3D=3D=3D
    * /meta-browser/recipes-browser/chromium/chromium_40.0.2214.91.bb, do_c=
ompile
    * /meta-openembedded/meta-efl/recipes-efl/webkit/webkit-efl_1.11.0.bb, =
do_compile
    * /openembedded-core/meta/recipes-gnome/gcr/gcr_3.16.0.bb, do_populate_=
sysroot

=3D=3D=3D qemuarm (4) =3D=3D=3D
    * /meta-openembedded/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb,=
 do_compile
    * /openembedded-core/meta/recipes-gnome/gcr/gcr_3.16.0.bb, do_compile
    * /openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.18.2.bb, =
do_compile
    * /openembedded-core/meta/recipes-support/libunwind/libunwind_1.1.bb, d=
o_compile

=3D=3D=3D qemux86 (2) =3D=3D=3D
    * /meta-browser/recipes-browser/chromium/cef3_280796.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-ge=
ode_2.11.16.bb, do_compile
=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * /meta-browser/recipes-browser/chromium/cef3_280796.bb, do_configure

=3D=3D=3D Number of failed tasks (64) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 21	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.w=
orld.20150929_204356.log// || http://errors.yoctoproject.org:80/Errors/Buil=
d/8916/
|-
|| qemux86 	|| 22	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.w=
orld.20151001_023455.log// || http://errors.yoctoproject.org:80/Errors/Buil=
d/8937/
|-
|| qemux86_64 	|| 21	 || http://logs.nslu2-linux.org/buildlogs/oe/world//lo=
g.world.20151002_051242.log// || http://errors.yoctoproject.org:80/Errors/B=
uild/8966/
|}

=3D=3D=3D PNBLACKLISTs (65) =3D=3D=3D

=3D=3D=3D QA issues (118) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
|-
||0	||libdir
|-
||0	||pkgname
|-
||0	||version-going-backwards
|-
||1	||symlink-to-sysroot
|-
||1	||unknown-configure-option
|-
||18	||textrel
|-
||2	||installed-vs-shipped
|-
||25	||build-deps
|-
||3	||already-stripped
|-
||3	||invalid-pkgconfig
|-
||31	||file-rdeps
|-
||34	||host-user-contaminated
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
count: 3	issue: already-stripped
qwt-6.0.1: File '/usr/lib/libqwt.so.6.0.1' from qwt was already stripped, t=
his will prevent future debugging! [already-stripped]
qwt-6.0.1: File '/usr/lib/libqwtmathml.so.6.0.1' from qwt was already strip=
ped, this will prevent future debugging! [already-stripped]
qwt-6.0.1: File '/usr/lib/qt4/plugins/designer/libqwt_designer_plugin.so' f=
rom qwt was already stripped, this will prevent future debugging! [already-=
stripped]


count: 0	issue: libdir


count: 18	issue: textrel
corosync-2.3.5: ELF binary '/tmp/work/core2-64-oe-linux/corosync/2.3.5-r0/p=
ackages-split/corosync/usr/sbin/corosync' has relocations in .text [textrel]
directfb-1.7.7: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/directfb/1.7=
=2E7-r0/packages-split/directfb/usr/bin/mkdfiff' has relocations in .text [=
textrel]
efl-1.15.1: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/efl/2_1.15.1-r0/p=
ackages-split/evas/usr/lib/evas/cserve2/bin/v-1.15/evas_cserve2_slave' has =
relocations in .text [textrel]
gstreamer1.0-libav-1.4.5: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/gst=
reamer1.0-libav/1.4.5-r0/packages-split/gstreamer1.0-libav/usr/lib/gstreame=
r-1.0/libgstlibav.so' has relocations in .text [textrel]
gstreamer1.0-libav-1.4.5: ELF binary '/tmp/work/i586-oe-linux/gstreamer1.0-=
libav/1.4.5-r0/packages-split/gstreamer1.0-libav/usr/lib/gstreamer-1.0/libg=
stlibav.so' has relocations in .text [textrel]
libav-9.18: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/libav/9.18-r0/pac=
kages-split/libavcodec/usr/lib/libavcodec.so.54.35.0' has relocations in .t=
ext [textrel]
libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-spli=
t/libavcodec/usr/lib/libavcodec.so.54.35.0' has relocations in .text [textr=
el]
libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-spli=
t/libavdevice/usr/lib/libavdevice.so.53.2.0' has relocations in .text [text=
rel]
libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-spli=
t/libavfilter/usr/lib/libavfilter.so.3.3.0' has relocations in .text [textr=
el]
libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-spli=
t/libavformat/usr/lib/libavformat.so.54.20.4' has relocations in .text [tex=
trel]
libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-spli=
t/libavresample/usr/lib/libavresample.so.1.0.1' has relocations in .text [t=
extrel]
libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-spli=
t/libavutil/usr/lib/libavutil.so.52.3.0' has relocations in .text [textrel]
libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-spli=
t/libswscale/usr/lib/libswscale.so.2.1.1' has relocations in .text [textrel]
libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary '/tmp/work/armv5te-oe-=
linux-gnueabi/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split/li=
bpostproc/usr/lib/libpostproc.so.52.3.0' has relocations in .text [textrel]
libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary '/tmp/work/i586-oe-lin=
ux/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split/libpostproc/u=
sr/lib/libpostproc.so.52.3.0' has relocations in .text [textrel]
matchbox-keyboard-0.0+gitAUTOINC+217f1bfe14: ELF binary '/tmp/work/armv5te-=
oe-linux-gnueabi/matchbox-keyboard/0.0+gitAUTOINC+217f1bfe14-r4/packages-sp=
lit/matchbox-keyboard/usr/bin/matchbox-keyboard' has relocations in .text [=
textrel]
mpg123-1.21.0: ELF binary '/tmp/work/i586-oe-linux/mpg123/1.21.0-r0/package=
s-split/mpg123/usr/lib/libmpg123.so.0.40.3' has relocations in .text [textr=
el]
qtwebengine-5.5.0+gitAUTOINC+qtwebengine: ELF binary '/tmp/work/i586-oe-lin=
ux/qtwebengine/5.5.0+gitAUTOINC+qtwebengine-r0/packages-split/qtwebengine-p=
lugins/usr/lib/qt5/plugins/qtwebengine/libffmpegsumo.so' has relocations in=
 .text [textrel]


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
10, but it isn't a build dependency? [build-deps]
qt-mobility-x11-1.2.0: qt-mobility-x11 rdepends on libgstapp-0.10, but it i=
sn't a build dependency? [build-deps]
qt-mobility-x11-1.2.0: qt-mobility-x11 rdepends on libgstinterfaces-0.10, b=
ut it isn't a build dependency? [build-deps]
qt-mobility-x11-1.2.0: qt-mobility-x11 rdepends on libgstvideo-0.10, but it=
 isn't a build dependency? [build-deps]
qt-mobility-x11-1.2.0: qt-mobility-x11 rdepends on libxv, but it isn't a bu=
ild dependency? [build-deps]
qt5-creator-3.3.1: qt5-creator rdepends on qt-creator, but it isn't a build=
 dependency? [build-deps]
qtwebengine-5.5.0+gitAUTOINC+qtwebengine: qtwebengine rdepends on qtlocatio=
n, but it isn't a build dependency? [build-deps]
samba-4.1.12: samba rdepends on libavahi-client, but it isn't a build depen=
dency? [build-deps]
samba-4.1.12: samba rdepends on libavahi-common, but it isn't a build depen=
dency? [build-deps]
sox-14.4.0: sox rdepends on libflac, but it isn't a build dependency? [buil=
d-deps]
webmin-1.750: webmin rdepends on perl-module-sdbm, but it isn't a build dep=
endency? [build-deps]


count: 31	issue: file-rdeps
chkconfig-1.3.58: /usr/sbin/ntsysv_chkconfig contained in package chkconfig=
 requires libnewt.so()(64bit), but no providers found in its RDEPENDS [file=
-rdeps]
chkconfig-1.3.58: /usr/sbin/ntsysv_chkconfig contained in package chkconfig=
 requires libnewt.so, but no providers found in its RDEPENDS [file-rdeps]
ctdb-2.5.1: /usr/bin/onnode_ctdb contained in package ctdb requires /bin/ba=
sh, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbdate_dvbdate contained in package dvbdate requi=
res libucsi.so()(64bit), but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbdate_dvbdate contained in package dvbdate requi=
res libucsi.so, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbnet_dvbnet .1: /usr/bin/femon_dvb-femon contain=
ed in package dvb-femon requires libdvbapi.so, but no providers found in it=
s RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/gotox_dvb-apps contained in package dvb-apps requi=
res libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/gotox_dvb-apps contained in package dvb-apps requi=
res libdvbsec.so()(64bit), but no providers found in its RDEPENDS [file-rde=
ps]
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
equires libnewt.so()(64bit), but no providers found in its RDEPENDS [file-r=
deps]
libnewt-0.52.18: /usr/bin/whiptail_whiptail contained in package whiptail r=
equires libnewt.so, but no providers found in its RDEPENDS [file-rdeps]
libnewt-python-0.52.18: /usr/lib/python2.7/site-packages/@underscore@snack.=
so_libnewt-python contained in package libnewt-python requires libnewt.so()=
(64bit), but no providers found in its RDEPENDS [file-rdeps]
libnewt-python-0.52.18: /usr/lib/python2.7/site-packages/@underscore@snack.=
so_libnewt-python contained in package libnewt-python requires libnewt.so, =
but no providers found in its RDEPENDS [file-rdeps]
networkmanager-1.0.4: /usr/bin/nmtui-connect_networkmanager contained in pa=
ckage networkmanager requires libnewt.so()(64bit), but no providers found i=
n its RDEPENDS [file-rdeps]
networkmanager-1.0.4: /usr/bin/nmtui-connect_networkmanager contained in pa=
ckage networkmanager requires libnewt.so, but no providers found in its RDE=
PENDS [file-rdeps]
numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert.pl_numptyphysic=
s contained in package numptyphysics requires /usr/bin/perl, but no provide=
rs found in its RDEPENDS [file-rdeps]
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
o_tracker-nautilus-extension contained in package tracker-nautilus-extensio=
n requires libnautilus-extension.so.1, but no providers found in its RDEPEN=
DS [file-rdeps]
ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: /usr/bin/memory-map.sh_ubx-utils co=
ntained in package ubx-utils requires /bin/bash, but no providers found in =
its RDEPENDS [file-rdeps]


count: 0	issue: version-going-backwards


count: 34	issue: host-user-contaminated
apache2-2.4.16: apache2: /apache2-dev/usr/share/apache2/icons/small/uu.png =
is owned by uid 3004, which is the same as the user running bche2: /apache2=
/usr/share/apache2/cgi-bin/printenv is owned by uid 3004, which is the same=
 as the user running bitbake. This may be due to host contamination [host-u=
ser-contaminated]
babiloo-efl-2.0.9-10: babiloo-efl: /babiloo-efl/usr/share/babiloo/core/test=
/test_dictionary.py is owned by uid 3004, which is the same as the user run=
ning bitbake. This may be due to host contamination [host-user-contaminated]
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
firefox-addon-webconverger-20120228: firefox-addon-webconverger: /firefox-a=
ddon-webconverger/usr/lib/firefox/extensions/{ee11fa88-036b-4661-bb04-d436f=
86bc06a}/content/wc.js is owned by uid 3004, which is the same as the user =
running bitbake. This may be due to host contamination [host-user-contamina=
ted]
libvpx-1.4.0: libvpx: /libvpx-dev/usr/lib/pkgconfig/vpx.pc is owned by uid =
3004, which is the same as the user running bitbake. This may be due to hos=
t contamination [host-user-contaminated]
libvpx-1.4.0: libvpx: /libvpx/usr/bin/vpxdec is owned by uid 3004, which is=
 the same as the user running bitbake. This may be due to host contaminatio=
n [host-user-contaminated]
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
 the user running bitbake. This may be due to host contamination [hos-1.0/i=
mages/logo1.png is owned by uid 3004, which is the same as the user running=
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
qwt-6.0.1: qwt: /qwt-examples/usr/bin/dials is owned by uid 3004, which is =
the same as the user running bitbake. This may be due to host contamination=
 [host-user-contaminated]
qwt-6.0.1: qwt: /qwt-examples/usr/bin/realtime is owned by uid 3004, which =
is the same as the user running bitbake. This may be due to host contaminat=
ion [host-user-contaminated]
qwt-6.0.1: qwt: /qwt-examples/usr/bin/refreshtest is owned by uid 3004, whi=
ch is the same as the user running bitbake. This may be due to host contami=
nation [host-user-contaminated]
thone-0.7: thone: /thone/usr/bin/thone-toggle is owned by uid 3004, which i=
s the same as the user running bitbake. This may be due to host contaminati=
on [host-user-contaminated]
tipcutils-2.0.6: tipcutils: /tipcutils/etc/init.d/tipcutils is owned by uid=
 3004, which is the same as the user running bitbake. This may be due to ho=
st contamination [host-user-contaminated]


count: 2	issue: installed-vs-shipped
networkmanager: 2 installed and not shipped files. [installed-vs-shipped]
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

--3Gf/FFewwPeBMqCJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYP2TUACgkQN1Ujt2V2gBwu0wCgsB5meZsefYFbYJ+t0sZNK3BF
WrIAnj8mv0uxcPzELzaf9XcfTGtJvHTw
=6zvY
-----END PGP SIGNATURE-----

--3Gf/FFewwPeBMqCJ--
