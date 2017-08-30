Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f52.google.com (mail-vk0-f52.google.com
	[209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id B777378375;
	Wed, 30 Aug 2017 17:11:48 +0000 (UTC)
Received: by mail-vk0-f52.google.com with SMTP id j7so19244214vke.0;
	Wed, 30 Aug 2017 10:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=kn3QUH4MmKf7N+SjVxZygFjv/NEZQwLY3DzcriBAsVk=;
	b=F5Z+ISlSZWTZeJpGyThEwWn8pN65xrzDMKd4+fTAgaxOlNW9+ALazTRKcwiOE+dorw
	uVnjV6ejvFgOLnpsWJZKMoNq3y+3v0hIphvGS4pfeiF3gGJWDZKeAzD499gV3AzYqqe0
	iL7Y7m1mQ1BEzn/KrFijF8Af4zLZDGZM9jHAjOKi/x3dQ8OZLyLjN7v4YL8/tHou414e
	HQqMJI4n3V7JkVYvJfQz4J95DmNbtWScOdyJqYP8f2YOfkhsiVzhFnD6AOJ0S1UB28A9
	zU2cGCdcMesDhzZOJYOaV07OB2iqae4pQTKZeSIfnER987SmD4tD0+9SeR64fwS9ujgh
	g8Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=kn3QUH4MmKf7N+SjVxZygFjv/NEZQwLY3DzcriBAsVk=;
	b=XlGoRU4hIsfioxXv5b+BynUhG2wD4T4DzbQqwW9ydVRpDeLqkZqss0zmgHhdVI54sl
	ZHi1gewMw35U7DGtkm5a2ucixRgM+GXdesLIBLDYtYNzMqNpA+dIExE3VQdjnX3agAuM
	C2LhTucJGUKKUzWYkBAJgezCJsbpurDKZE6SZ8qZrZlfIomA6w3bKoXBQaLEZ46YUyql
	/VVsem+XMsYBMRDoZbOR4miWO+bUfDwQ//xwXcaLy0/eYPcP0Io4zz8SNV4cHNgaL8ra
	Tgvg95rZTQ2+3GLwvzNqqfFYNNOm0PyXRjrq1KXA7KmkOJYuOCexU+WUAuoPNsg11bQR
	7ZkQ==
X-Gm-Message-State: AHYfb5gefCCmjcJrIVGqV/xTCVwD3+C+dgdrxQsBm5IG5HOhgcRntSQ2
	G4abwCgIk3ew28m3+W9WpY3ndJAvHqTE
X-Received: by 10.31.169.9 with SMTP id s9mr1444871vke.90.1504113109066; Wed,
	30 Aug 2017 10:11:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.15.69 with HTTP; Wed, 30 Aug 2017 10:11:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 30 Aug 2017 19:11:48 +0200
Message-ID: <CA+chaQekRTcEYZJuF1Q7vPaQ17XMKp=n+M3wgm8VEtTfFWO+Gg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: State of bitbake world, Failed tasks 2017-08-29
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
X-List-Received-Date: Wed, 30 Aug 2017 17:11:49 -0000
Content-Type: multipart/alternative; boundary="001a11414bf091682a0557fb9fa5"

--001a11414bf091682a0557fb9fa5
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
||2017-08-29	||7	||5	||5	||1	||0		||0		||5		||0		||2		||21		||5		||0		||0		||0		||0		||0		||1		||0		||
|}

== Failed tasks 2017-08-29 ==

INFO: jenkins-job.sh-1.8.27 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170830_070910.log

=== common (4) ===
    * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_compile
    * meta-openembedded/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb:do_compile
    * meta-openembedded/meta-oe/recipes-extended/corosync/corosync_2.4.2.bb:do_package_qa
    * meta-openembedded/meta-python/recipes-devtools/python/python-matplotlib_1.1.0.bb:do_compile

=== common-x86 (0) ===

=== qemuarm (3) ===
    * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile
    * meta-openembedded/meta-oe/recipes-extended/tiptop/tiptop_2.3.bb:do_compile
    * meta-openembedded/meta-oe/recipes-support/mysql/mariadb_5.5.57.bb:do_compile

=== qemux86 (1) ===
    * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb:do_compile

=== qemux86_64 (1) ===
    * meta-openembedded/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb:do_fetch

=== Number of failed tasks (17) ===
{| class=wikitable
|-
|| qemuarm 	|| 7	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.20170827_234922.log/
|| http://errors.yoctoproject.org/Errors/Build/45927/
|-
|| qemux86 	|| 5	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.20170827_234919.log/
|| http://errors.yoctoproject.org/Errors/Build/45932/
|-
|| qemux86_64 	|| 5	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20170829_033912.log/
|| http://errors.yoctoproject.org/Errors/Build/45972/
|}

=== PNBLACKLISTs (1) ===

=== QA issues (34) ===
{| class=wikitable
!| Count		||Issue
|-
||0	||already-stripped
|-
||0	||build-deps
|-
||0	||compile-host-path
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
||0	||unknown-configure-option
|-
||1	||ldflags
|-
||21	||version-going-backwards
|-
||2	||file-rdeps
|-
||5	||host-user-contaminated
|-
||5	||textrel
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (1) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.signatures.20170828_222437.log/
    * ERROR: 1 issues were found in these recipes: android-tools

    * ERROR: 1 errors found in
signatures.qemux86.do_package_write_ipk.sigdata.log

    * ERROR: android-tools different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemux86
    * ERROR: 1 errors found in
/home/jenkins/oe/world/shr-core/tmp-glibc/sstate-diff/1503995078/signatures.qemux86.do_package_write_ipk.sigdata.log
    * ERROR: 1 issues were found in these recipes: android-tools


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACKLIST[lksctp-tools]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "BROKEN:
fails to link against sctp_connectx symbol", '', d)}"
meta-qt5:
meta-smartphone:
meta-webos-ports:
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


QA issues by type:
count: 0	issue: already-stripped


count: 0	issue: libdir


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
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary
'/tmp/work/i586-oe-linux/x264/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264-bin/usr/bin/x264'
has relocations in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary
'/tmp/work/i586-oe-linux/x264/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264/usr/lib/libx264.so.148'
has relocations in .text [textrel]


count: 0	issue: build-deps


count: 2	issue: file-rdeps
corosync-2.4.2: /usr/share/corosync/corosync contained in package
corosync requires /tmp/hosttools/bash, but no providers found in
RDEPENDS_corosync? [file-rdeps]
corosync-2.4.2: /usr/share/corosync/corosync-notifyd contained in
package corosync requires /tmp/hosttools/bash, but no providers found
in RDEPENDS_corosync? [file-rdeps]


count: 21	issue: version-going-backwards
python-m2crypto-0.25.1: Package version for package
python-m2crypto-dbg went backwards which would break package feeds
from (0:0.26.0-r0.1 to 0:0.25.1-r0.1) [version-going-backwards]
python-m2crypto-0.25.1: Package version for package
python-m2crypto-dev went backwards which would break package feeds
from (0:0.26.0-r0.1 to 0:0.25.1-r0.1) [version-going-backwards]
python-m2crypto-0.25.1: Package version for package
python-m2crypto-doc went backwards which would break package feeds
from (0:0.26.0-r0.1 to 0:0.25.1-r0.1) [version-going-backwards]
python-m2crypto-0.25.1: Package version for package
python-m2crypto-locale went backwards which would break package feeds
from (0:0.26.0-r0.1 to 0:0.25.1-r0.1) [version-going-backwards]
python-m2crypto-0.25.1: Package version for package
python-m2crypto-staticdev went backwards which would break package
feeds from (0:0.26.0-r0.1 to 0:0.25.1-r0.1) [version-going-backwards]
python-m2crypto-0.25.1: Package version for package python-m2crypto
went backwards which would break package feeds from (0:0.26.0-r0.1 to
0:0.25.1-r0.1) [version-going-backwards]
system-setup-keyboard-0.8.8: Package version for package
system-setup-keyboard-dbg went backwards which would break package
feeds from (0:0.8.8-r0.48 to 0:0.8.8-r0.0) [version-going-backwards]
system-setup-keyboard-0.8.8: Package version for package
system-setup-keyboard-dev went backwards which would break package
feeds from (0:0.8.8-r0.48 to 0:0.8.8-r0.0) [version-going-backwards]
system-setup-keyboard-0.8.8: Package version for package
system-setup-keyboard-doc went backwards which would break package
feeds from (0:0.8.8-r0.48 to 0:0.8.8-r0.0) [version-going-backwards]
system-setup-keyboard-0.8.8: Package version for package
system-setup-keyboard-locale went backwards which would break package
feeds from (0:0.8.8-r0.48 to 0:0.8.8-r0.0) [version-going-backwards]
system-setup-keyboard-0.8.8: Package version for package
system-setup-keyboard-staticdev went backwards which would break
package feeds from (0:0.8.8-r0.48 to 0:0.8.8-r0.0)
[version-going-backwards]
system-setup-keyboard-0.8.8: Package version for package
system-setup-keyboard went backwards which would break package feeds
from (0:0.8.8-r0.48 to 0:0.8.8-r0.0) [version-going-backwards]
terminus-font-4.38: Package version for package
terminus-font-consolefonts went backwards which would break package
feeds from (0:4.38-r0.56 to 0:4.38-r0.0) [version-going-backwards]
terminus-font-4.38: Package version for package
terminus-font-consoletrans went backwards which would break package
feeds from (0:4.38-r0.56 to 0:4.38-r0.0) [version-going-backwards]
terminus-font-4.38: Package version for package terminus-font-dbg went
backwards which would break package feeds from (0:4.38-r0.56 to
0:4.38-r0.0) [version-going-backwards]
terminus-font-4.38: Package version for package terminus-font-dev went
backwards which would break package feeds from (0:4.38-r0.56 to
0:4.38-r0.0) [version-going-backwards]
terminus-font-4.38: Package version for package terminus-font-doc went
backwards which would break package feeds from (0:4.38-r0.56 to
0:4.38-r0.0) [version-going-backwards]
terminus-font-4.38: Package version for package terminus-font-locale
went backwards which would break package feeds from (0:4.38-r0.56 to
0:4.38-r0.0) [version-going-backwards]
terminus-font-4.38: Package version for package terminus-font-pcf went
backwards which would break package feeds from (0:4.38-r0.56 to
0:4.38-r0.0) [version-going-backwards]
terminus-font-4.38: Package version for package
terminus-font-staticdev went backwards which would break package feeds
from (0:4.38-r0.56 to 0:4.38-r0.0) [version-going-backwards]
terminus-font-4.38: Package version for package terminus-font went
backwards which would break package feeds from (0:4.38-r0.56 to
0:4.38-r0.0) [version-going-backwards]


count: 5	issue: host-user-contaminated
glibc-locale-2.26: glibc-locale:
/glibc-binary-localedata-yue-hk/usr/lib/locale/yue_HK/LC_MEASUREMENT
is owned by uid 3004, which is the same as the user running bitbake.
This may be due to host contamination [host-user-contaminated]
libqofono-0.87+gitrAUTOINC+54435de3be: libqofono:
/libqofono-tests/usr/lib/libqofono-qt5/tests/tst_qofonosimmanager is
owned by uid 3004, which is the same as the user running bitbake. This
may be due to host contamination [host-user-contaminated]
python3-3.5.3: python3: /python3-dev/usr/lib/python3.5/config/Makefile
is owned by uid 3004, which is the same as the user running bitbake.
This may be due to host contamination [host-user-contaminated]
qtbase-5.9.2+gitAUTOINC+73573fce29: qtbase:
/qtbase-plugins/usr/lib/qt5/plugins/generic/libqevdevkeyboardplugin.so
is owned by uid 3004, which is the same as the user running bitbake.
This may be due to host contamination [host-user-contaminated]
qtbase-5.9.2+gitAUTOINC+73573fce29: qtbase:
/qtbase-staticdev/usr/lib/libQt5GlxSupport.a is owned by uid 3004,
which is the same as the user running bitbake. This may be due to host
contamination [host-user-contaminated]


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 1	issue: ldflags
system-setup-keyboard-0.8.8: No GNU_HASH in the elf binary:
'/tmp/work/core2-64-oe-linux/system-setup-keyboard/0.8.8-r0/packages-split/system-setup-keyboard/usr/bin/system-setup-keyboard'
[ldflags]


count: 0	issue: compile-host-path



== Tested changes (not included in master yet) - bitbake ==
latest upstream commit:
8a60106 main: Attempt to gain bitbake.lock rather than just waiting
not included in master yet:
a064963 world-image: add extra target

== Tested changes (not included in master yet) - openembedded-core ==

latest upstream commit:
7f10c51 devtool: deploy-target: Support stripped libs and execs
not included in master yet:
2cc5a44 report-error: Allow to upload reports automatically
80ab89e buildhistory.bbclass: metadata-revs show repo parent
7e0797d metadata-revs: provide more information
62e1eb6 qemux86: Add identical qemux86copy variant for tests
63aacc3 reproducible_build.bbclass: initial support for binary reproducibility
f53f75b cpio: provide cpio-replacement-native
8498b82 image_types.bbclass: improve cpio image reproducibility
9feddbc rootfs-postcommands.bbclass: support binary reproducibility
8fdb2c0 insane.bbclass: write QA issues to log file only when they are
in ERROR_QA or WARN_QA

== Tested changes (not included in master yet) - meta-openembedded ==

latest upstream commit:
108cb03 multipath-tools: RDEPEND on bash
not included in master yet:
843646b dnsmasq: disable the service by default
2aea9a5 rdate: Fix build with hardening
2438250 strongswan: Include stdint.h for uintptr_t
1d3a7f9 netkit-rpc: Fix build with hardening flags
d1cc808 netkit-telnet: Fix build with hardening
5474882 ncftp: Upgrade to 3.2.6
c8220c5 autofs: Add build dependency on libnsl2
7679672 openhpi: Fix build on 64bit platforms e.g. aarch64
654bc63 security_flags.inc: Delete
f586080 pptp-linux: Upgrade to 1.9.0
650f0c2 ebtables: replace ebtables-save perl script with bash rewrite
9b13c65 pimd: Upgrade to 2.3.2
10e1f1f igmpproxy: Include missing sys/tupes.h and define _GNU_SOURCE
efaadc9 rdate: Define logwtmp if libc != glibc
cc4b8d1 netkit-ftp: Include sys/types.h for u_long definition
b31171e postfix: Disable nis support on musl
c915f6c zeroconf: Fix build with musl
c8ae4cf netperf: change SRC_URI to git repository
84ce83c ippool: Fix build errors found with hardening flags
24cce58 openflow: Fix build with musl
58e1b96 xl2tpd: Update to 1.3.9
ff0eb68 c-ares: update 1.12.0 -> 1.13.0
424bda9 radvd: 2.14 -> 2.17
6494731 libesmtp: Fix config.h define for snprintf detection
837527a drbd: Add recipe
6fea93a net-snmp: fix engineBoots value on SIGHUP
6235917 openl2tp: add LGPL-2.1 license
ab0fe69 openl2tp: add init script and systemd support
a3ed366 ntop: add new recipe
c9c7003 libtdb: update 1.3.12 -> 1.3.14
1d8a16f ndisc6: Upgrade to 1.0.3
271d1b0 memcached: Update to 1.5.0
4123047 tcpdump: remove unnecessary patch
855d715 squid: Add missing dependencies on openssl expat and libxml2
e15d43e postfix: Upgrade to 3.2.2
2ab6500 freeradius: Upgrade to 3.0.15
c217dd7 tcpdump: update to 4.9.1 to fix CVE-2017-11108
72e0fed wireshark: 2.2.7 -> 2.2.8
832605e mariadb: 5.5.55 -> 5.5.57
1e968c0 quagga: update to 1.2.1
e63de20 efivar: Upgrade to 0.31
09af02f openvpn: 2.4.2 -> 2.4.3
d0b2501 ipsec-tools: fix CVE-2016-10396
de317e5 netcf: upgrade to latest 0.2.8
496460a tftp-hpa: add systemd unit files
7d5d5db openconnect: fix parallel compilation failure
eb13b41 gnome-keyring: Fix compatibility with gcr 3 in oe-core
7ef5bf3 openconnect: upgrade to 7.08
93854a7 imagemagick: 7.0.5 -> 7.0.6_9
ce9708b enscript: set the correct path for perl
d43e4c6 ndisc6: specify target location of perl
48bfc8e wireguard-tools: Add bash to rdeps
e1a8ff1 openl2tp: Add bash to rdeps
fa9d177 efibootmgr: Upgrade to 0.15
d980279 efivar: Fix build with clang
ffc9153 squid: Disable format-truncation warning only with gcc
96da9a2 squid: Fix QA errors about wrong perl interpreter
5e9c0af wireguard: Upgrade to 20170810 snapshot
43a0803 recipes: remove blacklisted recipes
af951f5 meta-ruby: remove this now pretty empty layer
5e337b6 meta-efl: remove this now pretty empty layer
7d42c74 meta-systemd: remove this now pretty empty layer
ed7cb76 meta-gpe: remove this now pretty empty layer
a4aae70 ippool: Fix build errors found by clang
dcef00b iscsitarget: Fix kernel with new 4.12+ kernel
c05011d vboxguestdrivers: Upgrade to 5.1.26
eeef00f glmark2: Fix build with clang
ae052a6 gedit: Fix with with hardening flags and clang
837dc17 openipmi: Upgrade to 2.0.24
165efe1 libbonoboui: Fix with with hardening and clang
949c25b postfix: Fix build with security flags and clang
aabfa2d irssi: Upgrade to 1.0.4
3379411 nodejs: Upgrade to 8.4.0
eb5726a glade: Fix format string warnings with clang
a2f7a03 openhpi: Fix build with clang+c++11
a728028 python-subprocess32: add recipe for v3.2.7
83dec3a libmodule-build-perl: upgrade to v0.4224
fd5cc95 openhpi: Fix ptest compile failures due to narrowing warnings with clang
c3e05db libreport: 2.9.1 -> 2.9.2

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
648f7b0 qtbase, qtgraphicaleffect, qtmultimedia, qtscript, qtlocation,
qtwayland: disable gold to work around binutils bug
not included in master yet:
969f1f8 Upgrade to Qt 5.9.0
a0b2220 qtwebengine: add a fix for building demobrowser without printing support
2d14d99 qt: refresh remaining patches and add links to meta-qt5 repos
9c7507e qt: upgrade to latest revision in 5.9 branch
b7ae79a qtwebengine: fix build with glibc-2.26
c4c70e7 qtwebengine: update 0004-Force-host-toolchain-configuration.patch
2684299 qtwebengine: add patch for long paths

== Tested changes (not included in master yet) - meta-browser ==

latest upstream commit:
08576b0 Merge pull request #58 from kraj/kraj/master
not included in master yet:
f9c357c gnome-settings-daemon: remove the bbappend for removed recipe

--001a11414bf091682a0557fb9fa5
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
||2017-08-29	||7	||5	||5	||1	||0		||0		||5		||0		||2		||21		||5		||0		||0		=
||0		||0		||0		||1		||0		||=09
|}

=3D=3D Failed tasks 2017-08-29 =3D=3D

INFO: jenkins-job.sh-1.8.27 Complete log available at <a href=3D"http://log=
s.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170830_070910.log" =
style=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">h=
ttp://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170830_070=
910.log</a>

=3D=3D=3D common (4) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_compile
    * meta-openembedded/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyrin=
g_2.32.1.bb:do_compile
    * meta-openembedded/meta-oe/recipes-extended/corosync/corosync_2.4.2.bb=
:do_package_qa
    * meta-openembedded/meta-python/recipes-devtools/python/python-matplotl=
ib_1.1.0.bb:do_compile

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (3) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tool=
s_5.1.1.r37.bb:do_compile
    * meta-openembedded/meta-oe/recipes-extended/tiptop/tiptop_2.3.bb:do_co=
mpile
    * meta-openembedded/meta-oe/recipes-support/mysql/mariadb_5.5.57.bb:do_=
compile

=3D=3D=3D qemux86 (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb:do_c=
ompile

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * meta-openembedded/meta-filesystems/recipes-filesystems/smbnetfs/smbne=
tfs_git.bb:do_fetch

=3D=3D=3D Number of failed tasks (17) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 7	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld/rocko/log.world.qemuarm.20170827_234922.log/" style=3D"box-sizing:borde=
r-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.or=
g/buildlogs/oe/world/rocko/log.world.qemuarm.20170827_234922.log/</a> || <a=
 href=3D"http://errors.yoctoproject.org/Errors/Build/45927/" style=3D"box-s=
izing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://errors.y=
octoproject.org/Errors/Build/45927/</a>
|-
|| qemux86 	|| 5	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld/rocko/log.world.qemux86.20170827_234919.log/" style=3D"box-sizing:borde=
r-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.or=
g/buildlogs/oe/world/rocko/log.world.qemux86.20170827_234919.log/</a> || <a=
 href=3D"http://errors.yoctoproject.org/Errors/Build/45932/" style=3D"box-s=
izing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://errors.y=
octoproject.org/Errors/Build/45932/</a>
|-
|| qemux86_64 	|| 5	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe=
/world/rocko/log.world.qemux86-64.20170829_033912.log/" style=3D"box-sizing=
:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-li=
nux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20170829_033912.log/<=
/a> || <a href=3D"http://errors.yoctoproject.org/Errors/Build/45972/" style=
=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http:/=
/errors.yoctoproject.org/Errors/Build/45972/</a>
|}

=3D=3D=3D PNBLACKLISTs (1) =3D=3D=3D

=3D=3D=3D QA issues (34) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
|-
||0	||already-stripped
|-
||0	||build-deps
|-
||0	||compile-host-path
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
||0	||unknown-configure-option
|-
||1	||ldflags
|-
||21	||version-going-backwards
|-
||2	||file-rdeps
|-
||5	||host-user-contaminated
|-
||5	||textrel
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (1) =3D=3D=3D

Complete log: <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/roc=
ko/log.signatures.20170828_222437.log/" style=3D"box-sizing:border-box;word=
-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.org/buildlog=
s/oe/world/rocko/log.signatures.20170828_222437.log/</a>
    * ERROR: 1 issues were found in these recipes: android-tools

    * ERROR: 1 errors found in signatures.qemux86.do_package_write_ipk.sigd=
ata.log

    * ERROR: android-tools different signature for task do_package_write_ip=
k.sigdata between qemux86copy and qemux86
    * ERROR: 1 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/ss=
tate-diff/1503995078/signatures.qemux86.do_package_write_ipk.sigdata.log
    * ERROR: 1 issues were found in these recipes: android-tools


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACK=
LIST[lksctp-tools] ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39=
;, &#39;ld-is-gold&#39;, &quot;BROKEN: fails to link against sctp_connectx =
symbol&quot;, &#39;&#39;, d)}&quot;
meta-qt5:
meta-smartphone:
meta-webos-ports:
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


QA issues by type:
count: 0	issue: already-stripped


count: 0	issue: libdir


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
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary &#39;/tmp/work/i586-oe-linux/x=
264/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264-bin/usr/bin/x264&#39=
; has relocations in .text [textrel]
x264-r2731+gitAUTOINC+2b741f81e5: ELF binary &#39;/tmp/work/i586-oe-linux/x=
264/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264/usr/lib/libx264.so.1=
48&#39; has relocations in .text [textrel]


count: 0	issue: build-deps


count: 2	issue: file-rdeps
corosync-2.4.2: /usr/share/corosync/corosync contained in package corosync =
requires /tmp/hosttools/bash, but no providers found in RDEPENDS_corosync? =
[file-rdeps]
corosync-2.4.2: /usr/share/corosync/corosync-notifyd contained in package c=
orosync requires /tmp/hosttools/bash, but no providers found in RDEPENDS_co=
rosync? [file-rdeps]


count: 21	issue: version-going-backwards
python-m2crypto-0.25.1: Package version for package python-m2crypto-dbg wen=
t backwards which would break package feeds from (0:0.26.0-r0.1 to 0:0.25.1=
-r0.1) [version-going-backwards]
python-m2crypto-0.25.1: Package version for package python-m2crypto-dev wen=
t backwards which would break package feeds from (0:0.26.0-r0.1 to 0:0.25.1=
-r0.1) [version-going-backwards]
python-m2crypto-0.25.1: Package version for package python-m2crypto-doc wen=
t backwards which would break package feeds from (0:0.26.0-r0.1 to 0:0.25.1=
-r0.1) [version-going-backwards]
python-m2crypto-0.25.1: Package version for package python-m2crypto-locale =
went backwards which would break package feeds from (0:0.26.0-r0.1 to 0:0.2=
5.1-r0.1) [version-going-backwards]
python-m2crypto-0.25.1: Package version for package python-m2crypto-staticd=
ev went backwards which would break package feeds from (0:0.26.0-r0.1 to 0:=
0.25.1-r0.1) [version-going-backwards]
python-m2crypto-0.25.1: Package version for package python-m2crypto went ba=
ckwards which would break package feeds from (0:0.26.0-r0.1 to 0:0.25.1-r0.=
1) [version-going-backwards]
system-setup-keyboard-0.8.8: Package version for package system-setup-keybo=
ard-dbg went backwards which would break package feeds from (0:0.8.8-r0.48 =
to 0:0.8.8-r0.0) [version-going-backwards]
system-setup-keyboard-0.8.8: Package version for package system-setup-keybo=
ard-dev went backwards which would break package feeds from (0:0.8.8-r0.48 =
to 0:0.8.8-r0.0) [version-going-backwards]
system-setup-keyboard-0.8.8: Package version for package system-setup-keybo=
ard-doc went backwards which would break package feeds from (0:0.8.8-r0.48 =
to 0:0.8.8-r0.0) [version-going-backwards]
system-setup-keyboard-0.8.8: Package version for package system-setup-keybo=
ard-locale went backwards which would break package feeds from (0:0.8.8-r0.=
48 to 0:0.8.8-r0.0) [version-going-backwards]
system-setup-keyboard-0.8.8: Package version for package system-setup-keybo=
ard-staticdev went backwards which would break package feeds from (0:0.8.8-=
r0.48 to 0:0.8.8-r0.0) [version-going-backwards]
system-setup-keyboard-0.8.8: Package version for package system-setup-keybo=
ard went backwards which would break package feeds from (0:0.8.8-r0.48 to 0=
:0.8.8-r0.0) [version-going-backwards]
terminus-font-4.38: Package version for package terminus-font-consolefonts =
went backwards which would break package feeds from (0:4.38-r0.56 to 0:4.38=
-r0.0) [version-going-backwards]
terminus-font-4.38: Package version for package terminus-font-consoletrans =
went backwards which would break package feeds from (0:4.38-r0.56 to 0:4.38=
-r0.0) [version-going-backwards]
terminus-font-4.38: Package version for package terminus-font-dbg went back=
wards which would break package feeds from (0:4.38-r0.56 to 0:4.38-r0.0) [v=
ersion-going-backwards]
terminus-font-4.38: Package version for package terminus-font-dev went back=
wards which would break package feeds from (0:4.38-r0.56 to 0:4.38-r0.0) [v=
ersion-going-backwards]
terminus-font-4.38: Package version for package terminus-font-doc went back=
wards which would break package feeds from (0:4.38-r0.56 to 0:4.38-r0.0) [v=
ersion-going-backwards]
terminus-font-4.38: Package version for package terminus-font-locale went b=
ackwards which would break package feeds from (0:4.38-r0.56 to 0:4.38-r0.0)=
 [version-going-backwards]
terminus-font-4.38: Package version for package terminus-font-pcf went back=
wards which would break package feeds from (0:4.38-r0.56 to 0:4.38-r0.0) [v=
ersion-going-backwards]
terminus-font-4.38: Package version for package terminus-font-staticdev wen=
t backwards which would break package feeds from (0:4.38-r0.56 to 0:4.38-r0=
.0) [version-going-backwards]
terminus-font-4.38: Package version for package terminus-font went backward=
s which would break package feeds from (0:4.38-r0.56 to 0:4.38-r0.0) [versi=
on-going-backwards]


count: 5	issue: host-user-contaminated
glibc-locale-2.26: glibc-locale: /glibc-binary-localedata-yue-hk/usr/lib/lo=
cale/yue_HK/LC_MEASUREMENT is owned by uid 3004, which is the same as the u=
ser running bitbake. This may be due to host contamination [host-user-conta=
minated]
libqofono-0.87+gitrAUTOINC+54435de3be: libqofono: /libqofono-tests/usr/lib/=
libqofono-qt5/tests/tst_qofonosimmanager is owned by uid 3004, which is the=
 same as the user running bitbake. This may be due to host contamination [h=
ost-user-contaminated]
python3-3.5.3: python3: /python3-dev/usr/lib/python3.5/config/Makefile is o=
wned by uid 3004, which is the same as the user running bitbake. This may b=
e due to host contamination [host-user-contaminated]
qtbase-5.9.2+gitAUTOINC+73573fce29: qtbase: /qtbase-plugins/usr/lib/qt5/plu=
gins/generic/libqevdevkeyboardplugin.so is owned by uid 3004, which is the =
same as the user running bitbake. This may be due to host contamination [ho=
st-user-contaminated]
qtbase-5.9.2+gitAUTOINC+73573fce29: qtbase: /qtbase-staticdev/usr/lib/libQt=
5GlxSupport.a is owned by uid 3004, which is the same as the user running b=
itbake. This may be due to host contamination [host-user-contaminated]


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 1	issue: ldflags
system-setup-keyboard-0.8.8: No GNU_HASH in the elf binary: &#39;/tmp/work/=
core2-64-oe-linux/system-setup-keyboard/0.8.8-r0/packages-split/system-setu=
p-keyboard/usr/bin/system-setup-keyboard&#39; [ldflags]


count: 0	issue: compile-host-path



=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
8a60106 main: Attempt to gain bitbake.lock rather than just waiting
not included in master yet:=20
a064963 world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">latest upstream commit:=20
7f10c51 devtool: deploy-target: Support stripped libs and execs
not included in master yet:=20
2cc5a44 report-error: Allow to upload reports automatically
80ab89e buildhistory.bbclass: metadata-revs show repo parent
7e0797d metadata-revs: provide more information
62e1eb6 qemux86: Add identical qemux86copy variant for tests
63aacc3 reproducible_build.bbclass: initial support for binary reproducibil=
ity
f53f75b cpio: provide cpio-replacement-native
8498b82 image_types.bbclass: improve cpio image reproducibility
9feddbc rootfs-postcommands.bbclass: support binary reproducibility
8fdb2c0 insane.bbclass: write QA issues to log file only when they are in E=
RROR_QA or WARN_QA

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">latest upstream commit:=20
108cb03 multipath-tools: RDEPEND on bash
not included in master yet:=20
843646b dnsmasq: disable the service by default
2aea9a5 rdate: Fix build with hardening
2438250 strongswan: Include stdint.h for uintptr_t
1d3a7f9 netkit-rpc: Fix build with hardening flags
d1cc808 netkit-telnet: Fix build with hardening
5474882 ncftp: Upgrade to 3.2.6
c8220c5 autofs: Add build dependency on libnsl2
7679672 openhpi: Fix build on 64bit platforms e.g. aarch64
654bc63 security_flags.inc: Delete
f586080 pptp-linux: Upgrade to 1.9.0
650f0c2 ebtables: replace ebtables-save perl script with bash rewrite
9b13c65 pimd: Upgrade to 2.3.2
10e1f1f igmpproxy: Include missing sys/tupes.h and define _GNU_SOURCE
efaadc9 rdate: Define logwtmp if libc !=3D glibc
cc4b8d1 netkit-ftp: Include sys/types.h for u_long definition
b31171e postfix: Disable nis support on musl
c915f6c zeroconf: Fix build with musl
c8ae4cf netperf: change SRC_URI to git repository
84ce83c ippool: Fix build errors found with hardening flags
24cce58 openflow: Fix build with musl
58e1b96 xl2tpd: Update to 1.3.9
ff0eb68 c-ares: update 1.12.0 -&gt; 1.13.0
424bda9 radvd: 2.14 -&gt; 2.17
6494731 libesmtp: Fix config.h define for snprintf detection
837527a drbd: Add recipe
6fea93a net-snmp: fix engineBoots value on SIGHUP
6235917 openl2tp: add LGPL-2.1 license
ab0fe69 openl2tp: add init script and systemd support
a3ed366 ntop: add new recipe
c9c7003 libtdb: update 1.3.12 -&gt; 1.3.14
1d8a16f ndisc6: Upgrade to 1.0.3
271d1b0 memcached: Update to 1.5.0
4123047 tcpdump: remove unnecessary patch
855d715 squid: Add missing dependencies on openssl expat and libxml2
e15d43e postfix: Upgrade to 3.2.2
2ab6500 freeradius: Upgrade to 3.0.15
c217dd7 tcpdump: update to 4.9.1 to fix CVE-2017-11108
72e0fed wireshark: 2.2.7 -&gt; 2.2.8
832605e mariadb: 5.5.55 -&gt; 5.5.57
1e968c0 quagga: update to 1.2.1
e63de20 efivar: Upgrade to 0.31
09af02f openvpn: 2.4.2 -&gt; 2.4.3
d0b2501 ipsec-tools: fix CVE-2016-10396
de317e5 netcf: upgrade to latest 0.2.8
496460a tftp-hpa: add systemd unit files
7d5d5db openconnect: fix parallel compilation failure
eb13b41 gnome-keyring: Fix compatibility with gcr 3 in oe-core
7ef5bf3 openconnect: upgrade to 7.08
93854a7 imagemagick: 7.0.5 -&gt; 7.0.6_9
ce9708b enscript: set the correct path for perl
d43e4c6 ndisc6: specify target location of perl
48bfc8e wireguard-tools: Add bash to rdeps
e1a8ff1 openl2tp: Add bash to rdeps
fa9d177 efibootmgr: Upgrade to 0.15
d980279 efivar: Fix build with clang
ffc9153 squid: Disable format-truncation warning only with gcc
96da9a2 squid: Fix QA errors about wrong perl interpreter
5e9c0af wireguard: Upgrade to 20170810 snapshot
43a0803 recipes: remove blacklisted recipes
af951f5 meta-ruby: remove this now pretty empty layer
5e337b6 meta-efl: remove this now pretty empty layer
7d42c74 meta-systemd: remove this now pretty empty layer
ed7cb76 meta-gpe: remove this now pretty empty layer
a4aae70 ippool: Fix build errors found by clang
dcef00b iscsitarget: Fix kernel with new 4.12+ kernel
c05011d vboxguestdrivers: Upgrade to 5.1.26
eeef00f glmark2: Fix build with clang
ae052a6 gedit: Fix with with hardening flags and clang
837dc17 openipmi: Upgrade to 2.0.24
165efe1 libbonoboui: Fix with with hardening and clang
949c25b postfix: Fix build with security flags and clang
aabfa2d irssi: Upgrade to 1.0.4
3379411 nodejs: Upgrade to 8.4.0
eb5726a glade: Fix format string warnings with clang
a2f7a03 openhpi: Fix build with clang+c++11
a728028 python-subprocess32: add recipe for v3.2.7
83dec3a libmodule-build-perl: upgrade to v0.4224
fd5cc95 openhpi: Fix ptest compile failures due to narrowing warnings with =
clang
c3e05db libreport: 2.9.1 -&gt; 2.9.2

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
648f7b0 qtbase, qtgraphicaleffect, qtmultimedia, qtscript, qtlocation, qtwa=
yland: disable gold to work around binutils bug
not included in master yet:=20
969f1f8 Upgrade to Qt 5.9.0
a0b2220 qtwebengine: add a fix for building demobrowser without printing su=
pport
2d14d99 qt: refresh remaining patches and add links to meta-qt5 repos
9c7507e qt: upgrade to latest revision in 5.9 branch
b7ae79a qtwebengine: fix build with glibc-2.26
c4c70e7 qtwebengine: update 0004-Force-host-toolchain-configuration.patch
2684299 qtwebengine: add patch for long paths

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:br=
eak-word;margin-top:0px;margin-bottom:0px">latest upstream commit:=20
08576b0 Merge pull request #58 from kraj/kraj/master
not included in master yet:=20
f9c357c gnome-settings-daemon: remove the bbappend for removed recipe</pre>=
</pre></div>

--001a11414bf091682a0557fb9fa5--
