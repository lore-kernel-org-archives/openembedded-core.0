Return-Path: <andrea.adami@gmail.com>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 64FB0731A5;
	Fri, 15 Jan 2016 08:13:46 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id c192so278110699lfe.2;
	Fri, 15 Jan 2016 00:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=6Mq3PjaxqLhNn4e1VksOrbCS53sWUGJFjKbp/gCgeLg=;
	b=Q3ihO6cCD6dUgZ+fQohv9foxpVF+ap9tPj68GI4p6/fSpv81dV3zaz1v2LsE9U6woD
	9CyMq8C7aGm65baftpOJJa+MZ/De6/viXVUm2o1Z/cIcJ3sm6OAcmMnk7DHBdSsH8lVx
	RflLsm4pnuWaccZixTDvRsacww8xgwuI1ncC6g1T+XRi0XwP9LvWNid1giVlas2sg0O4
	treNyusFzEcMdF4TIErl9NzDIEX2BQeodMIzx/1EayRQszHTJQCagM2Sf+vVhfvpOyD3
	5daI9AGe7QTlNkmT7ApsA3D3Ed1M6DMqPs3wnejBiL+USILk5G9WjkQyJ+qexJdX85fk
	GlPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=6Mq3PjaxqLhNn4e1VksOrbCS53sWUGJFjKbp/gCgeLg=;
	b=O5fMgxeK57xfsbHWiUi/Rrziz4qM/q3F53okzCrFM6UGW04RFDZ4W88aTch6JiIstS
	wE8Y25G1pJJKc/UGReqbRrYilpFpn6AJzNMgRvdKo+rw9feMhOakRUxJQJOn+zIMNz+a
	Z4s25XSY10A8Ez4mLCE/9t4ieugGyN4HP/lhe40gSR1VI7WmZw0XZIvnEwFg6/PaThS8
	/mxmmLr0bCrwSd7Da/62YETHNcIdEn9t0EF2tbsa650pk34Lhamr/ol+ZOwhGx39tRY1
	A4+Fc4rWucXVD8QOEAEGxu2rIEafHkSaUqwCzeNAS4aG6HB6wvuoOFsdk+bTtnlLCFa7
	zZjw==
X-Gm-Message-State: ALoCoQk2/hULowrjPYksypBzIHY7LoH1RuamCPCnQiCsijt+ygfFtAnLUrb8Gyxpmgm0eE1aan1PvPelqQyJekwZN+OOJZJERg==
MIME-Version: 1.0
X-Received: by 10.25.22.167 with SMTP id 39mr2658205lfw.153.1452845626549;
	Fri, 15 Jan 2016 00:13:46 -0800 (PST)
Received: by 10.114.19.35 with HTTP; Fri, 15 Jan 2016 00:13:46 -0800 (PST)
In-Reply-To: <20160114122154.GD2582@jama>
References: <20160114122154.GD2582@jama>
Date: Fri, 15 Jan 2016 09:13:46 +0100
Message-ID: <CAAQYJAuk=8tRZiosoudTaV2nhhwOU53CLwLorqdzAUTL_jJ65A@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2016-01-09, full QA report
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
X-List-Received-Date: Fri, 15 Jan 2016 08:13:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2016 at 1:21 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> qemuarm was using slightly older metadata, that's why it shows more failu=
res.
>
> Reexecuting qemuarm build shows only one failure:
> Summary: 1 task failed:
>   /home/jenkins/oe/world/shr-core/meta-openembedded/meta-gnome/recipes-gn=
ome/gvfs/gvfs-gdu-volume-monitor_1.24.2.bb, do_populate_sysroot
> Summary: There were 5 WARNING messages shown.
> Summary: There were 3 ERROR messages shown, returning a non-zero exit cod=
e.
>
> =3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
> cdf4cfb world-image: add extra target
>
> =3D=3D Tested changes (not included in master yet) - openembedded-core =
=3D=3D
> d444e2c sstate-sysroot-cruft.sh: Extend the whitelist
> f5aec48 arch-armv7ve.inc: respect armv7a override as well
> 33ac877 libbsd: upgrade to 0.8.1
> 9b8400f scripts/create-pull-request: fix git request-pull syntax
> 07f4dba qemux86: Add identical qemux86copy variant for tests
> 3183ee1 report-error: Allow to upload reports automatically
>
> =3D=3D Tested changes (not included in master yet) - meta-openembedded =
=3D=3D
> 4d6ae05 gnome-desktop: don't try to copy omf.make
> 17bd432 navit: disable qt4 support by default
> cde9695 gspd: disable qt4 support by default
> caf40a5 recipes: remove recipes using or depending on qt4 bbclasses or re=
cipes
> 403bc6c waf-samba.bbclass: add cross-answers option and files
> b166d5a samba: backport patches for cross-compiling
> 74457f8 samba: fix the incorrect tmpfiles installed directory
> 81fed56 libtalloc: upgrade to 2.1.3
> eafd027 libtevent: upgrade to 0.9.25
> 5bb6a15 libldb: upgrade to 1.1.21
> 64b5ead libtdb: upgrade to 1.3.7
> be49dee xterm: 308 -> 320
> e912fac gvfs: update to 1.24.2 to make access to windows shares work agai=
n
> 24645de python-pip: 7.1.0 -> 7.1.2
> 023ae09 stunnel: 5.21 -> 5.28
> 68edfc2 opensaf: 4.6.0 -> 4.7.0
> 143e983 postfix: 3.0.2 -> 3.0.3
> a855432 rp-pppoe: 3.11 -> 3.12
> dc19244 dnsmasq: Listen only on loopback and disable DHCP
> 1356bc0 poco: Add recipe for POCO C++ library
> 5635496 mozjs: fix linking issues on i586
> fc26804 syslog-ng: 3.5.4.1 -> 3.6.4
> 641efda libsmi: 0.4.8 -> 0.5.0
> 456105b lvm2: 2.02.125 -> 2.02.138
> 5a09739 python-six: Error fix for recipes depend on python-six
> bae5cd5 Add python-jsonpatch and python-jsonpointer recipes
> ffb25e5 python-tornado: upgrade to 4.3
> 355ecdd mariadb: -native also needs gold workaround
> 38cfba5 cifs-utils: add PACKAGECONFIG for cifsidmap
> 5683c8b cifs-utils: add PACKAGECONFIG for pam
> fea767c netmap-modules: fix build with kernel < 3.17
> f21b8b5 dhcpcd: add recipe for dhcpcd
> ffea5e3 samba: Fix typo in PACKAGECONFIG for "acl" and "aio"
> 7a34c21 Revert "libjpeg-turbo: remove recipe"
> 1ea033a libjpeg-turbo: remove recipe
> 44d0230 lowpan-tools: add missing flex/bison deps
> 3c49bd0 postfix: fix clean broken issue
> 1b9a465 ncftp: fix build failures with ccdv
> 9ec3ca5 iscsitarget: skip the arch test for kernel modules
> 345134f iscsitarget: split the kernel module into separate package
> ce4c2a0 netkit-ftp: fixed invalid symlink
> 3944ca6 ctdb: add PACKAGECONFIG for libtdb
> 36bbcb2 cim-schema-exper: fix host-user-contaminated
> 4c62551 nbd: use BPN in Files
> 1622b4e wireshark: update SRC_URI link to sources
> 3f03fb3 postfix: premission of /var/spool/mail seems incorrect
> af66826 tcpdump: add PACKAGECONFIG for libcap-ng
>
> =3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
> 943406e Revert "qtbase: fix Tartget typo"
> 7a2906b qtbase: fix Tartget typo
> c053ee2 qtscript/qtwebkit: disable thumb for armv4 and armv5 only to fix =
segfault on armv7
> ca847b3 qtwebengine: Fix error jpeg_codec.cc, media_capture_devices_dispa=
tcher.cpp and file API qquickwebengineview_p_p.h.
> c29c758 qt5: add extra path to qmlplugins
>
> =3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
>
> =3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=
=3D
>
> =3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=
=3D
> 7daae02 meta-shr-distro: remove aurora dependency
> 1776861 layer.conf: add LAYERDEPENDS matching README files
> 208dda7 packagegroup-shr-feed: remove confclerk, evopedia, anki, monav
> fd22968 meta-fso, meta-aurora: move libfso-qt and qfsodbusxml2cpp to meta=
-aurora and add dependency on qt4 layer
> ec44745 Initial support for Samsung Galaxy SIII (International), aka i930=
0
> cf30493 initramfs-boot-android: clean up init script
> 34c0047 busybox: rename bbappend to match new version from oe-core
> 1223487 xserver-xorg: rename bbappend to match new version from oe-core
> 92f78c0 packagegroup-shr*: remove pidgin, jefliks and claws-mail blacklis=
ted in meta-oe
> 2ce67f5 jefliks: blacklist because of gnutls upgrade
> 96a7810 meta-shr, meta-fso: drop nonworking recipes
>
> =3D=3D Number of issues - stats =3D=3D
> {| class=3D'wikitable'
> !|Date               !!colspan=3D'3'|Failed tasks                     !!c=
olspan=3D'12'|QA !!Comment
> |-
> ||              ||qemuarm       ||qemux86       ||qemux86_64    ||already=
-stripped      ||libdir        ||textrel       ||build-deps    ||file-rdeps=
    ||version-going-backwards       ||host-user-contaminated        ||insta=
lled-vs-shipped  ||unknown-configure-option      ||symlink-to-sysroot    ||=
invalid-pkgconfig     ||pkgname       ||
> |-
> ||2016-01-09    ||2     ||3     ||6     ||0             ||6             |=
|15            ||5             ||32            ||47604         ||16        =
    ||1             ||0             ||0             ||0             ||0    =
         ||
> |}
>
> http://www.openembedded.org/wiki/Bitbake_World_Status
>
> =3D=3D Failed tasks 2016-01-09 =3D=3D
>
> INFO: jenkins-job.sh-1.7.0 Complete log available at http://logs.nslu2-li=
nux.org/buildlogs/oe/world/log.report.20160110_162506.log
>
> =3D=3D=3D common () =3D=3D=3D
>
> =3D=3D=3D common-x86 (2) =3D=3D=3D
>     * /meta-browser/recipes-browser/chromium/cef3_280796.bb, do_compile
>     * /meta-browser/recipes-browser/chromium/chromium_40.0.2214.91.bb, do=
_compile
>
> =3D=3D=3D qemuarm (2) =3D=3D=3D
>     * /meta-openembedded/meta-gnome/recipes-gnome/gnome-desktop/gnome-des=
ktop_2.32.1.bb, do_configure
>     * /meta-openembedded/meta-gnome/recipes-gnome/gvfs/gvfs_1.24.2.bb, do=
_compile
>
> =3D=3D=3D qemux86 (1) =3D=3D=3D
>     * /meta-openembedded/meta-networking/recipes-kernel/netmap/netmap-mod=
ules_git.bb, do_compile
>
> =3D=3D=3D qemux86_64 (4) =3D=3D=3D
>     * /meta-openembedded/meta-initramfs/recipes-kernel/linux/linux-yocto-=
tiny-kexecboot_4.1.bb, do_compile_kernelmodules

Martin,

it seems there is a patch around for kernel 4.1.2:
https://lkml.org/lkml/2015/7/12/163
I'm on 4.4 and cannot test it now...sorry.
Adding Bruce in copy.

Cheers
Andrea


>     * /meta-openembedded/meta-oe/recipes-extended/tiptop/tiptop_2.3.bb, d=
o_compile
>     * /meta-openembedded/meta-oe/recipes-support/opencv/opencv_2.4.bb, do=
_compile
>     * /meta-openembedded/meta-python/recipes-devtools/python/python-matpl=
otlib_1.1.0.bb, do_compile
>
> =3D=3D=3D Number of failed tasks (11) =3D=3D=3D
> {| class=3Dwikitable
> |-
> || qemuarm      || 2     || http://logs.nslu2-linux.org/buildlogs/oe/worl=
d//log.world.20160107_155434.log// || http://errors.yoctoproject.org:80/Err=
ors/Build/11454/
> |-
> || qemux86      || 3     || http://logs.nslu2-linux.org/buildlogs/oe/worl=
d//log.world.20160108_151849.log// || http://errors.yoctoproject.org:80/Err=
ors/Build/11462/
> |-
> || qemux86_64   || 6     || http://logs.nslu2-linux.org/buildlogs/oe/worl=
d//log.world.20160109_155509.log// || http://errors.yoctoproject.org:80/Err=
ors/Build/11476/
> |}
>
> =3D=3D=3D PNBLACKLISTs (91) =3D=3D=3D
>
> =3D=3D=3D QA issues (47679) =3D=3D=3D
> {| class=3Dwikitable
> !| Count                ||Issue
> |-
> ||0     ||already-stripped
> |-
> ||0     ||invalid-pkgconfig
> |-
> ||0     ||pkgname
> |-
> ||0     ||symlink-to-sysroot
> |-
> ||0     ||unknown-configure-option
> |-
> ||1     ||installed-vs-shipped
> |-
> ||15    ||textrel
> |-
> ||16    ||host-user-contaminated
> |-
> ||32    ||file-rdeps
> |-
> ||47604 ||version-going-backwards
> |-
> ||5     ||build-deps
> |-
> ||6     ||libdir
> |}
>
>
> PNBLACKLISTs:
> openembedded-core/:
> meta-browser:
> meta-openembedded:
> meta-efl/recipes-efl/e17/diskio_svn.bb:PNBLACKLIST[diskio] ?=3D "broken: =
switch to https://git.enlightenment.org/enlightenment/modules/diskio.git/ a=
nd fix 0.0.1+svnr82070-r0.0/E-MODULES-EXTRA/diskio/e-module-diskio.edc:58. =
invalid state name: 'off'. "default" state must always be first."
> meta-efl/recipes-efl/e17/elmdentica_svn.bb:PNBLACKLIST[elmdentica] ?=3D "=
OLD and depends on broken azy"
> meta-efl/recipes-efl/e17/emprint_svn.bb:PNBLACKLIST[emprint] ?=3D "if you=
 want to use these modules with E18, then you need to update it to git reci=
pe fetching newer sources from http://git.enlightenment.org/apps/emprint.gi=
t/"
> meta-efl/recipes-efl/e17/news_svn.bb:PNBLACKLIST[news] ?=3D "if you want =
to use these modules with E18, then you need to update it to git recipe fet=
ching newer sources from http://git.enlightenment.org/enlightenment/modules=
/news.git/"
> meta-efl/recipes-efl/e17/rage_svn.bb:PNBLACKLIST[rage] ?=3D "if you want =
to use these modules with E18, then you need to update it to git recipe fet=
ching newer sources from  http://git.enlightenment.org/apps/rage.git/"
> meta-efl/recipes-efl/e17/screenshot_svn.bb:PNBLACKLIST[screenshot] ?=3D "=
depends on blacklisted emprint"
> meta-efl/recipes-efl/efl/azy_svn.bb:PNBLACKLIST[azy] ?=3D "OLD and doesn'=
t build with gcc-5"
> meta-efl/recipes-efl/efl/entrance_svn.bb:PNBLACKLIST[entrance] ?=3D "brok=
en: switch to https://git.enlightenment.org/misc/entrance.git and fix 0.0.4=
+svnr82070-r7/entrance/data/themes/old/default.edc:678. invalid state name:=
 'defaault'. "default" state must always be first."
> meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb:PNBLACKLIST[mcnavi] ?=
=3D "BROKEN: latest version 0.3.4 is 3 years old and now broken with more s=
trict ejde_cc from efl-1.13"
> meta-gnome/recipes-apps/epdfview/epdfview_0.1.8.bb:PNBLACKLIST[epdfview] =
?=3D "BROKEN: images are not displayed anymore"
> meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLACKLIST[=
gnome-mplayer] ?=3D "rdepends on blacklisted mplayer"
> meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb:PNBLACKLIST[gcalct=
ool] ?=3D "broken at least since April 2013 http://permalink.gmane.org/gman=
e.comp.handhelds.openembedded/57920 and nobody complained, it's also replac=
ed by gnome calculator"
> meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb:PNBLACKLIS=
T[gnome-keyring] ?=3D "This version conflicts with gcr from oe-core"
> meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.10.1.bb:PNBLACKLIST[g=
nome-menus3] ?=3D "CONFLICT: 24 files are conflicting with gnome-menus"
> meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gn=
ome-panel3] ?=3D "CONFLICT: depends on libgweather3 which conflicts with li=
bgweather"
> meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.b=
b:PNBLACKLIST[gnome-power-manager] ?=3D "BROKEN: not compatible with curren=
t libnotify"
> meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb:PNBLACKLIST[libgw=
eather3] ?=3D "CONFLICT: 876 files are conflicting with libgweather"
> meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb:PNBLACKLIST[nautilus=
3] ?=3D "BROKEN: fails to build, maybe missing dependency on gnome-desktop-=
utils.h provider"
> meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb:PNB=
LACKLIST[system-tools-backends] ?=3D "does not build with distroless qemuar=
m as reported in 'State of bitbake world' thread, nobody volunteered to fix=
 them"
> meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb:PNBLACKLIST[zenity] ?=3D=
 "BROKEN: doesn't build with B!=3DS"
> meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb:PNBLACKLIST[xbmc] ?=
=3D "/usr/include/c++/ctime:70:11: error: '::gmtime' has not been declared"
> meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb:PNBLACKLIST[mkvt=
oolnix] ?=3D "BROKEN: Failx to build with gcc-5"
> meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb:PNBLACKLI=
ST[coriander] ?=3D "BROKEN: fails to use SDL probably because libsdl-config=
 was removed, error: unknown type name 'SDL_Overlay'"
> meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb:=
PNBLACKLIST[renderer-service-upnp] ?=3D "BROKEN: doesn't build with B!=3DS =
(trying to install rendererconsole.py from ${B} instead of ${S})"
> meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb:PNBLACKLIST[=
gst123] ?=3D "gst123 is still "sometimes" using wrong sysroot"
> meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb:PNBLA=
CKLIST[lksctp-tools] ?=3D "${@base_contains('DISTRO_FEATURES', 'ld-is-gold'=
, "BROKEN: fails to link against sctp_connectx symbol", '', d)}"
> meta-networking/recipes-support/nis/yp-tools_3.3.bb:PNBLACKLIST[yp-tools]=
 ?=3D "BROKEN: fails to build for qemuarm."
> meta-networking/recipes-support/nis/ypbind-mt_2.2.bb:PNBLACKLIST[ypbind-m=
t] ?=3D "BROKEN: Depends on broken yp-tools"
> meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb:PNBLACKLIST[bluez=
-hcidump] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 c=
onflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb:PNBLACKLIST[bluez4] ?=
=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts wi=
th bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb:PNBLACKL=
IST[gst-plugin-bluetooth] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bl=
uez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATU=
RES', '', d)}"
> meta-oe/recipes-connectivity/obexftp/obexftp_0.23.bb:PNBLACKLIST[obexftp]=
 ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts =
with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft66] ?=
=3D "BROKEN: depends on broken libftdi"
> meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb:PNBLACKLIST[zer=
oc-ice] ?=3D "BROKEN: not compatible with default db version"
> meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb:PNBLACKLIST[cloud9] ?=3D "N=
ot comatible with current nodejs 0.12, but upstream is working on it for v3=
"
> meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb:PNBLACKLIST[packa=
gekit] ?=3D "BROKEN: depends on old deprecated libopkg which is currently d=
isabled and will be removed soon"
> meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb:PNBLACKLIST[rsyslog] ?=
=3D "Not compatible with gnutls version 3.4 currently in oe-core"
> meta-oe/recipes-extended/subsurface/subsurface_git.bb:PNBLACKLIST[subsurf=
ace] ?=3D "Needs to be upgraded for compatibility with new libdivecomputer"
> meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb:PNBLACKLIST[gtkextra] ?=
=3D "BROKEN: Fails to build with gcc-5"
> meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb:PNBLACKLIST[clutter=
-box2d] ?=3D "BROKEN: doesn't build with B!=3DS"
> meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:PNBLACKLIST[fim] ?=3D "BROKEN=
: doesn't build with B!=3DS (flex: can't open lex.lex)"
> meta-oe/recipes-graphics/slim/slim_1.3.2.bb:PNBLACKLIST[slim] ?=3D "does =
not build with distroless qemuarm as reported in 'State of bitbake world' t=
hread, nobody volunteered to fix them"
> meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb:PNBLACKLIST[x=
f86-input-mtev] ?=3D "BROKEN: doesn't build with B!=3DS (Makefile without $=
{S} in sed call)"
> meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb:PNBLACKL=
IST[xf86-video-geode] ?=3D "BROKEN, fails to build"
> meta-oe/recipes-kernel/ktap/ktap-module_git.bb:PNBLACKLIST[ktap-module] ?=
=3D "Not compatible with 3.19 kernel"
> meta-oe/recipes-kernel/ktap/ktap_git.bb:PNBLACKLIST[ktap] ?=3D "Depends o=
n blacklisted kernel-module-ktapvm"
> meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb:PNBLACKLIST[mplayer2] =
?=3D "BROKEN, fails to build with gcc-5"
> meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb:PNBLACKLIST[fox=
trotgps] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 co=
nflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb:PNBLACKLIST[gdal] ?=3D "BR=
OKEN: fails to build with gcc-5"
> meta-oe/recipes-navigation/gypsy/gypsy.inc:PNBLACKLIST[gypsy] ?=3D "${@bb=
.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 =
and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-navigation/navit/navit.inc:PNBLACKLIST[navit] ?=3D "${@bb=
.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 =
and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb:PNBLACKLIST[claws-mai=
l] ?=3D "depends on blacklisted libetpan"
> meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb:PNBL=
ACKLIST[claws-plugin-gtkhtml2-viewer] ?=3D "depends on blacklisted claws-ma=
il"
> meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.15.bb:PNBLACKLIST=
[claws-plugin-mailmbox] ?=3D "depends on blacklisted claws-mail"
> meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.34.bb:PNBLACKLIST[cl=
aws-plugin-rssyl] ?=3D "depends on blacklisted claws-mail"
> meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb:PNBLACKLIST[apcupsd] ?=
=3D "BROKEN: doesn't build with B!=3DS"
> meta-oe/recipes-support/emacs/emacs_23.4.bb:PNBLACKLIST[emacs] ?=3D "qemu=
: uncaught target signal 11 (Segmentation fault) - core dumped"
> meta-oe/recipes-support/fftw/benchfft_3.1.bb:PNBLACKLIST[benchfft] ?=3D "=
does not build with distroless qemuarm as reported in 'State of bitbake wor=
ld' thread, nobody volunteered to fix them"
> meta-oe/recipes-support/iksemel/iksemel_1.4.bb:PNBLACKLIST[iksemel] ?=3D =
"Not compatible with gnutls version 3.4 currently in oe-core"
> meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb:PNBLACKLIST[libd=
bi-drivers] ?=3D "BROKEN: fails to build with gcc-5"
> meta-oe/recipes-support/libetpan/libetpan_0.57.bb:PNBLACKLIST[libetpan] ?=
=3D "Not compatible with gnutls version 3.4 currently in oe-core"
> meta-oe/recipes-support/mongodb/mongodb_git.bb:PNBLACKLIST[mongodb] ?=3D =
"Fails to build with system boost"
> meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb:PNBLACKLIST[openmoti=
f] ?=3D "BROKEN: doesn't build with B!=3DS"
> meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb:PNBLACKLIST[libsyncml=
] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts=
 with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb:PNBLACKLIST[pidgin-otr=
] ?=3D "depends on blacklisted pidgin"
> meta-oe/recipes-support/pidgin/pidgin_2.10.9.bb:PNBLACKLIST[pidgin] ?=3D =
"Not compatible with gnutls version 3.4 currently in oe-core"
> meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb:P=
NBLACKLIST[start-stop-daemon] ?=3D "BROKEN: fails because of gettext, parti=
al fix is available here http://patchwork.openembedded.org/patch/89867/"
> meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST[va=
la-terminal] ?=3D "BROKEN: Doesn't work with B!=3DS, touch: cannot touch `s=
rc/.stamp': No such file or directory"
> meta-qt5:
> meta-smartphone:
> meta-shr/recipes-shr/3rdparty/emtooth2_svn.bb:PNBLACKLIST[emtooth2] ?=3D =
"${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with b=
luez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-shr/recipes-shr/3rdparty/ffalarms_git.bb:PNBLACKLIST[ffalarms] =3D "=
Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> meta-shr/recipes-shr/3rdparty/gwaterpas_0.3.bb:PNBLACKLIST[gwaterpas] ?=
=3D "broken: depends on blacklisted fltk"
> meta-shr/recipes-shr/3rdparty/iliwi_git.bb:PNBLACKLIST[iliwi] =3D "Doesn'=
t build after vala upgrade from 0.24.0 to 0.26.1"
> meta-shr/recipes-shr/3rdparty/intone_git.bb:PNBLACKLIST[intone] =3D "rdep=
ends on blacklisted mplayer2"
> meta-shr/recipes-shr/3rdparty/jefliks_git.bb:PNBLACKLIST[jefliks] ?=3D "d=
epends on blacklisted iksemel"
> meta-shr/recipes-shr/3rdparty/pisi_0.5.3.bb:PNBLACKLIST[pisi] ?=3D "${@bb=
.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 =
and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-shr/recipes-shr/3rdparty/podboy_svn.bb:PNBLACKLIST[podboy] ?=3D "${@=
bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez=
4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-shr/recipes-shr/3rdparty/sensmon_git.bb:PNBLACKLIST[sensmon] =3D "Do=
esn't build after vala upgrade from 0.24.0 to 0.26.1"
> meta-shr/recipes-shr/3rdparty/valacompass_git.bb:PNBLACKLIST[valacompass]=
 =3D "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> meta-shr/recipes-shr/shr/shr-installer_git.bb:PNBLACKLIST[shr-installer] =
?=3D "Depends on blacklisted packagekit"
> meta-webos-ports:
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
> conf/world_fixes.inc:PNBLACKLIST[build-appliance-image] =3D "tries to inc=
lude whole downloads directory in /home/builder/poky :/"
> conf/world_mask.inc:PNBLACKLIST[evince] =3D "fails to build"
> conf/world_mask.inc:PNBLACKLIST[epiphany] =3D "fails to build"
> conf/world_mask.inc:PNBLACKLIST[gnome-power-manager] =3D "fails to build"
> conf/world_mask.inc:PNBLACKLIST[gnome-bluetooth] =3D "fails to build"
> conf/world_mask.inc:PNBLACKLIST[media-ctl] =3D "fails to build"
> QA issues by type:
> count: 0        issue: already-stripped
>
>
> count: 6        issue: libdir
> qtbase-dbg: found library in wrong location: /usr/share/qt5/examples/widg=
ets/tools/echoplugin/plugin/.debug/libechoplugin.so [libdir]
> qtdeclarative-dbg: found library in wrong location: /usr/share/qt5/exampl=
es/qml/qmlextensionplugins/imports/TimeExample/.debug/libqmlqtimeexampleplu=
gin.so [libdir]
> qtdeclarative-dbg: found library in wrong location: /usr/share/qt5/exampl=
es/quick/customitems/painteditem/TextBalloonPlugin/.debug/libqmltextballoon=
plugin.so [libdir]
> qtmultimedia-5.5.99+5.6.0-alpha1+gitAUTOINC+ac1b772ec8: qtmultimedia-dbg:=
 found library in wrong location: /usr/share/qt5/examples/multimedia/spectr=
um/.debug/libfftreal.so.1.0.0 [libdir]
> qtquick1-dbg: found library in wrong location: /usr/share/qt5/examples/de=
clarative/cppextensions/imageprovider/ImageProviderCore/.debug/libqmlimagep=
roviderplugin.so [libdir]
> qtsensors-dbg: found library in wrong location: /usr/share/qt5/examples/s=
ensors/grue/.debug/libgruesensor.so.1.0.0 [libdir]
>
>
> count: 15       issue: textrel
> corosync-2.3.5: ELF binary '/tmp/work/core2-64-oe-linux/corosync/2.3.5-r0=
/packages-split/corosync/usr/sbin/corosync' has relocations in .text [textr=
el]
> gstreamer1.0-libav-1.6.2: ELF binary '/tmp/work/i586-oe-linux/gstreamer1.=
0-libav/1.6.2-r0/packages-split/gstreamer1.0-libav/usr/lib/gstreamer-1.0/li=
bgstlibav.so' has relocations in .text [textrel]
> libav-9.18: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/libav/9.18-r0/p=
ackages-split/libavcodec/usr/lib/libavcodec.so.54.35.0' has relocations in =
.text [textrel]
> libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-sp=
lit/libavcodec/usr/lib/libavcodec.so.54.35.0' has relocations in .text [tex=
trel]
> libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-sp=
lit/libavdevice/usr/lib/libavdevice.so.53.2.0' has relocations in .text [te=
xtrel]
> libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-sp=
lit/libavfilter/usr/lib/libavfilter.so.3.3.0' has relocations in .text [tex=
trel]
> libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-sp=
lit/libavformat/usr/lib/libavformat.so.54.20.4' has relocations in .text [t=
extrel]
> libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-sp=
lit/libavresample/usr/lib/libavresample.so.1.0.1' has relocations in .text =
[textrel]
> libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-sp=
lit/libavutil/usr/lib/libavutil.so.52.3.0' has relocations in .text [textre=
l]
> libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-sp=
lit/libswscale/usr/lib/libswscale.so.2.1.1' has relocations in .text [textr=
el]
> libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary '/tmp/work/armv5te-o=
e-linux-gnueabi/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split/=
libpostproc/usr/lib/libpostproc.so.52.3.0' has relocations in .text [textre=
l]
> libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary '/tmp/work/i586-oe-l=
inux/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split/libpostproc=
/usr/lib/libpostproc.so.52.3.0' has relocations in .text [textrel]
> matchbox-keyboard-0.0+gitAUTOINC+217f1bfe14: ELF binary '/tmp/work/armv5t=
e-oe-linux-gnueabi/matchbox-keyboard/0.0+gitAUTOINC+217f1bfe14-r4/packages-=
split/matchbox-keyboard/usr/bin/matchbox-keyboard' has relocations in .text=
 [textrel]
> qtwebengine-5.5.99+5.6.0-alpha1+gitAUTOINC+64dc919d31_7e655fbb76: ELF bin=
ary '/tmp/work/i586-oe-linux/qtwebengine/5.5.99+5.6.0-alpha1+gitAUTOINC+64d=
c919d31_7e655fbb76-r0/packages-split/qtwebengine/usr/lib/libQt5WebEngineCor=
e.so.5.6.0' has relocations in .text [textrel]
> webkit-efl-1.11.0: ELF binary '/tmp/work/i586-oe-linux/webkit-efl/1_1.11.=
0-r0/packages-split/webkit-efl/usr/lib/libjavascriptcore_efl.so.1.11.0' has=
 relocations in .text [textrel]
>
>
> count: 5        issue: build-deps
> cups-2.0.4: cups rdepends on libsystemd, but it isn't a build dependency?=
 [build-deps]
> dhcpcd-s libnewt.so()(64bit), but no providers found in its RDEPENDS [fil=
e-rdeps]
> chkconfig-1.3.58: /usr/sbin/ntsysv_chkconfig contained in package chkconf=
ig requires libnewt.so, but no providers found in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: /usr/bin/dvbdate_dvbdate contained in package dvbdate req=
uires libucsi.so()(64bit), but no providers found in its RDEPENDS [file-rde=
ps]
> dvb-apps-1.1.1: /usr/bin/dvbdate_dvbdate contained in package dvbdate req=
uires libucsi.so, but no providers found in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: /usr/bin/dvbnet_dvbnet contained in package dvbnet requir=
es libdvbapi.so()(64bit), but no providers found in its RDEPENDS [file-rdep=
s]
> dvb-apps-1.1.1: /usr/bin/dvbnet_dvbnet contained in package dvbnet requir=
es libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: /usr/bin/dvbscan_dvb-scan contained in package dvb-scan r=
equires libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: /usr/bin/dvbscan_dvb-scan contained in package dvb-scan r=
equires libdvbsec.so()(64bit), but no providers found in its RDEPENDS [file=
-rdeps]
> dvb-apps-1.1.1: /usr/bin/dvbtraffic_dvbtraffic contained in package dvbtr=
affic requires libdvbapi.so()(64bit), but no providers found in its RDEPEND=
S [file-rdeps]
> dvb-apps-1.1.1: /usr/bin/dvbtraffic_dvbtraffic contained in package dvbtr=
affic requires libdvbapi.so, but no providers found in its RDEPENDS [file-r=
deps]
> dvb-apps-1.1.1: /usr/bin/femon_dvb-femon contained in package dvb-femon r=
equires libdvbapi.so()(64bit), but no providers found in its RDEPENDS [file=
-rdeps]
> dvb-apps-1.1.1: /usr/bin/femon_dvb-femon contained in package dvb-femon r=
equires libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: /usr/bin/gotox_dvb-apps contained in package dvb-apps req=
uires libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
> dvb-apps-1.1.1: /usr/bin/gotox_dvb-apps contained in package dvb-apps req=
uires libdvbsec.so()(64bit), but no providers found in its RDEPENDS [file-r=
deps]
> fakeroot-1.18.4: /usr/bin/fakeroot_fakeroot contained in package fakeroot=
 requires /bin/bash, but no providers found in its RDEPENDS [file-rdeps]
> gnome-desktop-2.32.1: /usr/bin/gnome-about_gnome-desktop contained in pac=
kage gnome-desktop requires /usr/bin/python, but no providers found in its =
RDEPENDS [file-rdeps]
> gupnp-0.20.12: /usr/bin/gupnp-binding-tool_gupnp-dev contained in package=
 gupnp-dev requires /usr/bin/python, but no providers found in its RDEPENDS=
 [file-rdeps]
> libbonobo-2.32.1: /usr/bin/bonobo-slay_libbonobo contained in package lib=
bonobo requires /usr/bin/perl, but no providers found in its RDEPENDS [file=
-rdeps]
> libdrm-2.4.65: /usr/bin/amdgpu@underscore@test_libdrm-tests contained in =
package libdrm-tests requires libcunit.so.1, but no providers found in its =
RDEPENDS [file-rdeps]
> libmodule-build-perl-0.31: /usr/bin/config@underscore@data_libmodule-buil=
d-perl contained in package libmodule-build-perl requires /tmp/sysroots/x86=
_64-linux/usr/bin/perl-native/perl.real, but no providers found in its RDEP=
ENDS [file-rdeps]
> libnewt-0.52.18: /usr/bin/whiptail_whiptail contained in package whiptail=
 requires libnewt.so()(64bit), but no providers found in its RDEPENDS [file=
-rdeps]
> libnewt-0.52.18: /usr/bin/whiptail_whiptail contained in package whiptail=
 requires libnewt.so, but no providers found in its RDEPENDS [file-rdeps]
> libnewt-python-0.52.18: /usr/lib/python2.7/site-packages/@underscore@snac=
k.so_libnewt-python contained in package libnewt-python requires libnewt.so=
()(64bit), but no providers found in its RDEPENDS [filr-1.0.6: /usr/bin/nmt=
ui-connect_networkmanager-nmtui contained in package networkmanager-nmtui r=
equires libnewt.so, but no providers found in its RDEPENDS [file-rdeps]
> numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert.pl_numptyphys=
ics contained in package numptyphysics requires /usr/bin/perl, but no provi=
ders found in its RDEPENDS [file-rdeps]
> numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert@underscore@al=
l.sh_numptyphysics contained in package numptyphysics requires /bin/bash, b=
ut no providers found in its RDEPENDS [file-rdeps]
> tracker-0.14.2: /usr/lib/nautilus/extensions-2.0/libnautilus-tracker-tags=
.so_tracker-nautilus-extension contained in package tracker-nautilus-extens=
ion requires libnautilus-extension.so.1()(64bit), but no providers found in=
 its RDEPENDS [file-rdeps]
> tracker-0.14.2: /usr/lib/nautilus/extensions-2.0/libnautilus-tracker-tags=
.so_tracker-nautilus-extension contained in package tracker-nautilus-extens=
ion requires libnautilus-extension.so.1, but no providers found in its RDEP=
ENDS [file-rdeps]
> ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: /usr/bin/memory-map.sh_ubx-utils =
contained in package ubx-utils requires /bin/bash, but no providers found i=
n its RDEPENDS [file-rdeps]
> xfce4-clipman-plugin-1.2.6: /usr/bin/xfce4-clipman_xfce4-clipman-plugin c=
ontained in package xfce4-clipman-plugin requires libqrencode.so.3, but no =
providers found in its RDEPENDS [file-rdeps]
>
>
> count: 47604    issue: version-going-backwards
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

