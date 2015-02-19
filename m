Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2F670735BA;
	Thu, 19 Feb 2015 11:46:11 +0000 (UTC)
Received: by wevm14 with SMTP id m14so6716770wev.13;
	Thu, 19 Feb 2015 03:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8Y6xI3sD1Bm3Lu9fL8D/4FH8zzC3+w52P47cju/e+1s=;
	b=bq9xMruP+qXfuJ5Sg+vp5e7DZNf5GlpKXPchvx9/hJlnlxKOngcUdeyrPMKYjAGlWE
	75FOmMsIjhcmQmrE2tdqEpWsXZo3spuH3dzvXl3G4G5hvQRTP4lfCZbgrN4dyIj/Qs6S
	q06n9ew2dhmiYzyUx2nSCmpoTni7+jhEDR2WULtSX1hucUNH9M9/t/kurWNiQkW4vVSt
	6vDcfMlZ4WyzCq3TLMQblIrnOz8yjOc9tQKPt263AfXnJ3Nbx68xUK9DUFHRLLJr0RRt
	wK3PjDw+ABcb416G+vO3ocH4k3BoxeBG0+PUJ6TqVs8chF9Ky3zDPHI2J1JsYpgz74k3
	l4QA==
X-Received: by 10.194.61.12 with SMTP id l12mr7994929wjr.139.1424346372707;
	Thu, 19 Feb 2015 03:46:12 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	hs7sm29844508wib.4.2015.02.19.03.46.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Feb 2015 03:46:11 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 19 Feb 2015 12:46:15 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20150219114615.GA2311@jama>
References: <20150218155738.GA2276@jama>
MIME-Version: 1.0
In-Reply-To: <20150218155738.GA2276@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: State of bitbake world, Failed tasks 2015-02-18
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
X-List-Received-Date: Thu, 19 Feb 2015 11:46:13 -0000
X-Groupsio-MsgNum: 62540
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Content-Disposition: inline

--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2015 at 04:57:38PM +0100, Martin Jansa wrote:
> http://www.openembedded.org/wiki/Bitbake_World_Status
>=20
> The metadata were updated between the builds, so the results aren't very
> consistent between MACHINEs, but still it means that we have more issues
> than last time, please help fixing them.

snort failure is again very nasty, because it's m4 which eats all
available memory and swap before it's killed by OOM killer.

Luckily it always picked m4

[Wed Feb 18 19:00:51 2015] Out of memory: Kill process 28522 (m4) score 961=
 or sacrifice child
[Wed Feb 18 19:10:51 2015] Out of memory: Kill process 45228 (m4) score 958=
 or sacrifice child
[Wed Feb 18 19:20:18 2015] Out of memory: Kill process 76957 (m4) score 961=
 or sacrifice child
[Wed Feb 18 19:30:00 2015] Out of memory: Kill process 78689 (m4) score 962=
 or sacrifice child
[Wed Feb 18 19:38:46 2015] Out of memory: Kill process 80602 (m4) score 962=
 or sacrifice child
[Wed Feb 18 21:57:02 2015] Out of memory: Kill process 65803 (m4) score 970=
 or sacrifice child
[Wed Feb 18 22:05:02 2015] Out of memory: Kill process 66297 (m4) score 970=
 or sacrifice child
[Wed Feb 18 22:13:00 2015] Out of memory: Kill process 69325 (m4) score 970=
 or sacrifice child
[Wed Feb 18 22:21:01 2015] Out of memory: Kill process 69908 (m4) score 970=
 or sacrifice child
[Wed Feb 18 22:29:00 2015] Out of memory: Kill process 70511 (m4) score 970=
 or sacrifice child
[Wed Feb 18 22:36:55 2015] Out of memory: Kill process 71169 (m4) score 970=
 or sacrifice child
[Wed Feb 18 22:44:55 2015] Out of memory: Kill process 71675 (m4) score 970=
 or sacrifice child
[Thu Feb 19 03:28:56 2015] Out of memory: Kill process 71342 (m4) score 970=
 or sacrifice child

> =3D=3D Failed tasks 2015-02-18 =3D=3D
>=20
> INFO: jenkins-job.sh-1.1.0 Complete log available at http://logs.nslu2-li=
nux.org/buildlogs/oe/world/log.report.20150218_154659.log
>=20
> =3D=3D=3D common (9) =3D=3D=3D
>     * /meta-openembedded/meta-efl/recipes-efl/e17/diskio_svn.bb, do_compi=
le
>     * /meta-openembedded/meta-efl/recipes-efl/efl/entrance_svn.bb, do_com=
pile
>     * /meta-openembedded/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.=
bb, do_compile
>     * /meta-openembedded/meta-networking/recipes-connectivity/snort/snort=
_2.9.6.0.bb, do_configure
>     * /meta-openembedded/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-=
rc2.bb, do_compile
>     * /meta-openembedded/meta-networking/recipes-support/wireshark/wiresh=
ark_1.12.3.bb, do_configure
>     * /meta-openembedded/meta-oe/recipes-extended/unixodbc/unixodbc_2.3.2=
=2Ebb, do_configure
>     * /meta-openembedded/meta-oe/recipes-support/fltk/fltk_1.1.10.bb, do_=
compile
>     * /meta-openembedded/meta-oe/recipes-support/start-stop-daemon/start-=
stop-daemon_1.16.0.2.bb, do_compile
>=20
> =3D=3D=3D common-x86 (3) =3D=3D=3D
>     * /meta-openembedded/meta-networking/recipes-support/nis/yp-tools_2.1=
2.bb, do_compile
>     * /meta-openembedded/meta-oe/recipes-kernel/ktap/ktap-module_0.4.bb, =
do_compile
>     * /meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_=
compile
>=20
> =3D=3D=3D qemuarm (4) =3D=3D=3D
>     * /meta-openembedded/meta-oe/recipes-benchmark/fio/fio_2.0.5.bb, do_c=
ompile
>     * /meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.b=
b, do_compile
>     * /meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb=
, do_compile
>     * /meta-smartphone/meta-android/recipes-multimedia/android-audiosyste=
m/android-audiosystem_bzr.bb, do_compile
>=20
> =3D=3D=3D qemux86 (3) =3D=3D=3D
>     * /openembedded-core/meta/recipes-devtools/valgrind/valgrind_3.10.1.b=
b, do_configure
>     * /openembedded-core/meta/recipes-qt/qt4/qt-mobility-embedded_1.2.0.b=
b, do_compile
>     * /openembedded-core/meta/recipes-qt/qt4/qt-mobility-x11_1.2.0.bb, do=
_compile
>=20
> =3D=3D=3D qemux86_64 (1) =3D=3D=3D
>     * /openembedded-core/meta/recipes-bsp/grub/grub-efi_2.00.bb, do_compi=
le
>=20
> =3D=3D=3D Number of failed tasks (41) =3D=3D=3D
> {| class=3Dwikitable
> |-
> || qemuarm 	|| 13	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log=
=2Eworld.20150216_162745.log// || http://errors.yoctoproject.org:80/Errors/=
Build/4712/
> |-
> || qemux86 	|| 15	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log=
=2Eworld.20150217_073432.log// || http://errors.yoctoproject.org:80/Errors/=
Build/4723/
> |-
> || qemux86_64 	|| 13	 || http://logs.nslu2-linux.org/buildlogs/oe/world//=
log.world.20150218_002454.log// || http://errors.yoctoproject.org:80/Errors=
/Build/4791/
> |}
>=20
> =3D=3D=3D PNBLACKLISTs (47) =3D=3D=3D
>=20
> =3D=3D=3D QA issues (140) =3D=3D=3D
> {| class=3Dwikitable
> !| Count		||Issue
> |-
> ||0	||version-going-backwards
> |-
> ||1	||libdir
> |-
> ||23	||build-deps
> |-
> ||3	||already-stripped
> |-
> ||50	||file-rdeps
> |-
> ||63	||textrel
> |}
>=20
> PNBLACKLISTs:
> openembedded-core/:
> meta-browser:
> meta-openembedded:
> meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.2.bb:PNBLACKLIST[ifu=
se] ?=3D "depends on blacklisted libimobiledevice"
> meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLACKLIST[=
gnome-mplayer] ?=3D "rdepends on blacklisted mplayer"
> meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb:PNBLACKLIST[gcr] ?=3D "CONFLICT=
: 4 files conflict with gnome-keyring"
> meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb:PNBLACKLIST[gdm] ?=3D "Depends=
 on broken polkit-gnome"
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
> meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb:PNBLA=
CKLIST[lksctp-tools] ?=3D "${@base_contains('DISTRO_FEATURES', 'ld-is-gold'=
, "BROKEN: fails to link against sctp_connectx symbol", '', d)}"
> meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb:P=
NBLACKLIST[libimobiledevice] ?=3D "cannot run test program while cross comp=
iling"
> meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft66] ?=
=3D "BROKEN: depends on broken libftdi"
> meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb:PNBLACKLIST[zer=
oc-ice] ?=3D "BROKEN: not compatible with default db version"
> meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb:PNBLACKLIST[polkit-=
gnome] ?=3D "Fails to build, m4:configure.ac:125: recursion limit of 1024 e=
xceeded, use -L<N> to change it"
> meta-oe/recipes-extended/subsurface/subsurface_git.bb:PNBLACKLIST[subsurf=
ace] ?=3D "Needs to be upgraded for compatibility with new libdivecomputer"
> meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb:PNBLACKLIST[clutter=
-box2d] ?=3D "BROKEN: doesn't build with B!=3DS"
> meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:PNBLACKLIST[fim] ?=3D "BROKEN=
: doesn't build with B!=3DS (flex: can't open lex.lex)"
> meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb:PNBLACKLIST[x=
f86-input-mtev] ?=3D "BROKEN: doesn't build with B!=3DS (Makefile without $=
{S} in sed call)"
> meta-oe/recipes-qt/qconnman/qconnman-e_git.bb:PNBLACKLIST[qconnman-e] ?=
=3D "BROKEN: doesn't work with B!=3DS, ls: cannot access *.pro: No such fil=
e or directory"
> meta-oe/recipes-qt/qconnman/qconnman_git.bb:PNBLACKLIST[qconnman] ?=3D "B=
ROKEN: doesn't work with B!=3DS, ls: cannot access *.pro: No such file or d=
irectory"
> meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb:PNBLACKLIST[sylpheed] ?=
=3D "BROKEN: Doesn't work with B!=3DS"
> meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb:PNBLACKLIST[apcupsd] ?=
=3D "BROKEN: doesn't build with B!=3DS"
> meta-oe/recipes-support/maliit/maliit-framework_git.bb:PNBLACKLIST[maliit=
-framework] ?=3D "BROKEN: Wasn't updated to work with B!=3DS, maybe incorre=
ctly inherits autotools"
> meta-oe/recipes-support/maliit/maliit-plugins_git.bb:PNBLACKLIST[maliit-p=
lugins] ?=3D "BROKEN: depends on broken maliit-framework"
> meta-oe/recipes-support/mongodb/mongodb_git.bb:PNBLACKLIST[mongodb] ?=3D =
"Fails to build with system boost"
> meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb:PNBLACKLIST[openmoti=
f] ?=3D "BROKEN: doesn't build with B!=3DS"
> meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST[va=
la-terminal] ?=3D "BROKEN: Doesn't work with B!=3DS, touch: cannot touch `s=
rc/.stamp': No such file or directory"
> meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb:PNBLACKLIST[xfce4-va=
la] ?=3D "Fails to build since vala upgrade to 0.26.1"
> meta-qt5:
> meta-smartphone:
> meta-shr/recipes-shr/3rdparty/ffalarms_git.bb:PNBLACKLIST[ffalarms] =3D "=
Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> meta-shr/recipes-shr/3rdparty/iliwi_git.bb:PNBLACKLIST[iliwi] =3D "Doesn'=
t build after vala upgrade from 0.24.0 to 0.26.1"
> meta-shr/recipes-shr/3rdparty/intone_git.bb:PNBLACKLIST[intone] =3D "rdep=
ends on blacklisted mplayer2"
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
> count: 1	issue: libdir
> chromium-dbg: found library in wrong location: /usr/bin/chrome/.debug/lib=
ffmpegsumo.so [libdir]
>=20
>=20
> count: 63	issue: textrel
> chromium-38.0.2125.101: ELF binary '/tmp/work/i586-oe-linux/chromium/38.0=
=2E2125.101-r0/packages-split/chromium/usr/bin/chrome/libffmpegsumo.so' has=
 relocations in .text [textrel]
> gstreamer1.0-libav-1.4.5: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/g=
streamer1.0-libav/1.4.5-r0/packages-split/gstreamer1.0-libav/usr/lib/gstrea=
mer-1.0/libgstlibav.so' has relocations in .text [textrel]
> gstreamer1.0-libav-1.4.5: ELF binary '/tmp/work/i586-oe-linux/gstreamer1.=
0-libav/1.4.5-r0/packages-split/gstreamer1.0-libav/usr/lib/gstreamer-1.0/li=
bgstlibav.so' has relocations in .text [textrel]
> libav-9.16: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/libav/9.16-r0/p=
ackages-split/libavcodec/usr/lib/libavcodec.so.54.35.0' has relocations in =
=2Etext [textrel]
> libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-sp=
lit/libavcodec/usr/lib/libavcodec.so.54.35.0' has relocations in .text [tex=
trel]
> libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-sp=
lit/libavdevice/usr/lib/libavdevice.so.53.2.0' has relocations in .text [te=
xtrel]
> libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-sp=
lit/libavfilter/usr/lib/libavfilter.so.3.3.0' has relocations in .text [tex=
trel]
> libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-sp=
lit/libavformat/usr/lib/libavformat.so.54.20.4' has relocations in .text [t=
extrel]
> libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-sp=
lit/libavresample/usr/lib/libavresample.so.1.0.1' has relocations in .text =
[textrel]
> libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-sp=
lit/libavutil/usr/lib/libavutil.so.52.3.0' has relocations in .text [textre=
l]
> libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-sp=
lit/libswscale/usr/lib/libswscale.so.2.1.1' has relocations in .text [textr=
el]
> libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary '/tmp/work/armv5e-oe=
-linux-gnueabi/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split/l=
ibpostproc/usr/lib/libpostproc.so.52.3.0' has relocations in .text [textrel]
> libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary '/tmp/work/i586-oe-l=
inux/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split/libpostproc=
/usr/lib/libpostproc.so.52.3.0' has relocations in .text [textrel]
> mpg123-1.21.0: ELF binary '/tmp/work/i586-oe-linux/mpg123/1.21.0-r0/packa=
ges-split/mpg123/usr/lib/libmpg123.so.0.40.3' has relocations in .text [tex=
trel]
> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.=
3-r1.0/packages-split/python3-audio/usr/lib/python3.3/lib-dynload/ossaudiod=
ev.cpython-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.=
3-r1.0/packages-split/python3-codecs/usr/lib/python3.3/lib-dynload/_codecs_=
tw.cpython-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.=
3-r1.0/packages-split/python3-core/usr/lib/python3.3/lib-dynload/binascii.c=
python-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.=
3-r1.0/packages-split/python3-crypt/usr/lib/python3.3/lib-dynload/_sha256.c=
python-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.=
3-r1.0/packages-split/python3-ctypes/usr/lib/python3.3/lib-dynload/_ctypes_=
test.cpython-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.=
3-r1.0/packages-split/python3-curses/usr/lib/python3.3/lib-dynload/_curses.=
cpython-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.=
3-r1.0/packages-split/python3-elementtree/usr/lib/python3.3/lib-dynload/_el=
ementtree.cpython-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.=
3-r1.0/packages-split/python3-fcntl/usr/lib/python3.3/lib-dynload/fcntl.cpy=
thon-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.=
3-r1.0/packages-split/python3-gdbm/usr/lib/python3.3/lib-dynload/_gdbm.cpyt=
hon-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.=
3-r1.0/packages-split/python3-io/usr/lib/python3.3/lib-dynload/_socket.cpyt=
hon-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.=
3-r1.0/packages-split/python3-json/usr/lib/python3.3/lib-dynload/_json.cpyt=
hon-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.=
3-r1.0/packages-split/python3-lang/usr/lib/python3.3/lib-dynload/_bisect.cp=
ython-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.=
3-r1.0/packages-split/python3-math/usr/lib/python3.3/lib-dynload/cmath.cpyt=
hon-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.=
3-r1.0/packages-split/python3-misc/usr/lib/python3.3/lib-dynload/_posixsubp=
rocess.cpython-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.=
3-r1.0/packages-split/python3-mmap/usr/lib/python3.3/lib-dynload/mmap.cpyth=
on-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.=
3-r1.0/packages-split/python3-multiprocessing/usr/lib/python3.3/lib-dynload=
/_multiprocessing.cpython-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.=
3-r1.0/packages-split/python3-profile/usr/lib/python3.3/lib-dynload/_lsprof=
=2Ecpython-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.=
3-r1.0/packages-split/python3-readline/usr/lib/python3.3/lib-dynload/readli=
ne.cpython-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.=
3-r1.0/packages-split/python3-resource/usr/lib/python3.3/lib-dynload/resour=
ce.cpython-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.=
3-r1.0/packages-split/python3-syslog/usr/lib/python3.3/lib-dynload/syslog.c=
python-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.=
3-r1.0/packages-split/python3-textutils/usr/lib/python3.3/lib-dynload/_csv.=
cpython-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.=
3-r1.0/packages-split/python3-unixadmin/usr/lib/python3.3/lib-dynload/grp.c=
python-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/python3/3.3.=
3-r1.0/packages-split/python3-xml/usr/lib/python3.3/lib-dynload/pyexpat.cpy=
thon-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/pac=
kages-split/python3-audio/usr/lib/python3.3/lib-dynload/ossaudiodev.cpython=
-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/pac=
kages-split/python3-codecs/usr/lib/python3.3/lib-dynload/_codecs_cn.cpython=
-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/pac=
kages-split/python3-core/usr/lib/python3.3/lib-dynload/binascii.cpython-33m=
=2Eso' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/pac=
kages-split/python3-crypt/usr/lib/python3.3/lib-dynload/_sha256.cpython-33m=
=2Eso' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/pac=
kages-split/python3-ctypes/usr/lib/python3.3/lib-dynload/_ctypes_test.cpyth=
on-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/pac=
kages-split/python3-curses/usr/lib/python3.3/lib-dynload/_curses.cpython-33=
m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/pac=
kages-split/python3-elementtree/usr/lib/python3.3/lib-dynload/_elementtree.=
cpython-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/pac=
kages-split/python3-fcntl/usr/lib/python3.3/lib-dynload/fcntl.cpython-33m.s=
o' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/pac=
kages-split/python3-gdbm/usr/lib/python3.3/lib-dynload/_gdbm.cpython-33m.so=
' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/pac=
kages-split/python3-io/usr/lib/python3.3/lib-dynload/_socket.cpython-33m.so=
' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/pac=
kages-split/python3-json/usr/lib/python3.3/lib-dynload/_json.cpython-33m.so=
' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/pac=
kages-split/python3-lang/usr/lib/python3.3/lib-dynload/_bisect.cpython-33m.=
so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/pac=
kages-split/python3-math/usr/lib/python3.3/lib-dynload/cmath.cpython-33m.so=
' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/pac=
kages-split/python3-misc/usr/lib/python3.3/lib-dynload/_md5.cpython-33m.so'=
 has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/pac=
kages-split/python3-mmap/usr/lib/python3.3/lib-dynload/mmap.cpython-33m.so'=
 has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/pac=
kages-split/python3-multiprocessing/usr/lib/python3.3/lib-dynload/_multipro=
cessing.cpython-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/pac=
kages-split/python3-profile/usr/lib/python3.3/lib-dynload/_lsprof.cpython-3=
3m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/pac=
kages-split/python3-readline/usr/lib/python3.3/lib-dynload/readline.cpython=
-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/pac=
kages-split/python3-resource/usr/lib/python3.3/lib-dynload/resource.cpython=
-33m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/pac=
kages-split/python3-syslog/usr/lib/python3.3/lib-dynload/syslog.cpython-33m=
=2Eso' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/pac=
kages-split/python3-textutils/usr/lib/python3.3/lib-dynload/_csv.cpython-33=
m.so' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/pac=
kages-split/python3-unixadmin/usr/lib/python3.3/lib-dynload/grp.cpython-33m=
=2Eso' has relocations in .text [textrel]
> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/python3/3.3.3-r1.0/pac=
kages-split/python3-xml/usr/lib/python3.3/lib-dynload/pyexpat.cpython-33m.s=
o' has relocations in .text [textrel]
> qtwebkit-5.4.0+gitAUTOINC+3a2cb4770c: ELF binary '/tmp/work/i586-oe-linux=
/qtwebkit/5.4.0+gitAUTOINC+3a2cb4770c-r0/packages-split/qtwebkit/usr/lib/li=
bQt5WebKit.so.5.4.0' has relocations in .text [textrel]
> webkit-efl-1.11.0: ELF binary '/tmp/work/i586-oe-linux/webkit-efl/1_1.11.=
0-r0/packages-split/webkit-efl/usr/lib/libjavascriptcore_efl.so.1.11.0' has=
 relocations in .text [textrel]
> webkit-gtk-1.8.3: ELF binary '/tmp/work/i586-oe-linux/webkit-gtk/1.8.3-r1=
/packages-split/libjavascriptcore/usr/lib/libjavascriptcoregtk-1.0.so.0.13.=
4' has relocations in .text [textrel]
>=20
>=20
> count: 23	issue: build-deps
> emacs-23.4: emacs rdepends on ncurses-libtinfo, but it isn't a build depe=
ndency? [build-deps]
> exquisite-0.0.1+svnr82070: exquisite rdepends on initscripts-functions, b=
ut it isn't a build dependency? [build-deps]
> freetds-0.92.79: freetds rdepends on readline, but it isn't a build depen=
dency? [build-deps]
> geoclue-2.0.0: geoclue rdepends on geoip, but it isn't a build dependency=
? [build-deps]
> glade3-3.8.5: glade3 rdepends on libpython2, but it isn't a build depende=
ncy? [build-deps]
> gpm-1.99.7: gpm rdepends on initscripts-functions, but it isn't a build d=
ependency? [build-deps]
> grub-efi-2.00: grub-efi rdepends on fuse, but it isn't a build dependency=
? [build-deps]
> irda-utils-0.9.18: irda-utils rdepends on initscripts-functions, but it i=
sn't a build dependency? [build-deps]
> libwebp-0.4.0: libwebp-bin rdepends on libgl-mesa, but it isn't a build d=
ependency? [build-deps]
> libwebp-0.4.0: libwebp-bin rdepends on mesa-glut, but it isn't a build de=
pendency? [build-deps]
> log4c-1.2.4: log4c rdepends on expat, but it isn't a build dependency? [b=
uild-deps]
> mpd-0.19.1: mpd rdepends on libsmbclient, but it isn't a build dependency=
? [build-deps]
> netkit-rwho-0.17: netkit-rwho-client rdepends on initscripts-functions, b=
ut it isn't a build dependency? [build-deps]
> pkcs11-helper-1.11: pkcs11-helper rdepends on nspr, but it isn't a build =
dependency? [build-deps]
> pkcs11-helper-1.11: pkcs11-helper rdepends on nss, but it isn't a build d=
ependency? [build-deps]
> qtwayland-5.4.0+gitAUTOINC+50d6c0ae94: qtwayland-plugins rdepends on libx=
composite, but it isn't a build dependency? [build-deps]
> qtwebkit-5.4.0+gitAUTOINC+3a2cb4770c: qtwebkit rdepends on libxcomposite,=
 but it isn't a build dependency? [build-deps]
> squid-3.4.7: squid rdepends on libpam, but it isn't a build dependency? [=
build-deps]
> stunnel-5.10: stunnel rdepends on libcap, but it isn't a build dependency=
? [build-deps]
> stunnel-5.10: stunnel rdepends on liblzma, but it isn't a build dependenc=
y? [build-deps]
> stunnel-5.10: stunnel rdepends on libsystemd, but it isn't a build depend=
ency? [build-deps]
> sysklogd-1.5.1: sysklogd rdepends on initscripts-functions, but it isn't =
a build dependency? [build-deps]
> syslog-ng-3.5.4.1: syslog-ng-libs rdepends on util-linux-libuuid, but it =
isn't a build dependency? [build-deps]
>=20
>=20
> count: 50	issue: file-rdeps
> apache2-2.4.10: apache2-dev requires /usr/bin/perl, but no providers in i=
ts RDEPENDS [file-rdeps]
> chkconfig-1.3.58: chkconfig requires libnewt.so()(64bit), but no provider=
s in its RDEPENDS [file-rdeps]
> chkconfig-1.3.58: chkconfig requires libnewt.so, but no providers in its =
RDEPENDS [file-rdeps]
> cloud9-0.6: cloud9 requires /bin/bash, but no providers in its RDEPENDS [=
file-rdeps]
> dvb-apps-1.1.1: dvb-apps requires libucsi.so()(64bit), libdvbapi.so()(64b=
it), libdvbcfg.so()(64bit), libdvben50221.so()(64bit), libdvbsec.so()(64bit=
), but no providers in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvb-apps requires libucsi.so, libdvben50221.so, libdvbsec=
=2Eso, libdvbcfg.so, libdvbapi.so, but no providers in its RDEPENDS [file-r=
deps]
> dvb-apps-1.1.1: dvb-femon requires libdvbapi.so()(64bit), but no provider=
s in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvb-femon requires libdvbapi.so, but no providers in its =
RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvb-scan requires libdvbsec.so()(64bit), libdvbapi.so()(6=
4bit), libdvbcfg.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvb-scan requires libdvbsec.so, libdvbcfg.so, libdvbapi.s=
o, but no providers in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvbdate requires libucsi.so()(64bit), libdvbapi.so()(64bi=
t), but no providers in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvbdate requires libucsi.so, libdvbapi.so, but no provide=
rs in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvbnet requires libdvbapi.so()(64bit), but no providers i=
n its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvbnet requires libdvbapi.so, but no providers in its RDE=
PENDS [file-rdeps]
> dvb-apps-1.1.1: dvbtraffic requires libdvbapi.so()(64bit), but no provide=
rs in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: dvbtraffic requires libdvbapi.so, but no providers in its=
 RDEPENDS [file-rdeps]
> emacs-23.4: emacs requires /usr/bin/perl, but no providers in its RDEPEND=
S [file-rdeps]
> fakeroot-1.18.4: fakeroot requires /bin/bash, but no providers in its RDE=
PENDS [file-rdeps]
> fbida-2.09+gitAUTOINC+6aa5563cb3: fbida requires /bin/bash, but no provid=
ers in its RDEPENDS [file-rdeps]
> foxtrotgps-1.1.1: foxtrotgps requires /usr/bin/python, /usr/bin/perl, but=
 no providers in its RDEPENDS [file-rdeps]
> gammu-1.32.0: gammu requires /bin/bash, but no providers in its RDEPENDS =
[file-rdeps]
> gammu-1.32.0: gammu-dev requires /bin/bash, but no providers in its RDEPE=
NDS [file-rdeps]
> gateone-1.2: gateone requires /bin/bash, but no providers in its RDEPENDS=
 [file-rdeps]
> giflib-4.1.6: giflib-utils requires /usr/bin/perl, but no providers in it=
s RDEPENDS [file-rdeps]
> gnome-desktop-2.32.1: gnome-desktop requires /usr/bin/python, but no prov=
iders in its RDEPENDS [file-rdeps]
> gnome-panel-2.32.1: gnome-panel requires /usr/bin/python, but no provider=
s in its RDEPENDS [file-rdeps]
> groff-1.22.2: groff requires /bin/sed, but no providers in its RDEPENDS [=
file-rdeps]
> gupnp-0.20.12: gupnp-dev requires /usr/bin/python, but no providers in it=
s RDEPENDS [file-rdeps]
> hplip-3.12.6: hplip-filter requires /usr/bin/perl, but no providers in it=
s RDEPENDS [file-rdeps]
> ipvsadm-1.26: ipvsadm requires /bin/bash, but no providers in its RDEPEND=
S [file-rdeps]
> libbonobo-2.32.1: libbonobo requires /usr/bin/perl, but no providers in i=
ts RDEPENDS [file-rdeps]
> libnewt-0.52.18: whiptail requires libnewt.so()(64bit), but no providers =
in its RDEPENDS [file-rdeps]
> libnewt-0.52.18: whiptail requires libnewt.so, but no providers in its RD=
EPENDS [file-rdeps]
> libnewt-python-0.52.18: libnewt-python requires libnewt.so()(64bit), but =
no providers in its RDEPENDS [file-rdeps]
> libnewt-python-0.52.18: libnewt-python requires libnewt.so, but no provid=
ers in its RDEPENDS [file-rdeps]
> lio-utils-4.1+gitAUTOINC+28bd928655: lio-utils requires /bin/bash, but no=
 providers in its RDEPENDS [file-rdeps]
> lmsensors-config-1.0: lmsensors-config-cgi requires /usr/bin/rrdcgi, but =
no providers in its RDEPENDS [file-rdeps]
> nodejs-0.8.18: nodejs requires /bin/bash, but no providers in its RDEPEND=
S [file-rdeps]
> numptyphysics-0.2+svnr109: numptyphysics requires /bin/bash, /usr/bin/per=
l, but no providers in its RDEPENDS [file-rdeps]
> opensaf-4.5.0: opensaf requires /bin/bash, /usr/bin/python, but no provid=
ers in its RDEPENDS [file-rdeps]
> packagekit-0.5.6: packagekit requires /bin/bash, but no providers in its =
RDEPENDS [file-rdeps]
> pcsc-lite-1.8.6: pcsc-lite requires /usr/bin/python, but no providers in =
its RDEPENDS [file-rdeps]
> pm-qa-0.4.14: pm-qa requires /bin/bash, but no providers in its RDEPENDS =
[file-rdeps]
> qt-creator-2.8.1: qt-creator requires /usr/bin/perl, but no providers in =
its RDEPENDS [file-rdeps]
> tracker-0.14.2: tracker-nautilus-extension requires libnautilus-extension=
=2Eso.1()(64bit), but no providers in its RDEPENDS [file-rdeps]
> tracker-0.14.2: tracker-nautilus-extension requires libnautilus-extension=
=2Eso.1, but no providers in its RDEPENDS [file-rdeps]
> ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: ubx-utils requires /bin/bash, but=
 no providers in its RDEPENDS [file-rdeps]
> unionfs-fuse-0.26: unionfs-fuse requires /bin/bash, but no providers in i=
ts RDEPENDS [file-rdeps]
> usbpath-0.0+svnr3172: usbpath requires /usr/bin/perl, but no providers in=
 its RDEPENDS [file-rdeps]
> wvstreams-4.6.1: wvstreams requires /usr/bin/perl, but no providers in it=
s RDEPENDS [file-rdeps]
>=20
>=20
> count: 0	issue: version-going-backwards
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTlzQcACgkQN1Ujt2V2gBx12ACgjUQQw74JpocFSyXKBK/I30gF
+vYAn2DynNHp4d44DLKGHvbdg6zKBz9h
=WqW3
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--
