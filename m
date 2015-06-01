Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id CA9C1755F5;
	Mon,  1 Jun 2015 09:53:21 +0000 (UTC)
Received: by wibdq8 with SMTP id dq8so23634818wib.1;
	Mon, 01 Jun 2015 02:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:content-transfer-encoding:user-agent;
	bh=18bUNoATEU1Ujlyg922ldu59OQFuclLAkTkn68O88Ls=;
	b=S/6b4MZmnfa2sLOWTXeVnAvxgMLoWfzVis/vhlN3OL/ZmWvh9pM3q6qzV7bpf3/bNx
	bIR4hlKfuyy/N9o8jteEzi+ShmMUYe0nOFwfJvhgYPESWWKXPqIgPovRH8nbV2EJgNGl
	SYCDkDT9JNI5GWk8bF8B1ngNF49pEt31wm0ljwY3qHvu6NkZyFWhHsFaYgZcOzWswJSn
	BUEYBeTa943g/2nxwodGIVt8fHQNoPopQTWi1v7Ci0Z+ad7BT8gNCSdWu8h6uT2Fqfm6
	NrD2vPOgHE3VnRqHw4kERmd9ekzXwBvrmE2rA7M6iO9Gx5yVs+/e9+3ltK+A/vl0jBwb
	g6Ug==
X-Received: by 10.194.186.198 with SMTP id fm6mr15557906wjc.101.1433152400827; 
	Mon, 01 Jun 2015 02:53:20 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id fh6sm15848685wic.5.2015.06.01.02.53.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Jun 2015 02:53:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 1 Jun 2015 11:53:23 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20150601095323.GA2375@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, Failed tasks 2015-05-31
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
X-List-Received-Date: Mon, 01 Jun 2015 09:53:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2015-05-31 =3D=3D

INFO: jenkins-job.sh-1.3.1 Complete log available at http://logs.nslu2-linu=
x.org/buildlogs/oe/world/log.report.20150601_042951.log

=3D=3D=3D common (8) =3D=3D=3D
    * /meta-openembedded/meta-efl/recipes-efl/efl/epdf_svn.bb, do_compile
    * /meta-openembedded/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.=
1.bb, do_unpack
    * /meta-openembedded/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_=
git.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-support/vim/vim-tiny_7.4.481.bb, d=
o_unpack
    * /meta-openembedded/meta-oe/recipes-support/vim/vim_7.4.481.bb, do_unp=
ack
    * /meta-qt5/recipes-qt/qt5/qtdeclarative_git.bb, do_compile
    * /meta-qt5/recipes-qt/tufao/tufao_1.2.1.bb, do_configure
    * /meta-webos-ports/meta-luneui/recipes-webos/luna-sysmgr-common/luna-s=
ysmgr-common.bb, do_configure

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (4) =3D=3D=3D
    * /meta-openembedded/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.b=
b, do_compile
    * /meta-openembedded/meta-oe/recipes-extended/tiptop/tiptop_2.2.bb, do_=
compile
    * /meta-openembedded/meta-oe/recipes-support/poppler/poppler-data_0.4.7=
=2Ebb, do_fetch
    * /meta-openembedded/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-s=
creenshooter_1.8.2.bb, do_compile

=3D=3D=3D qemux86 (1) =3D=3D=3D
    * /meta-browser/recipes-browser/chromium/cef3_280796.bb, do_package_qa

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * /meta-browser/recipes-browser/chromium/cef3_280796.bb, do_configure

=3D=3D=3D Number of failed tasks (30) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 12	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.w=
orld.20150529_125047.log// || http://errors.yoctoproject.org:80/Errors/Buil=
d/6227/
|-
|| qemux86 	|| 9	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.wo=
rld.20150530_104959.log// || http://errors.yoctoproject.org:80/Errors/Build=
/6270/
|-
|| qemux86_64 	|| 9	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log=
=2Eworld.20150531_075837.log// || http://errors.yoctoproject.org:80/Errors/=
Build/6321/
|}

=3D=3D=3D PNBLACKLISTs (68) =3D=3D=3D

=3D=3D=3D QA issues (106) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
|-
||1	||libdir
|-
||18	||file-rdeps
|-
||19	||build-deps
|-
||3	||already-stripped
|-
||59	||textrel
|-
||6	||version-going-backwards
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
meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.2.bb:PNBLACKLIST[ifuse=
] ?=3D "depends on blacklisted libimobiledevice"
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
meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb:PNB=
LACKLIST[libimobiledevice] ?=3D "cannot run test program while cross compil=
ing"
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


count: 1	issue: libdir
cef3: found library in wrong location: /usr/bin/lib/.debug/libcef.so [libdi=
r]


count: 59	issue: textrel
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
libav-9.16: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/libav/9.16-r0/pac=
kages-split/libavcodec/usr/lib/libavcodec.so.54.35.0' has relocations in .t=
ext [textrel]
libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-spli=
t/libavcodec/usr/lib/libavcodec.so.54.35.0' has relocations in .text [textr=
el]
libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-spli=
t/libavdevice/usr/lib/libavdevice.so.53.2.0' has relocations in .text [text=
rel]
libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-spli=
t/libavfilter/usr/lib/libavfilter.so.3.3.0' has relocations in .text [textr=
el]
libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-spli=
t/libavformat/usr/lib/libavformat.so.54.20.4' has relocations in .text [tex=
trel]
libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-spli=
t/libavresample/usr/lib/libavresample.so.1.0.1' has relocations in .text [t=
extrel]
libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-spli=
t/libavutil/usr/lib/libavutil.so.52.3.0' has relocations in .text [textrel]
libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-spli=
t/libswscale/usr/lib/libswscale.so.2.1.1' has relocations in .text [textrel]
libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary '/tmp/work/armv5te-oe-=
linux-gnueabi/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split/li=
bpostproc/usr/lib/libpostproc.so.52.3.0' has relocations in .text [textrel]
libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary '/tmp/work/i586-oe-lin=
ux/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split/libpostproc/u=
sr/lib/libpostproc.so.52.3.0' has relocations in .text [textrel]
mpg123-1.21.0: ELF binary '/tmp/work/i586-oe-linux/mpg123/1.21.0-r0/package=
s-split/mpg123/usr/lib/libmpg123.so.0.40.3' has relocations in .text [textr=
el]
python3-3.4.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.4.3=
-r1.0/packages-split/python3-audio/usr/lib/python3.4/lib-dynload/ossaudiode=
v.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.4.3=
-r1.0/packages-split/python3-codecs/usr/lib/python3.4/lib-dynload/_codecs_t=
w.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.4.3=
-r1.0/packages-split/python3-core/usr/lib/python3.4/lib-dynload/binascii.cp=
ython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.4.3=
-r1.0/packages-split/python3-crypt/usr/lib/python3.4/lib-dynload/_sha256.cp=
ython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.4.3=
-r1.0/packages-split/python3-ctypes/usr/lib/python3.4/lib-dynload/_ctypes_t=
est.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.4.3=
-r1.0/packages-split/python3-curses/usr/lib/python3.4/lib-dynload/_curses.c=
python-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.4.3=
-r1.0/packages-split/python3-elementtree/usr/lib/python3.4/lib-dynload/_ele=
menttree.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.4.3=
-r1.0/packages-split/python3-fcntl/usr/lib/python3.4/lib-dynload/fcntl.cpyt=
hon-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.4.3=
-r1.0/packages-split/python3-io/usr/lib/python3.4/lib-dynload/_socket.cpyth=
on-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.4.3=
-r1.0/packages-split/python3-json/usr/lib/python3.4/lib-dynload/_json.cpyth=
on-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.4.3=
-r1.0/packages-split/python3-lang/usr/lib/python3.4/lib-dynload/_bisect.cpy=
thon-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.4.3=
-r1.0/packages-split/python3-math/usr/lib/python3.4/lib-dynload/cmath.cpyth=
on-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.4.3=
-r1.0/packages-split/python3-misc/usr/lib/python3.4/lib-dynload/_opcode.cpy=
thon-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.4.3=
-r1.0/packages-split/python3-mmap/usr/lib/python3.4/lib-dynload/mmap.cpytho=
n-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.4.3=
-r1.0/packages-split/python3-multiprocessing/usr/lib/python3.4/lib-dynload/=
_multiprocessing.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.4.3=
-r1.0/packages-split/python3-profile/usr/lib/python3.4/lib-dynload/_lsprof.=
cpython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.4.3=
-r1.0/packages-split/python3-resource/usr/lib/python3.4/lib-dynload/resourc=
e.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.4.3=
-r1.0/packages-split/python3-syslog/usr/lib/python3.4/lib-dynload/syslog.cp=
ython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.4.3=
-r1.0/packages-split/python3-textutils/usr/lib/python3.4/lib-dynload/_csv.c=
python-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.4.3=
-r1.0/packages-split/python3-unixadmin/usr/lib/python3.4/lib-dynload/grp.cp=
ython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.4.3=
-r1.0/packages-split/python3-xml/usr/lib/python3.4/lib-dynload/pyexpat.cpyt=
hon-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.4.3-r1.0/packa=
ges-split/python3-audio/usr/lib/python3.4/lib-dynload/ossaudiodev.cpython-3=
4m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.4.3-r1.0/packa=
ges-split/python3-codecs/usr/lib/python3.4/lib-dynload/_codecs_iso2022.cpyt=
hon-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.4.3-r1.0/packa=
ges-split/python3-core/usr/lib/python3.4/lib-dynload/binascii.cpython-34m.s=
o' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.4.3-r1.0/packa=
ges-split/python3-crypt/usr/lib/python3.4/lib-dynload/_sha256.cpython-34m.s=
o' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.4.3-r1.0/packa=
ges-split/python3-ctypes/usr/lib/python3.4/lib-dynload/_ctypes.cpython-34m.=
so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.4.3-r1.0/packa=
ges-split/python3-curses/usr/lib/python3.4/lib-dynload/_curses.cpython-34m.=
so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.4.3-r1.0/packa=
ges-split/python3-elementtree/usr/lib/python3.4/lib-dynload/_elementtree.cp=
ython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.4.3-r1.0/packa=
ges-split/python3-fcntl/usr/lib/python3.4/lib-dynload/fcntl.cpython-34m.so'=
 has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.4.3-r1.0/packa=
ges-split/python3-io/usr/lib/python3.4/lib-dynload/_socket.cpython-34m.so' =
has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.4.3-r1.0/packa=
ges-split/python3-json/usr/lib/python3.4/lib-dynload/_json.cpython-34m.so' =
has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.4.3-r1.0/packa=
ges-split/python3-lang/usr/lib/python3.4/lib-dynload/_bisect.cpython-34m.so=
' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.4.3-r1.0/packa=
ges-split/python3-math/usr/lib/python3.4/lib-dynload/cmath.cpython-34m.so' =
has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.4.3-r1.0/packa=
ges-split/python3-misc/usr/lib/python3.4/lib-dynload/xxlimited.cpython-34m.=
so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.4.3-r1.0/packa=
ges-split/python3-mmap/usr/lib/python3.4/lib-dynload/mmap.cpython-34m.so' h=
as relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.4.3-r1.0/packa=
ges-split/python3-multiprocessing/usr/lib/python3.4/lib-dynload/_multiproce=
ssing.cpython-34m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.4.3-r1.0/packa=
ges-split/python3-profile/usr/lib/python3.4/lib-dynload/_lsprof.cpython-34m=
=2Eso' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.4.3-r1.0/packa=
ges-split/python3-resource/usr/lib/python3.4/lib-dynload/resource.cpython-3=
4m.so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.4.3-r1.0/packa=
ges-split/python3-syslog/usr/lib/python3.4/lib-dynload/syslog.cpython-34m.s=
o' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.4.3-r1.0/packa=
ges-split/python3-textutils/usr/lib/python3.4/lib-dynload/_csv.cpython-34m.=
so' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.4.3-r1.0/packa=
ges-split/python3-unixadmin/usr/lib/python3.4/lib-dynload/grp.cpython-34m.s=
o' has relocations in .text [textrel]
python3-3.4.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.4.3-r1.0/packa=
ges-split/python3-xml/usr/lib/python3.4/lib-dynload/pyexpat.cpython-34m.so'=
 has relocations in .text [textrel]
webkit-efl-1.11.0: ELF binary '/tmp/work/i586-oe-linux/webkit-efl/1_1.11.0-=
r0/packages-split/webkit-efl/usr/lib/libjavascriptcore_efl.so.1.11.0' has r=
elocations in .text [textrel]
webkit-gtk-1.8.3: ELF binary '/tmp/work/i586-oe-linux/webkit-gtk/1.8.3-r1/p=
ackages-split/libjavascriptcore/usr/lib/libjavascriptcoregtk-1.0.so.0.13.4'=
 has relocations in .text [textrel]


count: 19	issue: build-deps
exquisite-0.0.1+svnr82070: exquisite rdepends on initscripts-functions, but=
 it isn't a build dependency? [build-deps]
geoclue-2.0.0: geoclue rdepends on geoip, but it isn't a build dependency? =
[build-deps]
gpm-1.99.7: gpm rdepends on initscripts-functions, but it isn't a build dep=
endency? [build-deps]
irda-utils-0.9.18: irda-utils rdepends on initscripts-functions, but it isn=
't a build dependency? [build-deps]
libwebp-0.4.0: libwebp-bin rdepends on libgl-mesa, but it isn't a build dep=
endency? [build-deps]
libwebp-0.4.0: libwebp-bin rdepends on mesa-glut, but it isn't a build depe=
ndency? [build-deps]
netkit-rwho-0.17: netkit-rwho-client rdepends on initscripts-functions, but=
 it isn't a build dependency? [build-deps]
pinpoint-0.1.4+gitrAUTOINC+80a056c57e: pinpoint rdepends on librsvg, but it=
 isn't a build dependency? [build-deps]
qt-mobility-embedded-1.2.0: qt-mobility-embedded rdepends on libgstapp-0.10=
, but it isn't a build dependency? [build-deps]
qt-mobility-embedded-1.2.0: qt-mobility-embedded rdepends on libgstvideo-0.=
10, but it isn't a build dependency? [build-deps]
qt-mobility-x11-1.2.0: qt-mobility-x11 rdepends on libgstapp-0.10, but it i=
sn't a build dependency? [build-deps]
qt-mobility-x11-1.2.0: qt-mobility-x11 rdepends on libgstinterfaces-0.10, b=
ut it isn't a build dependency? [build-deps]
qt-mobility-x11-1.2.0: qt-mobility-x11 rdepends on libgstvideo-0.10, but it=
 isn't a build dependency? d_gnome-panel contained in package gnome-panel r=
equires /usr/bin/python, but no providers found in its RDEPENDS [file-rdeps]
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
numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert.pl_numptyphysic=
s contained in package numptyphysics requires /usr/bin/perl, but no provide=
rs found in its RDEPENDS [file-rdeps]
numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert@underscore@all.=
sh_numptyphysics contained in package numptyphysics requires /bin/bash, but=
 no providers found in its RDEPENDS [file-rdeps]
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
unionfs-fuse-0.26: /usr/sbin/mount.unionfs_unionfs-fuse contained in packag=
e unionfs-fuse requires /bin/bash, but no providers found in its RDEPENDS [=
file-rdeps]


count: 6	issue: version-going-backwards
tree-1.7.0: Package version for package tree went backwards which would bre=
ak package feeds from (0:1.7.0-r0.1 to 0:1.7.0-r0.0) [version-going-backwar=
ds]
tree-1.7.0: Package version for package tree-dbg went backwards which would=
 break package feeds from (0:1.7.0-r0.1 to 0:1.7.0-r0.0) [version-going-bac=
kwards]
tree-1.7.0: Package version for package tree-dev went backwards which would=
 break package feeds from (0:1.7.0-r0.1 to 0:1.7.0-r0.0) [version-going-bac=
kwards]
tree-1.7.0: Package version for package tree-doc went backwards which would=
 break package feeds from (0:1.7.0-r0.1 to 0:1.7.0-r0.0) [version-going-bac=
kwards]
tree-1.7.0: Package version for package tree-locale went backwards which wo=
uld break package feeds from (0:1.7.0-r0.1 to 0:1.7.0-r0.0) [version-going-=
backwards]
tree-1.7.0: Package version for package tree-staticdev went backwards which=
 would break package feeds from (0:1.7.0-r0.1 to 0:1.7.0-r0.0) [version-goi=
ng-backwards]

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

