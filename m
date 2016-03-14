Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4D76E6FFCE;
	Mon, 14 Mar 2016 11:02:58 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id p65so96429764wmp.1;
	Mon, 14 Mar 2016 04:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=x2XwrxSnDeuAMgpBW09gQTqJ4kqo5SXH8O5keVeCiB0=;
	b=JDY1i1eNqIr/nuav3NsQoRZp6tMa9Kh+dqhI8igtHeW/uK0c9sI8NGxeYFsQevdk49
	IKprpgQZhMJ1lyFmGrxGda1Oj5+fZbBxxFDiC1UX582NIDurADKLQjeFJA4qPrhylbGH
	v/MIAz4F6wervngnIxzOCqZaPwM3rnXG42VsJV2Sl/uaCzjzkluR9LTPsi0iaQn5VDjU
	viN/7DJq0UdyoQod5tS8/iYWkSVIHoD7rny+3DyHhddSRLHNqrHyLqa8SPswJBv9OUCL
	8jjwpYpwrLTdeovZUcNqY3J8IWtPnL5a862Bo7ynuaxAT7Su//NR8S856wVnBi0UIG7E
	u2ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=x2XwrxSnDeuAMgpBW09gQTqJ4kqo5SXH8O5keVeCiB0=;
	b=PxiUvCfIVfXLCbA1GJLUFBDbG/Z4CQPMeQ+Eh2d90Tosvm4mt1Fi5tuq6JXH/F8ER7
	qQ175rMQjgkCAIilbf4YUeqA+T5wx/bwWB+WO7ajdQLoymazD0//iQvbpD4SGWku+A/F
	5uMD0k3Rajv9Sge1PQ8Wyy8AqqHkLxR7rLRbiBnvFCtlUhGtItNjSosEZz+WZ49fLDCd
	CAbZ/VxUhE+M+KXrBlEKLQaK7LPZUZaf6BuHqh9To/0oBfOU0OXRRJpuwyZ9OVMmV9Lz
	QWSNtpax1CfLI73xFronHtZ0725hQEJP9KG4XJI0Ttb6e8tJpWt7kRu12n5wSO1A9i6O
	jnqA==
X-Gm-Message-State: AD7BkJJFn4578KzUXu1Uq1d6PrgKqjZhYwa856ITKz8jtHNwrKb0Nvrnm0CWfRuWsMjhHA==
X-Received: by 10.28.136.19 with SMTP id k19mr16139846wmd.11.1457953378987;
	Mon, 14 Mar 2016 04:02:58 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id h1sm15593951wme.8.2016.03.14.04.02.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Mar 2016 04:02:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 14 Mar 2016 12:06:20 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20160314110620.GB2560@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: State of bitbake world, Failed tasks 2016-03-12
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
X-List-Received-Date: Mon, 14 Mar 2016 11:03:00 -0000
X-Groupsio-MsgNum: 79611
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jq0ap7NbKX2Kqbes"
Content-Disposition: inline

--jq0ap7NbKX2Kqbes
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Blacklisting linux-yocto-tiny and linux-yocto-tiny-kexecboot helped
with random failures in qemux86* builds

=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
0eacf83 world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
a780836 base.bbclass: Introduce EXTRA_CONF_PACKAGECONFIG variable
a5bbd85 recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=3D=
mode,links"
9008d90 sstate-sysroot-cruft.sh: Extend the whitelist
1120aa7 qemux86: Add identical qemux86copy variant for tests
03118aa report-error: Allow to upload reports automatically
dd626c4 arch-armv7ve.inc: respect armv7a override as well
e6ee471 Revert "gstreamer1.0-plugins-XXX: move inherit gettext into common =
=2Einc file"
bdd884f musl: disable building of gobject introspection data
20664e4 machine/include/arch-x86: Make x32 ABI not supporting gobject-intro=
spection-data
d90f3de bitbake.conf: add 'gobject-introspection-data' to DISTRO/MACHINE_FE=
ATURES_BACKFILL
74a2009 packagegroup-core-x11-sato: add python-pygobject and gtk+3
2c7f859 webkitgtk: enable gobject introspection
9852c8a recipes-gnome: fix introspection support
e2304e5 python-pygobject: update to 3.18.2
d3936fb gnomebase.bbclass: do not disable gobject introspection
a4ee4f5 gstreamer: enable gobject introspection
def43fd libsoup-2.4: enable gobject introspection
93df729 clutter: enable gobject introspection
643f85a gtk+3: enable gobject-introspection
0734f01 gtk+: enable gobject introspection
a256cc0 avahi: enable gobject-introspection
d3c113a python-pygtk: remove the recipe
7ee6b12 avahi-ui: remove the dependency on python-pygtk by disabling avahi-=
discover
e8d093f vala.bbclass: remove pre-packaged vapigen.m4 from tarballs
7d96429 vala: enable the use of vapigen by packages with vala support
1b5e580 gobject-introspection.bbclass: add a class that enables gobject int=
rospection
4c7a3b6 gtk-doc-stub: remove introspection stubs
d308fc7 gobject-introspection: add the recipe
891e17c xcursor-transparent-theme: upgrade to latest git revision

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
20fc729 luajit: depend on luajit-native to provide host lua
9fe6c7b synergy: add dependency on openssl
9090641 compat-wireless: Remove
c6946f4 synergy: add dependency on curl
9c465c0 synergy: add dependency on unzip-native
09b8556 system-config-keyboard: inherit gettext and add dependency on intlt=
ool-native
8200885 dfu-util: upgrade to 0.9
eec2938 dfu-util: fix .patch files
4f1cc7a mpv: Media Player
656f7a7 postgresql: Security Advisory-postgresql-CVE-2016-0766
d016d0f python-m2crypto: fix build issue
c3eec9a gnome-panel: fix gobject introspection
19f7ccb network-manager-applet: fix gobject introspection
9923037 nautilus: fix gobject introspection
560f30f libgtop: fix gobject introspection
99b775c libgdata: fix gobject introspection
8d71c8b gnome-menus: fix gobject introspection
82351e9 python-dbusmock: use real introspection instead on legacy pygobject
600612d upower: fix gobject introspection
c35dca4 udisks2: fix gobject introspection
8775ef2 poppler: fix gobject introspection
43d3403 omgps: remove the recipe
6c58e96 gimp: accept newer versins of babl and gegl
6dcb35a gegl: update to 0.3.4
939dce3 babl: update to 0.1.16
14c4edf libunique: fix gobject introspection support
45a3f19 gtkextra: fix gobject introspection support
c636d68 polkit: fix gobject introspection support
9b7ab4f libgee: fix gobject introspection support
e7f52a9 telepathy-glib: fix gobject introspection support
8e95a7b networkmanager: fix introspection and vala support
0232ca1 modemmanager: fix vala support
eb0be9e bluez4: use real introspection instead of legacy pygobject
89919ba libmediaart: fix gobject introspection
4b6ea5a gstreamer-0.10: disable gobject introspection
90c6649 python-gst: remove the 0.10 recipe
2c42b1e media-service-demo: remove the recipe
a8fa606 rygel: fix gobject introspection
f1c7047 gupnp: fix gobject introspection
a76eb61 tracker: fix gobject introspection
079bb24 goffice: fix gobject introspection
1fbbbeb libxklavier: fix gobject introspection
c6a5df4 libwnck: fix gobject introspection
cb6d349 libgsf: fix gobject introspection
7dd50b3 gnumeric: fix gobject introspection support
fe0cde2 gnome-desktop: remove pygtk dependency
d029108 gnome-bluetooth: update to 3.18.2
86e7b8b evince: update to 3.18.2
2fdc117 evolution-data-server: fix gobject introspection
e457f00 efl-native: add dependency on openssl
057ea15 python-m2crypt: update package to 0.23.0
c28a359 libao: update to 1.2.0
7256c9d nginx: update to 1.9.12
0f43680 pptp-linux: update to 1.8.0
ff55769 dnsmasq: steal resolvconf support from Ubuntu
febc48e wireshark: 2.0.2 update including security

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
b2d5376 Change dependency from virtual/mesa to drm in the kms packageconfig.
06bfff5 qtwebengine: enable ARMv7VE support
2a998cc Add .gitignore to ignore .pyc/.pyo files
3eae3fe qmake5_base: use remove-libtool bbclass
bc54e23 recipes: use new EXTRA_CONF_PACKAGECONFIG instead of EXTRA_OECONF

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
a42392f cef3: comment out gtests completely
0b256c7 cef3, chromium: fix build with gcc-5.3

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
50be0d9 frameworkd: python-gst recommendation
15a51ce samsung-rfs-mgr: inherit pkgconfig
64cb1ce samsung-modem-mgr: inherit pkgconfig
9d6c410 pty-forward-native: fix do_deploy task
136b1c0 android-image-utils-native: add missing dependency on zlib-native
c596ff4 linux-gta04: upgrade to 4.4
98b5a2e om-gta04: drop u-boot from EXTRA_IMAGEDEPENDS
eb55ffe defaulttunes.inc: switch to hf, because SGX SDK for SGX530 is avail=
able only for hf
1d10e4e linux-gta04: enable SGX530
158b3e6 linux-gta04: bump SRCREV to get fixes for build with gcc-5
c469e02 u-boot-mkimage: Backport fix from upstream to fix build with gcc-5

=3D=3D Number of issues - stats =3D=3D
{| class=3D'wikitable'
!|Date		     !!colspan=3D'3'|Failed tasks			    !!colspan=3D'12'|QA !!Comme=
nt
|-
||		||qemuarm	||qemux86	||qemux86_64	||already-stripped	||libdir	||textrel	=
||build-deps	||file-rdeps	||version-going-backwards	||host-user-contaminate=
d	||installed-vs-shipped	||unknown-configure-option	||symlink-to-sysroot	||=
invalid-pkgconfig	||pkgname	||=09
|-
||2016-03-12	||3	||8	||10	||0		||0		||9		||1		||41		||32		||0		||0		||4		||=
0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2016-03-12 =3D=3D

INFO: jenkins-job.sh-1.7.4 Complete log available at http://logs.nslu2-linu=
x.org/buildlogs/oe/world/log.report.20160313_113835.log

=3D=3D=3D common (3) =3D=3D=3D
    * /meta-openembedded/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-blu=
etooth_3.18.2.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb, =
do_compile
    * /meta-openembedded/meta-python/recipes-devtools/python/python-cryptog=
raphy_1.1.bb, do_compile

=3D=3D=3D common-x86 (5) =3D=3D=3D
    * /meta-openembedded/meta-networking/recipes-kernel/netmap/netmap-modul=
es_git.bb, do_configure
    * /meta-openembedded/meta-networking/recipes-kernel/netmap/netmap-modul=
es_git.bb, do_make_scripts
    * /meta-openembedded/meta-oe/recipes-support/vboxguestdrivers/vboxguest=
drivers_4.3.36.bb, do_make_scripts
    * /openembedded-core/meta/recipes-kernel/cryptodev/cryptodev-module_1.8=
=2Ebb, do_make_scripts
    * /openembedded-core/meta/recipes-kernel/lttng/lttng-modules_git.bb, do=
_make_scripts

=3D=3D=3D qemuarm (0) =3D=3D=3D

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (2) =3D=3D=3D
    * /meta-openembedded/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb=
, do_compile
    * /meta-openembedded/meta-python/recipes-devtools/python/python-matplot=
lib_1.1.0.bb, do_compile

=3D=3D=3D Number of failed tasks (21) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 3	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.wo=
rld.20160310_141655.log// || http://errors.yoctoproject.org:80/Errors/Build=
/13960/
|-
|| qemux86 	|| 8	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.wo=
rld.20160311_114706.log// || http://errors.yoctoproject.org:80/Errors/Build=
/13972/
|-
|| qemux86_64 	|| 10	 || http://logs.nslu2-linux.org/buildlogs/oe/world//lo=
g.world.20160312_114513.log// || http://errors.yoctoproject.org:80/Errors/B=
uild/13984/
|}

=3D=3D=3D PNBLACKLISTs (111) =3D=3D=3D

=3D=3D=3D QA issues (87) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
|-
||0	||already-stripped
|-
||0	||host-user-contaminated
|-
||0	||installed-vs-shipped
|-
||0	||invalid-pkgconfig
|-
||0	||libdir
|-
||0	||pkgname
|-
||0	||symlink-to-sysroot
|-
||1	||build-deps
|-
||32	||version-going-backwards
|-
||4	||unknown-configure-option
|-
||41	||file-rdeps
|-
||9	||textrel
|}


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-efl/recipes-efl/e17/diskio_svn.bb:PNBLACKLIST[diskio] ?=3D "broken: sw=
itch to https://git.enlightenment.org/enlightenment/modules/diskio.git/ and=
 fix 0.0.1+svnr82070-r0.0/E-MODULES-EXTRA/diskio/e-module-diskio.edc:58. in=
valid state name: 'off'. "default" state must always be first."
meta-efl/recipes-efl/e17/elbow_git.bb:PNBLACKLIST[elbow] ?=3D "Depends on b=
lacklisted webkit-efl"
meta-efl/recipes-efl/e17/elmdentica_svn.bb:PNBLACKLIST[elmdentica] ?=3D "OL=
D and depends on broken azy"
meta-efl/recipes-efl/e17/emprint_svn.bb:PNBLACKLIST[emprint] ?=3D "if you w=
ant to use these modules with E18, then you need to update it to git recipe=
 fetching newer sources from http://git.enlightenment.org/apps/emprint.git/"
meta-efl/recipes-efl/e17/news_svn.bb:PNBLACKLIST[news] ?=3D "if you want to=
 use these modules with E18, then you need to update it to git recipe fetch=
ing newer sources from http://git.enlightenment.org/enlightenment/modules/n=
ews.git/"
meta-efl/recipes-efl/e17/rage_svn.bb:PNBLACKLIST[rage] ?=3D "if you want to=
 use these modules with E18, then you need to update it to git recipe fetch=
ing newer sources from  http://git.enlightenment.org/apps/rage.git/"
meta-efl/recipes-efl/e17/screenshot_svn.bb:PNBLACKLIST[screenshot] ?=3D "de=
pends on blacklisted emprint"
meta-efl/recipes-efl/efl/azy_svn.bb:PNBLACKLIST[azy] ?=3D "OLD and doesn't =
build with gcc-5"
meta-efl/recipes-efl/efl/entrance_svn.bb:PNBLACKLIST[entrance] ?=3D "broken=
: switch to https://git.enlightenment.org/misc/entrance.git and fix 0.0.4+s=
vnr82070-r7/entrance/data/themes/old/default.edc:678. invalid state name: '=
defaault'. "default" state must always be first."
meta-efl/recipes-efl/webkit/webkit-efl.inc:PNBLACKLIST[webkit-efl] ?=3D "Ol=
d and unmaintaned fork with many security issues"
meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb:PNBLACKLIST[mcnavi] ?=3D=
 "BROKEN: latest version 0.3.4 is 3 years old and now broken with more stri=
ct ejde_cc from efl-1.13"
meta-gnome/recipes-apps/epdfview/epdfview_0.1.8.bb:PNBLACKLIST[epdfview] ?=
=3D "BROKEN: images are not displayed anymore"
meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLACKLIST[gn=
ome-mplayer] ?=3D "rdepends on blacklisted mplayer"
meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb:PN=
BLACKLIST[gtk-theme-torturer] ?=3D "BROKEN: gmacros.h:182:53: error: size o=
f array '_GStaticAssertCompileTimeAssertion_2' is negative"
meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb:PNBLACKLIST[gcalctoo=
l] ?=3D "broken at least since April 2013 http://permalink.gmane.org/gmane.=
comp.handhelds.openembedded/57920 and nobody complained, it's also replaced=
 by gnome calculator"
meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb:PNBLACKLIST[=
gnome-keyring] ?=3D "This version conflicts with gcr from oe-core"
meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb:PNBLACKLIST[gno=
me-menus3] ?=3D "CONFLICT: 24 files are conflicting with gnome-menus"
meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gnom=
e-panel3] ?=3D "CONFLICT: depends on libgweather3 which conflicts with libg=
weather"
meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb:=
PNBLACKLIST[gnome-power-manager] ?=3D "BROKEN: not compatible with current =
libnotify"
meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb:PNBLACKLIST[libgwea=
ther3] ?=3D "CONFLICT: 876 files are conflicting with libgweather"
meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb:PNBLACKLIST[nautilus3]=
 ?=3D "BROKEN: fails to build, maybe missing dependency on gnome-desktop-ut=
ils.h provider"
meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb:PNBLA=
CKLIST[system-tools-backends] ?=3D "does not build with distroless qemuarm =
as reported in 'State of bitbake world' thread, nobody volunteered to fix t=
hem"
meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb:PNBLACKLIST[gnome-th=
emes] ?=3D "BROKEN: x86_64-linux/usr/lib/icon-naming-utils/icon-name-mappin=
g: No such file or directory"
meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb:PNBLACKLIST[zenity] ?=3D "=
BROKEN: doesn't build with B!=3DS"
meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb:PNBLACKLIST[xbmc] ?=3D=
 "/usr/include/c++/ctime:70:11: error: '::gmtime' has not been declared"
meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb:PNBLACKLIST[mkvtoo=
lnix] ?=3D "BROKEN: Failx to build with gcc-5"
meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb:PNBLACKLIST=
[coriander] ?=3D "BROKEN: fails to use SDL probably because libsdl-config w=
as removed, error: unknown type name 'SDL_Overlay'"
meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb:PN=
BLACKLIST[renderer-service-upnp] ?=3D "BROKEN: doesn't build with B!=3DS (t=
rying to install rendererconsole.py from ${B} instead of ${S})"
meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg_0.10.13.bb:PNB=
LACKLIST[gst-ffmpeg] ?=3D "Not compatible with currently used ffmpeg 3"
meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb:PNBLACKLIST[gs=
t123] ?=3D "gst123 is still "sometimes" using wrong sysroot"
meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb:PNBLACKLIST[sno=
rt] ?=3D "BROKEN: QA Issue: snort_preproc.pc, snort_output.pc, snort.pc"
meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb:PNBLACKLIST[dnrd] ?=3D =
"BROKEN: dnrd-2.20.3-r0 do_package: QA Issue: dnrd: Files/directories were =
installed but not shipped in any package:"
meta-networking/recipes-daemons/squid/squid_3.5.7.bb:PNBLACKLIST[squid] ?=
=3D "BROKEN: sysroots/qemuarm/usr/include/linux/in.h:28:16: error: redeclar=
ation of 'IPPROTO_IP'"
meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb=
:PNBLACKLIST[iscsitarget] ?=3D "BROKEN: kernel/block-io.c:36:19: error: 'BI=
O_UPTODATE' undeclared (first use in this function)"
meta-networking/recipes-irc/znc/znc_git.bb:PNBLACKLIST[znc] ?=3D "BROKEN: Q=
A Issue: znc.pc failed sanity test"
meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb:PNBLACKLIST[curlpp] =
?=3D "BROKEN: QA Issue: curlpp.pc failed sanity test (tmpdir)"
meta-networking/recipes-support/dovecot/dovecot_2.2.21.bb:PNBLACKLIST[dovec=
ot] ?=3D "BROKEN: QA Issue: -dev package contains non-symlink .so"
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
meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb:PNBLACKLIST[fakeroot] ?=3D=
 "BROKEN: QA Issue: -dev package contains non-symlink .so"
meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb:PNBLACKLIST[cloud9] ?=3D "Not=
 comatible with current nodejs 0.12, but upstream is working on it for v3"
meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb:PNBLACKLIST[mpich] ?=3D "BROK=
EN: QA Issue: libmpi.la failed sanity test (workdir), QA Issue: mpich.pc fa=
iled sanity test (tmpdir)"
meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb:PNBLACKLIST[package=
kit] ?=3D "BROKEN: depends on old deprecated libopkg which is currently dis=
abled and will be removed soon"
meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb:PNBLACKLIST[efibootm=
gr] ?=3D "Depends on blacklisted efivar"
meta-oe/recipes-extended/efivar/efivar_0.21.bb:PNBLACKLIST[efivar] ?=3D "BR=
OKEN: linux.c:27:30: fatal error: linux/nvme_ioctl.h: No such file or direc=
tory"
meta-oe/recipes-extended/subsurface/subsurface_git.bb:PNBLACKLIST[subsurfac=
e] ?=3D "Needs to be upgraded for compatibility with new libdivecomputer"
meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb:PNBLACKLIST[gtkextra] ?=3D=
 "BROKEN: Fails to build with gcc-5"
meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb:PNBLACKLIST[clutter-b=
ox2d] ?=3D "BROKEN: doesn't build with B!=3DS"
meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:PNBLACKLIST[fim] ?=3D "BROKEN: =
doesn't build with B!=3DS (flex: can't open lex.lex)"
meta-oe/recipes-graphics/slim/slim_1.3.2.bb:PNBLACKLIST[slim] ?=3D "does no=
t build with distroless qemuarm as reported in 'State of bitbake world' thr=
ead, nobody volunteered to fix them"
meta-oe/recipes-graphics/tesseract/tesseract_3.02.02.bb:PNBLACKLIST[tessera=
ct] ?=3D "BROKEN: QA Issue: tesseract.pc failed sanity test (tmpdir)"
meta-oe/recipes-graphics/wayland/wayland-fits_git.bb:PNBLACKLIST[wayland-fi=
ts] ?=3D "BROKEN: fails since wayland upgrade: weston-wfits.cpp:86:39: erro=
r: expected primary-expression before 'struct'"
meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb:PNBLACKLIST[xf8=
6-input-mtev] ?=3D "BROKEN: doesn't build with B!=3DS (Makefile without ${S=
} in sed call)"
meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb:PNBLACKLIS=
T[xf86-video-geode] ?=3D "BROKEN, fails to build"
meta-oe/recipes-kernel/ktap/ktap-module_git.bb:PNBLACKLIST[ktap-module] ?=
=3D "Not compatible with 3.19 kernel"
meta-oe/recipes-kernel/ktap/ktap_git.bb:PNBLACKLIST[ktap] ?=3D "Depends on =
blacklisted kernel-module-ktapvm"
meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb:PNBLACKLIST[mplayer2] ?=
=3D "Not compatible with currently used ffmpeg 3"
meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb:PNBLACKLIST[foxtr=
otgps] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conf=
licts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb:PNBLACKLIST[gdal] ?=3D "BROK=
EN: fails to build with gcc-5"
meta-oe/recipes-navigation/gypsy/gypsy.inc:PNBLACKLIST[gypsy] ?=3D "${@bb.u=
tils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 an=
d bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-navigation/navit/navit.inc:PNBLACKLIST[navit] ?=3D "${@bb.u=
tils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 an=
d bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb:PNBLACKLIST[claws-mail]=
 ?=3D "depends on blacklisted libetpan"
meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb:PNBLAC=
KLIST[claws-plugin-gtkhtml2-viewer] ?=3D "depends on blacklisted claws-mail"
meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.15.bb:PNBLACKLIST[c=
laws-plugin-mailmbox] ?=3D "depends on blacklisted claws-mail"
meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.34.bb:PNBLACKLIST[claw=
s-plugin-rssyl] ?=3D "depends on blacklisted claws-mail"
meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb:PNBLACKLIST[apcupsd] ?=
=3D "BROKEN: doesn't build with B!=3DS"
meta-oe/recipes-support/emacs/emacs_23.4.bb:PNBLACKLIST[emacs] ?=3D "qemu: =
uncaught target signal 11 (Segmentation fault) - core dumped"
meta-oe/recipes-support/farsight/farsight2_0.0.22.bb:PNBLACKLIST[farsight2]=
 ?=3D "Depends on broken libnice"
meta-oe/recipes-support/farsight/libnice_0.0.13.bb:PNBLACKLIST[libnice] ?=
=3D "BROKEN: QA Issue: nice.pc failed sanity test (tmpdir)"
meta-oe/recipes-support/fftw/benchfft_3.1.bb:PNBLACKLIST[benchfft] ?=3D "do=
es not build with distroless qemuarm as reported in 'State of bitbake world=
' thread, nobody volunteered to fix them"
meta-oe/recipes-support/iksemel/iksemel_1.4.bb:PNBLACKLIST[iksemel] ?=3D "N=
ot compatible with gnutls version 3.4 currently in oe-core"
meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb:PNBLACKLIST[libdbi=
-drivers] ?=3D "BROKEN: fails to build with gcc-5"
meta-oe/recipes-support/libetpan/libetpan_0.57.bb:PNBLACKLIST[libetpan] ?=
=3D "Not compatible with gnutls version 3.4 currently in oe-core"
meta-oe/recipes-support/opencv/opencv-samples_2.4.bb:PNBLACKLIST[opencv-sam=
ples] ?=3D "Depends on blacklisted opencv"
meta-oe/recipes-support/opencv/opencv_2.4.bb:PNBLACKLIST[opencv] ?=3D "Not =
compatible with currently used ffmpeg 3"
meta-oe/recipes-support/opencv/opencv_3.0.bb:PNBLACKLIST[opencv] ?=3D "Not =
compatible with currently used ffmpeg 3"
meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb:PNBLACKLIST[openmotif]=
 ?=3D "BROKEN: doesn't build with B!=3DS"
meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb:PNBLACKLIST[libsyncml] =
?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts w=
ith bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb:PNBLACKLIST[pidgin-otr] =
?=3D "depends on blacklisted pidgin"
meta-oe/recipes-support/pidgin/pidgin_2.10.9.bb:PNBLACKLIST[pidgin] ?=3D "N=
ot compatible with gnutls version 3.4 currently in oe-core and also depends=
 on broken libnice through farsight2"
meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST[vala=
-terminal] ?=3D "BROKEN: Doesn't work with B!=3DS, touch: cannot touch `src=
/.stamp': No such file or directory"
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
meta-shr/recipes-shr/3rdparty/jefliks_git.bb:PNBLACKLIST[jefliks] ?=3D "dep=
ends on blacklisted iksemel"
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
meta-shr/recipes-shr/shr/shr-installer_git.bb:PNBLACKLIST[shr-installer] ?=
=3D "Depends on blacklisted packagekit"
meta-webos-ports:
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
conf/world_fixes.inc:PNBLACKLIST[build-appliance-image] =3D "tries to inclu=
de whole downloads directory in /home/builder/poky :/"
conf/world_mask.inc:PNBLACKLIST[evince] =3D "fails to build"
conf/world_mask.inc:PNBLACKLIST[epiphany] =3D "fails to build"
conf/world_mask.inc:PNBLACKLIST[gnome-power-manager] =3D "fails to build"
conf/world_mask.inc:PNBLACKLIST[gnome-bluetooth] =3D "fails to build"
conf/world_mask.inc:PNBLACKLIST[media-ctl] =3D "fails to build"
QA issues by type:
count: 0	issue: already-stripped


count: 0	issue: libdir


count: n .text [textrel]
ffmpeg-3.0: ELF binary '/tmp/work/i586-oe-linux/ffmpeg/3.0-r0/packages-spli=
t/libpostproc/usr/lib/libpostproc.so.54.0.100' has relocations in .text [te=
xtrel]
ffmpeg-3.0: ELF binary '/tmp/work/i586-oe-linux/ffmpeg/3.0-r0/packages-spli=
t/libswresample/usr/lib/libswresample.so.2.0.101' has relocations in .text =
[textrel]
ffmpeg-3.0: ELF binary '/tmp/work/i586-oe-linux/ffmpeg/3.0-r0/packages-spli=
t/libswscale/usr/lib/libswscale.so.4.0.100' has relocations in .text [textr=
el]
gstreamer1.0-libav-1.6.3: ELF binary '/tmp/work/i586-oe-linux/gstreamer1.0-=
libav/1.6.3-r0/packages-split/gstreamer1.0-libav/usr/lib/gstreamer-1.0/libg=
stlibav.so' has relocations in .text [textrel]


count: 1	issue: build-deps
samba-4.1.12: samba rdepends on libpam, but it isn't a build dependency, mi=
ssing libpam in DEPENDS or PACKAGECONFIG? [build-deps]


count: 41	issue: file-rdeps
chkconfig-1.3.58: /usr/sbin/ntsysv contained in package chkconfig requires =
libnewt.so()(64bit), but no providers found in RDEPENDS_chkconfig? [file-rd=
eps]
chkconfig-1.3.58: /usr/sbin/ntsysv contained in package chkconfig requires =
libnewt.so, but no providers found in RDEPENDS_chkconfig? [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbdate contained in package dvbdate requires libu=
csi.so()(64bit), but no providers found in RDEPENDS_dvbdate? [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbdate contained in package dvbdate requires libu=
csi.so, but no providers found in RDEPENDS_dvbdate? [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbnet contained in package dvbnet requires libdvb=
api.so()(64bit), but no providers found in RDEPENDS_dvbnet? [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbnet contained in package dvbnet requires libdvb=
api.so, but no providers found in RDEPENDS_dvbnet? [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbscan contained in package dvb-scan requires lib=
dvbapi.so, but no providers found in RDEPENDS_dvb-scan? [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbscan contained in package dvb-scan requires lib=
dvbsec.so()(64bit), but no providers found in RDEPENDS_dvb-scan? [file-rdep=
s]
dvb-apps-1.1.1: /usr/bin/dvbtraffic contained in package dvbtraffic require=
s libdvbapi.so()(64bit), but no providers found in RDEPENDS_dvbtraffic? [fi=
le-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbtraffic contained in package dvbtraffic require=
s libdvbapi.so, but no providers found in RDEPENDS_dvbtraffic? [file-rdeps]
dvb-apps-1.1.1: /usr/bin/femon contained in package dvb-femon requires libd=
vbapi.so()(64bit), but no providers found in RDEPENDS_dvb-femon? [file-rdep=
s]
dvb-apps-1.1.1: /usr/bin/femon contained in package dvb-femon requires libd=
vbapi.so, but no providers found in RDEPENDS_dvb-femon? [file-rdeps]
dvb-apps-1.1.1: /usr/bin/gotox contained in package dvb-apps requires libdv=
bapi.so, but no providers found in RDEPENDS_dvb-apps? [file-rdeps]
dvb-apps-1.1.1: /usr/bin/gotox contained in package dvb-apps requires libdv=
bsec.so()(64bit), but no providers found in RDEPENDS_dvb-apps? [file-rdeps]
enchant-1.6.0: /usr/lib/enchant/libenchant_myspell.so contained in package =
enchant requires libhunspell-1.3.so.0()(64bit), but no providers found in R=
DEPENDS_enchant? [file-rdeps]
enchant-1.6.0: /usr/lib/enchant/libenchant_myspell.so contained in package =
enchant requires libhunspell-1.3.so.0, but no providers found in RDEPENDS_e=
nchant? [file-rdeps]
gnome-menus-2.30.5: /usr/bin/gmenu-simple-editor contained in package gnome=
-menus requires /tmp/sysroots/x86_64-linux/usr/bin/python-native/python, bu=
t no providers found in RDEPENDS_gnome-menus? [file-rdeps]
jq-1.5: /usr/lib/libjq.so.1.0.4 contained in package jq requires libonig.sc=
ontained in package libdrm-tests requires libcunit.so.1, but no providers f=
ound in RDEPENDS_libdrm-tests? [file-rdeps]
libmodule-build-perl-0.31: /usr/bin/config_data contained in package libmod=
ule-build-perl requires /tmp/sysroots/x86_64-linux/usr/bin/perl-native/perl=
=2Ereal, but no providers found in RDEPENDS_libmodule-build-perl? [file-rde=
ps]
libnewt-0.52.18: /usr/bin/whiptail contained in package whiptail requires l=
ibnewt.so()(64bit), but no providers found in RDEPENDS_whiptail? [file-rdep=
s]
libnewt-0.52.18: /usr/bin/whiptail contained in package whiptail requires l=
ibnewt.so, but no providers found in RDEPENDS_whiptail? [file-rdeps]
libnewt-python-0.52.18: /usr/lib/python2.7/site-packages/_snack.so containe=
d in package libnewt-python requires libnewt.so()(64bit), but no providers =
found in RDEPENDS_libnewt-python? [file-rdeps]
libnewt-python-0.52.18: /usr/lib/python2.7/site-packages/_snack.so containe=
d in package libnewt-python requires libnewt.so, but no providers found in =
RDEPENDS_libnewt-python? [file-rdeps]
networkmanager-1.0.10: /usr/bin/nmtui-connect contained in package networkm=
anager-nmtui requires libnewt.so()(64bit), but no providers found in RDEPEN=
DS_networkmanager-nmtui? [file-rdeps]
networkmanager-1.0.10: /usr/bin/nmtui-connect contained in package networkm=
anager-nmtui requires libnewt.so, but no providers found in RDEPENDS_networ=
kmanager-nmtui? [file-rdeps]
numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert.pl contained in=
 package numptyphysics requires /usr/bin/perl, but no providers found in RD=
EPENDS_numptyphysics? [file-rdeps]
numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert_all.sh containe=
d in package numptyphysics requires /bin/bash, but no providers found in RD=
EPENDS_numptyphysics? [file-rdeps]
perf-1.0: /usr/libexec/perf-core/scripts/python/call-graph-from-postgresql.=
py contained in package perf requires /usr/bin/python2, but no providers fo=
und in RDEPENDS_perf? [file-rdeps]
tracker-0.14.2: /usr/lib/nautilus/extensions-2.0/libnautilus-tracker-tags.s=
o contained in package tracker-nautilus-extension requires libnautilus-exte=
nsion.so.1()(64bit), but no providers found in RDEPENDS_tracker-nautilus-ex=
tension? [file-rdeps]
tracker-0.14.2: /usr/lib/nautilus/extensions-2.0/libnautilus-tracker-tags.s=
o contained in package tracker-nautilus-extension requires libnautilus-exte=
nsion.so.1, but no providers found in RDEPENDS_tracker-nautilus-extension? =
[file-rdeps]
ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: /usr/bin/memory-map.sh contained in=
 package ubx-utils requires /bin/bash, but no providers found in RDEPENDS_u=
bx-utils? [file-rdeps]
xfce4-clipman-plugin-1.2.6: /usr/bin/xfce4-clipman contained in package xfc=
e4-clipman-plugin requires libqrencode.so.3()(64bit), but no providers foun=
d in RDEPENDS_xfce4-clipman-plugin? [file-rdeps]
xfce4-clipman-plugin-1.2.6: /usr/bin/xfce4-clipman contained in package xfc=
e4-clipman-plugin requires libqrencode.so.3, but no providers found in RDEP=
ENDS_xfce4-clipman-plugin? [file-rdeps]
xfsprogs-3.2.3: /sbin/mkfs.xfs contained in package xfsprogs-mkfs requires =
libxfs.so.0()(64bit), but no providers found in RDEPENDS_xfsprogs-mkfs? [fi=
le-rdeps]
xfsprogs-3.2.3: /sbin/mkfs.xfs contained in package xfsprogs-mkfs requires =
libxfs.so.0, but no providers found in RDEPENDS_xfsprogs-mkfs? [file-rdeps]
xfsprogs-3.2.3: /usr/sbin/xfs_db contained in package xfsprogs requires lib=
xfs.so.0()(64bit), but no providers found in RDEPENDS_xfsprogs? [file-rdeps]
xfsprogs-3.2.3: /usr/sbin/xfs_db contained in package xfsprogs requires lib=
xfs.so.0, but no providers found in RDEPENDS_xfs package cef3-codecs-ffmpeg=
 went backwards which would break package feeds from (0:280796-r0.3 to 0:28=
0796-r0.0) [version-going-backwards]
cef3-280796: Package version for package cef3-dbg went backwards which woul=
d break package feeds from (0:280796-r0.2 to 0:280796-r0.0) [version-going-=
backwards]
cef3-280796: Package version for package cef3-dbg went backwards which woul=
d break package feeds from (0:280796-r0.3 to 0:280796-r0.0) [version-going-=
backwards]
cef3-280796: Package version for package cef3-dev went backwards which woul=
d break package feeds from (0:280796-r0.2 to 0:280796-r0.0) [version-going-=
backwards]
cef3-280796: Package version for package cef3-dev went backwards which woul=
d break package feeds from (0:280796-r0.3 to 0:280796-r0.0) [version-going-=
backwards]
cef3-280796: Package version for package cef3-doc went backwards which woul=
d break package feeds from (0:280796-r0.2 to 0:280796-r0.0) [version-going-=
backwards]
cef3-280796: Package version for package cef3-doc went backwards which woul=
d break package feeds from (0:280796-r0.3 to 0:280796-r0.0) [version-going-=
backwards]
cef3-280796: Package version for package cef3-locale went backwards which w=
ould break package feeds from (0:280796-r0.2 to 0:280796-r0.0) [version-goi=
ng-backwards]
cef3-280796: Package version for package cef3-locale went backwards which w=
ould break package feeds from (0:280796-r0.3 to 0:280796-r0.0) [version-goi=
ng-backwards]
cef3-280796: Package version for package cef3-plugin-pdf went backwards whi=
ch would break package feeds from (0:280796-r0.2 to 0:280796-r0.0) [version=
-going-backwards]
cef3-280796: Package version for package cef3-plugin-pdf went backwards whi=
ch would break package feeds from (0:280796-r0.3 to 0:280796-r0.0) [version=
-going-backwards]
cef3-280796: Package version for package cef3-staticdev went backwards whic=
h would break package feeds from (0:280796-r0.2 to 0:280796-r0.0) [version-=
going-backwards]
cef3-280796: Package version for package cef3-staticdev went backwards whic=
h would break package feeds from (0:280796-r0.3 to 0:280796-r0.0) [version-=
going-backwards]
chromium-40.0.2214.91: Package version for package chromium went backwards =
which would break package feeds from (0:40.0.2214.91-r0.2 to 0:40.0.2214.91=
-r0.0) [version-going-backwards]
chromium-40.0.2214.91: Package version for package chromium went backwards =
which would break package feeds from (0:40.0.2214.91-r0.3 to 0:40.0.2214.91=
-r0.0) [version-going-backwards]
chromium-40.0.2214.91: Package version for package chromium-codecs-ffmpeg w=
ent backwards which would break package feeds from (0:40.0.2214.91-r0.2 to =
0:40.0.2214.91-r0.0) [version-going-backwards]
chromium-40.0.2214.91: Package version for package chromium-codecs-ffmpeg w=
ent backwards which would break package feeds from (0:40.0.2214.91-r0.3 to =
0:40.0.2214.91-r0.0) [version-going-backwards]
chromium-40.0.2214.91: Package version for package chromium-dbg went backwa=
rds which would break package feeds from (0:40.0.2214.91-r0.2 to 0:40.0.221=
4.91-r0.0) [version-going-backwards]
chromium-40.0.2214.91: Package version for package chromium-dbg went backwa=
rds which would break package feeds from (0:40.0.2214.91-r0.3 to 0:40.0.221=
4.91-r0.0) [version-going-backwards]
chromium-40.0.2214.91: Package version for package chromium-dev went backwa=
rds which would break package feeds from (0:40.0.2214.91-r0.2 to 0:40.0.221=
4.91-r0.0) [version-going-backwards]
chromium-40.0.2214.91: Package version for package chromium-dev went backwa=
rds which would break package feeds from (0:40.0.2214.91-r0.3 to 0:40.0.221=
4.91-r0.0)ion-going-backwards]
chromium-40.0.2214.91: Package version for package chromium-plugin-pdf went=
 backwards which would break package feeds from (0:40.0.2214.91-r0.3 to 0:4=
0.0.2214.91-r0.0) [version-going-backwards]
chromium-40.0.2214.91: Package version for package chromium-staticdev went =
backwards which would break package feeds from (0:40.0.2214.91-r0.2 to 0:40=
=2E0.2214.91-r0.0) [version-going-backwards]
chromium-40.0.2214.91: Package version for package chromium-staticdev went =
backwards which would break package feeds from (0:40.0.2214.91-r0.3 to 0:40=
=2E0.2214.91-r0.0) [version-going-backwards]


count: 0	issue: host-user-contaminated


count: 0	issue: installed-vs-shipped


count: 4	issue: unknown-configure-option
gst-plugins-bad-0.10.23: gst-plugins-bad: configure was passed unrecognised=
 options: --disable-introspection [unknown-configure-option]
gst-plugins-gl-0.10.3: gst-plugins-gl: configure was passed unrecognised op=
tions: --disable-introspection [unknown-configure-option]
gst-plugins-good-0.10.31: gst-plugins-good: configure was passed unrecognis=
ed options: --disable-introspection [unknown-configure-option]
gst-plugins-ugly-0.10.19: gst-plugins-ugly: configure was passed unrecognis=
ed options: --disable-introspection [unknown-configure-option]


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jq0ap7NbKX2Kqbes
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbmmysACgkQN1Ujt2V2gBzyYQCgobcwDWPweG1Uy9z4pVJ5bPd9
5s8AnRX+UN8qAdKPS8BapIK+JpEqQR++
=U7Qh
-----END PGP SIGNATURE-----

--jq0ap7NbKX2Kqbes--
