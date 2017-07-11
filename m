Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f173.google.com (mail-wr0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id AC7C077E88;
	Tue, 11 Jul 2017 07:55:21 +0000 (UTC)
Received: by mail-wr0-f173.google.com with SMTP id 77so171518995wrb.1;
	Tue, 11 Jul 2017 00:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=p0X16N/HGVLR1dSORUvJdZ7gf+ZXE2djzNlf40cJTvQ=;
	b=tpbNdNALvb9haGL5Vudjvz6x1Mi0+NEjV6iYUagIAaF6SGuX1GcLA0+c1XEsAr01+D
	Vp/xOAlIHQqKl7NQgEv9lHCjWGXmnCKukiA56LpNaGj4NYDr1XzaAa+zwq3wGBrDpdnl
	gttP08ELoX5dLetJzSxrFU6Zct/iqYX1HKTCmAvpPMZWiPVc1M9wd7fxbVRoivpV2Z3M
	CgmK6dHR+ltM5SXxWSn5PM82bv4MO2aO/1kxrxcxbyVp9w3/4xuA5IWn1TYZGIxbBsYm
	Glv+T91GX7D7s1KZaSoFp1/s05AVQOV22LDPG9WCDW7LP1XuRBB9yzoJfRbnBihJHM2Z
	uaLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=p0X16N/HGVLR1dSORUvJdZ7gf+ZXE2djzNlf40cJTvQ=;
	b=eqoDO8VktxXBQR25zJE1JSSRQQiKuHV56rOO1uHvef0j5i0wVHfZRzyruIm2MHRKPG
	sonKIWpp6Y1bnlRBXZXtyPaJO98i0crlHBtuh00CLao40X1QL5A4DAwLgFwsA/nYZQOA
	64KPdvDSURdEgTwU6RjkWO/chO00v1vARZgeFiLhLCfd8Ry0tI4DVmH1o0PZGHlxxHK3
	t8fiiY1V5JoUaFCnyZ+o5k5gwlvcORAZNkwBoin/sxEq2eQMoSPrF4BMpOfbeKSYC/qe
	GDo0DiUPcT/bfjj7ofsihZaU1UMWmAlzJklumTRCEK0QBXBvHS8nktKawoTjSiV3LwrG
	1UAg==
X-Gm-Message-State: AIVw110M9b46k2mbUPmh80dYKYCOsWhDYtZxJAgXjmrQKbF8a5LgsydS
	yND0auLo1Qc7LxZq
X-Received: by 10.28.48.201 with SMTP id w192mr1533945wmw.28.1499759722076;
	Tue, 11 Jul 2017 00:55:22 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	33sm10577032wrr.58.2017.07.11.00.55.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 11 Jul 2017 00:55:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 11 Jul 2017 09:56:00 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20170711075600.GA3263@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.8.3 (2017-05-23)
Subject: State of bitbake world, Failed tasks 2017-07-09
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
X-List-Received-Date: Tue, 11 Jul 2017 07:55:22 -0000
X-Groupsio-MsgNum: 99952
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Content-Disposition: inline

--5vNYLRcllDrimb99
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Number of issues - stats =3D=3D
{| class=3D'wikitable'
!|Date		     !!colspan=3D'3'|Failed tasks			    !!|Signatures		  !!colspan=
=3D'14'|QA !!Comment
|-
||		||qemuarm	||qemux86	||qemux86_64	||all 	||already-stripped	||libdir	||t=
extrel	||build-deps	||file-rdeps	||version-going-backwards	||host-user-cont=
aminated	||installed-vs-shipped	||unknown-configure-option	||symlink-to-sys=
root	||invalid-pkgconfig	||pkgname	||ldflags	||compile-host-path	||=09
|-
||2017-07-09	||4	||5	||5	||0	||0		||1		||5		||0		||0		||0		||0		||0		||0		|=
|0		||0		||0		||0		||0		||=09
|}

=3D=3D Failed tasks 2017-07-09 =3D=3D

INFO: jenkins-job.sh-1.8.24 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/rocko/log.report.20170710_215314.log

=3D=3D=3D common (3) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb:do_c=
ompile
    * meta-openembedded/meta-oe/recipes-extended/fluentbit/fluentbit_0.11.1=
1.bb:do_package
    * virtual:native:meta-qt5/recipes-qt/qt5/qtxmlpatterns_git.bb:do_popula=
te_sysroot

=3D=3D=3D common-x86 (2) =3D=3D=3D
    * meta-qt5/recipes-qt/qt5/qtwebengine_git.bb:do_compile
    * openembedded-core/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb:d=
o_compile_ptest_base

=3D=3D=3D qemuarm (1) =3D=3D=3D
    * meta-openembedded/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb=
:do_compile

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (14) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 4	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/l=
og.world.qemuarm.20170708_094432.log/ || http://errors.yoctoproject.org/Err=
ors/Build/40735/
|-
|| qemux86 	|| 5	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/l=
og.world.qemux86.20170708_094429.log/ || http://errors.yoctoproject.org/Err=
ors/Build/40736/
|-
|| qemux86_64 	|| 5	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rock=
o/log.world.qemux86-64.20170709_131237.log/ || http://errors.yoctoproject.o=
rg/Errors/Build/40926/
|}

=3D=3D=3D PNBLACKLISTs (14) =3D=3D=3D

=3D=3D=3D QA issues (6) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
|-
||0	||already-stripped
|-
||0	||build-deps
|-
||0	||compile-host-path
|-
||0	||file-rdeps
|-
||0	||host-user-contaminated
|-
||0	||installed-vs-shipped
|-
||0	||invalid-pkgconfig
|-
||0	||ldflags
|-
||0	||pkgname
|-
||0	||symlink-to-sysroot
|-
||0	||unknown-configure-option
|-
||0	||version-going-backwards
|-
||1	||libdir
|-
||5	||textrel
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.sign=
atures.20170709_095441.log/

No issues detected


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACK=
LIST[lksctp-tools] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gol=
d', "BROKEN: fails to link against sctp_connectx symbol", '', d)}"
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
meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb:PNBLACKLIST[libsexy] ?=
=3D "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/=
130607/ - the recipe will be removed on 2017-09-01 unless the issue is fixe=
d"
meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb:PNBLACKLIS=
T[xf86-video-geode] ?=3D "BROKEN, fails to build - the recipe will be remov=
ed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb:PNBLACKLIST[foxtr=
otgps] ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conf=
licts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-navigation/gypsy/gypsy.inc:PNBLACKLIST[gypsy] ?=3D "${@bb.u=
tils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 an=
d bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-navigation/navit/navit.inc:PNBLACKLIST[navit] ?=3D "${@bb.u=
tils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 an=
d bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb:PNBLACKLIST[libsyncml] =
?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts w=
ith bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-qt5:
meta-smartphone:
meta-shr/recipes-shr/3rdparty/libsensmon_git.bb:PNBLACKLIST[libsensmon] ?=
=3D "BROKEN: not compatible with newer vala, http://errors.yoctoproject.org=
/Errors/Details/143058/"
meta-shr/recipes-shr/3rdparty/omhacks_git.bb:PNBLACKLIST[omhacks] ?=3D "Not=
 compatible with gcc7 - the recipe will be removed on 2017-09-01 unless the=
 issue is fixed"
meta-webos-ports:
meta-luneos/recipes-luneos/luna-webappmanager/luna-webappmanager.bb:PNBLACK=
LIST[luna-webappmanager] ?=3D "BROKEN: needs to be adapted to new qt-5.7"
meta-luneui/recipes-luneui/luna-next/luna-next.bb:PNBLACKLIST[luna-next] ?=
=3D "BROKEN: needs to be adapted to new qtwayland-5.7"
PNBLACKLIST[android-system] =3D "depends on lxc from meta-virtualiazation w=
hich isn't included in my world builds"
PNBLACKLIST[bigbuckbunny-1080p] =3D "big and doesn't really need to be test=
ed so much"
PNBLACKLIST[bigbuckbunny-480p] =3D "big and doesn't really need to be teste=
d so much"
PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't really need to be teste=
d so much"
PNBLACKLIST[bigbuckbunny-720p] =3D "big and doesn't really need to be teste=
d so much"
PNBLACKLIST[tearsofsteel-1080p] =3D "big and doesn't really need to be test=
ed so much"
PNBLACKLIST[build-appliance-image] =3D "tries to include whole downloads di=
rectory in /home/builder/poky :/"
PNBLACKLIST[linux-yocto-tiny-kexecboot] =3D "does weird sh!t breaking other=
 kernels and modules - broken for years"
PNBLACKLIST[linux-yocto-tiny] =3D "does weird sh!t breaking other kernels a=
nd modules - broken for years"


QA issues by type:
count: 0	issue: already-stripped


count: 1	issue: libdir
qwt-qt5-dbg: found library in wrong location: /usr/plugins/designer/.debug/=
libqwt_designer_plugin.so [libdir]


count: 5	issue: textrel
chromium-54.0.2810.2: ELF binary '/tmp/work/i586-oe-linux/chromium/54.0.281=
0.2-r0/packages-split/chromium/usr/bin/chromium/chrome' has relocations in =
=2Etext [textrel]
chromium-wayland-53.0.2785.143: ELF binary '/tmp/work/i586-oe-linux/chromiu=
m-wayland/53.0.2785.143-r0/packages-split/chromium-wayland/usr/bin/chromium=
/chrome' has relocations in .text [textrel]
corosync-2.4.2: ELF binary '/tmp/work/core2-64-oe-linux/corosync/2.4.2-r0/p=
ackages-split/corosync/usr/sbin/corosync' has relocations in .text [textrel]
mpeg2dec-0.5.1: ELF binary '/tmp/work/armv5te-oe-linux-gnueabi/mpeg2dec/0.5=
=2E1-r0/packages-split/libmpeg2/usr/lib/libmpeg2.so.0.1.0' has relocations =
in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary '/tmp/work/i586-oe-linux/x264/=
r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264/usr/lib/libx264.so.148' =
has relocations in .text [textrel]


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 0	issue: version-going-backwards


count: 0	issue: host-user-contaminated


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 0	issue: ldflags


count: 0	issue: compile-host-path



=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
4a14b44 knotty: Drop task prefix of PLAIN log messages
not included in master yet:=20
dda3a10 world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
7dd5dfc oeqa/tinfoil: Improve test_wait_event for race issues
not included in master yet:=20
22d5a0e report-error: Allow to upload reports automatically
9143fb9 buildhistory.bbclass: metadata-revs show repo parent
2912706 metadata-revs: provide more information
ea981cd qemux86: Add identical qemux86copy variant for tests

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
66b88f7 hwloc: Inherit pkgconfig
not included in master yet:=20
9340320 dnsmasq: disable the service by default
d1fca80 rdate: Fix build with hardening
96fd8e1 strongswan: Include stdint.h for uintptr_t
961797e netkit-rpc: Fix build with hardening flags
b1fb0ad netkit-telnet: Fix build with hardening
ed9432c ncftp: Upgrade to 3.2.6
2531f3e ippool: Fix build errors found with hardening flags
5963598 gflags: update SRC_URI with git fetcher
1a3966a unionfs-fuse: 0.26 -> 2.0
39502f2 autofs: Add build dependency on libnsl2
b73b2f4 gst-plugins-gl_0.10.3.bb: Fix build on rpi/userland
5ed1dba librcf: fix mips/mips64 build
b02be7a freerdp: Fix build on mips
6869684 gegl: Upgrade to 0.3.18
6cbe8e8 babl: Upgrade to 0.1.28
a57a2ed gimp: Upgrade to 2.8.22
8ddbec6 fluentbit: Fix parallel build race
73ccbee dietsplash: Fix build on mips
17afe08 libsrtp: Fix build on mips
e6ffb3c assimp: Upgrade to 3.3.1 release
14c5780 synergy: Update to 1.8.8 release
bf198f6 kodi: Update to 17.3
220ffd8 libtorrent: Implement 64bit atomics for mips32
d1c5c69 rtorrent: Add and enable ipv6 packageconfig based on DISTRO_FEATURES
b7dac59 uim: Add support for aarch64
d855e3d openhpi: Fix build on 64bit platforms e.g. aarch64
553ca7d meson: Port pkgconfig-native patch to 0.40.1
160c92f tinymembench: Disable on mips64
b952200 ltrace: Add mips64 support
78c68a2 libtorrent: Link in 64bit atomics for ppc
339f975 librcf: Define byteorder for powerpc machines
d6871e9 gperftools: Fix build on ppc
116273f crossguid: Add recipe
5b24757 kodi: User external crossguid
7798745 ser2net: upgrade to version 3.4
fba5745 multipath-tools: 0.6.4 -> 0.7.1
576007b python-pytest: update to version 3.1.3
ab2195a python-pytest: remove fetch during do_compile phase
257ae76 libtinyxml2: upgrade to 5.0.1
097b85b gnome-common: Add recipe (from oe-core)
8bd9323 webrtc-audio-processing: initial recipe
ed824a0 libdbus-c++: Fix build with gcc7 and unblacklist
922fdce security_flags.inc: Delete
76be091 ltrace: Fix build on musl
c6b1446 pptp-linux: Upgrade to 1.9.0
05ec709 kodi: Fix build on powerpc
b431117 recipes: remove blacklisted recipes

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
2940d84 Revert "qttools: DEPENDS on icu"
not included in master yet:=20
800d4c1 libconnman-qt5: update to 1.1.10
428be3c qtwebengine: add PACKAGECONFIG for webrtc
e171265 qt5: add qt5-ptest.inc
774bec9 qtxmlpatterns: add ptest
6e18c64 qtdeclarative: add ptest
31996e7 qtquickcontrols2: fix compilation of examples/texteditor
b36f0b8 qtquick1: add ptest

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
d822031 Merge pull request #49 from kraj/kraj/master
not included in master yet:=20
6f790a0 gnome-settings-daemon: remove the bbappend for removed recipe

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
latest upstream commit:=20
b733d4e org.webosinternals.ipkgservice: Bump SRCREV
not included in master yet:=20
c18e1a3 pulseaudio-distro-conf: update webos-system.pa from latest pulseaud=
io
daee364 README: update to depend on morty branches
5bdae2d glib-2.0: rename .bbappend to match new version from oe-core
3d5ea93 connman: rename .bbappend to match new version from oe-core
3987481 openssl,pmcertificatemgr: use openssl files from /etc
83a0ce0 libsdl2: upgrade to 2.0.4 included in oe-core
012c358 alsa-lib,alsa-utils: rename bbappend to match new version from oe-c=
ore
8ba6347 librolegen: Fix build with newer toolchain
152bf9f activitymanager: Fix build with newer toolchain
29483f8 presage: Fix build with newer toolchain
9107fd9 mmsd, packagegroup-webos-test: drop python-pygobject
71426d3 connman: rename bbappend to match new version from oe-core
12953eb opkg: rename bbappend to match new version from oe-core
8129f94 pulseaudio: rename bbappend to match new version from oe-core
6da6903 pulseaudio: install also 2 new headers mem.h and srbchannel.h to fi=
x pulseaudio-modules-droid build
fb83825 pulseaudio: refresh patches to apply cleanly for 9.0
bdab360 freeimage: bump SRCREV to fix build with gcc6
2c22e31 alsa-{lib,utils}: rename bbappend to match new version from oe-core
d1c69fc glib-2.0: rename bbappend to match new version from oe-core
18f5781 pidgin: rename bbappend to match new version from oe-core
def8cc0 geoclue: use 2.4.4 version from meta-oe
b9cfb62 mesa: add LIC_FILES_CHKSUM for 10.3.8
fee5971 libsdl2: use gles2 instead of opengl
596fdbd Mojomail: Switch to own fork for testing
ab817f0 FreeImage: Use test branch for gcc6
9a8bbd7 luneos(-package): update for new kernel names
229ccf3 README: update to depend on pyro branches
aa0c86f glib-2.0: rename bbappend to match new version from oe-core
d53ba57 opkg: rename bbappend to match new version from oe-core
b2fd9a0 alsa-utils: rename bbappend to match new version from oe-core
b0ef023 alsa-lib: Rename bbappend to match new version
6a2a152 android-tools: Rename bbappend to match new version
3a30e0e nodejs-enyo-dev: rename to have native suffix and use SYSROOT_DIRS =
variable
9553f07 lxc: fix build with new glibc
2382c37 mtp-server: inherit gettext
9aa8c9b qtscenegraph-adaptation: add dependency on qtdeclarative
48defcd luneos-package: inhibit default deps and limit do_deploy deps
8647955 pulseaudio: Rename bbappend to match new version
eae5370 pulseaudio: refresh patches to apply cleanly for 10.0
870f9a2 luna-next: add missing dependency on wayland-native qtwayland-native
0d1b919 luneos-emulator-appliance: inhibit default deps and limit do_deploy=
 deps
6ad59a5 nyx-modules-hybris: Use MACHINE_ARCH because of android-headers dep=
endency
0fff469 luneos.inc: Convert SANITY_TESTED_DISTROS to lowercase
29bc5c3 dosfstools: rename bbappend
b5d0abc luneos.inc: drop PATH prepend
0befc01 dosfstools: add fsck.vfat symlink only in target version
8bbbe58 lsb: drop fix-lsb_release-to-work-with-busybox-head-and-find.patch
1ba6e97 mesa: add dependency on udev and drop vulkan PACKAGECONFIG
31f8f2f nodejs-module-webos-pmlog: add vim-native dependency to provide xxd
0f6595b pidgin-sipe: add dependency on glib-2.0-native to provide glib-gett=
extize
c8334c3 mesa: remove --with-llvm-prefix option
15212eb sdl2-opengles-test: inherit pkg-config
3a0c166 webos-keyboard: add temporary patch from Tofe to fix compatibility =
with newer hunspell
b946c5a opkg: remove libsolv PACKAGECONFIG
cc04def qemux86: Simplify loading of uvesafb and blacklist vboxvideo
cb69374 luneos-emulator: switch ethernet card from PCNet32 to E1000
45d0174 pulseaudio-modules-droid: migrate to PulseAudio 10.0
16f84c2 systemd: Disable ProtectHome and ProtectSystem for old kernels
47091c6 ofono: Use Mer's 1.19 and include fix
d23aeb0 mesa: remove --with-llvm-prefix in meta-luneui instead of meta-lune=
os
47ebb4f README: update to depend on master branches
29413ad qtbase: enable fontconfig
a457d20 qtwayland, qtwebengine: use webOS-ports/master-next branch compatib=
le with 5.7
e1f0c7e luna-next: Make compatible with Qt 5.7
f557d2e qtwayland, qtwebengine: temporary drop bbappend
013635d luna-sysservice: Fix build with qt 5.7
426a038 luna-next, luna-webappmanager: temporary drop from image
0fe78d3 packagegroup-luneos-development: drop qt5-opengles2-test
4d68be8 libconnman-qt: replace with libconnman-qt5 from meta-qt5
261c358 libqofono: use the recipe from meta-qt5
bddfec2 qtlocation: drop invalid and unused OE_LUNEOS_ENABLED option
3aba05c phonesim: fix build with Qt 5.8
7f330a0 qtbase: enable xkbcommon-evdev for qtwayland
8e72c39 qt5-qpa-hwcomposer-plugi: Fix build with Qt 5.8
178db00 packagegroup-luneos-extended: drop qtscenegraph-adaptation

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
f305d9f omhacks: blacklist
not included in master yet:=20
54aff16 meta-shr, meta-fso: remove blacklisted recipes

--5vNYLRcllDrimb99
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWWSEjwAKCRA3VSO3ZXaA
HK6NAJ0W6vKFws6OpMA3ac0rCpJZkg9WRQCfatLqKEi6mFptQ+5EUubb159rQl0=
=GZdU
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--
