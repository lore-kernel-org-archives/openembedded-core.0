Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1DF7677527;
	Mon, 26 Jun 2017 13:16:05 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id k67so143991174wrc.2;
	Mon, 26 Jun 2017 06:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=YAk7pSgn5U4XvLQ/uZIdkgW/4eElMtKBayKlLcEKASE=;
	b=P3vJ34tw4cWgmn9P0ebudhfb++ymlpPpo9STHbT2R0kcJIFy03EyYhkl8Fs+TIj9M9
	lVvhaObRZXVZpOlT4xdCvIZYjW2NiYLR7s5jxykkIFjTVJ9sroU7yhgTJKoolxBrrz3+
	o/n14Ssic+f6syEIb4GiGl/GB+Hh6a28Y+XLHudP905R600HIoWh5G5A63PJVJd0WooN
	OFLaq7IWdKTnWK9iuFAEUnDPyu5QeBeSI1s1hMkZcLajBo0JoZQRFGwO9eoWUUsLRbMC
	LTsReTivBX+9b45eARfinjLvwemwYiq9wUj6E9+64de9kWHn0pJeRxEYDE3lIRgRVXdA
	xj6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=YAk7pSgn5U4XvLQ/uZIdkgW/4eElMtKBayKlLcEKASE=;
	b=tf140wp2QPLjLO8+KI3dyVAC9gPn/lKv7NWzKPIsruoeQ0cqx8MOhO4cj/jeRhwojD
	e0woygvh0MJ6whYTPhtgaUoEhTw6H4AWOiv/EjCiVHUW6mD4f9Yc/Bt6R7QSES5ta7Q/
	3eL/KSci6pqwi02n6na+l8Zbet6ZXEE1JMkTvHEdtTv0zvZPnKA1JaUfshvotSLvo0Ry
	Fb1uU2og1Dc4JEsOaUCKaFu3Y9CwooaQKDTFwfeWvQibC48+O8FvPL8tMnN9FkKZxFWs
	bTzkCAxE1rMFLOvS1h/xjS+ybwvtQtHBYi8QNeEjdqx2ZmBH1+m4ox5Ud7zf4N0WGTKQ
	kfqw==
X-Gm-Message-State: AKS2vOz16bvu6XfOQnTvRMjkshT2QCIqslbTko0vVd2YcjuiZ1q/l43D
	BvtG14R0WwCQKopk
X-Received: by 10.223.133.186 with SMTP id 55mr14829478wrt.102.1498482966163; 
	Mon, 26 Jun 2017 06:16:06 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id n131sm87921wmg.11.2017.06.26.06.16.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 26 Jun 2017 06:16:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 26 Jun 2017 15:16:25 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20170626131625.GA2824@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.8.3 (2017-05-23)
Subject: State of bitbake world, Failed tasks 2017-06-23
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
X-List-Received-Date: Mon, 26 Jun 2017 13:16:07 -0000
X-Groupsio-MsgNum: 99341
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Content-Disposition: inline

--GvXjxJ+pjyke8COw
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
||2017-06-23	||1	||4	||2	||0	||0		||1		||5		||0		||0		||0		||5		||0		||0		|=
|0		||0		||0		||0		||0		||=09
|}

=3D=3D Failed tasks 2017-06-23 =3D=3D

INFO: jenkins-job.sh-1.8.23 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/rocko/log.report.20170626_030939.log

=3D=3D=3D common (0) =3D=3D=3D

=3D=3D=3D common-x86 (2) =3D=3D=3D
    * meta-qt5/recipes-qt/qt5/qtwebengine_git.bb:do_compile
    * openembedded-core/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb:d=
o_compile_ptest_base

=3D=3D=3D qemuarm (1) =3D=3D=3D
    * meta-openembedded/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb=
:do_compile

=3D=3D=3D qemux86 (2) =3D=3D=3D
    * meta-openembedded/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb=
:do_configure
    * meta-openembedded/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb:do_c=
onfigure

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (7) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 1	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/l=
og.world.qemuarm.20170622_041724.log/ || http://errors.yoctoproject.org/Err=
ors/Build/39973/
|-
|| qemux86 	|| 4	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/l=
og.world.qemux86.20170622_041725.log/ || http://errors.yoctoproject.org/Err=
ors/Build/39975/
|-
|| qemux86_64 	|| 2	 || http://logs.nslu2-linux.org/buildlogs/oe/world/rock=
o/log.world.qemux86-64.20170623_075238.log/ || http://errors.yoctoproject.o=
rg/Errors/Build/40160/
|}

=3D=3D=3D PNBLACKLISTs (15) =3D=3D=3D

=3D=3D=3D QA issues (11) =3D=3D=3D
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
||0	||version-going-backwards
|-
||1	||libdir
|-
||5	||host-user-contaminated
|-
||5	||textrel
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.sign=
atures.20170623_034040.log/


    * ERROR: Nothing PROVIDES 'numactl' (but /home/jenkins/oe/world/shr-cor=
e/meta-openembedded/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb DEPENDS =
on or otherwise requires it)
    * ERROR: numactl was skipped: incompatible with host arm-oe-linux-gnuea=
bi (not in COMPATIBLE_HOST)
    * ERROR: Required build target 'meta-world-pkgdata' has no buildable pr=
oviders.


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


count: 5	issue: host-user-contaminated
qt5-creator-3.5.1: qt5-creator: /qt5-creator/usr/lib/qt5/qtcreator/plugins/=
libCVS.so is owned by uid 3004, which is the same as the user running bitba=
ke. This may be due to host contamination [host-user-contaminated]
qtbase-5.9.0+gitAUTOINC+f6b36eaafe: qtbase: /qtbase-examples/usr/share/qt5/=
examples/widgets/tutorials/addressbook/part1/part1.pro is owned by uid 3004=
, which is the same as the user running bitbake. This may be due to host co=
ntamination [host-user-contaminated]
qtlocation-5.9.0+gitAUTOINC+888d351cb0_d45c177e8a: qtlocation: /qtlocation-=
examples/usr/share/qt5/examples/location/planespotter/planespotter.qml is o=
wned by uid 3004, which is the same as the user running bitbake. This may b=
e due to host contamination [host-user-contaminated]
qtsystems-5.9.0+gitAUTOINC+434af789f0: qtsystems: /qtsystems-examples/usr/s=
hare/qt5/examples/systeminfo/qml-battery/qml-battery.qml is owned by uid 30=
04, which is the same as the user running bitbake. This may be due to host =
contamination [host-user-contaminated]
qtsystems-5.9.0+gitAUTOINC+434af789f0: qtsystems: /qtsystems-examples/usr/s=
hare/qt5/examples/systeminfo/qml-deviceinfo/qml-deviceinfo.qml is owned by =
uid 3004, which is the same as the user running bitbake. This may be due to=
 host contamination [host-user-contaminated]


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 0	issue: ldflags


count: 0	issue: compile-host-path



=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
022adb3 fetch: fix handling of files with incorrect checksums from a premir=
ror
not included in master yet:=20
8888588 world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
7c36b43 kconfig-frontends: Remove as only needed for eglibc
not included in master yet:=20
03c32de v86d,qemuboot-x86.inc: use KERNEL_MODULE_AUTOLOAD+KERNEL_MODULE_PRO=
BECONF for uvesafb instead of fbsetup init script
f660369 sstate-sysroot-cruft.sh: Extend the whitelist
ee868a6 report-error: Allow to upload reports automatically
5f11319 buildhistory.bbclass: metadata-revs show repo parent
db439a4 metadata-revs: provide more information
9d45c08 qemux86: Add identical qemux86copy variant for tests

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
d2da8b8 scsirastools: Upgrade to 1.6.6
not included in master yet:=20
497b816 dnsmasq: disable the service by default
0a830a0 freeradius: add new recipe
040b811 keepalived: add new recipe
336d26e vblade: update to version 22
71e432c geoipupdate: 2.2.2 -> 2.3.1
7d6fd91 ifenslave: 2.7 -> 2.9
d3efda7 drbd-utils: remove /var/lock to avoid conflict
32a3d4d wireguard: bump version to latest snapshot 0.0.20170517
69278e9 opensaf: Add -latomic to LDFLAGS
0253379 open-isns: fix QA issue
1a9df82 dante: fix unknown-configure-option QA issue
a421bca snort: enable static daq
7569545 net-snmp: supported cross compile for the perl embedded and perl mo=
dules
f187562 traceroute: Move manual pages from mandir to man8 under it
43ee939 nopoll: Disable doc generation
24923e3 cifs-utils 6.6 -> 6.7
93f1ba5 openvpn: Upgrade 2.3.9 -> 2.4.2
6477c04 proftpd: Update to 1.3.6 release
0e6f3c2 samba: Fix build with musl
f409bb8 wireshark: Upgrade to 2.2.7
dd9b43e ippool: add new recipe
f9b5de8 samba: upgrade to 4.6.5
f363161 iscsi-initiator-utils: do not regenerate prom_lex.c
56e6825 freeradius: Upgrade to 3.0.14
48b9290 vlan: Fix build with security flags turned on
1557ea2 relayd: Upgrade to latest
9f50d11 relayd: Fix build with hardening flags and glibc
b35b948 ruli: Fix build with hardening flags
213c2a9 linux-atm: Fix build with hardening flags
33b84c9 nftables: backport a few ICMP & ICMPv6 fixes
bf52b5d squid: Upgrade to 3.5.26
32e580e strongswan: 5.5.1 -> 5.5.3
a831de6 xterm: Upgrade 327 -> 330
fa964d3 hwloc: add several PACKAGECONFIG items
ac33366 recipes: remove blacklisted recipes

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
6a42ca0 qttools: DEPENDS on icu
not included in master yet:=20
65c61dd Upgrade to Qt 5.9.0

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

--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWVEIwwAKCRA3VSO3ZXaA
HPeZAJ0QrPsmZyTdSbx4wXFW+9q9XrnpcgCgiQPBWemS6NYjLQRXS9kshAV3pbg=
=A7CF
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--
