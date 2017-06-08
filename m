Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id B37BE78207;
	Thu,  8 Jun 2017 12:52:31 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id n195so30436339wmg.1;
	Thu, 08 Jun 2017 05:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=nmRN9h8PT/4VnvL5uevxo8jEqTSoJeebRA1mUCsl73Q=;
	b=VKpGunW8Wh8qG0zHk4aS6VYtrUKD17S/l1nbQsbNdNcfmPffzNreavjNcJmyY587fx
	1/P9J4XyJaAQvIbPowlHFVEge+Kvszpbvxg7lWjGNBFu/ymXwhCxSk4Ovxajhn/CBi8r
	32YKHhvkbfMf7CBsiz3hLTlxmBpDLypXWhKmFG0bZCLzPdp1iLhFJos6/c0Z5mBT5J70
	GrNlRMWJ/vKTatlvd5dp2MSWZSIMaZyK6dMi1DWJ2JrMuz4N4P+z9ZUTvYyXgfG7LzQk
	i+OWmKFy2JT5KVK/q/BioghXid/aaWnqpaEl0jpdNd27rMBxkPrB2nHZBDOHAY9jILpG
	ml4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=nmRN9h8PT/4VnvL5uevxo8jEqTSoJeebRA1mUCsl73Q=;
	b=D/AfqIm9KkYZuOF4xaj9xk5Hs2dPiN2dU4h4Agc+N0oMRrl9xTuw0Xa3hRsvfsl/72
	ob9msVQyEkmV41NKLjGgKh4f9IXNR2sjhNAwNUALWiAlP0GnSM6Z0l7WCphyX7p8F73w
	/5bOMlqSN4AIZ3Zz/QLgMBTpBQ+VCh1Fc6CQefzqBaoOqDhkGzuKG9Dzk8nWY9Kf1rNP
	PsfdNlq+HgSs9f6o7t/oiiKVz23bqSxWYki6lKfnBRv7btfo/wlq6nIZv/BQ8S5FA/Zg
	SbqqzwLubKDRjmJ48ZIMedjzs45hmVPC2KfhUd2+aqAG5nFknZxBNm2lQ4wRuepG0KlU
	BM4w==
X-Gm-Message-State: AODbwcBPkt/ev9rkQ7Ez9TTv8oR0eeXI6KGZrsZjqYcnDUtw4MLYaEiL
	qJkshnkC58ZWLfHi
X-Received: by 10.28.138.16 with SMTP id m16mr3132756wmd.99.1496926352088;
	Thu, 08 Jun 2017 05:52:32 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id l8sm6169330wmd.8.2017.06.08.05.52.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 08 Jun 2017 05:52:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 8 Jun 2017 12:52:32 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20170608105231.GA3022@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.8.3 (2017-05-23)
Subject: State of bitbake world, Failed tasks 2017-06-06
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
X-List-Received-Date: Thu, 08 Jun 2017 12:52:32 -0000
X-Groupsio-MsgNum: 98327
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline

--Nq2Wo0NMKNjxTN9z
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
||2017-06-06	||3	||2	||3	||0	||0		||1		||2		||0		||0		||6		||5		||0		||0		|=
|0		||0		||0		||0		||0		||=09
|}

=3D=3D Failed tasks 2017-06-06 =3D=3D

INFO: jenkins-job.sh-1.8.21 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/rocko/log.report.20170607_102110.log

=3D=3D=3D common (0) =3D=3D=3D

=3D=3D=3D common-x86 (2) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-support/espeak/espeak_1.48.04.bb:do=
_compile
    * meta-qt5/recipes-qt/qt5/qtwebengine_git.bb:do_compile

=3D=3D=3D qemuarm (3) =3D=3D=3D
    * meta-qt5/recipes-qt/qt5/qtlocation_git.bb:do_compile
    * meta-qt5/recipes-qt/qt5/qtremoteobjects_git.bb:do_compile
    * openembedded-core/meta/recipes-support/libunwind/libunwind_1.2.bb:do_=
compile

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (8) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 3	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/l=
og.world.qemuarm.20170606_034118.log/ || http://errors.yoctoproject.org/Err=
ors/Build/38558/
|-
|| qemux86 	|| 2	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/l=
og.world.qemux86.20170606_043640.log/ || http://errors.yoctoproject.org/Err=
ors/Build/38561/
|-
|| qemux86_64 	|| 3	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rock=
o/log.world.qemux86-64.20170606_151725.log/ || http://errors.yoctoproject.o=
rg/Errors/Build/38651/
|}

=3D=3D=3D PNBLACKLISTs (15) =3D=3D=3D

=3D=3D=3D QA issues (14) =3D=3D=3D
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
||1	||libdir
|-
||2	||textrel
|-
||5	||host-user-contaminated
|-
||6	||version-going-backwards
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.sign=
atures.20170606_103657.log/


    * ERROR: Nothing PROVIDES 'qtwebengine' (but /home/jenkins/oe/world/shr=
-core/meta-qt5/recipes-qt/qt5/qtwebview_git.bb DEPENDS on or otherwise requ=
ires it)
    * ERROR: qtwebengine was skipped: incompatible with machine qemuarm (no=
t in COMPATIBLE_MACHINE)
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable pr=
oviders.


PNBLACKLISTs:
openembedded-core/:
meta-browser:
recipes-browser/chromium/cef3_280796.bb:PNBLACKLIST[cef3] ?=3D "BROKEN: fai=
ls to build with gcc-6"
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
meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb:PNBLACKLIST[libdbus-c++] ?=
=3D "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/=
130644/ - the recipe will be removed on 2017-09-01 unless the issue is fixe=
d"
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


count: 2	issue: textrel
chromium-54.0.2810.2: ELF binary '/tmp/work/i586-oe-linux/chromium/54.0.281=
0.2-r0/packages-split/chromium/usr/bin/chromium/chrome' has relocations in =
=2Etext [textrel]
chromium-wayland-53.0.2785.143: ELF binary '/tmp/work/i586-oe-linux/chromiu=
m-wayland/53.0.2785.143-r0/packages-split/chromium-wayland/usr/bin/chromium=
/chrome' has relocations in .text [textrel]


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 6	issue: version-going-backwards
fwts-17.03.00: Package version for package fwts-dbg went backwards which wo=
uld break package feeds from (0:17.03.00+git0+0153ea51cb-r0.1 to 0:17.03.00=
-r0.12) [version-going-backwards]
fwts-17.03.00: Package version for package fwts-dev went backwards which wo=
uld break package feeds from (0:17.03.00+git0+0153ea51cb-r0.1 to 0:17.03.00=
-r0.12) [version-going-backwards]
fwts-17.03.00: Package version for package fwts-doc went backwards which wo=
uld break package feeds from (0:17.03.00+git0+0153ea51cb-r0.1 to 0:17.03.00=
-r0.12) [version-going-backwards]
fwts-17.03.00: Package version for package fwts-locale went backwards which=
 would break package feeds from (0:17.03.00+git0+0153ea51cb-r0.1 to 0:17.03=
=2E00-r0.12) [version-going-backwards]
fwts-17.03.00: Package version for package fwts-staticdev went backwards wh=
ich would break package feeds from (0:17.03.00+git0+0153ea51cb-r0.1 to 0:17=
=2E03.00-r0.12) [version-going-backwards]
fwts-17.03.00: Package version for package fwts went backwards which would =
break package feeds from (0:17.03.00+git0+0153ea51cb-r0.1 to 0:17.03.00-r0.=
12) [version-going-backwards]


count: 5	issue: host-user-contaminated
qtbase-5.9.0+gitAUTOINC+f6b36eaafe: qtbase: /qtbase-mkspecs/usr/lib/qt5/mks=
pecs/modules/qt_lib_dbus_private.pri is owned by uid 3004, which is the sam=
e as the user running bitbake. This may be due to host contamination [host-=
user-contaminated]
qtconnectivity-5.9.0+gitAUTOINC+8dcbf68e45: qtconnectivity: /qtconnectivity=
-examples/usr/share/qt5/examples/nfc/corkboard/qml_corkboard is owned by ui=
d 3004, which is the same as the user running bitbake. This may be due to h=
ost contamination [host-user-contaminated]
qtenginio-5.9.0+gitAUTOINC+0555cf73c8: qtenginio: /qtenginio-mkspecs/usr/li=
b/qt5/mkspecs/modules/qt_lib_enginio.pri is owned by uid 3004, which is the=
 same as the user running bitbake. This may be due to host contamination [h=
ost-user-contaminated]
qtquickcontrols-5.9.0+gitAUTOINC+dacb91916b: qtquickcontrols: /qtquickcontr=
ols-examples/usr/share/qt5/examples/quickcontrols/controls/filesystembrowse=
r/filesystembrowser is owned by uid 3004, which is the same as the user run=
ning bitbake. This may be due to host contamination [host-user-contaminated]
qtscxml-5.9.0+gitAUTOINC+eff82ac957: qtscxml: /qtscxml-examples/usr/share/q=
t5/examples/scxml/mediaplayer-qml-dynamic/mediaplayer-qml-dynamic.qml is ow=
ned by uid 3004, which is the same as the user running bitbake. This may be=
 due to host contamination [host-user-contaminated]


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 0	issue: ldflags


count: 0	issue: compile-host-path



=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
362f604 bitbake-user-manual: Updated INHERIT descriptions
not included in master yet:=20
de83197 world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
b35bedd oeqa/selftest: lock down Meson git revision for reliability
not included in master yet:=20
04ac4e7 v86d,qemuboot-x86.inc: use KERNEL_MODULE_AUTOLOAD+KERNEL_MODULE_PRO=
BECONF for uvesafb instead of fbsetup init script
59498e6 Revert "mesa: Contain configure search for llvm"
1ac2d98 report-error: Allow to upload reports automatically
9e37669 buildhistory.bbclass: metadata-revs show repo parent
1109759 metadata-revs: provide more information
8e709bc sstate-sysroot-cruft.sh: Extend the whitelist
3dae819 python-3.5: add runtime dependency from python3-compression on pyth=
on3-misc
7afb705 package_manager: flush installed_pkgs file before oe-pkgdata-util u=
ses it
d63d59a sstate-diff-machines.sh: Replace MACHINE_ARCH only at the beginning=
 and separated with dash
6b09dd7 recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=3D=
mode,links"
ebd06c7 qemux86: Add identical qemux86copy variant for tests

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
41cf832 Revert "rrdtool: add gettext-native dependency"
not included in master yet:=20
cc5a88b dnsmasq: disable the service by default
af0e898 freeradius: add new recipe
a33253b keepalived: add new recipe
d41da07 vblade: update to version 22
3901693 geoipupdate: 2.2.2 -> 2.3.1
1df0a78 ifenslave: 2.7 -> 2.9
b3e671b drbd-utils: remove /var/lock to avoid conflict
cf6a407 wireguard: bump version to latest snapshot 0.0.20170517
03ffad0 opensaf: Add -latomic to LDFLAGS
13c2cd9 open-isns: fix QA issue
1dfe1c8 dante: fix unknown-configure-option QA issue
f87d970 snort: enable static daq
eb8c04f net-snmp: supported cross compile for the perl embedded and perl mo=
dules
6b353b7 traceroute: Move manual pages from mandir to man8 under it
f13b3a2 nopoll: Disable doc generation
b24809a cifs-utils 6.6 -> 6.7
0820c7a gpsd: don't compile with gold
1f3d8d2 gpsd: update to 3.16
7776141 libupnp: Upgrade 1.6.19 -> 1.6.21
400e68e libmicrohttpd: update to version 0.9.55
a916af5 nginx: depend on zlib instead of gzip
43772a9 poco: make cmake packages relocatable
0a50ece python-greenlet: Add support for python3
2bb4d40 python-msgpack: Add support for python3
330d5d3 python-gevent: Add support for python3
4d561a1 python-gsocketpool: Add support for python3
a36ac43 python-mprpc: Add support for python3
751423b python-netaddr: Add support for python3
91a19a9 python-pyroute: Add support for python3
b491a15 fuse: update 2.9.4 to 2.9.7
32a707f openvpn: Upgrade 2.3.9 -> 2.4.2
e174d7e audiofile: Inherit pkgconfig instead of binconfig
c5db97b python-cffi: Upgrade to 1.10.0
2178eea onboard: Upgrade to 1.4.1
3a4dd92 leveldb: Update to 1.20
34679d6 konkretcmpi: Update and fix build with latest oe-core
956e157 proftpd: Update to 1.3.6 release
fcc7960 umip: fix for parallel compilation
b27e61c umip: add systemd and sysvinit support
f652b0c umip: fix EXTRA_OECONF and add RRECOMMENDS
f1f2804 caps: Fix buld with -pie
fd8720e python-numeric: Fix build with musl
3a5bb49 openipmi: Fix build with musl
8e81781 samba: Fix build with musl
87439fd xterm: 325 -> 327
87306a0 zsh: update to 5.3.1
f87130e srecord: add collection of tools for manipulating EPROM load files
1b192b8 recipes: remove blacklisted recipes

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
6605c48 python-pyqt5: Add recipe.
not included in master yet:=20
1b75620 Upgrade to Qt 5.9.0

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
880a7bd Revert "firefox: Use system-wide cairo instead of built-in one"
not included in master yet:=20
05e7482 gnome-settings-daemon: remove the bbappend for removed recipe
a7b0b40 firefox-l10n.inc: mangle download filename instead of DL_DIR

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
latest upstream commit:=20
9d0376d packagegroup-luneos-extended: drop qtscenegraph-adaptation
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
e93ba06 libshr-glib: blacklist because of random failures
not included in master yet:=20
26c0423 meta-shr, meta-fso: remove blacklisted recipes
544fa7a libsensmon: blacklist due to newer vala incompatibility

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWTksPQAKCRA3VSO3ZXaA
HGTHAJ0eIcsgBsB9ylx2d2E0RoWcOfTotgCgtJAbQTXMSwptrJUPTTLwGrl4Eyw=
=jNUk
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--
