Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id BD33076710;
	Fri, 18 Sep 2015 11:54:37 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so61193657wic.0;
	Fri, 18 Sep 2015 04:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=uruGrOnZ9yerbgcPZcHO4uqY4A2bymLswXEOhgcOEk4=;
	b=ieAmR6AfKPvdRXgvue2xxXmQUiEhuOfscuvIMwxB/Q+hbD7pFOI8w4wP2bO1rX/IvQ
	JwdSWR8/f8SI+3OH/Tp0JwltUduClD62NDsLUPCRgxfy5abMWCss6QcKjQjqPwdWc364
	LKL5tG9afthsPzH5CJzGiuabBnp5XGaomxIqN72V3vOVb+NjXdWXUgTYuAMbjzfIxmus
	uCGGhwHepv3Nj+v07vk6LHwvsnSo3CYPLI0IlZ5s3m1EBVii38VF2diP9edNvXAwB275
	6M+kY56ejatVRITveN8J3xBntFkyES66hY+BFXjcty6ps0Uaa4kiF6EniCpScm8IQ99b
	xzBQ==
X-Received: by 10.194.108.232 with SMTP id hn8mr6773846wjb.154.1442577277163; 
	Fri, 18 Sep 2015 04:54:37 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	wj4sm8511773wjb.10.2015.09.18.04.54.36
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Sep 2015 04:54:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 18 Sep 2015 13:54:58 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20150918115458.GA11095@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: State of bitbake world, Failed tasks 2015-09-13
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
X-List-Received-Date: Fri, 18 Sep 2015 11:54:39 -0000
X-Groupsio-MsgNum: 71290
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Content-Disposition: inline

--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2015 at 03:56:04PM +0200, Martin Jansa wrote:
> Time for even more PNBLACKLISTs..

And it got even worse.

This run was built without sstate, so QA issues should be more complete.
I need to update the report script to show new types of QA issues (and some
old ones which weren't parsed before, because they were all fixed).

While checking qa logs I've noticed that some issues report whole path (so =
the
same issue is reported multiple times, once for each architecture because of
different WORKDIR - anyone against using path relative to WORKDIR?) and some
check show the name of sanity check on line without any useful information =
like
pkgname and installed-not-shipped tests, I'll try to send some fixes or at =
least
keep them included in my world builds to get more useful logs.

OE @ ~/openembedded-core $ git log --oneline origin/master..jansa/master
c3cc2a3 fontcache: allow to pass extra parameters and environment to
fc-cache
a9ab2c3 Fix recursive mode -st on BUILDDIR setup
3963029 guile, mailx, gcc, opensp, gstreamer1.0-libav, libunwind:
disable thumb where it fails for qemuarm
70981e4 icu: force arm mode
c0441fd gdb: force arm mode
07a20f5 DO-NOT-MERGE: distutils3.bbclass: Don't use MACHINE variable
a4e29ea libsdl: Add support for libsdl-native
0f9eca4 WIP: Add KERNEL_EXTRA_ARGS?
504d2cb sstate-sysroot-cruft: Add /usr/src/kernel/.* to whitelist
506990d report-error: Allow to upload reports automatically
199ec66 qemux86: Add identical qemux86copy variant for tests

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2015-09-13 =3D=3D

INFO: jenkins-job.sh-1.3.1 Complete log available at http://logs.nslu2-linu=
x.org/buildlogs/oe/world/log.report.20150915_163214.log

=3D=3D=3D common (23) =3D=3D=3D
    * /meta-openembedded/meta-efl/recipes-efl/efl/azy_svn.bb, do_compile
    * /meta-openembedded/meta-efl/recipes-efl/efl/epdf_svn.bb, do_compile
    * /meta-openembedded/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.=
bb, do_fetch
    * /meta-openembedded/meta-gnome/recipes-gnome/gnome-power-manager/gnome=
-power-manager_2.32.0.bb, do_compile
    * /meta-openembedded/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.=
bb, do_configure
    * /meta-openembedded/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6=
=2Ebb, do_compile
    * /meta-openembedded/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_=
git.bb, do_compile
    * /meta-openembedded/meta-multimedia/recipes-multimedia/musicpd/mpd_0.1=
9.1.bb, do_compile
    * /meta-openembedded/meta-multimedia/recipes-multimedia/vlc/vlc_2.2.1.b=
b, do_compile
    * /meta-openembedded/meta-networking/recipes-connectivity/inetutils/ine=
tutils_1.9.4.bb, do_patch
    * /meta-openembedded/meta-networking/recipes-daemons/lldpad/lldpad_0.9.=
46.bb, do_compile
    * /meta-openembedded/meta-networking/recipes-support/sshguard/sshguard_=
git.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.=
bb, do_compile
    * /meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libi=
mobiledevice_1.1.4.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-devtools/packagekit/packagekit_0.5=
=2E6.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb, d=
o_compile
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
    * /meta-webos-ports/meta-luneui/recipes-webos/luna-service2/luna-servic=
e2.bb, do_compile

=3D=3D=3D common-x86 (2) =3D=3D=3D
    * /meta-browser/recipes-browser/chromium/chromium_40.0.2214.91.bb, do_c=
ompile
    * /meta-openembedded/meta-efl/recipes-efl/webkit/webkit-efl_1.11.0.bb, =
do_compile

=3D=3D=3D qemuarm (5) =3D=3D=3D
    * /meta-openembedded/meta-oe/recipes-extended/efivar/efivar_git.bb, do_=
compile
    * /meta-openembedded/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb, do_c=
ompile
    * /meta-openembedded/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb,=
 do_compile
    * /openembedded-core/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.3.bb, do_comp=
ile
    * /openembedded-core/meta/recipes-support/libunwind/libunwind_1.1.bb, d=
o_compile

=3D=3D=3D qemux86 (9) =3D=3D=3D
    * /meta-browser/recipes-browser/chromium/cef3_280796.bb, do_compile
    * /meta-openembedded/meta-networking/recipes-extended/iscsitarget/iscsi=
target_1.4.20.3+svn502.bb, do_make_scripts
    * /meta-openembedded/meta-networking/recipes-kernel/netmap/netmap-modul=
es_git.bb, do_configure
    * /meta-openembedded/meta-networking/recipes-kernel/netmap/netmap-modul=
es_git.bb, do_make_scripts
    * /meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-ge=
ode_2.11.16.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-multimedia/minidlna/minidlna_1.1.4=
=2Ebb, do_fetch
    * /meta-openembedded/meta-oe/recipes-support/vboxguestdrivers/vboxguest=
drivers_4.3.30.bb, do_make_scripts
    * /openembedded-core/meta/recipes-kernel/cryptodev/cryptodev-module_1.7=
=2Ebb, do_make_scripts
    * /openembedded-core/meta/recipes-kernel/lttng/lttng-modules_git.bb, do=
_make_scripts

=3D=3D=3D qemux86_64 (2) =3D=3D=3D
    * /meta-browser/recipes-browser/chromium/cef3_280796.bb, do_configure
    * /meta-openembedded/meta-oe/recipes-extended/collectd/collectd_5.5.0.b=
b, do_compile

=3D=3D=3D Number of failed tasks (91) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 28	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.w=
orld.20150908_172806.log// || http://errors.yoctoproject.org:80/Errors/Buil=
d/8620/
|-
|| qemux86 	|| 35	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.w=
orld.20150909_180305.log// || http://errors.yoctoproject.org:80/Errors/Buil=
d/8635/
|-
|| qemux86_64 	|| 28	 || http://logs.nslu2-linux.org/buildlogs/oe/world//lo=
g.world.20150913_202843.log// || http://errors.yoctoproject.org:80/Errors/B=
uild/8694/
|}

=3D=3D=3D PNBLACKLISTs (66) =3D=3D=3D

=3D=3D=3D QA issues (178) =3D=3D=3D
{| class=3Dwikitable
!| Count                ||Issue
|-
||0     ||libdir
|-
||1     ||installed-vs-shipped
|-
||1     ||pkgname
|-
||1     ||symlink-to-sysroot
|-
||1     ||unknown-configure-option
|-
||20    ||textrel
|-
||21    ||build-deps
|-
||3     ||already-stripped
|-
||3     ||invalid-pkgconfig
|-
||31    ||file-rdeps
|-
||6     ||version-going-backwards
|-
||92    ||host-user-contaminated
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
count: 3	issue: already-stripped
qwt-6.0.1: File '/usr/lib/libqwt.so.6.0.1' from qwt was already stripped, t=
his will prevent future debugging! [already-stripped]
qwt-6.0.1: File '/usr/lib/libqwtmathml.so.6.0.1' from qwt was already strip=
ped, this will prevent future debugging! [already-stripped]
qwt-6.0.1: File '/usr/lib/qt4/plugins/designer/libqwt_designer_plugin.so' f=
rom qwt was already stripped, this will prevent future debugging! [already-=
stripped]


count: 0	issue: libdir


count: 20	issue: textrel
corosync-2.3.5: ELF binary '/tmp/work/core2-64-oe-linux/corosync/2.3.5-r0/p=
ackages-split/corosync/usr/sbin/corosync' has relocations in .text [textrel]
directfb-1.7.7: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/directfb/1.7=
=2E7-r0/packages-split/directfb/usr/bin/mkdfiff' has relocations in .text [=
textrel]
efl-1.15.1: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/efl/2_1.15.1-r0/p=
ackages-split/evas/usr/lib/evas/cserve2/bin/v-1.15/evas_cserve2_slave' has =
relocations in .text [textrel]
gimp-2.8.14: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/gimp/2.8.14-r0/=
packages-split/gimp/usr/lib/gimp/2.0/plug-ins/file-ico' has relocations in =
=2Etext [textrel]
gstreamer1.0-libav-1.4.5: ELF8-r0/packages-split/libavcodec/usr/lib/libavco=
dec.so.54.35.0' has relocations in .text [textrel]
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
webkit-gtk-1.8.3: ELF binary '/tmp/work/i586-oe-linux/webkit-gtk/1.8.3-r1/p=
ackages-split/libjavascriptcore/usr/lib/libjavascriptcoregtk-1.0.so.0.13.4'=
 has relocations in .text [textrel]


count: 21	issue: build-deps
cifs-utils-6.4: cifs-utils rdepends on samba, but it isn't a build dependen=
cy? [build-deps]
dovecot-2.2.18: dovecot rdepends on lz4, but it isn't a build dependency? [=
build-deps]
dovecot-2.2.18: dovecot-dev rdepends on lz4, but it isn't a build dependenc=
y? [build-deps]
imsettings-1.6.8: imsettings rdepends on xfconf, but it isn't a build depen=
dency? [build-deps]
libwebp-0.4.3: libwebp-bin rdepends on libgl-mesa, but it isn't a build dep=
endency? [build-deps]
libwebp-0.4.3: libwebp-bin rdepends on mesa-glut, but it isn't a build depe=
ndency? [build-deps]
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
qtwebengine-5.5.0+gitAUTOINC+qtwebengine: qtwebengine rdepends on qtlocatio=
n, but it isn't a build dependency? [build-deps]
samba-4.1.12: samba rdepends on libavahi-client, but it isn't a build depen=
dency? [build-deps]
samba-4.1.12: samba rdepends on libavahi-common, but it isn't a build depen=
dency? [build-deps]
sox-14.4.0: sox rdepends on libflac, but it isn't a build dependency? [buil=
d-deps]
uim-1.8.6: uim rdepends on gtk+3, but it isn't a build dependency? [build-d=
eps]
webmin-1.750: webmin rdepends on perl-module-sdbm, but it isn't a build dep=
endency? [build-deps]
xfce4-pulseaudio-plugin-0.2.3: xfce4-pulseaudio-plugin rdepends on libnotif=
y, but it isn't a build dependency? [build-deps]


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
dvb-apps-1.1.1: /usr/bin/dvbnet_dvbnet contained in package dvbnet requires=
 libdvbapi.so()(64bit), but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbnet_dvbnet contained in package dvbnet requires=
 libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbscan_dvb-scan contained in package dvb-scan req=
uires libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbscan_dvb-scan contained in package dvb-scan req=
uires libdvbsec.so()(64bit), but no providers found in its RDEPENDS [file-r=
deps]
dvb-apps-1.1.1: /usr/bin/dvbtraffic_dvbtraffic contained in package dvbtraf=
fic requires libdvbapi.so()(64bit), but no providers found in its RDEPENDS =
[file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbtraffic_dvbtraffic contained in package dvbtraf=
fic requires libdvbapi.so, but no providers found in its RDEPENDS [file-rde=
ps]
dvb-apps-1.1.1: /usr/bin/femon_dvb-femon contained in package dvb-femon req=
uires libdvbapi.so()(64bit), but no providers found in its RDEPENDS [file-r=
deps]
dvb-apps-1.1.1: /usr/bin/femon_dvb-femon contained in package dvb-femon req=
uires libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
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
so_libnewt-python contained in package libnewt-python reqpackage rrdtool-pe=
rl requires /usr/bin/python, but no providers found in its RDEPENDS [file-r=
deps]
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

count: 92       issue: host-user-contaminated
apache2-2.4.16: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-l=
inux-gnueabi/apache2/2.4.16-r0/packages-split/apache2-dev/usr/share/apache2=
/icons/small/uu.png is owned by uid 3004, which is the same as the user run=
ning bitbake. This may be due to host contamination [host-user-contaminated]
apache2-2.4.16: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-l=
inux-gnueabi/apache2/2.4.16-r0/packages-split/apache2-scripts/usr/bin/dbmma=
nage is owned by uid 3004, which is the same as the user running bitbake. T=
his may be due to host contamination [host-user-contaminated]
apache2-2.4.16: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-l=
inux-gnueabi/apache2/2.4.16-r0/packages-split/apache2/usr/share/apache2/cgi=
-bin/printenv is owned by uid 3004, which is the same as the user running b=
itbake. This may be due to host contamination [host-user-contaminated]
apache2-2.4.16: /home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-=
linux/apache2/2.4.16-r0/packages-split/apache2-dev/usr/share/apache2/icons/=
small/uu.png is owned by uid 3004, which is the same as the user running bi=
tbake. This may be due to host contamination [host-user-contaminated]
apache2-2.4.16: /home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-=
linux/apache2/2.4.16-r0/packages-split/apache2-scripts/usr/bin/dbmmanage is=
 owned by uid 3004, which is the same as the user running bitbake. This may=
 be due to host contamination [host-user-contaminated]
apache2-2.4.16: /home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-=
linux/apache2/2.4.16-r0/packages-split/apache2/usr/share/apache2/cgi-bin/pr=
intenv is owned by uid 3004, which is the same as the user running bitbake.=
 This may be due to host contamination [host-user-contaminated]
apache2-2.4.16: /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linu=
x/apache2/2.4.16-r0/packages-split/apache2-dev/usr/share/apache2/icons/smal=
l/uu.png is owned by uid 3004, which is the same as the user running bitbak=
e. This may be due to host contamination [host-user-contaminated]
apache2-2.4.16: /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linu=
x/apache2/2.4.16-r0/packages-split/apache2-scripts/usr/bin/dbmmanage is own=
ed by uid 3004, which is the same as the user running bitbake. This may be =
due to host contamination [host-user-contaminated]
apache2-2.4.16: /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linu=
x/apache2/2.4.16-r0/packages-split/apache2/usr/share/apache2/cgi-bin/printe=
nv is owned by uid 3004, which is the same as the user running bitbake. Thi=
s may be due to host contamination [host-user-contaminated]
babiloo-efl-2.0.9-10: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5t=
e-oe-linux-gnueabi/babiloo-efl/2.0.9-10-r5/packages-split/babiloo-efl/usr/s=
hare/babiloo/core/test/test_dictionary.py is owned by uid 3004, which is th=
e same as the user running bitbake. This may be due to host contamination [=
host-user-contaminated]
babiloo-efl-2.0.9-10: /home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-=
64-oe-linux/babiloo-efl/2.0.9-10-r5/packages-split/babiloo-efl/usr/share/ba=
biloo/core/test/test_dictionary.py is owned by uid 3004, which is the same =
as the user running bitbake. This may be due to host contamination [host-us=
er-contaminated]
babiloo-efl-2.0.9-10: /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-o=
e-linux/babiloo-efl/2.0.9-10-r5/packages-split/babiloo-efl/usr/share/babilo=
o/core/test/test_dictionary.py is owned by uid 3004, which is the same as t=
he user running bitbake. This may be due to host contamination [host-user-c=
ontaminated]
cim-schema-exper-2.39.0: /home/jenkins/oe/world/shr-core/tmp-glibc/work/arm=
v5te-oe-linux-gnueabi/cim-schema-exper/2.39.0-r0/packages-split/cim-schema-=
exper/usr/share/mof/cimv2.39.0/Application/CIM_AGPSoftwareFeature.mof is ow=
ned by uid 3004, which is the same as the user running bitbake. This may be=
 due to host contamination [host-user-contaminated]
cim-schema-exper-2.39.0: /home/jenkins/oe/world/shr-core/tmp-glibc/work/cor=
e2-64-oe-linux/cim-schema-exper/2.39.0-r0/packages-split/cim-schema-exper/u=
sr/share/mof/cimv2.39.0/Application/CIM_AGPSoftwareFeature.mof is owned by =
uid 3004, which is the same as the user running bitbake. This may be due to=
 host contamination [host-user-contaminated]
cim-schema-exper-2.39.0: /home/jenkins/oe/world/shr-core/tmp-glibc/work/i58=
6-oe-linux/cim-schema-exper/2.39.0-r0/packages-split/cim-schema-exper/usr/s=
hare/mof/cimv2.39.0/Application/CIM_AGPSoftwareFeature.mof is owned by uid =
3004, which is the same as the user running bitbake. This may be due to hos=
t contamination [host-user-contaminated]
cim-schema-final-2.40.0: /home/jenkins/oe/world/shr-core/tmp-glibc/work/arm=
v5te-oe-linux-gnueabi/cim-schema-final/2.40.0-r0/packages-split/cim-schema-=
final/usr/share/mof/cimv2.40.0/Application/CIM_AGPSoftwareFeature.mof is ow=
ned by uid 3004, which is the same as the user running bitbake. This may be=
 due to host contamination [host-user-contaminated]
cim-schema-final-2.40.0: /home/jenkins/oe/world/shr-core/tmp-glibc/work/cor=
e2-64-oe-linux/cim-schema-final/2.40.0-r0/packages-split/cim-schema-final/u=
sr/share/mof/cimv2.40.0/Application/CIM_AGPSoftwareFeature.mof is owned by =
uid 3004, which is the same as the user running bitbake. This may be due to=
 host contamination [host-user-contaminated]
cim-schema-final-2.40.0: /home/jenkins/oe/world/shr-core/tmp-glibc/work/i58=
6-oe-linux/cim-schema-final/2.40.0-r0/packages-split/cim-schema-final/usr/s=
hare/mof/cimv2.40.0/Application/CIM_AGPSoftwareFeature.mof is owned by uid =
3004, which is the same as the user running bitbake. This may be due to hos=
t contamination [host-user-contaminated]
cinematicexperience-1.0: /home/jenkins/oe/world/shr-core/tmp-glibc/work/arm=
v5te-oe-linux-gnueabi/cinematicexperience/1.0-r0/packages-split/cinematicex=
perience/usr/share/cinematicexperience-1.0/content/images/qt_logo.png is ow=
ned by uid 3004, which is the same as the user running bitbake. This may be=
 due to host contamination [host-user-contaminated]
cinematicexperience-1.0: /home/jenkins/oe/world/shr-core/tmp-glibc/work/cor=
e2-64-oe-linux/cinematicexperience/1.0-r0/packages-split/cinematicexperienc=
e/usr/share/cinematicexperience-1.0/content/images/qt_logo.png is owned by =
uid 3004, which is the same as the user running bitbake. This may be due to=
 host contamination [host-user-contaminated]
cinematicexperience-1.0: /home/jenkins/oe/world/shr-core/tmp-glibc/work/i58=
6-oe-linux/cinematicexperience/1.0-r0/packages-split/cinematicexperience/us=
r/share/cinematicexperience-1.0/content/images/qt_logo.png is owned by uid =
3004, which is the same as the user running bitbake. This may be due to hos=
t contamination [host-user-contaminated]
dracut-043+giteab03540cd695d940062af5b55c02e8829aaa526: /home/jenkins/oe/wo=
rld/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/dracut/1_043+giteab035=
40cd695d940062af5b55c02e8829aaa526-r0/packages-split/dracut/usr/lib/dracut/=
modules.d/99uefi-lib/uefi-lib.sh is owned by uid 3004, which is the same as=
 the user running bitbake. This may be due to host contamination [host-user=
-contaminated]
dracut-043+giteab03540cd695d940062af5b55c02e8829aaa526: /home/jenkins/oe/wo=
rld/shr-core/tmp-glibc/work/core2-64-oe-linux/dracut/1_043+giteab03540cd695=
d940062af5b55c02e8829aaa526-r0/packages-split/dracut/usr/lib/dracut/modules=
=2Ed/99uefi-lib/uefi-lib.sh is owned by uid 3004, which is the same as the =
user running bitbake. This may be due to host contamination [host-user-cont=
aminated]
dracut-043+giteab03540cd695d940062af5b55c02e8829aaa526: /home/jenkins/oe/wo=
rld/shr-core/tmp-glibc/work/i586-oe-linux/dracut/1_043+giteab03540cd695d940=
062af5b55c02e8829aaa526-r0/packages-split/dracut/usr/lib/dracut/modules.d/9=
9uefi-lib/uefi-lib.sh is owned by uid 3004, which is the same as the user r=
unning bitbake. This may be due to host contamination [host-user-contaminat=
ed]
espeak-1.37: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linu=
x-gnueabi/espeak/1.37-r0/packages-split/espeak/usr/share/espeak-data/mbrola=
_ph/es4_phtrans is owned by uid 3004, which is the same as the user running=
 bitbake. This may be due to host contamination [host-user-contaminated]
espeak-1.37: /home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-lin=
ux/espeak/1.37-r0/packages-split/espeak/usr/share/espeak-data/mbrola_ph/es4=
_phtrans is owned by uid 3004, which is the same as the user running bitbak=
e. This may be due to host contamination [host-user-contaminated]
espeak-1.37: /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/e=
speak/1.37-r0/packages-split/espeak/usr/share/espeak-data/mbrola_ph/es4_pht=
rans is owned by uid 3004, which is the same as the user running bitbake. T=
his may be due to host contamination [host-user-contaminated]
firefox-10.0.12esr: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-o=
e-linux-gnueabi/firefox/10.0.12esr-r0/packages-split/firefox-dev/usr/share/=
idl/firefox-10.0/nsIBrowserHandler.idl is owned by uid 3004, which is the s=
ame as the user running bitbake. This may be due to host contamination [hos=
t-user-contaminated]
firefox-10.0.12esr: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-o=
e-linux-gnueabi/firefox/10.0.12esr-r0/packages-split/firefox-staticdev/usr/=
lib/firefox-devel-10.0/sdk/lib/libnssutil.a is owned by uid 3004, which is =
the same as the user running bitbake. This may be due to host contamination=
 [host-user-contaminated]
firefox-10.0.12esr: /home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64=
-oe-linux/firefox/10.0.12esr-r0/packages-split/firefox-dev/usr/share/idl/fi=
refox-10.0/nsIBrowserHandler.idl is owned by uid 3004, which is the same as=
 the user running bitbake. This may be due to host contamination [host-user=
-contaminated]
firefox-10.0.12esr: /home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64=
-oe-linux/firefox/10.0.12esr-r0/packages-split/firefox-staticdev/usr/lib/fi=
refox-devel-10.0/sdk/lib/libnssutil.a is owned by uid 3004, which is the sa=
me as the user running bitbake. This may be due to host contamination [host=
-user-contaminated]
firefox-10.0.12esr: /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-=
linux/firefox/10.0.12esr-r0/packages-split/firefox-dev/usr/share/idl/firefo=
x-10.0/nsIBrowserHandler.idl is owned by uid 3004, which is the same as the=
 user running bitbake. This may be due to host contamination [host-user-con=
taminated]
firefox-10.0.12esr: /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-=
linux/firefox/10.0.12esr-r0/packages-split/firefox-staticdev/usr/lib/firefo=
x-devel-10.0/sdk/lib/libnssutil.a is owned by uid 3004, which is the same a=
s the user running bitbake. This may be due to host contamination [host-use=
r-contaminated]
firefox-addon-webconverger-20120228: /home/jenkins/oe/world/shr-core/tmp-gl=
ibc/work/all-oe-linux/firefox-addon-webconverger/20120228-r5/packages-split=
/firefox-addon-webconverger/usr/lib/firefox/extensions/{ee11fa88-036b-4661-=
bb04-d436f86bc06a}/content/wc.js is owned by uid 3004, which is the same as=
 the user running bitbake. This may be due to host contamination [host-user=
-contaminated]
libvpx-1.4.0: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linu=
x-gnueabi/libvpx/1.4.0-r0/packages-split/libvpx-dev/usr/lib/pkgconfig/vpx.p=
c is owned by uid 3004, which is the same as the user running bitbake. This=
 may be due to host contamination [host-user-contaminated]
libvpx-1.4.0: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linu=
x-gnueabi/libvpx/1.4.0-r0/packages-split/libvpx/usr/bin/vpxenc is owned by =
uid 3004, which is the same as the user running bitbake. This may be due to=
 host contamination [host-user-contaminated]
libvpx-1.4.0: /home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-li=
nux/libvpx/1.4.0-r0/packages-split/libvpx-dev/usr/lib/pkgconfig/vpx.pc is o=
wned by uid 3004, which is the same as the user running bitbake. This may b=
e due to host contamination [host-user-contaminated]
libvpx-1.4.0: /home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-li=
nux/libvpx/1.4.0-r0/packages-split/libvpx/usr/bin/vpxenc is owned by uid 30=
04, which is the same as the user running bitbake. This may be due to host =
contamination [host-user-contaminated]
libvpx-1.4.0: /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/=
libvpx/1.4.0-r0/packages-split/libvpx-dev/usr/lib/pkgconfig/vpx.pc is owned=
 by uid 3004, which is the same as the user running bitbake. This may be du=
e to host contamination [host-user-contaminated]
libvpx-1.4.0: /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/=
libvpx/1.4.0-r0/packages-split/libvpx/usr/bin/vpxenc is owned by uid 3004, =
which is the same as the user running bitbake. This may be due to host cont=
amination [host-user-contaminated]
logwatch-7.4.1: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-l=
inux-gnueabi/logwatch/7.4.1-r0/packages-split/logwatch/usr/share/logwatch/d=
efault.conf/logfiles/mysql-mmm.conf is owned by uid 3004, which is the same=
 as the user running bitbake. This may be due to host contamination [host-u=
ser-contaminated]
logwatch-7.4.1: /home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-=
linux/logwatch/7.4.1-r0/packages-split/logwatch/usr/share/logwatch/default.=
conf/logfiles/mysql-mmm.conf is owned by uid 3004, which is the same as the=
 user running bitbake. This may be due to host contamination [host-user-con=
taminated]
logwatch-7.4.1: /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linu=
x/logwatch/7.4.1-r0/packages-split/logwatch/usr/share/logwatch/default.conf=
/logfiles/mysql-mmm.conf is owned by uid 3004, which is the same as the use=
r running bitbake. This may be due to host contamination [host-user-contami=
nated]
mkelfimage-4.0+gitAUTOINC+686a48a339: /home/jenkins/oe/world/shr-core/tmp-g=
libc/work/armv5te-oe-linux-gnueabi/mkelfimage/4.0+gitAUTOINC+686a48a339-r0/=
packages-split/mkelfimage/usr/sbin/mkelfImage is owned by uid 3004, which i=
s the same as the user running bitbake. This may be due to host contaminati=
on [host-user-contaminated]
mkelfimage-4.0+gitAUTOINC+686a48a339: /home/jenkins/oe/world/shr-core/tmp-g=
libc/work/core2-64-oe-linux/mkelfimage/4.0+gitAUTOINC+686a48a339-r0/package=
s-split/mkelfimage/usr/sbin/mkelfImage is owned by uid 3004, which is the s=
ame as the user running bitbake. This may be due to host contamination [hos=
t-user-contaminated]
mkelfimage-4.0+gitAUTOINC+686a48a339: /home/jenkins/oe/world/shr-core/tmp-g=
libc/work/i586-oe-linux/mkelfimage/4.0+gitAUTOINC+686a48a339-r0/packages-sp=
lit/mkelfimage/usr/sbin/mkelfImage is owned by uid 3004, which is the same =
as the user running bitbake. This may be due to host contamination [host-us=
er-contaminated]
monav-0.3: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/monav/0.3-r1/packages-split/monav/usr/share/monav/images/directions/=
left.svg is owned by uid 3004, which is the same as the user running bitbak=
e. This may be due to host contamination [host-user-contaminated]
monav-0.3: /home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux=
/monav/0.3-r1/packages-split/monav/usr/share/monav/images/directions/left.s=
vg is owned by uid 3004, which is the same as the user running bitbake. Thi=
s may be due to host contamination [host-user-contaminated]
monav-0.3: /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/mon=
av/0.3-r1/packages-split/monav/usr/share/monav/images/directions/left.svg i=
s owned by uid 3004, which is the same as the user running bitbake. This ma=
y be due to host contamination [host-user-contaminated]
numptyphysics-0.2+svnr109: /home/jenkins/oe/world/shr-core/tmp-glibc/work/a=
rmv5te-oe-linux-gnueabi/numptyphysics/0.2+svnr109-r6/packages-split/numptyp=
hysics/usr/share/numptyphysics/org_level/L50_nautilus.nph is owned by uid 3=
004, which is the same as the user running bitbake. This may be due to host=
 contamination [host-user-contaminated]
numptyphysics-0.2+svnr109: /home/jenkins/oe/world/shr-core/tmp-glibc/work/c=
ore2-64-oe-linux/numptyphysics/0.2+svnr109-r6/packages-split/numptyphysics/=
usr/share/numptyphysics/org_level/L50_nautilus.nph is owned by uid 3004, wh=
ich is the same as the user running bitbake. This may be due to host contam=
ination [host-user-contaminated]
numptyphysics-0.2+svnr109: /home/jenkins/oe/world/shr-core/tmp-glibc/work/i=
586-oe-linux/numptyphysics/0.2+svnr109-r6/packages-split/numptyphysics/usr/=
share/numptyphysics/org_level/L50_nautilus.nph is owned by uid 3004, which =
is the same as the user running bitbake. This may be due to host contaminat=
ion [host-user-contaminated]
orrery-2.7: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux=
-gnueabi/orrery/2.7-r0/packages-split/orrery/usr/share/orrery/constellation=
s/Andromeda is owned by uid 3004, which is the same as the user running bit=
bake. This may be due to host contamination [host-user-contaminated]
orrery-2.7: /home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linu=
x/orrery/2.7-r0/packages-split/orrery/usr/share/orrery/constellations/Andro=
meda is owned by uid 3004, which is the same as the user running bitbake. T=
his may be due to host contamination [host-user-contaminated]
orrery-2.7: /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/or=
rery/2.7-r0/packages-split/orrery/usr/share/orrery/constellations/Andromeda=
 is owned by uid 3004, which is the same as the user running bitbake. This =
may be due to host contamination [host-user-contaminated]
phpmyadmin-4.4.9: /home/jenkins/oe/world/shr-core/tmp-glibc/work/all-oe-lin=
ux/phpmyadmin/4.4.9-r0/packages-split/phpmyadmin/usr/share/phpmyadmin/doc/_=
ext/configext.py is owned by uid 3004, which is the same as the user runnin=
g bitbake. This may be due to host contamination [host-user-contaminated]
qt5everywheredemo-1.0: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5=
te-oe-linux-gnueabi/qt5everywheredemo/1.0-r0/packages-split/qt5everywherede=
mo/usr/share/qt5everywheredemo-1.0/qml/QtDemo/images/tv.png is owned by uid=
 3004, which is the same as the user running bitbake. This may be due to ho=
st contamination [host-user-contaminated]
qt5everywheredemo-1.0: /home/jenkins/oe/world/shr-core/tmp-glibc/work/core2=
-64-oe-linux/qt5everywheredemo/1.0-r0/packages-split/qt5everywheredemo/usr/=
share/qt5everywheredemo-1.0/qml/QtDemo/images/tv.png is owned by uid 3004, =
which is the same as the user running bitbake. This may be due to host cont=
amination [host-user-contaminated]
qt5everywheredemo-1.0: /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-=
oe-linux/qt5everywheredemo/1.0-r0/packages-split/qt5everywheredemo/usr/shar=
e/qt5everywheredemo-1.0/qml/QtDemo/images/tv.png is owned by uid 3004, whic=
h is the same as the user running bitbake. This may be due to host contamin=
ation [host-user-contaminated]
qt5ledscreen-1.0: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe=
-linux-gnueabi/qt5ledscreen/1.0-r0/packages-split/qt5ledscreen/usr/share/qt=
5ledscreen-1.0/images/logo1.png is owned by uid 3004, which is the same as =
the user running bitbake. This may be due to host contamination [host-user-=
contaminated]
qt5ledscreen-1.0: /home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-o=
e-linux/qt5ledscreen/1.0-r0/packages-split/qt5ledscreen/usr/share/qt5ledscr=
een-1.0/images/logo1.png is owned by uid 3004, which is the same as the use=
r running bitbake. This may be due to host contamination [host-user-contami=
nated]
qt5ledscreen-1.0: /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-li=
nux/qt5ledscreen/1.0-r0/packages-split/qt5ledscreen/usr/share/qt5ledscreen-=
1.0/images/logo1.png is owned by uid 3004, which is the same as the user ru=
nning bitbake. This may be due to host contamination [host-user-contaminate=
d]
qt5nmapcarousedemo-1.0: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv=
5te-oe-linux-gnueabi/qt5nmapcarousedemo/1.0-r0/packages-split/qt5nmapcarous=
edemo/usr/share/qt5nmapcarousedemo-1.0/content/images/arrow-right.png is ow=
ned by uid 3004, which is the same as the user running bitbake. This may be=
 due to host contamination [host-user-contaminated]
qt5nmapcarousedemo-1.0: /home/jenkins/oe/world/shr-core/tmp-glibc/work/core=
2-64-oe-linux/qt5nmapcarousedemo/1.0-r0/packages-split/qt5nmapcarousedemo/u=
sr/share/qt5nmapcarousedemo-1.0/content/images/arrow-right.png is owned by =
uid 3004, which is the same as the user running bitbake. This may be due to=
 host contamination [host-user-contaminated]
qt5nmapcarousedemo-1.0: /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586=
-oe-linux/qt5nmapcarousedemo/1.0-r0/packages-split/qt5nmapcarousedemo/usr/s=
hare/qt5nmapcarousedemo-1.0/content/images/arrow-right.png is owned by uid =
3004, which is the same as the user running bitbake. This may be due to hos=
t contamination [host-user-contaminated]
qt5nmapper-1.0: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-l=
inux-gnueabi/qt5nmapper/1.0-r0/packages-split/qt5nmapper/usr/share/qt5nmapp=
er-1.0/content/images/switch_thumb.png is owned by uid 3004, which is the s=
ame as the user running bitbake. This may be due to host contamination [hos=
t-user-contaminated]
qt5nmapper-1.0: /home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-=
linux/qt5nmapper/1.0-r0/packages-split/qt5nmapper/usr/share/qt5nmapper-1.0/=
content/images/switch_thumb.png is owned by uid 3004, which is the same as =
the user running bitbake. This may be due to host contamination [host-user-=
contaminated]
qt5nmapper-1.0: /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linu=
x/qt5nmapper/1.0-r0/packages-split/qt5nmapper/usr/share/qt5nmapper-1.0/cont=
ent/images/switch_thumb.png is owned by uid 3004, which is the same as the =
user running bitbake. This may be due to host contamination [host-user-cont=
aminated]
qtbase-5.5.0+gitAUTOINC+2fde9f59ee: /home/jenkins/oe/world/shr-core/tmp-gli=
bc/work/armv5te-oe-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/pack=
ages-split/qtbase-dev/usr/lib/libqtharfbuzzng.prl is owned by uid 3004, whi=
ch is the same as the user running bitbake. This may be due to host contami=
nation [host-user-contaminated]
qtbase-5.5.0+gitAUTOINC+2fde9f59ee: /home/jenkins/oe/world/shr-core/tmp-gli=
bc/work/armv5te-oe-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/pack=
ages-split/qtbase-staticdev/usr/lib/libqtharfbuzzng.a is owned by uid 3004,=
 which is the same as the user running bitbake. This may be due to host con=
tamination [host-user-contaminated]
qtbase-5.5.0+gitAUTOINC+2fde9f59ee: /home/jenkins/oe/world/shr-core/tmp-gli=
bc/work/core2-64-oe-linux/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/packages-sp=
lit/qtbase-dev/usr/lib/libqtharfbuzzng.prl is owned by uid 3004, which is t=
he same as the user running bitbake. This may be due to host contamination =
[host-user-contaminated]
qtbase-5.5.0+gitAUTOINC+2fde9f59ee: /home/jenkins/oe/world/shr-core/tmp-gli=
bc/work/core2-64-oe-linux/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/packages-sp=
lit/qtbase-staticdev/usr/lib/libqtharfbuzzng.a is owned by uid 3004, which =
is the same as the user running bitbake. This may be due to host contaminat=
ion [host-user-contaminated]
qtbase-5.5.0+gitAUTOINC+2fde9f59ee: /home/jenkins/oe/world/shr-core/tmp-gli=
bc/work/i586-oe-linux/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/packages-split/=
qtbase-dev/usr/lib/libqtharfbuzzng.prl is owned by uid 3004, which is the s=
ame as the user running bitbake. This may be due to host contamination [hos=
t-user-contaminated]
qtbase-5.5.0+gitAUTOINC+2fde9f59ee: /home/jenkins/oe/world/shr-core/tmp-gli=
bc/work/i586-oe-linux/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/packages-split/=
qtbase-staticdev/usr/lib/libqtharfbuzzng.a is owned by uid 3004, which is t=
he same as the user running bitbake. This may be due to host contamination =
[host-user-contaminated]
qtsmarthome-1.0: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-=
linux-gnueabi/qtsmarthome/1.0-r0/packages-split/qtsmarthome/usr/share/qtsma=
rthome-1.0/qml/smarthome/components/tabwidget/VTabBar.qml is owned by uid 3=
004, which is the same as the user running bitbake. This may be due to host=
 contamination [host-user-contaminated]
qtsmarthome-1.0: /home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe=
-linux/qtsmarthome/1.0-r0/packages-split/qtsmarthome/usr/share/qtsmarthome-=
1.0/qml/smarthome/components/tabwidget/VTabBar.qml is owned by uid 3004, wh=
ich is the same as the user running bitbake. This may be due to host contam=
ination [host-user-contaminated]
qtsmarthome-1.0: /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-lin=
ux/qtsmarthome/1.0-r0/packages-split/qtsmarthome/usr/share/qtsmarthome-1.0/=
qml/smarthome/components/tabwidget/VTabBar.qml is owned by uid 3004, which =
is the same as the user running bitbake. This may be due to host contaminat=
ion [host-user-contaminated]
quitbattery-1.0.0: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-o=
e-linux-gnueabi/quitbattery/1.0.0-r0/packages-split/quitbattery/usr/share/q=
uitbattery-1.0.0/qml/QUItBattery/images/glass.png is owned by uid 3004, whi=
ch is the same as the user running bitbake. This may be due to host contami=
nation [host-user-contaminated]
quitbattery-1.0.0: /home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-=
oe-linux/quitbattery/1.0.0-r0/packages-split/quitbattery/usr/share/quitbatt=
ery-1.0.0/qml/QUItBattery/images/glass.png is owned by uid 3004, which is t=
he same as the user running bitbake. This may be due to host contamination =
[host-user-contaminated]
quitbattery-1.0.0: /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-l=
inux/quitbattery/1.0.0-r0/packages-split/quitbattery/usr/share/quitbattery-=
1.0.0/qml/QUItBattery/images/glass.png is owned by uid 3004, which is the s=
ame as the user running bitbake. This may be due to host contamination [hos=
t-user-contaminated]
quitindicators-1.0.1: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5t=
e-oe-linux-gnueabi/quitindicators/1.0.1-r0/packages-split/quitindicators/us=
r/share/quitindicators-1.0.1/qml/QUItIndicators/images/dots_512.png is owne=
d by uid 3004, which is the same as the user running bitbake. This may be d=
ue to host contamination [host-user-contaminated] =20
quitindicators-1.0.1: /home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-=
64-oe-linux/quitindicators/1.0.1-r0/packages-split/quitindicators/usr/share=
/quitindicators-1.0.1/qml/QUItIndicators/images/dots_512.png is owned by ui=
d 3004, which is the same as the user running bitbake. This may be due to h=
ost contamination [host-user-contaminated]
quitindicators-1.0.1: /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-o=
e-linux/quitindicators/1.0.1-r0/packages-split/quitindicators/usr/share/qui=
tindicators-1.0.1/qml/QUItIndicators/images/dots_512.png is owned by uid 30=
04, which is the same as the user running bitbake. This may be due to host =
contamination [host-user-contaminated]
qwt-6.0.1: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qwt/6.0.1-r1/packages-split/qwt-examples/usr/bin/tvplot is owned by =
uid 3004, which is the same as the user running bitbake. This may be due to=
 host contamination [host-user-contaminated]
qwt-6.0.1: /home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux=
/qwt/6.0.1-r1/packages-split/qwt-examples/usr/bin/navigation is owned by ui=
d 3004, which is the same as the user running bitbake. This may be due to h=
ost contamination [host-user-contaminated]
qwt-6.0.1: /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/qwt=
/6.0.1-r1/packages-split/qwt-examples/usr/bin/plotmatrix is owned by uid 30=
04, which is the same as the user running bitbake. This may be due to host =
contamination [host-user-contaminated]
thone-0.7: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-=
gnueabi/thone/0.7-r3/packages-split/thone/usr/bin/thone-toggle is owned by =
uid 3004, which is the same as the user running bitbake. This may be due to=
 host contamination [host-user-contaminated]
thone-0.7: /home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux=
/thone/0.7-r3/packages-split/thone/usr/bin/thone-toggle is owned by uid 300=
4, which is the same as the user running bitbake. This may be due to host c=
ontamination [host-user-contaminated]
thone-0.7: /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/tho=
ne/0.7-r3/packages-split/thone/usr/bin/thone-toggle is owned by uid 3004, w=
hich is the same as the user running bitbake. This may be due to host conta=
mination [host-user-contaminated]
tipcutils-2.0.6: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-=
linux-gnueabi/tipcutils/2.0.6-r0/packages-split/tipcutils/etc/init.d/tipcut=
ils is owned by uid 3004, which is the same as the user running bitbake. Th=
is may be due to host contamination [host-user-contaminated]
tipcutils-2.0.6: /home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe=
-linux/tipcutils/2.0.6-r0/packages-split/tipcutils/etc/init.d/tipcutils is =
owned by uid 3004, which is the same as the user running bitbake. This may =
be due to host contamination [host-user-contaminated]
tipcutils-2.0.6: /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-lin=
ux/tipcutils/2.0.6-r0/packages-split/tipcutils/etc/init.d/tipcutils is owne=
d by uid 3004, which is the same as the user running bitbake. This may be d=
ue to host contamination [host-user-contaminated]

count: 1        issue: installed-vs-shipped
Please set FILES such that these items are packaged. Alternatively if they =
are unneeded, avoid installing them or delete them within do_install. [inst=
alled-vs-shipped]


count: 1        issue: unknown-configure-option
polkit-gnome-0.105: polkit-gnome: configure was passed unrecognised options=
: --disable-examples --disable-introspection [unknown-configure-option]


count: 1        issue: symlink-to-sysroot
netkit-ftp-0.17: Symlink /usr/bin/pftp in netkit-ftp points to TMPDIR [syml=
ink-to-sysroot]


count: 3        issue: invalid-pkgconfig
gpsd-3.14: gpsd: invalid PACKAGECONFIG: bluez5 [invalid-pkgconfig]
qt-mobility-embedded-1.2.0: qt-mobility-embedded: invalid PACKAGECONFIG: bl=
uez5 [invalid-pkgconfig]
qt-mobility-x11-1.2.0: qt-mobility-x11: invalid PACKAGECONFIG: bluez5 [inva=
lid-pkgconfig]


count: 1        issue: pkgname
 [pkgname]

count: 6	issue: version-going-backwards
ppp-dialin-0.1: Package version for package ppp-dialin went backwards which=
 would break package feeds from (0:0.1-r8.2 to 0:0.1-r8.0) [version-going-b=
ackwards]
ppp-dialin-0.1: Package version for package ppp-dialin-dbg went backwards w=
hich would break package feeds from (0:0.1-r8.2 to 0:0.1-r8.0) [version-goi=
ng-backwards]
ppp-dialin-0.1: Package version for package ppp-dialin-dev went backwards w=
hich would break package feeds from (0:0.1-r8.2 to 0:0.1-r8.0) [version-goi=
ng-backwards]
ppp-dialin-0.1: Package version for package ppp-dialin-doc went backwards w=
hich would break package feeds from (0:0.1-r8.2 to 0:0.1-r8.0) [version-goi=
ng-backwards]
ppp-dialin-0.1: Package version for package ppp-dialin-locale went backward=
s which would break package feeds from (0:0.1-r8.2 to 0:0.1-r8.0) [version-=
going-backwards]
ppp-dialin-0.1: Package version for package ppp-dialin-staticdev went backw=
ards which would break package feeds from (0:0.1-r8.2 to 0:0.1-r8.0) [versi=
on-going-backwards]

--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEUEARECAAYFAlX7+18ACgkQN1Ujt2V2gBynxACYodJYjOiqC9fX5ffvFToFflSL
9QCcDH+mZhr1CgsPju/thrbQ9a96SFA=
=Q+sz
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--
