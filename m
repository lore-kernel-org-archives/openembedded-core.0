Return-Path: <martin.jansa@gmail.com>
Received: from mail-yb0-f172.google.com (mail-yb0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1552965CBB;
	Fri, 14 Jul 2017 16:43:38 +0000 (UTC)
Received: by mail-yb0-f172.google.com with SMTP id n205so35138136yba.1;
	Fri, 14 Jul 2017 09:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=ig5y0nfORsPxAXniM7/Ab4MX8fWNz40Lnb0r0tcuMrc=;
	b=CRL8gfQJF+zPFO9OjiXktKHWREDuoKopwHMz1ib23mEhfayDbnsuVJPHFT4d2XOQgi
	5gohCCoxUudB8+v4y8kHfM5DKkME26XuGtz3D9T2ohF20RKHTMl5FZtbIXVcbKi0ba3+
	arUXMXrq2HZo3CxGJQZhsNN6zx1CokqSj4z8AKE4w0eBMgb3/7v802Q83gKTroeuFQsv
	QAqVr6vDjdbiBbWC2j2tFVWDO/eRihswe2lJkNXXgNGoDHdmfWvFHsCleg4e6pE7qpOg
	cT+qWp4XveQyhgOVNFF+e3hRJnroJj7PstYxj3lUItwxU3yAKMWMMXapj4EUOhMiKhZX
	jFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=ig5y0nfORsPxAXniM7/Ab4MX8fWNz40Lnb0r0tcuMrc=;
	b=kcJlzCHCfXnEC9GhtWkcyShrMlCIhMWCQ99NsQIjAnAi2da77euC/mYf1Os9rXXmjh
	rDwILmpAdAT6yA+G9qXba01ismQ+TpyrwHWcWttpCXKW43rXM1HsEPWiBtP++STRecT2
	LwFsYqqSrZsTZDV2QcTrM1+1885rM2IfRRH6CmLMPvq0wsSwLJJH1gkAdzCbiwEr1GSZ
	IwMYD65hyO5P/b0pMs6JNVabU05QyTk8jLrykT+vtJZdzftHH7hB3FDYOL+n5aHYBFHa
	HaJfdapF6qfOKeqMXvIUOekpdgmNsv284F5fQF+oseOi0KKYDjk/SOLQBHEDHQIDfBV+
	5RWQ==
X-Gm-Message-State: AIVw1108ZsgO1rcN4o5H9DUIaVWwDV1fz/oy0tvKshKT+XwXCB0vajJU
	Z4facUY4UjCzphLS56xxBVWWuF3dHLjF
X-Received: by 10.37.59.18 with SMTP id i18mr7738118yba.64.1500050619221; Fri,
	14 Jul 2017 09:43:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.77.4 with HTTP; Fri, 14 Jul 2017 09:43:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 14 Jul 2017 18:43:38 +0200
Message-ID: <CA+chaQfEGO1Gra1BBCR9jeA+Lu5K6ekUY4etENcwoFQgftqzTA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: State of bitbake world, Failed tasks 2017-07-13
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
X-List-Received-Date: Fri, 14 Jul 2017 16:43:39 -0000
Content-Type: multipart/alternative; boundary="001a114f1d7c4dcfaa055449c08e"

--001a114f1d7c4dcfaa055449c08e
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

||2017-07-13	||1	||1	||1	||0	||0		||1		||4		||0		||0		||21		||0		||0		||0		||0		||0		||0		||0		||0		||
|}

== Failed tasks 2017-07-13 ==

INFO: jenkins-job.sh-1.8.24 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170714_064216.log

=== common (1) ===
    * openembedded-core/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_231.bb:do_compile

=== common-x86 (0) ===

=== qemuarm (0) ===

=== qemux86 (0) ===

=== qemux86_64 (0) ===

=== Number of failed tasks (3) ===
{| class=wikitable

|-
|| qemuarm 	|| 1	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.20170711_225251.log/
|| http://errors.yoctoproject.org/Errors/Build/41116/
|-
|| qemux86 	|| 1	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.20170711_225251.log/
|| http://errors.yoctoproject.org/Errors/Build/41118/
|-
|| qemux86_64 	|| 1	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20170713_081929.log/
|| http://errors.yoctoproject.org/Errors/Build/41231/
|}

=== PNBLACKLISTs (14) ===

=== QA issues (26) ===
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
||1	||libdir
|-
||21	||version-going-backwards
|-
||4	||textrel
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.signatures.20170712_200847.log/

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
qwt-qt5-6.1.3: qwt-qt5-dbg: found library in wrong location:
/usr/plugins/designer/.debug/libqwt_designer_plugin.so [libdir]


count: 4	issue: textrel
chromium-54.0.2810.2: ELF binary
'/tmp/work/i586-oe-linux/chromium/54.0.2810.2-r0/packages-split/chromium/usr/bin/chromium/chrome'
has relocations in .text [textrel]
chromium-wayland-53.0.2785.143: ELF binary
'/tmp/work/i586-oe-linux/chromium-wayland/53.0.2785.143-r0/packages-split/chromium-wayland/usr/bin/chromium/chrome'
has relocations in .text [textrel]
corosync-2.4.2: ELF binary
'/tmp/work/core2-64-oe-linux/corosync/2.4.2-r0/packages-split/corosync/usr/sbin/corosync'
has relocations in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary
'/tmp/work/i586-oe-linux/x264/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264/usr/lib/libx264.so.148'
has relocations in .text [textrel]


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 21	issue: version-going-backwards
rsyslog-8.22.0: Package version for package rsyslog-dbg went backwards
which would break package feeds from (0:8.22.0-r0.30 to 0:8.22.0-r0.0)
[version-going-backwards]
rsyslog-8.22.0: Package version for package rsyslog-dbg went backwards
which would break package feeds from (0:8.22.0-r0.37 to 0:8.22.0-r0.0)
[version-going-backwards]
rsyslog-8.22.0: Package version for package rsyslog-dev went backwards
which would break package feeds from (0:8.22.0-r0.30 to 0:8.22.0-r0.0)
[version-going-backwards]
rsyslog-8.22.0: Package version for package rsyslog-dev went backwards
which would break package feeds from (0:8.22.0-r0.37 to 0:8.22.0-r0.0)
[version-going-backwards]
rsyslog-8.22.0: Package version for package rsyslog-doc went backwards
which would break package feeds from (0:8.22.0-r0.30 to 0:8.22.0-r0.0)
[version-going-backwards]
rsyslog-8.22.0: Package version for package rsyslog-doc went backwards
which would break package feeds from (0:8.22.0-r0.37 to 0:8.22.0-r0.0)
[version-going-backwards]
rsyslog-8.22.0: Package version for package rsyslog-locale went
backwards which would break package feeds from (0:8.22.0-r0.30 to
0:8.22.0-r0.0) [version-going-backwards]
rsyslog-8.22.0: Package version for package rsyslog-locale went
backwards which would break package feeds from (0:8.22.0-r0.37 to
0:8.22.0-r0.0) [version-going-backwards]
rsyslog-8.22.0: Package version for package rsyslog-ptest went
backwards which would break package feeds from (0:8.22.0-r0.30 to
0:8.22.0-r0.0) [version-going-backwards]
rsyslog-8.22.0: Package version for package rsyslog-ptest went
backwards which would break package feeds from (0:8.22.0-r0.37 to
0:8.22.0-r0.0) [version-going-backwards]
rsyslog-8.22.0: Package version for package rsyslog-staticdev went
backwards which would break package feeds from (0:8.22.0-r0.30 to
0:8.22.0-r0.0) [version-going-backwards]
rsyslog-8.22.0: Package version for package rsyslog-staticdev went
backwards which would break package feeds from (0:8.22.0-r0.37 to
0:8.22.0-r0.0) [version-going-backwards]
rsyslog-8.22.0: Package version for package rsyslog went backwards
which would break package feeds from (0:8.22.0-r0.30 to 0:8.22.0-r0.0)
[version-going-backwards]
rsyslog-8.22.0: Package version for package rsyslog went backwards
which would break package feeds from (0:8.22.0-r0.37 to 0:8.22.0-r0.0)
[version-going-backwards]
valgrind-3.12.0: Package version for package valgrind-dbg went
backwards which would break package feeds from (0:3.12.0-r0.34 to
0:3.12.0-r0.0) [version-going-backwards]
valgrind-3.12.0: Package version for package valgrind-dev went
backwards which would break package feeds from (0:3.12.0-r0.34 to
0:3.12.0-r0.0) [version-going-backwards]
valgrind-3.12.0: Package version for package valgrind-doc went
backwards which would break package feeds from (0:3.12.0-r0.34 to
0:3.12.0-r0.0) [version-going-backwards]
valgrind-3.12.0: Package version for package valgrind-locale went
backwards which would break package feeds from (0:3.12.0-r0.34 to
0:3.12.0-r0.0) [version-going-backwards]
valgrind-3.12.0: Package version for package valgrind-ptest went
backwards which would break package feeds from (0:3.12.0-r0.34 to
0:3.12.0-r0.0) [version-going-backwards]
valgrind-3.12.0: Package version for package valgrind-staticdev went
backwards which would break package feeds from (0:3.12.0-r0.34 to
0:3.12.0-r0.0) [version-going-backwards]
valgrind-3.12.0: Package version for package valgrind went backwards
which would break package feeds from (0:3.12.0-r0.34 to 0:3.12.0-r0.0)
[version-going-backwards]


count: 0	issue: host-user-contaminated


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 0	issue: ldflags


count: 0	issue: compile-host-path



== Tested changes (not included in master yet) - bitbake ==

latest upstream commit:
4a14b44 knotty: Drop task prefix of PLAIN log messages
not included in master yet:
dda3a10 world-image: add extra target

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
b1c4661 libiconv: remove 0001-Fix-link-error-when-compiling-with-gcc-O0.patch
not included in master yet:
dd1b5e7 report-error: Allow to upload reports automatically
7fdb805 buildhistory.bbclass: metadata-revs show repo parent
9b6fe73 metadata-revs: provide more information
2cd822c qemux86: Add identical qemux86copy variant for tests
db1b8cf valgrind: fix link failure with gold

== Tested changes (not included in master yet) - meta-openembedded ==

latest upstream commit:
66b88f7 hwloc: Inherit pkgconfig
not included in master yet:
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
8253d8c libtinyxml2: upgrade to 5.0.1
e5d13e0 gnome-common: Add recipe (from oe-core)
2c09550 webrtc-audio-processing: initial recipe
3e83a12 libdbus-c++: Fix build with gcc7 and unblacklist
a9b421b security_flags.inc: Delete
21ac7ab ltrace: Fix build on musl
9f59778 pptp-linux: Upgrade to 1.9.0
011d175 kodi: Fix build on powerpc
96ddef1 meta-python: Add Protobuf and gRPC Python recipes
6978c6c meta-python: Add pybluez recipe
5fc3a7b meta-python: Add python-daemon recipe and its dependencies
b234cb7 udisks2: update 2.1.7 -> 2.1.8
6351d5d gvfs: update 1.28.3 -> 1.32.1
072a282 garcon: update 0.4.0 -> 0.6.1
4ae21b2 gparted: update 0.27.0 -> 0.28.1
85f9438 abiword: update 3.0.1 -> 3.0.2
f180ebe faac: update 1.28 -> 1.29
d4373e3 libdbus-c++: Add -pthread to linker flags
216bf8b klibc: Fix build with musl
ac04fc6 ubi-utils-klibc: Pass TUNE_CCARGS into CFLAGS
225e21d kodi: Fix build on arm
5cce369 fluentbit: fix SYSTEMD_SERVICE name
626a865 Intel: remove license file
7fdf736 proj: update to 4.9.3
ef59094 klibc: Fix linking by using bfd linker when default linker is gold
9b2852b libsombok3: add recipe
20b186c libmime-charset-perl: add recipe
3ccb597 libterm-readkey-perl: add recipe
91736f5 liblocale-gettext-perl: add recipe
9dfe3e1 libtext-charwidth-perl: add recipe
f5158f7 libtext-wrapi18n-perl: add recipe
247aec7 libunicode-linebreak-perl: add recipe
131de8c po4a: add full functionalities
1815d4e ebtables: replace ebtables-save perl script with bash rewrite
8fc200c recipes: remove blacklisted recipes

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
2940d84 Revert "qttools: DEPENDS on icu"
not included in master yet:
800d4c1 libconnman-qt5: update to 1.1.10
428be3c qtwebengine: add PACKAGECONFIG for webrtc
05455e6 qt5: add qt5-ptest.inc
ec8c62e qtxmlpatterns: add ptest
1eac990 qtdeclarative: add ptest
2c1d6b1 qtquick1: add ptest
aa0605d qtquickcontrols2: fix compilation of examples/texteditor
00d72cd qwt-qt5: Fix rpath issues
c2768bd qtwebengine: fix build with gcc7
932515a qt5-ptest.inc: append do_populate_sysroot only for target
bf7cdd9 qtbase-native: Fix qdbuscpp2xml segfault

== Tested changes (not included in master yet) - meta-browser ==

latest upstream commit:
d822031 Merge pull request #49 from kraj/kraj/master
not included in master yet:
6f790a0 gnome-settings-daemon: remove the bbappend for removed recipe

== Tested changes (not included in master yet) - meta-webos-ports ==

latest upstream commit:
9545fb6 packagegroup-luneos-extended: drop qtscenegraph-adaptation
not included in master yet:

== Tested changes (not included in master yet) - meta-smartphone ==
latest upstream commit:
80b8107 android-system-image-tenderloin: Fix checksums
not included in master yet:
e523b07 meta-shr, meta-fso: remove blacklisted recipes

--001a114f1d7c4dcfaa055449c08e
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
eak-word;margin-top:0px;margin-bottom:0px">||2017-07-13	||1	||1	||1	||0	||0=
		||1		||4		||0		||0		||21		||0		||0		||0		||0		||0		||0		||0		||0		||=09
|}

=3D=3D Failed tasks 2017-07-13 =3D=3D

INFO: jenkins-job.sh-1.8.24 Complete log available at <a href=3D"http://log=
s.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170714_064216.log" =
style=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">h=
ttp://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170714_064=
216.log</a>

=3D=3D=3D common (1) =3D=3D=3D
    * openembedded-core/meta/recipes-devtools/systemd-bootchart/systemd-boo=
tchart_231.bb:do_compile

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (0) =3D=3D=3D

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (3) =3D=3D=3D
{| class=3Dwikitable
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">|-
|| qemuarm 	|| 1	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld/rocko/log.world.qemuarm.20170711_225251.log/" style=3D"box-sizing:borde=
r-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.or=
g/buildlogs/oe/world/rocko/log.world.qemuarm.20170711_225251.log/</a> || <a=
 href=3D"http://errors.yoctoproject.org/Errors/Build/41116/" style=3D"box-s=
izing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://errors.y=
octoproject.org/Errors/Build/41116/</a>
|-
|| qemux86 	|| 1	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld/rocko/log.world.qemux86.20170711_225251.log/" style=3D"box-sizing:borde=
r-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.or=
g/buildlogs/oe/world/rocko/log.world.qemux86.20170711_225251.log/</a> || <a=
 href=3D"http://errors.yoctoproject.org/Errors/Build/41118/" style=3D"box-s=
izing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://errors.y=
octoproject.org/Errors/Build/41118/</a>
|-
|| qemux86_64 	|| 1	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe=
/world/rocko/log.world.qemux86-64.20170713_081929.log/" style=3D"box-sizing=
:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-li=
nux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20170713_081929.log/<=
/a> || <a href=3D"http://errors.yoctoproject.org/Errors/Build/41231/" style=
=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http:/=
/errors.yoctoproject.org/Errors/Build/41231/</a>
|}

=3D=3D=3D PNBLACKLISTs (14) =3D=3D=3D

=3D=3D=3D QA issues (26) =3D=3D=3D
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
||1	||libdir
|-
||21	||version-going-backwards
|-
||4	||textrel
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/roc=
ko/log.signatures.20170712_200847.log/" style=3D"box-sizing:border-box;word=
-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.org/buildlog=
s/oe/world/rocko/log.signatures.20170712_200847.log/</a>

No issues detected


PNBLACKLISTs:
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">openembedded-core/:
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
qwt-qt5-6.1.3: qwt-qt5-dbg: found library in wrong location: /usr/plugins/d=
esigner/.debug/libqwt_designer_plugin.so [libdir]


count: 4	issue: textrel
chromium-54.0.2810.2: ELF binary &#39;/tmp/work/i586-oe-linux/chromium/54.0=
.2810.2-r0/packages-split/chromium/usr/bin/chromium/chrome&#39; has relocat=
ions in .text [textrel]
chromium-wayland-53.0.2785.143: ELF binary &#39;/tmp/work/i586-oe-linux/chr=
omium-wayland/53.0.2785.143-r0/packages-split/chromium-wayland/usr/bin/chro=
mium/chrome&#39; has relocations in .text [textrel]
corosync-2.4.2: ELF binary &#39;/tmp/work/core2-64-oe-linux/corosync/2.4.2-=
r0/packages-split/corosync/usr/sbin/corosync&#39; has relocations in .text =
[textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary &#39;/tmp/work/i586-oe-linux/x=
264/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264/usr/lib/libx264.so.1=
48&#39; has relocations in .text [textrel]


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 21	issue: version-going-backwards
rsyslog-8.22.0: Package version for package rsyslog-dbg went backwards whic=
h would break package feeds from (0:8.22.0-r0.30 to 0:8.22.0-r0.0) [version=
-going-backwards]
rsyslog-8.22.0: Package version for package rsyslog-dbg went backwards whic=
h would break package feeds from (0:8.22.0-r0.37 to 0:8.22.0-r0.0) [version=
-going-backwards]
rsyslog-8.22.0: Package version for package rsyslog-dev went backwards whic=
h would break package feeds from (0:8.22.0-r0.30 to 0:8.22.0-r0.0) [version=
-going-backwards]
rsyslog-8.22.0: Package version for package rsyslog-dev went backwards whic=
h would break package feeds from (0:8.22.0-r0.37 to 0:8.22.0-r0.0) [version=
-going-backwards]
rsyslog-8.22.0: Package version for package rsyslog-doc went backwards whic=
h would break package feeds from (0:8.22.0-r0.30 to 0:8.22.0-r0.0) [version=
-going-backwards]
rsyslog-8.22.0: Package version for package rsyslog-doc went backwards whic=
h would break package feeds from (0:8.22.0-r0.37 to 0:8.22.0-r0.0) [version=
-going-backwards]
rsyslog-8.22.0: Package version for package rsyslog-locale went backwards w=
hich would break package feeds from (0:8.22.0-r0.30 to 0:8.22.0-r0.0) [vers=
ion-going-backwards]
rsyslog-8.22.0: Package version for package rsyslog-locale went backwards w=
hich would break package feeds from (0:8.22.0-r0.37 to 0:8.22.0-r0.0) [vers=
ion-going-backwards]
rsyslog-8.22.0: Package version for package rsyslog-ptest went backwards wh=
ich would break package feeds from (0:8.22.0-r0.30 to 0:8.22.0-r0.0) [versi=
on-going-backwards]
rsyslog-8.22.0: Package version for package rsyslog-ptest went backwards wh=
ich would break package feeds from (0:8.22.0-r0.37 to 0:8.22.0-r0.0) [versi=
on-going-backwards]
rsyslog-8.22.0: Package version for package rsyslog-staticdev went backward=
s which would break package feeds from (0:8.22.0-r0.30 to 0:8.22.0-r0.0) [v=
ersion-going-backwards]
rsyslog-8.22.0: Package version for package rsyslog-staticdev went backward=
s which would break package feeds from (0:8.22.0-r0.37 to 0:8.22.0-r0.0) [v=
ersion-going-backwards]
rsyslog-8.22.0: Package version for package rsyslog went backwards which wo=
uld break package feeds from (0:8.22.0-r0.30 to 0:8.22.0-r0.0) [version-goi=
ng-backwards]
rsyslog-8.22.0: Package version for package rsyslog went backwards which wo=
uld break package feeds from (0:8.22.0-r0.37 to 0:8.22.0-r0.0) [version-goi=
ng-backwards]
valgrind-3.12.0: Package version for package valgrind-dbg went backwards wh=
ich would break package feeds from (0:3.12.0-r0.34 to 0:3.12.0-r0.0) [versi=
on-going-backwards]
valgrind-3.12.0: Package version for package valgrind-dev went backwards wh=
ich would break package feeds from (0:3.12.0-r0.34 to 0:3.12.0-r0.0) [versi=
on-going-backwards]
valgrind-3.12.0: Package version for package valgrind-doc went backwards wh=
ich would break package feeds from (0:3.12.0-r0.34 to 0:3.12.0-r0.0) [versi=
on-going-backwards]
valgrind-3.12.0: Package version for package valgrind-locale went backwards=
 which would break package feeds from (0:3.12.0-r0.34 to 0:3.12.0-r0.0) [ve=
rsion-going-backwards]
valgrind-3.12.0: Package version for package valgrind-ptest went backwards =
which would break package feeds from (0:3.12.0-r0.34 to 0:3.12.0-r0.0) [ver=
sion-going-backwards]
valgrind-3.12.0: Package version for package valgrind-staticdev went backwa=
rds which would break package feeds from (0:3.12.0-r0.34 to 0:3.12.0-r0.0) =
[version-going-backwards]
valgrind-3.12.0: Package version for package valgrind went backwards which =
would break package feeds from (0:3.12.0-r0.34 to 0:3.12.0-r0.0) [version-g=
oing-backwards]


count: 0	issue: host-user-contaminated


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
4a14b44 knotty: Drop task prefix of PLAIN log messages
not included in master yet:=20
dda3a10 world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
b1c4661 libiconv: remove 0001-Fix-link-error-when-compiling-with-gcc-O0.pat=
ch
not included in master yet:=20
dd1b5e7 report-error: Allow to upload reports automatically
7fdb805 buildhistory.bbclass: metadata-revs show repo parent
9b6fe73 metadata-revs: provide more information
2cd822c qemux86: Add identical qemux86copy variant for tests
db1b8cf valgrind: fix link failure with gold

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">latest upstream commit:=20
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
1a3966a unionfs-fuse: 0.26 -&gt; 2.0
39502f2 autofs: Add build dependency on libnsl2
b73b2f4 <a href=3D"http://gst-plugins-gl_0.10.3.bb">gst-plugins-gl_0.10.3.b=
b</a>: Fix build on rpi/userland
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
d1c5c69 rtorrent: Add and enable ipv6 packageconfig based on DISTRO_FEATURE=
S
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
fba5745 multipath-tools: 0.6.4 -&gt; 0.7.1
576007b python-pytest: update to version 3.1.3
ab2195a python-pytest: remove fetch during do_compile phase
8253d8c libtinyxml2: upgrade to 5.0.1
e5d13e0 gnome-common: Add recipe (from oe-core)
2c09550 webrtc-audio-processing: initial recipe
3e83a12 libdbus-c++: Fix build with gcc7 and unblacklist
a9b421b security_flags.inc: Delete
21ac7ab ltrace: Fix build on musl
9f59778 pptp-linux: Upgrade to 1.9.0
011d175 kodi: Fix build on powerpc
96ddef1 meta-python: Add Protobuf and gRPC Python recipes
6978c6c meta-python: Add pybluez recipe
5fc3a7b meta-python: Add python-daemon recipe and its dependencies
b234cb7 udisks2: update 2.1.7 -&gt; 2.1.8
6351d5d gvfs: update 1.28.3 -&gt; 1.32.1
072a282 garcon: update 0.4.0 -&gt; 0.6.1
4ae21b2 gparted: update 0.27.0 -&gt; 0.28.1
85f9438 abiword: update 3.0.1 -&gt; 3.0.2
f180ebe faac: update 1.28 -&gt; 1.29
d4373e3 libdbus-c++: Add -pthread to linker flags
216bf8b klibc: Fix build with musl
ac04fc6 ubi-utils-klibc: Pass TUNE_CCARGS into CFLAGS
225e21d kodi: Fix build on arm
5cce369 fluentbit: fix SYSTEMD_SERVICE name
626a865 Intel: remove license file
7fdf736 proj: update to 4.9.3
ef59094 klibc: Fix linking by using bfd linker when default linker is gold
9b2852b libsombok3: add recipe
20b186c libmime-charset-perl: add recipe
3ccb597 libterm-readkey-perl: add recipe
91736f5 liblocale-gettext-perl: add recipe
9dfe3e1 libtext-charwidth-perl: add recipe
f5158f7 libtext-wrapi18n-perl: add recipe
247aec7 libunicode-linebreak-perl: add recipe
131de8c po4a: add full functionalities
1815d4e ebtables: replace ebtables-save perl script with bash rewrite
8fc200c recipes: remove blacklisted recipes

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
2940d84 Revert &quot;qttools: DEPENDS on icu&quot;
not included in master yet:=20
800d4c1 libconnman-qt5: update to 1.1.10
428be3c qtwebengine: add PACKAGECONFIG for webrtc
05455e6 qt5: add qt5-ptest.inc
ec8c62e qtxmlpatterns: add ptest
1eac990 qtdeclarative: add ptest
2c1d6b1 qtquick1: add ptest
aa0605d qtquickcontrols2: fix compilation of examples/texteditor
00d72cd qwt-qt5: Fix rpath issues
c2768bd qtwebengine: fix build with gcc7
932515a qt5-ptest.inc: append do_populate_sysroot only for target
bf7cdd9 qtbase-native: Fix qdbuscpp2xml segfault

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">latest upstream commit:=20
d822031 Merge pull request #49 from kraj/kraj/master
not included in master yet:=20
6f790a0 gnome-settings-daemon: remove the bbappend for removed recipe

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=
=3D
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">latest upstream commit:=20
9545fb6 packagegroup-luneos-extended: drop qtscenegraph-adaptation
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
80b8107 android-system-image-tenderloin: Fix checksums
not included in master yet:=20
e523b07 meta-shr, meta-fso: remove blacklisted recipes
</pre><div><br></div></pre></div>

--001a114f1d7c4dcfaa055449c08e--
