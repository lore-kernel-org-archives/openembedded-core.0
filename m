Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 96B4060616;
	Fri, 18 Dec 2015 11:22:59 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id l126so59877119wml.0;
	Fri, 18 Dec 2015 03:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=jhb/Ixx7dFbLGlzsWkJ6m5vVVY4KUG6lfCi68nhzcvI=;
	b=utskGIxTfhNGSK47sWAxUJQKv01CDoi1Yv+5o+FVUlp8Kgk7140d3iUlRh+JSmjFt5
	l2yjUy+9aEk62jXPSpYbVeWE+F7nWtPJPlhbO+9vOySuobeGuxrhZBL6HNQDVzpsR4+8
	naN3vxp5fImEdjrhJBuK2xLVbLUrHAPUpXKJY25yiWGO7r6x+3RPH+HCDdvBvJSjGHfA
	ADdYa4Ar2nLdnHTO5uoihb75ZKFRQIee8FEHVp4ZFiEkCPtSWBp4ideVegNje5KwZuWh
	YqyniGxg2pWVfjFJg5USQKI7ZckA1wMDzLykmKd4OkiuHBymBhV/DUOIYyq7Bz6HY+qa
	FRCg==
X-Received: by 10.28.218.75 with SMTP id r72mr2401299wmg.59.1450437779512;
	Fri, 18 Dec 2015 03:22:59 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	i84sm6277253wmc.20.2015.12.18.03.22.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Dec 2015 03:22:58 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 18 Dec 2015 12:25:30 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20151218112530.GA2563@jama>
References: <20151113165249.GF2567@jama>
MIME-Version: 1.0
In-Reply-To: <20151113165249.GF2567@jama>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: State of bitbake world, Failed tasks 2015-12-17
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
X-List-Received-Date: Fri, 18 Dec 2015 11:23:02 -0000
X-Groupsio-MsgNum: 74992
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sm4nu43k4a2Rpi4c"
Content-Disposition: inline

--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The QA list should be complete for qemuarm and qemux86-64.

=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
85fef27 world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
7861f61 clutter-gst-3.0: add dependency on libgudev
05ceb29 scripts/create-pull-request: fix git request-pull syntax
91bae8c sstate-sysroot-cruft: Add php, python, lua, fontcache generated fil=
es to whitelist
2f8b8e0 qemux86: Add identical qemux86copy variant for tests
2cc1507 report-error: Allow to upload reports automatically
dea2dfc tune-*: use mcpu instead of mtune for ARM tunes
4b9ae85 arch-armv7ve: add tune include for armv7ve and use it from cortexa7=
 and cortexa15
9cbaa73 cortexa{7,15,17}: add VFPv4 tunes
451a0bb feature-arm-vfp.inc: Further simplify with TUNE_CCARGS_MFLOAT
84dd110 feature-arm-{neon,vfp}.inc: refactor and fix issues
2057c33 arch-armv7a.inc: add vfpv4 support also to softfp and big endiand t=
unes
21881f4 arch-armv7a.inc: Fix PACKAGE_EXTRA_ARCHS for tune-armv7atb-vfpv3, t=
une-armv7atb-vfpv3d16, cortexa7thf-neon-vfpv4
8dc79ba arch-armv5.inc: drop duplicate ARMPKGSFX_DSP and PACKAGE_EXTRA_ARCH=
S_tune-armv5tehf-vfp
41faebd arch-armv[456]*.inc: improve indentation like armv7a
4b09860 arm/arch-arm*, tune-cortexa*, tune-thunderx.inc, powerpac/arch-powe=
rpc64.inc: Use normal assignment
8cca66b arch-armv7a, tune-cortexa*: improve indentation
3e533ab arch-armv7a, tune-cortexa*: improve comment VFP -> HF
fb2b6c6 arch-armv7a: add missing space before ?=3D
ea467e7 tune-cortexr4.inc: fix PACKAGE_EXTRA_ARCHS
f7dffa9 sanity.bbclass: add more information to error message about TUNE_PK=
GARCH missing in PACKAGE_ARCHS

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
ad9ebc0 Revert "libjpeg-turbo: remove recipe"
a5a6cdb mpd: add dependency on libupnp
3fc1875 lcdproc5: add dependency on lirc
2c88dd6 gnome-panel: add dependency on dbus
e850bd8 ctdb: add dependency on libldb
8da5aa3 php: Upgrade 5.5.26 -> 5.5.30
219760a php: Upgrade 5.6.12 -> 5.6.16
648846a libnet-dns-perl: remove it from PNBLACKLIST
33684be phoronix-test-suite: uprev it to 6.0.1
457c3f8 python-cffi: Update to version 1.3.1
d94e51b python-daemonize: Update to version 2.4.1
b963cdc waf-samba.bbclass: add cross-answers option and files
c3a0ccc samba: fix typo distinguishing between plain sysv init and lsb init
4b472a9 waf-samba: enable parallel builds
454e6a3 gpsd: also support bluez5
c9b14b4 lowpan-tools: add missing flex/bison deps
09f6d60 canutils: rdep on iproute2
80b5788 openldap: upgrade to 2.4.43
c8871ef poppler-data: install CMap resources for CJK glyph support
9389473 poppler: move RDEPENDS on poppler-data to libpoppler
b4aa611 libsoc: update to 0.7.1
8647ce6 sessreg: add a patch to avoid build errors.
def02c7 python-monotonic: new recipe, version 0.4
2383fff libgudev: Remove (moved to OE-Core)
9016b59 hostapd: upgrade 2.4 -> 2.5
85988e2 mcelog: remove bashism and create ptest subpackage
2b43a14 mce-inject: add recipe
4ae29f0 mpg123: update 1.21.0 -> 1.22.4
41e5245 mpg123: drop unnecessary dependency on tslib
2537786 mpg123: limit ARM_INSTRUCTION_SET =3D "arm" over-ride to armv4/armv5
1381837 mpg123: recipe formatting cleanup, no functional changes
3eebfb9 x11vnc: use external libvncserver
c2ac26a x11vnc: move recipe from oe-core
f5c5485 meta-oe: recipes-graphics: add libvncserver recipe
a2d675f meta-networking: depends on layer meta-perl
e60913d mime-construct: update runtime dependencies
1bab83a libproc-waitstat-perl: add recipe
176934b libipc-signal-perl: add recipe
09d1ad9 pmtools: support huge ACPI table
7b1abd9 xl2tpd: fix warnings with gcc 5
cf97c9f python-jinja2: Disable `make clean`
89a2348 gitpkgv.bbclass: Add support for gitsm:// url type
74b4882 postfix: fix clean broken issue
99fffc6 postfix.inc: fix start postfix failed while hostname is numeric
d53693c edac-utils: add patches for initscript
7c8ed0b fltk: upgrade from version 1.1.10 to 1.3.3
f67ab86 libssh2: make crypto library selectable
c994a63 nodejs: cleanup and update
e6a408d python-bitarray: Add new recipe.
154ddcf python-txws: Add new recipe.
c3882d9 python-vcversioner: Add new recipe.
c5d8217 net-snmp: apply patch for cross-compilation
a94ff5b smem: Add appropriate python modules to rdeps
88c06f3 ncftp: fix build failures with ccdv
bc2559e libjpeg-turbo: remove recipe
97ed205 htop: delete not used patch
be71111 faenza-icon-theme: fix host-user-contamination
b07e3f7 iscsitarget: skip the arch test for kernel modules
438a094 iscsitarget: split the kernel module into separate package
93600f8 mariadb.inc: fix mysqld hung at first init time based on systemd
6641278 python-chardet: add recipe for version 2.3.0
68c315a hplip: specify cupsbackenddir and cupsfilterdir
4e064dd tmux: add PACKAGECONFIG for utempter
d7c2366 pam-passwdqc: fix the hardcoded libdir
89c3241 python-cryptography, python-cryptography-vectors: uprev
825c1b9 xfsprogs: fix the license
e1e75f2 quagga: fix segment fault when stopping ospf6d
5a6caf5 apache2: fix host-user-contaminated warnings
45c525f netkit-ftp: fixed invalid symlink
8492521 ctdb: add PACKAGECONFIG for libtdb
f66b7f3 cim-schema-exper: fix host-user-contaminated
8efe192 dracut: fix host-user-contaminated
3366e37 nbd: use BPN in Files
09d583f VLC: do not use --with-contrib
ceb339b VLC: make libdvdread PACKAGECONFIG
5dcd4ea VLC: explicit PACKAGECONFIG for freetype
0d07d0e VLC: explicit PACKAGECONFIG for fontconfig
f05a3d3 VLC: make libnotify a configurable dependency
ab60b3b vlc: remove libdc1394 libraw1394 from DEPENDS
ba4ae2b lmsensors-config: fix the packaging for sensord
8967954 tipcutils: fix host-user-comtaminated QA issue
8686d03 libvpx: fix host-user-comtaminated QA issue
64dba7f libgxim: move from meta-ruby back to meta-oe
6c32711 imsettings: Move from meta-ruby to meta-xfce
6a6a6b4 python-pygpgme: add ptest support
a88ad55 tree: respect the package's own default CFLAGS
49434f9 gperftools: upgrade to 2.4
e0a56e5 libjpeg-turbo: update 1.4.1 -> 1.4.2
6300849 syslog-ng: add UPDATE_ALTERNATIVE for syslog-service
38c1b99 wireshark: update SRC_URI link to sources
8c9e304 libtdb: upgrade to 1.3.7
cc4d14a libldb: upgrade to 1.1.21
9969fc5 talloc: upgrade to 2.1.3
1f90e83 libtevent: upgrade to 0.9.25
6571221 samba: make cyrus-sasl optional
58675c5 libtevent: rework dependencies for deterministic build
dec04e9 libldb: allow chosing ldap dependency instead of hard requiring it
e2de62e talloc: rename to libtalloc and cleanup dependency mess
c06b071 phpmyadmin: fix CVE-2015-7873
1bbe3ea python-evdev: add python-evdev 0.5.0
c468b7e python-requests: Add RDEPENDS
e47c22a rrdtool: install python site packages into libdir
1e2afb0 libnet-ssleay-perl: fix test failures with openssl
da70d88 libhtml-tree-perl: fix shebang
4954b9b postgresql: Don't symlink to perl if it's disabled
d4fdb5a krb5: fix CVE-2015-2698
1c6668d krb5: fix CVE-2015-2697
0bd13e8 krb5: fix CVE-2015-2696
c31de28 krb5: fix CVE-2015-2695
74b9243 dleyna-renderer: Add recipe
31f22b5 dleyna-server: Add recipe
2f66c04 dleyna-connector-dbus: Add recipe
b24c1c3 dleyna-core: Add recipe
89fa4e5 networkmanager: add openvpn plugin
9af7475 networkmanager: use bluetooth from distro
78f6d7d networkmanager: package for adsl plugin
abfc32c networkmanager: PACKAGECONFIG for wifi
ba74152 networkmanager: PACKAGECONFIG for dnsmasq
9337e27 networkmanager: PACKAGECONFIG for dhclient
1fc6cbf networkmanager: PACKAGECONFIG for ifupdown netconfig
77f0269 networkmanager: run dispatcher
27a07ac networkmanager: Add package for nmtui
d81d8ad networkmanager: support gnutls and nss
3b08efc networkmanager: Update to 1.0.6
1bb254a modemmanager: Start always
4e3242f modemmanager: add dbus config
971fb4a modemmanager: Add PACKAGECONFIGs
5e2a752 modemmanager: Update to 1.4.12
cd96342 libqmi: update to 1.12.6
81834da postfix: premission of /var/spool/mail seems incorrect
c97687a tcpdump: add PACKAGECONFIG for libcap-ng

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
8ea82c0 Revert "qtbase: fix Tartget typo"
8e9ff30 qtbase: fix Tartget typo
3d7f446 cmake_qt5.bbclass: add DEPENDS to qtbase
13f73a2 align target qmake paths/mkspec
593c47a qt5-creator: building qmldesigner with gcc5 works so enable it
76c57af qt5: overwrite RRECOMMENDS_${PN} for native packages
e60184b qtbase: add PACKAGECONFIG for xkbcommon-evdev
2d1bf98 ninja-native: remove from meta-qt5 (moved to meta-oe)

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
96a7810 meta-shr, meta-fso: drop nonworking recipes

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
||2015-12-17	||6	||10	||7	||3		||0		||18		||3		||27		||74		||20		||0		||1		=
||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2015-12-17 =3D=3D

INFO: jenkins-job.sh-1.7.0 Complete log available at http://logs.nslu2-linu=
x.org/buildlogs/oe/world/log.report.20151218_111855.log

=3D=3D=3D common (5) =3D=3D=3D
    * /meta-openembedded/meta-gnome/recipes-gnome/gnome-desktop/gnome-deskt=
op_2.32.1.bb, do_configure
    * /meta-openembedded/meta-networking/recipes-connectivity/samba/samba_4=
=2E1.12.bb, do_configure
    * /meta-openembedded/meta-networking/recipes-daemons/lldpd/lldpd_0.7.19=
=2Ebb, do_compile
    * /meta-openembedded/meta-oe/recipes-support/freerdp/freerdp_git.bb, do=
_compile
    * /openembedded-core/meta/recipes-extended/xdg-utils/xdg-utils_1.1.1.bb=
, do_compile

=3D=3D=3D common-x86 (2) =3D=3D=3D
    * /meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-at=
i_7.2.0.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-no=
uveau_1.0.9.bb, do_compile

=3D=3D=3D qemuarm (1) =3D=3D=3D
    * /meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs_4.2.2.bb, d=
o_compile

=3D=3D=3D qemux86 (3) =3D=3D=3D
    * /meta-openembedded/meta-networking/recipes-extended/iscsitarget/iscsi=
target_1.4.20.3+svn502.bb, do_compile
    * /meta-openembedded/meta-networking/recipes-kernel/netmap/netmap-modul=
es_git.bb, do_compile
    * /meta-openembedded/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb=
, do_compile

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (23) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 6	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.wo=
rld.20151214_194633.log// || http://errors.yoctoproject.org:80/Errors/Build=
/10579/
|-
|| qemux86 	|| 10	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log.w=
orld.20151215_233553.log// || http://errors.yoctoproject.org:80/Errors/Buil=
d/10592/
|-
|| qemux86_64 	|| 7	 || http://logs.nslu2-linux.org/buildlogs/oe/world//log=
=2Eworld.20151217_065208.log// || http://errors.yoctoproject.org:80/Errors/=
Build/10645/
|}

=3D=3D=3D PNBLACKLISTs (88) =3D=3D=3D

=3D=3D=3D QA issues (146) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
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
||1	||unknown-configure-option
|-
||18	||textrel
|-
||20	||host-user-contaminated
|-
||27	||file-rdeps
|-
||3	||already-stripped
|-
||3	||build-deps
|-
||74	||version-going-backwards
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
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb:PNBLACK=
LIST[lksctp-tools] ?=3D "${@base_contains('DISTRO_FEATURES', 'ld-is-gold', =
"BROKEN: fails to link against sctp_connectx syth_4.101.bb:PNBLACKLIST[gst-=
plugin-bluetooth] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', '=
bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', ''=
, d)}"
meta-oe/recipes-connectivity/obexftp/obexftp_0.23.bb:PNBLACKLIST[obexftp] ?=
=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts wi=
th bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft66] ?=3D =
"BROKEN: depends on broken libftdi"
meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb:PNBLACKLIST[zeroc=
-ice] ?=3D "BROKEN: not compatible with default db version"
meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb:PNBLACKLIST[cloud9] ?=3D "Not=
 comatible with current nodejs 0.12, but upstream is working on it for v3"
meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb:PNBLACKLIST[package=
kit] ?=3D "BROKEN: depends on old deprecated libopkg which is currently dis=
abled and will be removed soon"
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
conf/world_fixes.inc:PNBLACKLIST[build-appliance-image] =3D "tries to inclu=
de whole downloads directory in /home/builder/poky :/"
conf/world_mask.inc:PNBLACKLIST[evince] =3D "fails to build"
conf/world_mask.inc:PNBLACKLIST[epiphany] =3D "fails to build"
conf/world_mask.inc:PNBLACKLIST[gnome-power-manager] =3D "fails to build"
conf/world_mask.inc:PNBLACKLIST[gnome-bluetooth] =3D "fails to build"
conf/world_mask.inc:PNBLACKLIST[media-ctl] =3D "fails to build"
QA issues by type:
count: 3	issue: already-stripped
qwt-6.0.1: File '/usr/lib/libqwt.so.6.0.1' from qwt was already stripped, t=
his will prevent future debugging! [already-stripped]
qwt-6.0.1: File '/usr/lib/libqwtmathml.so.6.0.1' from qwt was '/tmp/work/i5=
86-oe-linux/gstreamer1.0-libav/1.6.1-r0/packages-split/gstreamer1.0-libav/u=
sr/lib/gstreamer-1.0/libgstlibav.so' has relocations in .text [textrel]
libav-9.18: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/libav/9.18-r0/pac=
kages-split/libavcodec/usr/lib/libavcodec.so.54.35.0' has relocations in .t=
ext [textrel]
libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-spli=
t/libavcodec/usr/lib/libavcodec.so.54.35.0' has relocations in .text [textr=
el]
libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-spli=
t/libavdevice/usr/lib/libavdevice.so.53.2.0' has relocations in .text [text=
rel]
libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-spli=
t/libavfilter/usr/lib/libavfilter.so.3.3.0' has relocations in .text [textr=
el]
libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-spli=
t/libavformat/usr/lib/libavformat.so.54.20.4' has relocations in .text [tex=
trel]
libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-spli=
t/libavresample/usr/lib/libavresample.so.1.0.1' has relocations in .text [t=
extrel]
libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-spli=
t/libavutil/usr/lib/libavutil.so.52.3.0' has relocations in .text [textrel]
libav-9.18: ELF binary '/tmp/work/i586-oe-linux/libav/9.18-r0/packages-spli=
t/libswscale/usr/lib/libswscale.so.2.1.1' has relocations in .text [textrel]
libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary '/tmp/work/armv5te-oe-=
linux-gnueabi/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split/li=
bpostproc/usr/lib/libpostproc.so.52.3.0' has relocations in .text [textrel]
libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary '/tmp/work/i586-oe-lin=
ux/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split/libpostproc/u=
sr/lib/libpostproc.so.52.3.0' has relocations in .text [textrel]
matchbox-keyboard-0.0+gitAUTOINC+217f1bfe14: ELF binary '/tmp/work/armv5te-=
oe-linux-gnueabi/matchbox-keyboard/0.0+gitAUTOINC+217f1bfe14-r4/packages-sp=
lit/matchbox-keyboard/usr/bin/matchbox-keyboard' has relocations in .text [=
textrel]
mpg123-1.22.4: ELF binary '/tmp/work/i586-oe-linux/mpg123/1.22.4-r0/package=
s-split/mpg123/usr/lib/libmpg123.so.0.41.2' has relocations in .text [textr=
el]
qtwebengine-5.5.99+5.6.0-alpha1+gitAUTOINC+64dc919d31_7e655fbb76: ELF binar=
y '/tmp/work/i586-oe-linux/qtwebengine/5.5.99+5.6.0-alpha1+gitAUTOINC+64dc9=
19d31_7e655fbb76-r0/packages-split/qtwebengine/usr/lib/libQt5WebEngineCore.=
so.5.6.0' has relocations in .text [textrel]
webkit-efl-1.11.0: ELF binary '/tmp/work/i586-oe-linux/webkit-efl/1_1.11.0-=
r0/packages-split/webkit-efl/usr/lib/libjavascriptcore_efl.so.1.11.0' has r=
elocations in .text [textrel]


count: 3	issue: build-deps
rygel-0.26.1: rygel-plugin-media-export rdepends on libunistring, but it is=
n't a build dependency? [build-deps]
snort-2.9.7.5: snort rdepends on liblzma, but it isn't a build dependency? =
[build-deps]
vlc-2.2.1: vlc rdepends on libvncserver, but it isn't a build dependency? [=
build-deps]


count: 27	issue: file-rdeps
chkconfig-1.3.58: /usr/sbin/ntsysv_chkconfig contained in package chkconfig=
 requires libnewt.so()(64bit), but no providers found in its RDEPENDS [file=
-rdeps]
chkconfig-1.3.58: /usr/sbin/ntsysv_chkconfig contained in package chkconfig=
 requires libnewt.so, but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbdate_dvbdate contained in package dvbdate requi=
res libucsi.so()(64bit), but no providers found in its RDEPENDS [file-rdeps]
dvb-apps-1.1.1: /usr/bin/dvbdate_dvbdate contained in package dvbdate requi=
res libucsi.so, but s]
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
gupnp-0.20.12: /usr/bin/gupnp-binding-tool_gupnp-dev contained in package g=
upnp-dev requires /usr/bin/python, but no providers found in its RDEPENDS [=
file-rdeps]
libbonobo-2.32.1: /usr/bin/bonobo-slay_libbonobo contained in package libbo=
nobo requires /usr/bin/perl, but no providers found in its RDEPENDS [file-r=
deps]
libmodule-build-perl-0.31: /usr/bin/config@underscore@data_libmodule-build-=
perl contained in package libmodule-build-perl requires /tmp/sysroots/x86_6=
4-linux/usr/bin/perl-native/perl.real, but no providers found in its RDEPEN=
DS [file-rdeps]
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
networkmanager-1.0.6: /usr/bin/nmtui-connect_networkmanager-nmtui contained=
 in package networkmanager-nmtui requires libnewt.so()(64bit), but no provi=
ders found in its RDEPENDS [file-rdeps]
networkmanager-1.0.6: /usr/bin/nmtui-connect_networkmanager-nmtui contained=
 in package networkmanager-nmtui requires libnewt.so, but no providers foun=
d in its RDEPENDS [file-rdeps]
numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert.pl_numptyphysic=
s contained in package numptyphysics requires /usr/bin/perl, but no provide=
rs found in its RDEPENDS [file-rdeps]
numptyphysics-0.2+svnr109: /usr/share/numptyphysics/convert@underscore@all.=
sh_numptyphysics contained in package numptyphysics requires /bin/bash, but=
 no providers found in its RDEPENDS [file-rdeps]
ubx-utils-0.0.0+gitrAUTOINC+b63c0932dd: /usr/bin/memory-map.sh_ubx-utils co=
ntained in package ubx-utils requires /bin/bash, but no providers found in =
its RDEPENDS [file-rdeps]


count: 74	issue: version-going-backwards
libnet-dns-perl-0.81: Package version for package libnet-dns-perl went back=
wards which would break package feeds from (0:0.81-r0.26 to 0:0.81-r0.0) [v=
ersion-going-backwards]
libnet-dns-perl-0.81: Package version for package libnet-dns-perl went back=
wards which wouion-going-backwards]
libnet-dns-perl-0.81: Package version for package libnet-dns-perl-dbg went =
backwards which would break package feeds from (0:0.81-r0.28 to 0:0.81-r0.0=
) [version-going-backwards]
libnet-dns-perl-0.81: Package version for package libnet-dns-perl-dbg went =
backwards which would break package feeds from (0:0.81-r0.30 to 0:0.81-r0.0=
) [version-going-backwards]
libnet-dns-perl-0.81: Package version for package libnet-dns-perl-dev went =
backwards which would break package feeds from (0:0.81-r0.26 to 0:0.81-r0.0=
) [version-going-backwards]
libnet-dns-perl-0.81: Package version for package libnet-dns-perl-dev went =
backwards which would break package feeds from (0:0.81-r0.28 to 0:0.81-r0.0=
) [version-going-backwards]
libnet-dns-perl-0.81: Package version for package libnet-dns-perl-dev went =
backwards which would break package feeds from (0:0.81-r0.30 to 0:0.81-r0.0=
) [version-going-backwards]
libnet-dns-perl-0.81: Package version for package libnet-dns-perl-doc went =
backwards which would break package feeds from (0:0.81-r0.26 to 0:0.81-r0.0=
) [version-going-backwards]
libnet-dns-perl-0.81: Package version for package libnet-dns-perl-doc went =
backwards which would break package feeds from (0:0.81-r0.28 to 0:0.81-r0.0=
) [version-going-backwards]
libnet-dns-perl-0.81: Package version for package libnet-dns-perl-doc went =
backwards which would break package feeds from (0:0.81-r0.30 to 0:0.81-r0.0=
) [version-going-backwards]
libnet-dns-perl-0.81: Package version for package libnet-dns-perl-locale we=
nt backwards which would break package feeds from (0:0.81-r0.26 to 0:0.81-r=
0.0) [version-going-backwards]
libnet-dns-perl-0.81: Package version for package libnet-dns-perl-locale we=
nt backwards which would break package feeds from (0:0.81-r0.28 to 0:0.81-r=
0.0) [version-going-backwards]
libnet-dns-perl-0.81: Package version for package libnet-dns-perl-locale we=
nt backwards which would break package feeds from (0:0.81-r0.30 to 0:0.81-r=
0.0) [version-going-backwards]
libnet-dns-perl-0.81: Package version for package libnet-dns-perl-staticdev=
 went backwards which would break package feeds from (0:0.81-r0.26 to 0:0.8=
1-r0.0) [version-going-backwards]
libnet-dns-perl-0.81: Package version for package libnet-dns-perl-staticdev=
 went backwards which would break package feeds from (0:0.81-r0.28 to 0:0.8=
1-r0.0) [version-going-backwards]
libnet-dns-perl-0.81: Package version for package libnet-dns-perl-staticdev=
 went backwards which would break package feeds from (0:0.81-r0.30 to 0:0.8=
1-r0.0) [version-going-backwards]
luna-next-0.2.0-26+gitAUTOINC+c1d04ac285: Package version for package luna-=
next went backwards which would break package feeds from (0:0.2.0-26+git7+c=
1d04ac285-r0.2 to 0:0.2.0-26+git0+c1d04ac285-r0.0) [version-going-backwards]
luna-next-0.2.0-26+gitAUTOINC+c1d04ac285: Package version for package luna-=
next went backwards which would break package feeds from (0:0.2.0-26+git8+c=
1d04ac285-r0.2 to 0:0.2.0-26+git0+c1d04ac285-r0.1) [version-going-backwards]
luna-next-0.2.0-26+gitAUTOINC+c1d04ac285: Package version for package luna-=
next-dbg went backwards which would break package feeds from (0:0.2.0-26+gi=
t7+c1d04ac285-r0.2 to 0:0.2.0-26+git0+c1d04ac285-r0.0) [version-going-backw=
ards]
luna-next-0.2.0-26+gitAUTOINC+c1d04ac285: Package version for package luna-=
next-dbg went backwards which would break package feeds from (0:0.2.0-26+gi=
t8+c1d04ac285-r0.2 to 0:0.2.0-26+git0+c1d04ac285-r0.1) [version-going-backw=
ards]
luna-next-0.2.0-26+gitAUTOINC+c1d04ac285: Package version for package luna-=
next-dev went backwards which would break package feersion for package luna=
-next-doc went backwards which would break package feeds from (0:0.2.0-26+g=
it8+c1d04ac285-r0.2 to 0:0.2.0-26+git0+c1d04ac285-r0.1) [version-going-back=
wards]
luna-next-0.2.0-26+gitAUTOINC+c1d04ac285: Package version for package luna-=
next-locale went backwards which would break package feeds from (0:0.2.0-26=
+git7+c1d04ac285-r0.2 to 0:0.2.0-26+git0+c1d04ac285-r0.0) [version-going-ba=
ckwards]
luna-next-0.2.0-26+gitAUTOINC+c1d04ac285: Package version for package luna-=
next-locale went backwards which would break package feeds from (0:0.2.0-26=
+git8+c1d04ac285-r0.2 to 0:0.2.0-26+git0+c1d04ac285-r0.1) [version-going-ba=
ckwards]
luna-next-0.2.0-26+gitAUTOINC+c1d04ac285: Package version for package luna-=
next-staticdev went backwards which would break package feeds from (0:0.2.0=
-26+git7+c1d04ac285-r0.2 to 0:0.2.0-26+git0+c1d04ac285-r0.0) [version-going=
-backwards]
luna-next-0.2.0-26+gitAUTOINC+c1d04ac285: Package version for package luna-=
next-staticdev went backwards which would break package feeds from (0:0.2.0=
-26+git8+c1d04ac285-r0.2 to 0:0.2.0-26+git0+c1d04ac285-r0.1) [version-going=
-backwards]
luna-sysmgr-common-3.0.0-3+gitAUTOINC+1542e4a948: Package version for packa=
ge luna-sysmgr-common went backwards which would break package feeds from (=
0:3.0.0-3+git2+1542e4a948-r0.2 to 0:3.0.0-3+git0+1542e4a948-r0.0) [version-=
going-backwards]
luna-sysmgr-common-3.0.0-3+gitAUTOINC+1542e4a948: Package version for packa=
ge luna-sysmgr-common went backwards which would break package feeds from (=
0:3.0.0-3+git5+1542e4a948-r0.2 to 0:3.0.0-3+git0+1542e4a948-r0.1) [version-=
going-backwards]
luna-sysmgr-common-3.0.0-3+gitAUTOINC+1542e4a948: Package version for packa=
ge luna-sysmgr-common-dbg went backwards which would break package feeds fr=
om (0:3.0.0-3+git2+1542e4a948-r0.2 to 0:3.0.0-3+git0+1542e4a948-r0.0) [vers=
ion-going-backwards]
luna-sysmgr-common-3.0.0-3+gitAUTOINC+1542e4a948: Package version for packa=
ge luna-sysmgr-common-dbg went backwards which would break package feeds fr=
om (0:3.0.0-3+git5+1542e4a948-r0.2 to 0:3.0.0-3+git0+1542e4a948-r0.1) [vers=
ion-going-backwards]
luna-sysmgr-common-3.0.0-3+gitAUTOINC+1542e4a948: Package version for packa=
ge luna-sysmgr-common-dev went backwards which would break package feeds fr=
om (0:3.0.0-3+git2+1542e4a948-r0.2 to 0:3.0.0-3+git0+1542e4a948-r0.0) [vers=
ion-going-backwards]
luna-sysmgr-common-3.0.0-3+gitAUTOINC+1542e4a948: Package version for packa=
ge luna-sysmgr-common-dev went backwards which would break package feeds fr=
om (0:3.0.0-3+git5+1542e4a948-r0.2 to 0:3.0.0-3+git0+1542e4a948-r0.1) [vers=
ion-going-backwards]
luna-sysmgr-common-3.0.0-3+gitAUTOINC+1542e4a948: Package version for packa=
ge luna-sysmgr-common-doc went backwards which would break package feeds fr=
om (0:3.0.0-3+git2+1542e4a948-r0.2 to 0:3.0.0-3+git0+1542e4a948-r0.0) [vers=
ion-going-backwards]
luna-sysmgr-common-3.0.0-3+gitAUTOINC+1542e4a948: Package version for packa=
ge luna-sysmgr-common-doc went backwards which would break package feeds fr=
om (0:3.0.0-3+git5+1542e4a948-r0.2 to 0:3.0.0-3+git0+1542e4a948-r0.1) [vers=
ion-going-backwards]
luna-sysmgr-common-3.0.0-3+gitAUTOINC+1542e4a948: Package version for packa=
ge luna-sysmgr-common-locale went backwards which would break package feeds=
 from (0:3.0.0-3+git2+1542e4a948-r0.2 to 0:3.0.0-3+git0+1542e4a948-r0.0) [v=
ersion-going-backwards]
luna-sysmgr-common-3.0.0-3+gitAUTOINC+1542e4a948: Package version for packa=
ge luna-sysmgr-common-locale went backwards which would break package feeds=
 from (0:3.0.0-3+git5+1542e4a948-r0.2 to 0:3.0.0-3+git0+1542e4a948-r0.1) [v=
ersion-going-backwards]
luna- break package feeds from (0:1.1.0-r0.6 to 0:1.1.0-r0.0) [version-goin=
g-backwards]
sessreg-1.1.0: Package version for package sessreg went backwards which wou=
ld break package feeds from (0:1.1.0-r0.7 to 0:1.1.0-r0.0) [version-going-b=
ackwards]
sessreg-1.1.0: Package version for package sessreg-dbg went backwards which=
 would break package feeds from (0:1.1.0-r0.4 to 0:1.1.0-r0.0) [version-goi=
ng-backwards]
sessreg-1.1.0: Package version for package sessreg-dbg went backwards which=
 would break package feeds from (0:1.1.0-r0.6 to 0:1.1.0-r0.0) [version-goi=
ng-backwards]
sessreg-1.1.0: Package version for package sessreg-dbg went backwards which=
 would break package feeds from (0:1.1.0-r0.7 to 0:1.1.0-r0.0) [version-goi=
ng-backwards]
sessreg-1.1.0: Package version for package sessreg-dev went backwards which=
 would break package feeds from (0:1.1.0-r0.4 to 0:1.1.0-r0.0) [version-goi=
ng-backwards]
sessreg-1.1.0: Package version for package sessreg-dev went backwards which=
 would break package feeds from (0:1.1.0-r0.6 to 0:1.1.0-r0.0) [version-goi=
ng-backwards]
sessreg-1.1.0: Package version for package sessreg-dev went backwards which=
 would break package feeds from (0:1.1.0-r0.7 to 0:1.1.0-r0.0) [version-goi=
ng-backwards]
sessreg-1.1.0: Package version for package sessreg-doc went backwards which=
 would break package feeds from (0:1.1.0-r0.4 to 0:1.1.0-r0.0) [version-goi=
ng-backwards]
sessreg-1.1.0: Package version for package sessreg-doc went backwards which=
 would break package feeds from (0:1.1.0-r0.6 to 0:1.1.0-r0.0) [version-goi=
ng-backwards]
sessreg-1.1.0: Package version for package sessreg-doc went backwards which=
 would break package feeds from (0:1.1.0-r0.7 to 0:1.1.0-r0.0) [version-goi=
ng-backwards]
sessreg-1.1.0: Package version for package sessreg-locale went backwards wh=
ich would break package feeds from (0:1.1.0-r0.4 to 0:1.1.0-r0.0) [version-=
going-backwards]
sessreg-1.1.0: Package version for package sessreg-locale went backwards wh=
ich would break package feeds from (0:1.1.0-r0.6 to 0:1.1.0-r0.0) [version-=
going-backwards]
sessreg-1.1.0: Package version for package sessreg-locale went backwards wh=
ich would break package feeds from (0:1.1.0-r0.7 to 0:1.1.0-r0.0) [version-=
going-backwards]
sessreg-1.1.0: Package version for package sessreg-staticdev went backwards=
 which would break package feeds from (0:1.1.0-r0.4 to 0:1.1.0-r0.0) [versi=
on-going-backwards]
sessreg-1.1.0: Package version for package sessreg-staticdev went backwards=
 which would break package feeds from (0:1.1.0-r0.6 to 0:1.1.0-r0.0) [versi=
on-going-backwards]
sessreg-1.1.0: Package version for package sessreg-staticdev went backwards=
 which would break package feeds from (0:1.1.0-r0.7 to 0:1.1.0-r0.0) [versi=
on-going-backwards]
tufao-1.2.1+AUTOINC+a4832b4c94: Package version for package tufao went back=
wards which would break package feeds from (0:1.2.1+0+a4832b4c94-r0.46 to 0=
:1.2.1+0+a4832b4c94-r0.0) [version-going-backwards]
tufao-1.2.1+AUTOINC+a4832b4c94: Package version for package tufao went back=
wards which would break package feeds from (0:1.2.1+0+a4832b4c94-r0.50 to 0=
:1.2.1+0+a4832b4c94-r0.1) [version-going-backwards]
tufao-1.2.1+AUTOINC+a4832b4c94: Package version for package tufao-dbg went =
backwards which would break package feeds from (0:1.2.1+0+a4832b4c94-r0.46 =
to 0:1.2.1+0+a4832b4c94-r0.0) [version-going-backwards]
tufao-1.2.1+AUTOINC+a4832b4c94: Package version for package tufao-dbg went =
backwards which would break package feeds from (0:1.2.1+0+a4832b4c94-r0.50 =
to 0:1.2.1+0+a4832b4c94-r0.1) [version-going-backwards]
tufao-1.2.1+AUTOINC+a4832b4c94: Packag32b4c94-r0.50 to 0:1.2.1+0+a4832b4c94=
-r0.1) [version-going-backwards]
tufao-1.2.1+AUTOINC+a4832b4c94: Package version for package tufao-locale we=
nt backwards which would break package feeds from (0:1.2.1+0+a4832b4c94-r0.=
46 to 0:1.2.1+0+a4832b4c94-r0.0) [version-going-backwards]
tufao-1.2.1+AUTOINC+a4832b4c94: Package version for package tufao-locale we=
nt backwards which would break package feeds from (0:1.2.1+0+a4832b4c94-r0.=
50 to 0:1.2.1+0+a4832b4c94-r0.1) [version-going-backwards]
tufao-1.2.1+AUTOINC+a4832b4c94: Package version for package tufao-mkspecs w=
ent backwards which would break package feeds from (0:1.2.1+0+a4832b4c94-r0=
=2E46 to 0:1.2.1+0+a4832b4c94-r0.0) [version-going-backwards]
tufao-1.2.1+AUTOINC+a4832b4c94: Package version for package tufao-mkspecs w=
ent backwards which would break package feeds from (0:1.2.1+0+a4832b4c94-r0=
=2E50 to 0:1.2.1+0+a4832b4c94-r0.1) [version-going-backwards]
tufao-1.2.1+AUTOINC+a4832b4c94: Package version for package tufao-staticdev=
 went backwards which would break package feeds from (0:1.2.1+0+a4832b4c94-=
r0.46 to 0:1.2.1+0+a4832b4c94-r0.0) [version-going-backwards]
tufao-1.2.1+AUTOINC+a4832b4c94: Package version for package tufao-staticdev=
 went backwards which would break package feeds from (0:1.2.1+0+a4832b4c94-=
r0.50 to 0:1.2.1+0+a4832b4c94-r0.1) [version-going-backwards]


count: 20	issue: host-user-contaminated
babiloo-efl-2.0.9-10: babiloo-efl: /babiloo-efl/usr/share/babiloo/core/test=
/test_dictionary.py is owned by uid 3004, which is the same as the user run=
ning bitbake. This may be due to host contamination [host-user-contaminated]
cinematicexperience-1.0: cinematicexperience: /cinematicexperience/usr/shar=
e/cinematicexperience-1.0/content/images/qt_logo.png is owned by uid 3004, =
which is the same as the user running bitbake. This may be due to host cont=
amination [host-user-contaminated]
debootstrap-1.0.67: debootstrap: /debootstrap/usr/share/debootstrap/scripts=
/breezy is owned by uid 3004, which is the same as the user running bitbake=
=2E This may be due to host contamination [host-user-contaminated]
espeak-1.37: espeak: /espeak/usr/share/espeak-data/mbrola_ph/es4_phtrans is=
 owned by uid 3004, which is the same as the user running bitbake. This may=
 be due to host contamination [host-user-contaminated]
firefox-addon-webconverger-20120228: firefox-addon-webconverger: /firefox-a=
ddon-webconverger/usr/lib/firefox/extensions/{ee11fa88-036b-4661-bb04-d436f=
86bc06a}/content/wc.js is owned by uid 3004, which is the same as the user =
running bitbake. This may be due to host contamination [host-user-contamina=
ted]
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
verywheredemo-1.0/qml/QtDemo/images/tv.png is owned by uited]
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
qwt-6.0.1: qwt: /qwt-examples/usr/bin/plotmatrix is owned by uid 3004, whic=
h is the same as the user running bitbake. This may be due to host contamin=
ation [host-user-contaminated]
qwt-6.0.1: qwt: /qwt-examples/usr/bin/realtime is owned by uid 3004, which =
is the same as the user running bitbake. This may be due to host contaminat=
ion [host-user-contaminated]
thone-0.7: thone: /thone/usr/bin/thone-toggle is owned by uid 3004, which i=
s the same as the user running bitbake. This may be due to host contaminati=
on [host-user-contaminated]


count: 0	issue: installed-vs-shipped


count: 1	issue: unknown-configure-option
polkit-gnome-0.105: polkit-gnome: configure was passed unrecognised options=
: --disable-examples --disable-introspection [unknown-configure-option]


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--sm4nu43k4a2Rpi4c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZz7SgACgkQN1Ujt2V2gBwIAACgrevMGWKSrsxSjBHx4VtLicRe
QhsAn0L2lAGNXI1/az6NzPMrf/4xBSvS
=VrL4
-----END PGP SIGNATURE-----

--sm4nu43k4a2Rpi4c--
