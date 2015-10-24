Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id BADFF75BC5;
	Sat, 24 Oct 2015 12:07:15 +0000 (UTC)
Received: by wikq8 with SMTP id q8so108127752wik.1;
	Sat, 24 Oct 2015 05:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=xpyE709Lq0AjbH2qFxFjUmt4rRMRGds9pSqZEq7AGyw=;
	b=uPGe/pXQwXkJWlDm9UCEhH7zFwK8km1wcwi0ObLwbjJ424GgZpt52RGnx++KtxRp3H
	YArBcVJukzXAiMcAYHn3LJJr/J+97KttGUwFHj67nFvFTKmZGoRvNCy51MRLZaSHadeo
	6/9qzRXr+ERDf32obbHLlxbxdBXVDcXlsOucwR28OZnOrcUOPvxqyCfeYPwnBohfyEoY
	mDfOpKFN6P9MpzREr5jYUxRJOglg7Z81C6CDe86ONytBzhuR1imVdlMMA9Oqy+wmMjmL
	CaQ2syDEaRX5Tvr8E0vfOqKLvrldMolFd1JFfsRe3p/0XabUveDiDkrpl3Bax6xMY4Az
	i/MQ==
X-Received: by 10.194.192.6 with SMTP id hc6mr28633022wjc.33.1445688434885;
	Sat, 24 Oct 2015 05:07:14 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id lr6sm6412146wic.3.2015.10.24.05.07.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 24 Oct 2015 05:07:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 24 Oct 2015 14:07:46 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20151024120746.GA2575@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: State of bitbake world, Failed tasks 2015-10-22
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
X-List-Received-Date: Sat, 24 Oct 2015 12:07:18 -0000
X-Groupsio-MsgNum: 72607
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Content-Disposition: inline

--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

It's starting to look good for jethro branch, I've removed some pending cha=
nges from master-next (luajit, llvm upgrade, aalib), luajit (sysdig) fix wa=
s sent already so this will probably go in with next batch, then I'll creat=
e jethro branch.

=3D Tested changes (not included in master yet) - bitbake =3D=3D
0bae8ca world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
1f28971 Revert "mesa: upgrade llvm to 3.5"
a40dd51 mesa: upgrade llvm to 3.5
c10965d feature-arm-vfp.inc: add -mfpu=3Dvfpv4 when vfpv4 is in TUNE_FEATUR=
ES
259e9df feature-arm-vfp.inc: respect vfpv4 when setting -mfloat-abi and ARM=
PKGSFX_EABI
47b5867 arch-armv7ve: add tune include for armv7ve and use it from cortexa7=
 and cortexa15
f8876b9 tune-*: use mcpu instead of mtune for ARM tunes
fd14bb2 cortexa{7,15,17}: add VFPv4 tunes
905e1b1 directfb: add fPIC to CFLAGS
fc3c23d guile, mailx, gcc, opensp, gstreamer1.0-libav, libunwind: disable t=
humb where it fails for qemuarm
4559a15 icu: force arm mode
1913829 DO-NOT-MERGE: distutils3.bbclass: Don't use MACHINE variable
a2ef192 libsdl: Add support for libsdl-native
6c18c30 WIP: Add KERNEL_EXTRA_ARGS?
87dac72 sstate-sysroot-cruft: Add /usr/src/kernel/.* to whitelist
4809e15 report-error: Allow to upload reports automatically
ddf192c qemux86copy
d173002 Revert "qemux86: Add identical qemux86copy variant for tests"
2afab92 qemux86: Add identical qemux86copy variant for tests

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
fa23369 Revert "aalib: add new recipe"
db18321 Revert "luajit: Upgrade to 2.1 beta1"
deabeb9 Revert "llvm: update 3.5.2 to have a sane ARM JIT for OpenJDK-8"
6bb686f luajit: Upgrade to 2.1 beta1
b1142bc lmsensors: remove unused service file
c007327 libsrtp: add new recipe
d880a0f libdvdnav: add new recipe
1e4c987 vo-amrwbenc: add new recipe
ca399c3 vo-aacenc: add new recipe
422d360 opencore-amr: add new recipe
1a858e7 gst-plugins-ugly: Fix opencore AMR plugin support
1b77fa1 aalib: add new recipe
a68da43 drbd: fix permission bits of drbd.service
4c44c01 lmsensors-config: add configuration file sensord
eaa6df0 iperf3 :upgrade to 3.1
72b7758 wireshark: update package to 1.12.8
7130dbb lldpad: depends on readline
b5ecfed dracut: RDEPEND on util-linux
4cbf3c2 xerces-c: enable a native variant with BBCLASSEXTEND
282ae4e ntp: fix rpath QA issue
3c8557e webmin: remove perl-module-sdbm from RDEPENDS
bcad788 phpmyadmin: 4.4.9 -> 4.5.0.2
3a92b42 openldap: 2.4.41 -> 2.4.42
52fdf83 nftables: update nftables userland tools from 0.4 to 0.5
5dc26b5 libnftnl: update from 1.0.3 to 1.0.5
cc81278 nginx: update to 1.9.5
75e9b27 nginx: fix broken proxy_pass feature
e544584 llvm: update 3.5.2 to have a sane ARM JIT for OpenJDK-8
51f390a network-manager-applet: drop dependency on blacklisted gnome-keyring
1587496 lirc: use weak assignment in PACKAGECONFIG like other recipes
fb3d914 webmin: fix QA host-user-contaminated
35e7f80 debootstrap: cleanup the recipe
1cd7ab9 vpnc, arptables, lirc, debootstrap, log4cpp, python-ldap: drop unus=
ed variable PRIORITY
f3cfab1 rygel: Add recipe
4d8fb61 media-service-upnp: Update to 0.5.0
46f0902 gupnp-dlna: Update to 0.9.4, support gstreamer
6f1aeba mkvtoolnix: fix Boost build, update to 8.4.0, allow Qt5 GUI
e3a6337 vorbis-tools: fix CVE-2015-6749
0ba07a2 vim: do not autoenable the mouse
d602ab6 efibootmgr: 0.6.0 -> 0.12
c6c5168 efivar: 0.7 -> 0.21
aac734f vim: Upgrade to v7.4.769
af2bc9e drbd-utils: fix multilib problem
93da01d poppler: Support building against QT4-embedded
891687b netmap-modules: fix compilation failure
bde8fdf libnetfilter: Avoid using VLAs
f6adc51 net-snmp: Fix build with gcc5
c999ca6 meta-networking: recipes-connectivity: add relayd recipe
7c22c2b tsocks: Add tsocks to meta-network/recipes-protocols
df58eab squid: disable atomic operations for powerpc/mips
2e7f8db lldpd: Add recipe
d727d1c xl2tpd: 1.3.0 -> 1.3.6
a9871d9 inetutils: fix rcp to work with large file

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
f83bbac qt5: upgrade to latest revision in 5.5 branch (5.5.1+)
8d2f3f5 Revert "qt5-native: extend the list of directories to relocate with=
 OE_QMAKE_PATH_*"
8e349f9 qt5-native: extend the list of directories to relocate with OE_QMAK=
E_PATH_*

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D

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
||2015-10-22	||3	||3	||2	||3		||0		||10		||94		||30		||150		||34		||1		||1	=
	||1		||3		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2015-10-22 =3D=3D

INFO: jenkins-job.sh-1.4.7 Complete log available at http://logs.nslu2-linu=
x.org/buildlogs/oe/world/log.report.20151024_004505.log

=3D=3D=3D common () =3D=3D=3D

=3D=3D=3D common-x86 (1) =3D=3D=3D
    * /meta-browser/recipes-browser/chromium/chromium_40.0.2214.91.bb, do_c=
ompile

=3D=3D=3D qemuarm (3) =3D=3D=3D
    * /meta-openembedded/meta-oe/recipes-extended/sysdig/sysdig_git.bb, do_=
compile
    * /meta-openembedded/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb=
, do_compile
    * /openembedded-core/meta/recipes-support/libunwind/libunwind_1.1.bb, d=
o_compile

=3D=3D=3D qemux86 (1) =3D=3D=3D
    * /meta-browser/recipes-browser/chromium/cef3_280796.bb, do_compile

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * /meta-browser/recipes-browser/chromium/cef3_280796.bb, do_configure

=3D=3D=3D Number of failed tasks (8) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 3	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.wo=
rld.20151021_141332.log// || http://errors.yoctoproject.org:80/Errors/Build=
/9454/
|-
|| qemux86 	|| 3	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.wo=
rld.20151022_132211.log// || http://errors.yoctoproject.org:80/Errors/Build=
/9456/
|-
|| qemux86_64 	|| 2	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log=
=2Eworld.20151022_220923.log// || http://errors.yoctoproject.org:80/Errors/=
Build/9511/
|}

=3D=3D=3D PNBLACKLISTs (95) =3D=3D=3D

=3D=3D=3D QA issues (327) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
|-
||0	||libdir
|-
||0	||pkgname
|-
||1	||installed-vs-shipped
|-
||1	||symlink-to-sysroot
|-
||1	||unknown-configure-option
|-
||10	||textrel
|-
||150	||version-going-backwards
|-
||3	||already-stripped
|-
||3	||invalid-pkgconfig
|-
||30	||file-rdeps
|-
||34	||host-user-contaminated
|-
||94	||build-deps
|}


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-efl/recipes-efl/e17/diskio_svn.bb:PNBLACKLIST[diskio] ?=3D "broken: sw=
itch to https://git.enlightenment.org/enlightenment/modules/diskio.git/ and=
 fix 0.0.1+svnr82070-r0.0/E-MODULES-EXTRA/diskio/e-module-diskio.edc:58. in=
valid state name: 'off'. "default" state must always be first."
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
meta-efl/recipes-efl/efl/epdf_svn.bb:PNBLACKLIST[epdf] ?=3D "BROKEN: fails =
to build with newer poppler"
meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb:PNBLACKLIST[mcnavi] ?=3D=
 "BROKEN: latest version 0.3.4 is 3 years old and now broken with more stri=
ct ejde_cc from efl-1.13"
meta-gnome/recipes-apps/epdfview/epdfview_0.1.8.bb:PNBLACKLIST[epdfview] ?=
=3D "BROKEN: images are not displayed anymore"
meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLACKLIST[gn=
ome-mplayer] ?=3D "rdepends on blacklisted mplayer"
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
meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb:PNBLACKLIST[gs=
t123] ?=3D "gst123 is still "sometimes" using wrong sysroot"
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
meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb:PNBLACKLIST[package=
kit] ?=3D "BROKEN: depends on old deprecated libopkg which is currently dis=
abled and will be removed soon"
meta-oe/recipes-extended/libuio/libuio_0.2.1.bb:PNBLACKLIST[libuio] ?=3D "B=
ROKEN, fails to build with gcc-5"
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
meta-oe/recipes-graphics/xorg-app/sessreg_1.1.0.bb:PNBLACKLIST[sessreg] ?=
=3D "BROKEN: fails to generate man pages"
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
=3D "BROKEN, fails to build with gcc-5"
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
meta-oe/recipes-qt/qcanobserver/qcanobserver-socketcan_svn.bb:PNBLACKLIST[q=
canobserver-socketcan] ?=3D "depends on qwt-5 APIs"
meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb:PNBLACKLIST[qcanobserve=
r] ?=3D "depends on qwt-5 APIs"
meta-oe/recipes-qt/qconnman/qconnman-e_git.bb:PNBLACKLIST[qconnman-e] ?=3D =
"BROKEN: doesn't work with B!=3DS, ls: cannot access *.pro: No such file or=
 directory"
meta-oe/recipes-qt/qconnman/qconnman_git.bb:PNBLACKLIST[qconnman] ?=3D "BRO=
KEN: doesn't work with B!=3DS, ls: cannot access *.pro: No such file or dir=
ectory"
meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb:PNBLACKLIST[qt-creator] ?=
=3D "BROKEN: fails to build with gcc-5 and conflicts with qt5-creator"
meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb:PNBLACKLIST[apcupsd] ?=
=3D "BROKEN: doesn't build with B!=3DS"
meta-oe/recipes-support/emacs/emacs_23.4.bb:PNBLACKLIST[emacs] ?=3D "qemu: =
uncaught target signal 11 (Segmentation fault) - core dumped"
meta-oe/recipes-support/fftw/benchfft_3.1.bb:PNBLACKLIST[benchfft] ?=3D "do=
es not build with distroless qemuarm as reported in 'State of bitbake world=
' thread, nobody volunteered to fix them"
meta-oe/recipes-support/freerdp/freerdp_git.bb:PNBLACKLIST[freerdp] ?=3D "I=
nstalls into double prefix, causing all files installed in /usr/usr and emp=
ty packages"
meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb:PNBLACKLIST[libdbi=
-drivers] ?=3D "BROKEN: fails to build with gcc-5"
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
meta-perl/recipes-perl/libnet/libnet-dns-perl_0.81.bb:PNBLACKLIST[libnet-dn=
s-perl] ?=3D "BROKEN: Fails to build since some changes in perl recipe"
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


count: 0	issue: libdir


count: 10	issue: textrel
aalib-1.4rc4: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/aalib/1.4rc4-r=
0/packages-split/aalib/usr/lib/libaa.so.1.0.4' has relocations in .text [te=
xtrel]
aalib-1.4rc4: ELF binary '/tmp/work/i586-oe-linux/aalib/1.4rc4-r0/packages-=
split/aalib/usr/lib/libaa.so.1.0.4' has relocations in .text [textrel]
corosync-2.3.5: ELF binary '/tmp/work/core2-64-oe-linux/corosync/2.3.5-r0/p=
ackages-split/corosync/usr/sbin/corosync' has relocations in .text [textrel]
efl-1.15.1: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/efl/2_1.15.1-r0/p=
ackages-split/evas/usr/lib/evas/cserve2/bin/v-1.15/evas_cserve2_slave' has =
relocations in .text [textrel]
gstreamer1.0-libav-1.4.5: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/gst=
reamer1.0-libav/1.4.5-r0/packages-split/gstreamer1.0-libav/usr/lib/gstreame=
r-1.0/libgstlibav.so' has relocations in .text [textrel]
libav-9.18: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/libav/9.18-r0/pac=
kages-split/libavcodec/usr/lib/libavcodec.so.54.35.0' has relocations in .t=
ext [textrel]
libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary '/tmp/work/armv5te-oe-=
linux-gnueabi/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split/li=
bpostproc/usr/lib/libpostproc.so.52.3.0' has relocations in .text [textrel]
matchbox-keyboard-0.0+gitAUTOINC+217f1bfe14: ELF binary '/tmp/work/armv5te-=
oe-linux-gnueabi/matchbox-keyboard/0.0+gitAUTOINC+217f1bfe14-r4/packages-sp=
lit/matchbox-keyboard/usr/bin/matchbox-keyboard' has relocations in .text [=
textrel]
qtwebengine-5.5.1+gitAUTOINC+ab19c45000: ELF binary '/tmp/work/i586-oe-linu=
x/qtwebengine/5.5.1+gitAUTOINC+ab19c45000-r0/packages-split/qtwebengine-plu=
gins/usr/lib/qt5/plugins/qtwebengine/libffmpegsumo.so' has relocations in .=
text [textrel]
webkit-efl-1.11.0: ELF binary '/tmp/work/i586-oe-linux/webkit-efl/1_1.11.0-=
r0/packages-split/webkit-efl/usr/lib/libjavascriptcore_efl.so.1.11.0' has r=
elocations in .text [textrel]


count: 94	issue: build-deps
aalib-1.4rc4: aalib rdepends on libx11, but it isn't a build dependency? [b=
uild-deps]
aalib-1.4rc4: aalib rdepends on libxau, but it isn't a build dependency? [b=
uild-deps]
aalib-1.4rc4: aalib rdepends on libxcb, but it isn't a build dependency? [b=
uild-deps]
aalib-1.4rc4: aalib rdepends on libxdmcp, but it isn't a build dependency? =
[build-deps]
cheese-2.30.1: cheese rdepends on libgudev, but it isn't a build dependency=
? [build-deps]
cifs-utils-6.4: cifs-utils rdepends on samba, but it isn't a build dependen=
cy? [build-deps]
clutter-gst-3.0-3.0.8: clutter-gst-3.0 rdepends on libgudev, but it isn't a=
 build dependency? [build-deps]
cpu-0.0.1+svnr82070: cpu rdepends on libunwind, but it isn't a build depend=
ency? [build-deps]
devicekit-power-014: devicekit-power rdepends on libgudev, but it isn't a b=
uild dependency? [build-deps]
dovecot-2.2.18: dovecot rdepends on lz4, but it isn't a build dependency? [=
build-deps]
dovecot-2.2.18: dovecot-dev rdepends on lz4, but it isn't a build dependenc=
y? [build-deps]
e-wm-0.18.8: e-wm rdepends on libunwind, but it isn't a build dependency? [=
build-deps]
edbus-1.7.9: edbus-ebluez rdepends on libunwind, but it isn't a build depen=
dency? [build-deps]
edbus-1.7.9: edbus-econnman rdepends on libunwind, but it isn't a build dep=
endency? [build-deps]
edbus-1.7.9: edbus-edbus rdepends on libunwind, but it isn't a build depend=
ency? [build-deps]
edbus-1.7.9: edbus-ehal rdepends on libunwind, but it isn't a build depende=
ncy? [build-deps]
edbus-1.7.9: edbus-enotify rdepends on libunwind, but it isn't a build depe=
ndency? [build-deps]
edbus-1.7.9: edbus-eofono rdepends on libunwind, but it isn't a build depen=
dency? [build-deps]
edbus-1.7.9: edbus-eukit rdepends on libunwind, but it isn't a build depend=
ency? [build-deps]
efl-1.15.1: ecore rdepends on libunwind, but it isn't a build dependency? [=
build-deps]
efl-1.15.1: ecore-audio rdepends on libunwind, but it isn't a build depende=
ncy? [build-deps]
efl-1.15.1: ecore-con rdepends on libunwind, but it isn't a build dependenc=
y? [build-deps]
efl-1.15.1: ecore-evas rdepends on libunwind, but it isn't a build dependen=
cy? [build-deps]
efl-1.15.1: ecore-file rdepends on libunwind, but it isn't a build dependen=
cy? [build-deps]
efl-1.15.1: ecore-imf rdepends on libunwind, but it isn't a build dependenc=
y? [build-deps]
efl-1.15.1: ecore-imf-evas rdepends on libunwind, but it isn't a build depe=
ndency? [build-deps]
efl-1.15.1: ecore-input rdepends on libunwind, but it isn't a build depende=
ncy? [build-deps]
efl-1.15.1: ecore-input-evas rdepends on libunwind, but it isn't a build de=
pendency? [build-deps]
efl-1.15.1: ecore-ipc rdepends on libunwind, but it isn't a build dependenc=
y? [build-deps]
efl-1.15.1: ecore-x rdepends on libunwind, but it isn't a build dependency?=
 [build-deps]
efl-1.15.1: edje rdepends on libunwind, but it isn't a build dependency? [b=
uild-deps]
efl-1.15.1: eeze rdepends on libunwind, but it isn't a build dependency? [b=
uild-deps]
efl-1.15.1: efl rdepends on libunwind, but it isn't a build dependency? [bu=
ild-deps]
efl-1.15.1: efreet-mime rdepends on libunwind, but it isn't a build depende=
ncy? [build-deps]
efl-1.15.1: efreet-trash rdepends on libunwind, but it isn't a build depend=
ency? [build-deps]
efl-1.15.1: eina rdepends on libunwind, but it isn't a build dependency? [b=
uild-deps]
efl-1.15.1: eio rdepends on libunwind, but it isn't a build dependency? [bu=
ild-deps]
efl-1.15.1: eldbus rdepends on libunwind, but it isn't a build dependency? =
[build-deps]
efl-1.15.1: embryo rdepends on libunwind, but it isn't a build dependency? =
[build-deps]
efl-1.15.1: emotion rdepends on libunwind, but it isn't a build dependency?=
 [build-deps]
efl-1.15.1: eo rdepends on libunwind, but it isn't a build dependency? [bui=
ld-deps]
efl-1.15.1: ethumb rdepends on libunwind, but it isn't a build dependency? =
[build-deps]
efl-1.15.1: evas rdepends on libunwind, but it isn't a build dependency? [b=
uild-deps]
efl-1.15.1: libeet rdepends on libunwind, but it isn't a build dependency? =
[build-deps]
efl-1.15.1: libefreet rdepends on libunwind, but it isn't a build dependenc=
y? [build-deps]
efl-1.15.1: libemotion rdepends on libunwind, but it isn't a build dependen=
cy? [build-deps]
elementary-1.15.1: elementary rdepends on libunwind, but it isn't a build d=
ependency? [build-deps]
elementary-1.15.1: elementary-accessibility rdepends on libunwind, but it i=
sn't a build dependency? [build-deps]
elementary-1.15.1: elementary-tests rdepends on libunwind, but it isn't a b=
uild dependency? [build-deps]
elfe-0.0.1+gitrAUTOINC+1ec0e7713c: elfe rdepends on libunwind, but it isn't=
 a build dependency? [build-deps]
engrave-0.0.0+svnr82070: engrave rdepends on libunwind, but it isn't a buil=
d dependency? [build-deps]
enjoy-0.1.0+gitrAUTOINC+aa8fec69e8: enjoy rdepends on libunwind, but it isn=
't a build dependency? [build-deps]
estardict-0.7: estardict rdepends on libunwind, but it isn't a build depend=
ency? [build-deps]
exalt-0.9+svnr82070: exalt rdepends on libunwind, but it isn't a build depe=
ndency? [build-deps]
exalt-client-0.0.1+svnr82070: exalt-client rdepends on libunwind, but it is=
n't a build dependency? [build-deps]
exquisite-0.0.1+svnr82070: exquisite rdepends on libunwind, but it isn't a =
build dependency? [build-deps]
flame-0.0.3+svnr82070: flame rdepends on libunwind, but it isn't a build de=
pendency? [build-deps]
forecasts-0.2.0+svnr82070: forecasts rdepends on libunwind, but it isn't a =
build dependency? [build-deps]
gammu-1.32.0: gammu rdepends on libgudev, but it isn't a build dependency? =
[build-deps]
gimp-2.8.14: gimp rdepends on aalib, but it isn't a build dependency? [buil=
d-deps]
gphoto2-2.5.8: gphoto2 rdepends on aalib, but it isn't a build dependency? =
[build-deps]
gst-plugins-good-0.10.31: gst-plugins-good-video4linux2 rdepends on libgude=
v, but it isn't a build dependency? [build-deps]
gstreamer1.0-plugins-bad-1.4.5: gstreamer1.0-plugins-bad-uvch264 rdepends o=
n libgudev, but it isn't a build dependency? [build-deps]
gstreamer1.0-plugins-good-1.4.5: gstreamer1.0-plugins-good-video4linux2 rde=
pends on libgudev, but it isn't a build dependency? [build-deps]
imsettings-1.6.8: imsettings rdepends on xfconf, but it isn't a build depen=
dency? [build-deps]
libeflvala-2011.01.13.1+svnr82070: libeflvala rdepends on libunwind, but it=
 isn't a build dependency? [build-deps]
libeweather-0.0.0+svnr82070: libeweather rdepends on libunwind, but it isn'=
t a build dependency? [build-deps]
libeweather-0.0.0+svnr82070: libeweather-plugins rdepends on libunwind, but=
 it isn't a build dependency? [build-deps]
libphone-ui-shr-0.0.1+gitrAUTOINC+25e6160710: libphone-ui-shr rdepends on l=
ibunwind, but it isn't a build dependency? [build-deps]
pinpoint-0.1.4+gitrAUTOINC+80a056c57e: pinpoint rdepends on librsvg, but it=
 isn't a build dependency? [build-deps]
places-0.1.0+svnr82070: places rdepends on libunwind, but it isn't a build =
dependency? [build-deps]
pure-ftpd-1.0.42: pure-ftpd rdepends on libsodium, but it isn't a build dep=
endency? [build-deps]
python-edbus-1.7.0: python-edbus rdepends on libunwind, but it isn't a buil=
d dependency? [build-deps]
qt-mobility-embedded-1.2.0: qt-mobility-embedded rdepends on libgstapp-0.10=
, but it isn't a build dependency? [build-deps]
qt-mobility-embedded-1.2.0: qt-mobility-embedded rdepends on libgstvideo-0.=
10, but it isn't a build dependency? [build-deps]
qt-mobility-x11-1.2.0: qt-mobility-x11 rdepends on libgstapp-0.10, but it i=
sn't a build dependency? [build-deps]
qt-mobility-x11-1.2.0: qt-mobility-x11 rdepends on libgstinterfaces-0.10, b=
ut it isn't a build dependency? [build-deps]
qt-mobility-x11-1.2.0: qt-mobility-x11 rdepends on libgstvideo-0.10, but it=
 isn't a build dependency? [build-deps]
qt-mobility-x11-1.2.0: qt-mobility-x11 rdepends on libxv, but it isn't a bu=
ild dependency? [build-deps]
qtwebengine-5.5.1+gitAUTOINC+ab19c45000: qtwebengine rdepends on luna-servi=
ce2, but it isn't a build dependency? [build-deps]
qtwebengine-5.5.1+gitAUTOINC+ab19c45000: qtwebengine rdepends on pmloglib, =
but it isn't a build dependency? [build-deps]
qtwebengine-5.5.1+gitAUTOINC+ab19c45000: qtwebengine rdepends on qtlocation=
, but it isn't a build dependency? [build-deps]
rain-0.0.3+svnr82070: rain rdepends on libunwind, but it isn't a build depe=
ndency? [build-deps]
rygel-0.26.1: rygel-plugin-media-export rdepends on libunistring, but it is=
n't a build dependency? [build-deps]
samba-4.1.12: samba rdepends on libavahi-client, but it isn't a build depen=
dency? [build-deps]
samba-4.1.12: samba rdepends on libavahi-common, but it isn't a build depen=
dency? [build-deps]
shr-e-gadgets-0.0.0+gitrAUTOINC+42806ea24f: shr-e-gadgets rdepends on libun=
wind, but it isn't a build dependency? [build-deps]
shr-wizard-0.0.0+gitrAUTOINC+1dae79221f: shr-wizard rdepends on libunwind, =
but it isn't a build dependency? [build-deps]
sox-14.4.0: sox rdepends on libflac, but it isn't a build dependency? [buil=
d-deps]
sox-14.4.0: sox rdepends on opencore-amr, but it isn't a build dependency? =
[build-deps]
uptime-0.0.2+svnr82070: uptime rdepends on libunwind, but it isn't a build =
dependency? [build-deps]
vlc-2.2.1: vlc rdepends on libavc1394, but it isn't a build dependency? [bu=
ild-deps]
vlc-2.2.1: vlc rdepends on libssh2, but it isn't a build dependency? [build=
-deps]
vlc-2.2.1: vlc rdepends on libupnp, but it isn't a build dependency? [build=
-deps]


count: 30	issue: file-rdeps
chkconfig-1.3.58: /usr/sbin/ntsysv_chkconfig contained in package chkconfig=
 requires libnewt.so()(64bit), but no providers found in its RDEPENDS [file=
-rdeps]
chkconfig-1.3.58: /usr/sbin/ntsysv_chkconfig contained in package chkconfig=
 requires libnewt.so, but no providers found in its RDEPENDS [file-rdeps]
ctdb-2.5.1: /usr/bin/onnode_ctdb contained in package ctdb requires /bin/ba=
sh, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbdate_dvbdate contained in package dvbdate requi=
res libucsi.so()(64bit), but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbdate_dvbdate contained in package dvbdate requi=
res libucsi.so, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbnet_dvbnet contained in package dvbnet requires=
 libdvbapi.so()(64bit), but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbnet_dvbnet contained in package dvbnet requires=
 libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbscan_dvb-scan contained in package dvb-scan req=
uires libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbscan_dvb-scan contained in package dvb-scan req=
uires libdvbsec.so()(64bit), but no providers found in its RDEPENDS [file-r=
deps]
dvb-apps-1.1.1: /usr/bin/dvbtraffic_dvbtraffic contained in package dvbtraf=
fic requires libdvbapi.so()(64bit), but no providers found in its RDEPENDS =
[file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbtraffic_dvbtraffic contained in package dvbtraf=
fic requires libdvbapi.so, but no providers found in its RDEPENDS [file-rde=
ps]
dvb-apps-1.1.1: /usr/bin/femon_dvb-femon contained in package dvb-femon req=
uires libdvbapi.so()(64bit), but no providers found in its RDEPENDS [file-r=
deps]
dvb-apps-1.1.1: /usr/bin/femon_dvb-femon contained in package dvb-femon req=
uires libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/gotox_dvb-apps contained in package dvb-apps requi=
res libdvbapi.so, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/gotox_dvb-apps contained in package dvb-apps requi=
res libdvbsec.so()(64bit), but no providers found in its RDEPENDS [file-rde=
ps]
fakeroot-1.18.4: /usr/bin/fakeroot_fakeroot contained in package fakeroot r=
equires /bin/bash, but no providers found in its RDEPENDS [file-rdeps]
gnome-desktop-2.32.1: /usr/bin/gnome-about_gnome-desktop contained in packa=
ge gnome-desktop requires /usr/bin/python, but no providers found in its RD=
EPENDS [file-rdeps]
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
networkmanager-1.0.4: /usr/bin/nmtui-connect_networkmanager contained in pa=
ckage networkmanager requires libnewt.so()(64bit), but no providers found i=
n its RDEPENDS [file-rdeps]
networkmanager-1.0.4: /usr/bin/nmtui-connect_networkmanager contained in pa=
ckage networkmanager requires libnewt.so, but no providers found in its RDE=
PENDS [file-rdeps]
numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert@underscore@all.=
sh_numptyphysics contained in package numptyphysics requires /bin/bash, but=
 no providers found in its RDEPENDS [file-rdeps]
rrdtool-1.5.4: /usr/share/rrdtool/examples/stripes.py_rrdtool-perl containe=
d in package rrdtool-perl requires /usr/bin/python, but no providers found =
in its RDEPENDS [file-rdeps]
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


count: 150	issue: version-going-backwards
e-wm-theme-b-and-w-0.0+svnr82070: Package version for package e-wm-theme-b-=
and-w went backwards which would break package feeds from (0:0.0+svnr82070-=
r0.49 to 0:0.0+svnr82070-r0.48) [version-going-backwards]
e-wm-theme-b-and-w-0.0+svnr82070: Package version for package e-wm-theme-b-=
and-w-dbg went backwards which would break package feeds from (0:0.0+svnr82=
070-r0.49 to 0:0.0+svnr82070-r0.48) [version-going-backwards]
e-wm-theme-b-and-w-0.0+svnr82070: Package version for package e-wm-theme-b-=
and-w-dev went backwards which would break package feeds from (0:0.0+svnr82=
070-r0.49 to 0:0.0+svnr82070-r0.48) [version-going-backwards]
e-wm-theme-b-and-w-0.0+svnr82070: Package version for package e-wm-theme-b-=
and-w-doc went backwards which would break package feeds from (0:0.0+svnr82=
070-r0.49 to 0:0.0+svnr82070-r0.48) [version-going-backwards]
e-wm-theme-b-and-w-0.0+svnr82070: Package version for package e-wm-theme-b-=
and-w-locale went backwards which would break package feeds from (0:0.0+svn=
r82070-r0.49 to 0:0.0+svnr82070-r0.48) [version-going-backwards]
e-wm-theme-b-and-w-0.0+svnr82070: Package version for package e-wm-theme-b-=
and-w-staticdev went backwards which would break package feeds from (0:0.0+=
svnr82070-r0.49 to 0:0.0+svnr82070-r0.48) [version-going-backwards]
e-wm-theme-illume-efenniht-0.0+svnr82070: Package version for package e-wm-=
theme-illume-efenniht went backwards which would break package feeds from (=
0:0.0+svnr82070-r0.51 to 0:0.0+svnr82070-r0.50) [version-going-backwards]
e-wm-theme-illume-efenniht-0.0+svnr82070: Package version for package e-wm-=
theme-illume-efenniht-dbg went backwards which would break package feeds fr=
om (0:0.0+svnr82070-r0.51 to 0:0.0+svnr82070-r0.50) [version-going-backward=
s]
e-wm-theme-illume-efenniht-0.0+svnr82070: Package version for package e-wm-=
theme-illume-efenniht-dev went backwards which would break package feeds fr=
om (0:0.0+svnr82070-r0.51 to 0:0.0+svnr82070-r0.50) [version-going-backward=
s]
e-wm-theme-illume-efenniht-0.0+svnr82070: Package version for package e-wm-=
theme-illume-efenniht-doc went backwards which would break package feeds fr=
om (0:0.0+svnr82070-r0.51 to 0:0.0+svnr82070-r0.50) [version-going-backward=
s]
e-wm-theme-illume-efenniht-0.0+svnr82070: Package version for package e-wm-=
theme-illume-efenniht-locale went backwards which would break package feeds=
 from (0:0.0+svnr82070-r0.51 to 0:0.0+svnr82070-r0.50) [version-going-backw=
ards]
e-wm-theme-illume-efenniht-0.0+svnr82070: Package version for package e-wm-=
theme-illume-efenniht-staticdev went backwards which would break package fe=
eds from (0:0.0+svnr82070-r0.51 to 0:0.0+svnr82070-r0.50) [version-going-ba=
ckwards]
e-wm-theme-illume-gry-0.4+gitrAUTOINC+4e6035ef54: Package version for packa=
ge e-wm-theme-illume-gry went backwards which would break package feeds fro=
m (0:0.4+gitr0+4e6035ef54-r0.51 to 0:0.4+gitr0+4e6035ef54-r0.50) [version-g=
oing-backwards]
e-wm-theme-illume-gry-0.4+gitrAUTOINC+4e6035ef54: Package version for packa=
ge e-wm-theme-illume-gry-dbg went backwards which would break package feeds=
 from (0:0.4+gitr0+4e6035ef54-r0.51 to 0:0.4+gitr0+4e6035ef54-r0.50) [versi=
on-going-backwards]
e-wm-theme-illume-gry-0.4+gitrAUTOINC+4e6035ef54: Package version for packa=
ge e-wm-theme-illume-gry-dev went backwards which would break package feeds=
 from (0:0.4+gitr0+4e6035ef54-r0.51 to 0:0.4+gitr0+4e6035ef54-r0.50) [versi=
on-going-backwards]
e-wm-theme-illume-gry-0.4+gitrAUTOINC+4e6035ef54: Package version for packa=
ge e-wm-theme-illume-gry-doc went backwards which would break package feeds=
 from (0:0.4+gitr0+4e6035ef54-r0.51 to 0:0.4+gitr0+4e6035ef54-r0.50) [versi=
on-going-backwards]
e-wm-theme-illume-gry-0.4+gitrAUTOINC+4e6035ef54: Package version for packa=
ge e-wm-theme-illume-gry-locale went backwards which would break package fe=
eds from (0:0.4+gitr0+4e6035ef54-r0.51 to 0:0.4+gitr0+4e6035ef54-r0.50) [ve=
rsion-going-backwards]
e-wm-theme-illume-gry-0.4+gitrAUTOINC+4e6035ef54: Package version for packa=
ge e-wm-theme-illume-gry-staticdev went backwards which would break package=
 feeds from (0:0.4+gitr0+4e6035ef54-r0.51 to 0:0.4+gitr0+4e6035ef54-r0.50) =
[version-going-backwards]
e-wm-theme-illume-neo-0.2+gitrAUTOINC+bdc2f5992d: Package version for packa=
ge e-wm-theme-illume-neo went backwards which would break package feeds fro=
m (0:0.2+gitr0+bdc2f5992d-r0.50 to 0:0.2+gitr0+bdc2f5992d-r0.49) [version-g=
oing-backwards]
e-wm-theme-illume-neo-0.2+gitrAUTOINC+bdc2f5992d: Package version for packa=
ge e-wm-theme-illume-neo-dbg went backwards which would break package feeds=
 from (0:0.2+gitr0+bdc2f5992d-r0.50 to 0:0.2+gitr0+bdc2f5992d-r0.49) [versi=
on-going-backwards]
e-wm-theme-illume-neo-0.2+gitrAUTOINC+bdc2f5992d: Package version for packa=
ge e-wm-theme-illume-neo-dev went backwards which would break package feeds=
 from (0:0.2+gitr0+bdc2f5992d-r0.50 to 0:0.2+gitr0+bdc2f5992d-r0.49) [versi=
on-going-backwards]
e-wm-theme-illume-neo-0.2+gitrAUTOINC+bdc2f5992d: Package version for packa=
ge e-wm-theme-illume-neo-doc went backwards which would break package feeds=
 from (0:0.2+gitr0+bdc2f5992d-r0.50 to 0:0.2+gitr0+bdc2f5992d-r0.49) [versi=
on-going-backwards]
e-wm-theme-illume-neo-0.2+gitrAUTOINC+bdc2f5992d: Package version for packa=
ge e-wm-theme-illume-neo-locale went backwards which would break package fe=
eds from (0:0.2+gitr0+bdc2f5992d-r0.50 to 0:0.2+gitr0+bdc2f5992d-r0.49) [ve=
rsion-going-backwards]
e-wm-theme-illume-neo-0.2+gitrAUTOINC+bdc2f5992d: Package version for packa=
ge e-wm-theme-illume-neo-staticdev went backwards which would break package=
 feeds from (0:0.2+gitr0+bdc2f5992d-r0.50 to 0:0.2+gitr0+bdc2f5992d-r0.49) =
[version-going-backwards]
e-wm-theme-illume-niebiee-0.2+gitrAUTOINC+4e6035ef54: Package version for p=
ackage e-wm-theme-illume-niebiee went backwards which would break package f=
eeds from (0:0.2+gitr0+4e6035ef54-r0.50 to 0:0.2+gitr0+4e6035ef54-r0.49) [v=
ersion-going-backwards]
e-wm-theme-illume-niebiee-0.2+gitrAUTOINC+4e6035ef54: Package version for p=
ackage e-wm-theme-illume-niebiee-dbg went backwards which would break packa=
ge feeds from (0:0.2+gitr0+4e6035ef54-r0.50 to 0:0.2+gitr0+4e6035ef54-r0.49=
) [version-going-backwards]
e-wm-theme-illume-niebiee-0.2+gitrAUTOINC+4e6035ef54: Package version for p=
ackage e-wm-theme-illume-niebiee-dev went backwards which would break packa=
ge feeds from (0:0.2+gitr0+4e6035ef54-r0.50 to 0:0.2+gitr0+4e6035ef54-r0.49=
) [version-going-backwards]
e-wm-theme-illume-niebiee-0.2+gitrAUTOINC+4e6035ef54: Package version for p=
ackage e-wm-theme-illume-niebiee-doc went backwards which would break packa=
ge feeds from (0:0.2+gitr0+4e6035ef54-r0.50 to 0:0.2+gitr0+4e6035ef54-r0.49=
) [version-going-backwards]
e-wm-theme-illume-niebiee-0.2+gitrAUTOINC+4e6035ef54: Package version for p=
ackage e-wm-theme-illume-niebiee-locale went backwards which would break pa=
ckage feeds from (0:0.2+gitr0+4e6035ef54-r0.50 to 0:0.2+gitr0+4e6035ef54-r0=
=2E49) [version-going-backwards]
e-wm-theme-illume-niebiee-0.2+gitrAUTOINC+4e6035ef54: Package version for p=
ackage e-wm-theme-illume-niebiee-staticdev went backwards which would break=
 package feeds from (0:0.2+gitr0+4e6035ef54-r0.50 to 0:0.2+gitr0+4e6035ef54=
-r0.49) [version-going-backwards]
e-wm-theme-illume-shr-1.2+gitrAUTOINC+4e6035ef54: Package version for packa=
ge e-wm-theme-illume-shr went backwards which would break package feeds fro=
m (0:1.2+gitr0+4e6035ef54-r0.49 to 0:1.2+gitr0+4e6035ef54-r0.48) [version-g=
oing-backwards]
e-wm-theme-illume-shr-1.2+gitrAUTOINC+4e6035ef54: Package version for packa=
ge e-wm-theme-illume-shr-dbg went backwards which would break package feeds=
 from (0:1.2+gitr0+4e6035ef54-r0.49 to 0:1.2+gitr0+4e6035ef54-r0.48) [versi=
on-going-backwards]
e-wm-theme-illume-shr-1.2+gitrAUTOINC+4e6035ef54: Package version for packa=
ge e-wm-theme-illume-shr-dev went backwards which would break package feeds=
 from (0:1.2+gitr0+4e6035ef54-r0.49 to 0:1.2+gitr0+4e6035ef54-r0.48) [versi=
on-going-backwards]
e-wm-theme-illume-shr-1.2+gitrAUTOINC+4e6035ef54: Package version for packa=
ge e-wm-theme-illume-shr-doc went backwards which would break package feeds=
 from (0:1.2+gitr0+4e6035ef54-r0.49 to 0:1.2+gitr0+4e6035ef54-r0.48) [versi=
on-going-backwards]
e-wm-theme-illume-shr-1.2+gitrAUTOINC+4e6035ef54: Package version for packa=
ge e-wm-theme-illume-shr-locale went backwards which would break package fe=
eds from (0:1.2+gitr0+4e6035ef54-r0.49 to 0:1.2+gitr0+4e6035ef54-r0.48) [ve=
rsion-going-backwards]
e-wm-theme-illume-shr-1.2+gitrAUTOINC+4e6035ef54: Package version for packa=
ge e-wm-theme-illume-shr-staticdev went backwards which would break package=
 feeds from (0:1.2+gitr0+4e6035ef54-r0.49 to 0:1.2+gitr0+4e6035ef54-r0.48) =
[version-going-backwards]
e-wm-theme-illume-sixteen-0.2+gitrAUTOINC+4e6035ef54: Package version for p=
ackage e-wm-theme-illume-sixteen went backwards which would break package f=
eeds from (0:0.2+gitr0+4e6035ef54-r0.51 to 0:0.2+gitr0+4e6035ef54-r0.50) [v=
ersion-going-backwards]
e-wm-theme-illume-sixteen-0.2+gitrAUTOINC+4e6035ef54: Package version for p=
ackage e-wm-theme-illume-sixteen-dbg went backwards which would break packa=
ge feeds from (0:0.2+gitr0+4e6035ef54-r0.51 to 0:0.2+gitr0+4e6035ef54-r0.50=
) [version-going-backwards]
e-wm-theme-illume-sixteen-0.2+gitrAUTOINC+4e6035ef54: Package version for p=
ackage e-wm-theme-illume-sixteen-dev went backwards which would break packa=
ge feeds from (0:0.2+gitr0+4e6035ef54-r0.51 to 0:0.2+gitr0+4e6035ef54-r0.50=
) [version-going-backwards]
e-wm-theme-illume-sixteen-0.2+gitrAUTOINC+4e6035ef54: Package version for p=
ackage e-wm-theme-illume-sixteen-doc went backwards which would break packa=
ge feeds from (0:0.2+gitr0+4e6035ef54-r0.51 to 0:0.2+gitr0+4e6035ef54-r0.50=
) [version-going-backwards]
e-wm-theme-illume-sixteen-0.2+gitrAUTOINC+4e6035ef54: Package version for p=
ackage e-wm-theme-illume-sixteen-locale went backwards which would break pa=
ckage feeds from (0:0.2+gitr0+4e6035ef54-r0.51 to 0:0.2+gitr0+4e6035ef54-r0=
=2E50) [version-going-backwards]
e-wm-theme-illume-sixteen-0.2+gitrAUTOINC+4e6035ef54: Package version for p=
ackage e-wm-theme-illume-sixteen-staticdev went backwards which would break=
 package feeds from (0:0.2+gitr0+4e6035ef54-r0.51 to 0:0.2+gitr0+4e6035ef54=
-r0.50) [version-going-backwards]
e-wm-theme-sowka-0.2+gitrAUTOINC+d488ccabe2: Package version for package e-=
wm-theme-sowka went backwards which would break package feeds from (0:0.2+g=
itr0+d488ccabe2-r0.49 to 0:0.2+gitr0+d488ccabe2-r0.48) [version-going-backw=
ards]
e-wm-theme-sowka-0.2+gitrAUTOINC+d488ccabe2: Package version for package e-=
wm-theme-sowka-dbg went backwards which would break package feeds from (0:0=
=2E2+gitr0+d488ccabe2-r0.49 to 0:0.2+gitr0+d488ccabe2-r0.48) [version-going=
-backwards]
e-wm-theme-sowka-0.2+gitrAUTOINC+d488ccabe2: Package version for package e-=
wm-theme-sowka-dev went backwards which would break package feeds from (0:0=
=2E2+gitr0+d488ccabe2-r0.49 to 0:0.2+gitr0+d488ccabe2-r0.48) [version-going=
-backwards]
e-wm-theme-sowka-0.2+gitrAUTOINC+d488ccabe2: Package version for package e-=
wm-theme-sowka-doc went backwards which would break package feeds from (0:0=
=2E2+gitr0+d488ccabe2-r0.49 to 0:0.2+gitr0+d488ccabe2-r0.48) [version-going=
-backwards]
e-wm-theme-sowka-0.2+gitrAUTOINC+d488ccabe2: Package version for package e-=
wm-theme-sowka-locale went backwards which would break package feeds from (=
0:0.2+gitr0+d488ccabe2-r0.49 to 0:0.2+gitr0+d488ccabe2-r0.48) [version-goin=
g-backwards]
e-wm-theme-sowka-0.2+gitrAUTOINC+d488ccabe2: Package version for package e-=
wm-theme-sowka-staticdev went backwards which would break package feeds fro=
m (0:0.2+gitr0+d488ccabe2-r0.49 to 0:0.2+gitr0+d488ccabe2-r0.48) [version-g=
oing-backwards]
elementary-theme-efenniht-0.0+svnr82070: Package version for package elemen=
tary-theme-efenniht went backwards which would break package feeds from (0:=
0.0+svnr82070-r1.51 to 0:0.0+svnr82070-r1.50) [version-going-backwards]
elementary-theme-efenniht-0.0+svnr82070: Package version for package elemen=
tary-theme-efenniht-dbg went backwards which would break package feeds from=
 (0:0.0+svnr82070-r1.51 to 0:0.0+svnr82070-r1.50) [version-going-backwards]
elementary-theme-efenniht-0.0+svnr82070: Package version for package elemen=
tary-theme-efenniht-dev went backwards which would break package feeds from=
 (0:0.0+svnr82070-r1.51 to 0:0.0+svnr82070-r1.50) [version-going-backwards]
elementary-theme-efenniht-0.0+svnr82070: Package version for package elemen=
tary-theme-efenniht-doc went backwards which would break package feeds from=
 (0:0.0+svnr82070-r1.51 to 0:0.0+svnr82070-r1.50) [version-going-backwards]
elementary-theme-efenniht-0.0+svnr82070: Package version for package elemen=
tary-theme-efenniht-locale went backwards which would break package feeds f=
rom (0:0.0+svnr82070-r1.51 to 0:0.0+svnr82070-r1.50) [version-going-backwar=
ds]
elementary-theme-efenniht-0.0+svnr82070: Package version for package elemen=
tary-theme-efenniht-staticdev went backwards which would break package feed=
s from (0:0.0+svnr82070-r1.51 to 0:0.0+svnr82070-r1.50) [version-going-back=
wards]
elementary-theme-gry-0.9+gitrAUTOINC+5ce42d9e1e: Package version for packag=
e elementary-theme-gry went backwards which would break package feeds from =
(0:0.9+gitr0+5ce42d9e1e-r0.51 to 0:0.9+gitr0+5ce42d9e1e-r0.50) [version-goi=
ng-backwards]
elementary-theme-gry-0.9+gitrAUTOINC+5ce42d9e1e: Package version for packag=
e elementary-theme-gry-dbg went backwards which would break package feeds f=
rom (0:0.9+gitr0+5ce42d9e1e-r0.51 to 0:0.9+gitr0+5ce42d9e1e-r0.50) [version=
-going-backwards]
elementary-theme-gry-0.9+gitrAUTOINC+5ce42d9e1e: Package version for packag=
e elementary-theme-gry-dev went backwards which would break package feeds f=
rom (0:0.9+gitr0+5ce42d9e1e-r0.51 to 0:0.9+gitr0+5ce42d9e1e-r0.50) [version=
-going-backwards]
elementary-theme-gry-0.9+gitrAUTOINC+5ce42d9e1e: Package version for packag=
e elementary-theme-gry-doc went backwards which would break package feeds f=
rom (0:0.9+gitr0+5ce42d9e1e-r0.51 to 0:0.9+gitr0+5ce42d9e1e-r0.50) [version=
-going-backwards]
elementary-theme-gry-0.9+gitrAUTOINC+5ce42d9e1e: Package version for packag=
e elementary-theme-gry-locale went backwards which would break package feed=
s from (0:0.9+gitr0+5ce42d9e1e-r0.51 to 0:0.9+gitr0+5ce42d9e1e-r0.50) [vers=
ion-going-backwards]
elementary-theme-gry-0.9+gitrAUTOINC+5ce42d9e1e: Package version for packag=
e elementary-theme-gry-staticdev went backwards which would break package f=
eeds from (0:0.9+gitr0+5ce42d9e1e-r0.51 to 0:0.9+gitr0+5ce42d9e1e-r0.50) [v=
ersion-going-backwards]
elementary-theme-neo-0.6+gitrAUTOINC+4e6035ef54: Package version for packag=
e elementary-theme-neo went backwards which would break package feeds from =
(0:0.6+gitr0+4e6035ef54-r0.50 to 0:0.6+gitr0+4e6035ef54-r0.49) [version-goi=
ng-backwards]
elementary-theme-neo-0.6+gitrAUTOINC+4e6035ef54: Package version for packag=
e elementary-theme-neo-dbg went backwards which would break package feeds f=
rom (0:0.6+gitr0+4e6035ef54-r0.50 to 0:0.6+gitr0+4e6035ef54-r0.49) [version=
-going-backwards]
elementary-theme-neo-0.6+gitrAUTOINC+4e6035ef54: Package version for packag=
e elementary-theme-neo-dev went backwards which would break package feeds f=
rom (0:0.6+gitr0+4e6035ef54-r0.50 to 0:0.6+gitr0+4e6035ef54-r0.49) [version=
-going-backwards]
elementary-theme-neo-0.6+gitrAUTOINC+4e6035ef54: Package version for packag=
e elementary-theme-neo-doc went backwards which would break package feeds f=
rom (0:0.6+gitr0+4e6035ef54-r0.50 to 0:0.6+gitr0+4e6035ef54-r0.49) [version=
-going-backwards]
elementary-theme-neo-0.6+gitrAUTOINC+4e6035ef54: Package version for packag=
e elementary-theme-neo-locale went backwards which would break package feed=
s from (0:0.6+gitr0+4e6035ef54-r0.50 to 0:0.6+gitr0+4e6035ef54-r0.49) [vers=
ion-going-backwards]
elementary-theme-neo-0.6+gitrAUTOINC+4e6035ef54: Package version for packag=
e elementary-theme-neo-staticdev went backwards which would break package f=
eeds from (0:0.6+gitr0+4e6035ef54-r0.50 to 0:0.6+gitr0+4e6035ef54-r0.49) [v=
ersion-going-backwards]
elementary-theme-niebiee-0.2+gitrAUTOINC+4e6035ef54: Package version for pa=
ckage elementary-theme-niebiee went backwards which would break package fee=
ds from (0:0.2+gitr0+4e6035ef54-r0.50 to 0:0.2+gitr0+4e6035ef54-r0.49) [ver=
sion-going-backwards]
elementary-theme-niebiee-0.2+gitrAUTOINC+4e6035ef54: Package version for pa=
ckage elementary-theme-niebiee-dbg went backwards which would break package=
 feeds from (0:0.2+gitr0+4e6035ef54-r0.50 to 0:0.2+gitr0+4e6035ef54-r0.49) =
[version-going-backwards]
elementary-theme-niebiee-0.2+gitrAUTOINC+4e6035ef54: Package version for pa=
ckage elementary-theme-niebiee-dev went backwards which would break package=
 feeds from (0:0.2+gitr0+4e6035ef54-r0.50 to 0:0.2+gitr0+4e6035ef54-r0.49) =
[version-going-backwards]
elementary-theme-niebiee-0.2+gitrAUTOINC+4e6035ef54: Package version for pa=
ckage elementary-theme-niebiee-doc went backwards which would break package=
 feeds from (0:0.2+gitr0+4e6035ef54-r0.50 to 0:0.2+gitr0+4e6035ef54-r0.49) =
[version-going-backwards]
elementary-theme-niebiee-0.2+gitrAUTOINC+4e6035ef54: Package version for pa=
ckage elementary-theme-niebiee-locale went backwards which would break pack=
age feeds from (0:0.2+gitr0+4e6035ef54-r0.50 to 0:0.2+gitr0+4e6035ef54-r0.4=
9) [version-going-backwards]
elementary-theme-niebiee-0.2+gitrAUTOINC+4e6035ef54: Package version for pa=
ckage elementary-theme-niebiee-staticdev went backwards which would break p=
ackage feeds from (0:0.2+gitr0+4e6035ef54-r0.50 to 0:0.2+gitr0+4e6035ef54-r=
0.49) [version-going-backwards]
elementary-theme-o2-0.2+gitrAUTOINC+4e6035ef54: Package version for package=
 elementary-theme-o2 went backwards which would break package feeds from (0=
:0.2+gitr0+4e6035ef54-r0.51 to 0:0.2+gitr0+4e6035ef54-r0.50) [version-going=
-backwards]
elementary-theme-o2-0.2+gitrAUTOINC+4e6035ef54: Package version for package=
 elementary-theme-o2-dbg went backwards which would break package feeds fro=
m (0:0.2+gitr0+4e6035ef54-r0.51 to 0:0.2+gitr0+4e6035ef54-r0.50) [version-g=
oing-backwards]
elementary-theme-o2-0.2+gitrAUTOINC+4e6035ef54: Package version for package=
 elementary-theme-o2-dev went backwards which would break package feeds fro=
m (0:0.2+gitr0+4e6035ef54-r0.51 to 0:0.2+gitr0+4e6035ef54-r0.50) [version-g=
oing-backwards]
elementary-theme-o2-0.2+gitrAUTOINC+4e6035ef54: Package version for package=
 elementary-theme-o2-doc went backwards which would break package feeds fro=
m (0:0.2+gitr0+4e6035ef54-r0.51 to 0:0.2+gitr0+4e6035ef54-r0.50) [version-g=
oing-backwards]
elementary-theme-o2-0.2+gitrAUTOINC+4e6035ef54: Package version for package=
 elementary-theme-o2-locale went backwards which would break package feeds =
=66rom (0:0.2+gitr0+4e6035ef54-r0.51 to 0:0.2+gitr0+4e6035ef54-r0.50) [vers=
ion-going-backwards]
elementary-theme-o2-0.2+gitrAUTOINC+4e6035ef54: Package version for package=
 elementary-theme-o2-staticdev went backwards which would break package fee=
ds from (0:0.2+gitr0+4e6035ef54-r0.51 to 0:0.2+gitr0+4e6035ef54-r0.50) [ver=
sion-going-backwards]
elementary-theme-sixteen-0.2+gitrAUTOINC+4e6035ef54: Package version for pa=
ckage elementary-theme-sixteen went backwards which would break package fee=
ds from (0:0.2+gitr0+4e6035ef54-r0.50 to 0:0.2+gitr0+4e6035ef54-r0.49) [ver=
sion-going-backwards]
elementary-theme-sixteen-0.2+gitrAUTOINC+4e6035ef54: Package version for pa=
ckage elementary-theme-sixteen-dbg went backwards which would break package=
 feeds from (0:0.2+gitr0+4e6035ef54-r0.50 to 0:0.2+gitr0+4e6035ef54-r0.49) =
[version-going-backwards]
elementary-theme-sixteen-0.2+gitrAUTOINC+4e6035ef54: Package version for pa=
ckage elementary-theme-sixteen-dev went backwards which would break package=
 feeds from (0:0.2+gitr0+4e6035ef54-r0.50 to 0:0.2+gitr0+4e6035ef54-r0.49) =
[version-going-backwards]
elementary-theme-sixteen-0.2+gitrAUTOINC+4e6035ef54: Package version for pa=
ckage elementary-theme-sixteen-doc went backwards which would break package=
 feeds from (0:0.2+gitr0+4e6035ef54-r0.50 to 0:0.2+gitr0+4e6035ef54-r0.49) =
[version-going-backwards]
elementary-theme-sixteen-0.2+gitrAUTOINC+4e6035ef54: Package version for pa=
ckage elementary-theme-sixteen-locale went backwards which would break pack=
age feeds from (0:0.2+gitr0+4e6035ef54-r0.50 to 0:0.2+gitr0+4e6035ef54-r0.4=
9) [version-going-backwards]
elementary-theme-sixteen-0.2+gitrAUTOINC+4e6035ef54: Package version for pa=
ckage elementary-theme-sixteen-staticdev went backwards which would break p=
ackage feeds from (0:0.2+gitr0+4e6035ef54-r0.50 to 0:0.2+gitr0+4e6035ef54-r=
0.49) [version-going-backwards]
elementary-theme-sowka-0.2+gitrAUTOINC+4e6035ef54: Package version for pack=
age elementary-theme-sowka went backwards which would break package feeds f=
rom (0:0.2+gitr0+4e6035ef54-r0.49 to 0:0.2+gitr0+4e6035ef54-r0.48) [version=
-going-backwards]
elementary-theme-sowka-0.2+gitrAUTOINC+4e6035ef54: Package version for pack=
age elementary-theme-sowka-dbg went backwards which would break package fee=
ds from (0:0.2+gitr0+4e6035ef54-r0.49 to 0:0.2+gitr0+4e6035ef54-r0.48) [ver=
sion-going-backwards]
elementary-theme-sowka-0.2+gitrAUTOINC+4e6035ef54: Package version for pack=
age elementary-theme-sowka-dev went backwards which would break package fee=
ds from (0:0.2+gitr0+4e6035ef54-r0.49 to 0:0.2+gitr0+4e6035ef54-r0.48) [ver=
sion-going-backwards]
elementary-theme-sowka-0.2+gitrAUTOINC+4e6035ef54: Package version for pack=
age elementary-theme-sowka-doc went backwards which would break package fee=
ds from (0:0.2+gitr0+4e6035ef54-r0.49 to 0:0.2+gitr0+4e6035ef54-r0.48) [ver=
sion-going-backwards]
elementary-theme-sowka-0.2+gitrAUTOINC+4e6035ef54: Package version for pack=
age elementary-theme-sowka-locale went backwards which would break package =
feeds from (0:0.2+gitr0+4e6035ef54-r0.49 to 0:0.2+gitr0+4e6035ef54-r0.48) [=
version-going-backwards]
elementary-theme-sowka-0.2+gitrAUTOINC+4e6035ef54: Package version for pack=
age elementary-theme-sowka-staticdev went backwards which would break packa=
ge feeds from (0:0.2+gitr0+4e6035ef54-r0.49 to 0:0.2+gitr0+4e6035ef54-r0.48=
) [version-going-backwards]
exquisite-theme-illume-1.0+svnr82070: Package version for package exquisite=
-theme-illume went backwards which would break package feeds from (0:1.0+sv=
nr82070-r0.50 to 0:1.0+svnr82070-r0.49) [version-going-backwards]
exquisite-theme-illume-1.0+svnr82070: Package version for package exquisite=
-theme-illume-dbg went backwards which would break package feeds from (0:1.=
0+svnr82070-r0.50 to 0:1.0+svnr82070-r0.49) [version-going-backwards]
exquisite-theme-illume-1.0+svnr82070: Package version for package exquisite=
-theme-illume-dev went backwards which would break package feeds from (0:1.=
0+svnr82070-r0.50 to 0:1.0+svnr82070-r0.49) [version-going-backwards]
exquisite-theme-illume-1.0+svnr82070: Package version for package exquisite=
-theme-illume-doc went backwards which would break package feeds from (0:1.=
0+svnr82070-r0.50 to 0:1.0+svnr82070-r0.49) [version-going-backwards]
exquisite-theme-illume-1.0+svnr82070: Package version for package exquisite=
-theme-illume-locale went backwards which would break package feeds from (0=
:1.0+svnr82070-r0.50 to 0:1.0+svnr82070-r0.49) [version-going-backwards]
exquisite-theme-illume-1.0+svnr82070: Package version for package exquisite=
-theme-illume-staticdev went backwards which would break package feeds from=
 (0:1.0+svnr82070-r0.50 to 0:1.0+svnr82070-r0.49) [version-going-backwards]
libauthen-sasl-perl-2.16: Package version for package libauthen-sasl-perl w=
ent backwards which would break package feeds from (0:2.16-r0.119 to 0:2.16=
-r0.118) [version-going-backwards]
libauthen-sasl-perl-2.16: Package version for package libauthen-sasl-perl-d=
bg went backwards which would break package feeds from (0:2.16-r0.119 to 0:=
2.16-r0.118) [version-going-backwards]
libauthen-sasl-perl-2.16: Package version for package libauthen-sasl-perl-d=
ev went backwards which would break package feeds from (0:2.16-r0.119 to 0:=
2.16-r0.118) [version-going-backwards]
libauthen-sasl-perl-2.16: Package version for package libauthen-sasl-perl-d=
oc went backwards which would break package feeds from (0:2.16-r0.119 to 0:=
2.16-r0.118) [version-going-backwards]
libauthen-sasl-perl-2.16: Package version for package libauthen-sasl-perl-l=
ocale went backwards which would break package feeds from (0:2.16-r0.119 to=
 0:2.16-r0.118) [version-going-backwards]
libauthen-sasl-perl-2.16: Package version for package libauthen-sasl-perl-s=
taticdev went backwards which would break package feeds from (0:2.16-r0.119=
 to 0:2.16-r0.118) [version-going-backwards]
libdigest-hmac-perl-1.03: Package version for package libdigest-hmac-perl w=
ent backwards which would break package feeds from (0:1.03-r0.122 to 0:1.03=
-r0.121) [version-going-backwards]
libdigest-hmac-perl-1.03: Package version for package libdigest-hmac-perl-d=
bg went backwards which would break package feeds from (0:1.03-r0.122 to 0:=
1.03-r0.121) [version-going-backwards]
libdigest-hmac-perl-1.03: Package version for package libdigest-hmac-perl-d=
ev went backwards which would break package feeds from (0:1.03-r0.122 to 0:=
1.03-r0.121) [version-going-backwards]
libdigest-hmac-perl-1.03: Package version for package libdigest-hmac-perl-d=
oc went backwards which would break package feeds from (0:1.03-r0.122 to 0:=
1.03-r0.121) [version-going-backwards]
libdigest-hmac-perl-1.03: Package version for package libdigest-hmac-perl-l=
ocale went backwards which would break package feeds from (0:1.03-r0.122 to=
 0:1.03-r0.121) [version-going-backwards]
libdigest-hmac-perl-1.03: Package version for package libdigest-hmac-perl-s=
taticdev went backwards which would break package feeds from (0:1.03-r0.122=
 to 0:1.03-r0.121) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-p=
erl went backwards which would break package feeds from (0:1.997-r0.117 to =
0:1.997-r0.116) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-p=
erl-dbg went backwards which would break package feeds from (0:1.997-r0.117=
 to 0:1.997-r0.116) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-p=
erl-dev went backwards which would break package feeds from (0:1.997-r0.117=
 to 0:1.997-r0.116) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-p=
erl-doc went backwards which would break package feeds from (0:1.997-r0.117=
 to 0:1.997-r0.116) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-p=
erl-locale went backwards which would break package feeds from (0:1.997-r0.=
117 to 0:1.997-r0.116) [version-going-backwards]
libio-socket-ssl-perl-1.997: Package version for package libio-socket-ssl-p=
erl-staticdev went backwards which would break package feeds from (0:1.997-=
r0.117 to 0:1.997-r0.116) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for=
 package luna-sysmgr-ipc-messages went backwards which would break package =
feeds from (0:2.0.0-1+git0+79155bd3f1-r0.155 to 0:2.0.0-1+git0+79155bd3f1-r=
0.154) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for=
 package luna-sysmgr-ipc-messages-dbg went backwards which would break pack=
age feeds from (0:2.0.0-1+git0+79155bd3f1-r0.155 to 0:2.0.0-1+git0+79155bd3=
f1-r0.154) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for=
 package luna-sysmgr-ipc-messages-dev went backwards which would break pack=
age feeds from (0:2.0.0-1+git0+79155bd3f1-r0.155 to 0:2.0.0-1+git0+79155bd3=
f1-r0.154) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for=
 package luna-sysmgr-ipc-messages-doc went backwards which would break pack=
age feeds from (0:2.0.0-1+git0+79155bd3f1-r0.155 to 0:2.0.0-1+git0+79155bd3=
f1-r0.154) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for=
 package luna-sysmgr-ipc-messages-locale went backwards which would break p=
ackage feeds from (0:2.0.0-1+git0+79155bd3f1-r0.155 to 0:2.0.0-1+git0+79155=
bd3f1-r0.154) [version-going-backwards]
luna-sysmgr-ipc-messages-2.0.0-1+gitAUTOINC+79155bd3f1: Package version for=
 package luna-sysmgr-ipc-messages-staticdev went backwards which would brea=
k package feeds from (0:2.0.0-1+git0+79155bd3f1-r0.155 to 0:2.0.0-1+git0+79=
155bd3f1-r0.154) [version-going-backwards]
phoneui-shr-theme-neo-0.1+gitrAUTOINC+4e6035ef54: Package version for packa=
ge phoneui-shr-theme-neo went backwards which would break package feeds fro=
m (0:0.1+gitr0+4e6035ef54-r3.50 to 0:0.1+gitr0+4e6035ef54-r3.49) [version-g=
oing-backwards]
phoneui-shr-theme-neo-0.1+gitrAUTOINC+4e6035ef54: Package version for packa=
ge phoneui-shr-theme-neo-dbg went backwards which would break package feeds=
 from (0:0.1+gitr0+4e6035ef54-r3.50 to 0:0.1+gitr0+4e6035ef54-r3.49) [versi=
on-going-backwards]
phoneui-shr-theme-neo-0.1+gitrAUTOINC+4e6035ef54: Package version for packa=
ge phoneui-shr-theme-neo-dev went backwards which would break package feeds=
 from (0:0.1+gitr0+4e6035ef54-r3.50 to 0:0.1+gitr0+4e6035ef54-r3.49) [versi=
on-going-backwards]
phoneui-shr-theme-neo-0.1+gitrAUTOINC+4e6035ef54: Package version for packa=
ge phoneui-shr-theme-neo-doc went backwards which would break package feeds=
 from (0:0.1+gitr0+4e6035ef54-r3.50 to 0:0.1+gitr0+4e6035ef54-r3.49) [versi=
on-going-backwards]
phoneui-shr-theme-neo-0.1+gitrAUTOINC+4e6035ef54: Package version for packa=
ge phoneui-shr-theme-neo-locale went backwards which would break package fe=
eds from (0:0.1+gitr0+4e6035ef54-r3.50 to 0:0.1+gitr0+4e6035ef54-r3.49) [ve=
rsion-going-backwards]
phoneui-shr-theme-neo-0.1+gitrAUTOINC+4e6035ef54: Package version for packa=
ge phoneui-shr-theme-neo-staticdev went backwards which would break package=
 feeds from (0:0.1+gitr0+4e6035ef54-r3.50 to 0:0.1+gitr0+4e6035ef54-r3.49) =
[version-going-backwards]
phoneui-shr-theme-niebiee-0.1+gitrAUTOINC+4e6035ef54: Package version for p=
ackage phoneui-shr-theme-niebiee went backwards which would break package f=
eeds from (0:0.1+gitr0+4e6035ef54-r2.50 to 0:0.1+gitr0+4e6035ef54-r2.49) [v=
ersion-going-backwards]
phoneui-shr-theme-niebiee-0.1+gitrAUTOINC+4e6035ef54: Package version for p=
ackage phoneui-shr-theme-niebiee-dbg went backwards which would break packa=
ge feeds from (0:0.1+gitr0+4e6035ef54-r2.50 to 0:0.1+gitr0+4e6035ef54-r2.49=
) [version-going-backwards]
phoneui-shr-theme-niebiee-0.1+gitrAUTOINC+4e6035ef54: Package version for p=
ackage phoneui-shr-theme-niebiee-dev went backwards which would break packa=
ge feeds from (0:0.1+gitr0+4e6035ef54-r2.50 to 0:0.1+gitr0+4e6035ef54-r2.49=
) [version-going-backwards]
phoneui-shr-theme-niebiee-0.1+gitrAUTOINC+4e6035ef54: Package version for p=
ackage phoneui-shr-theme-niebiee-doc went backwards which would break packa=
ge feeds from (0:0.1+gitr0+4e6035ef54-r2.50 to 0:0.1+gitr0+4e6035ef54-r2.49=
) [version-going-backwards]
phoneui-shr-theme-niebiee-0.1+gitrAUTOINC+4e6035ef54: Package version for p=
ackage phoneui-shr-theme-niebiee-locale went backwards which would break pa=
ckage feeds from (0:0.1+gitr0+4e6035ef54-r2.50 to 0:0.1+gitr0+4e6035ef54-r2=
=2E49) [version-going-backwards]
phoneui-shr-theme-niebiee-0.1+gitrAUTOINC+4e6035ef54: Package version for p=
ackage phoneui-shr-theme-niebiee-staticdev went backwards which would break=
 package feeds from (0:0.1+gitr0+4e6035ef54-r2.50 to 0:0.1+gitr0+4e6035ef54=
-r2.49) [version-going-backwards]
phoneui-shr-theme-o2-0.1+gitrAUTOINC+4e6035ef54: Package version for packag=
e phoneui-shr-theme-o2 went backwards which would break package feeds from =
(0:0.1+gitr0+4e6035ef54-r3.50 to 0:0.1+gitr0+4e6035ef54-r3.49) [version-goi=
ng-backwards]
phoneui-shr-theme-o2-0.1+gitrAUTOINC+4e6035ef54: Package version for packag=
e phoneui-shr-theme-o2-dbg went backwards which would break package feeds f=
rom (0:0.1+gitr0+4e6035ef54-r3.50 to 0:0.1+gitr0+4e6035ef54-r3.49) [version=
-going-backwards]
phoneui-shr-theme-o2-0.1+gitrAUTOINC+4e6035ef54: Package version for packag=
e phoneui-shr-theme-o2-dev went backwards which would break package feeds f=
rom (0:0.1+gitr0+4e6035ef54-r3.50 to 0:0.1+gitr0+4e6035ef54-r3.49) [version=
-going-backwards]
phoneui-shr-theme-o2-0.1+gitrAUTOINC+4e6035ef54: Package version for packag=
e phoneui-shr-theme-o2-doc went backwards which would break package feeds f=
rom (0:0.1+gitr0+4e6035ef54-r3.50 to 0:0.1+gitr0+4e6035ef54-r3.49) [version=
-going-backwards]
phoneui-shr-theme-o2-0.1+gitrAUTOINC+4e6035ef54: Package version for packag=
e phoneui-shr-theme-o2-locale went backwards which would break package feed=
s from (0:0.1+gitr0+4e6035ef54-r3.50 to 0:0.1+gitr0+4e6035ef54-r3.49) [vers=
ion-going-backwards]
phoneui-shr-theme-o2-0.1+gitrAUTOINC+4e6035ef54: Package version for packag=
e phoneui-shr-theme-o2-staticdev went backwards which would break package f=
eeds from (0:0.1+gitr0+4e6035ef54-r3.50 to 0:0.1+gitr0+4e6035ef54-r3.49) [v=
ersion-going-backwards]
phoneui-shr-theme-sowka-0.1+gitrAUTOINC+4e6035ef54: Package version for pac=
kage phoneui-shr-theme-sowka went backwards which would break package feeds=
 from (0:0.1+gitr0+4e6035ef54-r2.49 to 0:0.1+gitr0+4e6035ef54-r2.48) [versi=
on-going-backwards]
phoneui-shr-theme-sowka-0.1+gitrAUTOINC+4e6035ef54: Package version for pac=
kage phoneui-shr-theme-sowka-dbg went backwards which would break package f=
eeds from (0:0.1+gitr0+4e6035ef54-r2.49 to 0:0.1+gitr0+4e6035ef54-r2.48) [v=
ersion-going-backwards]
phoneui-shr-theme-sowka-0.1+gitrAUTOINC+4e6035ef54: Package version for pac=
kage phoneui-shr-theme-sowka-dev went backwards which would break package f=
eeds from (0:0.1+gitr0+4e6035ef54-r2.49 to 0:0.1+gitr0+4e6035ef54-r2.48) [v=
ersion-going-backwards]
phoneui-shr-theme-sowka-0.1+gitrAUTOINC+4e6035ef54: Package version for pac=
kage phoneui-shr-theme-sowka-doc went backwards which would break package f=
eeds from (0:0.1+gitr0+4e6035ef54-r2.49 to 0:0.1+gitr0+4e6035ef54-r2.48) [v=
ersion-going-backwards]
phoneui-shr-theme-sowka-0.1+gitrAUTOINC+4e6035ef54: Package version for pac=
kage phoneui-shr-theme-sowka-locale went backwards which would break packag=
e feeds from (0:0.1+gitr0+4e6035ef54-r2.49 to 0:0.1+gitr0+4e6035ef54-r2.48)=
 [version-going-backwards]
phoneui-shr-theme-sowka-0.1+gitrAUTOINC+4e6035ef54: Package version for pac=
kage phoneui-shr-theme-sowka-staticdev went backwards which would break pac=
kage feeds from (0:0.1+gitr0+4e6035ef54-r2.49 to 0:0.1+gitr0+4e6035ef54-r2.=
48) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common went backwa=
rds which would break package feeds from (0:1.34-r8.147 to 0:1.34-r8.146) [=
version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-dbg went ba=
ckwards which would break package feeds from (0:1.34-r8.147 to 0:1.34-r8.14=
6) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-dev went ba=
ckwards which would break package feeds from (0:1.34-r8.147 to 0:1.34-r8.14=
6) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-doc went ba=
ckwards which would break package feeds from (0:1.34-r8.147 to 0:1.34-r8.14=
6) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-locale went=
 backwards which would break package feeds from (0:1.34-r8.147 to 0:1.34-r8=
=2E146) [version-going-backwards]
xserver-common-1.34: Package version for package xserver-common-staticdev w=
ent backwards which would break package feeds from (0:1.34-r8.147 to 0:1.34=
-r8.146) [version-going-backwards]


count: 34	issue: host-user-contaminated
apache2-2.4.16: apache2: /apache2-dev/usr/share/apache2/icons/small/uu.png =
is owned by uid 3004, which is the same as the user running bitbake. This m=
ay be due to host contamination [host-user-contaminated]
apache2-2.4.16: apache2: /apache2-scripts/usr/bin/dbmmanage is owned by uid=
 3004, which is the same as the user running bitbake. This may be due to ho=
st contamination [host-user-contaminated]
apache2-2.4.16: apache2: /apache2/usr/share/apache2/cgi-bin/printenv is own=
ed by uid 3004, which is the sal-2.40.0: cim-schema-final: /cim-schema-fina=
l/usr/share/mof/cimv2.40.0/Application/CIM_AGPSoftwareFeature.mof is owned =
by uid 3004, which is the same as the user running bitbake. This may be due=
 to host contamination [host-user-contaminated]
cinematicexperience-1.0: cinematicexperience: /cinematicexperience/usr/shar=
e/cinematicexperience-1.0/content/images/qt_logo.png is owned by uid 3004, =
which is the same as the user running bitbake. This may be due to host cont=
amination [host-user-contaminated]
debootstrap-1.0.67: debootstrap: /debootstrap/usr/share/debootstrap/scripts=
/breezy is owned by uid 3004, which is the same as the user running bitbake=
=2E This may be due to host contamination [host-user-contaminated]
dracut-043+giteab03540cd695d940062af5b55c02e8829aaa526: dracut: /dracut/usr=
/lib/dracut/modules.d/99uefi-lib/uefi-lib.sh is owned by uid 3004, which is=
 the same as the user running bitbake. This may be due to host contaminatio=
n [host-user-contaminated]
espeak-1.37: espeak: /espeak/usr/share/espeak-data/mbrola_ph/es4_phtrans is=
 owned by uid 3004, which is the same as the user running bitbake. This may=
 be due to host contamination [host-user-contaminated]
firefox-10.0.12esr: firefox: /firefox-dev/usr/share/idl/firefox-10.0/nsIBro=
wserHandler.idl is owned by uid 3004, which is the same as the user running=
 bitbake. This may be due to host contamination [host-user-contaminated]
firefox-10.0.12esr: firefox: /firefox-staticdev/usr/lib/firefox-devel-10.0/=
sdk/lib/libnssutil.a is owned by uid 3004, which is the same as the user ru=
nning bitbake. This may be due to host contamination [host-user-contaminate=
d]
glibc-locale-2.22: glibc-locale: /glibc-binary-localedata-ar-tn/usr/lib/loc=
ale/ar_TN/LC_MEASUREMENT is owned by uid 3004, which is the same as the use=
r running bitbake. This may be due to host contamination [host-user-contami=
nated]
glibc-locale-2.22: glibc-locale: /glibc-binary-localedata-de-lu/usr/lib/loc=
ale/de_LU/LC_MEASUREMENT is owned by uid 3004, which is the same as the use=
r running bitbake. This may be due to host contamination [host-user-contami=
nated]
libvpx-1.4.0: libvpx: /libvpx-dev/usr/lib/pkgconfig/vpx.pc is owned by uid =
3004, which is the same as the user running bitbake. This may be due to hos=
t contamination [host-user-contaminated]
libvpx-1.4.0: libvpx: /libvpx/usr/bin/vpxdec is owned by uid 3004, which is=
 the same as the user running bitbake. This may be due to host contaminatio=
n [host-user-contaminated]
libvpx-1.4.0: libvpx: /libvpx/usr/bin/vpxenc is owned by uid 3004, which is=
 the same as the user running bitbake. This may be due to host contaminatio=
n [host-user-contaminated]
logwatch-7.4.1: logwatch: /logwatch/usr/share/logwatch/default.conf/logfile=
s/mysql-mmm.conf is owned by uid 3004, which is the same as the user runnin=
g bitbake. This may be due to host contamination [host-user-contaminated]
monav-0.3: monav: /monav/usr/share/monav/images/directions/left.svg is owne=
d by uid 3004, which is the same as the user running bitbake. This may be d=
ue to host contamination [host-user-contaminated]
numptyphysics-0.2+svnr109: numptyphysics: /numptyphysics/usr/share/numptyph=
ysics/org_level/L50_nautilus.nph is owned by uid 3004, which is the same as=
 the user running bitbake. This may be due to host contamination [host-user=
-contaminated]
orrery-2.7: orrery: /orrery/usr/share/orrery/constellations/Andromeda is ow=
ned by uid 3004, which is the same as the user running bitbake. This may be=
 due to host contamination [host-user-contaminated]
qt5everywheredemo-1.0: qt5everywheredemo: /qt5everywheredemo/usr/share/qt5e=
verywhere4, which is the same as the user running bitbake. This may be due =
to host contamination [host-user-contaminated]
qtbase-5.5.1+gitAUTOINC+5afc431323: qtbase: /qtbase-dev/usr/lib/libqtpcre.p=
rl is owned by uid 3004, which is the same as the user running bitbake. Thi=
s may be due to host contamination [host-user-contaminated]
qtbase-5.5.1+gitAUTOINC+5afc431323: qtbase: /qtbase-staticdev/usr/lib/libqt=
pcre.a is owned by uid 3004, which is the same as the user running bitbake.=
 This may be due to host contamination [host-user-contaminated]
qtsmarthome-1.0: qtsmarthome: /qtsmarthome/usr/share/qtsmarthome-1.0/qml/sm=
arthome/components/tabwidget/VTabBar.qml is owned by uid 3004, which is the=
 same as the user running bitbake. This may be due to host contamination [h=
ost-user-contaminated]
quitbattery-1.0.0: quitbattery: /quitbattery/usr/share/quitbattery-1.0.0/qm=
l/QUItBattery/images/glass.png is owned by uid 3004, which is the same as t=
he user running bitbake. This may be due to host contamination [host-user-c=
ontaminated]
quitindicators-1.0.1: quitindicators: /quitindicators/usr/share/quitindicat=
ors-1.0.1/qml/QUItIndicators/images/dots_512.png is owned by uid 3004, whic=
h is the same as the user running bitbake. This may be due to host contamin=
ation [host-user-contaminated]
qwt-6.0.1: qwt: /qwt-examples/usr/bin/friedberg is owned by uid 3004, which=
 is the same as the user running bitbake. This may be due to host contamina=
tion [host-user-contaminated]
qwt-6.0.1: qwt: /qwt-examples/usr/bin/tvplot is owned by uid 3004, which is=
 the same as the user running bitbake. This may be due to host contaminatio=
n [host-user-contaminated]
thone-0.7: thone: /thone/usr/bin/thone-toggle is owned by uid 3004, which i=
s the same as the user running bitbake. This may be due to host contaminati=
on [host-user-contaminated]
tipcutils-2.0.6: tipcutils: /tipcutils/etc/init.d/tipcutils is owned by uid=
 3004, which is the same as the user running bitbake. This may be due to ho=
st contamination [host-user-contaminated]


count: 1	issue: installed-vs-shipped
rrdtool: 5 installed and not shipped files. [installed-vs-shipped]


count: 1	issue: unknown-configure-option
polkit-gnome-0.105: polkit-gnome: configure was passed unrecognised options=
: --disable-examples --disable-introspection [unknown-configure-option]


count: 1	issue: symlink-to-sysroot
netkit-ftp-0.17: Symlink /usr/bin/pftp in netkit-ftp points to TMPDIR [syml=
ink-to-sysroot]


count: 3	issue: invalid-pkgconfig
gpsd-3.14: gpsd: invalid PACKAGECONFIG: bluez5 [invalid-pkgconfig]
qt-mobility-embedded-1.2.0: qt-mobility-embedded: invalid PACKAGECONFIG: bl=
uez5 [invalid-pkgconfig]
qt-mobility-x11-1.2.0: qt-mobility-x11: invalid PACKAGECONFIG: bluez5 [inva=
lid-pkgconfig]


count: 0	issue: pkgname

--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYrdJEACgkQN1Ujt2V2gByM/wCgorDpmh+x96ipusQTLf5TKLh9
amkAniw+NPzYfczX6jmEEUnwn1EKEJAv
=Mood
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--
