Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id E7FD672277;
	Fri, 27 Feb 2015 07:19:04 +0000 (UTC)
Received: by wghl18 with SMTP id l18so17845294wgh.7;
	Thu, 26 Feb 2015 23:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xuAkHZ7FZ1rn3Q+VhXhL7NRrU/+Z5JF6Ne75F1L8RGo=;
	b=oblnz6AuqF5yxiXwJH0nLTeIP7zAmnrv74PiQbmmFnaCiGv7ltLjFcv+39ZPAJIOG5
	OvWPfq8H7tsb5uEZmlppGNd556QwupTtqiJx6pjJrhPp3sIAM5iQNR5w/bHY9XHnoI9V
	/ngx0QINmUyiE8N70S6T+Loe3LBFwWEqJTDqRvft3NMjucZ5hq3KOD6JxB6SLtIRWpnc
	nnrdQ6DMTmz0Rt4a0bmnDIBTBOT/+7N8CgKHzlHW36R5TZWvVSV2f/fGf2ZcXOXsSfpT
	Wz79+DAfSTRjQmIbJSOE8evUVyV2rF8ZXpfMlkMKjZYMnNIE44JzSeVtgdytr/IGFqrW
	dlUQ==
X-Received: by 10.180.79.227 with SMTP id m3mr3625686wix.3.1425021545538;
	Thu, 26 Feb 2015 23:19:05 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	uc18sm1538014wib.0.2015.02.26.23.19.04
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Feb 2015 23:19:04 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 27 Feb 2015 08:19:23 +0100
To: akuster808 <akuster808@gmail.com>
Message-ID: <20150227071923.GD2309@jama>
References: <20150220230920.GA2306@jama>
 <54EA0B1E.5020905@gmail.com>
MIME-Version: 1.0
In-Reply-To: <54EA0B1E.5020905@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: State of bitbake world, Failed tasks 2015-02-20
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
X-List-Received-Date: Fri, 27 Feb 2015 07:19:05 -0000
X-Groupsio-MsgNum: 62793
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fXStkuK2IQBfcDe+"
Content-Disposition: inline

--fXStkuK2IQBfcDe+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 22, 2015 at 09:00:14AM -0800, akuster808 wrote:
> Martin
>=20
> On 02/20/2015 03:09 PM, Martin Jansa wrote:
> > http://www.openembedded.org/wiki/Bitbake_World_Status
> >
> > =3D=3D Failed tasks 2015-02-20 =3D=3D
> >
> > INFO: jenkins-job.sh-1.1.0 Complete log available at http://logs.nslu2-=
linux.org/buildlogs/oe/world/log.report.20150220_202958.log
> >
> > =3D=3D=3D common (5) =3D=3D=3D
> >      * /meta-openembedded/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3=
=2E4.bb, do_compile
> >      * /meta-openembedded/meta-networking/recipes-daemons/ptpd/ptpd_2.3=
=2E1-rc2.bb, do_compile
> >      * /meta-openembedded/meta-networking/recipes-support/nis/yp-tools_=
2.12.bb, do_compile
> >      * /meta-openembedded/meta-oe/recipes-extended/unixodbc/unixodbc_2.=
3.2.bb, do_configure
> >      * /meta-openembedded/meta-oe/recipes-support/start-stop-daemon/sta=
rt-stop-daemon_1.16.0.2.bb, do_compile
> >
> > =3D=3D=3D common-x86 (2) =3D=3D=3D
> >      * /meta-openembedded/meta-oe/recipes-kernel/ktap/ktap-module_0.4.b=
b, do_compile
> >      * /meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, =
do_compile
> >
> > =3D=3D=3D qemuarm (6) =3D=3D=3D
> >      * /meta-openembedded/meta-networking/recipes-connectivity/snort/sn=
ort_2.9.6.0.bb, do_configure
> >      * /meta-openembedded/meta-networking/recipes-support/wireshark/wir=
eshark_1.12.3.bb, do_configure
>=20
> Do you have my latest patch for wireshark?
>=20
>   b51998bf63a625757f0497342b53e0c351814fba in master-next

No, qemuarm was started before this was in master-next. My next round
didn't fail, I'll send updated report today. Thanks for fix.

>=20
> - armin
>=20
> >      * /meta-openembedded/meta-oe/recipes-benchmark/fio/fio_2.0.5.bb, d=
o_compile
> >      * /meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.1=
2.bb, do_compile
> >      * /meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18=
=2Ebb, do_compile
> >      * /meta-smartphone/meta-android/recipes-multimedia/android-audiosy=
stem/android-audiosystem_bzr.bb, do_compile
> >
> > =3D=3D=3D qemux86 (0) =3D=3D=3D
> >
> > =3D=3D=3D qemux86_64 (1) =3D=3D=3D
> >      * /meta-qt5/recipes-qt/qt5/qt5-creator_3.3.0.bb, do_populate_sysro=
ot
> >
> > =3D=3D=3D Number of failed tasks (27) =3D=3D=3D
> > {| class=3Dwikitable
> > |-
> > || qemuarm 	|| 11	 || http://logs.nslu2-linux.org/buildlogs/oe/world//l=
og.world.20150218_225838.log// || http://errors.yoctoproject.org:80/Errors/=
Build/4802/
> > |-
> > || qemux86 	|| 8	 || http://logs.nslu2-linux.org/buildlogs/oe/world//lo=
g.world.20150219_132710.log// || http://errors.yoctoproject.org:80/Errors/B=
uild/4806/
> > |-
> > || qemux86_64 	|| 8	 || http://logs.nslu2-linux.org/buildlogs/oe/world/=
/log.world.20150220_044745.log// || http://errors.yoctoproject.org:80/Error=
s/Build/4811/
> > |}
> >
> > =3D=3D=3D PNBLACKLISTs (52) =3D=3D=3D
> >
> > =3D=3D=3D QA issues (143) =3D=3D=3D
> > {| class=3Dwikitable
> > !| Count		||Issue
> > |-
> > ||0	||version-going-backwards
> > |-
> > ||1	||libdir
> > |-
> > ||26	||build-deps
> > |-
> > ||3	||already-stripped
> > |-
> > ||50	||file-rdeps
> > |-
> > ||63	||textrel
> > |}
> >
> >
> > PNBLACKLISTs:
> > openembedded-core/:
> > meta-browser:
> > meta-openembedded:
> > meta-efl/recipes-efl/e17/diskio_svn.bb:PNBLACKLIST[diskio] ?=3D "broken=
: switch to https://git.enlightenment.org/enlightenment/modules/diskio.git/=
 and fix 0.0.1+svnr82070-r0.0/E-MODULES-EXTRA/diskio/e-module-diskio.edc:58=
=2E invalid state name: 'off'. "default" state must always be first."
> > meta-efl/recipes-efl/efl/entrance_svn.bb:PNBLACKLIST[entrance] ?=3D "br=
oken: switch to https://git.enlightenment.org/misc/entrance.git and fix 0.0=
=2E4+svnr82070-r7/entrance/data/themes/old/default.edc:678. invalid state n=
ame: 'defaault'. "default" state must always be first."
> > meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.2.bb:PNBLACKLIST[i=
fuse] ?=3D "depends on blacklisted libimobiledevice"
> > meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLACKLIS=
T[gnome-mplayer] ?=3D "rdepends on blacklisted mplayer"
> > meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb:PNBLACKLIST[gcr] ?=3D "CONFLI=
CT: 4 files conflict with gnome-keyring"
> > meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb:PNBLACKLIST[gdm] ?=3D "Depen=
ds on broken polkit-gnome"
> > meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb:PNBLACKLIST=
[gnome-menus3] ?=3D "CONFLICT: 24 files are conflicting with gnome-menus"
> > meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[=
gnome-panel3] ?=3D "CONFLICT: depends on libgweather3 which conflicts with =
libgweather"
> > meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb:PNBLACKLIST[lib=
gweather3] ?=3D "CONFLICT: 876 files are conflicting with libgweather"
> > meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb:PNBLACKLIST[zenity] ?=
=3D "BROKEN: doesn't build with B!=3DS"
> > meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb:PNBLACKLIST[xbmc] =
?=3D "/usr/include/c++/ctime:70:11: error: '::gmtime' has not been declared"
> > meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb:PNBLACK=
LIST[coriander] ?=3D "BROKEN: fails to use SDL probably because libsdl-conf=
ig was removed, error: unknown type name 'SDL_Overlay'"
> > meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.b=
b:PNBLACKLIST[renderer-service-upnp] ?=3D "BROKEN: doesn't build with B!=3D=
S (trying to install rendererconsole.py from ${B} instead of ${S})"
> > meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb:PNBLACKLIST=
[snort] ?=3D "BROKEN: autotools processing causes OOM condition on configur=
e"
> > meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb:PNB=
LACKLIST[lksctp-tools] ?=3D "${@base_contains('DISTRO_FEATURES', 'ld-is-gol=
d', "BROKEN: fails to link against sctp_connectx symbol", '', d)}"
> > meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb=
:PNBLACKLIST[libimobiledevice] ?=3D "cannot run test program while cross co=
mpiling"
> > meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft66] ?=
=3D "BROKEN: depends on broken libftdi"
> > meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb:PNBLACKLIST[z=
eroc-ice] ?=3D "BROKEN: not compatible with default db version"
> > meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb:PNBLACKLIST[polki=
t-gnome] ?=3D "Fails to build, m4:configure.ac:125: recursion limit of 1024=
 exceeded, use -L<N> to change it"
> > meta-oe/recipes-extended/subsurface/subsurface_git.bb:PNBLACKLIST[subsu=
rface] ?=3D "Needs to be upgraded for compatibility with new libdivecompute=
r"
> > meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb:PNBLACKLIST[clutt=
er-box2d] ?=3D "BROKEN: doesn't build with B!=3DS"
> > meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:PNBLACKLIST[fim] ?=3D "BROK=
EN: doesn't build with B!=3DS (flex: can't open lex.lex)"
> > meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb:PNBLACKLIST=
[xf86-input-mtev] ?=3D "BROKEN: doesn't build with B!=3DS (Makefile without=
 ${S} in sed call)"
> > meta-oe/recipes-qt/qconnman/qconnman-e_git.bb:PNBLACKLIST[qconnman-e] ?=
=3D "BROKEN: doesn't work with B!=3DS, ls: cannot access *.pro: No such fil=
e or directory"
> > meta-oe/recipes-qt/qconnman/qconnman_git.bb:PNBLACKLIST[qconnman] ?=3D =
"BROKEN: doesn't work with B!=3DS, ls: cannot access *.pro: No such file or=
 directory"
> > meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb:PNBLACKLIST[sylpheed]=
 ?=3D "BROKEN: Doesn't work with B!=3DS"
> > meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb:PNBLACKLIST[apcupsd]=
 ?=3D "BROKEN: doesn't build with B!=3DS"
> > meta-oe/recipes-support/fltk/fltk_1.1.10.bb:PNBLACKLIST[fltk] ?=3D "bro=
ken: still uses /usr/bin/freetype-config"
> > meta-oe/recipes-support/maliit/maliit-framework_git.bb:PNBLACKLIST[mali=
it-framework] ?=3D "BROKEN: Wasn't updated to work with B!=3DS, maybe incor=
rectly inherits autotools"
> > meta-oe/recipes-support/maliit/maliit-plugins_git.bb:PNBLACKLIST[maliit=
-plugins] ?=3D "BROKEN: depends on broken maliit-framework"
> > meta-oe/recipes-support/mongodb/mongodb_git.bb:PNBLACKLIST[mongodb] ?=
=3D "Fails to build with system boost"
> > meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb:PNBLACKLIST[openmo=
tif] ?=3D "BROKEN: doesn't build with B!=3DS"
> > meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST[=
vala-terminal] ?=3D "BROKEN: Doesn't work with B!=3DS, touch: cannot touch =
`src/.stamp': No such file or directory"
> > meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb:PNBLACKLIST[xfce4-=
vala] ?=3D "Fails to build since vala upgrade to 0.26.1"
> > meta-qt5:
> > meta-smartphone:
> > meta-shr/recipes-shr/3rdparty/ffalarms_git.bb:PNBLACKLIST[ffalarms] =3D=
 "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> > meta-shr/recipes-shr/3rdparty/gwaterpas_0.3.bb:PNBLACKLIST[gwaterpas] ?=
=3D "broken: depends on blacklisted fltk"
> > meta-shr/recipes-shr/3rdparty/iliwi_git.bb:PNBLACKLIST[iliwi] =3D "Does=
n't build after vala upgrade from 0.24.0 to 0.26.1"
> > meta-shr/recipes-shr/3rdparty/intone_git.bb:PNBLACKLIST[intone] =3D "rd=
epends on blacklisted mplayer2"
> > meta-shr/recipes-shr/3rdparty/sensmon_git.bb:PNBLACKLIST[sensmon] =3D "=
Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> > meta-shr/recipes-shr/3rdparty/valacompass_git.bb:PNBLACKLIST[valacompas=
s] =3D "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> > meta-webos-ports:
> > conf/world_fixes.inc:PNBLACKLIST[mplayer2] =3D ""
> > conf/world_fixes.inc:PNBLACKLIST[android-system] =3D "depends on lxc fr=
om meta-virtualiazation which isn't included in my world builds"
> > conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-1080p] =3D "big and doesn=
't really need to be tested so much"
> > conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-480p] =3D "big and doesn'=
t really need to be tested so much"
> > conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn'=
t really need to be tested so much"
> > conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn'=
t really need to be tested so much"
> > conf/world_fixes.inc:PNBLACKLIST[tearsofsteel-1080p] =3D "big and doesn=
't really need to be tested so much"
> > conf/world_mask.inc:PNBLACKLIST[evince] =3D "fails to build"
> > conf/world_mask.inc:PNBLACKLIST[epiphany] =3D "fails to build"
> > conf/world_mask.inc:PNBLACKLIST[gnome-power-manager] =3D "fails to buil=
d"
> > conf/world_mask.inc:PNBLACKLIST[gnome-bluetooth] =3D "fails to build"
> > conf/world_mask.inc:PNBLACKLIST[media-ctl] =3D "fails to build"
> > QA issues by type:
> > count: 3	issue: already-stripped
> > qwt-6.0.1: File '/usr/lib/libqwt.so.6.0.1' from qwt was already strippe=
d, this will prevent future debugging! [already-stripped]
> > qwt-6.0.1: File '/usr/lib/libqwtmathml.so.6.0.1' from qwt was already s=
tripped, this will prevent future debugging! [already-stripped]
> > qwt-6.0.1: File '/usr/lib/qt4/plugins/designer/libqwt_designer_plugin.s=
o' from qwt was already stripped, this will prevent future debugging! [alre=
ady-stripped]
> >
> >
> > count: 1	issue: libdir
> > chromium-dbg: found library in wrong location: /usr/bin/chrome/.debug/l=
ibffmpegsumo.so [libdir]
> >
> >
> > count: 63	issue: textrel
> > chromium-38.0.2125.101: ELF binary '/tmp/work/i586-oe-linux/chromium/38=
=2E0.2125.101-r0/packages-split/chromium/usr/bin/chrome/libffmpegsumo.so' h=
as relocations in .text [textrel]
> > gstreamer1.0-libav-1.4.5: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi=
/gstreamer1.0-libav/1.4.5-r0/packages-split/gstreamer1.0-libav/usr/lib/gstr=
eamer-1.0/libgstlibav.so' has relocations in .text [textrel]
> > gstreamer1.0-libav-1.4.5: ELF binary '/tmp/work/i586-oe-linux/gstreamer=
1.0-libav/1.4.5-r0/packages-split/gstreamer1.0-libav/usr/lib/gstreamer-1.0/=
libgstlibav.so' has relocations in .text [textrel]
> > libav-9.16: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/libav/9.16-r0=
/packages-split/libavcodec/usr/lib/libavcodec.so.54.35.0' has relocations i=
n .text [textrel]
> > libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-=
split/libavcodec/usr/lib/libavcodec.so.54.35.0' has relocations in .text [t=
extrel]
> > libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-=
split/libavdevice/usr/lib/libavdevice.so.53.2.0' has relocations in .text [=
textrel]
> > libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-=
split/libavfilter/usr/lib/libavfilter.so.3.3.0' has relocations in .text [t=
extrel]
> > libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-=
split/libavformat/usr/lib/libavformat.so.54.20.4' has relocations in .text =
[textrel]
> > libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-=
split/libavresample/usr/lib/libavresample.so.1.0.1' has relocations in .tex=
t [textrel]
> > libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-=
split/libavutil/usr/lib/libavutil.so.52.3.0' has relocations in .text [text=
rel]
> > libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-=
split/libswscale/usr/lib/libswscale.so.2.1.1' has relocations in .text [tex=
trel]
> > libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary '/tmp/work/armv5e-=
oe-linux-gnueabi/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split=
/libpostproc/usr/lib/libpostproc.so.52.3.0' has relocations in .text [textr=
el]
> > libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary '/tmp/work/i586-oe=
-linux/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split/libpostpr=
oc/usr/lib/libpostproc.so.52.3.0' has relocations in .text [textrel]
> > mpg123-1.21.0: ELF binary '/tmp/work/i586-oe-linux/mpg123/1.21.0-r0/pac=
kages-split/mpg123/usr/lib/libmpg123.so.0.40.3' has relocations in .text [t=
extrel]
> > python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.=
3.3-r1.0/packages-split/python3-audio/usr/lib/python3.3/lib-dynload/ossaudi=
odev.cpython-33m.so' has relocations in .text [textrel]
> > python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.=
3.3-r1.0/packages-split/python3-codecs/usr/lib/python3.3/lib-dynload/_codec=
s_tw.cpython-33m.so' has relocations in .text [textrel]
> > python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.=
3.3-r1.0/packages-split/python3-core/usr/lib/python3.3/lib-dynload/binascii=
=2Ecpython-33m.so' has relocations in .text [textrel]
> > python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.=
3.3-r1.0/packages-split/python3-crypt/usr/lib/python3.3/lib-dynload/_sha256=
=2Ecpython-33m.so' has relocations in .text [textrel]
> > python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.=
3.3-r1.0/packages-split/python3-ctypes/usr/lib/python3.3/lib-dynload/_ctype=
s_test.cpython-33m.so' has relocations in .text [textrel]
> > python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.=
3.3-r1.0/packages-split/python3-curses/usr/lib/python3.3/lib-dynload/_curse=
s.cpython-33m.so' has relocations in .text [textrel]
> > python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.=
3.3-r1.0/packages-split/python3-elementtree/usr/lib/python3.3/lib-dynload/_=
elementtree.cpython-33m.so' has relocations in .text [textrel]
> > python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.=
3.3-r1.0/packages-split/python3-fcntl/usr/lib/python3.3/lib-dynload/fcntl.c=
python-33m.so' has relocations in .text [textrel]
> > python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.=
3.3-r1.0/packages-split/python3-gdbm/usr/lib/python3.3/lib-dynload/_gdbm.cp=
ython-33m.so' has relocations in .text [textrel]
> > python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.=
3.3-r1.0/packages-split/python3-io/usr/lib/python3.3/lib-dynload/_socket.cp=
ython-33m.so' has relocations in .text [textrel]
> > python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.=
3.3-r1.0/packages-split/python3-json/usr/lib/python3.3/lib-dynload/_json.cp=
ython-33m.so' has relocations in .text [textrel]
> > python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.=
3.3-r1.0/packages-split/python3-lang/usr/lib/python3.3/lib-dynload/_bisect.=
cpython-33m.so' has relocations in .text [textrel]
> > python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.=
3.3-r1.0/packages-split/python3-math/usr/lib/python3.3/lib-dynload/cmath.cp=
ython-33m.so' has relocations in .text [textrel]
> > python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.=
3.3-r1.0/packages-split/python3-misc/usr/lib/python3.3/lib-dynload/_posixsu=
bprocess.cpython-33m.so' has relocations in .text [textrel]
> > python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.=
3.3-r1.0/packages-split/python3-mmap/usr/lib/python3.3/lib-dynload/mmap.cpy=
thon-33m.so' has relocations in .text [textrel]
> > python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.=
3.3-r1.0/packages-split/python3-multiprocessing/usr/lib/python3.3/lib-dynlo=
ad/_multiprocessing.cpython-33m.so' has relocations in .text [textrel]
> > python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.=
3.3-r1.0/packages-split/python3-profile/usr/lib/python3.3/lib-dynload/_lspr=
of.cpython-33m.so' has relocations in .text [textrel]
> > python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.=
3.3-r1.0/packages-split/python3-readline/usr/lib/python3.3/lib-dynload/read=
line.cpython-33m.so' has relocations in .text [textrel]
> > python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.=
3.3-r1.0/packages-split/python3-resource/usr/lib/python3.3/lib-dynload/reso=
urce.cpython-33m.so' has relocations in .text [textrel]
> > python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.=
3.3-r1.0/packages-split/python3-syslog/usr/lib/python3.3/lib-dynload/syslog=
=2Ecpython-33m.so' has relocations in .text [textrel]
> > python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.=
3.3-r1.0/packages-split/python3-textutils/usr/lib/python3.3/lib-dynload/_cs=
v.cpython-33m.so' has relocations in .text [textrel]
> > python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.=
3.3-r1.0/packages-split/python3-unixadmin/usr/lib/python3.3/lib-dynload/grp=
=2Ecpython-33m.so' has relocations in .text [textrel]
> > python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.=
3.3-r1.0/packages-split/python3-xml/usr/lib/python3.3/lib-dynload/pyexpat.c=
python-33m.so' has relocations in .text [textrel]
> > python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/p=
ackages-split/python3-audio/usr/lib/python3.3/lib-dynload/ossaudiodev.cpyth=
on-33m.so' has relocations in .text [textrel]
> > python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/p=
ackages-split/python3-codecs/usr/lib/python3.3/lib-dynload/_codecs_cn.cpyth=
on-33m.so' has relocations in .text [textrel]
> > python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/p=
ackages-split/python3-core/usr/lib/python3.3/lib-dynload/binascii.cpython-3=
3m.so' has relocations in .text [textrel]
> > python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/p=
ackages-split/python3-crypt/usr/lib/python3.3/lib-dynload/_sha256.cpython-3=
3m.so' has relocations in .text [textrel]
> > python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/p=
ackages-split/python3-ctypes/usr/lib/python3.3/lib-dynload/_ctypes_test.cpy=
thon-33m.so' has relocations in .text [textrel]
> > python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/p=
ackages-split/python3-curses/usr/lib/python3.3/lib-dynload/_curses.cpython-=
33m.so' has relocations in .text [textrel]
> > python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/p=
ackages-split/python3-elementtree/usr/lib/python3.3/lib-dynload/_elementtre=
e.cpython-33m.so' has relocations in .text [textrel]
> > python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/p=
ackages-split/python3-fcntl/usr/lib/python3.3/lib-dynload/fcntl.cpython-33m=
=2Eso' has relocations in .text [textrel]
> > python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/p=
ackages-split/python3-gdbm/usr/lib/python3.3/lib-dynload/_gdbm.cpython-33m.=
so' has relocations in .text [textrel]
> > python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/p=
ackages-split/python3-io/usr/lib/python3.3/lib-dynload/_socket.cpython-33m.=
so' has relocations in .text [textrel]
> > python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/p=
ackages-split/python3-json/usr/lib/python3.3/lib-dynload/_json.cpython-33m.=
so' has relocations in .text [textrel]
> > python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/p=
ackages-split/python3-lang/usr/lib/python3.3/lib-dynload/_bisect.cpython-33=
m.so' has relocations in .text [textrel]
> > python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/p=
ackages-split/python3-math/usr/lib/python3.3/lib-dynload/cmath.cpython-33m.=
so' has relocations in .text [textrel]
> > python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/p=
ackages-split/python3-misc/usr/lib/python3.3/lib-dynload/_md5.cpython-33m.s=
o' has relocations in .text [textrel]
> > python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/p=
ackages-split/python3-mmap/usr/lib/python3.3/lib-dynload/mmap.cpython-33m.s=
o' has relocations in .text [textrel]
> > python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/p=
ackages-split/python3-multiprocessing/usr/lib/python3.3/lib-dynload/_multip=
rocessing.cpython-33m.so' has relocations in .text [textrel]
> > python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/p=
ackages-split/python3-profile/usr/lib/python3.3/lib-dynload/_lsprof.cpython=
-33m.so' has relocations in .text [textrel]
> > python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/p=
ackages-split/python3-readline/usr/lib/python3.3/lib-dynload/readline.cpyth=
on-33m.so' has relocations in .text [textrel]
> > python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/p=
ackages-split/python3-resource/usr/lib/python3.3/lib-dynload/resource.cpyth=
on-33m.so' has relocations in .text [textrel]
> > python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/p=
ackages-split/python3-syslog/usr/lib/python3.3/lib-dynload/syslog.cpython-3=
3m.so' has relocations in .text [textrel]
> > python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/p=
ackages-split/python3-textutils/usr/lib/python3.3/lib-dynload/_csv.cpython-=
33m.so' has relocations in .text [textrel]
> > python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/p=
ackages-split/python3-unixadmin/usr/lib/python3.3/lib-dynload/grp.cpython-3=
3m.so' has relocations in .text [textrel]
> > python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/p=
ackages-split/python3-xml/usr/lib/python3.3/lib-dynload/pyexpat.cpython-33m=
=2Eso' has relocations in .text [textrel]
> > qtwebkit-5.4.0+gitAUTOINC+3a2cb4770c: ELF binary '/tmp/work/i586-oe-lin=
ux/qtwebkit/5.4.0+gitAUTOINC+3a2cb4770c-r0/packages-split/qtwebkit/usr/lib/=
libQt5WebKit.so.5.4.0' has relocations in .text [textrel]
> > webkit-efl-1.11.0: ELF binary '/tmp/work/i586-oe-linux/webkit-efl/1_1.1=
1.0-r0/packages-split/webkit-efl/usr/lib/libjavascriptcore_efl.so.1.11.0' h=
as relocations in .text [textrel]
> > webkit-gtk-1.8.3: ELF binary '/tmp/work/i586-oe-linux/webkit-gtk/1.8.3-=
r1/packages-split/libjavascriptcore/usr/lib/libjavascriptcoregtk-1.0.so.0.1=
3.4' has relocations in .text [textrel]
> >
> >
> > count: 26	issue: build-deps
> > emacs-23.4: emacs rdepends on ncurses-libtinfo, but it isn't a build de=
pendency? [build-deps]
> > exquisite-0.0.1+svnr82070: exquisite rdepends on initscripts-functions,=
 but it isn't a build dependency? [build-deps]
> > freetds-0.92.79: freetds rdepends on readline, but it isn't a build dep=
endency? [build-deps]
> > geoclue-2.0.0: geoclue rdepends on geoip, but it isn't a build dependen=
cy? [build-deps]
> > glade3-3.8.5: glade3 rdepends on libpython2, but it isn't a build depen=
dency? [build-deps]
> > gpm-1.99.7: gpm rdepends on initscripts-functions, but it isn't a build=
 dependency? [build-deps]
> > grub-efi-2.00: grub-efi rdepends on fuse, but it isn't a build dependen=
cy? [build-deps]
> > irda-utils-0.9.18: irda-utils rdepends on initscripts-functions, but it=
 isn't a build dependency? [build-deps]
> > libwebp-0.4.0: libwebp-bin rdepends on libgl-mesa, but it isn't a build=
 dependency? [build-deps]
> > libwebp-0.4.0: libwebp-bin rdepends on mesa-glut, but it isn't a build =
dependency? [build-deps]
> > log4c-1.2.4: log4c rdepends on expat, but it isn't a build dependency? =
[build-deps]
> > mpd-0.19.1: mpd rdepends on libsmbclient, but it isn't a build dependen=
cy? [build-deps]
> > netkit-rwho-0.17: netkit-rwho-client rdepends on initscripts-functions,=
 but it isn't a build dependency? [build-deps]
> > pkcs11-helper-1.11: pkcs11-helper rdepends on nspr, but it isn't a buil=
d dependency? [build-deps]
> > pkcs11-helper-1.11: pkcs11-helper rdepends on nss, but it isn't a build=
 dependency? [build-deps]
> > qt5-creator-3.3.0: qt5-creator rdepends on qt-creator, but it isn't a b=
uild dependency? [build-deps]
> > qt5-creator-3.3.0: qt5-creator rdepends on qtquick1, but it isn't a bui=
ld dependency? [build-deps]
> > qtwayland-5.4.0+gitAUTOINC+50d6c0ae94: qtwayland-plugins rdepends on li=
bxcomposite, but it isn't a build dependency? [build-deps]
> > qtwebkit-5.4.0+gitAUTOINC+3a2cb4770c: qtwebkit rdepends on libxcomposit=
e, but it isn't a build dependency? [build-deps]
> > sox-14.4.0: sox rdepends on libflac, but it isn't a build dependency? [=
build-deps]
> > stunnel-5.10: stunnel rdepends on libcap, but it isn't a build dependen=
cy? [build-deps]
> > stunnel-5.10: stunnel rdepends on liblzma, but it isn't a build depende=
ncy? [build-deps]
> > stunnel-5.10: stunnel rdepends on libsystemd, but it isn't a build depe=
ndency? [build-deps]
> > sysklogd-1.5.1: sysklogd rdepends on initscripts-functions, but it isn'=
t a build dependency? [build-deps]
> > tcpdump-4.6.1: tcpdump rdepends on libsmi, but it isn't a build depende=
ncy? [build-deps]
> > vlc-2.1.4: vlc rdepends on libsamplerate0, but it isn't a build depende=
ncy? [build-deps]
> >
> >
> > count: 50	issue: file-rdeps
> > apache2-2.4.10: apache2-dev requires /usr/bin/perl, but no providers in=
 its RDEPENDS [file-rdeps]
> > chkconfig-1.3.58: chkconfig requires libnewt.so()(64bit), but no provid=
ers in its RDEPENDS [file-rdeps]
> > chkconfig-1.3.58: chkconfig requires libnewt.so, but no providers in it=
s RDEPENDS [file-rdeps]
> > cloud9-0.6: cloud9 requires /bin/bash, but no providers in its RDEPENDS=
 [file-rdeps]
> > dvb-apps-1.1.1: dvb-apps requires libucsi.so()(64bit), libdvbapi.so()(6=
4bit), libdvbcfg.so()(64bit), libdvben50221.so()(64bit), libdvbsec.so()(64b=
it), but no providers in its RDEPENDS [file-rdeps]
> > dvb-apps-1.1.1: dvb-apps requires libucsi.so, libdvben50221.so, libdvbs=
ec.so, libdvbcfg.so, libdvbapi.so, but no providers in its RDEPENDS [file-r=
deps]
> > dvb-apps-1.1.1: dvb-femon requires libdvbapi.so()(64bit), but no provid=
ers in its RDEPENDS [file-rdeps]
> > dvb-apps-1.1.1: dvb-femon requires libdvbapi.so, but no providers in it=
s RDEPENDS [file-rdeps]
> > dvb-apps-1.1.1: dvb-scan requires libdvbsec.so()(64bit), libdvbapi.so()=
(64bit), libdvbcfg.so()(64bit), but no providers in its RDEPENDS [file-rdep=
s]
> > dvb-apps-1.1.1: dvb-scan requires libdvbsec.so, libdvbcfg.so, libdvbapi=
=2Eso, but no providers in its RDEPENDS [file-rdeps]
> > dvb-apps-1.1.1: dvbdate requires libucsi.so()(64bit), libdvbapi.so()(64=
bit), but no providers in its RDEPENDS [file-rdeps]
> > dvb-apps-1.1.1: dvbdate requires libucsi.so, libdvbapi.so, but no provi=
ders in its RDEPENDS [file-rdeps]
> > dvb-apps-1.1.1: dvbnet requires libdvbapi.so()(64bit), but no providers=
 in its RDEPENDS [file-rdeps]
> > dvb-apps-1.1.1: dvbnet requires libdvbapi.so, but no providers in its R=
DEPENDS [file-rdeps]
> > dvb-apps-1.1.1: dvbtraffic requires libdvbapi.so()(64bit), but no provi=
ders in its RDEPENDS [file-rdeps]
> > dvb-apps-1.1.1: dvbtraffic requires libdvbapi.so, but no providers in i=
ts RDEPENDS [file-rdeps]
> > emacs-23.4: emacs requires /usr/bin/perl, but no providers in its RDEPE=
NDS [file-rdeps]
> > fakeroot-1.18.4: fakeroot requires /bin/bash, but no providers in its R=
DEPENDS [file-rdeps]
> > fbida-2.09+gitAUTOINC+6aa5563cb3: fbida requires /bin/bash, but no prov=
iders in its RDEPENDS [file-rdeps]
> > foxtrotgps-1.1.1: foxtrotgps requires /usr/bin/python, /usr/bin/perl, b=
ut no providers in its RDEPENDS [file-rdeps]
> > gammu-1.32.0: gammu requires /bin/bash, but no providers in its RDEPEND=
S [file-rdeps]
> > gammu-1.32.0: gammu-dev requires /bin/bash, but no providers in its RDE=
PENDS [file-rdeps]
> > gateone-1.2: gateone requires /bin/bash, but no providers in its RDEPEN=
DS [file-rdeps]
> > giflib-4.1.6: giflib-utils requires /usr/bin/perl, but no providers in =
its RDEPENDS [file-rdeps]
> > gnome-desktop-2.32.1: gnome-desktop requires /usr/bin/python, but no pr=
oviders in its RDEPENDS [file-rdeps]
> > gnome-panel-2.32.1: gnome-panel requires /usr/bin/python, but no provid=
ers in its RDEPENDS [file-rdeps]
> > groff-1.22.2: groff requires /bin/sed, but no providers in its RDEPENDS=
 [file-rdeps]
> > gupnp-0.20.12: gupnp-dev requires /usr/bin/python, but no providers in =
its RDEPENDS [file-rdeps]
> > hplip-3.12.6: hplip-filter requires /usr/bin/perl, but no providers in =
its RDEPENDS [file-rdeps]
> > ipvsadm-1.26: ipvsadm requires /bin/bash, but no providers in its RDEPE=
NDS [file-rdeps]
> > libbonobo-2.32.1: libbonobo requires /usr/bin/perl, but no providers in=
 its RDEPENDS [file-rdeps]
> > libnewt-0.52.18: whiptail requires libnewt.so()(64bit), but no provider=
s in its RDEPENDS [file-rdeps]
> > libnewt-0.52.18: whiptail requires libnewt.so, but no providers in its =
RDEPENDS [file-rdeps]
> > libnewt-python-0.52.18: libnewt-python requires libnewt.so()(64bit), bu=
t no providers in its RDEPENDS [file-rdeps]
> > libnewt-python-0.52.18: libnewt-python requires libnewt.so, but no prov=
iders in its RDEPENDS [file-rdeps]
> > lio-utils-4.1+gitAUTOINC+28bd928655: lio-utils requires /bin/bash, but =
no providers in its RDEPENDS [file-rdeps]
> > lmsensors-config-1.0: lmsensors-config-cgi requires /usr/bin/rrdcgi, bu=
t no providers in its RDEPENDS [file-rdeps]
> > nodejs-0.8.18: nodejs requires /bin/bash, but no providers in its RDEPE=
NDS [file-rdeps]
> > numptyphysics-0.2+svnr109: numptyphysics requires /bin/bash, /usr/bin/p=
erl, but no providers in its RDEPENDS [file-rdeps]
> > opensaf-4.5.0: opensaf requires /bin/bash, /usr/bin/python, but no prov=
iders in its RDEPENDS [file-rdeps]
> > packagekit-0.5.6: packagekit requires /bin/bash, but no providers in it=
s RDEPENDS [file-rdeps]
> > pcsc-lite-1.8.6: pcsc-lite requires /usr/bin/python, but no providers i=
n its RDEPENDS [file-rdeps]
> > pm-qa-0.4.14: pm-qa requires /bin/bash, but no providers in its RDEPEND=
S [file-rdeps]
> > qt-creator-2.8.1: qt-creator requires /usr/bin/perl, but no providers i=
n its RDEPENDS [file-rdeps]
> > tracker-0.14.2: tracker-nautilus-extension requires libnautilus-extensi=
on.so.1()(64bit), but no providers in its RDEPENDS [file-rdeps]
> > tracker-0.14.2: tracker-nautilus-extension requires libnautilus-extensi=
on.so.1, but no providers in its RDEPENDS [file-rdeps]
> > ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: ubx-utils requires /bin/bash, b=
ut no providers in its RDEPENDS [file-rdeps]
> > unionfs-fuse-0.26: unionfs-fuse requires /bin/bash, but no providers in=
 its RDEPENDS [file-rdeps]
> > usbpath-0.0+svnr3172: usbpath requires /usr/bin/perl, but no providers =
in its RDEPENDS [file-rdeps]
> > wvstreams-4.6.1: wvstreams requires /usr/bin/perl, but no providers in =
its RDEPENDS [file-rdeps]
> >
> >
> > count: 0	issue: version-going-backwards
> >
> >
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fXStkuK2IQBfcDe+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTwGnsACgkQN1Ujt2V2gBxZfQCgsWpLMTZi8IHos7RBC3bkgkCG
l88AnAkzl08pz7O+YmAu/L5XcdSoQyR8
=V4ok
-----END PGP SIGNATURE-----

--fXStkuK2IQBfcDe+--
