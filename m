Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 79115732EE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 21:36:07 +0000 (UTC)
Received: (qmail 8498 invoked by uid 1003); 11 Feb 2015 21:36:08 -0000
Received: from unknown (HELO ?192.168.11.101?)
	(philip@opensdr.com@108.44.84.240)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	11 Feb 2015 21:36:08 -0000
Message-ID: <54DBCB43.4040408@balister.org>
Date: Wed, 11 Feb 2015 16:36:03 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>, 
	openembedded-core@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org
References: <20150211202632.GA2272@jama>
In-Reply-To: <20150211202632.GA2272@jama>
Subject: Re: State of bitbake world, Failed tasks 2015-02-10
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
X-List-Received-Date: Wed, 11 Feb 2015 21:36:12 -0000
X-Groupsio-MsgNum: 62313
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="jqJQK0x577dnQTmPwQS7KkqfdvWGPHBH2"

--jqJQK0x577dnQTmPwQS7KkqfdvWGPHBH2
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 02/11/2015 03:26 PM, Martin Jansa wrote:
> http://www.openembedded.org/wiki/Bitbake_World_Status
>=20
> =3D=3D Failed tasks 2015-02-10 =3D=3D
>=20
> INFO: jenkins-job.sh-1.1.0 Complete log available at http://logs.nslu2-=
linux.org/buildlogs/oe/world/log.report.20150210_214029.log
>=20
> =3D=3D=3D common (10) =3D=3D=3D
>     * /meta-openembedded/meta-networking/recipes-connectivity/snort/sno=
rt_2.9.6.0.bb, do_configure
>     * /meta-openembedded/meta-networking/recipes-daemons/ptpd/ptpd_2.3.=
1-rc2.bb, do_compile
>     * /meta-openembedded/meta-networking/recipes-support/wireshark/wire=
shark_1.12.3.bb, do_configure
>     * /meta-openembedded/meta-oe/recipes-extended/unixodbc/unixodbc_2.3=
=2E2.bb, do_configure
>     * /meta-openembedded/meta-oe/recipes-graphics/gimp/gimp_2.8.10.bb, =
do_compile
>     * /meta-openembedded/meta-oe/recipes-support/fltk/fltk_1.1.10.bb, d=
o_compile
>     * /meta-openembedded/meta-oe/recipes-support/start-stop-daemon/star=
t-stop-daemon_1.16.0.2.bb, do_compile
>     * /meta-openembedded/meta-python/recipes-devtools/python/python-lxm=
l_3.2.5.bb, do_compile

Was this run with the patch I sent yesterday?

Philip

>     * /openembedded-core/meta/recipes-bsp/u-boot/u-boot-mkimage_2014.07=
=2Ebb, do_compile
>     * /openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_=
git.bb, do_compile
>=20
> =3D=3D=3D common-x86 (2) =3D=3D=3D
>     * /meta-openembedded/meta-oe/recipes-kernel/ktap/ktap-module_0.4.bb=
, do_compile
>     * /meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, d=
o_compile
>=20
> =3D=3D=3D qemuarm (0) =3D=3D=3D
>=20
> =3D=3D=3D qemux86 (0) =3D=3D=3D
>=20
> =3D=3D=3D qemux86_64 (0) =3D=3D=3D
>=20
> =3D=3D=3D Number of failed tasks (34) =3D=3D=3D
> {| class=3Dwikitable
> |-
> || qemuarm 	|| 10	 || http://logs.nslu2-linux.org/buildlogs/oe/world//l=
og.world.20150208_220627.log// ||=20
> |-
> || qemux86 	|| 12	 || http://logs.nslu2-linux.org/buildlogs/oe/world//l=
og.world.20150209_133717.log// ||=20
> |-
> || qemux86_64 	|| 12	 || http://logs.nslu2-linux.org/buildlogs/oe/world=
//log.world.20150210_053852.log// ||=20
> |}
>=20
> =3D=3D=3D PNBLACKLISTs (48) =3D=3D=3D
>=20
> =3D=3D=3D QA issues (152) =3D=3D=3D
> {| class=3Dwikitable
> !| Count		||Issue
> |-
> ||0	||version-going-backwards
> |-
> ||1	||libdir
> |-
> ||3	||already-stripped
> |-
> ||35	||build-deps
> |-
> ||50	||file-rdeps
> |-
> ||63	||textrel
> |}
>=20
>=20
> PNBLACKLISTs:
> openembedded-core/:
> meta-browser:
> meta-openembedded:
> meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.2.bb:PNBLACKLIST[i=
fuse] ?=3D "depends on blacklisted libimobiledevice"
> meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLACKLIS=
T[gnome-mplayer] ?=3D "rdepends on blacklisted mplayer"
> meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb:PNBLACKLIST[gcr] ?=3D "CONFLI=
CT: 4 files conflict with gnome-keyring"
> meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb:PNBLACKLIST[gdm] ?=3D "Depen=
ds on broken polkit-gnome"
> meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb:PNBL=
ACKLIST[gnome-bluetooth] ?=3D "dbus-binding-tool fails with: Unable to lo=
ad gnome-bluetooth-2.32.0/lib/bluetooth-client.xml": "manager" is not a v=
alid D-Bus interface name"
> meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb:PNBLACKLIST=
[gnome-menus3] ?=3D "CONFLICT: 24 files are conflicting with gnome-menus"=

> meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[=
gnome-panel3] ?=3D "CONFLICT: depends on libgweather3 which conflicts wit=
h libgweather"
> meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb:PNBLACKLIST[lib=
gweather3] ?=3D "CONFLICT: 876 files are conflicting with libgweather"
> meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb:PNBLACKLIST[zenity] ?=3D=
 "BROKEN: doesn't build with B!=3DS"
> meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb:PNBLACKLIST[xbmc] =
?=3D "/usr/include/c++/ctime:70:11: error: '::gmtime' has not been declar=
ed"
> meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb:PNBLACK=
LIST[coriander] ?=3D "BROKEN: fails to use SDL probably because libsdl-co=
nfig was removed, error: unknown type name 'SDL_Overlay'"
> meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.b=
b:PNBLACKLIST[renderer-service-upnp] ?=3D "BROKEN: doesn't build with B!=3D=
S (trying to install rendererconsole.py from ${B} instead of ${S})"
> meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb:PNB=
LACKLIST[lksctp-tools] ?=3D "${@base_contains('DISTRO_FEATURES', 'ld-is-g=
old', "BROKEN: fails to link against sctp_connectx symbol", '', d)}"
> meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb=
:PNBLACKLIST[libimobiledevice] ?=3D "cannot run test program while cross =
compiling"
> meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft66] ?=
=3D "BROKEN: depends on broken libftdi"
> meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb:PNBLACKLIST[z=
eroc-ice] ?=3D "BROKEN: not compatible with default db version"
> meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb:PNBLACKLIST[polki=
t-gnome] ?=3D "Fails to build, m4:configure.ac:125: recursion limit of 10=
24 exceeded, use -L<N> to change it"
> meta-oe/recipes-extended/subsurface/subsurface_git.bb:PNBLACKLIST[subsu=
rface] ?=3D "Needs to be upgraded for compatibility with new libdivecompu=
ter"
> meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb:PNBLACKLIST[clutt=
er-box2d] ?=3D "BROKEN: doesn't build with B!=3DS"
> meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:PNBLACKLIST[fim] ?=3D "BROK=
EN: doesn't build with B!=3DS (flex: can't open lex.lex)"
> meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb:PNBLACKLIST=
[xf86-input-mtev] ?=3D "BROKEN: doesn't build with B!=3DS (Makefile witho=
ut ${S} in sed call)"
> meta-oe/recipes-qt/qconnman/qconnman-e_git.bb:PNBLACKLIST[qconnman-e] ?=
=3D "BROKEN: doesn't work with B!=3DS, ls: cannot access *.pro: No such f=
ile or directory"
> meta-oe/recipes-qt/qconnman/qconnman_git.bb:PNBLACKLIST[qconnman] ?=3D =
"BROKEN: doesn't work with B!=3DS, ls: cannot access *.pro: No such file =
or directory"
> meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb:PNBLACKLIST[sylpheed]=
 ?=3D "BROKEN: Doesn't work with B!=3DS"
> meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb:PNBLACKLIST[apcupsd]=
 ?=3D "BROKEN: doesn't build with B!=3DS"
> meta-oe/recipes-support/maliit/maliit-framework_git.bb:PNBLACKLIST[mali=
it-framework] ?=3D "BROKEN: Wasn't updated to work with B!=3DS, maybe inc=
orrectly inherits autotools"
> meta-oe/recipes-support/maliit/maliit-plugins_git.bb:PNBLACKLIST[maliit=
-plugins] ?=3D "BROKEN: depends on broken maliit-framework"
> meta-oe/recipes-support/mongodb/mongodb_git.bb:PNBLACKLIST[mongodb] ?=3D=
 "Fails to build with system boost"
> meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb:PNBLACKLIST[openmo=
tif] ?=3D "BROKEN: doesn't build with B!=3DS"
> meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST[=
vala-terminal] ?=3D "BROKEN: Doesn't work with B!=3DS, touch: cannot touc=
h `src/.stamp': No such file or directory"
> meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb:PNBLACKLIST[xfce4-=
vala] ?=3D "Fails to build since vala upgrade to 0.26.1"
> meta-qt5:
> meta-smartphone:
> meta-shr/recipes-shr/3rdparty/ffalarms_git.bb:PNBLACKLIST[ffalarms] =3D=
 "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> meta-shr/recipes-shr/3rdparty/iliwi_git.bb:PNBLACKLIST[iliwi] =3D "Does=
n't build after vala upgrade from 0.24.0 to 0.26.1"
> meta-shr/recipes-shr/3rdparty/intone_git.bb:PNBLACKLIST[intone] =3D "rd=
epends on blacklisted mplayer2"
> meta-shr/recipes-shr/3rdparty/sensmon_git.bb:PNBLACKLIST[sensmon] =3D "=
Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> meta-shr/recipes-shr/3rdparty/valacompass_git.bb:PNBLACKLIST[valacompas=
s] =3D "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> meta-webos-ports:
> conf/world_fixes.inc:PNBLACKLIST[mplayer2] =3D ""
> conf/world_fixes.inc:PNBLACKLIST[android-system] =3D "depends on lxc fr=
om meta-virtualiazation which isn't included in my world builds"
> conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-1080p] =3D "big and doesn=
't really need to be tested so much"
> conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-480p] =3D "big and doesn'=
t really need to be tested so much"
> conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn'=
t really need to be tested so much"
> conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn'=
t really need to be tested so much"
> conf/world_fixes.inc:PNBLACKLIST[tearsofsteel-1080p] =3D "big and doesn=
't really need to be tested so much"
> conf/world_mask.inc:PNBLACKLIST[evince] =3D "fails to build"
> conf/world_mask.inc:PNBLACKLIST[epiphany] =3D "fails to build"
> conf/world_mask.inc:PNBLACKLIST[gnome-power-manager] =3D "fails to buil=
d"
> conf/world_mask.inc:PNBLACKLIST[gnome-bluetooth] =3D "fails to build"
> conf/world_mask.inc:PNBLACKLIST[media-ctl] =3D "fails to build"
> QA issues by type:
> count: 3	issue: already-stripped
> qwt-6.0.1: File '/usr/lib/libqwt.so.6.0.1' from qwt was already strippe=
d, this will prevent future debugging! [already-stripped]
> qwt-6.0.1: File '/usr/lib/libqwtmathml.so.6.0.1' from qwt was already s=
tripped, this will prevent future debugging! [already-stripped]
> qwt-6.0.1: File '/usr/lib/qt4/plugins/designer/libqwt_designer_plugin.s=
o' from qwt was already stripped, this will prevent future debugging! [al=
ready-stripped]
>=20
>=20
> count: 1	issue: libdir
> chromium-dbg: found library in wrong location: /usr/bin/chrome/.debug/l=
ibffmpegsumo.so [libdir]
>=20
>=20
> count: 63	issue: textrel
> chromium-38.0.2125.101: ELF binary '/tmp/work/i586-oe-linux/chromium/38=
=2E0.2125.101-r0/packages-split/chromium/usr/bin/chrome/libffmpegsumo.so'=
 has relocations in .text [textrel]
> gstreamer1.0-libav-1.4.5: ELF binary '/tmp/work/armv5te-oe-linux-gnueab=
i/gstreamer1.0-libav/1.4.5-r0/packages-split/gstreamer1.0-libav/usr/lib/g=
streamer-1.0/libgstlibav.so' has relocations in .text [textrel]
> gstreamer1.0-libav-1.4.5: ELF binary '/tmp/work/i586-oe-linux/gstreamer=
1.0-libav/1.4.5-r0/packages-split/gstreamer1.0-libav/usr/lib/gstreamer-1.=
0/libgstlibav.so' has relocations in .text [textrel]
> libav-9.16: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/libav/9.16-r=
0/packages-split/libavcodec/usr/lib/libavcodec.so.54.35.0' has relocation=
s in .text [textrel]
> libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-=
split/libavcodec/usr/lib/libavcodec.so.54.35.0' has relocations in .text =
[textrel]
> libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-=
split/libavdevice/usr/lib/libavdevice.so.53.2.0' has relocations in .text=
 [textrel]
> libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-=
split/libavfilter/usr/lib/libavfilter.so.3.3.0' has relocations in .text =
[textrel]
> libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-=
split/libavformat/usr/lib/libavformat.so.54.20.4' has relocations in .tex=
t [textrel]
> libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-=
split/libavresample/usr/lib/libavresample.so.1.0.1' has relocations in .t=
ext [textrel]
> libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-=
split/libavutil/usr/lib/libavutil.so.52.3.0' has relocations in .text [te=
xtrel]
> libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-=
split/libswscale/usr/lib/libswscale.so.2.1.1' has relocations in .text [t=
extrel]
> libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary '/tmp/work/armv5te=
-oe-linux-gnueabi/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-sp=
lit/libpostproc/usr/lib/libpostproc.so.52.3.0' has relocations in .text [=
textrel]
> libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary '/tmp/work/i586-oe=
-linux/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split/libpost=
proc/usr/lib/libpostproc.so.52.3.0' has relocations in .text [textrel]
> mpg123-1.21.0: ELF binary '/tmp/work/i586-oe-linux/mpg123/1.21.0-r0/pac=
kages-split/mpg123/usr/lib/libmpg123.so.0.40.3' has relocations in .text =
[textrel]
> python3-3.3.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3=
=2E3.3-r1.0/packages-split/python3-audio/usr/lib/python3.3/lib-dynload/os=
saudiodev.cpython-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3=
=2E3.3-r1.0/packages-split/python3-codecs/usr/lib/python3.3/lib-dynload/_=
codecs_cn.cpython-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3=
=2E3.3-r1.0/packages-split/python3-core/usr/lib/python3.3/lib-dynload/bin=
ascii.cpython-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3=
=2E3.3-r1.0/packages-split/python3-crypt/usr/lib/python3.3/lib-dynload/_s=
ha256.cpython-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3=
=2E3.3-r1.0/packages-split/python3-ctypes/usr/lib/python3.3/lib-dynload/_=
ctypes_test.cpython-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3=
=2E3.3-r1.0/packages-split/python3-curses/usr/lib/python3.3/lib-dynload/_=
curses.cpython-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3=
=2E3.3-r1.0/packages-split/python3-elementtree/usr/lib/python3.3/lib-dynl=
oad/_elementtree.cpython-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3=
=2E3.3-r1.0/packages-split/python3-fcntl/usr/lib/python3.3/lib-dynload/fc=
ntl.cpython-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3=
=2E3.3-r1.0/packages-split/python3-gdbm/usr/lib/python3.3/lib-dynload/_gd=
bm.cpython-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3=
=2E3.3-r1.0/packages-split/python3-io/usr/lib/python3.3/lib-dynload/_sock=
et.cpython-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3=
=2E3.3-r1.0/packages-split/python3-json/usr/lib/python3.3/lib-dynload/_js=
on.cpython-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3=
=2E3.3-r1.0/packages-split/python3-lang/usr/lib/python3.3/lib-dynload/_bi=
sect.cpython-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3=
=2E3.3-r1.0/packages-split/python3-math/usr/lib/python3.3/lib-dynload/cma=
th.cpython-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3=
=2E3.3-r1.0/packages-split/python3-misc/usr/lib/python3.3/lib-dynload/_md=
5.cpython-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3=
=2E3.3-r1.0/packages-split/python3-mmap/usr/lib/python3.3/lib-dynload/mma=
p.cpython-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3=
=2E3.3-r1.0/packages-split/python3-multiprocessing/usr/lib/python3.3/lib-=
dynload/_multiprocessing.cpython-33m.so' has relocations in .text [textre=
l]
> python3-3.3.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3=
=2E3.3-r1.0/packages-split/python3-profile/usr/lib/python3.3/lib-dynload/=
_lsprof.cpython-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3=
=2E3.3-r1.0/packages-split/python3-readline/usr/lib/python3.3/lib-dynload=
/readline.cpython-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3=
=2E3.3-r1.0/packages-split/python3-resource/usr/lib/python3.3/lib-dynload=
/resource.cpython-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3=
=2E3.3-r1.0/packages-split/python3-syslog/usr/lib/python3.3/lib-dynload/s=
yslog.cpython-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3=
=2E3.3-r1.0/packages-split/python3-textutils/usr/lib/python3.3/lib-dynloa=
d/_csv.cpython-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3=
=2E3.3-r1.0/packages-split/python3-unixadmin/usr/lib/python3.3/lib-dynloa=
d/grp.cpython-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/python3/3=
=2E3.3-r1.0/packages-split/python3-xml/usr/lib/python3.3/lib-dynload/pyex=
pat.cpython-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/p=
ackages-split/python3-audio/usr/lib/python3.3/lib-dynload/ossaudiodev.cpy=
thon-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/p=
ackages-split/python3-codecs/usr/lib/python3.3/lib-dynload/_codecs_cn.cpy=
thon-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/p=
ackages-split/python3-core/usr/lib/python3.3/lib-dynload/binascii.cpython=
-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/p=
ackages-split/python3-crypt/usr/lib/python3.3/lib-dynload/_sha256.cpython=
-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/p=
ackages-split/python3-ctypes/usr/lib/python3.3/lib-dynload/_ctypes_test.c=
python-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/p=
ackages-split/python3-curses/usr/lib/python3.3/lib-dynload/_curses.cpytho=
n-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/p=
ackages-split/python3-elementtree/usr/lib/python3.3/lib-dynload/_elementt=
ree.cpython-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/p=
ackages-split/python3-fcntl/usr/lib/python3.3/lib-dynload/fcntl.cpython-3=
3m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/p=
ackages-split/python3-gdbm/usr/lib/python3.3/lib-dynload/_gdbm.cpython-33=
m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/p=
ackages-split/python3-io/usr/lib/python3.3/lib-dynload/_socket.cpython-33=
m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/p=
ackages-split/python3-json/usr/lib/python3.3/lib-dynload/_json.cpython-33=
m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/p=
ackages-split/python3-lang/usr/lib/python3.3/lib-dynload/_bisect.cpython-=
33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/p=
ackages-split/python3-math/usr/lib/python3.3/lib-dynload/cmath.cpython-33=
m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/p=
ackages-split/python3-misc/usr/lib/python3.3/lib-dynload/_md5.cpython-33m=
=2Eso' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/p=
ackages-split/python3-mmap/usr/lib/python3.3/lib-dynload/mmap.cpython-33m=
=2Eso' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/p=
ackages-split/python3-multiprocessing/usr/lib/python3.3/lib-dynload/_mult=
iprocessing.cpython-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/p=
ackages-split/python3-profile/usr/lib/python3.3/lib-dynload/_lsprof.cpyth=
on-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/p=
ackages-split/python3-readline/usr/lib/python3.3/lib-dynload/readline.cpy=
thon-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/p=
ackages-split/python3-resource/usr/lib/python3.3/lib-dynload/resource.cpy=
thon-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/p=
ackages-split/python3-syslog/usr/lib/python3.3/lib-dynload/syslog.cpython=
-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/p=
ackages-split/python3-textutils/usr/lib/python3.3/lib-dynload/_csv.cpytho=
n-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/p=
ackages-split/python3-unixadmin/usr/lib/python3.3/lib-dynload/grp.cpython=
-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/p=
ackages-split/python3-xml/usr/lib/python3.3/lib-dynload/pyexpat.cpython-3=
3m.so' has relocations in .text [textrel]
> qtwebkit-5.4.0+gitAUTOINC+3a2cb4770c: ELF binary '/tmp/work/i586-oe-lin=
ux/qtwebkit/5.4.0+gitAUTOINC+3a2cb4770c-r0/packages-split/qtwebkit/usr/li=
b/libQt5WebKit.so.5.4.0' has relocations in .text [textrel]
> webkit-efl-1.11.0: ELF binary '/tmp/work/i586-oe-linux/webkit-efl/1_1.1=
1.0-r0/packages-split/webkit-efl/usr/lib/libjavascriptcore_efl.so.1.11.0'=
 has relocations in .text [textrel]
> webkit-gtk-1.8.3: ELF binary '/tmp/work/i586-oe-linux/webkit-gtk/1.8.3-=
r1/packages-split/libjavascriptcore/usr/lib/libjavascriptcoregtk-1.0.so.0=
=2E13.4' has relocations in .text [textrel]
>=20
>=20
> count: 35	issue: build-deps
> emacs-23.4: emacs rdepends on ncurses-libtinfo, but it isn't a build de=
pendency? [build-deps]
> exquisite-0.0.1+svnr82070: exquisite rdepends on initscripts-functions,=
 but it isn't a build dependency? [build-deps]
> freetds-0.92.79: freetds rdepends on readline, but it isn't a build dep=
endency? [build-deps]
> geoclue-2.0.0: geoclue rdepends on geoip, but it isn't a build dependen=
cy? [build-deps]
> glade3-3.8.5: glade3 rdepends on libpython2, but it isn't a build depen=
dency? [build-deps]
> gpm-1.99.7: gpm rdepends on initscripts-functions, but it isn't a build=
 dependency? [build-deps]
> grub-efi-2.00: grub-efi rdepends on fuse, but it isn't a build dependen=
cy? [build-deps]
> irda-utils-0.9.18: irda-utils rdepends on initscripts-functions, but it=
 isn't a build dependency? [build-deps]
> libwebp-0.4.0: libwebp-bin rdepends on libgl-mesa, but it isn't a build=
 dependency? [build-deps]
> libwebp-0.4.0: libwebp-bin rdepends on mesa-glut, but it isn't a build =
dependency? [build-deps]
> log4c-1.2.4: log4c rdepends on expat, but it isn't a build dependency? =
[build-deps]
> mpd-0.19.1: mpd rdepends on libsmbclient, but it isn't a build dependen=
cy? [build-deps]
> mplayer2-2.0+gitrAUTOINC+2c378c71a4: mplayer2 rdepends on libpostproc, =
but it isn't a build dependency? [build-deps]
> mplayer2-2.0+gitrAUTOINC+2c378c71a4: mplayer2 rdepends on libvorbis, bu=
t it isn't a build dependency? [build-deps]
> mplayer2-2.0+gitrAUTOINC+2c378c71a4: mplayer2 rdepends on libxscrnsaver=
, but it isn't a build dependency? [build-deps]
> mplayer2-2.0+gitrAUTOINC+2c378c71a4: mplayer2 rdepends on mpg123, but i=
t isn't a build dependency? [build-deps]
> mplayer2-2.0+gitrAUTOINC+2c378c71a4: mplayer2 rdepends on portaudio-v19=
, but it isn't a build dependency? [build-deps]
> netkit-rwho-0.17: netkit-rwho-client rdepends on initscripts-functions,=
 but it isn't a build dependency? [build-deps]
> pkcs11-helper-1.11: pkcs11-helper rdepends on nspr, but it isn't a buil=
d dependency? [build-deps]
> pkcs11-helper-1.11: pkcs11-helper rdepends on nss, but it isn't a build=
 dependency? [build-deps]
> proftpd-1.3.5: proftpd rdepends on initscripts-functions, but it isn't =
a build dependency? [build-deps]
> qtmultimedia-5.4.0+gitAUTOINC+f420ac286a: qtmultimedia rdepends on gstr=
eamer, but it isn't a build dependency? [build-deps]
> qtmultimedia-5.4.0+gitAUTOINC+f420ac286a: qtmultimedia rdepends on libg=
stapp-0.10, but it isn't a build dependency? [build-deps]
> qtmultimedia-5.4.0+gitAUTOINC+f420ac286a: qtmultimedia rdepends on libg=
stinterfaces-0.10, but it isn't a build dependency? [build-deps]
> qtmultimedia-5.4.0+gitAUTOINC+f420ac286a: qtmultimedia rdepends on libg=
stvideo-0.10, but it isn't a build dependency? [build-deps]
> qtmultimedia-5.4.0+gitAUTOINC+f420ac286a: qtmultimedia-plugins rdepends=
 on gstreamer, but it isn't a build dependency? [build-deps]
> qtmultimedia-5.4.0+gitAUTOINC+f420ac286a: qtmultimedia-plugins rdepends=
 on libgstapp-0.10, but it isn't a build dependency? [build-deps]
> qtmultimedia-5.4.0+gitAUTOINC+f420ac286a: qtmultimedia-plugins rdepends=
 on libgstinterfaces-0.10, but it isn't a build dependency? [build-deps]
> qtmultimedia-5.4.0+gitAUTOINC+f420ac286a: qtmultimedia-plugins rdepends=
 on libgstpbutils-0.10, but it isn't a build dependency? [build-deps]
> qtmultimedia-5.4.0+gitAUTOINC+f420ac286a: qtmultimedia-plugins rdepends=
 on libgstphotography-0.10, but it isn't a build dependency? [build-deps]=

> qtwayland-5.4.0+gitAUTOINC+a0c5ba81f4: qtwayland-plugins rdepends on li=
bxcomposite, but it isn't a build dependency? [build-deps]
> qtwebkit-5.4.0+gitAUTOINC+3a2cb4770c: qtwebkit rdepends on libxcomposit=
e, but it isn't a build dependency? [build-deps]
> squid-3.4.7: squid rdepends on libpam, but it isn't a build dependency?=
 [build-deps]
> sysklogd-1.5.1: sysklogd rdepends on initscripts-functions, but it isn'=
t a build dependency? [build-deps]
> syslog-ng-3.5.4.1: syslog-ng-libs rdepends on util-linux-libuuid, but i=
t isn't a build dependency? [build-deps]
>=20
>=20
> count: 50	issue: file-rdeps
> apache2-2.4.10: apache2-dev requires /usr/bin/perl, but no providers in=
 its RDEPENDS [file-rdeps]
> chkconfig-1.3.58: chkconfig requires libnewt.so()(64bit), but no provid=
ers in its RDEPENDS [file-rdeps]
> chkconfig-1.3.58: chkconfig requires libnewt.so, but no providers in it=
s RDEPENDS [file-rdeps]
> cloud9-0.6: cloud9 requires /bin/bash, but no providers in its RDEPENDS=
 [file-rdeps]
> dvb-apps-1.1.1: dvb-apps requires libucsi.so()(64bit), libdvbapi.so()(6=
4bit), libdvbcfg.so()(64bit), libdvben50221.so()(64bit), libdvbsec.so()(6=
4bit), but no providers in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvb-apps requires libucsi.so, libdvben50221.so, libdvbs=
ec.so, libdvbcfg.so, libdvbapi.so, but no providers in its RDEPENDS [file=
-rdeps]
> dvb-apps-1.1.1: dvb-femon requires libdvbapi.so()(64bit), but no provid=
ers in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvb-femon requires libdvbapi.so, but no providers in it=
s RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvb-scan requires libdvbsec.so()(64bit), libdvbapi.so()=
(64bit), libdvbcfg.so()(64bit), but no providers in its RDEPENDS [file-rd=
eps]
> dvb-apps-1.1.1: dvb-scan requires libdvbsec.so, libdvbcfg.so, libdvbapi=
=2Eso, but no providers in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvbdate requires libucsi.so()(64bit), libdvbapi.so()(64=
bit), but no providers in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvbdate requires libucsi.so, libdvbapi.so, but no provi=
ders in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvbnet requires libdvbapi.so()(64bit), but no providers=
 in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvbnet requires libdvbapi.so, but no providers in its R=
DEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvbtraffic requires libdvbapi.so()(64bit), but no provi=
ders in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvbtraffic requires libdvbapi.so, but no providers in i=
ts RDEPENDS [file-rdeps]
> emacs-23.4: emacs requires /usr/bin/perl, but no providers in its RDEPE=
NDS [file-rdeps]
> fakeroot-1.18.4: fakeroot requires /bin/bash, but no providers in its R=
DEPENDS [file-rdeps]
> fbida-2.09+gitAUTOINC+6aa5563cb3: fbida requires /bin/bash, but no prov=
iders in its RDEPENDS [file-rdeps]
> foxtrotgps-1.1.1: foxtrotgps requires /usr/bin/python, /usr/bin/perl, b=
ut no providers in its RDEPENDS [file-rdeps]
> gammu-1.32.0: gammu requires /bin/bash, but no providers in its RDEPEND=
S [file-rdeps]
> gammu-1.32.0: gammu-dev requires /bin/bash, but no providers in its RDE=
PENDS [file-rdeps]
> gateone-1.2: gateone requires /bin/bash, but no providers in its RDEPEN=
DS [file-rdeps]
> giflib-4.1.6: giflib-utils requires /usr/bin/perl, but no providers in =
its RDEPENDS [file-rdeps]
> gnome-desktop-2.32.1: gnome-desktop requires /usr/bin/python, but no pr=
oviders in its RDEPENDS [file-rdeps]
> gnome-panel-2.32.1: gnome-panel requires /usr/bin/python, but no provid=
ers in its RDEPENDS [file-rdeps]
> groff-1.22.2: groff requires /bin/sed, but no providers in its RDEPENDS=
 [file-rdeps]
> gupnp-0.20.12: gupnp-dev requires /usr/bin/python, but no providers in =
its RDEPENDS [file-rdeps]
> hplip-3.12.6: hplip-filter requires /usr/bin/perl, but no providers in =
its RDEPENDS [file-rdeps]
> ipvsadm-1.26: ipvsadm requires /bin/bash, but no providers in its RDEPE=
NDS [file-rdeps]
> libbonobo-2.32.1: libbonobo requires /usr/bin/perl, but no providers in=
 its RDEPENDS [file-rdeps]
> libnewt-0.52.18: whiptail requires libnewt.so()(64bit), but no provider=
s in its RDEPENDS [file-rdeps]
> libnewt-0.52.18: whiptail requires libnewt.so, but no providers in its =
RDEPENDS [file-rdeps]
> libnewt-python-0.52.18: libnewt-python requires libnewt.so()(64bit), bu=
t no providers in its RDEPENDS [file-rdeps]
> libnewt-python-0.52.18: libnewt-python requires libnewt.so, but no prov=
iders in its RDEPENDS [file-rdeps]
> lio-utils-4.1+gitAUTOINC+28bd928655: lio-utils requires /bin/bash, but =
no providers in its RDEPENDS [file-rdeps]
> lmsensors-config-1.0: lmsensors-config-cgi requires /usr/bin/rrdcgi, bu=
t no providers in its RDEPENDS [file-rdeps]
> nodejs-0.8.18: nodejs requires /bin/bash, but no providers in its RDEPE=
NDS [file-rdeps]
> numptyphysics-0.2+svnr109: numptyphysics requires /bin/bash, /usr/bin/p=
erl, but no providers in its RDEPENDS [file-rdeps]
> opensaf-4.5.0: opensaf requires /bin/bash, /usr/bin/python, but no prov=
iders in its RDEPENDS [file-rdeps]
> packagekit-0.5.6: packagekit requires /bin/bash, but no providers in it=
s RDEPENDS [file-rdeps]
> pcsc-lite-1.8.6: pcsc-lite requires /usr/bin/python, but no providers i=
n its RDEPENDS [file-rdeps]
> pm-qa-0.4.14: pm-qa requires /bin/bash, but no providers in its RDEPEND=
S [file-rdeps]
> qt-creator-2.8.1: qt-creator requires /usr/bin/perl, but no providers i=
n its RDEPENDS [file-rdeps]
> tracker-0.14.2: tracker-nautilus-extension requires libnautilus-extensi=
on.so.1()(64bit), but no providers in its RDEPENDS [file-rdeps]
> tracker-0.14.2: tracker-nautilus-extension requires libnautilus-extensi=
on.so.1, but no providers in its RDEPENDS [file-rdeps]
> ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: ubx-utils requires /bin/bash, b=
ut no providers in its RDEPENDS [file-rdeps]
> unionfs-fuse-0.26: unionfs-fuse requires /bin/bash, but no providers in=
 its RDEPENDS [file-rdeps]
> usbpath-0.0+svnr3172: usbpath requires /usr/bin/perl, but no providers =
in its RDEPENDS [file-rdeps]
> wvstreams-4.6.1: wvstreams requires /usr/bin/perl, but no providers in =
its RDEPENDS [file-rdeps]
>=20
>=20
> count: 0	issue: version-going-backwards
>=20
>=20
>=20


--jqJQK0x577dnQTmPwQS7KkqfdvWGPHBH2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJU28tHAAoJEMDJd4rr0merEQYH/REEMx7mxg8eG7EuzMHZLlE4
1nC41WZwvJ7bxH8EGesJC6h4UgkBtRE6K4gUuN+F/X9W5uSQaVLIUicTf2uVoR8x
fRzfhnVDfQTQaNtUYKmmYAOc7/6MD+wlrwroHH2zCyzjIgd9vNpy9TTeQCjEPUFR
AYqAh5rwEhI9m2utxfDDN+6RdhBHRJBlSwmZFyYc7Y+b8vUlEX604fKQFHtK2d2g
hWSN21GIfCNhPp3ynxKhv7PvXhr0vLh6D/PM8y5BQjDuOfvDE0AfGDv/PSoIqBB2
oMhmkb6QbAbqeNQFFznUzYQKn2+WAxk/O/Vr9wjkbBlT9CbhXpaSEgg+Ad9XJQY=
=MVzr
-----END PGP SIGNATURE-----

--jqJQK0x577dnQTmPwQS7KkqfdvWGPHBH2--
