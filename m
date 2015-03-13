Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id AED156013D;
	Fri, 13 Mar 2015 14:07:39 +0000 (UTC)
Received: by wghn12 with SMTP id n12so23544744wgh.6;
	Fri, 13 Mar 2015 07:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=tD/sTJQwn1hGtQn7DSahBYSCreghJXV8VCdDVzBrBKM=;
	b=oyrR21uCiworFJHXHWzPwiY7LvqyX15qrIAMHjYYb/7wxetWMzIldghSu0uFCzgqdN
	utOwatZfD0i+MWuKEv1Lzkdz863Vo3FB/UQUl+xtmgj29ZgvHHUwBesKtl+diV3HAc1P
	Ei2oG5xmhCu5CvGfoivSLti1654/San6NvbUAvFIJXbT3SGNHUE2lWQ1kxDx3CEGZwxO
	otQYQ4rSEVG+KfhIsXoBrUVk2IOIqtUtaZz+bnu1xkuyyeNyn8VJQMr85nr1Wpc8Qkhw
	/astZkbwTfsjYfIrP7BEztgzdMKhxKSu+Ltzg0P6KfVjgJcLsg8QMByAm3zF7JfFJaQf
	nywA==
X-Received: by 10.180.95.97 with SMTP id dj1mr97301469wib.43.1426255660174;
	Fri, 13 Mar 2015 07:07:40 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	v13sm2956494wij.10.2015.03.13.07.07.39
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Mar 2015 07:07:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 13 Mar 2015 15:08:33 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20150313140833.GD2345@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, Failed tasks 2015-03-12
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
X-List-Received-Date: Fri, 13 Mar 2015 14:07:40 -0000
X-Groupsio-MsgNum: 63300
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kvUQC+jR9YzypDnK"
Content-Disposition: inline

--kvUQC+jR9YzypDnK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2015-03-12 =3D=3D

INFO: jenkins-job.sh-1.1.0 Complete log available at http://logs.nslu2-linu=
x.org/buildlogs/oe/world/log.report.20150313_134532.log

=3D=3D=3D common (3) =3D=3D=3D
    * /meta-openembedded/meta-networking/recipes-protocols/openflow/openflo=
w_git.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-devtools/python/python-pyopenssl_0=
=2E13.bb, do_compile
    * /meta-webos-ports/meta-luneui/recipes-luneui/luna-next/luna-next.bb, =
do_compile

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (4) =3D=3D=3D
    * /meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs_0.12.0.bb, =
do_compile
    * /meta-openembedded/meta-oe/recipes-devtools/vala-dbus-binding-tool/va=
la-dbus-binding-tool_0.4.1.bb, do_configure
    * /meta-openembedded/meta-oe/recipes-support/soci/soci_3.2.2.bb, do_pat=
ch
    * /meta-qt5/recipes-qt/examples/qt5everywheredemo_1.0.bb, do_fetch

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * /meta-smartphone/meta-fso/recipes-freesmartphone/cornucopia/libfsofra=
mework_0.12.0.bb, do_configure

=3D=3D=3D Number of failed tasks (17) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 7	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.wo=
rld.20150311_181519.log// || http://errors.yoctoproject.org:80/Errors/Build=
/5018/
|-
|| qemux86 	|| 6	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.wo=
rld.20150312_060257.log// || http://errors.yoctoproject.org:80/Errors/Build=
/5020/
|-
|| qemux86_64 	|| 4	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log=
=2Eworld.20150312_215019.log// || http://errors.yoctoproject.org:80/Errors/=
Build/5025/
|}

=3D=3D=3D PNBLACKLISTs (60) =3D=3D=3D

=3D=3D=3D QA issues (156) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
|-
||1	||libdir
|-
||18	||version-going-backwards
|-
||24	||build-deps
|-
||3	||already-stripped
|-
||47	||file-rdeps
|-
||63	||textrel
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
meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb:PNBLACKLIST[gdm] ?=3D "Depends o=
n broken polkit-gnome"
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
meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb:PNB=
LACKLIST[libimobiledevice] ?=3D "cannot run test program while cross compil=
ing"
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
meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb:PNBLACKLIST[polkit-gn=
ome] ?=3D "Fails to build, m4:configure.ac:125: recursion limit of 1024 exc=
eeded, use -L<N> to change it"
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
meta-oe/recipes-qt/qconnman/qconnman-e_git.bb:PNBLACKLIST[qconnman-e] ?=3D =
"BROKEN: doesn't work with B!=3DS, ls: cannot access *.pro: No such file or=
 directory"
meta-oe/recipes-qt/qconnman/qconnman_git.bb:PNBLACKLIST[qconnman] ?=3D "BRO=
KEN: doesn't work with B!=3DS, ls: cannot access *.pro: No such file or dir=
ectory"
meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb:PNBLACKLIST[sylpheed] ?=
=3D "BROKEN: Doesn't work with B!=3DS"
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
meta-shr/recipes-shr/3rdparty/ffalarms_git.bb:PNBLACKLIST[ffalarms] =3D "Do=
esn't build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/3rdparty/gwaterpas_0.3.bb:PNBLACKLIST[gwaterpas] ?=3D =
"broken: depends on blacklisted fltk"
meta-shr/recipes-shr/3rdparty/iliwi_git.bb:PNBLACKLIST[iliwi] =3D "Doesn't =
build after vala upgrade from 0.24.0 to 0.26.1"
meta-shr/recipes-shr/3rdparty/intone_git.bb:PNBLACKLIST[intone] =3D "rdepen=
ds on blacklisted mplayer2"
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
chromium-dbg: found library in wrong location: /usr/bin/chrome/.debug/libff=
mpegsumo.so [libdir]


count: 63	issue: textrel
chromium-38.0.2125.101: ELF binary '/tmp/work/i586-oe-linux/chromium/38.0.2=
125.101-r0/packages-split/chromium/usr/bin/chrome/libffmpegsumo.so' has rel=
ocations in .text [textrel]
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
libav-9.16: ELF binary '/python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-lin=
ux-gnueabi/python3/3.3.3-r1.0/packages-split/python3-audio/usr/lib/python3.=
3/lib-dynload/ossaudiodev.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-=
r1.0/packages-split/python3-codecs/usr/lib/python3.3/lib-dynload/_codecs_tw=
=2Ecpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-=
r1.0/packages-split/python3-core/usr/lib/python3.3/lib-dynload/binascii.cpy=
thon-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-=
r1.0/packages-split/python3-crypt/usr/lib/python3.3/lib-dynload/_sha256.cpy=
thon-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-=
r1.0/packages-split/python3-ctypes/usr/lib/python3.3/lib-dynload/_ctypes_te=
st.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-=
r1.0/packages-split/python3-curses/usr/lib/python3.3/lib-dynload/_curses.cp=
ython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-=
r1.0/packages-split/python3-elementtree/usr/lib/python3.3/lib-dynload/_elem=
enttree.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-=
r1.0/packages-split/python3-fcntl/usr/lib/python3.3/lib-dynload/fcntl.cpyth=
on-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-=
r1.0/packages-split/python3-gdbm/usr/lib/python3.3/lib-dynload/_gdbm.cpytho=
n-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-=
r1.0/packages-split/python3-io/usr/lib/python3.3/lib-dynload/_socket.cpytho=
n-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-=
r1.0/packages-split/python3-json/usr/lib/python3.3/lib-dynload/_json.cpytho=
n-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-=
r1.0/packages-split/python3-lang/usr/lib/python3.3/lib-dynload/_bisect.cpyt=
hon-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-=
r1.0/packages-split/python3-math/usr/lib/python3.3/lib-dynload/cmath.cpytho=
n-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-=
r1.0/packages-split/python3-misc/usr/lib/python3.3/lib-dynload/_posixsubpro=
cess.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-=
r1.0/packages-split/python3-mmap/usr/lib/python3.3/lib-dynload/mmap.cpython=
-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-=
r1.0/packages-split/python3-multiprocessing/usr/lib/python3.3/lib-dynload/_=
multiprocessing.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-=
r1.0/packages-split/python3-profile/usr/lib/python3.3/lib-dynload/_lsprof.c=
python-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-=
r1.0/packages-split/python3-readline/usr/lib/python3.3/lib-dynload/readline=
=2Ecpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-=
r1.0/packages-split/python3-resource/usr/lib/python3.3/lib-dynload/resource=
=2Ecpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-=
r1.0/packages-split/python3-syslog/usr/lib/python3.3/lib-dynload/syslog.cpy=
thon-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-=
r1.0/packages-split/python3-textutils/usr/lib/python3.3/lib-dynload/_csv.cp=
ython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-=
r1.0/packages-split/python3-unixadmin/usr/lib/python3.3/lib-dynload/grp.cpy=
thon-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.3-=
r1.0/packages-split/python3-xml/usr/lib/python3.3/lib-dynload/pyexpat.cpyth=
on-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packa=
ges-split/python3-audio/usr/lib/python3.3/lib-dynload/ossaudiodev.cpython-3=
3m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packa=
ges-split/python3-codecs/usr/lib/python3.3/lib-dynload/_codecs_cn.cpython-3=
3m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packa=
ges-split/python3-core/usr/lib/python3.3/lib-dynload/binascii.cpython-33m.s=
o' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packa=
ges-split/python3-crypt/usr/lib/python3.3/lib-dynload/_sha256.cpython-33m.s=
o' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packa=
ges-split/python3-ctypes/usr/lib/python3.3/lib-dynload/_ctypes_test.cpython=
-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packa=
ges-split/python3-curses/usr/lib/python3.3/lib-dynload/_curses.cpython-33m.=
so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packa=
ges-split/python3-elementtree/usr/lib/python3.3/lib-dynload/_elementtree.cp=
ython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packa=
ges-split/python3-fcntl/usr/lib/python3.3/lib-dynload/fcntl.cpython-33m.so'=
 has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packa=
ges-split/python3-gdbm/usr/lib/python3.3/lib-dynload/_gdbm.cpython-33m.so' =
has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packa=
ges-split/python3-io/usr/lib/python3.3/lib-dynload/_socket.cpython-33m.so' =
has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packa=
ges-split/python3-json/usr/lib/python3.3/lib-dynload/_json.cpython-33m.so' =
has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packa=
ges-split/python3-lang/usr/lib/python3.3/lib-dynload/_bisect.cpython-33m.so=
' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packa=
ges-split/python3-math/usr/lib/python3.3/lib-dynload/cmath.cpython-33m.so' =
has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packa=
ges-split/python3-misc/usr/lib/python3.3/lib-dynload/_md5.cpython-33m.so' h=
as relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packa=
ges-split/python3-mmap/usr/lib/python3.3/lib-dynload/mmap.cpython-33m.so' h=
as relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packa=
ges-split/python3-multiprocessing/usr/lib/python3.3/lib-dynload/_multiproce=
ssing.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packa=
ges-split/python3-profile/usr/lib/python3.3/lib-dynload/_lsprof.cpython-33m=
=2Eso' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packa=
ges-split/python3-readline/usr/lib/python3.3/lib-dynload/readline.cpython-3=
3m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packa=
ges-split/python3-resource/usr/lib/python3.3/lib-dynload/resource.cpython-3=
3m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packa=
ges-split/python3-syslog/usr/lib/python3.3/lib-dynload/syslog.cpython-33m.s=
o' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packa=
ges-split/python3-textutils/usr/lib/python3.3/lib-dynload/_csv.cpython-33m.=
so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packa=
ges-split/python3-unixadmin/usr/lib/python3.3/lib-dynload/grp.cpython-33m.s=
o' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/packa=
ges-split/python3-xml/usr/lib/python3.3/lib-dynload/pyexpat.cpython-33m.so'=
 has relocations in .text [textrel]
qtwebengine-5.4.1: ELF binary '/tmp/work/i586-oe-linux/qtwebengine/5.4.1-r0=
/packages-split/qtwebengine-plugins/usr/lib/qt5/plugins/qtwebengine/libffmp=
egsumo.so' has relocations in .text [textrel]
webkit-efl-1.11.0: ELF binary '/tmp/work/i586-oe-linux/webkit-efl/1_1.11.0-=
r0/packages-split/webkit-efl/usr/lib/libjavascriptcore_efl.so.1.11.0' has r=
elocations in .text [textrel]
webkit-gtk-1.8.3: ELF binary '/tmp/work/i586-oe-linux/webkit-gtk/1.8.3-r1/p=
ackages-split/libjavascriptcore/usr/lib/libjavascriptcoregtk-1.0.so.0.13.4'=
 has relocations in .text [textrel]


count: 24	issue: build-deps
exquisite-0.0.1+svnr82070: exquisite rdepends on initscripts-functions, but=
 it isn't a build dependency? [build-deps]
fio-2.2.6: fio rdepends on numactl, but it isn't a build dependency? [build=
-deps]
fio-2.2.6: fio rdepends on zlib, but it isn't a build dependency? [build-de=
ps]
geoclue-2.0.0: geoclue rdepends on geoip, but it isn't a build dependency? =
[build-deps]
glade3-3.8.5: glade3 rdepends on libpython2, but it isn't a build dependenc=
y? [build-deps]
gpm-1.99.7: gpm rdepends on initscripts-functions, but it isn't a build dep=
endency? [build-deps]
grub-efi-2.00: grub-efi rdepends on fuse, but it isn't a build dependency? =
[build-deps]
irda-utils-0.9.18: irda-utils rdepends on initscripts-functions, but it isn=
't a build dependency? [build-deps]
libwebp-0.4.0: libwebp-bin rdepends on libgl-mesa, but it isn't a build dep=
endency? [build-deps]
libwebp-0.4.0: libwebp-bin rdepends on mesa-glut, but it isn't a build depe=
ndency? [build-deps]
lirc-0.9.2: lirc rdepends on libx11, but it isn't a build dependency? [buil=
d-deps]
lirc-0.9.2: lirc-plugins rdepends on libjack, but it isn't a build dependen=
cy? [build-deps]
lirc-0.9.2: lirc-plugins rdepends on libusb-compat, but it isn't a build de=
pendency? [build-deps]
lirc-0.9.2: lirc-plugins rdepends on portaudio-v19, but it isn't a build de=
pendency? [build-deps]
mpd-0.19.1: mpd rdepends on libsmbclient, but it isn't a build dependency? =
[build-deps]
netkit-rwho-0.17: netkit-rwho-client rdepends on initscripts-functions, but=
 it isn't a build dependency? [build-deps]
pkcs11-helper-1.11: pkcs11-helper rdepends on nspr, but it isn't a build de=
pendency? [build-deps]
pkcs11-helper-1.11: pkcs11-helper rdepends on nss, but it isn't a build dep=
endency? [build-deps]
qt5-creator-3.3.1: qt5-creator rdepends on qt-creator, but it isn't a build=
 dependency? [build-deps]
sox-14.4.0: sox rdepends on libflac, but it isn't a build dependency? [buil=
d-deps]
squid-3.4.7: squid rdepends on libpam, but it isn't a build dependency? [bu=
ild-deps]
sysklogd-1.5.1: sysklogd rdepends on initscripts-functions, but it isn't a =
build dependency? [build-deps]
vlc-2.1.4: vlc rdepends on libsamplerate0, but it isn't a build dependency?=
 [build-deps]
ypbind-mt-1.38: ypbind-mt rdepends on libsystemde-rdeps]
dvb-apps-1.1.1: dvb-apps requires libucsi.so, libdvben50221.so, libdvbsec.s=
o, libdvbcfg.so, libdvbapi.so, but no providers in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: dvb-femon requires libdvbapi.so()(64bit), but no providers =
in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: dvb-femon requires libdvbapi.so, but no providers in its RD=
EPENDS [file-rdeps]
dvb-apps-1.1.1: dvb-scan requires libdvbsec.so()(64bit), libdvbapi.so()(64b=
it), libdvbcfg.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: dvb-scan requires libdvbsec.so, libdvbcfg.so, libdvbapi.so,=
 but no providers in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: dvbdate requires libucsi.so()(64bit), libdvbapi.so()(64bit)=
, but no providers in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: dvbdate requires libucsi.so, libdvbapi.so, but no providers=
 in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: dvbnet requires libdvbapi.so()(64bit), but no providers in =
its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: dvbnet requires libdvbapi.so, but no providers in its RDEPE=
NDS [file-rdeps]
dvb-apps-1.1.1: dvbtraffic requires libdvbapi.so()(64bit), but no providers=
 in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: dvbtraffic requires libdvbapi.so, but no providers in its R=
DEPENDS [file-rdeps]
fakeroot-1.18.4: fakeroot requires /bin/bash, but no providers in its RDEPE=
NDS [file-rdeps]
fbida-2.09+gitAUTOINC+6aa5563cb3: fbida requires /bin/bash, but no provider=
s in its RDEPENDS [file-rdeps]
foxtrotgps-1.1.1: foxtrotgps requires /usr/bin/python, /usr/bin/perl, but n=
o providers in its RDEPENDS [file-rdeps]
gammu-1.32.0: gammu requires /bin/bash, but no providers in its RDEPENDS [f=
ile-rdeps]
gammu-1.32.0: gammu-dev requires /bin/bash, but no providers in its RDEPEND=
S [file-rdeps]
gnome-desktop-2.32.1: gnome-desktop requires /usr/bin/python, but no provid=
ers in its RDEPENDS [file-rdeps]
gnome-panel-2.32.1: gnome-panel requires /usr/bin/python, but no providers =
in its RDEPENDS [file-rdeps]
groff-1.22.2: groff requires /bin/sed, but no providers in its RDEPENDS [fi=
le-rdeps]
gupnp-0.20.12: gupnp-dev requires /usr/bin/python, but no providers in its =
RDEPENDS [file-rdeps]
hplip-3.12.6: hplip-filter requires /usr/bin/perl, but no providers in its =
RDEPENDS [file-rdeps]
ipvsadm-1.26: ipvsadm requires /bin/bash, but no providers in its RDEPENDS =
[file-rdeps]
libbonobo-2.32.1: libbonobo requires /usr/bin/perl, but no providers in its=
 RDEPENDS [file-rdeps]
libnewt-0.52.18: whiptail requires libnewt.so()(64bit), but no providers in=
 its RDEPENDS [file-rdeps]
libnewt-0.52.18: whiptail requires libnewt.so, but no providers in its RDEP=
ENDS [file-rdeps]
libnewt-python-0.52.18: libnewt-python requires libnewt.so()(64bit), but no=
 providers in its RDEPENDS [file-rdeps]
libnewt-python-0.52.18: libnewt-python requires libnewt.so, but no provider=
s in its RDEPENDS [file-rdeps]
lio-utils-4.1+gitAUTOINC+28bd928655: lio-utils requires /bin/bash, but no p=
roviders in its RDEPENDS [file-rdeps]
lirc-0.9.2: lirc requires /bin/bash, but no providers in its RDEPENDS [file=
-rdeps]
lmsensors-config-1.0: lmsensors-config-cgi requires /usr/bin/rrdcgi, but no=
 providers in its RDEPENDS [file-rdeps]
numptyphysics-0.2+svnr109: numptyphysics requires /bin/bash, /usr/bin/perl,=
 but no providers in its RDEPENDS [file-rdeps]
opensaf-4.5.0: opensaf requires /bin/bash, /usr/bin/python, but no provider=
s in its RDEPENDS [file-rdeps]
packagekit-0.5.6: packagekit requires /bin/bash, but no providers in its RD=
EPENDS [file-rdeps]
pcsc-lite-1.8.6: pcsc-lite requires /usr/bin/python, but no providers in it=
s RDEPENDS [file-rdeps]
perf-1.0: perf ker-0.14.2: tracker-nautilus-extension requires libnautilus-=
extension.so.1()(64bit), but no providers in its RDEPENDS [file-rdeps]
tracker-0.14.2: tracker-nautilus-extension requires libnautilus-extension.s=
o.1, but no providers in its RDEPENDS [file-rdeps]
ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: ubx-utils requires /bin/bash, but n=
o providers in its RDEPENDS [file-rdeps]
unionfs-fuse-0.26: unionfs-fuse requires /bin/bash, but no providers in its=
 RDEPENDS [file-rdeps]
usbpath-0.0+svnr3172: usbpath requires /usr/bin/perl, but no providers in i=
ts RDEPENDS [file-rdeps]
wvstreams-4.6.1: wvstreams requires /usr/bin/perl, but no providers in its =
RDEPENDS [file-rdeps]


count: 18	issue: version-going-backwards
libgee-0.6.4: Package version for package libgee went backwards which would=
 break package feeds from (1:0.16.1-r0.0 to 1:0.6.4-r6.2.40) [version-going=
-backwards]
libgee-0.6.4: Package version for package libgee went backwards which would=
 break package feeds from (1:0.16.1-r0.0 to 1:0.6.4-r6.2.41) [version-going=
-backwards]
libgee-0.6.4: Package version for package libgee-dbg went backwards which w=
ould break package feeds from (1:0.16.1-r0.0 to 1:0.6.4-r6.2.40) [version-g=
oing-backwards]
libgee-0.6.4: Package version for package libgee-dbg went backwards which w=
ould break package feeds from (1:0.16.1-r0.0 to 1:0.6.4-r6.2.41) [version-g=
oing-backwards]
libgee-0.6.4: Package version for package libgee-dev went backwards which w=
ould break package feeds from (1:0.16.1-r0.0 to 1:0.6.4-r6.2.40) [version-g=
oing-backwards]
libgee-0.6.4: Package version for package libgee-dev went backwards which w=
ould break package feeds from (1:0.16.1-r0.0 to 1:0.6.4-r6.2.41) [version-g=
oing-backwards]
libgee-0.6.4: Package version for package libgee-doc went backwards which w=
ould break package feeds from (1:0.16.1-r0.0 to 1:0.6.4-r6.2.40) [version-g=
oing-backwards]
libgee-0.6.4: Package version for package libgee-doc went backwards which w=
ould break package feeds from (1:0.16.1-r0.0 to 1:0.6.4-r6.2.41) [version-g=
oing-backwards]
libgee-0.6.4: Package version for package libgee-locale went backwards whic=
h would break package feeds from (1:0.16.1-r0.0 to 1:0.6.4-r6.2.40) [versio=
n-going-backwards]
libgee-0.6.4: Package version for package libgee-locale went backwards whic=
h would break package feeds from (1:0.16.1-r0.0 to 1:0.6.4-r6.2.41) [versio=
n-going-backwards]
libgee-0.6.4: Package version for package libgee-staticdev went backwards w=
hich would break package feeds from (1:0.16.1-r0.0 to 1:0.6.4-r6.2.40) [ver=
sion-going-backwards]
libgee-0.6.4: Package version for package libgee-staticdev went backwards w=
hich would break package feeds from (1:0.16.1-r0.0 to 1:0.6.4-r6.2.41) [ver=
sion-going-backwards]
vala-dbus-binding-tool-0.4.0: Package version for package vala-dbus-binding=
-tool went backwards which would break package feeds from (1:0.4.1-r0.0 to =
1:0.4.0-r0.40) [version-going-backwards]
vala-dbus-binding-tool-0.4.0: Package version for package vala-dbus-binding=
-tool-dbg went backwards which would break package feeds from (1:0.4.1-r0.0=
 to 1:0.4.0-r0.40) [version-going-backwards]
vala-dbus-binding-tool-0.4.0: Package version for package vala-dbus-binding=
-tool-dev went backwards which would break package feeds from (1:0.4.1-r0.0=
 to 1:0.4.0-r0.40) [version-going-backwards]
vala-dbus-binding-tool-0.4.0: Package version for package vala-dbus-binding=
-tool-doc went backwards which would break package feeds from (1:0.4.1-r0.0=
 to 1:0.4.0-r0.40) [version-going-backwards]
vala-dbus-binding-tool-0.4.0: Package version for package vala-dbus-binding=
-tool-locale went backwards which would break package feeds from (1:0.4.1-r=
0.0 to 1:0.4.0-r0.40) [version-going-backwards]
vala-dbus-binding-tool-0.4.0: Package version for package vala-dbus-binding=
-tool-staticdev went backwards which would break package feeds from (1:0.4.=
1-r0.0 to 1:0.4.0-r0.40) [version-going-backwards]

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--kvUQC+jR9YzypDnK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUC72EACgkQN1Ujt2V2gBwhSACgtNIQTztnqxbvSqM0FRJDxmia
OXMAn2djoqwkFknj+AFxML/6c2rsoUH0
=Wg6C
-----END PGP SIGNATURE-----

--kvUQC+jR9YzypDnK--
