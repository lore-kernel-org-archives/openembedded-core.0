Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 9272478073;
	Wed, 24 May 2017 12:05:54 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id e127so72545136wmg.1;
	Wed, 24 May 2017 05:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=HBlDObqSB6Oqqxx1t7koDQoIKwF2WIPVjVoe8u6vVdw=;
	b=BSevqLv9MD5YRmUBLE6NfzYjTLFEwqgRaIeMsQpGhhqtA80aBcpY6SLpTGqy8HFY/X
	YNGD6AnA2RSMC/5fLuqbh3I2/C3Nva2NwqTc32CFdTjNtMaFYw+MZvVRJJs0urEOnad/
	INhG5lE6wavDQOUncUJafHAFoGjAeqrma148SwrVIGDPqYoO8njgiTa3VsPJwhbnfiiU
	54DNLbr2Z8o2hq5v1E8hRePAf2iHehUy3XHrIrX2chqUEJAYOk3wKx7nJVCgp0KKuKA5
	EPNNVcCsDL5Vz8WbU35f31udcquUD0Wh7Jnf1uuuO3P5AXJlGvbByuLCr/6e0icNw/T9
	qPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=HBlDObqSB6Oqqxx1t7koDQoIKwF2WIPVjVoe8u6vVdw=;
	b=A1hMR4+0Snf1eiIziqV508AmYaRYppVex33ecif9oR0jCK909eWDKRXl/E3NlMnjBP
	sHKFIU+oEK054fWrHh0mmJdnl0d53PNuiM2jvNv6RPKwMPYQN69B1MifLnb7hwfI1Pa6
	jlGQstCwMFs4bCaPSYW4+1nNMMaO+n/i2WkYWYsmxHCnbh0e1DQfAR/IkEHSNsSWZ1GD
	g4zLhgMaMSx875pLwTrlkYv90Q+6VQglMo8J/Vm+62Zs0eTpS7B1+6pmfVCHuZO7HSAt
	3bPJ/wLD/JWhgP6XQuTdDS4W7ARttbBlkPSXTwHKy+BnEbpyLqdkBGGIpLh7PoFFEFPH
	Q1+g==
X-Gm-Message-State: AODbwcD+tGgSnDrydsiP6Tzrj1/aTZnwiWDyA1kXSIv1TIdVOaunEOSF
	LsMQSKP/00VZloIe
X-Received: by 10.223.135.216 with SMTP id c24mr19402993wrc.109.1495627554492; 
	Wed, 24 May 2017 05:05:54 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id m17sm4423965wmi.6.2017.05.24.05.05.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 24 May 2017 05:05:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 24 May 2017 14:06:55 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20170524120655.GA3674@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.8.2 (2017-04-18)
Subject: State of bitbake world, Failed tasks 2017-05-23
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
X-List-Received-Date: Wed, 24 May 2017 12:05:55 -0000
X-Groupsio-MsgNum: 97661
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J2SCkAp4GZ/dPZZf"
Content-Disposition: inline

--J2SCkAp4GZ/dPZZf
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
||2017-05-23	||8	||10	||0	||0	||0		||0		||0		||0		||0		||31		||0		||0		||0	=
	||0		||0		||0		||0		||0		||=09
|}

=3D=3D Failed tasks 2017-05-23 =3D=3D

INFO: jenkins-job.sh-1.8.21 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/rocko/log.report.20170524_020326.log

=3D=3D=3D common (0) =3D=3D=3D

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (8) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox/firefox_45.6.0esr.bb:do_compile
    * meta-openembedded/meta-oe/recipes-devtools/meson/meson_0.40.1.bb:do_p=
atch
    * meta-openembedded/meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb:=
do_compile
    * meta-openembedded/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.=
6.bb:do_configure
    * meta-qt5/recipes-qt/qt5/qtdeclarative_git.bb:do_compile_ptest_base
    * meta-qt5/recipes-qt/qt5/qtquick1_git.bb:do_compile_ptest_base
    * meta-qt5/recipes-qt/qt5/qtxmlpatterns_git.bb:do_compile_ptest_base
    * meta-smartphone/meta-shr/recipes-shr/3rdparty/libsensmon_git.bb:do_co=
mpile

=3D=3D=3D qemux86 (2) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-support/espeak/espeak_1.48.04.bb:do=
_compile
    * meta-openembedded/meta-oe/recipes-test/fwts/fwts_git.bb:do_compile

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (18) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 8	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/l=
og.world.qemuarm.20170523_040523.log/ || http://errors.yoctoproject.org/Err=
ors/Build/37984/
|-
|| qemux86 	|| 10	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/=
log.world.qemux86.20170523_040524.log/ || http://errors.yoctoproject.org/Er=
rors/Build/37985/
|-
|| qemux86_64 	|| 0	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rock=
o/log.world.qemux86-64.20170523_090558.log/ ||=20
|}

=3D=3D=3D PNBLACKLISTs (13) =3D=3D=3D
=3D=3D=3D QA issues (31) =3D=3D=3D
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
||0	||libdir
|-
||0	||pkgname
|-
||0	||symlink-to-sysroot
|-
||0	||textrel
|-
||0	||unknown-configure-option
|-
||31	||version-going-backwards
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.sign=
atures.20170523_080807.log/

No issues detected

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


count: 0	issue: libdir


count: 0	issue: textrel


count: 0	issue: build-deps


count: 0	issue: file-rdeps

count: 31	issue: version-going-backwards
fbida-2.10: Package version for package fbida-dbg went backwards which woul=
d break package feeds from (0:2.10-r0.54 to 0:2.10-r0.0) [version-going-bac=
kwards]
fbida-2.10: Package version for package fbida-dbg went backwards which woul=
d break package feeds from (0:2.10-r0.58 to 0:2.10-r0.0) [version-going-bac=
kwards]
fbida-2.10: Package version for package fbida-dev went backwards which woul=
d break package feeds from (0:2.10-r0.54 to 0:2.10-r0.0) [version-going-bac=
kwards]
fbida-2.10: Package version for package fbida-dev went backwards which woul=
d break package feeds from (0:2.10-r0.58 to 0:2.10-r0.0) [version-going-bac=
kwards]
fbida-2.10: Package version for package fbida-doc went backwards which woul=
d break package feeds from (0:2.10-r0.54 to 0:2.10-r0.0) [version-going-bac=
kwards]
fbida-2.10: Package version for package fbida-doc went backwards which woul=
d break package feeds from (0:2.10-r0.58 to 0:2.10-r0.0) [version-going-bac=
kwards]
fbida-2.10: Package version for package fbida-locale went backwards which w=
ould break package feeds from (0:2.10-r0.54 to 0:2.10-r0.0) [version-going-=
backwards]
fbida-2.10: Package version for package fbida-locale went backwards which w=
ould break package feeds from (0:2.10-r0.58 to 0:2.10-r0.0) [version-going-=
backwards]
fbida-2.10: Package version for package fbida-staticdev went backwards whic=
h would break package feeds from (0:2.10-r0.54 to 0:2.10-r0.0) [version-goi=
ng-backwards]
fbida-2.10: Package version for package fbida-staticdev went backwards whic=
h would break package feeds from (0:2.10-r0.58 to 0:2.10-r0.0) [version-goi=
ng-backwards]
fbida-2.10: Package version for package fbida went backwards which would br=
eak package feeds from (0:2.10-r0.54 to 0:2.10-r0.0) [version-going-backwar=
ds]
fbida-2.10: Package version for package fbida went backwards which would br=
eak package feeds from (0:2.10-r0.58 to 0:2.10-r0.0) [version-going-backwar=
ds]
hwloc-1.11.5: Package version for package hwloc-dbg went backwards which wo=
uld break package feeds from (0:1.11.5-r0.1 to 0:1.11.5-r0.0) [version-goin=
g-backwards]
hwloc-1.11.5: Package version for package hwloc-dev went backwards which wo=
uld break package feeds from (0:1.11.5-r0.1 to 0:1.11.5-r0.0) [version-goin=
g-backwards]
hwloc-1.11.5: Package version for package hwloc-doc went backwards which wo=
uld break package feeds from (0:1.11.5-r0.1 to 0:1.11.5-r0.0) [version-goin=
g-backwards]
hwloc-1.11.5: Package version for package hwloc-locale went backwards which=
 would break package feeds from (0:1.11.5-r0.1 to 0:1.11.5-r0.0) [version-g=
oing-backwards]
hwloc-1.11.5: Package version for package hwloc-staticdev went backwards wh=
ich would break package feeds from (0:1.11.5-r0.1 to 0:1.11.5-r0.0) [versio=
n-going-backwards]
hwloc-1.11.5: Package version for package hwloc went backwards which would =
break package feeds from (0:1.11.5-r0.1 to 0:1.11.5-r0.0) [version-going-ba=
ckwards]
hwloc-1.11.5: Package version for package libhwloc went backwards which wou=
ld break package feeds from (0:1.11.5-r0.1 to 0:1.11.5-r0.0) [version-going=
-backwards]
xstdcmap-1.0.3: Package version for package xstdcmap-dbg went backwards whi=
ch would break package feeds from (0:1.0.3-r0.49 to 0:1.0.3-r0.0) [version-=
going-backwards]
xstdcmap-1.0.3: Package version for package xstdcmap-dbg went backwards whi=
ch would break package feeds from (0:1.0.3-r0.53 to 0:1.0.3-r0.0) [version-=
going-backwards]
xstdcmap-1.0.3: Package version for package xstdcmap-dev went backwards whi=
ch would break package feeds from (0:1.0.3-r0.49 to 0:1.0.3-r0.0) [version-=
going-backwards]
xstdcmap-1.0.3: Package version for package xstdcmap-dev went backwards whi=
ch would break package feeds from (0:1.0.3-r0.53 to 0:1.0.3-r0.0) [version-=
going-backwards]
xstdcmap-1.0.3: Package version for package xstdcmap-doc went backwards whi=
ch would break package feeds from (0:1.0.3-r0.49 to 0:1.0.3-r0.0) [version-=
going-backwards]
xstdcmap-1.0.3: Package version for package xstdcmap-doc went backwards whi=
ch would break package feeds from (0:1.0.3-r0.53 to 0:1.0.3-r0.0) [version-=
going-backwards]
xstdcmap-1.0.3: Package version for package xstdcmap-locale went backwards =
which would break package feeds from (0:1.0.3-r0.49 to 0:1.0.3-r0.0) [versi=
on-going-backwards]
xstdcmap-1.0.3: Package version for package xstdcmap-locale went backwards =
which would break package feeds from (0:1.0.3-r0.53 to 0:1.0.3-r0.0) [versi=
on-going-backwards]
xstdcmap-1.0.3: Package version for package xstdcmap-staticdev went backwar=
ds which would break package feeds from (0:1.0.3-r0.49 to 0:1.0.3-r0.0) [ve=
rsion-going-backwards]
xstdcmap-1.0.3: Package version for package xstdcmap-staticdev went backwar=
ds which would break package feeds from (0:1.0.3-r0.53 to 0:1.0.3-r0.0) [ve=
rsion-going-backwards]
xstdcmap-1.0.3: Package version for package xstdcmap went backwards which w=
ould break package feeds from (0:1.0.3-r0.49 to 0:1.0.3-r0.0) [version-goin=
g-backwards]
xstdcmap-1.0.3: Package version for package xstdcmap went backwards which w=
ould break package feeds from (0:1.0.3-r0.53 to 0:1.0.3-r0.0) [version-goin=
g-backwards]


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
362f604 bitbake-user-manual: Updated INHERIT descriptions
not included in master yet:=20
de83197 world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
ee55b56 cve-check-tool: backport a patch to make CVE checking work
not included in master yet:=20
5084b30 v86d,qemuboot-x86.inc: use KERNEL_MODULE_AUTOLOAD+KERNEL_MODULE_PRO=
BECONF for uvesafb instead of fbsetup init script
6aceaa0 Revert "mesa: Contain configure search for llvm"
e322e0f report-error: Allow to upload reports automatically
e21a97e buildhistory.bbclass: metadata-revs show repo parent
f2dff69 metadata-revs: provide more information
6e2dfeb sstate-sysroot-cruft.sh: Extend the whitelist
40a7d30 python-3.5: add runtime dependency from python3-compression on pyth=
on3-misc
f119672 qemux86: Add identical qemux86copy variant for tests
7620d58 recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=3D=
mode,links"
e3d67eb sstate-diff-machines.sh: Replace MACHINE_ARCH only at the beginning=
 and separated with dash
85df76e webkitgtk: Fix build for armv5

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
e231dea fbida: inherit pkgconfig and unblacklist
not included in master yet:=20
7ee71c3 libgpiod: Add new recipe
3ba08da xerces-c: fix a wrong PACKAGECONFIG option
ecdc754 dnsmasq: disable the service by default
aa1ad16 freeradius: add new recipe
0823f33 keepalived: add new recipe
fac6e01 vblade: update to version 22
a0d5e84 geoipupdate: 2.2.2 -> 2.3.1
8f3df69 ifenslave: 2.7 -> 2.9
e56b2d4 drbd-utils: remove /var/lock to avoid conflict
9f91c5c rrdtool: add gettext-native dependency
c357f3a libsexy: Added glib-2.0-native dependency and removed PNBLACKLIST
27b67e6 xstdcmap: Change libxmu from RDEPENDS -> DEPENDS and unblacklist xs=
tdcmap
19238ec wireguard: bump version to latest snapshot 0.0.20170517
3433d05 fwts: Bump SRCREV to latest past 17.03.00 release
a38dc4a espeak, espeak-data: Update to 1.48.04 release
402507a rygel: Update to 0.34.0
846a095 opencv: Make opencv-ts create share library intead of static
9dd0987 hwloc: Add
6ab1878 nginx: update development version to 1.13.0
4eb2207 nginx: update stable version to 1.12.0
954602f python-pbr: update to version 3.0.0
2d1eef2 python-werkzeug: update to version 0.12.2
50f3c84 python-zopeinterface: fixup test package
e25cf66 python3-zopeinterface: add python3 packaging
97fa771 python-jinja: update to version 2.9.6
56f24b0 python-backports-functools-lru-cache: update to version 1.4
d02c450 python-cryptography-vectors: update to version 1.8.1
185adae python-cryptography: update to version 1.8.1
f7ec026 python-markupsafe: update to version 1.0
6510d03 python-pymisp: update to version 2.4.71
e0dfe1b python-certifi: update to version 2017.4.17
480824c python-pyro4: update to version 4.59
388c102 python-psutil: update to version 5.2.2
fe86ffb libmodule-build-tiny-perl: update to version 0.039
404869f libsub-exporter-progressive-perl: update to version 0.001013
dfc659d libstrictures-perl: update to version 2.000003
3841450 libcurses-perl: update to version 1.36
8f9cd02 libcgi-perl: update to version 4.36
e0391f0 libnet-dns-perl: update to version 1.10
b9e44a5 python-cython: mangle scripts to use /usr/bin/env python
8671d70 python-sdnotify/python3-sdnotify: Add new recipe
0851504 xfce4-vala: update vala api to 0.36
133a569 libteam: Initial support
70b02c4 dbus-daemon-proxy: inherit pkgconfig, unblacklist and set package v=
ersion
fe05171 opensaf: Add -latomic to LDFLAGS
0478ed9 gd : CVE-2016-6906
0ec04d9 xf86-video-mga: add new recipe
7cdc7d3 ssiapi: add new recipe
8682002 meson: Suport for c++ cross-compilation
85b9a4e meson: Use pkgconfig-native for the native tools
1e16e4e open-isns: fix QA issue
21a12ac dante: fix unknown-configure-option QA issue
1e67a6e meson: update to version 0.40.1
89755e9 recipes: remove blacklisted recipes

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
6605c48 python-pyqt5: Add recipe.
not included in master yet:=20
627bfae qtquick1: add ptest
933f3fc qtdeclarative: add ptest
e5f48d2 qtxmlpatterns: add ptest

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
4ed7feb Merge pull request #35 from schnitzeltony/chrome-progress
not included in master yet:=20
08c4293 gnome-settings-daemon: remove the bbappend for removed recipe

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
latest upstream commit:=20
9d0376d packagegroup-luneos-extended: drop qtscenegraph-adaptation
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
e93ba06 libshr-glib: blacklist because of random failures
not included in master yet:=20
26c0423 meta-shr, meta-fso: remove blacklisted recipes


--J2SCkAp4GZ/dPZZf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWSV3TAAKCRA3VSO3ZXaA
HCnVAJ9+F1C3aqz52DxLlUsEXfdyGfEoeACdFt7wgo6BxDk34H6qu1bN+9Jkq9Y=
=V0ld
-----END PGP SIGNATURE-----

--J2SCkAp4GZ/dPZZf--
