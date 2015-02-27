Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 0EFAC73777;
	Fri, 27 Feb 2015 07:25:32 +0000 (UTC)
Received: by wesp10 with SMTP id p10so15698910wes.12;
	Thu, 26 Feb 2015 23:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tf8wjBC6jWrzY0FNrOK1XRtv6QBZb4spXGFJmDv6ALE=;
	b=Yq/k6eXH+x/BtQ5KzW2cuO5FxH2HZ2fXZ3rCZMSfH+eZDmRoO22sSlZl15t1X+7hsc
	M1/fZAL0cig4N/mDat27L80byM9eTamlusYBo52Fpne3RyzyVAv4SVMjy8HxnDYL60cf
	Pc8/GOcZoEJlP+AgvTsJADd3Izr8cs4L/vXqOw+BKwzLV/BWsiC0d2KDrF0uXfLyXIBz
	YgZouSxGzbhaMYg8n9M+S8dAr42QQD++0UYj3WRqYEbsUrBHsexFhyx+EzNiBTktoQ2Y
	GB7HfEXG36IKYmSTF/lMFv2VIoOUE84XvxbeEjpNZpG5tzeAdhM4rNCbQursKxqzkovc
	HcXA==
X-Received: by 10.180.8.165 with SMTP id s5mr3747396wia.16.1425021933367;
	Thu, 26 Feb 2015 23:25:33 -0800 (PST)
Received: from localhost ([89.176.104.3])
	by mx.google.com with ESMTPSA id bo1sm4676999wjb.15.2015.02.26.23.25.32
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Feb 2015 23:25:32 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 27 Feb 2015 08:25:49 +0100
To: Thomas PERROT <thomas.perrot@tupi.fr>
Message-ID: <20150227072549.GE2309@jama>
References: <20150220230920.GA2306@jama> <54EA0B1E.5020905@gmail.com>
	<CAGXeWgmKeS=JcaaffbNOh4bZz1D6xWfFqsgy_oiQ-w6JyakCbg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGXeWgmKeS=JcaaffbNOh4bZz1D6xWfFqsgy_oiQ-w6JyakCbg@mail.gmail.com>
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
X-List-Received-Date: Fri, 27 Feb 2015 07:25:34 -0000
X-Groupsio-MsgNum: 62794
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Oiv9uiLrevHtW1RS"
Content-Disposition: inline

--Oiv9uiLrevHtW1RS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2015 at 12:31:35PM +0100, Thomas PERROT wrote:
> Hi Martin,
>=20
> Please, what is it your configuration to run "bitbake world" ?
> I tried to run "bitbake world" only on oe-core, for some targets and I
> obtain already the same issue, and I don't see this issue in your list of
> failed tasks.

See link in first line on
http://www.openembedded.org/wiki/Bitbake_World_Status

>=20
> Here <https://travis-ci.org/tprrt/meta-musl>, I also tried with meta-musl
> and I obtain the same issue.
>=20
> The issue:
>=20
> ERROR: Nothing PROVIDES 'virtual/egl' (but
> /tmp/build_env/meta/recipes-graphics/clutter/clutter-1.0_1.20.0.bb,
> /tmp/build_env/meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.bb,
> /tmp/build_env/meta/recipes-graphics/cogl/cogl-1.0_1.18.2.bb,
> /tmp/build_env/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb,
> /tmp/build_env/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb,
> /tmp/build_env/meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb,
> /tmp/build_env/meta/recipes-graphics/wayland/weston_1.6.0.bb DEPENDS
> on or otherwise requires it)
>=20
> ERROR: mesa PROVIDES virtual/egl but was skipped: missing required
> distro feature 'opengl' (not in DISTRO_FEATURES)
>=20
> ERROR: mesa PROVIDES virtual/egl but was skipped: missing required
> distro feature 'opengl' (not in DISTRO_FEATURES)
>=20
> ERROR: Required build target 'clutter-gst-1.0' has no buildable providers.
>=20
> Missing or unbuildable dependency chain was: ['clutter-gst-1.0',
> 'clutter-1.0', 'virtual/egl']
>=20
>=20
> *Best regards*
>=20
> -------------------------------------------------------------------------=
----------------
>=20
> *Thomas P.*
>=20
>=20
> On 22 February 2015 at 18:00, akuster808 <akuster808@gmail.com> wrote:
>=20
> > Martin
> >
> > On 02/20/2015 03:09 PM, Martin Jansa wrote:
> >
> >> http://www.openembedded.org/wiki/Bitbake_World_Status
> >>
> >> =3D=3D Failed tasks 2015-02-20 =3D=3D
> >>
> >> INFO: jenkins-job.sh-1.1.0 Complete log available at
> >> http://logs.nslu2-linux.org/buildlogs/oe/world/log.report.
> >> 20150220_202958.log
> >>
> >> =3D=3D=3D common (5) =3D=3D=3D
> >>      * /meta-openembedded/meta-efl/recipes-navigation/mcnavi/mcna
> >> vi_0.3.4.bb, do_compile
> >>      * /meta-openembedded/meta-networking/recipes-daemons/ptpd/
> >> ptpd_2.3.1-rc2.bb, do_compile
> >>      * /meta-openembedded/meta-networking/recipes-support/nis/
> >> yp-tools_2.12.bb, do_compile
> >>      * /meta-openembedded/meta-oe/recipes-extended/unixodbc/unix
> >> odbc_2.3.2.bb, do_configure
> >>      * /meta-openembedded/meta-oe/recipes-support/start-stop-daemon/
> >> start-stop-daemon_1.16.0.2.bb, do_compile
> >>
> >> =3D=3D=3D common-x86 (2) =3D=3D=3D
> >>      * /meta-openembedded/meta-oe/recipes-kernel/ktap/ktap-module_0.4.=
bb,
> >> do_compile
> >>      * /meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb,
> >> do_compile
> >>
> >> =3D=3D=3D qemuarm (6) =3D=3D=3D
> >>      * /meta-openembedded/meta-networking/recipes-connectivity/snort/
> >> snort_2.9.6.0.bb, do_configure
> >>      * /meta-openembedded/meta-networking/recipes-support/wireshark/
> >> wireshark_1.12.3.bb, do_configure
> >>
> >
> > Do you have my latest patch for wireshark?
> >
> >  b51998bf63a625757f0497342b53e0c351814fba in master-next
> >
> > - armin
> >
> >
> >       * /meta-openembedded/meta-oe/recipes-benchmark/fio/fio_2.0.5.bb,
> >> do_compile
> >>      * /meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs
> >> 4_0.4.12.bb, do_compile
> >>      * /meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs
> >> _0.8.18.bb, do_compile
> >>      * /meta-smartphone/meta-android/recipes-multimedia/android-
> >> audiosystem/android-audiosystem_bzr.bb, do_compile
> >>
> >> =3D=3D=3D qemux86 (0) =3D=3D=3D
> >>
> >> =3D=3D=3D qemux86_64 (1) =3D=3D=3D
> >>      * /meta-qt5/recipes-qt/qt5/qt5-creator_3.3.0.bb, do_populate_sysr=
oot
> >>
> >> =3D=3D=3D Number of failed tasks (27) =3D=3D=3D
> >> {| class=3Dwikitable
> >> |-
> >> || qemuarm      || 11    || http://logs.nslu2-linux.org/
> >> buildlogs/oe/world//log.world.20150218_225838.log// ||
> >> http://errors.yoctoproject.org:80/Errors/Build/4802/
> >> |-
> >> || qemux86      || 8     || http://logs.nslu2-linux.org/
> >> buildlogs/oe/world//log.world.20150219_132710.log// ||
> >> http://errors.yoctoproject.org:80/Errors/Build/4806/
> >> |-
> >> || qemux86_64   || 8     || http://logs.nslu2-linux.org/
> >> buildlogs/oe/world//log.world.20150220_044745.log// ||
> >> http://errors.yoctoproject.org:80/Errors/Build/4811/
> >> |}
> >>
> >> =3D=3D=3D PNBLACKLISTs (52) =3D=3D=3D
> >>
> >> =3D=3D=3D QA issues (143) =3D=3D=3D
> >> {| class=3Dwikitable
> >> !| Count                ||Issue
> >> |-
> >> ||0     ||version-going-backwards
> >> |-
> >> ||1     ||libdir
> >> |-
> >> ||26    ||build-deps
> >> |-
> >> ||3     ||already-stripped
> >> |-
> >> ||50    ||file-rdeps
> >> |-
> >> ||63    ||textrel
> >> |}
> >>
> >>
> >> PNBLACKLISTs:
> >> openembedded-core/:
> >> meta-browser:
> >> meta-openembedded:
> >> meta-efl/recipes-efl/e17/diskio_svn.bb:PNBLACKLIST[diskio] ?=3D "broke=
n:
> >> switch to https://git.enlightenment.org/enlightenment/modules/diskio.g=
it/
> >> and fix 0.0.1+svnr82070-r0.0/E-MODULES-EXTRA/diskio/e-module-diskio.ed=
c:58.
> >> invalid state name: 'off'. "default" state must always be first."
> >> meta-efl/recipes-efl/efl/entrance_svn.bb:PNBLACKLIST[entrance] ?=3D
> >> "broken: switch to https://git.enlightenment.org/misc/entrance.git and
> >> fix 0.0.4+svnr82070-r7/entrance/data/themes/old/default.edc:678. inval=
id
> >> state name: 'defaault'. "default" state must always be first."
> >> meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.2.bb:PNBLACKLIST[=
ifuse]
> >> ?=3D "depends on blacklisted libimobiledevice"
> >> meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLACKLI=
ST[gnome-mplayer]
> >> ?=3D "rdepends on blacklisted mplayer"
> >> meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb:PNBLACKLIST[gcr] ?=3D "CONFL=
ICT:
> >> 4 files conflict with gnome-keyring"
> >> meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb:PNBLACKLIST[gdm] ?=3D "Depe=
nds
> >> on broken polkit-gnome"
> >> meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb:PNBLACKLIS=
T[gnome-menus3]
> >> ?=3D "CONFLICT: 24 files are conflicting with gnome-menus"
> >> meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST=
[gnome-panel3]
> >> ?=3D "CONFLICT: depends on libgweather3 which conflicts with libgweath=
er"
> >> meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb:PNBLACKLIST[li=
bgweather3]
> >> ?=3D "CONFLICT: 876 files are conflicting with libgweather"
> >> meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb:PNBLACKLIST[zenity] ?=
=3D
> >> "BROKEN: doesn't build with B!=3DS"
> >> meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb:PNBLACKLIST[xbmc]
> >> ?=3D "/usr/include/c++/ctime:70:11: error: '::gmtime' has not been dec=
lared"
> >> meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb:
> >> PNBLACKLIST[coriander] ?=3D "BROKEN: fails to use SDL probably because
> >> libsdl-config was removed, error: unknown type name 'SDL_Overlay'"
> >> meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.=
bb:
> >> PNBLACKLIST[renderer-service-upnp] ?=3D "BROKEN: doesn't build with B!=
=3DS
> >> (trying to install rendererconsole.py from ${B} instead of ${S})"
> >> meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb:PNBLACKLIS=
T[snort]
> >> ?=3D "BROKEN: autotools processing causes OOM condition on configure"
> >> meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb:
> >> PNBLACKLIST[lksctp-tools] ?=3D "${@base_contains('DISTRO_FEATURES',
> >> 'ld-is-gold', "BROKEN: fails to link against sctp_connectx symbol", ''=
, d)}"
> >> meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.b=
b:
> >> PNBLACKLIST[libimobiledevice] ?=3D "cannot run test program while cross
> >> compiling"
> >> meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft66] =
?=3D
> >> "BROKEN: depends on broken libftdi"
> >> meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb:PNBLACKLIST[=
zeroc-ice]
> >> ?=3D "BROKEN: not compatible with default db version"
> >> meta-oe/recipes-extended/polkit/polkit-gnome_0.102.bb:PNBLACKLIST[polk=
it-gnome]
> >> ?=3D "Fails to build, m4:configure.ac:125: recursion limit of 1024
> >> exceeded, use -L<N> to change it"
> >> meta-oe/recipes-extended/subsurface/subsurface_git.bb:PNBLACKLIST[subs=
urface]
> >> ?=3D "Needs to be upgraded for compatibility with new libdivecomputer"
> >> meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb:PNBLACKLIST[clut=
ter-box2d]
> >> ?=3D "BROKEN: doesn't build with B!=3DS"
> >> meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:PNBLACKLIST[fim] ?=3D "BRO=
KEN:
> >> doesn't build with B!=3DS (flex: can't open lex.lex)"
> >> meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb:PNBLACKLIS=
T[xf86-input-mtev]
> >> ?=3D "BROKEN: doesn't build with B!=3DS (Makefile without ${S} in sed =
call)"
> >> meta-oe/recipes-qt/qconnman/qconnman-e_git.bb:PNBLACKLIST[qconnman-e] =
?=3D
> >> "BROKEN: doesn't work with B!=3DS, ls: cannot access *.pro: No such fi=
le or
> >> directory"
> >> meta-oe/recipes-qt/qconnman/qconnman_git.bb:PNBLACKLIST[qconnman] ?=3D
> >> "BROKEN: doesn't work with B!=3DS, ls: cannot access *.pro: No such fi=
le or
> >> directory"
> >> meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb:PNBLACKLIST[sylpheed]
> >> ?=3D "BROKEN: Doesn't work with B!=3DS"
> >> meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb:PNBLACKLIST[apcupsd]
> >> ?=3D "BROKEN: doesn't build with B!=3DS"
> >> meta-oe/recipes-support/fltk/fltk_1.1.10.bb:PNBLACKLIST[fltk] ?=3D
> >> "broken: still uses /usr/bin/freetype-config"
> >> meta-oe/recipes-support/maliit/maliit-framework_git.
> >> bb:PNBLACKLIST[maliit-framework] ?=3D "BROKEN: Wasn't updated to work =
with
> >> B!=3DS, maybe incorrectly inherits autotools"
> >> meta-oe/recipes-support/maliit/maliit-plugins_git.bb:PNBLACKLIST[malii=
t-plugins]
> >> ?=3D "BROKEN: depends on broken maliit-framework"
> >> meta-oe/recipes-support/mongodb/mongodb_git.bb:PNBLACKLIST[mongodb] ?=
=3D
> >> "Fails to build with system boost"
> >> meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb:PNBLACKLIST[openm=
otif]
> >> ?=3D "BROKEN: doesn't build with B!=3DS"
> >> meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST=
[vala-terminal]
> >> ?=3D "BROKEN: Doesn't work with B!=3DS, touch: cannot touch `src/.stam=
p': No
> >> such file or directory"
> >> meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb:PNBLACKLIST[xfce4=
-vala]
> >> ?=3D "Fails to build since vala upgrade to 0.26.1"
> >> meta-qt5:
> >> meta-smartphone:
> >> meta-shr/recipes-shr/3rdparty/ffalarms_git.bb:PNBLACKLIST[ffalarms] =3D
> >> "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> >> meta-shr/recipes-shr/3rdparty/gwaterpas_0.3.bb:PNBLACKLIST[gwaterpas] =
?=3D
> >> "broken: depends on blacklisted fltk"
> >> meta-shr/recipes-shr/3rdparty/iliwi_git.bb:PNBLACKLIST[iliwi] =3D "Doe=
sn't
> >> build after vala upgrade from 0.24.0 to 0.26.1"
> >> meta-shr/recipes-shr/3rdparty/intone_git.bb:PNBLACKLIST[intone] =3D
> >> "rdepends on blacklisted mplayer2"
> >> meta-shr/recipes-shr/3rdparty/sensmon_git.bb:PNBLACKLIST[sensmon] =3D
> >> "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> >> meta-shr/recipes-shr/3rdparty/valacompass_git.bb:PNBLACKLIST[valacompa=
ss]
> >> =3D "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> >> meta-webos-ports:
> >> conf/world_fixes.inc:PNBLACKLIST[mplayer2] =3D ""
> >> conf/world_fixes.inc:PNBLACKLIST[android-system] =3D "depends on lxc f=
rom
> >> meta-virtualiazation which isn't included in my world builds"
> >> conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-1080p] =3D "big and does=
n't
> >> really need to be tested so much"
> >> conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-480p] =3D "big and doesn=
't
> >> really need to be tested so much"
> >> conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn=
't
> >> really need to be tested so much"
> >> conf/world_fixes.inc:PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn=
't
> >> really need to be tested so much"
> >> conf/world_fixes.inc:PNBLACKLIST[tearsofsteel-1080p] =3D "big and does=
n't
> >> really need to be tested so much"
> >> conf/world_mask.inc:PNBLACKLIST[evince] =3D "fails to build"
> >> conf/world_mask.inc:PNBLACKLIST[epiphany] =3D "fails to build"
> >> conf/world_mask.inc:PNBLACKLIST[gnome-power-manager] =3D "fails to bui=
ld"
> >> conf/world_mask.inc:PNBLACKLIST[gnome-bluetooth] =3D "fails to build"
> >> conf/world_mask.inc:PNBLACKLIST[media-ctl] =3D "fails to build"
> >> QA issues by type:
> >> count: 3        issue: already-stripped
> >> qwt-6.0.1: File '/usr/lib/libqwt.so.6.0.1' from qwt was already stripp=
ed,
> >> this will prevent future debugging! [already-stripped]
> >> qwt-6.0.1: File '/usr/lib/libqwtmathml.so.6.0.1' from qwt was already
> >> stripped, this will prevent future debugging! [already-stripped]
> >> qwt-6.0.1: File '/usr/lib/qt4/plugins/designer/libqwt_designer_plugin.=
so'
> >> from qwt was already stripped, this will prevent future debugging!
> >> [already-stripped]
> >>
> >>
> >> count: 1        issue: libdir
> >> chromium-dbg: found library in wrong location: /usr/bin/chrome/.debug/=
libffmpegsumo.so
> >> [libdir]
> >>
> >>
> >> count: 63       issue: textrel
> >> chromium-38.0.2125.101: ELF binary '/tmp/work/i586-oe-linux/
> >> chromium/38.0.2125.101-r0/packages-split/chromium/usr/bin/chrome/libff=
mpegsumo.so'
> >> has relocations in .text [textrel]
> >> gstreamer1.0-libav-1.4.5: ELF binary '/tmp/work/armv5e-oe-linux-
> >> gnueabi/gstreamer1.0-libav/1.4.5-r0/packages-split/
> >> gstreamer1.0-libav/usr/lib/gstreamer-1.0/libgstlibav.so' has relocatio=
ns
> >> in .text [textrel]
> >> gstreamer1.0-libav-1.4.5: ELF binary '/tmp/work/i586-oe-linux/
> >> gstreamer1.0-libav/1.4.5-r0/packages-split/gstreamer1.0-
> >> libav/usr/lib/gstreamer-1.0/libgstlibav.so' has relocations in .text
> >> [textrel]
> >> libav-9.16: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/libav/9.16-r=
0/
> >> packages-split/libavcodec/usr/lib/libavcodec.so.54.35.0' has relocatio=
ns
> >> in .text [textrel]
> >> libav-9.16: ELF binary '/tmp/work/i586-oe-linux/
> >> libav/9.16-r0/packages-split/libavcodec/usr/lib/libavcodec.so.54.35.0'
> >> has relocations in .text [textrel]
> >> libav-9.16: ELF binary '/tmp/work/i586-oe-linux/
> >> libav/9.16-r0/packages-split/libavdevice/usr/lib/libavdevice.so.53.2.0'
> >> has relocations in .text [textrel]
> >> libav-9.16: ELF binary '/tmp/work/i586-oe-linux/
> >> libav/9.16-r0/packages-split/libavfilter/usr/lib/libavfilter.so.3.3.0'
> >> has relocations in .text [textrel]
> >> libav-9.16: ELF binary '/tmp/work/i586-oe-linux/
> >> libav/9.16-r0/packages-split/libavformat/usr/lib/libavformat.so.54.20.=
4'
> >> has relocations in .text [textrel]
> >> libav-9.16: ELF binary '/tmp/work/i586-oe-linux/
> >> libav/9.16-r0/packages-split/libavresample/usr/lib/libavresample.so.1.=
0.1'
> >> has relocations in .text [textrel]
> >> libav-9.16: ELF binary '/tmp/work/i586-oe-linux/
> >> libav/9.16-r0/packages-split/libavutil/usr/lib/libavutil.so.52.3.0' has
> >> relocations in .text [textrel]
> >> libav-9.16: ELF binary '/tmp/work/i586-oe-linux/
> >> libav/9.16-r0/packages-split/libswscale/usr/lib/libswscale.so.2.1.1' h=
as
> >> relocations in .text [textrel]
> >> libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary
> >> '/tmp/work/armv5e-oe-linux-gnueabi/libpostproc/52.3.0+
> >> gitAUTOINC+811db3b957-r0/packages-split/libpostproc/usr/lib/libpostpro=
c.so.52.3.0'
> >> has relocations in .text [textrel]
> >> libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary
> >> '/tmp/work/i586-oe-linux/libpostproc/52.3.0+gitAUTOINC+
> >> 811db3b957-r0/packages-split/libpostproc/usr/lib/libpostproc.so.52.3.0'
> >> has relocations in .text [textrel]
> >> mpg123-1.21.0: ELF binary '/tmp/work/i586-oe-linux/
> >> mpg123/1.21.0-r0/packages-split/mpg123/usr/lib/libmpg123.so.0.40.3' has
> >> relocations in .text [textrel]
> >> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-
> >> gnueabi/python3/3.3.3-r1.0/packages-split/python3-audio/
> >> usr/lib/python3.3/lib-dynload/ossaudiodev.cpython-33m.so' has
> >> relocations in .text [textrel]
> >> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-
> >> gnueabi/python3/3.3.3-r1.0/packages-split/python3-codecs/
> >> usr/lib/python3.3/lib-dynload/_codecs_tw.cpython-33m.so' has relocatio=
ns
> >> in .text [textrel]
> >> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-
> >> gnueabi/python3/3.3.3-r1.0/packages-split/python3-core/
> >> usr/lib/python3.3/lib-dynload/binascii.cpython-33m.so' has relocations
> >> in .text [textrel]
> >> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-
> >> gnueabi/python3/3.3.3-r1.0/packages-split/python3-crypt/
> >> usr/lib/python3.3/lib-dynload/_sha256.cpython-33m.so' has relocations =
in
> >> .text [textrel]
> >> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-
> >> gnueabi/python3/3.3.3-r1.0/packages-split/python3-ctypes/
> >> usr/lib/python3.3/lib-dynload/_ctypes_test.cpython-33m.so' has
> >> relocations in .text [textrel]
> >> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-
> >> gnueabi/python3/3.3.3-r1.0/packages-split/python3-curses/
> >> usr/lib/python3.3/lib-dynload/_curses.cpython-33m.so' has relocations =
in
> >> .text [textrel]
> >> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-
> >> gnueabi/python3/3.3.3-r1.0/packages-split/python3-
> >> elementtree/usr/lib/python3.3/lib-dynload/_elementtree.cpython-33m.so'
> >> has relocations in .text [textrel]
> >> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-
> >> gnueabi/python3/3.3.3-r1.0/packages-split/python3-fcntl/
> >> usr/lib/python3.3/lib-dynload/fcntl.cpython-33m.so' has relocations in
> >> .text [textrel]
> >> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-
> >> gnueabi/python3/3.3.3-r1.0/packages-split/python3-gdbm/
> >> usr/lib/python3.3/lib-dynload/_gdbm.cpython-33m.so' has relocations in
> >> .text [textrel]
> >> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-
> >> gnueabi/python3/3.3.3-r1.0/packages-split/python3-io/usr/
> >> lib/python3.3/lib-dynload/_socket.cpython-33m.so' has relocations in
> >> .text [textrel]
> >> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-
> >> gnueabi/python3/3.3.3-r1.0/packages-split/python3-json/
> >> usr/lib/python3.3/lib-dynload/_json.cpython-33m.so' has relocations in
> >> .text [textrel]
> >> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-
> >> gnueabi/python3/3.3.3-r1.0/packages-split/python3-lang/
> >> usr/lib/python3.3/lib-dynload/_bisect.cpython-33m.so' has relocations =
in
> >> .text [textrel]
> >> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-
> >> gnueabi/python3/3.3.3-r1.0/packages-split/python3-math/
> >> usr/lib/python3.3/lib-dynload/cmath.cpython-33m.so' has relocations in
> >> .text [textrel]
> >> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-
> >> gnueabi/python3/3.3.3-r1.0/packages-split/python3-misc/
> >> usr/lib/python3.3/lib-dynload/_posixsubprocess.cpython-33m.so' has
> >> relocations in .text [textrel]
> >> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-
> >> gnueabi/python3/3.3.3-r1.0/packages-split/python3-mmap/
> >> usr/lib/python3.3/lib-dynload/mmap.cpython-33m.so' has relocations in
> >> .text [textrel]
> >> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-
> >> gnueabi/python3/3.3.3-r1.0/packages-split/python3-
> >> multiprocessing/usr/lib/python3.3/lib-dynload/_multipr
> >> ocessing.cpython-33m.so' has relocations in .text [textrel]
> >> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-
> >> gnueabi/python3/3.3.3-r1.0/packages-split/python3-
> >> profile/usr/lib/python3.3/lib-dynload/_lsprof.cpython-33m.so' has
> >> relocations in .text [textrel]
> >> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-
> >> gnueabi/python3/3.3.3-r1.0/packages-split/python3-
> >> readline/usr/lib/python3.3/lib-dynload/readline.cpython-33m.so' has
> >> relocations in .text [textrel]
> >> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-
> >> gnueabi/python3/3.3.3-r1.0/packages-split/python3-
> >> resource/usr/lib/python3.3/lib-dynload/resource.cpython-33m.so' has
> >> relocations in .text [textrel]
> >> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-
> >> gnueabi/python3/3.3.3-r1.0/packages-split/python3-syslog/
> >> usr/lib/python3.3/lib-dynload/syslog.cpython-33m.so' has relocations in
> >> .text [textrel]
> >> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-
> >> gnueabi/python3/3.3.3-r1.0/packages-split/python3-
> >> textutils/usr/lib/python3.3/lib-dynload/_csv.cpython-33m.so' has
> >> relocations in .text [textrel]
> >> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-
> >> gnueabi/python3/3.3.3-r1.0/packages-split/python3-
> >> unixadmin/usr/lib/python3.3/lib-dynload/grp.cpython-33m.so' has
> >> relocations in .text [textrel]
> >> python3-3.3.3: ELF binary '/tmp/work/armv5e-oe-linux-
> >> gnueabi/python3/3.3.3-r1.0/packages-split/python3-xml/
> >> usr/lib/python3.3/lib-dynload/pyexpat.cpython-33m.so' has relocations =
in
> >> .text [textrel]
> >> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/
> >> python3/3.3.3-r1.0/packages-split/python3-audio/usr/lib/
> >> python3.3/lib-dynload/ossaudiodev.cpython-33m.so' has relocations in
> >> .text [textrel]
> >> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/
> >> python3/3.3.3-r1.0/packages-split/python3-codecs/usr/lib/
> >> python3.3/lib-dynload/_codecs_cn.cpython-33m.so' has relocations in
> >> .text [textrel]
> >> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/
> >> python3/3.3.3-r1.0/packages-split/python3-core/usr/lib/
> >> python3.3/lib-dynload/binascii.cpython-33m.so' has relocations in .text
> >> [textrel]
> >> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/
> >> python3/3.3.3-r1.0/packages-split/python3-crypt/usr/lib/
> >> python3.3/lib-dynload/_sha256.cpython-33m.so' has relocations in .text
> >> [textrel]
> >> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/
> >> python3/3.3.3-r1.0/packages-split/python3-ctypes/usr/lib/
> >> python3.3/lib-dynload/_ctypes_test.cpython-33m.so' has relocations in
> >> .text [textrel]
> >> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/
> >> python3/3.3.3-r1.0/packages-split/python3-curses/usr/lib/
> >> python3.3/lib-dynload/_curses.cpython-33m.so' has relocations in .text
> >> [textrel]
> >> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/
> >> python3/3.3.3-r1.0/packages-split/python3-elementtree/usr/
> >> lib/python3.3/lib-dynload/_elementtree.cpython-33m.so' has relocations
> >> in .text [textrel]
> >> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/
> >> python3/3.3.3-r1.0/packages-split/python3-fcntl/usr/lib/
> >> python3.3/lib-dynload/fcntl.cpython-33m.so' has relocations in .text
> >> [textrel]
> >> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/
> >> python3/3.3.3-r1.0/packages-split/python3-gdbm/usr/lib/
> >> python3.3/lib-dynload/_gdbm.cpython-33m.so' has relocations in .text
> >> [textrel]
> >> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/
> >> python3/3.3.3-r1.0/packages-split/python3-io/usr/lib/
> >> python3.3/lib-dynload/_socket.cpython-33m.so' has relocations in .text
> >> [textrel]
> >> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/
> >> python3/3.3.3-r1.0/packages-split/python3-json/usr/lib/
> >> python3.3/lib-dynload/_json.cpython-33m.so' has relocations in .text
> >> [textrel]
> >> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/
> >> python3/3.3.3-r1.0/packages-split/python3-lang/usr/lib/
> >> python3.3/lib-dynload/_bisect.cpython-33m.so' has relocations in .text
> >> [textrel]
> >> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/
> >> python3/3.3.3-r1.0/packages-split/python3-math/usr/lib/
> >> python3.3/lib-dynload/cmath.cpython-33m.so' has relocations in .text
> >> [textrel]
> >> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/
> >> python3/3.3.3-r1.0/packages-split/python3-misc/usr/lib/
> >> python3.3/lib-dynload/_md5.cpython-33m.so' has relocations in .text
> >> [textrel]
> >> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/
> >> python3/3.3.3-r1.0/packages-split/python3-mmap/usr/lib/
> >> python3.3/lib-dynload/mmap.cpython-33m.so' has relocations in .text
> >> [textrel]
> >> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/
> >> python3/3.3.3-r1.0/packages-split/python3-multiprocessing/
> >> usr/lib/python3.3/lib-dynload/_multiprocessing.cpython-33m.so' has
> >> relocations in .text [textrel]
> >> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/
> >> python3/3.3.3-r1.0/packages-split/python3-profile/usr/lib/
> >> python3.3/lib-dynload/_lsprof.cpython-33m.so' has relocations in .text
> >> [textrel]
> >> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/
> >> python3/3.3.3-r1.0/packages-split/python3-readline/usr/
> >> lib/python3.3/lib-dynload/readline.cpython-33m.so' has relocations in
> >> .text [textrel]
> >> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/
> >> python3/3.3.3-r1.0/packages-split/python3-resource/usr/
> >> lib/python3.3/lib-dynload/resource.cpython-33m.so' has relocations in
> >> .text [textrel]
> >> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/
> >> python3/3.3.3-r1.0/packages-split/python3-syslog/usr/lib/
> >> python3.3/lib-dynload/syslog.cpython-33m.so' has relocations in .text
> >> [textrel]
> >> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/
> >> python3/3.3.3-r1.0/packages-split/python3-textutils/usr/
> >> lib/python3.3/lib-dynload/_csv.cpython-33m.so' has relocations in .text
> >> [textrel]
> >> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/
> >> python3/3.3.3-r1.0/packages-split/python3-unixadmin/usr/
> >> lib/python3.3/lib-dynload/grp.cpython-33m.so' has relocations in .text
> >> [textrel]
> >> python3-3.3.3: ELF binary '/tmp/work/i586-oe-linux/
> >> python3/3.3.3-r1.0/packages-split/python3-xml/usr/lib/
> >> python3.3/lib-dynload/pyexpat.cpython-33m.so' has relocations in .text
> >> [textrel]
> >> qtwebkit-5.4.0+gitAUTOINC+3a2cb4770c: ELF binary
> >> '/tmp/work/i586-oe-linux/qtwebkit/5.4.0+gitAUTOINC+
> >> 3a2cb4770c-r0/packages-split/qtwebkit/usr/lib/libQt5WebKit.so.5.4.0' h=
as
> >> relocations in .text [textrel]
> >> webkit-efl-1.11.0: ELF binary '/tmp/work/i586-oe-linux/
> >> webkit-efl/1_1.11.0-r0/packages-split/webkit-efl/usr/
> >> lib/libjavascriptcore_efl.so.1.11.0' has relocations in .text [textrel]
> >> webkit-gtk-1.8.3: ELF binary '/tmp/work/i586-oe-linux/
> >> webkit-gtk/1.8.3-r1/packages-split/libjavascriptcore/usr/
> >> lib/libjavascriptcoregtk-1.0.so.0.13.4' has relocations in .text
> >> [textrel]
> >>
> >>
> >> count: 26       issue: build-deps
> >> emacs-23.4: emacs rdepends on ncurses-libtinfo, but it isn't a build
> >> dependency? [build-deps]
> >> exquisite-0.0.1+svnr82070: exquisite rdepends on initscripts-functions,
> >> but it isn't a build dependency? [build-deps]
> >> freetds-0.92.79: freetds rdepends on readline, but it isn't a build
> >> dependency? [build-deps]
> >> geoclue-2.0.0: geoclue rdepends on geoip, but it isn't a build
> >> dependency? [build-deps]
> >> glade3-3.8.5: glade3 rdepends on libpython2, but it isn't a build
> >> dependency? [build-deps]
> >> gpm-1.99.7: gpm rdepends on initscripts-functions, but it isn't a build
> >> dependency? [build-deps]
> >> grub-efi-2.00: grub-efi rdepends on fuse, but it isn't a build
> >> dependency? [build-deps]
> >> irda-utils-0.9.18: irda-utils rdepends on initscripts-functions, but it
> >> isn't a build dependency? [build-deps]
> >> libwebp-0.4.0: libwebp-bin rdepends on libgl-mesa, but it isn't a build
> >> dependency? [build-deps]
> >> libwebp-0.4.0: libwebp-bin rdepends on mesa-glut, but it isn't a build
> >> dependency? [build-deps]
> >> log4c-1.2.4: log4c rdepends on expat, but it isn't a build dependency?
> >> [build-deps]
> >> mpd-0.19.1: mpd rdepends on libsmbclient, but it isn't a build
> >> dependency? [build-deps]
> >> netkit-rwho-0.17: netkit-rwho-client rdepends on initscripts-functions,
> >> but it isn't a build dependency? [build-deps]
> >> pkcs11-helper-1.11: pkcs11-helper rdepends on nspr, but it isn't a bui=
ld
> >> dependency? [build-deps]
> >> pkcs11-helper-1.11: pkcs11-helper rdepends on nss, but it isn't a build
> >> dependency? [build-deps]
> >> qt5-creator-3.3.0: qt5-creator rdepends on qt-creator, but it isn't a
> >> build dependency? [build-deps]
> >> qt5-creator-3.3.0: qt5-creator rdepends on qtquick1, but it isn't a bu=
ild
> >> dependency? [build-deps]
> >> qtwayland-5.4.0+gitAUTOINC+50d6c0ae94: qtwayland-plugins rdepends on
> >> libxcomposite, but it isn't a build dependency? [build-deps]
> >> qtwebkit-5.4.0+gitAUTOINC+3a2cb4770c: qtwebkit rdepends on
> >> libxcomposite, but it isn't a build dependency? [build-deps]
> >> sox-14.4.0: sox rdepends on libflac, but it isn't a build dependency?
> >> [build-deps]
> >> stunnel-5.10: stunnel rdepends on libcap, but it isn't a build
> >> dependency? [build-deps]
> >> stunnel-5.10: stunnel rdepends on liblzma, but it isn't a build
> >> dependency? [build-deps]
> >> stunnel-5.10: stunnel rdepends on libsystemd, but it isn't a build
> >> dependency? [build-deps]
> >> sysklogd-1.5.1: sysklogd rdepends on initscripts-functions, but it isn=
't
> >> a build dependency? [build-deps]
> >> tcpdump-4.6.1: tcpdump rdepends on libsmi, but it isn't a build
> >> dependency? [build-deps]
> >> vlc-2.1.4: vlc rdepends on libsamplerate0, but it isn't a build
> >> dependency? [build-deps]
> >>
> >>
> >> count: 50       issue: file-rdeps
> >> apache2-2.4.10: apache2-dev requires /usr/bin/perl, but no providers in
> >> its RDEPENDS [file-rdeps]
> >> chkconfig-1.3.58: chkconfig requires libnewt.so()(64bit), but no
> >> providers in its RDEPENDS [file-rdeps]
> >> chkconfig-1.3.58: chkconfig requires libnewt.so, but no providers in i=
ts
> >> RDEPENDS [file-rdeps]
> >> cloud9-0.6: cloud9 requires /bin/bash, but no providers in its RDEPENDS
> >> [file-rdeps]
> >> dvb-apps-1.1.1: dvb-apps requires libucsi.so()(64bit),
> >> libdvbapi.so()(64bit), libdvbcfg.so()(64bit), libdvben50221.so()(64bit=
),
> >> libdvbsec.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> >> dvb-apps-1.1.1: dvb-apps requires libucsi.so, libdvben50221.so,
> >> libdvbsec.so, libdvbcfg.so, libdvbapi.so, but no providers in its RDEP=
ENDS
> >> [file-rdeps]
> >> dvb-apps-1.1.1: dvb-femon requires libdvbapi.so()(64bit), but no
> >> providers in its RDEPENDS [file-rdeps]
> >> dvb-apps-1.1.1: dvb-femon requires libdvbapi.so, but no providers in i=
ts
> >> RDEPENDS [file-rdeps]
> >> dvb-apps-1.1.1: dvb-scan requires libdvbsec.so()(64bit),
> >> libdvbapi.so()(64bit), libdvbcfg.so()(64bit), but no providers in its
> >> RDEPENDS [file-rdeps]
> >> dvb-apps-1.1.1: dvb-scan requires libdvbsec.so, libdvbcfg.so,
> >> libdvbapi.so, but no providers in its RDEPENDS [file-rdeps]
> >> dvb-apps-1.1.1: dvbdate requires libucsi.so()(64bit),
> >> libdvbapi.so()(64bit), but no providers in its RDEPENDS [file-rdeps]
> >> dvb-apps-1.1.1: dvbdate requires libucsi.so, libdvbapi.so, but no
> >> providers in its RDEPENDS [file-rdeps]
> >> dvb-apps-1.1.1: dvbnet requires libdvbapi.so()(64bit), but no providers
> >> in its RDEPENDS [file-rdeps]
> >> dvb-apps-1.1.1: dvbnet requires libdvbapi.so, but no providers in its
> >> RDEPENDS [file-rdeps]
> >> dvb-apps-1.1.1: dvbtraffic requires libdvbapi.so()(64bit), but no
> >> providers in its RDEPENDS [file-rdeps]
> >> dvb-apps-1.1.1: dvbtraffic requires libdvbapi.so, but no providers in =
its
> >> RDEPENDS [file-rdeps]
> >> emacs-23.4: emacs requires /usr/bin/perl, but no providers in its
> >> RDEPENDS [file-rdeps]
> >> fakeroot-1.18.4: fakeroot requires /bin/bash, but no providers in its
> >> RDEPENDS [file-rdeps]
> >> fbida-2.09+gitAUTOINC+6aa5563cb3: fbida requires /bin/bash, but no
> >> providers in its RDEPENDS [file-rdeps]
> >> foxtrotgps-1.1.1: foxtrotgps requires /usr/bin/python, /usr/bin/perl, =
but
> >> no providers in its RDEPENDS [file-rdeps]
> >> gammu-1.32.0: gammu requires /bin/bash, but no providers in its RDEPEN=
DS
> >> [file-rdeps]
> >> gammu-1.32.0: gammu-dev requires /bin/bash, but no providers in its
> >> RDEPENDS [file-rdeps]
> >> gateone-1.2: gateone requires /bin/bash, but no providers in its RDEPE=
NDS
> >> [file-rdeps]
> >> giflib-4.1.6: giflib-utils requires /usr/bin/perl, but no providers in
> >> its RDEPENDS [file-rdeps]
> >> gnome-desktop-2.32.1: gnome-desktop requires /usr/bin/python, but no
> >> providers in its RDEPENDS [file-rdeps]
> >> gnome-panel-2.32.1: gnome-panel requires /usr/bin/python, but no
> >> providers in its RDEPENDS [file-rdeps]
> >> groff-1.22.2: groff requires /bin/sed, but no providers in its RDEPENDS
> >> [file-rdeps]
> >> gupnp-0.20.12: gupnp-dev requires /usr/bin/python, but no providers in
> >> its RDEPENDS [file-rdeps]
> >> hplip-3.12.6: hplip-filter requires /usr/bin/perl, but no providers in
> >> its RDEPENDS [file-rdeps]
> >> ipvsadm-1.26: ipvsadm requires /bin/bash, but no providers in its
> >> RDEPENDS [file-rdeps]
> >> libbonobo-2.32.1: libbonobo requires /usr/bin/perl, but no providers in
> >> its RDEPENDS [file-rdeps]
> >> libnewt-0.52.18: whiptail requires libnewt.so()(64bit), but no provide=
rs
> >> in its RDEPENDS [file-rdeps]
> >> libnewt-0.52.18: whiptail requires libnewt.so, but no providers in its
> >> RDEPENDS [file-rdeps]
> >> libnewt-python-0.52.18: libnewt-python requires libnewt.so()(64bit), b=
ut
> >> no providers in its RDEPENDS [file-rdeps]
> >> libnewt-python-0.52.18: libnewt-python requires libnewt.so, but no
> >> providers in its RDEPENDS [file-rdeps]
> >> lio-utils-4.1+gitAUTOINC+28bd928655: lio-utils requires /bin/bash, but
> >> no providers in its RDEPENDS [file-rdeps]
> >> lmsensors-config-1.0: lmsensors-config-cgi requires /usr/bin/rrdcgi, b=
ut
> >> no providers in its RDEPENDS [file-rdeps]
> >> nodejs-0.8.18: nodejs requires /bin/bash, but no providers in its
> >> RDEPENDS [file-rdeps]
> >> numptyphysics-0.2+svnr109: numptyphysics requires /bin/bash,
> >> /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]
> >> opensaf-4.5.0: opensaf requires /bin/bash, /usr/bin/python, but no
> >> providers in its RDEPENDS [file-rdeps]
> >> packagekit-0.5.6: packagekit requires /bin/bash, but no providers in i=
ts
> >> RDEPENDS [file-rdeps]
> >> pcsc-lite-1.8.6: pcsc-lite requires /usr/bin/python, but no providers =
in
> >> its RDEPENDS [file-rdeps]
> >> pm-qa-0.4.14: pm-qa requires /bin/bash, but no providers in its RDEPEN=
DS
> >> [file-rdeps]
> >> qt-creator-2.8.1: qt-creator requires /usr/bin/perl, but no providers =
in
> >> its RDEPENDS [file-rdeps]
> >> tracker-0.14.2: tracker-nautilus-extension requires
> >> libnautilus-extension.so.1()(64bit), but no providers in its RDEPENDS
> >> [file-rdeps]
> >> tracker-0.14.2: tracker-nautilus-extension requires
> >> libnautilus-extension.so.1, but no providers in its RDEPENDS [file-rde=
ps]
> >> ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: ubx-utils requires /bin/bash,
> >> but no providers in its RDEPENDS [file-rdeps]
> >> unionfs-fuse-0.26: unionfs-fuse requires /bin/bash, but no providers in
> >> its RDEPENDS [file-rdeps]
> >> usbpath-0.0+svnr3172: usbpath requires /usr/bin/perl, but no providers=
 in
> >> its RDEPENDS [file-rdeps]
> >> wvstreams-4.6.1: wvstreams requires /usr/bin/perl, but no providers in
> >> its RDEPENDS [file-rdeps]
> >>
> >>
> >> count: 0        issue: version-going-backwards
> >>
> >>
> >>
> >>  --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Oiv9uiLrevHtW1RS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTwG/0ACgkQN1Ujt2V2gByHFQCfY1l5mEnu4PS/4kE0xfNfpsI8
IGoAn2sURUwesEvZaAPbUbT74ogRJnJw
=K1Oi
-----END PGP SIGNATURE-----

--Oiv9uiLrevHtW1RS--
