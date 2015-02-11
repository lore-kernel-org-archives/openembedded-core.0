Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 514A1609B2;
	Wed, 11 Feb 2015 20:26:28 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id n12so5906202wgh.2;
	Wed, 11 Feb 2015 12:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=wtBPadWGwdVzDeMZtUQxwbLYyjS9MjlSZLZsSiBgY38=;
	b=Y+tO1xuDzn51TYsThze2nsZk7REj3wSPrvVQf2vrymJ/kW2DhbgdXymn63EYaeg8oh
	Y9TpK1YH2l0Lg/8/5iUKfj/wRqhwa2f3H0yowvvXwlaY4qBzg6gphwmnAEIjDN2P18gA
	XHVs5PnAzew7kNm64fOz4pkjsNoiJWdTqhxoINmGB8QfwA+jP/tUThvbuzw/hXRXMgiQ
	1FS8dMTxc9A2gK8LpTL4MMxmG523I3HODjInqXQ2+1KKi79Uq9RiJRvvFpvVbubF4/n6
	MP3oCK7BKZAQC6DnT7QDZ82NbyBxYfblLvwDtOSVQqNlFPrgU/R2mOnPTV3dj1o8CC9+
	FdFA==
X-Received: by 10.194.89.163 with SMTP id bp3mr364001wjb.145.1423686389681;
	Wed, 11 Feb 2015 12:26:29 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	z6sm3821130wix.20.2015.02.11.12.26.28
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Feb 2015 12:26:28 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 11 Feb 2015 21:26:32 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20150211202632.GA2272@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, Failed tasks 2015-02-10
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
X-List-Received-Date: Wed, 11 Feb 2015 20:26:39 -0000
X-Groupsio-MsgNum: 62310
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WIyZ46R2i8wDzkSu"
Content-Disposition: inline

--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2015-02-10 =3D=3D

INFO: jenkins-job.sh-1.1.0 Complete log available at http://logs.nslu2-linu=
x.org/buildlogs/oe/world/log.report.20150210_214029.log

=3D=3D=3D common (10) =3D=3D=3D
    * /meta-openembedded/meta-networking/recipes-connectivity/snort/snort_2=
=2E9.6.0.bb, do_configure
    * /meta-openembedded/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc=
2.bb, do_compile
    * /meta-openembedded/meta-networking/recipes-support/wireshark/wireshar=
k_1.12.3.bb, do_configure
    * /meta-openembedded/meta-oe/recipes-extended/unixodbc/unixodbc_2.3.2.b=
b, do_configure
    * /meta-openembedded/meta-oe/recipes-graphics/gimp/gimp_2.8.10.bb, do_c=
ompile
    * /meta-openembedded/meta-oe/recipes-support/fltk/fltk_1.1.10.bb, do_co=
mpile
    * /meta-openembedded/meta-oe/recipes-support/start-stop-daemon/start-st=
op-daemon_1.16.0.2.bb, do_compile
    * /meta-openembedded/meta-python/recipes-devtools/python/python-lxml_3.=
2.5.bb, do_compile
    * /openembedded-core/meta/recipes-bsp/u-boot/u-boot-mkimage_2014.07.bb,=
 do_compile
    * /openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.=
bb, do_compile

=3D=3D=3D common-x86 (2) =3D=3D=3D
    * /meta-openembedded/meta-oe/recipes-kernel/ktap/ktap-module_0.4.bb, do=
_compile
    * /meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_co=
mpile

=3D=3D=3D qemuarm (0) =3D=3D=3D

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (34) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 10	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.w=
orld.20150208_220627.log// ||=20
|-
|| qemux86 	|| 12	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.w=
orld.20150209_133717.log// ||=20
|-
|| qemux86_64 	|| 12	 || http://logs.nslu2-linux.org/buildlogs/oe/world//lo=
g.world.20150210_053852.log// ||=20
|}

=3D=3D=3D PNBLACKLISTs (48) =3D=3D=3D

=3D=3D=3D QA issues (152) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
|-
||0	||version-going-backwards
|-
||1	||libdir
|-
||3	||already-stripped
|-
||35	||build-deps
|-
||50	||file-rdeps
|-
||63	||textrel
|}


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.2.bb:PNBLACKLIST[ifuse=
] ?=3D "depends on blacklisted libimobiledevice"
meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLACKLIST[gn=
ome-mplayer] ?=3D "rdepends on blacklisted mplayer"
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
LIST[lksctp-tools] ?=3D "${@base_contains('DISTRO_FEATURES', 'ld-is-gold', =
"BROKEN: fails to link against sctp_connectx symbol", '', d)}"
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
meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb:PNBLACKLIST[xfce4-vala=
] ?=3D "Fails to build since vala upgrade to 0.26.1"
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


count: 63	issue: textrel
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
python3-3.3.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.3.3=
-r1.0/packages-split/python3-audio/usr/lib/python3.3/lib-dynload/ossaudiode=
v.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.3.3=
-r1.0/packages-split/python3-codecs/usr/lib/python3.3/lib-dynload/_codecs_c=
n.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.3.3=
-r1.0/packages-split/python3-core/usr/lib/python3.3/lib-dynload/binascii.cp=
ython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.3.3=
-r1.0/packages-split/python3-crypt/usr/lib/python3.3/lib-dynload/_sha256.cp=
ython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.3.3=
-r1.0/packages-split/python3-ctypes/usr/lib/python3.3/lib-dynload/_ctypes_t=
est.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.3.3=
-r1.0/packages-split/python3-curses/usr/lib/python3.3/lib-dynload/_curses.c=
python-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.3.3=
-r1.0/packages-split/python3-elementtree/usr/lib/python3.3/lib-dynload/_ele=
menttree.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.3.3=
-r1.0/packages-split/python3-fcntl/usr/lib/python3.3/lib-dynload/fcntl.cpyt=
hon-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.3.3=
-r1.0/packages-split/python3-gdbm/usr/lib/python3.3/lib-dynload/_gdbm.cpyth=
on-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.3.3=
-r1.0/packages-split/python3-io/usr/lib/python3.3/lib-dynload/_socket.cpyth=
on-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.3.3=
-r1.0/packages-split/python3-json/usr/lib/python3.3/lib-dynload/_json.cpyth=
on-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.3.3=
-r1.0/packages-split/python3-lang/usr/lib/python3.3/lib-dynload/_bisect.cpy=
thon-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.3.3=
-r1.0/packages-split/python3-math/usr/lib/python3.3/lib-dynload/cmath.cpyth=
on-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.3.3=
-r1.0/packages-split/python3-misc/usr/lib/python3.3/lib-dynload/_md5.cpytho=
n-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.3.3=
-r1.0/packages-split/python3-mmap/usr/lib/python3.3/lib-dynload/mmap.cpytho=
n-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.3.3=
-r1.0/packages-split/python3-multiprocessing/usr/lib/python3.3/lib-dynload/=
_multiprocessing.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.3.3=
-r1.0/packages-split/python3-profile/usr/lib/python3.3/lib-dynload/_lsprof.=
cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.3.3=
-r1.0/packages-split/python3-readline/usr/lib/python3.3/lib-dynload/readlin=
e.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.3.3=
-r1.0/packages-split/python3-resource/usr/lib/python3.3/lib-dynload/resourc=
e.cpython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.3.3=
-r1.0/packages-split/python3-syslog/usr/lib/python3.3/lib-dynload/syslog.cp=
ython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.3.3=
-r1.0/packages-split/python3-textutils/usr/lib/python3.3/lib-dynload/_csv.c=
python-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.3.3=
-r1.0/packages-split/python3-unixadmin/usr/lib/python3.3/lib-dynload/grp.cp=
ython-33m.so' has relocations in .text [textrel]
python3-3.3.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3.3.3=
-r1.0/packages-split/python3-xml/usr/lib/python3.3/lib-dynload/pyexpat.cpyt=
hon-33m.so' has relocations in .text [textrel]
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
qtwebkit-5.4.0+gitAUTOINC+3a2cb4770c: ELF binary '/tmp/work/i586-oe-linux/q=
twebkit/5.4.0+gitAUTOINC+3a2cb4770c-r0/packages-split/qtwebkit/usr/lib/libQ=
t5WebKit.so.5.4.0' has relocations in .text [textrel]
webkit-efl-1.11.0: ELF binary '/tmp/work/i586-oe-linux/webkit-efl/1_1.11.0-=
r0/packages-split/webkit-efl/usr/lib/libjavascriptcore_efl.so.1.11.0' has r=
elocations in .text [textrel]
webkit-gtk-1.8.3: ELF binary '/tmp/work/i586-oe-linux/webkit-gtk/1.8.3-r1/p=
ackages-split/libjavascriptcore/usr/lib/libjavascriptcoregtk-1.0.so.0.13.4'=
 has relocations in .text [textrel]


count: 35	issue: build-deps
emacs-23.4: emacs rdepends on ncurses-libtinfo, but it isn't a build depend=
ency? [build-deps]
exquisite-0.0.1+svnr82070: exquisite rdepends on initscripts-functions, but=
 it isn't a build dependency? [build-deps]
freetds-0.92.79: freetds rdepends on readline, but it isn't a build depende=
ncy? [build-deps]
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
pkcs11-helper-1.11: pkcs11-helper rdepends on nspr, but it isn't a build de=
pendency? [build-deps]
pkcs11-helper-1.11: pkcs11-helper rdepends on nss, but it isn't a build dep=
endency? [build-deps]
proftpd-1.3.5: proftpd rdepends on initscripts-functions, but it isn't a bu=
ild dependency? [build-deps]
qtmultimedia-5.4.0+gitAUTOINC+f420ac286a: qtmultimedia rdepends on gstreame=
r, but it isn't a build dependency? [build-deps]
qtmultimedia-5.4.0+gitAUTOINC+f420ac286a: qtmultimedia rdepends on libgstap=
p-0.10, but it isn't a build dependency? [build-deps]
qtmultimedia-5.4.0+gitAUTOINC+f420ac286a: qtmultimedia rdepends on libgstin=
terfaces-0.10, but it isn't a build dependency? [build-deps]
qtmultimedia-5.4.0+gitAUTOINC+f420ac286a: qtmultimedia rdepends on libgstvi=
deo-0.10, but it isn't a build dependency? [build-deps]
qtmultimedia-5.4.0+gitAUTOINC+f420ac286a: qtmultimedia-plugins rdepends on =
gstreamer, but it isn't a build dependency? [build-deps]
qtmultimedia-5.4.0+gitAUTOINC+f420ac286a: qtmultimedia-plugins rdepends on =
libgstapp-0.10, but it isn't a build dependency? [build-deps]
qtmultimedia-5.4.0+gitAUTOINC+f420ac286a: qtmultimedia-plugins rdepends on =
libgstinterfaces-0.10, but it isn't a build dependency? [build-deps]
qtmultimedia-5.4.0+gitAUTOINC+f420ac286a: qtmultimedia-plugins rdepends on =
libgstpbutils-0.10, but it isn't a build dependency? [build-deps]
qtmultimedia-5.4.0+gitAUTOINC+f420ac286a: qtmultimedia-plugins rdepends on =
libgstphotography-0.10, but it isn't a build dependency? [build-deps]
qtwayland-5.4.0+gitAUTOINC+a0c5ba81f4: qtwayland-plugins rdepends on libxco=
mposite, but it isn't a build dependency? [build-deps]
qtwebkit-5.4.0+gitAUTOINC+3a2cb4770c: qtwebkit rdepends on libxcomposite, b=
ut it isn't a build dependency? [build-deps]
squid-3.4.7: squid rdepends on libpam, but it isn't a build dependency? [bu=
ild-deps]
sysklogd-1.5.1: sysklogd rdepends on initscripts-functions, but it isn't a =
build dependency? [build-deps]
syslog-ng-3.5.4.1: syslog-ng-libs rdepends on util-linux-libuuid, but it is=
n't a build dependency? [build-deps]


count: 50	issue: file-rdeps
apache2-2.4.10: apache2-dev requires /usr/bin/perl, but no providers in its=
 RDEPENDS [file-rdeps]
chkconfig-1.3.58: chkconfig requires libnewt.so()(64bit), but no providers =
in its RDEPENDS [file-rdeps]
chkconfig-1.3.58: chkconfig requires libnewt.so, but no providers in its RD=
EPENDS [file-rdeps]
cloud9-0.6: cloud9 requires /bin/bash, but no providers in its RDEPENDS [fi=
le-rdeps]
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
emacs-23.4: emacs requires /usr/bin/perl, but no providers in its RDEPENDS =
[file-rdeps]
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
lmsensors-config-1.0: lmsensors-config-cgi requires /usr/bin/rrdcgi, but no=
 providers in its RDEPENDS [file-rdeps]
nodejs-0.8.18: nodejs requires /bin/bash, but no providers in its RDEPENDS =
[file-rdeps]
numptyphysics-0.2+svnr109: numptyphysics requires /bin/bash, /usr/bin/perl,=
 but no providers in its RDEPENDS [file-rdeps]
opensaf-4.5.0: opensaf requires /bin/bash, /usr/bin/python, but no provider=
s in its RDEPENDS [file-rdeps]
packagekit-0.5.6: packagekit requires /bin/bash, but no providers in its RD=
EPENDS [file-rdeps]
pcsc-lite-1.8.6: pcsc-lite requires /usr/bin/python, but no providers in it=
s RDEPENDS [file-rdeps]
pm-qa-0.4.14: pm-qa requires /bin/bash, but no providers in its RDEPENDS [f=
ile-rdeps]
qt-creator-2.8.1: qt-creator requires /usr/bin/perl, but no providers in it=
s RDEPENDS [file-rdeps]
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


count: 0	issue: version-going-backwards

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WIyZ46R2i8wDzkSu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTbuvgACgkQN1Ujt2V2gBzvDgCfakxauZspkBeFCa9k+26P+x2v
RJYAn3JyYnePaC322Jjrmns4DRIofEaU
=8/59
-----END PGP SIGNATURE-----

--WIyZ46R2i8wDzkSu--
