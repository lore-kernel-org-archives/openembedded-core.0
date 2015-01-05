Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 32B0565D27;
	Mon,  5 Jan 2015 12:02:27 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id x13so27605207wgg.33;
	Mon, 05 Jan 2015 04:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=zSkoVYWw3mmuGnv2q0g4vXjP0KW89JzzojC77bh1MpQ=;
	b=EeIZR4fIAr0U1mmGG9040aAx7QZlk+m743IYCvUdwJknOReImBXjpk6uctqnSMWAln
	CqaQTPLOeqmStqc9jBpVoBBsQ9g2zUM+w6MP7hNMGbPohQZ08D2Cb15lzxiEJEwYMIOi
	l2P62ww5/RhqtzeaN9Ix1LDUgkMIbPRUlyYEC+rql8xrsbG4HbI73QiEENFRUH+t1pzp
	aHeUvm1yNpVEFWvvLP2O7TAdDnJ7y3ZHj+mbEkbYZ+X04uo+D167Ow3vgnF151q1wRTg
	jECsyf8eKoj9NY1YQnT41g/wadFzLlodnZk4nK1FMARbZh8AbR4Ex5wD7Maez9cyyJ4B
	InEQ==
X-Received: by 10.180.218.39 with SMTP id pd7mr25172212wic.21.1420459348070;
	Mon, 05 Jan 2015 04:02:28 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	cg8sm73034994wjc.1.2015.01.05.04.02.26
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Jan 2015 04:02:27 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 5 Jan 2015 13:02:28 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20150105120228.GG2484@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, Failed tasks 2015-01-02
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
X-List-Received-Date: Mon, 05 Jan 2015 12:02:37 -0000
X-Groupsio-MsgNum: 60991
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oyqLL/JqMvClXZi1"
Content-Disposition: inline

--oyqLL/JqMvClXZi1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2015-01-02 =3D=3D

INFO: jenkins-job.sh-1.1.0 Complete log available at http://logs.nslu2-linu=
x.org/buildlogs/oe/world/log.report.20150103_191306.log

=3D=3D=3D common (9) =3D=3D=3D
    * /meta-openembedded/meta-networking/recipes-protocols/openwsman/openws=
man_2.4.12.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-graphics/xorg-font/font-adobe-100d=
pi_1.0.3.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-graphics/xorg-font/font-adobe-utop=
ia-100dpi_1.0.4.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_=
1.0.3.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-graphics/xorg-font/font-bh-lucidat=
ypewriter-100dpi_1.0.3.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-graphics/xorg-font/font-misc-misc_=
1.1.2.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-support/libutempter/libutempter_1.=
1.6.bb, do_compile
    * /meta-openembedded/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.=
bb, do_configure
    * /meta-qt5/recipes-qt/examples/qt5-opengles2-test_git.bb, do_compile

=3D=3D=3D common-x86 (1) =3D=3D=3D
    * /meta-openembedded/meta-initramfs/recipes-kernel/linux/linux-yocto-ti=
ny-kexecboot_3.17.bb, do_compile

=3D=3D=3D qemuarm (0) =3D=3D=3D

=3D=3D=3D qemux86 (2) =3D=3D=3D
    * /meta-openembedded/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.=
bb, do_compile
    * /meta-openembedded/meta-networking/recipes-support/strongswan/strongs=
wan_5.2.1.bb, do_compile

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * /openembedded-core/meta/recipes-kernel/perf/perf.bb, do_compile

=3D=3D=3D Number of failed tasks (32) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 9	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.wo=
rld.20150101_135802.log// || http://errors.yoctoproject.org:80/Errors/Searc=
h/1/3895/
|-
|| qemux86 	|| 12	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.w=
orld.20150102_045847.log// || http://errors.yoctoproject.org:80/Errors/Sear=
ch/1/3911/
|-
|| qemux86_64 	|| 11	 || http://logs.nslu2-linux.org/buildlogs/oe/world//lo=
g.world.20150102_213600.log// || http://errors.yoctoproject.org:80/Errors/S=
earch/1/3912/
|}

=3D=3D=3D PNBLACKLISTs (52) =3D=3D=3D

=3D=3D=3D QA issues (216) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
|-
||1	||libdir
|-
||118	||version-going-backwards
|-
||17	||textrel
|-
||21	||build-deps
|-
||3	||already-stripped
|-
||56	||file-rdeps
|}


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.2.bb:PNBLACKLIST[ifuse=
] ?=3D "depends on blacklisted libimobiledevice"
meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLACKLIST[gn=
ome-mplayer] ?=3D "rdepends on blacklisted mplayer"
meta-gnome/recipes-connectivity/network-manager-applet/network-manager-appl=
et_0.9.8.10.bb:PNBLACKLIST[network-manager-applet] ?=3D "Depends on broken =
polkit-gnome"
meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb:PNBLACKLIST[gcr] ?=3D "CONFLICT: =
4 files conflict with gnome-keyring"
meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb:PNBLACKLIST[gdm] ?=3D "Depends o=
n broken polkit-gnome"
meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb:PNBLACKL=
IST[gnome-bluetooth] ?=3D "dbus-binding-tool fails with: Unable to load gno=
me-bluetooth-2.32.0/lib/bluetooth-client.xml": "manager" is not a valid D-B=
us interface name"
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
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb:PNBLACK=
LIST[lksctp-tools] ?=3D "BROKEN: fails to link against sctp_connectx symbol"
meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb:PNB=
LACKLIST[libimobiledevice] ?=3D "cannot run test program while cross compil=
ing"
meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft66] ?=3D =
"BROKEN: depends on broken libftdi"
meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb:PNBLACKLIST[zeroc=
-ice] ?=3D "BROKEN: not compatible with default db version"
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
meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb:PNBLACKLIST[mplayer2] ?=
=3D "Requires newer libav which has negative D_P"
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
meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST[vala=
-terminal] ?=3D "BROKEN: Doesn't work with B!=3DS, touch: cannot touch `src=
/.stamp': No such file or directory"
meta-webserver/recipes-php/modphp/modphp5.inc:PNBLACKLIST[modphp] ?=3D "CON=
FLICT: 466 header files conflict with php"
meta-webserver/recipes-php/xdebug/xdebug_2.2.5.bb:PNBLACKLIST[xdebug] ?=3D =
"CONFLICT: depends on blocked modphp"
meta-qt5:
meta-smartphone:
meta-shr/recipes-shr/3rdparty/ffalarms_git.bb:PNBLACKLIST[ffalarms] =3D "Do=
esn't build after vala upgrade from 0.24.0 to 0.26.1"
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


count: 17	issue: textrel
chromium-38.0.2125.101: ELF binary '/tmp/work/i586-oe-linux/chromium/38.0.2=
125.101-r0/packages-split/chromium/usr/bin/chrome/libffmpegsumo.so' has rel=
ocations in .text [textrel]
gstreamer1.0-libav-1.4.5: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/gs=
treamer1.0-libav/1.4.5-r0/packages-split/gstreamer1.0-libav/usr/lib/gstream=
er-1.0/libgstlibav.so' has relocations in .text [textrel]
gstreamer1.0-libav-1.4.5: ELF binary '/tmp/work/i586-oe-linux/gstreamer1.0-=
libav/1.4.5-r0/packages-split/gstreamer1.0-libav/usr/lib/gstreamer-1.0/libg=
stlibav.so' has relocations in .text [textrel]
libav-9.16: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/libav/9.16-r0/pa=
ckages-split/libavcodec/usr/lib/libavcodec.so.54.35.0' has relocations in .=
text [textrel]
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
qtwebkit-5.4.0+gitAUTOINC+af15cefb39: ELF binary '/tmp/work/i586-oe-linux/q=
twebkit/5.4.0+gitAUTOINC+af15cefb39-r0/packages-split/qtwebkit/usr/lib/libQ=
t5WebKit.so.5.4.0' has relocations in .text [textrel]
webkit-efl-1.11.0: ELF binary '/tmp/work/i586-oe-linux/webkit-efl/1_1.11.0-=
r0/packages-split/webkit-efl/usr/lib/libjavascriptcore_efl.so.1.11.0' has r=
elocations in .text [textrel]
webkit-gtk-1.8.3: ELF binary '/tmp/work/i586-oe-linux/webkit-gtk/1.8.3-r1/p=
ackages-split/libjavascriptcore/usr/lib/libjavascriptcoregtk-1.0.so.0.13.4'=
 has relocations in .text [textrel]


count: 21	issue: build-deps
exquisite-0.0.1+svnr82070: exquisite rdepends on initscripts-functions, but=
 it isn't a build dependency? [build-deps]
glade3-3.8.5: glade3 rdepends on libpython2, but it isn't a build dependenc=
y? [build-deps]
gpm-1.99.7: gpm rdepends on initscripts-functions, but it isn't a build dep=
endency? [build-deps]
imsettings-1.6.7: imsettings rdepends on xfconf, but it isn't a build depen=
dency? [build-deps]
irda-utils-0.9.18: irda-utils rdepends on initscripts-functions, but it isn=
't a build dependency? [build-deps]
libssh-0.6.3: libssh rdepends on krb5, but it isn't a build dependency? [bu=
ild-deps]
libwebp-0.4.0: libwebp-bin rdepends on libgl-mesa, but it isn't a build dep=
endency? [build-deps]
libwebp-0.4.0: libwebp-bin rdepends on mesa-glut, but it isn't a build depe=
ndency? [build-deps]
log4c-1.2.4: log4c rdepends on expat, but it isn't a build dependency? [bui=
ld-deps]
mpd-0.19.1: mpd rdepends on libsmbclient, but it isn't a build dependency? =
[build-deps]
mplayer2-2.0+gitrAUTOINC+2c378c71a4: mplayer2 rdepends on libpostproc, but =
it isn't a build dependency? [build-deps]
mplayer2-2.0+gitrAUTOINC+2c378c71a4: mplayer2 rdepends on libvorbis, but it=
 isn't a build dependency? [build-deps]
mplayer2-2.0+gitrAUTOINC+2c378c71a4: mplayer2 rdepends on libxscrnsaver, bu=
t it isn't a build dependency? [build-deps]
mplayer2-2.0+gitrAUTOINC+2c378c71a4: mplayer2 rdepends on mpg123, but it is=
n't a build dependency? [build-deps]
mplayer2-2.0+gitrAUTOINC+2c378c71a4: mplayer2 rdepends on portaudio-v19, bu=
t it isn't a build dependency? [build-deps]
netkit-rwho-0.17: netkit-rwho-client rdepends on initscripts-functions, but=
 it isn't a build dependency? [build-deps]
proftpd-1.3.5: proftpd rdepends on initscripts-functions, but it isn't a bu=
ild dependency? [build-deps]
qtwayland-5.4.0+gitAUTOINC+a0c5ba81f4: qtwayland-plugins rdepends on libxco=
mposite, but it isn't a build dependency? [build-deps]
qtwebkit-5.4.0+gitAUTOINC+af15cefb39: qtwebkit rdepends on libxcomposite, b=
ut it isn't a build dependency? [build-deps]
squid-3.4.7: squid rdepends on libpam, but it isn't a build dependency? [bu=
ild-deps]
sysklogd-1.5: sysklogd rdepends on initscripts-functions, but it isn't a bu=
ild dependency? [build-deps]


count: 56	issue: file-rdeps
apache2-2.4.10: apache2-dev requires /usr/bin/perl, but no providers in its=
 RDEPENDS [file-rdeps]
chkconfig-1.3.58: chkconfig requires libnewt.so()(64bit), but no providers =
in its RDEPENDS [file-rdeps]
chkconfig-1.3.58: chkconfig requires libnewt.so, but no providers in its RD=
EPENDS [file-rdeps]
cloud9-0.6: cloud9 requires /bin/bash, but no providers in its RDEPENDS [fi=
le-rdeps]
dpkg-1.17.21: dpkg requires /usr/bin/perl, but no providers in its RDEPENDS=
 [file-rdeps]
dvb-apps-1.1.1: dvb-apps requires libucsi.so()(64bit), libdvbapi.so()(64bit=
), libdvbcfg.so()(64bit), libdvben50221.so()(64bit), libdvbsec.so()(64bit),=
 but no providers in its RDEPENDS [file-rdeps]
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
gateone-1.2: gateone requires /bin/bash, but no providers in its RDEPENDS [=
file-rdeps]
giflib-4.1.6: giflib-utils requires /usr/bin/perl, but no providers in its =
RDEPENDS [file-rdeps]
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
imsettings-1.6.7: imsettings requires /bin/bash, but no providers in its RD=
EPENDS [file-rdeps]
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
lmsensors-config-1.0: lmsensors-config-cgi requires /usr/bin/rrdcgi, but no=
 providers in its RDEPENDS [file-rdeps]
nodejs-0.8.18: nodejs requires /bin/bash, but no providers in its RDEPENDS =
[file-rdeps]
ntp-4.2.8: ntp-utils requires /usr/bin/perl, but no providers in its RDEPEN=
DS [file-rdeps]
numptyphysics-0.2+svnr109: numptyphysics requires /bin/bash, /usr/bin/perl,=
 but no providers in its RDEPENDS [file-rdeps]
opensaf-4.5.0: opensaf requires /bin/bash, /usr/bin/python, but no provider=
s in its RDEPENDS [file-rdeps]
packagekit-0.5.6: packagekit requires /bin/bash, but no providers in its RD=
EPENDS [file-rdeps]
pax-utils-0.9.2: pax-utils requires /usr/bin/python, but no providers in it=
s RDEPENDS [file-rdeps]
pcsc-lite-1.8.6: pcsc-lite requires /usr/bin/python, but no providers in it=
s RDEPENDS [file-rdeps]
php-5.4.33: php requires /tmp/work/armv5te-oe-linux-gnueabi/php/5.4.33-r0/i=
mage/usr/bin/php, but no providers in its RDEPENDS [file-rdeps]
php-5.4.33: php requires /tmp/work/core2-64-oe-linux/php/5.4.33-r0/image/us=
r/bin/php, but no providers in its RDEPENDS [file-rdeps]
php-5.4.33: php requires /tmp/work/i586-oe-linux/php/5.4.33-r0/image/usr/bi=
n/php, but no providers in its RDEPENDS [file-rdeps]
pm-qa-0.4.14: pm-qa requires /bin/bash, but no providers in its RDEPENDS [f=
ile-rdeps]
qt-creator-2.8.1: qt-creator requires /usr/bin/perl, but no providers in it=
s RDEPENDS [file-rdeps]
systemd-216+gitAUTOINC+5d0ae62c66: systemd-kernel-install requires /bin/bas=
h, but no providers in its RDEPENDS [file-rdeps]
tracker-0.14.2: tracker-nautilus-extension requires libnautilus-extension.s=
o.1()(64bit), but no providers in its RDEPENDS [file-rdeps]
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


count: 118	issue: version-going-backwards

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oyqLL/JqMvClXZi1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSqfVQACgkQN1Ujt2V2gBxSkACfRQptUToZvU2MEIORl4OumOpo
iJUAoJuUlcjDuKlChvmfKPT2Hta2mQ0q
=PgD/
-----END PGP SIGNATURE-----

--oyqLL/JqMvClXZi1--
