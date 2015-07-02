Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 2DF0875C49;
	Thu,  2 Jul 2015 13:27:58 +0000 (UTC)
Received: by wiwl6 with SMTP id l6so196990238wiw.0;
	Thu, 02 Jul 2015 06:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=vgQ58sWuVfBpNnNjRvG+u6MGl7JsV7cNQ1dBPccEru4=;
	b=T1g7v9EGiRBa20uZaqWlW2+LSctLnOTg1a25ZK0owfV886IP52UmSRKFh74tVyum3s
	09yhsn4z9hyHloOEZ7SXLHe0eDgJ92VmLKEOLQXRHPc/9kN72/5zc8+mlN1hPBZzu5Yr
	HfJ1MQmvIOXg1g5Plns6YyA5erWH3sS4NAEGI7ESez10viIgJYJFZWahSrv+cdyTy4I7
	l/pNyNG/mRtOwW0rookOJ7I4ISgO5q93cQWdz8/vQOMUKkvHc3TOnToUKqmF6luObCYn
	3vAXkUfvAJ7tHNH4OnPZZT7Jk/jI7ZkkTnT4ioCaX3eIvyJakCALDvAdiI5DX9wgytI9
	539A==
X-Received: by 10.180.90.241 with SMTP id bz17mr50418173wib.95.1435843678123; 
	Thu, 02 Jul 2015 06:27:58 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id r6sm27337188wiy.13.2015.07.02.06.27.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Jul 2015 06:27:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 2 Jul 2015 15:28:25 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20150702132825.GC2434@jama>
References: <20150702101505.GA2434@jama>
MIME-Version: 1.0
In-Reply-To: <20150702101505.GA2434@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: State of bitbake world, Failed tasks 2015-07-01
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
X-List-Received-Date: Thu, 02 Jul 2015 13:28:00 -0000
X-Groupsio-MsgNum: 67472
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Bu8it7iiRSEf40bY"
Content-Disposition: inline

--Bu8it7iiRSEf40bY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 02, 2015 at 12:15:05PM +0200, Martin Jansa wrote:
> http://www.openembedded.org/wiki/Bitbake_World_Status

Ross wanted to know which oe-core changes are applied in this build:

It's using contrib/jansa/master branch, for this build it was including:

a179586 squashfs-tools: upgrade to newer revision from git
e166f29 guile, mailx, gcc, opensp, gstreamer1.0-libav, libunwind:
disable thumb where it fails for qemuarm
d300020 initramfs-framework: Drop allarch
1dc7453 linux-firmware: Drop allarch
4f45532 ppp-dialin: Drop allarch
8a2b976 usbinit, weston-init, run-postinsts, qt-demo-init: Drop allarch
8c98ca5 resolvconf: Drop allarch
18e219f icu: force arm mode
bc42147 gdb: force arm mode
eed4cec DO-NOT-MERGE: distutils3.bbclass: Don't use MACHINE variable
84a79d0 libsdl: Add support for libsdl-native
8c34234 WIP: Add KERNEL_EXTRA_ARGS?
f0dbf3b sstate-sysroot-cruft: Add /usr/src/kernel/.* to whitelist
9ef43f6 report-error: Allow to upload reports automatically
ec390e1 qemux86: Add identical qemux86copy variant for tests

>=20
> =3D=3D Failed tasks 2015-07-01 =3D=3D
>=20
> INFO: jenkins-job.sh-1.3.1 Complete log available at http://logs.nslu2-li=
nux.org/buildlogs/oe/world/log.report.20150701_164414.log
>=20
> =3D=3D=3D common (8) =3D=3D=3D
>     * /meta-openembedded/meta-efl/recipes-efl/efl/epdf_svn.bb, do_compile
>     * /meta-openembedded/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolni=
x_git.bb, do_compile
>     * /meta-openembedded/meta-oe/recipes-extended/cmpi-bindings/cmpi-bind=
ings_git.bb, do_compile
>     * /meta-openembedded/meta-oe/recipes-extended/openwsman/openwsman_2.6=
=2E0.bb, do_compile
>     * /meta-openembedded/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1=
=2E4.8.bb, do_compile
>     * /meta-openembedded/meta-oe/recipes-support/mysql/mariadb-native_5.5=
=2E43.bb, do_configure
>     * /meta-openembedded/meta-webserver/recipes-httpd/hiawatha/hiawatha_9=
=2E2.bb, do_install
>     * /meta-webos-ports/meta-luneui/recipes-luneui/luna-next/luna-next.bb=
, do_compile
>=20
> =3D=3D=3D common-x86 (1) =3D=3D=3D
>     * /meta-openembedded/meta-efl/recipes-efl/webkit/webkit-efl_1.11.0.bb=
, do_compile
>=20
> =3D=3D=3D qemuarm (2) =3D=3D=3D
>     * /meta-openembedded/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4=
=2Ebb, do_compile
>     * /meta-openembedded/meta-oe/recipes-extended/sysdig/sysdig_0.1.101.b=
b, do_compile
>=20
> =3D=3D=3D qemux86 (1) =3D=3D=3D
>     * /meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-=
geode_2.11.16.bb, do_compile
>=20
> =3D=3D=3D qemux86_64 (2) =3D=3D=3D
>     * /meta-browser/recipes-browser/chromium/cef3_280796.bb, do_configure
>     * /meta-openembedded/meta-oe/recipes-support/libldb/libldb_1.1.17.bb,=
 do_configure
>=20
> =3D=3D=3D Number of failed tasks (31) =3D=3D=3D
> {| class=3Dwikitable
> |-
> || qemuarm 	|| 10	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log=
=2Eworld.20150629_130210.log// || http://errors.yoctoproject.org:80/Errors/=
Build/6836/
> |-
> || qemux86 	|| 10	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log=
=2Eworld.20150630_112728.log// ||=20
> |-
> || qemux86_64 	|| 11	 || http://logs.nslu2-linux.org/buildlogs/oe/world//=
log.world.20150701_023534.log// ||=20
> |}
>=20
> =3D=3D=3D PNBLACKLISTs (68) =3D=3D=3D
>=20
> =3D=3D=3D QA issues (101) =3D=3D=3D
> {| class=3Dwikitable
> !| Count		||Issue
> |-
> ||0	||libdir
> |-
> ||18	||textrel
> |-
> ||23	||file-rdeps
> |-
> ||24	||version-going-backwards
> |-
> ||3	||already-stripped
> |-
> ||33	||build-deps
> |}
>=20
>=20
> PNBLACKLISTs:
> openembedded-core/:
> meta-browser:
> meta-openembedded:
> meta-efl/recipes-efl/e17/diskio_svn.bb:PNBLACKLIST[diskio] ?=3D "broken: =
switch to https://git.enlightenment.org/enlightenment/modules/diskio.git/ a=
nd fix 0.0.1+svnr82070-r0.0/E-MODULES-EXTRA/diskio/e-module-diskio.edc:58. =
invalid state name: 'off'. "default" state must always be first."
> meta-efl/recipes-efl/efl/entrance_svn.bb:PNBLACKLIST[entrance] ?=3D "brok=
en: switch to https://git.enlightenment.org/misc/entrance.git and fix 0.0.4=
+svnr82070-r7/entrance/data/themes/old/default.edc:678. invalid state name:=
 'defaault'. "default" state must always be first."
> meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb:PNBLACKLIST[mcnavi] ?=
=3D "BROKEN: latest version 0.3.4 is 3 years old and now broken with more s=
trict ejde_cc from efl-1.13"
> meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.2.bb:PNBLACKLIST[ifu=
se] ?=3D "depends on blacklisted libimobiledevice"
> meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLACKLIST[=
gnome-mplayer] ?=3D "rdepends on blacklisted mplayer"
> meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb:PNBLACKLIST[gcr] ?=3D "CONFLICT=
: 4 files conflict with gnome-keyring"
> meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb:PNBLACKLIST[g=
nome-menus3] ?=3D "CONFLICT: 24 files are conflicting with gnome-menus"
> meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gn=
ome-panel3] ?=3D "CONFLICT: depends on libgweather3 which conflicts with li=
bgweather"
> meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb:PNBLACKLIST[libgw=
eather3] ?=3D "CONFLICT: 876 files are conflicting with libgweather"
> meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb:PNBLACKLIST[zenity] ?=3D=
 "BROKEN: doesn't build with B!=3DS"
> meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb:PNBLACKLIST[xbmc] ?=
=3D "/usr/include/c++/ctime:70:11: error: '::gmtime' has not been declared"
> meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb:PNBLACKLI=
ST[coriander] ?=3D "BROKEN: fails to use SDL probably because libsdl-config=
 was removed, error: unknown type name 'SDL_Overlay'"
> meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb:=
PNBLACKLIST[renderer-service-upnp] ?=3D "BROKEN: doesn't build with B!=3DS =
(trying to install rendererconsole.py from ${B} instead of ${S})"
> meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb:PNBLACKLIST[s=
nort] ?=3D "BROKEN: autotools processing causes OOM condition on configure"
> meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb:PNBLA=
CKLIST[lksctp-tools] ?=3D "${@base_contains('DISTRO_FEATURES', 'ld-is-gold'=
, "BROKEN: fails to link against sctp_connectx symbol", '', d)}"
> meta-networking/recipes-support/nis/yp-tools_3.3.bb:PNBLACKLIST[yp-tools]=
 ?=3D "BROKEN: fails to build for qemuarm."
> meta-networking/recipes-support/nis/ypbind-mt_2.2.bb:PNBLACKLIST[ypbind-m=
t] ?=3D "BROKEN: Depends on broken yp-tools"
> meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb:PNBLACKLIST[bluez=
-hcidump] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 c=
onflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb:PNBLACKLIST[bluez4] ?=
=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts wi=
th bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb:PNBLACKL=
IST[gst-plugin-bluetooth] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bl=
uez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATU=
RES', '', d)}"
> meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb:P=
NBLACKLIST[libimobiledevice] ?=3D "cannot run test program while cross comp=
iling"
> meta-oe/recipes-connectivity/obexftp/obexftp_0.23.bb:PNBLACKLIST[obexftp]=
 ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts =
with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft66] ?=
=3D "BROKEN: depends on broken libftdi"
> meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb:PNBLACKLIST[zer=
oc-ice] ?=3D "BROKEN: not compatible with default db version"
> meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb:PNBLACKLIST[cloud9] ?=3D "N=
ot comatible with current nodejs 0.12, but upstream is working on it for v3"
> meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb:PNBLACKLIST[nodejs4] ?=
=3D "Used only by currently blacklisted cloud9 and fails to build for qemua=
rm with thumb: error: #error For thumb inter-working we require an architec=
ture which supports blx"
> meta-oe/recipes-extended/subsurface/subsurface_git.bb:PNBLACKLIST[subsurf=
ace] ?=3D "Needs to be upgraded for compatibility with new libdivecomputer"
> meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb:PNBLACKLIST[clutter=
-box2d] ?=3D "BROKEN: doesn't build with B!=3DS"
> meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:PNBLACKLIST[fim] ?=3D "BROKEN=
: doesn't build with B!=3DS (flex: can't open lex.lex)"
> meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb:PNBLACKLIST[x=
f86-input-mtev] ?=3D "BROKEN: doesn't build with B!=3DS (Makefile without $=
{S} in sed call)"
> meta-oe/recipes-kernel/ktap/ktap-module_git.bb:PNBLACKLIST[ktap-module] ?=
=3D "Not compatible with 3.19 kernel"
> meta-oe/recipes-kernel/ktap/ktap_git.bb:PNBLACKLIST[ktap] ?=3D "Depends o=
n blacklisted kernel-module-ktapvm"
> meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb:PNBLACKLIST[fox=
trotgps] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 co=
nflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-navigation/gypsy/gypsy.inc:PNBLACKLIST[gypsy] ?=3D "${@bb=
=2Eutils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez=
4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-navigation/navit/navit.inc:PNBLACKLIST[navit] ?=3D "${@bb=
=2Eutils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez=
4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-qt/qconnman/qconnman-e_git.bb:PNBLACKLIST[qconnman-e] ?=
=3D "BROKEN: doesn't work with B!=3DS, ls: cannot access *.pro: No such fil=
e or directory"
> meta-oe/recipes-qt/qconnman/qconnman_git.bb:PNBLACKLIST[qconnman] ?=3D "B=
ROKEN: doesn't work with B!=3DS, ls: cannot access *.pro: No such file or d=
irectory"
> meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb:PNBLACKLIST[apcupsd] ?=
=3D "BROKEN: doesn't build with B!=3DS"
> meta-oe/recipes-support/emacs/emacs_23.4.bb:PNBLACKLIST[emacs] ?=3D "qemu=
: uncaught target signal 11 (Segmentation fault) - core dumped"
> meta-oe/recipes-support/maliit/maliit-framework_git.bb:PNBLACKLIST[maliit=
-framework] ?=3D "BROKEN: Wasn't updated to work with B!=3DS, maybe incorre=
ctly inherits autotools"
> meta-oe/recipes-support/maliit/maliit-plugins_git.bb:PNBLACKLIST[maliit-p=
lugins] ?=3D "BROKEN: depends on broken maliit-framework"
> meta-oe/recipes-support/mongodb/mongodb_git.bb:PNBLACKLIST[mongodb] ?=3D =
"Fails to build with system boost"
> meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb:PNBLACKLIST[openmoti=
f] ?=3D "BROKEN: doesn't build with B!=3DS"
> meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb:PNBLACKLIST[libsyncml=
] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts=
 with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb:P=
NBLACKLIST[start-stop-daemon] ?=3D "BROKEN: fails because of gettext, parti=
al fix is available here http://patchwork.openembedded.org/patch/89867/"
> meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST[va=
la-terminal] ?=3D "BROKEN: Doesn't work with B!=3DS, touch: cannot touch `s=
rc/.stamp': No such file or directory"
> meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb:PNBLACKLIST[xfce4-va=
la] ?=3D "Fails to build since vala upgrade to 0.26.1"
> meta-qt5:
> meta-smartphone:
> meta-shr/recipes-shr/3rdparty/emtooth2_svn.bb:PNBLACKLIST[emtooth2] ?=3D =
"${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with b=
luez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-shr/recipes-shr/3rdparty/ffalarms_git.bb:PNBLACKLIST[ffalarms] =3D "=
Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> meta-shr/recipes-shr/3rdparty/gwaterpas_0.3.bb:PNBLACKLIST[gwaterpas] ?=
=3D "broken: depends on blacklisted fltk"
> meta-shr/recipes-shr/3rdparty/iliwi_git.bb:PNBLACKLIST[iliwi] =3D "Doesn'=
t build after vala upgrade from 0.24.0 to 0.26.1"
> meta-shr/recipes-shr/3rdparty/intone_git.bb:PNBLACKLIST[intone] =3D "rdep=
ends on blacklisted mplayer2"
> meta-shr/recipes-shr/3rdparty/pisi_0.5.3.bb:PNBLACKLIST[pisi] ?=3D "${@bb=
=2Eutils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez=
4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-shr/recipes-shr/3rdparty/podboy_svn.bb:PNBLACKLIST[podboy] ?=3D "${@=
bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez=
4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-shr/recipes-shr/3rdparty/sensmon_git.bb:PNBLACKLIST[sensmon] =3D "Do=
esn't build after vala upgrade from 0.24.0 to 0.26.1"
> meta-shr/recipes-shr/3rdparty/valacompass_git.bb:PNBLACKLIST[valacompass]=
 =3D "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> meta-webos-ports:
> conf/world_fixes.inc:PNBLACKLIST[mplayer2] =3D ""
> conf/world_fixes.inc:PNBLACKLIST[android-system] =3D "depends on lxc from=
 meta-virtualiazation which isn't included in my world builds"
> conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-1080p] =3D "big and doesn't=
 really need to be tested so much"
> conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-480p] =3D "big and doesn't =
really need to be tested so much"
> conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't =
really need to be tested so much"
> conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't =
really need to be tested so much"
> conf/world_fixes.inc:PNBLACKLIST[tearsofsteel-1080p] =3D "big and doesn't=
 really need to be tested so much"
> conf/world_mask.inc:PNBLACKLIST[evince] =3D "fails to build"
> conf/world_mask.inc:PNBLACKLIST[epiphany] =3D "fails to build"
> conf/world_mask.inc:PNBLACKLIST[gnome-power-manager] =3D "fails to build"
> conf/world_mask.inc:PNBLACKLIST[gnome-bluetooth] =3D "fails to build"
> conf/world_mask.inc:PNBLACKLIST[media-ctl] =3D "fails to build"
> QA issues by type:
> count: 3	issue: already-stripped
> qwt-6.0.1: File '/usr/lib/libqwt.so.6.0.1' from qwt was already stripped,=
 this will prevent future debugging! [already-stripped]
> qwt-6.0.1: File '/usr/lib/libqwtmathml.so.6.0.1' from qwt was already str=
ipped, this will prevent future debugging! [already-stripped]
> qwt-6.0.1: File '/usr/lib/qt4/plugins/designer/libqwt_designer_plugin.so'=
 from qwt was already stripped, this will prevent future debugging! [alread=
y-stripped]
>=20
>=20
> count: 0	issue: libdir
>=20
>=20
> count: 18	issue: textrel
> cef3-280796: ELF binary '/tmp/work/i586-oe-linux/cef3/280796-r0/packages-=
split/cef3-codecs-ffmpeg/usr/lib/cef3/libffmpegsumo.so' has relocations in =
=2Etext [textrel]
> chromium-40.0.2214.91: ELF binary '/tmp/work/i586-oe-linux/chromium/40.0.=
2214.91-r0/packages-split/chromium-codecs-ffmpeg/usr/lib/chromium/libffmpeg=
sumo.so' has relocations in .text [textrel]
> gstreamer1.0-libav-1.4.5: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/g=
streamer1.0-libav/1.4.5-r0/packages-split/gstreamer1.0-libav/usr/lib/gstrea=
mer-1.0/libgstlibav.so' has relocations in .text [textrel]
> gstreamer1.0-libav-1.4.5: ELF binary '/tmp/work/i586-oe-linux/gstreamer1.=
0-libav/1.4.5-r0/packages-split/gstreamer1.0-libav/usr/lib/gstreamer-1.0/li=
bgstlibav.so' has relocations in .text [textrel]
> libav-9.18: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/libav/9.18-r0/p=
ackages-split/libavcodec/usr/lib/libavcodec.so.54.35.0' has relocations in =
=2Etext [textrel]
> libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-sp=
lit/libavcodec/usr/lib/libavcodec.so.54.35.0' has relocations in .text [tex=
trel]
> libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-sp=
lit/libavdevice/usr/lib/libavdevice.so.53.2.0' has relocations in .text [te=
xtrel]
> libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-sp=
lit/libavfilter/usr/lib/libavfilter.so.3.3.0' has relocations in .text [tex=
trel]
> libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-sp=
lit/libavformat/usr/lib/libavformat.so.54.20.4' has relocations in .text [t=
extrel]
> libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-sp=
lit/libavresample/usr/lib/libavresample.so.1.0.1' has relocations in .text =
[textrel]
> libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-sp=
lit/libavutil/usr/lib/libavutil.so.52.3.0' has relocations in .text [textre=
l]
> libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-sp=
lit/libswscale/usr/lib/libswscale.so.2.1.1' has relocations in .text [textr=
el]
> libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary '/tmp/work/armv5te-o=
e-linux-gnueabi/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split/=
libpostproc/usr/lib/libpostproc.so.52.3.0' has relocations in .text [textre=
l]
> libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary '/tmp/work/i586-oe-l=
inux/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split/libpostproc=
/usr/lib/libpostproc.so.52.3.0' has relocations in .text [textrel]
> mpg123-1.21.0: ELF binary '/tmp/work/i586-oe-linux/mpg123/1.21.0-r0/packa=
ges-split/mpg123/usr/lib/libmpg123.so.0.40.3' has relocations in .text [tex=
trel]
> qtwebengine-5.4.2+gitAUTOINC+qtwebengine: ELF binary '/tmp/work/i586-oe-l=
inux/qtwebengine/5.4.2+gitAUTOINC+qtwebengine-r0/packages-split/qtwebengine=
-plugins/usr/lib/qt5/plugins/qtwebengine/libffmpegsumo.so' has relocations =
in .text [textrel]
> qtwebkit-5.4.2+gitAUTOINC+882e9b5f2c: ELF binary '/tmp/work/i586-oe-linux=
/qtwebkit/5.4.2+gitAUTOINC+882e9b5f2c-r0/packages-split/qtwebkit/usr/lib/li=
bs on geoip, but it isn't a build dependency? [build-deps]
> gpm-1.99.7: gpm rdepends on initscripts-functions, but it isn't a build d=
ependency? [build-deps]
> imsettings-1.6.8: imsettings rdepends on xfconf, but it isn't a build dep=
endency? [build-deps]
> irda-utils-0.9.18: irda-utils rdepends on initscripts-functions, but it i=
sn't a build dependency? [build-deps]
> libldb-1.1.17: libldb rdepends on openldap, but it isn't a build dependen=
cy? [build-deps]
> mpd-0.19.1: mpd rdepends on libupnp, but it isn't a build dependency? [bu=
ild-deps]
> netkit-rwho-0.17: netkit-rwho-client rdepends on initscripts-functions, b=
ut it isn't a build dependency? [build-deps]
> pinpoint-0.1.4+gitrAUTOINC+80a056c57e: pinpoint rdepends on librsvg, but =
it isn't a build dependency? [build-deps]
> qt-mobility-embedded-1.2.0: qt-mobility-embedded rdepends on libgstapp-0.=
10, but it isn't a build dependency? [build-deps]
> qt-mobility-embedded-1.2.0: qt-mobility-embedded rdepends on libgstvideo-=
0.10, but it isn't a build dependency? [build-deps]
> qt-mobility-x11-1.2.0: qt-mobility-x11 rdepends on libgstapp-0.10, but it=
 isn't a build dependency? [build-deps]
> qt-mobility-x11-1.2.0: qt-mobility-x11 rdepends on libgstinterfaces-0.10,=
 but it isn't a build dependency? [build-deps]
> qt-mobility-x11-1.2.0: qt-mobility-x11 rdepends on libgstvideo-0.10, but =
it isn't a build dependency? [build-deps]
> qt-mobility-x11-1.2.0: qt-mobility-x11 rdepends on libxv, but it isn't a =
build dependency? [build-deps]
> qt5-creator-3.3.1: qt5-creator rdepends on qt-creator, but it isn't a bui=
ld dependency? [build-deps]
> samba-4.1.12: samba rdepends on cups-lib, but it isn't a build dependency=
? [build-deps]
> samba-4.1.12: samba rdepends on cyrus-sasl, but it isn't a build dependen=
cy? [build-deps]
> samba-4.1.12: samba rdepends on libaio, but it isn't a build dependency? =
[build-deps]
> samba-4.1.12: samba rdepends on libavahi-client, but it isn't a build dep=
endency? [build-deps]
> samba-4.1.12: samba rdepends on libavahi-common, but it isn't a build dep=
endency? [build-deps]
> samba-4.1.12: samba rdepends on libbsd, but it isn't a build dependency? =
[build-deps]
> samba-4.1.12: samba rdepends on libpam, but it isn't a build dependency? =
[build-deps]
> samba-4.1.12: samba rdepends on openldap, but it isn't a build dependency=
? [build-deps]
> samba-4.1.12: samba-python rdepends on libbsd, but it isn't a build depen=
dency? [build-deps]
> sox-14.4.0: sox rdepends on libflac, but it isn't a build dependency? [bu=
ild-deps]
> squid-3.5.5: squid rdepends on libpam, but it isn't a build dependency? [=
build-deps]
> sysklogd-1.5.1: sysklogd rdepends on initscripts-functions, but it isn't =
a build dependency? [build-deps]
> vlc-2.1.4: vlc rdepends on libsamplerate0, but it isn't a build dependenc=
y? [build-deps]
> vlc-2.1.4: vlc rdepends on libupnp, but it isn't a build dependency? [bui=
ld-deps]
> watchdog-5.14: watchdog rdepends on initscripts-functions, but it isn't a=
 build dependency? [build-deps]
> znc-1.6.0+git: znc rdepends on libicuuc, but it isn't a build dependency?=
 [build-deps]
>=20
>=20
> count: 23	issue: file-rdeps
> apache2-2.4.12: /usr/bin/apxs_apache2-dev contained in package apache2-de=
v requires /usr/bin/perl, but no providers found in its RDEPENDS [file-rdep=
s]
> chkconfig-1.3.58: /usr/sbin/ntsysv_chkconfig contained in package chkconf=
ig requires libnewt.so, but no providers found in its RDEPENDS [file-rdeps]
> ctdb-2.5.1: /usr/bin/onnode_ctdb contained in package ctdb requires /bin/=
bash, but no providers found in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: /usr/bin/dvbdate_dvbdate contained in package dvbdate req=
uires libucsi.so, but no providers found in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: /usr/bin/dvbnet_dvbnet contained in package dvbnet requir=
es libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: /usr/bin/dvbscan_dvb-scan contained in package dvb-scan r=
equires libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: /usr/bin/dvbtraffic_dvbtraffic contained in package dvbtr=
affic requires libdvbapi.so, but no providers found in its RDEPENDS [file-r=
deps]
> dvb-apps-1.1.1: /usr/bin/femon_dvb-femon contained in package dvb-femon r=
equires libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: /usr/bin/gotox_dvb-apps contained in package dvb-apps req=
uires libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
> fakeroot-1.18.4: /usr/bin/fakeroot_fakeroot contained in package fakeroot=
 requires /bin/bash, but no providers found in its RDEPENDS [file-rdeps]
> gnome-desktop-2.32.1: /usr/bin/gnome-about_gnome-desktop contained in pac=
kage gnome-desktop requires /usr/bin/python, but no providers found in its =
RDEPENDS [file-rdeps]
> gnome-panel-2.32.1: /usr/lib/gnome-panel/gnome-panel-add_gnome-panel cont=
ained in package gnome-panel requires /usr/bin/python, but no providers fou=
nd in its RDEPENDS [file-rdeps]
> gupnp-0.20.12: /usr/bin/gupnp-binding-tool_gupnp-dev contained in package=
 gupnp-dev requires /usr/bin/python, but no providers found in its RDEPENDS=
 [file-rdeps]
> libbonobo-2.32.1: /usr/bin/bonobo-slay_libbonobo contained in package lib=
bonobo requires /usr/bin/perl, but no providers found in its RDEPENDS [file=
-rdeps]
> libnewt-0.52.18: /usr/bin/whiptail_whiptail contained in package whiptail=
 requires libnewt.so, but no providers found in its RDEPENDS [file-rdeps]
> libnewt-python-0.52.18: /usr/lib/python2.7/site-packages/@underscore@snac=
k.so_libnewt-python contained in package libnewt-python requires libnewt.so=
, but no providers found in its RDEPENDS [file-rdeps]
> networkmanager-1.0.2: /usr/bin/nmtui-connect_networkmanager contained in =
package networkmanager requires libnewt.so()(64bit), but no providers found=
 in its RDEPENDS [file-rdeps]
> networkmanager-1.0.2: /usr/bin/nmtui-connect_networkmanager contained in =
package networkmanager requires libnewt.so, but no providers found in its R=
DEPENDS [file-rdeps]
> numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert.pl_numptyphys=
ics contained in package numptyphysics requires /usr/bin/perl, but no provi=
ders found in its RDEPENDS [file-rdeps]
> numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert@underscore@al=
l.sh_numptyphysics contained in package numptyphysics requires /bin/bash, b=
ut no providers found in its RDEPENDS [file-rdeps]
> tracker-0.14.2: /usr/lib/nautilus/extensions-2.0/libnautilus-tracker-tags=
=2Eso_tracker-nautilus-extension contained in package tracker-nautilus-exte=
nsion requires libnautilus-extension.so.1, but no providers found in its RD=
EPENDS [file-rdeps]
> ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: /usr/bin/memory-map.sh_ubx-utils =
contained in package ubx-utils requires /bin/bash, but no providers found i=
n its RDEPENDS [file-rdeps]
> unionfs-fuse-0.26: /usr/sbin/mount.unionfs_unionfs-fuse contained in pack=
age unionfs-fuse requires /bin/bash, but no providers found in its RDEPENDS=
 [file-rdeps]
>=20
>=20
> count: 24	issue: version-going-backwards
> libauthen-sasl-perl-2.16: Package version for package libauthen-sasl-perl=
 went backwards which would break package feeds from (0:2.16-r0.61 to 0:2.1=
6-r0.60) [version-going-backwards]
> libauthen-sasl-perl-2.16: Package version for package libauthen-sasl-perl=
-dbg went backwards which would break package feeds from (0:2.16-r0.61 to 0=
:2.16-r0.60) [version-going-backwards]
> libauthen-sasl-perl-2.16: Package version for package libauthen-sasl-perl=
-dev went backwards which would break package feeds from (0:2.16-r0.61 to 0=
:2.16-r0.60) [version-going-backwards]
> libauthen-sasl-perl-2.16: Package version for package libauthen-sasl-perl=
-doc went backwards which would break package feeds from (0:2.16-r0.61 to 0=
:2.16-r0.60) [version-going-backwards]
> libauthen-sasl-perl-2.16: Package version for package libauthen-sasl-perl=
-locale went backwards which would break package feeds from (0:2.16-r0.61 t=
o 0:2.16-r0.60) [version-going-backwards]
> libauthen-sasl-perl-2.16: Package version for package libauthen-sasl-perl=
-staticdev went backwards which would break package feeds from (0:2.16-r0.6=
1 to 0:2.16-r0.60) [version-going-backwards]
> libdigest-hmac-perl-1.03: Package version for package libdigest-hmac-perl=
 went backwards which would break package feeds from (0:1.03-r0.63 to 0:1.0=
3-r0.62) [version-going-backwards]
> libdigest-h.62) [version-going-backwards]
> libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl=
-perl went backwards which would break package feeds from (0:1.997-r0.60 to=
 0:1.997-r0.59) [version-going-backwards]
> libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl=
-perl-dbg went backwards which would break package feeds from (0:1.997-r0.6=
0 to 0:1.997-r0.59) [version-going-backwards]
> libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl=
-perl-dev went backwards which would break package feeds from (0:1.997-r0.6=
0 to 0:1.997-r0.59) [version-going-backwards]
> libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl=
-perl-doc went backwards which would break package feeds from (0:1.997-r0.6=
0 to 0:1.997-r0.59) [version-going-backwards]
> libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl=
-perl-locale went backwards which would break package feeds from (0:1.997-r=
0.60 to 0:1.997-r0.59) [version-going-backwards]
> libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl=
-perl-staticdev went backwards which would break package feeds from (0:1.99=
7-r0.60 to 0:1.997-r0.59) [version-going-backwards]
> xserver-common-1.34: Package version for package xserver-common went back=
wards which would break package feeds from (0:1.34-r8.72 to 0:1.34-r8.70) [=
version-going-backwards]
> xserver-common-1.34: Package version for package xserver-common-dbg went =
backwards which would break package feeds from (0:1.34-r8.72 to 0:1.34-r8.7=
0) [version-going-backwards]
> xserver-common-1.34: Package version for package xserver-common-dev went =
backwards which would break package feeds from (0:1.34-r8.72 to 0:1.34-r8.7=
0) [version-going-backwards]
> xserver-common-1.34: Package version for package xserver-common-doc went =
backwards which would break package feeds from (0:1.34-r8.72 to 0:1.34-r8.7=
0) [version-going-backwards]
> xserver-common-1.34: Package version for package xserver-common-locale we=
nt backwards which would break package feeds from (0:1.34-r8.72 to 0:1.34-r=
8.70) [version-going-backwards]
> xserver-common-1.34: Package version for package xserver-common-staticdev=
 went backwards which would break package feeds from (0:1.34-r8.72 to 0:1.3=
4-r8.70) [version-going-backwards]



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Bu8it7iiRSEf40bY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWVPHgACgkQN1Ujt2V2gBypWgCfbanKtJz5i3xUEhH/XNFltu8k
bEsAnAoKt1U1j/glnpA2hRtD92sJWFwA
=GJiC
-----END PGP SIGNATURE-----

--Bu8it7iiRSEf40bY--
