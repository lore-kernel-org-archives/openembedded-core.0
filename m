Return-Path: <martin.jansa@gmail.com>
Received: from mail-yb0-f175.google.com (mail-yb0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0EB9578280;
	Sat,  1 Jul 2017 14:27:31 +0000 (UTC)
Received: by mail-yb0-f175.google.com with SMTP id e201so45456097ybb.1;
	Sat, 01 Jul 2017 07:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=XlBJIA0xhJivkImdC7VWoXqgPaN9gOqUlrp2I4wvYiw=;
	b=fVtnbNbSwtquPPO4jVmc1zYdNqXn8wQZbakTZdi/h54yG/Iv7WgvINxe0fvR9YFk8v
	rbbyIuX5lTduiyeVMgpc7lHmambuBmuvGIS86DWF388V3kE0yt2RF2oWfHYFdfdxSePs
	8BWzANwIw9GSdV1Yj8+yvPliOetZXlPjkVPevZc6y1RhHUE/Qvtf1eu918E/YLsNWrPN
	vTsqBOL86Cvu06AIKSdF6okkochpJKjYVJ841J/n+Oko7SE/Mhl0+7kxFZ2UbcOvofVk
	bOo70jx+PB9ywa6mVy5SXnU1kLEKa3sxtu5phbe+rED8KnC5EEQ5kEP2m7ZoOBV97wfF
	3pGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=XlBJIA0xhJivkImdC7VWoXqgPaN9gOqUlrp2I4wvYiw=;
	b=N1US0wNohAeUqNG/2D4lC/rlXWZXZFyTiO4XB0pCT27eq1+NtS4kNYca6YZhwTvgjH
	YU48Uz3CGzH7I2PXRU9r6aTFMzDyDW2bIZUC0CZ5wKREAxTnVjA6OgMpW8LjHSIBTDw9
	gYbMLjK03XYnpmam40d+zqpMyN40/a/E62SDOMNMLEZiKpJpCSrdcYoBcWgID9y21rPf
	bIeq5zk8cfwxbOThSX4eTGOrUUWCSqYYs57WiTnrOf4y8WRSfM49R8jq2yKLTE3FaxjT
	N5ZHghAr6zUZ1TOBcOQ+tEb7a1+fMOAIn74FYwHIMeLPkojDfwBXLpJ8/vqyUttlCOhD
	2MDQ==
X-Gm-Message-State: AKS2vOzlWA6wBnEDOe8qWN4gClqSa72Q1G5YK7cTU354CNOjoHRblGxV
	3gQN0okOfbTt1u5CJR9lPdEWhdnu76AG
X-Received: by 10.37.228.70 with SMTP id b67mr20612998ybh.28.1498919252674;
	Sat, 01 Jul 2017 07:27:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.181.204 with HTTP; Sat, 1 Jul 2017 07:27:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 1 Jul 2017 16:27:32 +0200
Message-ID: <CA+chaQfDRpDG3Ui7r+-w2akjf26LohYGfSKLSMDh29dh+i54iw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Print all In new window State of bitbake world, Failed tasks 2017-06-29
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
X-List-Received-Date: Sat, 01 Jul 2017 14:27:32 -0000
Content-Type: multipart/alternative; boundary="001a114e1a989a4d4c0553425583"

--001a114e1a989a4d4c0553425583
Content-Type: text/plain; charset="UTF-8"

http://www.openembedded.org/wiki/Bitbake_World_Status

== Number of issues - stats ==
{| class='wikitable'
!|Date		     !!colspan='3'|Failed tasks			    !!|Signatures		
!!colspan='14'|QA !!Comment
|-
||		||qemuarm	||qemux86	||qemux86_64	||all
	||already-stripped	||libdir	||textrel	||build-deps	||file-rdeps	||version-going-backwards	||host-user-contaminated	||installed-vs-shipped	||unknown-configure-option	||symlink-to-sysroot	||invalid-pkgconfig	||pkgname	||ldflags	||compile-host-path	||
|-

||2017-06-29	||2	||2	||4	||0	||0		||1		||5		||0		||0		||0		||10		||0		||0		||0		||0		||0		||0		||0		||
|}

== Failed tasks 2017-06-29 ==

INFO: jenkins-job.sh-1.8.24 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170630_215543.log

=== common (0) ===

=== common-x86 (2) ===
    * meta-qt5/recipes-qt/qt5/qtwebengine_git.bb:do_compile
    * openembedded-core/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb:do_compile_ptest_base

=== qemuarm (2) ===
    * meta-openembedded/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb:do_compile
    * meta-openembedded/meta-oe/recipes-graphics/gegl/gegl_0.3.4.bb:do_compile

=== qemux86 (0) ===

=== qemux86_64 (1) ===
    * meta-openembedded/meta-oe/recipes-extended/fluentbit/fluentbit_0.11.11.bb:do_compile

=== Number of failed tasks (8) ===
{| class=wikitable
|-
|| qemuarm 	|| 2	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.20170628_053920.log/
|| http://errors.yoctoproject.org/Errors/Build/40399/
|-
|| qemux86 	|| 2	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.20170628_053047.log/
|| http://errors.yoctoproject.org/Errors/Build/40403/
|-
|| qemux86_64 	|| 4	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20170629_072110.log/
|| http://errors.yoctoproject.org/Errors/Build/40436/
|}

=== PNBLACKLISTs (15) ===

=== QA issues (16) ===
{| class=wikitable
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
||10	||host-user-contaminated
|-
||1	||libdir
|-
||5	||textrel
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.signatures.20170629_041658.log/

No issues detected


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACKLIST[lksctp-tools]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "BROKEN:
fails to link against sctp_connectx symbol", '', d)}"
meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb:PNBLACKLIST[bluez-hcidump]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5
conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '',
d)}"
meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb:PNBLACKLIST[bluez4]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5
conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '',
d)}"
meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb:PNBLACKLIST[gst-plugin-bluetooth]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5
conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '',
d)}"
meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb:PNBLACKLIST[libdbus-c++]
?= "Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/130644/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb:PNBLACKLIST[libsexy]
?= "Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/130607/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb:PNBLACKLIST[xf86-video-geode]
?= "BROKEN, fails to build - the recipe will be removed on 2017-09-01
unless the issue is fixed"
meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb:PNBLACKLIST[foxtrotgps]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5
conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '',
d)}"
meta-oe/recipes-navigation/gypsy/gypsy.inc:PNBLACKLIST[gypsy] ?=
"${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts
with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-navigation/navit/navit.inc:PNBLACKLIST[navit] ?=
"${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts
with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb:PNBLACKLIST[libsyncml]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5
conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '',
d)}"
meta-qt5:
meta-smartphone:
meta-shr/recipes-shr/3rdparty/libsensmon_git.bb:PNBLACKLIST[libsensmon]
?= "BROKEN: not compatible with newer vala,
http://errors.yoctoproject.org/Errors/Details/143058/"
meta-shr/recipes-shr/3rdparty/omhacks_git.bb:PNBLACKLIST[omhacks] ?=
"Not compatible with gcc7 - the recipe will be removed on 2017-09-01
unless the issue is fixed"
meta-webos-ports:
meta-luneos/recipes-luneos/luna-webappmanager/luna-webappmanager.bb:PNBLACKLIST[luna-webappmanager]
?= "BROKEN: needs to be adapted to new qt-5.7"
meta-luneui/recipes-luneui/luna-next/luna-next.bb:PNBLACKLIST[luna-next]
?= "BROKEN: needs to be adapted to new qtwayland-5.7"
PNBLACKLIST[android-system] = "depends on lxc from
meta-virtualiazation which isn't included in my world builds"
PNBLACKLIST[bigbuckbunny-1080p] = "big and doesn't really need to be
tested so much"
PNBLACKLIST[bigbuckbunny-480p] = "big and doesn't really need to be
tested so much"
PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be
tested so much"
PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be
tested so much"
PNBLACKLIST[tearsofsteel-1080p] = "big and doesn't really need to be
tested so much"
PNBLACKLIST[build-appliance-image] = "tries to include whole downloads
directory in /home/builder/poky :/"
PNBLACKLIST[linux-yocto-tiny-kexecboot] = "does weird sh!t breaking
other kernels and modules - broken for years"
PNBLACKLIST[linux-yocto-tiny] = "does weird sh!t breaking other
kernels and modules - broken for years"


QA issues by type:
count: 0	issue: already-stripped


count: 1	issue: libdir
qwt-qt5-dbg: found library in wrong location:
/usr/plugins/designer/.debug/libqwt_designer_plugin.so [libdir]


count: 5	issue: textrel
chromium-54.0.2810.2: ELF binary
'/tmp/work/i586-oe-linux/chromium/54.0.2810.2-r0/packages-split/chromium/usr/bin/chromium/chrome'
has relocations in .text [textrel]
chromium-wayland-53.0.2785.143: ELF binary
'/tmp/work/i586-oe-linux/chromium-wayland/53.0.2785.143-r0/packages-split/chromium-wayland/usr/bin/chromium/chrome'
has relocations in .text [textrel]
corosync-2.4.2: ELF binary
'/tmp/work/core2-64-oe-linux/corosync/2.4.2-r0/packages-split/corosync/usr/sbin/corosync'
has relocations in .text [textrel]
mpeg2dec-0.5.1: ELF binary
'/tmp/work/armv5te-oe-linux-gnueabi/mpeg2dec/0.5.1-r0/packages-split/libmpeg2/usr/lib/libmpeg2.so.0.1.0'
has relocations in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary
'/tmp/work/i586-oe-linux/x264/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264/usr/lib/libx264.so.148'
has relocations in .text [textrel]


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 0	issue: version-going-backwards


count: 10	issue: host-user-contaminated
glibc-locale-2.25: glibc-locale:
/glibc-binary-localedata-el-cy/usr/lib/locale/el_CY/LC_COLLATE is
owned by uid 3004, which is the same as the user running bitbake. This
may be due to host contamination [host-user-contaminated]
glibc-locale-2.25: glibc-locale:
/glibc-binary-localedata-fr-fr/usr/lib/locale/fr_FR/LC_CTYPE is owned
by uid 3004, which is the same as the user running bitbake. This may
be due to host contamination [host-user-contaminated]
glibc-locale-2.25: glibc-locale:
/glibc-binary-localedata-kw-gb/usr/lib/locale/kw_GB/LC_CTYPE is owned
by uid 3004, which is the same as the user running bitbake. This may
be due to host contamination [host-user-contaminated]
libqofono-0.87+gitrAUTOINC+54435de3be: libqofono:
/libqofono-tests/usr/lib/libqofono-qt5/tests/tst_qofonocallforwarding
is owned by uid 3004, which is the same as the user running bitbake.
This may be due to host contamination [host-user-contaminated]
qtbase-5.9.0+gitAUTOINC+f6b36eaafe: qtbase:
/qtbase-examples/usr/share/qt5/examples/opengl/paintedwindow/paintedwindow.pro
is owned by uid 3004, which is the same as the user running bitbake.
This may be due to host contamination [host-user-contaminated]
qtbase-5.9.0+gitAUTOINC+f6b36eaafe: qtbase:
/qtbase-staticdev/usr/lib/libQt5FbSupport.a is owned by uid 3004,
which is the same as the user running bitbake. This may be due to host
contamination [host-user-contaminated]
qtquick1-5.9.0+gitAUTOINC+695460401d: qtquick1:
/qtquick1-examples/usr/share/qt5/examples/declarative/righttoleft/layoutdirection/layoutdirection
is owned by uid 3004, which is the same as the user running bitbake.
This may be due to host contamination [host-user-contaminated]
qtquick1-5.9.0+gitAUTOINC+695460401d: qtquick1:
/qtquick1-qmlplugins/usr/lib/qt5/imports/Qt/labs/particles/qmldir is
owned by uid 3004, which is the same as the user running bitbake. This
may be due to host contamination [host-user-contaminated]
qtscxml-5.9.0+gitAUTOINC+eff82ac957: qtscxml:
/qtscxml-examples/usr/share/qt5/examples/scxml/invoke-dynamic/invoke-dynamic.qml
is owned by uid 3004, which is the same as the user running bitbake.
This may be due to host contamination [host-user-contaminated]
qtwebchannel-5.9.0+gitAUTOINC+6383f0fc5e: qtwebchannel:
/qtwebchannel-examples/usr/share/qt5/examples/webchannel/qwclient/package.json
is owned by uid 3004, which is the same as the user running bitbake.
This may be due to host contamination [host-user-contaminated]


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 0	issue: ldflags


count: 0	issue: compile-host-path



== Tested changes (not included in master yet) - bitbake ==

latest upstream commit:
22cc318 bitbake-selftest: add bb.tests.event to bitbake-selftest
not included in master yet:
37cf5c3 world-image: add extra target

== Tested changes (not included in master yet) - openembedded-core ==

latest upstream commit:
179b7ae meta/conf/layer.conf: bump layer version for LSB changes
not included in master yet:
3c5e801 v86d,qemuboot-x86.inc: use
KERNEL_MODULE_AUTOLOAD+KERNEL_MODULE_PROBECONF for uvesafb instead of
fbsetup init script
95776ae report-error: Allow to upload reports automatically
3ba4f5c buildhistory.bbclass: metadata-revs show repo parent
4ac7dce metadata-revs: provide more information
4429765 qemux86: Add identical qemux86copy variant for tests

== Tested changes (not included in master yet) - meta-openembedded ==

latest upstream commit:
d2da8b8 scsirastools: Upgrade to 1.6.6
not included in master yet:
497b816 dnsmasq: disable the service by default
0a830a0 freeradius: add new recipe
040b811 keepalived: add new recipe
336d26e vblade: update to version 22
808a638 ifenslave: 2.7 -> 2.9
ae4ea13 drbd-utils: remove /var/lock to avoid conflict
0ef0587 wireguard: bump version to latest snapshot 0.0.20170517
8fa84d5 opensaf: Add -latomic to LDFLAGS
b680590 open-isns: fix QA issue
6233739 dante: fix unknown-configure-option QA issue
4661339 snort: enable static daq
6c0d9a3 net-snmp: supported cross compile for the perl embedded and perl modules
2e7e5d5 traceroute: Move manual pages from mandir to man8 under it
d942a51 nopoll: Disable doc generation
517cf0e cifs-utils 6.6 -> 6.7
a07f706 openvpn: Upgrade 2.3.9 -> 2.4.2
bf1557c proftpd: Update to 1.3.6 release
f172d6e samba: Fix build with musl
5aee814 wireshark: Upgrade to 2.2.7
df960d1 ippool: add new recipe
7897063 samba: upgrade to 4.6.5
b58c317 iscsi-initiator-utils: do not regenerate prom_lex.c
587e252 freeradius: Upgrade to 3.0.14
0fda6a5 vlan: Fix build with security flags turned on
51ef932 relayd: Upgrade to latest
951daf5 relayd: Fix build with hardening flags and glibc
6db8dd3 linux-atm: Fix build with hardening flags
8a4bde1 nftables: backport a few ICMP & ICMPv6 fixes
44eca9a squid: Upgrade to 3.5.26
c82bbc0 strongswan: 5.5.1 -> 5.5.3
2674a43 xterm: Upgrade 327 -> 330
a73df1d twisted: add support to build for python3
f8635da rdate: add new recipe
a237b36 rdist: add new recipe
18dd8d0 01/17] add open-vm-tools recipe
d9fc187 02/17] open-vm-tools: add missing pkgconfig dependency
89d8d3e 03/17] open-vm-tools: add missing glib-2.0-native dependency
4fcf22a 04/17] open-vm-tools: clarify and expand licensing
ffa641f 05/17] open-vm-tools: base_contains --> bb.utils.contains
b15f1c7 06/17] open-vm-tools: update version to 10.1.5
5c54728 07/17] open-vm-tools: don't use mspack
a253650 08/17] open-vm-tools: don't use dnet-config
482e14d 09/17] open-vm-tools: add #include to fix build break
3dedadd 10/17] open-vm-tools: add missing X11 dependencies
15aa4c6 11/17] open-vm-tools: remove kernel module logic
59a7ab5 12/17] open-vm-tools: line up configure options
791caaf 13/17] open-vm-tools: support FUSE
622d3be 14/17] open-vm-tools: scope build to only x86
e905811 15/17] open-vm-tools: style changes
873d2aa 16/17] open-vm-tools: fix all hardcoded paths
358852d 17/17] open-vm-tools: remove -Wno-error
753abab glmark2: update to latest
85e7415 live555: Define XLOCALE_NOT_USED for glibc too
6020e5c squid: Fix build with hardening
4771ae5 gpm: Use sigemptyset() API for glibc as well
8184191 ssiapi: Fix build with hardening flags
93e8807 crash: Upgrade to 7.1.9
3a5e7b7 snort: fix for snort.conf
b3a19c0 xfsprogs: remove redundant install rule in do_install
0bf1c84 geoipupdate 2.2.2 -> 2.4.0
3dedb8f ruli: Fix build with hardening flags
b76e398 ruli: FIx build with hardening flags
6cc8244 recipes: remove blacklisted recipes

== Tested changes (not included in master yet) - meta-qt5 ==

latest upstream commit:
2940d84 Revert "qttools: DEPENDS on icu"
not included in master yet:
0755c79 Upgrade to Qt 5.9.0
93fa261 libconnman-qt5: update to 1.1.10
88e5216 qtwebengine: add PACKAGECONFIG for webrtc

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
6edb458 firefox: fix build with gcc7
not included in master yet:
2a76650 gnome-settings-daemon: remove the bbappend for removed recipe

== Tested changes (not included in master yet) - meta-webos-ports ==

latest upstream commit:
47091c6 ofono: Use Mer's 1.19 and include fix
not included in master yet:
d23aeb0 mesa: remove --with-llvm-prefix in meta-luneui instead of meta-luneos
47ebb4f README: update to depend on master branches
29413ad qtbase: enable fontconfig
a457d20 qtwayland, qtwebengine: use webOS-ports/master-next branch
compatible with 5.7
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

== Tested changes (not included in master yet) - meta-smartphone ==
latest upstream commit:
f305d9f omhacks: blacklist
not included in master yet:
54aff16 meta-shr, meta-fso: remove blacklisted recipes

--001a114e1a989a4d4c0553425583
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><pre id=3D"gmail-out" class=3D"gmail-console-output" style=
=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-=
top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px"><pre style=3D=
"box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top=
:0px;margin-bottom:0px"><a href=3D"http://www.openembedded.org/wiki/Bitbake=
_World_Status" style=3D"box-sizing:border-box;word-wrap:break-word;color:rg=
b(92,53,102)">http://www.openembedded.org/wiki/Bitbake_World_Status</a>

=3D=3D Number of issues - stats =3D=3D
{| class=3D&#39;wikitable&#39;
!|Date		     !!colspan=3D&#39;3&#39;|Failed tasks			    !!|Signatures		  !!=
colspan=3D&#39;14&#39;|QA !!Comment
|-
||		||qemuarm	||qemux86	||qemux86_64	||all 	||already-stripped	||libdir	||t=
extrel	||build-deps	||file-rdeps	||version-going-backwards	||host-user-cont=
aminated	||installed-vs-shipped	||unknown-configure-option	||symlink-to-sys=
root	||invalid-pkgconfig	||pkgname	||ldflags	||compile-host-path	||=09
|-
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">||2017-06-29	||2	||2	||4	||0	||0=
		||1		||5		||0		||0		||0		||10		||0		||0		||0		||0		||0		||0		||0		||=09
|}

=3D=3D Failed tasks 2017-06-29 =3D=3D

INFO: jenkins-job.sh-1.8.24 Complete log available at <a href=3D"http://log=
s.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170630_215543.log" =
style=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">h=
ttp://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170630_215=
543.log</a>

=3D=3D=3D common (0) =3D=3D=3D

=3D=3D=3D common-x86 (2) =3D=3D=3D
    * meta-qt5/recipes-qt/qt5/qtwebengine_git.bb:do_compile
    * openembedded-core/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb:d=
o_compile_ptest_base

=3D=3D=3D qemuarm (2) =3D=3D=3D
    * meta-openembedded/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb=
:do_compile
    * meta-openembedded/meta-oe/recipes-graphics/gegl/gegl_0.3.4.bb:do_comp=
ile

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-extended/fluentbit/fluentbit_0.11.1=
1.bb:do_compile

=3D=3D=3D Number of failed tasks (8) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 2	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld/rocko/log.world.qemuarm.20170628_053920.log/" style=3D"box-sizing:borde=
r-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.or=
g/buildlogs/oe/world/rocko/log.world.qemuarm.20170628_053920.log/</a> || <a=
 href=3D"http://errors.yoctoproject.org/Errors/Build/40399/" style=3D"box-s=
izing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://errors.y=
octoproject.org/Errors/Build/40399/</a>
|-
|| qemux86 	|| 2	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld/rocko/log.world.qemux86.20170628_053047.log/" style=3D"box-sizing:borde=
r-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.or=
g/buildlogs/oe/world/rocko/log.world.qemux86.20170628_053047.log/</a> || <a=
 href=3D"http://errors.yoctoproject.org/Errors/Build/40403/" style=3D"box-s=
izing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://errors.y=
octoproject.org/Errors/Build/40403/</a>
|-
|| qemux86_64 	|| 4	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe=
/world/rocko/log.world.qemux86-64.20170629_072110.log/" style=3D"box-sizing=
:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-li=
nux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20170629_072110.log/<=
/a> || <a href=3D"http://errors.yoctoproject.org/Errors/Build/40436/" style=
=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http:/=
/errors.yoctoproject.org/Errors/Build/40436/</a>
|}
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">=3D=3D=3D PNBLACKLISTs (15) =3D=
=3D=3D
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">=3D=3D=3D QA issues (16) =3D=3D=
=3D
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
||10	||host-user-contaminated
|-
||1	||libdir
|-
||5	||textrel
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/roc=
ko/log.signatures.20170629_041658.log/" style=3D"box-sizing:border-box;word=
-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.org/buildlog=
s/oe/world/rocko/log.signatures.20170629_041658.log/</a>

No issues detected


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACK=
LIST[lksctp-tools] ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39=
;, &#39;ld-is-gold&#39;, &quot;BROKEN: fails to link against sctp_connectx =
symbol&quot;, &#39;&#39;, d)}&quot;
meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb:PNBLACKLIST[bluez-h=
cidump] ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;blu=
ez5&#39;, &#39;bluez5 conflicts with bluez4 and bluez5 is selected in DISTR=
O_FEATURES&#39;, &#39;&#39;, d)}&quot;
meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb:PNBLACKLIST[bluez4] ?=3D=
 &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;bluez5&#39;, &#=
39;bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES&#=
39;, &#39;&#39;, d)}&quot;
meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb:PNBLACKLIS=
T[gst-plugin-bluetooth] ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURE=
S&#39;, &#39;bluez5&#39;, &#39;bluez5 conflicts with bluez4 and bluez5 is s=
elected in DISTRO_FEATURES&#39;, &#39;&#39;, d)}&quot;
meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb:PNBLACKLIST[libdbus-c++] ?=
=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctoproject.org=
/Errors/Details/130644/" style=3D"box-sizing:border-box;word-wrap:break-wor=
d;color:rgb(92,53,102)">http://errors.yoctoproject.org/Errors/Details/13064=
4/</a> - the recipe will be removed on 2017-09-01 unless the issue is fixed=
&quot;
meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb:PNBLACKLIST[libsexy] ?=
=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctoproject.org=
/Errors/Details/130607/" style=3D"box-sizing:border-box;word-wrap:break-wor=
d;color:rgb(92,53,102)">http://errors.yoctoproject.org/Errors/Details/13060=
7/</a> - the recipe will be removed on 2017-09-01 unless the issue is fixed=
&quot;
meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb:PNBLACKLIS=
T[xf86-video-geode] ?=3D &quot;BROKEN, fails to build - the recipe will be =
removed on 2017-09-01 unless the issue is fixed&quot;
meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb:PNBLACKLIST[foxtr=
otgps] ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;blue=
z5&#39;, &#39;bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO=
_FEATURES&#39;, &#39;&#39;, d)}&quot;
meta-oe/recipes-navigation/gypsy/gypsy.inc:PNBLACKLIST[gypsy] ?=3D &quot;${=
@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;bluez5&#39;, &#39;bluez5=
 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES&#39;, &#39=
;&#39;, d)}&quot;
meta-oe/recipes-navigation/navit/navit.inc:PNBLACKLIST[navit] ?=3D &quot;${=
@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;bluez5&#39;, &#39;bluez5=
 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES&#39;, &#39=
;&#39;, d)}&quot;
meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb:PNBLACKLIST[libsyncml] =
?=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;bluez5&#39;=
, &#39;bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATUR=
ES&#39;, &#39;&#39;, d)}&quot;
meta-qt5:
meta-smartphone:
meta-shr/recipes-shr/3rdparty/libsensmon_git.bb:PNBLACKLIST[libsensmon] ?=
=3D &quot;BROKEN: not compatible with newer vala, <a href=3D"http://errors.=
yoctoproject.org/Errors/Details/143058/" style=3D"box-sizing:border-box;wor=
d-wrap:break-word;color:rgb(92,53,102)">http://errors.yoctoproject.org/Erro=
rs/Details/143058/</a>&quot;
meta-shr/recipes-shr/3rdparty/omhacks_git.bb:PNBLACKLIST[omhacks] ?=3D &quo=
t;Not compatible with gcc7 - the recipe will be removed on 2017-09-01 unles=
s the issue is fixed&quot;
meta-webos-ports:
meta-luneos/recipes-luneos/luna-webappmanager/luna-webappmanager.bb:PNBLACK=
LIST[luna-webappmanager] ?=3D &quot;BROKEN: needs to be adapted to new qt-5=
.7&quot;
meta-luneui/recipes-luneui/luna-next/luna-next.bb:PNBLACKLIST[luna-next] ?=
=3D &quot;BROKEN: needs to be adapted to new qtwayland-5.7&quot;
PNBLACKLIST[android-system] =3D &quot;depends on lxc from meta-virtualiazat=
ion which isn&#39;t included in my world builds&quot;
PNBLACKLIST[bigbuckbunny-1080p] =3D &quot;big and doesn&#39;t really need t=
o be tested so much&quot;
PNBLACKLIST[bigbuckbunny-480p] =3D &quot;big and doesn&#39;t really need to=
 be tested so much&quot;
PNBLACKLIST[bigbuckbunny-720p] =3D &quot;big and doesn&#39;t really need to=
 be tested so much&quot;
PNBLACKLIST[bigbuckbunny-720p] =3D &quot;big and doesn&#39;t really need to=
 be tested so much&quot;
PNBLACKLIST[tearsofsteel-1080p] =3D &quot;big and doesn&#39;t really need t=
o be tested so much&quot;
PNBLACKLIST[build-appliance-image] =3D &quot;tries to include whole downloa=
ds directory in /home/builder/poky :/&quot;
PNBLACKLIST[linux-yocto-tiny-kexecboot] =3D &quot;does weird sh!t breaking =
other kernels and modules - broken for years&quot;
PNBLACKLIST[linux-yocto-tiny] =3D &quot;does weird sh!t breaking other kern=
els and modules - broken for years&quot;


QA issues by type:
count: 0	issue: already-stripped


count: 1	issue: libdir
qwt-qt5-dbg: found library in wrong location: /usr/plugins/designer/.debug/=
libqwt_designer_plugin.so [libdir]


count: 5	issue: textrel
chromium-54.0.2810.2: ELF binary &#39;/tmp/work/i586-oe-linux/chromium/54.0=
.2810.2-r0/packages-split/chromium/usr/bin/chromium/chrome&#39; has relocat=
ions in .text [textrel]
chromium-wayland-53.0.2785.143: ELF binary &#39;/tmp/work/i586-oe-linux/chr=
omium-wayland/53.0.2785.143-r0/packages-split/chromium-wayland/usr/bin/chro=
mium/chrome&#39; has relocations in .text [textrel]
corosync-2.4.2: ELF binary &#39;/tmp/work/core2-64-oe-linux/corosync/2.4.2-=
r0/packages-split/corosync/usr/sbin/corosync&#39; has relocations in .text =
[textrel]
mpeg2dec-0.5.1: ELF binary &#39;/tmp/work/armv5te-oe-linux-gnueabi/mpeg2dec=
/0.5.1-r0/packages-split/libmpeg2/usr/lib/libmpeg2.so.0.1.0&#39; has reloca=
tions in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary &#39;/tmp/work/i586-oe-linux/x=
264/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264/usr/lib/libx264.so.1=
48&#39; has relocations in .text [textrel]


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 0	issue: version-going-backwards


count: 10	issue: host-user-contaminated
glibc-locale-2.25: glibc-locale: /glibc-binary-localedata-el-cy/usr/lib/loc=
ale/el_CY/LC_COLLATE is owned by uid 3004, which is the same as the user ru=
nning bitbake. This may be due to host contamination [host-user-contaminate=
d]
glibc-locale-2.25: glibc-locale: /glibc-binary-localedata-fr-fr/usr/lib/loc=
ale/fr_FR/LC_CTYPE is owned by uid 3004, which is the same as the user runn=
ing bitbake. This may be due to host contamination [host-user-contaminated]
glibc-locale-2.25: glibc-locale: /glibc-binary-localedata-kw-gb/usr/lib/loc=
ale/kw_GB/LC_CTYPE is owned by uid 3004, which is the same as the user runn=
ing bitbake. This may be due to host contamination [host-user-contaminated]
libqofono-0.87+gitrAUTOINC+54435de3be: libqofono: /libqofono-tests/usr/lib/=
libqofono-qt5/tests/tst_qofonocallforwarding is owned by uid 3004, which is=
 the same as the user running bitbake. This may be due to host contaminatio=
n [host-user-contaminated]
qtbase-5.9.0+gitAUTOINC+f6b36eaafe: qtbase: /qtbase-examples/usr/share/qt5/=
examples/opengl/paintedwindow/<a href=3D"http://paintedwindow.pro">paintedw=
indow.pro</a> is owned by uid 3004, which is the same as the user running b=
itbake. This may be due to host contamination [host-user-contaminated]
qtbase-5.9.0+gitAUTOINC+f6b36eaafe: qtbase: /qtbase-staticdev/usr/lib/libQt=
5FbSupport.a is owned by uid 3004, which is the same as the user running bi=
tbake. This may be due to host contamination [host-user-contaminated]
qtquick1-5.9.0+gitAUTOINC+695460401d: qtquick1: /qtquick1-examples/usr/shar=
e/qt5/examples/declarative/righttoleft/layoutdirection/layoutdirection is o=
wned by uid 3004, which is the same as the user running bitbake. This may b=
e due to host contamination [host-user-contaminated]
qtquick1-5.9.0+gitAUTOINC+695460401d: qtquick1: /qtquick1-qmlplugins/usr/li=
b/qt5/imports/Qt/labs/particles/qmldir is owned by uid 3004, which is the s=
ame as the user running bitbake. This may be due to host contamination [hos=
t-user-contaminated]
qtscxml-5.9.0+gitAUTOINC+eff82ac957: qtscxml: /qtscxml-examples/usr/share/q=
t5/examples/scxml/invoke-dynamic/invoke-dynamic.qml is owned by uid 3004, w=
hich is the same as the user running bitbake. This may be due to host conta=
mination [host-user-contaminated]
qtwebchannel-5.9.0+gitAUTOINC+6383f0fc5e: qtwebchannel: /qtwebchannel-examp=
les/usr/share/qt5/examples/webchannel/qwclient/package.json is owned by uid=
 3004, which is the same as the user running bitbake. This may be due to ho=
st contamination [host-user-contaminated]


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 0	issue: ldflags


count: 0	issue: compile-host-path



=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">latest upstream commit:=20
22cc318 bitbake-selftest: add bb.tests.event to bitbake-selftest
not included in master yet:=20
37cf5c3 world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">latest upstream commit:=20
179b7ae meta/conf/layer.conf: bump layer version for LSB changes
not included in master yet:=20
3c5e801 v86d,qemuboot-x86.inc: use KERNEL_MODULE_AUTOLOAD+KERNEL_MODULE_PRO=
BECONF for uvesafb instead of fbsetup init script
95776ae report-error: Allow to upload reports automatically
3ba4f5c buildhistory.bbclass: metadata-revs show repo parent
4ac7dce metadata-revs: provide more information
4429765 qemux86: Add identical qemux86copy variant for tests

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">latest upstream commit:=20
d2da8b8 scsirastools: Upgrade to 1.6.6
not included in master yet:=20
497b816 dnsmasq: disable the service by default
0a830a0 freeradius: add new recipe
040b811 keepalived: add new recipe
336d26e vblade: update to version 22
808a638 ifenslave: 2.7 -&gt; 2.9
ae4ea13 drbd-utils: remove /var/lock to avoid conflict
0ef0587 wireguard: bump version to latest snapshot 0.0.20170517
8fa84d5 opensaf: Add -latomic to LDFLAGS
b680590 open-isns: fix QA issue
6233739 dante: fix unknown-configure-option QA issue
4661339 snort: enable static daq
6c0d9a3 net-snmp: supported cross compile for the perl embedded and perl mo=
dules
2e7e5d5 traceroute: Move manual pages from mandir to man8 under it
d942a51 nopoll: Disable doc generation
517cf0e cifs-utils 6.6 -&gt; 6.7
a07f706 openvpn: Upgrade 2.3.9 -&gt; 2.4.2
bf1557c proftpd: Update to 1.3.6 release
f172d6e samba: Fix build with musl
5aee814 wireshark: Upgrade to 2.2.7
df960d1 ippool: add new recipe
7897063 samba: upgrade to 4.6.5
b58c317 iscsi-initiator-utils: do not regenerate prom_lex.c
587e252 freeradius: Upgrade to 3.0.14
0fda6a5 vlan: Fix build with security flags turned on
51ef932 relayd: Upgrade to latest
951daf5 relayd: Fix build with hardening flags and glibc
6db8dd3 linux-atm: Fix build with hardening flags
8a4bde1 nftables: backport a few ICMP &amp; ICMPv6 fixes
44eca9a squid: Upgrade to 3.5.26
c82bbc0 strongswan: 5.5.1 -&gt; 5.5.3
2674a43 xterm: Upgrade 327 -&gt; 330
a73df1d twisted: add support to build for python3
f8635da rdate: add new recipe
a237b36 rdist: add new recipe
18dd8d0 01/17] add open-vm-tools recipe
d9fc187 02/17] open-vm-tools: add missing pkgconfig dependency
89d8d3e 03/17] open-vm-tools: add missing glib-2.0-native dependency
4fcf22a 04/17] open-vm-tools: clarify and expand licensing
ffa641f 05/17] open-vm-tools: base_contains --&gt; bb.utils.contains
b15f1c7 06/17] open-vm-tools: update version to 10.1.5
5c54728 07/17] open-vm-tools: don&#39;t use mspack
a253650 08/17] open-vm-tools: don&#39;t use dnet-config
482e14d 09/17] open-vm-tools: add #include to fix build break
3dedadd 10/17] open-vm-tools: add missing X11 dependencies
15aa4c6 11/17] open-vm-tools: remove kernel module logic
59a7ab5 12/17] open-vm-tools: line up configure options
791caaf 13/17] open-vm-tools: support FUSE
622d3be 14/17] open-vm-tools: scope build to only x86
e905811 15/17] open-vm-tools: style changes
873d2aa 16/17] open-vm-tools: fix all hardcoded paths
358852d 17/17] open-vm-tools: remove -Wno-error
753abab glmark2: update to latest
85e7415 live555: Define XLOCALE_NOT_USED for glibc too
6020e5c squid: Fix build with hardening
4771ae5 gpm: Use sigemptyset() API for glibc as well
8184191 ssiapi: Fix build with hardening flags
93e8807 crash: Upgrade to 7.1.9
3a5e7b7 snort: fix for snort.conf
b3a19c0 xfsprogs: remove redundant install rule in do_install
0bf1c84 geoipupdate 2.2.2 -&gt; 2.4.0
3dedb8f ruli: Fix build with hardening flags
b76e398 ruli: FIx build with hardening flags
6cc8244 recipes: remove blacklisted recipes

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">latest upstream commit:=20
2940d84 Revert &quot;qttools: DEPENDS on icu&quot;
not included in master yet:=20
0755c79 Upgrade to Qt 5.9.0
93fa261 libconnman-qt5: update to 1.1.10
88e5216 qtwebengine: add PACKAGECONFIG for webrtc

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
6edb458 firefox: fix build with gcc7
not included in master yet:=20
2a76650 gnome-settings-daemon: remove the bbappend for removed recipe

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=
=3D
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">latest upstream commit:=20
47091c6 ofono: Use Mer&#39;s 1.19 and include fix
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
</pre><div><br></div></pre></div>

--001a114e1a989a4d4c0553425583--
