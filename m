Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 627D57632C;
	Thu, 30 Jul 2015 18:01:25 +0000 (UTC)
Received: by wicgb10 with SMTP id gb10so2284435wic.1;
	Thu, 30 Jul 2015 11:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=tAJQ1dJXCxbq6NQEfZVVcsvghfU8I0JHr57EWnS7YQE=;
	b=C5+EDQlPtPUv8StO5xY+nsZrPQ0E5nwnCgqK/cE1e7QVPs9TWC/aHLaKUFSi7emrqM
	QCALr5mcCXFemDz8Esl3HugLXROO/pFmugRINC+l7fFi4yM5gnfcCwq/vZX5DrwOOSsD
	sdlho46M4OFJnbaP2Wx/hDExsirt47QmSfEOBRQJDYp7uEfMrb/+ux0QjPR5sd5z4zIc
	cLquLBJx3YhCaqtkkr7rQlLpDYk473OIMuY4zJOZM+T7ytNYe5oFCw2TIw0jt+fwbHFG
	dbqW4e2+nt+hau6sw9QJnXIHtl6brnBXRMBzE6/kfDQNFGvgdr4QH8pOo4gKn0YpW1YY
	BoDg==
X-Received: by 10.180.104.129 with SMTP id ge1mr8870549wib.84.1438279285912;
	Thu, 30 Jul 2015 11:01:25 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	oy7sm3002437wjb.27.2015.07.30.11.01.24
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Jul 2015 11:01:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 30 Jul 2015 20:01:40 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20150730180140.GN2457@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, Failed tasks 2015-07-29
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
X-List-Received-Date: Thu, 30 Jul 2015 18:01:27 -0000
X-Groupsio-MsgNum: 68777
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JVu9XMG6uEpKCPDY"
Content-Disposition: inline

--JVu9XMG6uEpKCPDY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I have tried to move failing meta-oe pending patches to
contrib/jansa/master-next-unresolved-review but there is still
too many issues, if nobody steps-up to fix some of them I'll
add more PNBLACKLISTs next week.

OE @ ~/openembedded-core $ git log --oneline origin/master..jansa/master
d9caaef guile, mailx, gcc, opensp, gstreamer1.0-libav, libunwind: disable t=
humb where it fails for qemuarm
d5d329c initramfs-framework: Drop allarch
72aff24 linux-firmware: Drop allarch
9b44610 ppp-dialin: Drop allarch
87fccbb usbinit, weston-init, run-postinsts, qt-demo-init: Drop allarch
451fbad resolvconf: Drop allarch
af1fb2d icu: force arm mode
0705b85 gdb: force arm mode
ae88c77 DO-NOT-MERGE: distutils3.bbclass: Don't use MACHINE variable
fff2944 libsdl: Add support for libsdl-native
d7efb06 WIP: Add KERNEL_EXTRA_ARGS?
d7ecccc sstate-sysroot-cruft: Add /usr/src/kernel/.* to whitelist
453cd75 report-error: Allow to upload reports automatically
6c27943 qemux86: Add identical qemux86copy variant for tests

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2015-07-29 =3D=3D

INFO: jenkins-job.sh-1.3.1 Complete log available at http://logs.nslu2-linu=
x.org/buildlogs/oe/world/log.report.20150730_174523.log

=3D=3D=3D common (12) =3D=3D=3D
    * /meta-openembedded/meta-efl/recipes-efl/efl/epdf_svn.bb, do_compile
    * /meta-openembedded/meta-filesystems/recipes-filesystems/smbnetfs/smbn=
etfs_git.bb, do_configure
    * /meta-openembedded/meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb, do_c=
ompile
    * /meta-openembedded/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_=
git.bb, do_compile
    * /meta-openembedded/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.b=
b, do_compile
    * /meta-openembedded/meta-networking/recipes-connectivity/crda/crda_3.1=
8.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb, d=
o_compile
    * /meta-openembedded/meta-oe/recipes-support/imagemagick/imagemagick_6.=
9.1.bb, do_fetch
    * /meta-openembedded/meta-perl/recipes-perl/libextutils/libextutils-cpp=
guess-perl_0.07.bb, do_configure
    * /meta-openembedded/meta-perl/recipes-perl/libmodule/libmodule-pluggab=
le-perl_5.1.bb, do_configure
    * /meta-openembedded/meta-perl/recipes-perl/libmodule/libmodule-runtime=
-perl_0.014.bb, do_configure
    * /meta-openembedded/meta-python/recipes-extended/python-pyparted/pytho=
n-pyparted_3.9.bb, do_compile

=3D=3D=3D common-x86 (2) =3D=3D=3D
    * /meta-openembedded/meta-efl/recipes-efl/webkit/webkit-efl_1.11.0.bb, =
do_compile
    * /meta-openembedded/meta-oe/recipes-connectivity/hostapd/hostapd_2.4.b=
b, do_patch

=3D=3D=3D qemuarm (5) =3D=3D=3D
    * /meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compi=
le
    * /meta-openembedded/meta-networking/recipes-kernel/netmap/netmap_git.b=
b, do_configure
    * /meta-openembedded/meta-oe/recipes-connectivity/hostapd/hostapd_2.4.b=
b, do_fetch
    * /meta-openembedded/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindin=
gs_git.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.5.=
0.bb, do_compile

=3D=3D=3D qemux86 (1) =3D=3D=3D
    * /meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-ge=
ode_2.11.16.bb, do_compile

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * /meta-browser/recipes-browser/chromium/cef3_280796.bb, do_configure

=3D=3D=3D Number of failed tasks (48) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 17	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.w=
orld.20150727_181318.log// || http://errors.yoctoproject.org:80/Errors/Buil=
d/7660/
|-
|| qemux86 	|| 16	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.w=
orld.20150728_173631.log// ||=20
|-
|| qemux86_64 	|| 15	 || http://logs.nslu2-linux.org/buildlogs/oe/world//lo=
g.world.20150729_174935.log// ||=20
|}

=3D=3D=3D PNBLACKLISTs (66) =3D=3D=3D

=3D=3D=3D QA issues (118) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
|-
||0	||libdir
|-
||18	||textrel
|-
||29	||file-rdeps
|-
||3	||already-stripped
|-
||30	||build-deps
|-
||38	||version-going-backwards
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


count: 18	issue: textrel
cef3-280796: ELF binary '/tmp/work/i586-oe-linux/cef3/280796-r0/packages-sp=
lit/cef3-codecs-ffmpeg/usr/lib/cef3/libffmpegsumo.so' has relocations in .t=
ext [textrel]
chromium-40.0.2214.91: ELF binary '/tmp/work/i586-oe-linux/chromium/40.0.22=
14.91-r0/packages-split/chromium-codecs-ffmpeg/usr/lib/chromium/libffmpegsu=
mo.so' has relocations in .text [textrel]
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
mpg123-1.21.0: ELF binary '/tmp/work/i586-oe-linux/mpg123/1.21.0-r0/package=
s-split/mpg123/usr/lib/libmpg123.so.0.40.3' has relocations in .tdeps
dovecot-2.2.18: dovecot rdepends on lz4, but it isn't a build dependency? [=
build-deps]
dovecot-2.2.18: dovecot-dev rdepends on libicudata, but it isn't a build de=
pendency? [build-deps]
dovecot-2.2.18: dovecot-dev rdepends on libicui18n, but it isn't a build de=
pendency? [build-deps]
dovecot-2.2.18: dovecot-dev rdepends on libicuuc, but it isn't a build depe=
ndency? [build-deps]
dovecot-2.2.18: dovecot-dev rdepends on lz4, but it isn't a build dependenc=
y? [build-deps]
exquisite-0.0.1+svnr82070: exquisite rdepends on initscripts-functions, but=
 it isn't a build dependency? [build-deps]
geoclue-2.0.0: geoclue rdepends on geoip, but it isn't a build dependency? =
[build-deps]
gpm-1.99.7: gpm rdepends on initscripts-functions, but it isn't a build dep=
endency? [build-deps]
imsettings-1.6.8: imsettings rdepends on xfconf, but it isn't a build depen=
dency? [build-deps]
irda-utils-0.9.18: irda-utils rdepends on initscripts-functions, but it isn=
't a build dependency? [build-deps]
libcapture-tiny-perl-0.24: libcapture-tiny-perl rdepends on perl-module-bui=
ld, but it isn't a build dependency? [build-deps]
libwebp-0.4.0: libwebp-bin rdepends on libgl-mesa, but it isn't a build dep=
endency? [build-deps]
libwebp-0.4.0: libwebp-bin rdepends on mesa-glut, but it isn't a build depe=
ndency? [build-deps]
mc-4.8.14: mc rdepends on util-linux-libmount, but it isn't a build depende=
ncy? [build-deps]
netkit-rwho-0.17: netkit-rwho-client rdepends on initscripts-functions, but=
 it isn't a build dependency? [build-deps]
perf-1.0: perf rdepends on liblzma, but it isn't a build dependency? [build=
-deps]
pinpoint-0.1.4+gitrAUTOINC+80a056c57e: pinpoint rdepends on librsvg, but it=
 isn't a build dependency? [build-deps]
qemu-2.3.99+2.4.0-rc2: qemu rdepends on gnutls, but it isn't a build depend=
ency? [build-deps]
qemu-2.3.99+2.4.0-rc2: qemu rdepends on nettle, but it isn't a build depend=
ency? [build-deps]
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
sox-14.4.0: sox rdepends on libflac, but it isn't a build dependency? [buil=
d-deps]
sysklogd-1.5.1: sysklogd rdepends on initscripts-functions, but it isn't a =
build dependency? [build-deps]
watchdog-5.14: watchdog rdepends on initscripts-functions, but it isn't a b=
uild dependency? [build-deps]
webmin-1.750: webmin rdepends on perl-module-sdbm, but it isn't a build dep=
endency? [build-deps]


count: 29	issue: file-rdeps
chkconfig-1.3.58: /usr/sbin/ntsysv_chkconfig contained in package chkconfig=
 requires libnewt.so()(64bit), but no providers found in its RDEPENDS [file=
-rdeps]
chkconfig-1.3.58: /usr/sbin/ntsysv_chkconfig contained in package chkconfig=
 requires libnewt.so, but no providers found in its RDEPENDS [file-rdeps]
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
so_libnewt-python contained in package libnewt-python requires libnewt.so, =
but no providers found in its RDEPENDS [file-rdeps]
networkmanager-1.0.2: /usr/bin/nmtui-connect_networkmanager contained in pa=
ckage networkmanager requires libnewt.so()(64bit), but no providers found i=
n its RDEPENDS [file-rdeps]
networkmanager-1.0.2: /usr/bin/nmtui-connect_networkmanager contained in pa=
ckage networkmanager requires libnewt.so, but no providers found in its RDE=
PENDS [file-rdeps]
ntp-4.2.8p3: /etc/dhcp/dhclient.d/ntp.sh_ntp contained in package ntp requi=
res /bin/bash, but no providers found in its RDEPENDS [file-rdeps]
numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert.pl_numptyphysic=
s contained in package numptyphysics requires /usr/bin/perl, but no provide=
rs found in its RDEPENDS [file-rdeps]
numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert@underscore@all.=
sh_numptyphysics contained in package numptyphysics requires /bin/bash, but=
 no providers found in its RDEPENDS [file-rdeps]
ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: /usr/bin/memory-map.sh_ubx-utils co=
ntained in package ubx-utils requires /bin/bash, but no providers found in =
its RDEPENDS [file-rdeps]
ypbind-mt-1.38: /etc/dhcp/dhclient.d/nis.sh_ypbind-mt contained in package =
ypbind-mt requires /bin/bash, but no providers found in its RDEPENDS [file-=
rdeps]


count: 38	issue: version-going-backwards
ifuse-1.1.2: Package version for package ifuse went backwards which would b=
reak package feeds from (0:1.1.2-r0.103 to 0:1.1.2-r0.0) [version-going-bac=
kwards]
ifuse-1.1.2: Package version for package ifuse went backwards which would b=
reak package feeds from (0:1.1.2-r0.75 to 0:1.1.2-r0.0) [version-going-back=
wards]
ifuse-1.1.2: Package version for packwould break package feeds from (0:1.1.=
2-r0.75 to 0:1.1.2-r0.0) [version-going-backwards]
ifuse-1.1.2: Package version for package ifuse-doc went backwards which wou=
ld break package feeds from (0:1.1.2-r0.103 to 0:1.1.2-r0.0) [version-going=
-backwards]
ifuse-1.1.2: Package version for package ifuse-doc went backwards which wou=
ld break package feeds from (0:1.1.2-r0.75 to 0:1.1.2-r0.0) [version-going-=
backwards]
ifuse-1.1.2: Package version for package ifuse-locale went backwards which =
would break package feeds from (0:1.1.2-r0.103 to 0:1.1.2-r0.0) [version-go=
ing-backwards]
ifuse-1.1.2: Package version for package ifuse-locale went backwards which =
would break package feeds from (0:1.1.2-r0.75 to 0:1.1.2-r0.0) [version-goi=
ng-backwards]
ifuse-1.1.2: Package version for package ifuse-staticdev went backwards whi=
ch would break package feeds from (0:1.1.2-r0.103 to 0:1.1.2-r0.0) [version=
-going-backwards]
ifuse-1.1.2: Package version for package ifuse-staticdev went backwards whi=
ch would break package feeds from (0:1.1.2-r0.75 to 0:1.1.2-r0.0) [version-=
going-backwards]
libimobiledevice-1.1.4: Package version for package libimobiledevice went b=
ackwards which would break package feeds from (0:1.1.4-r0.103 to 0:1.1.4-r0=
=2E0) [version-going-backwards]
libimobiledevice-1.1.4: Package version for package libimobiledevice went b=
ackwards which would break package feeds from (0:1.1.4-r0.75 to 0:1.1.4-r0.=
0) [version-going-backwards]
libimobiledevice-1.1.4: Package version for package libimobiledevice-dbg we=
nt backwards which would break package feeds from (0:1.1.4-r0.103 to 0:1.1.=
4-r0.0) [version-going-backwards]
libimobiledevice-1.1.4: Package version for package libimobiledevice-dbg we=
nt backwards which would break package feeds from (0:1.1.4-r0.75 to 0:1.1.4=
-r0.0) [version-going-backwards]
libimobiledevice-1.1.4: Package version for package libimobiledevice-dev we=
nt backwards which would break package feeds from (0:1.1.4-r0.103 to 0:1.1.=
4-r0.0) [version-going-backwards]
libimobiledevice-1.1.4: Package version for package libimobiledevice-dev we=
nt backwards which would break package feeds from (0:1.1.4-r0.75 to 0:1.1.4=
-r0.0) [version-going-backwards]
libimobiledevice-1.1.4: Package version for package libimobiledevice-doc we=
nt backwards which would break package feeds from (0:1.1.4-r0.103 to 0:1.1.=
4-r0.0) [version-going-backwards]
libimobiledevice-1.1.4: Package version for package libimobiledevice-doc we=
nt backwards which would break package feeds from (0:1.1.4-r0.75 to 0:1.1.4=
-r0.0) [version-going-backwards]
libimobiledevice-1.1.4: Package version for package libimobiledevice-locale=
 went backwards which would break package feeds from (0:1.1.4-r0.103 to 0:1=
=2E1.4-r0.0) [version-going-backwards]
libimobiledevice-1.1.4: Package version for package libimobiledevice-locale=
 went backwards which would break package feeds from (0:1.1.4-r0.75 to 0:1.=
1.4-r0.0) [version-going-backwards]
libimobiledevice-1.1.4: Package version for package libimobiledevice-static=
dev went backwards which would break package feeds from (0:1.1.4-r0.103 to =
0:1.1.4-r0.0) [version-going-backwards]
libimobiledevice-1.1.4: Package version for package libimobiledevice-static=
dev went backwards which would break package feeds from (0:1.1.4-r0.75 to 0=
:1.1.4-r0.0) [version-going-backwards]
multipath-tools-0.5.0+git770e6d0da0: Package version for package kpartx wen=
t backwards which would break package feeds from (0:0.5.0+gitaec68ab217-r0.=
22 to 0:0.5.0+git770e6d0da0-r0.0) [version-going-backwards]
multipath-tools-0.5.0+git770e6d0da0: Package version for package kpartx wen=
t backwards-tools-dbg went backwards which would break package feeds from (=
0:0.5.0+gitaec68ab217-r0.22 to 0:0.5.0+git770e6d0da0-r0.0) [version-going-b=
ackwards]
multipath-tools-0.5.0+git770e6d0da0: Package version for package multipath-=
tools-dbg went backwards which would break package feeds from (0:0.5.0+gita=
ec68ab217-r0.27 to 0:0.5.0+git770e6d0da0-r0.0) [version-going-backwards]
multipath-tools-0.5.0+git770e6d0da0: Package version for package multipath-=
tools-dev went backwards which would break package feeds from (0:0.5.0+gita=
ec68ab217-r0.22 to 0:0.5.0+git770e6d0da0-r0.0) [version-going-backwards]
multipath-tools-0.5.0+git770e6d0da0: Package version for package multipath-=
tools-dev went backwards which would break package feeds from (0:0.5.0+gita=
ec68ab217-r0.27 to 0:0.5.0+git770e6d0da0-r0.0) [version-going-backwards]
multipath-tools-0.5.0+git770e6d0da0: Package version for package multipath-=
tools-doc went backwards which would break package feeds from (0:0.5.0+gita=
ec68ab217-r0.22 to 0:0.5.0+git770e6d0da0-r0.0) [version-going-backwards]
multipath-tools-0.5.0+git770e6d0da0: Package version for package multipath-=
tools-doc went backwards which would break package feeds from (0:0.5.0+gita=
ec68ab217-r0.27 to 0:0.5.0+git770e6d0da0-r0.0) [version-going-backwards]
multipath-tools-0.5.0+git770e6d0da0: Package version for package multipath-=
tools-locale went backwards which would break package feeds from (0:0.5.0+g=
itaec68ab217-r0.22 to 0:0.5.0+git770e6d0da0-r0.0) [version-going-backwards]
multipath-tools-0.5.0+git770e6d0da0: Package version for package multipath-=
tools-locale went backwards which would break package feeds from (0:0.5.0+g=
itaec68ab217-r0.27 to 0:0.5.0+git770e6d0da0-r0.0) [version-going-backwards]
multipath-tools-0.5.0+git770e6d0da0: Package version for package multipath-=
tools-staticdev went backwards which would break package feeds from (0:0.5.=
0+gitaec68ab217-r0.22 to 0:0.5.0+git770e6d0da0-r0.0) [version-going-backwar=
ds]
multipath-tools-0.5.0+git770e6d0da0: Package version for package multipath-=
tools-staticdev went backwards which would break package feeds from (0:0.5.=
0+gitaec68ab217-r0.27 to 0:0.5.0+git770e6d0da0-r0.0) [version-going-backwar=
ds]

--JVu9XMG6uEpKCPDY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlW6ZoMACgkQN1Ujt2V2gBwHOACfSvDqxVvVKQD1v+PZ5q00fAlr
glgAoKrXYH65SQUi7+lQwpXqE6zXPVIv
=bvLy
-----END PGP SIGNATURE-----

--JVu9XMG6uEpKCPDY--
