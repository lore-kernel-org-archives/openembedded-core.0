Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f180.google.com (mail-wr0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6755060103;
	Thu, 22 Jun 2017 14:08:56 +0000 (UTC)
Received: by mail-wr0-f180.google.com with SMTP id r103so25206343wrb.0;
	Thu, 22 Jun 2017 07:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=XVMDfESgJRgxIgI0ikt0sXPz92PgpDkmQTgu8Dx1i5Y=;
	b=ol8p9zzP0BB59OkbDuN0g9K7N0aufjSBCVpJSaUhG1Us45Ra5dnCTeo8v6N9+dYug6
	Iuw1ityPhzapzY03M7hzeG3hQTFyAQSKHMuQV5iwFvxdIG8+47knFDGX2yJop51Jz9ZA
	9/F0KuP5WVai6JvtlAnRBHwmRMAa1uvt6o7qSCinrLMnYSk+bILGSsnqF+3xcaOPlX3n
	qRjZI0clCiO0NbKVKpc9iiFwJZlNpnKL5qw4FZqKqVXA2HdgtfNTQ+/3JrMrlFq6w2Lu
	3Xzjp4d42WNs6IkyMp2bfUih7Di/MSflynOlL3g6+UegIWK6haNM2CY6ZN68Z0b+dSbo
	Dl/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=XVMDfESgJRgxIgI0ikt0sXPz92PgpDkmQTgu8Dx1i5Y=;
	b=sZoze9k4qbu2HNEvKJxHwFLkq/dUyaMjtp8/lr4ec9RX2CQCHScqHPVLIg6FDyLBBQ
	dQBgi5O4TwhKVEaM29uyiT1bQFp/Nw/6jES6Az08bMyXQ2Vv4U0BHFojWf2KrKh2d46/
	4B38OBu41SowQkMteWktAiKnwTz9A6E5L9+la9Luosr6r3c+GnjrA9CbO1V6gZq64Qkm
	1IpLeDx/Xi6QCVzDhtTwNfdF1W2I4jo7JHHScehhEg7HvxSv1EbaX5THkJEiDLBK/P6Y
	GWM21cxYYNyrkAh7sc4WZuZ9NMYC6XOFbupbkgvK0wulDvHzPnlw3Ah6u2nE/rgwQmor
	aCbQ==
X-Gm-Message-State: AKS2vOzWUcnQe/LxLwHa/CFxjDg4ilXmxiFyY3KIgGyVlulXlmDApDyv
	SURzGTukhREOJHR4
X-Received: by 10.28.109.18 with SMTP id i18mr1956000wmc.97.1498140536774;
	Thu, 22 Jun 2017 07:08:56 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	139sm1477087wmw.15.2017.06.22.07.08.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 22 Jun 2017 07:08:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 22 Jun 2017 16:09:08 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20170622140908.GA2792@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.8.3 (2017-05-23)
Subject: State of bitbake world, Failed tasks 2017-06-21
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
X-List-Received-Date: Thu, 22 Jun 2017 14:08:57 -0000
X-Groupsio-MsgNum: 99235
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline

--qMm9M+Fa2AknHoGS
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
||2017-06-21	||1	||3	||3	||0	||0		||0		||0		||0		||0		||0		||0		||0		||0		|=
|0		||0		||0		||0		||0		||=09
|}

=3D=3D Failed tasks 2017-06-21 =3D=3D

INFO: jenkins-job.sh-1.8.23 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/rocko/log.report.20170621_073603.log

=3D=3D=3D common (0) =3D=3D=3D

=3D=3D=3D common-x86 (3) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-support/ipmiutil/ipmiutil_3.0.5.bb:=
do_install
    * meta-qt5/recipes-qt/qt5/qtwebengine_git.bb:do_compile
    * openembedded-core/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb:d=
o_compile_ptest_base

=3D=3D=3D qemuarm (1) =3D=3D=3D
    * meta-openembedded/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb=
:do_compile

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (7) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 1	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/l=
og.world.qemuarm.20170620_223531.log/ || http://errors.yoctoproject.org/Err=
ors/Build/39906/
|-
|| qemux86 	|| 3	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/l=
og.world.qemux86.20170620_223531.log/ || http://errors.yoctoproject.org/Err=
ors/Build/39907/
|-
|| qemux86_64 	|| 3	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rock=
o/log.world.qemux86-64.20170621_002606.log/ || http://errors.yoctoproject.o=
rg/Errors/Build/39913/
|}

=3D=3D=3D PNBLACKLISTs (15) =3D=3D=3D

=3D=3D=3D QA issues (0) =3D=3D=3D
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
||0	||version-going-backwards
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.sign=
atures.20170621_001941.log/

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


count: 0	issue: libdir


count: 0	issue: textrel


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
7b4e817 bitbake-user-manual: Updated BBLAYERS_FETCH_DIR variable description
not included in master yet:=20
4e7603f world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
1d9a88f ovmf: fix secureboot PACKAGECONFIG + OpenSSL update
not included in master yet:=20
848893d v86d,qemuboot-x86.inc: use KERNEL_MODULE_AUTOLOAD+KERNEL_MODULE_PRO=
BECONF for uvesafb instead of fbsetup init script
645cace sstate-sysroot-cruft.sh: Extend the whitelist
ec4fab2 report-error: Allow to upload reports automatically
1284cd0 buildhistory.bbclass: metadata-revs show repo parent
b84b7e7 metadata-revs: provide more information
2babc63 qemux86: Add identical qemux86copy variant for tests

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
bc94e43 python-setuptools-scm: update to version 1.15.6
not included in master yet:=20
1dd769c dnsmasq: disable the service by default
24c4d75 freeradius: add new recipe
cbe28d1 keepalived: add new recipe
b204d53 vblade: update to version 22
34514bd geoipupdate: 2.2.2 -> 2.3.1
baefcda ifenslave: 2.7 -> 2.9
fa3eb31 drbd-utils: remove /var/lock to avoid conflict
2c5cb10 wireguard: bump version to latest snapshot 0.0.20170517
b877693 opensaf: Add -latomic to LDFLAGS
d0e32e8 open-isns: fix QA issue
44ff19c dante: fix unknown-configure-option QA issue
4753638 snort: enable static daq
41cd6e5 net-snmp: supported cross compile for the perl embedded and perl mo=
dules
44b00b3 traceroute: Move manual pages from mandir to man8 under it
0d8b4c1 nopoll: Disable doc generation
436138c cifs-utils 6.6 -> 6.7
47ef9cf openvpn: Upgrade 2.3.9 -> 2.4.2
743e42e proftpd: Update to 1.3.6 release
ef65126 samba: Fix build with musl
bf4e84b wireshark: Upgrade to 2.2.7
075fb56 ippool: add new recipe
bbcf73e libdevmapper: sync with lvm2 2.02.171
5970dba samba: upgrade to 4.6.5
afe2433 iscsi-initiator-utils: do not regenerate prom_lex.c
7b43332 freeradius: Upgrade to 3.0.14
4f742e3 vlan: Fix build with security flags turned on
7d82921 relayd: Upgrade to latest
0d4364f relayd: Fix build with hardening flags and glibc
d411fd2 ruli: Fix build with hardening flags
6f5ea3a bdwgc: add a recipe from oe-core
5eaf255 linux-atm: Fix build with hardening flags
97426d4 sqlite: Fix build with hardening flags
e3ce864 xmlstarlet: Update to 1.6.1
73fc482 nftables: backport a few ICMP & ICMPv6 fixes
62b0dfc xfsprogs: Remove .la files in ${libdir}
47b19e0 squid: Upgrade to 3.5.26
2154508 scsirastools: Upgrade to 1.6.6
5209e91 gitver: skip packages instead of panic()ing if ${GITVER} fails to e=
xpand
c19042b makedumpfile: Fix build with hardening
a131103 python-pylint: adds Python3 support
c957274 python-isort: adds Python3 support
6ee7c27 python-lazy-object-proxy: adds Python3 support
c4944d6 python-astroid: adds Python3 support
533e156 python-wrapt: adds Python3 support
7d8c8da ipmiutil: Upgrade to 3.0.5
4963260 zabbix: 3.0.8 -> 3.0.9
96bcc82 kexecboot: update recipe to master on github (4c4f127)
dffb47f recipes: remove blacklisted recipes

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
3ae86cb qtbase: respect "ld-is-gold" DISTRO_FEATURES
not included in master yet:=20
e1a7b1c Upgrade to Qt 5.9.0
bc3c3f5 qttools: DEPENDS on icu

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
6edb458 firefox: fix build with gcc7
not included in master yet:=20
2a76650 gnome-settings-daemon: remove the bbappend for removed recipe

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
latest upstream commit:=20
47091c6 ofono: Use Mer's 1.19 and include fix
not included in master yet:=20
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

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWUvNnQAKCRA3VSO3ZXaA
HEwbAJ9+4W2Pz3K+cfSPAvOtV2/H7dnLOgCfRvcU1g56Qf3dx4yzPron/MjuxOA=
=eJLU
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
