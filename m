Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f45.google.com (mail-vk0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id EE83E60938;
	Mon, 28 Aug 2017 08:41:34 +0000 (UTC)
Received: by mail-vk0-f45.google.com with SMTP id d124so13997048vkf.3;
	Mon, 28 Aug 2017 01:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=csXEafpteD9fx6J5RhTVJud/Oy3YYA6pAbpNlKIgutg=;
	b=QT/7np50CsGM05+Zu8OriJt9Jnf21aEq0R/dfiqrO49HnpJlJvremExephZJ53Pkxl
	gqCCqHDvtCznsRX0tUMVZZivbs8zMF4zUQx31PIyHuhxImsB7Pg9ZXK/zMEGiPEML3nQ
	g/tZQ92UN8mgb+I+987JZJAWiIPHge6hF3oHBNMlWp4NJgie2mY5rBgiK3//QPzVQ76O
	wWP7iJj//+pUa8sAJWYBTMdKXZmYUYi8XePTpnrHgexnuWZQqnCajCtTwph7s1XQPNgG
	kh4IcnRkG3hkOQmJtc7hI+snc/+0Dx4bg6Jlp4VzX7UAiGpUEZjztl2VF3e2jG+PmMMR
	Qxog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=csXEafpteD9fx6J5RhTVJud/Oy3YYA6pAbpNlKIgutg=;
	b=PuuCPmlZvNjcPHgfY5xmb3aJyoidVbpiyB0+xM7sZHm2u4w3KrEfaGlXoTjx8GYiPZ
	zHluREfRAkVbe4SCFMlizMfzymokLLjeLqLtwcony9VLU+IWGTqvn8V4dhV5VW3nf5AC
	lawBbBznsE9h0Ejms5dvD2IskoG5iGquSz0tmkzwdvwHequk5m/u7KrVFrHD/JT5sqTU
	6PSRvxb1Xyv1xmlZjc7KksoP206bT4IRKaOsfLA7z6WJSVQtsnNo/LwskZOe6z5C0D7T
	KnGf9yjG6K0Hb9rIipHEbM0gV2t+n01+/daDqUUyWSsNT+v95ftsiZ2f1GH07Bflsv3U
	2zTg==
X-Gm-Message-State: AHYfb5jb6emIiNaSJ8R6zOSC2Nip3vzt1M3TeTKrggyImk0Ivh4DuGs4
	Z15oOOg3HV43AVH0un5ESVVo2uVKiimY
X-Received: by 10.31.85.130 with SMTP id j124mr3687355vkb.177.1503909695185;
	Mon, 28 Aug 2017 01:41:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.50.144 with HTTP; Mon, 28 Aug 2017 01:41:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 28 Aug 2017 10:41:34 +0200
Message-ID: <CA+chaQc4gA_jXfFmxomw90FrXGN45f54rc9Xm+Z6uAjGUO4RUQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: State of bitbake world, Failed tasks 2017-08-27
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
X-List-Received-Date: Mon, 28 Aug 2017 08:41:35 -0000
Content-Type: multipart/alternative; boundary="001a114e56a227ea9c0557cc43bf"

--001a114e56a227ea9c0557cc43bf
Content-Type: text/plain; charset="UTF-8"

And this one with Qt 5.9.2

http://www.openembedded.org/wiki/Bitbake_World_Status

== Number of issues - stats ==
{| class='wikitable'
!|Date     !!colspan='3'|Failed tasks    !!|Signatures  !!colspan='14'|QA
!!Comment
|-
|| ||qemuarm ||qemux86 ||qemux86_64 ||all ||already-stripped ||libdir
||textrel ||build-deps ||file-rdeps ||version-going-backwards
||host-user-contaminated ||installed-vs-shipped ||unknown-configure-option
||symlink-to-sysroot ||invalid-pkgconfig ||pkgname ||ldflags
||compile-host-path ||
|-
||2017-08-27 ||9 ||10 ||7 ||4 ||0 ||0 ||1 ||0 ||2 ||6 ||4 ||0 ||0 ||0 ||0
||0 ||0 ||0 ||
|}

== Failed tasks 2017-08-27 ==

INFO: jenkins-job.sh-1.8.27 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170827_223348.log

=== common (6) ===
    * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_compile
    *
meta-openembedded/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb:
do_compile
    *
meta-openembedded/meta-networking/recipes-daemons/squid/squid_3.5.26.bb:
do_compile
    *
meta-openembedded/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb:
do_compile
    * meta-openembedded/meta-oe/recipes-extended/corosync/corosync_2.4.2.bb:
do_package_qa
    *
meta-openembedded/meta-python/recipes-devtools/python/python-matplotlib_1.1.0.bb:
do_compile

=== common-x86 (1) ===
    *
meta-openembedded/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.18.bb:
do_compile

=== qemuarm (3) ===
    *
meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:
do_compile
    * meta-openembedded/meta-oe/recipes-support/mysql/mariadb_5.5.57.bb:
do_compile
    *
meta-openembedded/meta-python/recipes-devtools/python/python-m2crypto_0.26.0.bb:
do_compile

=== qemux86 (2) ===
    * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb:
do_compile
    * meta-qt5/recipes-qt/qt5/qtwebengine_git.bb:do_compile

=== qemux86_64 (0) ===

=== Number of failed tasks (26) ===
{| class=wikitable
|-
|| qemuarm || 9 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.20170827_055148.log/
|| http://errors.yoctoproject.org/Errors/Build/45909/
|-
|| qemux86 || 10 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.20170827_051335.log/
|| http://errors.yoctoproject.org/Errors/Build/45908/
|-
|| qemux86_64 || 7 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20170827_092754.log/
|| http://errors.yoctoproject.org/Errors/Build/45910/
|}

=== PNBLACKLISTs (1) ===

=== QA issues (13) ===
{| class=wikitable
!| Count ||Issue
|-
||0 ||already-stripped
|-
||0 ||build-deps
|-
||0 ||compile-host-path
|-
||0 ||installed-vs-shipped
|-
||0 ||invalid-pkgconfig
|-
||0 ||ldflags
|-
||0 ||libdir
|-
||0 ||pkgname
|-
||0 ||symlink-to-sysroot
|-
||0 ||unknown-configure-option
|-
||1 ||textrel
|-
||2 ||file-rdeps
|-
||4 ||host-user-contaminated
|-
||6 ||version-going-backwards
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (4) ===

Complete log:
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.signatures.20170827_093850.log/
    * ERROR: 4 issues were found in these recipes: android-tools
libmodule-build-perl

    * ERROR: 1 errors found in
signatures.qemux86.do_package_write_ipk.sigdata.log
    * ERROR: 1 errors found in signatures.qemuarm.do_configure.sigdata.log
    * ERROR: 1 errors found in
signatures.qemuarm.do_populate_sysroot.sigdata.log
    * ERROR: 1 errors found in
signatures.qemuarm.do_package_write_ipk.sigdata.log

    * ERROR: android-tools different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemux86
    * ERROR: 1 errors found in
/home/jenkins/oe/world/shr-core/tmp-glibc/sstate-diff/1503862730/signatures.qemux86.do_package_write_ipk.sigdata.log
    * ERROR: libmodule-build-perl different signature for task
do_configure.sigdata between qemux86copy and qemuarm
    * ERROR: 1 errors found in
/home/jenkins/oe/world/shr-core/tmp-glibc/sstate-diff/1503862730/signatures.qemuarm.do_configure.sigdata.log
    * ERROR: libmodule-build-perl different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemuarm
    * ERROR: 1 errors found in
/home/jenkins/oe/world/shr-core/tmp-glibc/sstate-diff/1503862730/signatures.qemuarm.do_populate_sysroot.sigdata.log
    * ERROR: libmodule-build-perl different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemuarm
    * ERROR: 1 errors found in
/home/jenkins/oe/world/shr-core/tmp-glibc/sstate-diff/1503862730/signatures.qemuarm.do_package_write_ipk.sigdata.log
    * ERROR: 4 issues were found in these recipes: android-tools
libmodule-build-perl


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACKLIST[lksctp-tools]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "BROKEN: fails to
link against sctp_connectx symbol", '', d)}"
meta-qt5:
meta-smartphone:
meta-webos-ports:
PNBLACKLIST[android-system] = "depends on lxc from meta-virtualiazation
which isn't included in my world builds"
PNBLACKLIST[bigbuckbunny-1080p] = "big and doesn't really need to be tested
so much"
PNBLACKLIST[bigbuckbunny-480p] = "big and doesn't really need to be tested
so much"
PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested
so much"
PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested
so much"
PNBLACKLIST[tearsofsteel-1080p] = "big and doesn't really need to be tested
so much"
PNBLACKLIST[build-appliance-image] = "tries to include whole downloads
directory in /home/builder/poky :/"


QA issues by type:
count: 0 issue: already-stripped


count: 0 issue: libdir


count: 1 issue: textrel
corosync-2.4.2: ELF binary
'/tmp/work/core2-64-oe-linux/corosync/2.4.2-r0/packages-split/corosync/usr/sbin/corosync'
has relocations in .text [textrel]


count: 0 issue: build-deps


count: 2 issue: file-rdeps
corosync-2.4.2: /usr/share/corosync/corosync contained in package corosync
requires /tmp/hosttools/bash, but no providers found in RDEPENDS_corosync?
[file-rdeps]
corosync-2.4.2: /usr/share/corosync/corosync-notifyd contained in package
corosync requires /tmp/hosttools/bash, but no providers found in
RDEPENDS_corosync? [file-rdeps]


count: 6 issue: version-going-backwards
libmodule-build-perl-0.4224: Package version for package
libmodule-build-perl-dbg went backwards which would break package feeds
from (0:0.4224-r0.1 to 0:0.4224-r0.0) [version-going-backwards]
libmodule-build-perl-0.4224: Package version for package
libmodule-build-perl-dev went backwards which would break package feeds
from (0:0.4224-r0.1 to 0:0.4224-r0.0) [version-going-backwards]
libmodule-build-perl-0.4224: Package version for package
libmodule-build-perl-doc went backwards which would break package feeds
from (0:0.4224-r0.1 to 0:0.4224-r0.0) [version-going-backwards]
libmodule-build-perl-0.4224: Package version for package
libmodule-build-perl-locale went backwards which would break package feeds
from (0:0.4224-r0.1 to 0:0.4224-r0.0) [version-going-backwards]
libmodule-build-perl-0.4224: Package version for package
libmodule-build-perl-staticdev went backwards which would break package
feeds from (0:0.4224-r0.1 to 0:0.4224-r0.0) [version-going-backwards]
libmodule-build-perl-0.4224: Package version for package
libmodule-build-perl went backwards which would break package feeds from
(0:0.4224-r0.1 to 0:0.4224-r0.0) [version-going-backwards]


count: 4 issue: host-user-contaminated
qt5-creator-3.5.1: qt5-creator:
/qt5-creator/usr/lib/qt5/qtcreator/plugins/libClearCase.so is owned by uid
3004, which is the same as the user running bitbake. This may be due to
host contamination [host-user-contaminated]
qtbase-5.9.2+gitAUTOINC+73573fce29: qtbase:
/qtbase-mkspecs/usr/lib/qt5/mkspecs/modules/qt_lib_network_private.pri is
owned by uid 3004, which is the same as the user running bitbake. This may
be due to host contamination [host-user-contaminated]
qtbase-5.9.2+gitAUTOINC+73573fce29: qtbase:
/qtbase-plugins/usr/lib/qt5/plugins/generic/libqevdevmouseplugin.so is
owned by uid 3004, which is the same as the user running bitbake. This may
be due to host contamination [host-user-contaminated]
qtquick1-5.9.2+gitAUTOINC+9bf0edd9bd: qtquick1:
/qtquick1-qmlplugins/usr/lib/qt5/imports/Qt/labs/particles/plugins.qmltypes
is owned by uid 3004, which is the same as the user running bitbake. This
may be due to host contamination [host-user-contaminated]


count: 0 issue: installed-vs-shipped


count: 0 issue: unknown-configure-option


count: 0 issue: symlink-to-sysroot


count: 0 issue: invalid-pkgconfig


count: 0 issue: pkgname


count: 0 issue: ldflags


count: 0 issue: compile-host-path



== Tested changes (not included in master yet) - bitbake ==
latest upstream commit:
8a60106 main: Attempt to gain bitbake.lock rather than just waiting
not included in master yet:
a064963 world-image: add extra target

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
a8b89b3 default-providers: Add entries for pkgconfig (due to pkg-conf being
added)
not included in master yet:
338cc89 report-error: Allow to upload reports automatically
f492b98 buildhistory.bbclass: metadata-revs show repo parent
eb590e9 metadata-revs: provide more information
7860d90 qemux86: Add identical qemux86copy variant for tests
9fdb66a reproducible_build.bbclass: initial support for binary
reproducibility
097476c cpio: provide cpio-replacement-native
c3b689d image_types.bbclass: improve cpio image reproducibility
cbd025c rootfs-postcommands.bbclass: support binary reproducibility
c0f57c9 insane.bbclass: write QA issues to log file only when they are in
ERROR_QA or WARN_QA

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
ac2a6d2 json-spirit: Add -latomic to LDFLAGS
not included in master yet:
6ff499b dnsmasq: disable the service by default
ca0e943 rdate: Fix build with hardening
7e3d8e4 strongswan: Include stdint.h for uintptr_t
217431e netkit-rpc: Fix build with hardening flags
f3819cc netkit-telnet: Fix build with hardening
048e071 ncftp: Upgrade to 3.2.6
61495a9 autofs: Add build dependency on libnsl2
96e606d openhpi: Fix build on 64bit platforms e.g. aarch64
7feddb1 security_flags.inc: Delete
a4723a6 pptp-linux: Upgrade to 1.9.0
ab4774e ebtables: replace ebtables-save perl script with bash rewrite
3a96b76 pimd: Upgrade to 2.3.2
aa43496 igmpproxy: Include missing sys/tupes.h and define _GNU_SOURCE
92bc7d2 rdate: Define logwtmp if libc != glibc
a04b53f netkit-ftp: Include sys/types.h for u_long definition
feb1653 postfix: Disable nis support on musl
93ee634 zeroconf: Fix build with musl
163c868 netperf: change SRC_URI to git repository
4c2b4c4 ippool: Fix build errors found with hardening flags
5ebba48 openflow: Fix build with musl
610e392 xl2tpd: Update to 1.3.9
53982a0 c-ares: update 1.12.0 -> 1.13.0
b101101 radvd: 2.14 -> 2.17
9a7309d libesmtp: Fix config.h define for snprintf detection
b9b2b01 drbd: Add recipe
b7b27a5 net-snmp: fix engineBoots value on SIGHUP
f8559af openl2tp: add LGPL-2.1 license
ce8ed9a openl2tp: add init script and systemd support
4f97a6c ntop: add new recipe
21479a9 libtdb: update 1.3.12 -> 1.3.14
d946a42 ndisc6: Upgrade to 1.0.3
f3dd13e memcached: Update to 1.5.0
3436c8e tcpdump: remove unnecessary patch
209a90c squid: Add missing dependencies on openssl expat and libxml2
5061e4f postfix: Upgrade to 3.2.2
33dff9b mpv: Update to version 0.26.0.
cc37aef python3-blivet: add recipe 2.2.0
ad94afe python3-blivetgui: add recipe 2.1.5
47fb79b librcf: Add -latomic to LDFLAGS
6599b98 upower: update 0.99.4 -> 0.99.5
b720216 geany: update 1.30.1 -> 1.31
29805cb geany-plugins: update 1.30 -> 1.31
c94d8e7 python-wrapt: update to version 1.10.11
69a7670 python-cmd2: update to version 0.7.6
353a2ab python-sqlalchemy: update to version 1.1.13
363c33c python-pytest: update to version 3.2.1
38c6ecb python-pyro4: update to version 4.61
07c7d83 php: move to version 7.1.8 from 7.1.7
03eaf98 gsoap: Upgrade to 2.8.51
16a43c3 caps: Mark ARCH empty
5d25280 mailcap: upgrade to 2.1.48
17dbbb3 mailx: Force mailx to build with openssl10
ac85ad1 php: disable this version by default
7b9dfb7 freeradius: Upgrade to 3.0.15
4978e89 tcpdump: update to 4.9.1 to fix CVE-2017-11108
a99294b vlock: add new recipe
1e2f4b9 fontforge: update to 20170731 to fix CVEs
5567b2a wireshark: 2.2.7 -> 2.2.8
632f250 start-stop-daemon: Only create a link in ${base_sbindir} if
necessary
d8811b9 python-chardet: Extend to native and nativesdk
ebd41b0 openobex: disable building documentation
ac15d80 openwsman: rename to 2.6.3
da135d6 iproute2: add bbappend for supporting tipc tool
cebccb3 tipcutils: add runtime dependency for iproute2-tipc
f920d63 mariadb: 5.5.55 -> 5.5.57
64ee547 rsyslog: fix CVE-2017-12588
cc02e10 rsyslog: install logrotate configuration file into correct location
56d6e0a libvpx: upgrade to 1.6.1
a4ee06b quagga: update to 1.2.1
961abc1 gd: update to 2.2.4
cb686c3 efivar: Upgrade to 0.31
3706ca2 openvpn: 2.4.2 -> 2.4.3
de9860c python*-ptyprocess: add v0.5.2
fab2dd5 python*-pexpect: add v4.2.1
543455e ipsec-tools: fix CVE-2016-10396
6c775f9 multipath-tools: add bash to RDEPENDS
5141a9b python3-pykickstart: tweak shebang to python3
52f0eb1 xmlrpc-c: add perl to RDEPENDS
92d6a0f phpmyadmin: upgrade to 4.7.3
3716024 pcsc-lite: Update to 1.8.22
d3af646 python-requests: Update to version 2.18.4
e3057cc sthttpd: update to 2.27.1
c9f10ab glibmm: fix perl path
3a8e526 postgresql: update to 9.4.13
4c2ea5a Dhrystone: add recipe 2.1
c2a4bdf makedumpfile: update to 1.6.2
6ce999e mozjs: customize HOST_CFLAGS
f3e09bd adduser: use get_perl_version instead of PERLVERSION
a17cffb iperf3: 3.1.3 -> 3.2
40916b0 webmin: add systemd service file
598c29c python-markupsafe: Extend to build native version too
a7f2d3a vim: update to 8.0.0983
9756937 python-m2crypto: Upgrade to 0.26.0
87f7ea5 gnulib: upgrade to 2017-08-20.18
0c7c8fb collectd: 5.7.1 -> 5.7.2
54b071b netcf: upgrade to latest 0.2.8
0c0ef1d tftp-hpa: add systemd unit files
d1f41a0 gperftools: fixup HOMEPAGE
8f5ed1d openconnect: fix parallel compilation failure
5d15b1c gnome-keyring: Fix compatibility with gcr 3 in oe-core
863d51e openconnect: upgrade to 7.08
4dd9884 gflags: add runtime dependency on bash
f3fc0cc logcheck: update to 1.3.18 and move to meta-perl
3815615 python-pycrypto: Security fix CVE-2013-7459
3d85015 logwarn: set correct paths and add missing dependency
c2dbb9b openldap: fix native LDFLAGS build error
166bf62 xorg-fonts-100dpi: unblacklist recipe
a60ac1c recipes: remove blacklisted recipes
69529c6 meta-ruby: remove this now pretty empty layer
61e8314 meta-efl: remove this now pretty empty layer
07ed328 meta-systemd: remove this now pretty empty layer
7b0f2ca meta-gpe: remove this now pretty empty layer
73eccec imagemagick: 7.0.5 -> 7.0.6_9
524e123 libmodule-build-perl: upgrade to v0.4224 and fix qa error
05db9b0 enscript ndisc6: specify target location of perl
51c6073 python*-pylint: upgrade to v1.7.2 and fix qa error
75ba188 python*-astroid: use SPDX compatible license identifier
5332d4f mpich: Define PERL variable and pass to configure
5c2bbb5 wireguard-tools: Add bash to rdeps
3b00593 enscript: Define PERL variable
9773412 udevil: Add missing rdep on bash
ac8a952 libbonobo: Pass PERL_PATH to do_configure
bbcaa21 openl2tp: Add bash to rdeps
2e5566d python-paho-mqtt: licensing improvements
535065f python-paho-mqtt: fix downloading during do_compile
cd3949d libhugetlbfs: Define HUGETLB_LDSCRIPT_PATH
1a7fdc6 efibootmgr: Upgrade to 0.15
c814630 efivar: Fix build with clang
155a8a1 evolution-data-server: Fix build with clang
aeabfe1 wvstreams: Fix parallel build
f7c8d6b squid: Disable format-truncation warning only with gcc
95ba434 squid: Fix QA errors about wrong perl interpreter
4fb1f38 libreport: fix typo of SRC_URI
652998f python-html5lib: add Python3 support
a6fbb22 python-webencodings: add Python3 support
da14eb2 python-beautifulsoup4: add new recipe for both python2 and python3
c01288b multipath-tools: RDEPEND on bash
ca1e184 wireguard: Upgrade to 20170810 snapshot

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
8960831 qwt-qt5.inc: fix QA warning
not included in master yet:
6e9892a qtbase: add ptest
d53382f qt5-ptest: fix build with yocto < 2.3 (pyro)
9042969 qtbase: Fix ptests with clang
0b41b62 qtbase: Use sched_yield instead of pthread_yield
17d94b7 quazip: update to 0.7.3 and add missing metadata
3963daa qtwebkit: Backport a patch to fix build with icu-59
7efcea9 qt3d: Fix build with clang
c74e5b8 qtbase: remove qtbase-native from DEPENDS
1619723 gstreamer1.0-plugins-bad: add qt5 packageconfig
d82317c qtbase: refresh the patches
246ec7b qtwebengine: refresh patches
142f888 qt3d: refresh patches
3522d3d qtbase: fix Krogoth build regression from efa8aaf
d9f4b6e meta-toolchain-qt5: don't rely on COREBASE/LICENSE
209e7e6 qtwebengine: disable SECURITY_STRINGFORMAT to fix the build
648f7b0 qtbase, qtgraphicaleffect, qtmultimedia, qtscript, qtlocation,
qtwayland: disable gold to work around binutils bug
969f1f8 Upgrade to Qt 5.9.0
a0b2220 qtwebengine: add a fix for building demobrowser without printing
support
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

--001a114e56a227ea9c0557cc43bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">And this one with Qt 5.9.2<div><br></div><div><div><a href=
=3D"http://www.openembedded.org/wiki/Bitbake_World_Status">http://www.opene=
mbedded.org/wiki/Bitbake_World_Status</a></div><div><br></div><div>=3D=3D N=
umber of issues - stats =3D=3D</div><div>{| class=3D&#39;wikitable&#39;</di=
v><div>!|Date<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre"=
>		</span> =C2=A0 =C2=A0 !!colspan=3D&#39;3&#39;|Failed tasks<span class=3D=
"gmail-Apple-tab-span" style=3D"white-space:pre">			</span> =C2=A0 =C2=A0!!=
|Signatures<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	=
	</span> =C2=A0!!colspan=3D&#39;14&#39;|QA !!Comment</div><div>|-</div><div=
>||<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">		</span>=
||qemuarm<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</=
span>||qemux86<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre=
">	</span>||qemux86_64<span class=3D"gmail-Apple-tab-span" style=3D"white-s=
pace:pre">	</span>||all <span class=3D"gmail-Apple-tab-span" style=3D"white=
-space:pre">	</span>||already-stripped<span class=3D"gmail-Apple-tab-span" =
style=3D"white-space:pre">	</span>||libdir<span class=3D"gmail-Apple-tab-sp=
an" style=3D"white-space:pre">	</span>||textrel<span class=3D"gmail-Apple-t=
ab-span" style=3D"white-space:pre">	</span>||build-deps<span class=3D"gmail=
-Apple-tab-span" style=3D"white-space:pre">	</span>||file-rdeps<span class=
=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</span>||version-going=
-backwards<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	<=
/span>||host-user-contaminated<span class=3D"gmail-Apple-tab-span" style=3D=
"white-space:pre">	</span>||installed-vs-shipped<span class=3D"gmail-Apple-=
tab-span" style=3D"white-space:pre">	</span>||unknown-configure-option<span=
 class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</span>||symlink=
-to-sysroot<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	=
</span>||invalid-pkgconfig<span class=3D"gmail-Apple-tab-span" style=3D"whi=
te-space:pre">	</span>||pkgname<span class=3D"gmail-Apple-tab-span" style=
=3D"white-space:pre">	</span>||ldflags<span class=3D"gmail-Apple-tab-span" =
style=3D"white-space:pre">	</span>||compile-host-path<span class=3D"gmail-A=
pple-tab-span" style=3D"white-space:pre">	</span>||<span class=3D"gmail-App=
le-tab-span" style=3D"white-space:pre">	</span></div><div>|-</div><div>||20=
17-08-27<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</s=
pan>||9<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</sp=
an>||10<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</sp=
an>||7<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</spa=
n>||4<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</span=
>||0<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">		</span=
>||0<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">		</span=
>||1<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">		</span=
>||0<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">		</span=
>||2<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">		</span=
>||6<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">		</span=
>||4<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">		</span=
>||0<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">		</span=
>||0<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">		</span=
>||0<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">		</span=
>||0<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">		</span=
>||0<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">		</span=
>||0<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">		</span=
>||0<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">		</span=
>||<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</span><=
/div><div>|}</div><div><br></div><div>=3D=3D Failed tasks 2017-08-27 =3D=3D=
</div><div><br></div><div>INFO: jenkins-job.sh-1.8.27 Complete log availabl=
e at <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.re=
port.20170827_223348.log">http://logs.nslu2-linux.org/buildlogs/oe/world/ro=
cko/log.report.20170827_223348.log</a></div><div><br></div><div>=3D=3D=3D c=
ommon (6) =3D=3D=3D</div><div>=C2=A0 =C2=A0 * meta-browser/recipes-mozilla/=
firefox/firefox_45.9.0esr.bb:do_compile</div><div>=C2=A0 =C2=A0 * meta-open=
embedded/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb:do_=
compile</div><div>=C2=A0 =C2=A0 * meta-openembedded/meta-networking/recipes=
-daemons/squid/squid_3.5.26.bb:do_compile</div><div>=C2=A0 =C2=A0 * meta-op=
enembedded/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.=
3+svn502.bb:do_compile</div><div>=C2=A0 =C2=A0 * meta-openembedded/meta-oe/=
recipes-extended/corosync/corosync_2.4.2.bb:do_package_qa</div><div>=C2=A0 =
=C2=A0 * meta-openembedded/meta-python/recipes-devtools/python/python-matpl=
otlib_1.1.0.bb:do_compile</div><div><br></div><div>=3D=3D=3D common-x86 (1)=
 =3D=3D=3D</div><div>=C2=A0 =C2=A0 * meta-openembedded/meta-oe/recipes-supp=
ort/vboxguestdrivers/vboxguestdrivers_5.1.18.bb:do_compile</div><div><br></=
div><div>=3D=3D=3D qemuarm (3) =3D=3D=3D</div><div>=C2=A0 =C2=A0 * meta-ope=
nembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb=
:do_compile</div><div>=C2=A0 =C2=A0 * meta-openembedded/meta-oe/recipes-sup=
port/mysql/mariadb_5.5.57.bb:do_compile</div><div>=C2=A0 =C2=A0 * meta-open=
embedded/meta-python/recipes-devtools/python/python-m2crypto_0.26.0.bb:do_c=
ompile</div><div><br></div><div>=3D=3D=3D qemux86 (2) =3D=3D=3D</div><div>=
=C2=A0 =C2=A0 * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_g=
it.bb:do_compile</div><div>=C2=A0 =C2=A0 * meta-qt5/recipes-qt/qt5/qtwebeng=
ine_git.bb:do_compile</div><div><br></div><div>=3D=3D=3D qemux86_64 (0) =3D=
=3D=3D</div><div><br></div><div>=3D=3D=3D Number of failed tasks (26) =3D=
=3D=3D</div><div>{| class=3Dwikitable</div><div>|-</div><div>|| qemuarm <sp=
an class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</span>|| 9<sp=
an class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</span> || <a =
href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemu=
arm.20170827_055148.log/">http://logs.nslu2-linux.org/buildlogs/oe/world/ro=
cko/log.world.qemuarm.20170827_055148.log/</a> || <a href=3D"http://errors.=
yoctoproject.org/Errors/Build/45909/">http://errors.yoctoproject.org/Errors=
/Build/45909/</a></div><div>|-</div><div>|| qemux86 <span class=3D"gmail-Ap=
ple-tab-span" style=3D"white-space:pre">	</span>|| 10<span class=3D"gmail-A=
pple-tab-span" style=3D"white-space:pre">	</span> || <a href=3D"http://logs=
.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.20170827_051335=
.log/">http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux=
86.20170827_051335.log/</a> || <a href=3D"http://errors.yoctoproject.org/Er=
rors/Build/45908/">http://errors.yoctoproject.org/Errors/Build/45908/</a></=
div><div>|-</div><div>|| qemux86_64 <span class=3D"gmail-Apple-tab-span" st=
yle=3D"white-space:pre">	</span>|| 7<span class=3D"gmail-Apple-tab-span" st=
yle=3D"white-space:pre">	</span> || <a href=3D"http://logs.nslu2-linux.org/=
buildlogs/oe/world/rocko/log.world.qemux86-64.20170827_092754.log/">http://=
logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20170827=
_092754.log/</a> || <a href=3D"http://errors.yoctoproject.org/Errors/Build/=
45910/">http://errors.yoctoproject.org/Errors/Build/45910/</a></div><div>|}=
</div><div><br></div><div>=3D=3D=3D PNBLACKLISTs (1) =3D=3D=3D</div><div><b=
r></div><div>=3D=3D=3D QA issues (13) =3D=3D=3D</div><div>{| class=3Dwikita=
ble</div><div>!| Count<span class=3D"gmail-Apple-tab-span" style=3D"white-s=
pace:pre">		</span>||Issue</div><div>|-</div><div>||0<span class=3D"gmail-A=
pple-tab-span" style=3D"white-space:pre">	</span>||already-stripped</div><d=
iv>|-</div><div>||0<span class=3D"gmail-Apple-tab-span" style=3D"white-spac=
e:pre">	</span>||build-deps</div><div>|-</div><div>||0<span class=3D"gmail-=
Apple-tab-span" style=3D"white-space:pre">	</span>||compile-host-path</div>=
<div>|-</div><div>||0<span class=3D"gmail-Apple-tab-span" style=3D"white-sp=
ace:pre">	</span>||installed-vs-shipped</div><div>|-</div><div>||0<span cla=
ss=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</span>||invalid-pkg=
config</div><div>|-</div><div>||0<span class=3D"gmail-Apple-tab-span" style=
=3D"white-space:pre">	</span>||ldflags</div><div>|-</div><div>||0<span clas=
s=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</span>||libdir</div>=
<div>|-</div><div>||0<span class=3D"gmail-Apple-tab-span" style=3D"white-sp=
ace:pre">	</span>||pkgname</div><div>|-</div><div>||0<span class=3D"gmail-A=
pple-tab-span" style=3D"white-space:pre">	</span>||symlink-to-sysroot</div>=
<div>|-</div><div>||0<span class=3D"gmail-Apple-tab-span" style=3D"white-sp=
ace:pre">	</span>||unknown-configure-option</div><div>|-</div><div>||1<span=
 class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</span>||textrel=
</div><div>|-</div><div>||2<span class=3D"gmail-Apple-tab-span" style=3D"wh=
ite-space:pre">	</span>||file-rdeps</div><div>|-</div><div>||4<span class=
=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</span>||host-user-con=
taminated</div><div>|-</div><div>||6<span class=3D"gmail-Apple-tab-span" st=
yle=3D"white-space:pre">	</span>||version-going-backwards</div><div>|}</div=
><div><br></div><div><br></div><div><br></div><div>=3D=3D=3D Incorrect PACK=
AGE_ARCH or sstate signatures (4) =3D=3D=3D</div><div><br></div><div>Comple=
te log: <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log=
.signatures.20170827_093850.log/">http://logs.nslu2-linux.org/buildlogs/oe/=
world/rocko/log.signatures.20170827_093850.log/</a></div><div>=C2=A0 =C2=A0=
 * ERROR: 4 issues were found in these recipes: android-tools libmodule-bui=
ld-perl</div><div><br></div><div>=C2=A0 =C2=A0 * ERROR: 1 errors found in s=
ignatures.qemux86.do_package_write_ipk.sigdata.log</div><div>=C2=A0 =C2=A0 =
* ERROR: 1 errors found in signatures.qemuarm.do_configure.sigdata.log</div=
><div>=C2=A0 =C2=A0 * ERROR: 1 errors found in signatures.qemuarm.do_popula=
te_sysroot.sigdata.log</div><div>=C2=A0 =C2=A0 * ERROR: 1 errors found in s=
ignatures.qemuarm.do_package_write_ipk.sigdata.log</div><div><br></div><div=
>=C2=A0 =C2=A0 * ERROR: android-tools different signature for task do_packa=
ge_write_ipk.sigdata between qemux86copy and qemux86</div><div>=C2=A0 =C2=
=A0 * ERROR: 1 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/ss=
tate-diff/1503862730/signatures.qemux86.do_package_write_ipk.sigdata.log</d=
iv><div>=C2=A0 =C2=A0 * ERROR: libmodule-build-perl different signature for=
 task do_configure.sigdata between qemux86copy and qemuarm</div><div>=C2=A0=
 =C2=A0 * ERROR: 1 errors found in /home/jenkins/oe/world/shr-core/tmp-glib=
c/sstate-diff/1503862730/signatures.qemuarm.do_configure.sigdata.log</div><=
div>=C2=A0 =C2=A0 * ERROR: libmodule-build-perl different signature for tas=
k do_populate_sysroot.sigdata between qemux86copy and qemuarm</div><div>=C2=
=A0 =C2=A0 * ERROR: 1 errors found in /home/jenkins/oe/world/shr-core/tmp-g=
libc/sstate-diff/1503862730/signatures.qemuarm.do_populate_sysroot.sigdata.=
log</div><div>=C2=A0 =C2=A0 * ERROR: libmodule-build-perl different signatu=
re for task do_package_write_ipk.sigdata between qemux86copy and qemuarm</d=
iv><div>=C2=A0 =C2=A0 * ERROR: 1 errors found in /home/jenkins/oe/world/shr=
-core/tmp-glibc/sstate-diff/1503862730/signatures.qemuarm.do_package_write_=
ipk.sigdata.log</div><div>=C2=A0 =C2=A0 * ERROR: 4 issues were found in the=
se recipes: android-tools libmodule-build-perl</div><div><br></div><div><br=
></div><div>PNBLACKLISTs:</div><div>openembedded-core/:</div><div>meta-brow=
ser:</div><div>meta-openembedded:</div><div>meta-networking/recipes-support=
/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACKLIST[lksctp-tools] ?=3D &quot;$=
{@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;ld-is-gold&#39;, &quot;=
BROKEN: fails to link against sctp_connectx symbol&quot;, &#39;&#39;, d)}&q=
uot;</div><div>meta-qt5:</div><div>meta-smartphone:</div><div>meta-webos-po=
rts:</div><div>PNBLACKLIST[android-system] =3D &quot;depends on lxc from me=
ta-virtualiazation which isn&#39;t included in my world builds&quot;</div><=
div>PNBLACKLIST[bigbuckbunny-1080p] =3D &quot;big and doesn&#39;t really ne=
ed to be tested so much&quot;</div><div>PNBLACKLIST[bigbuckbunny-480p] =3D =
&quot;big and doesn&#39;t really need to be tested so much&quot;</div><div>=
PNBLACKLIST[bigbuckbunny-720p] =3D &quot;big and doesn&#39;t really need to=
 be tested so much&quot;</div><div>PNBLACKLIST[bigbuckbunny-720p] =3D &quot=
;big and doesn&#39;t really need to be tested so much&quot;</div><div>PNBLA=
CKLIST[tearsofsteel-1080p] =3D &quot;big and doesn&#39;t really need to be =
tested so much&quot;</div><div>PNBLACKLIST[build-appliance-image] =3D &quot=
;tries to include whole downloads directory in /home/builder/poky :/&quot;<=
/div><div><br></div><div><br></div><div>QA issues by type:</div><div>count:=
 0<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</span>is=
sue: already-stripped</div><div><br></div><div><br></div><div>count: 0<span=
 class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</span>issue: li=
bdir</div><div><br></div><div><br></div><div>count: 1<span class=3D"gmail-A=
pple-tab-span" style=3D"white-space:pre">	</span>issue: textrel</div><div>c=
orosync-2.4.2: ELF binary &#39;/tmp/work/core2-64-oe-linux/corosync/2.4.2-r=
0/packages-split/corosync/usr/sbin/corosync&#39; has relocations in .text [=
textrel]</div><div><br></div><div><br></div><div>count: 0<span class=3D"gma=
il-Apple-tab-span" style=3D"white-space:pre">	</span>issue: build-deps</div=
><div><br></div><div><br></div><div>count: 2<span class=3D"gmail-Apple-tab-=
span" style=3D"white-space:pre">	</span>issue: file-rdeps</div><div>corosyn=
c-2.4.2: /usr/share/corosync/corosync contained in package corosync require=
s /tmp/hosttools/bash, but no providers found in RDEPENDS_corosync? [file-r=
deps]</div><div>corosync-2.4.2: /usr/share/corosync/corosync-notifyd contai=
ned in package corosync requires /tmp/hosttools/bash, but no providers foun=
d in RDEPENDS_corosync? [file-rdeps]</div><div><br></div><div><br></div><di=
v>count: 6<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	<=
/span>issue: version-going-backwards</div><div>libmodule-build-perl-0.4224:=
 Package version for package libmodule-build-perl-dbg went backwards which =
would break package feeds from (0:0.4224-r0.1 to 0:0.4224-r0.0) [version-go=
ing-backwards]</div><div>libmodule-build-perl-0.4224: Package version for p=
ackage libmodule-build-perl-dev went backwards which would break package fe=
eds from (0:0.4224-r0.1 to 0:0.4224-r0.0) [version-going-backwards]</div><d=
iv>libmodule-build-perl-0.4224: Package version for package libmodule-build=
-perl-doc went backwards which would break package feeds from (0:0.4224-r0.=
1 to 0:0.4224-r0.0) [version-going-backwards]</div><div>libmodule-build-per=
l-0.4224: Package version for package libmodule-build-perl-locale went back=
wards which would break package feeds from (0:0.4224-r0.1 to 0:0.4224-r0.0)=
 [version-going-backwards]</div><div>libmodule-build-perl-0.4224: Package v=
ersion for package libmodule-build-perl-staticdev went backwards which woul=
d break package feeds from (0:0.4224-r0.1 to 0:0.4224-r0.0) [version-going-=
backwards]</div><div>libmodule-build-perl-0.4224: Package version for packa=
ge libmodule-build-perl went backwards which would break package feeds from=
 (0:0.4224-r0.1 to 0:0.4224-r0.0) [version-going-backwards]</div><div><br><=
/div><div><br></div><div>count: 4<span class=3D"gmail-Apple-tab-span" style=
=3D"white-space:pre">	</span>issue: host-user-contaminated</div><div>qt5-cr=
eator-3.5.1: qt5-creator: /qt5-creator/usr/lib/qt5/qtcreator/plugins/libCle=
arCase.so is owned by uid 3004, which is the same as the user running bitba=
ke. This may be due to host contamination [host-user-contaminated]</div><di=
v>qtbase-5.9.2+gitAUTOINC+73573fce29: qtbase: /qtbase-mkspecs/usr/lib/qt5/m=
kspecs/modules/qt_lib_network_private.pri is owned by uid 3004, which is th=
e same as the user running bitbake. This may be due to host contamination [=
host-user-contaminated]</div><div>qtbase-5.9.2+gitAUTOINC+73573fce29: qtbas=
e: /qtbase-plugins/usr/lib/qt5/plugins/generic/libqevdevmouseplugin.so is o=
wned by uid 3004, which is the same as the user running bitbake. This may b=
e due to host contamination [host-user-contaminated]</div><div>qtquick1-5.9=
.2+gitAUTOINC+9bf0edd9bd: qtquick1: /qtquick1-qmlplugins/usr/lib/qt5/import=
s/Qt/labs/particles/plugins.qmltypes is owned by uid 3004, which is the sam=
e as the user running bitbake. This may be due to host contamination [host-=
user-contaminated]</div><div><br></div><div><br></div><div>count: 0<span cl=
ass=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</span>issue: insta=
lled-vs-shipped</div><div><br></div><div><br></div><div>count: 0<span class=
=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</span>issue: unknown-=
configure-option</div><div><br></div><div><br></div><div>count: 0<span clas=
s=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</span>issue: symlink=
-to-sysroot</div><div><br></div><div><br></div><div>count: 0<span class=3D"=
gmail-Apple-tab-span" style=3D"white-space:pre">	</span>issue: invalid-pkgc=
onfig</div><div><br></div><div><br></div><div>count: 0<span class=3D"gmail-=
Apple-tab-span" style=3D"white-space:pre">	</span>issue: pkgname</div><div>=
<br></div><div><br></div><div>count: 0<span class=3D"gmail-Apple-tab-span" =
style=3D"white-space:pre">	</span>issue: ldflags</div><div><br></div><div><=
br></div><div>count: 0<span class=3D"gmail-Apple-tab-span" style=3D"white-s=
pace:pre">	</span>issue: compile-host-path</div><div><br></div><div><br></d=
iv><div><br></div><div>=3D=3D Tested changes (not included in master yet) -=
 bitbake =3D=3D</div><div>latest upstream commit:=C2=A0</div><div>8a60106 m=
ain: Attempt to gain bitbake.lock rather than just waiting</div><div>not in=
cluded in master yet:=C2=A0</div><div>a064963 world-image: add extra target=
</div><div><br></div><div>=3D=3D Tested changes (not included in master yet=
) - openembedded-core =3D=3D</div><div>latest upstream commit:=C2=A0</div><=
div>a8b89b3 default-providers: Add entries for pkgconfig (due to pkg-conf b=
eing added)</div><div>not included in master yet:=C2=A0</div><div>338cc89 r=
eport-error: Allow to upload reports automatically</div><div>f492b98 buildh=
istory.bbclass: metadata-revs show repo parent</div><div>eb590e9 metadata-r=
evs: provide more information</div><div>7860d90 qemux86: Add identical qemu=
x86copy variant for tests</div><div>9fdb66a reproducible_build.bbclass: ini=
tial support for binary reproducibility</div><div>097476c cpio: provide cpi=
o-replacement-native</div><div>c3b689d image_types.bbclass: improve cpio im=
age reproducibility</div><div>cbd025c rootfs-postcommands.bbclass: support =
binary reproducibility</div><div>c0f57c9 insane.bbclass: write QA issues to=
 log file only when they are in ERROR_QA or WARN_QA</div><div><br></div><di=
v>=3D=3D Tested changes (not included in master yet) - meta-openembedded =
=3D=3D</div><div>latest upstream commit:=C2=A0</div><div>ac2a6d2 json-spiri=
t: Add -latomic to LDFLAGS</div><div>not included in master yet:=C2=A0</div=
><div>6ff499b dnsmasq: disable the service by default</div><div>ca0e943 rda=
te: Fix build with hardening</div><div>7e3d8e4 strongswan: Include stdint.h=
 for uintptr_t</div><div>217431e netkit-rpc: Fix build with hardening flags=
</div><div>f3819cc netkit-telnet: Fix build with hardening</div><div>048e07=
1 ncftp: Upgrade to 3.2.6</div><div>61495a9 autofs: Add build dependency on=
 libnsl2</div><div>96e606d openhpi: Fix build on 64bit platforms e.g. aarch=
64</div><div>7feddb1 security_flags.inc: Delete</div><div>a4723a6 pptp-linu=
x: Upgrade to 1.9.0</div><div>ab4774e ebtables: replace ebtables-save perl =
script with bash rewrite</div><div>3a96b76 pimd: Upgrade to 2.3.2</div><div=
>aa43496 igmpproxy: Include missing sys/tupes.h and define _GNU_SOURCE</div=
><div>92bc7d2 rdate: Define logwtmp if libc !=3D glibc</div><div>a04b53f ne=
tkit-ftp: Include sys/types.h for u_long definition</div><div>feb1653 postf=
ix: Disable nis support on musl</div><div>93ee634 zeroconf: Fix build with =
musl</div><div>163c868 netperf: change SRC_URI to git repository</div><div>=
4c2b4c4 ippool: Fix build errors found with hardening flags</div><div>5ebba=
48 openflow: Fix build with musl</div><div>610e392 xl2tpd: Update to 1.3.9<=
/div><div>53982a0 c-ares: update 1.12.0 -&gt; 1.13.0</div><div>b101101 radv=
d: 2.14 -&gt; 2.17</div><div>9a7309d libesmtp: Fix config.h define for snpr=
intf detection</div><div>b9b2b01 drbd: Add recipe</div><div>b7b27a5 net-snm=
p: fix engineBoots value on SIGHUP</div><div>f8559af openl2tp: add LGPL-2.1=
 license</div><div>ce8ed9a openl2tp: add init script and systemd support</d=
iv><div>4f97a6c ntop: add new recipe</div><div>21479a9 libtdb: update 1.3.1=
2 -&gt; 1.3.14</div><div>d946a42 ndisc6: Upgrade to 1.0.3</div><div>f3dd13e=
 memcached: Update to 1.5.0</div><div>3436c8e tcpdump: remove unnecessary p=
atch</div><div>209a90c squid: Add missing dependencies on openssl expat and=
 libxml2</div><div>5061e4f postfix: Upgrade to 3.2.2</div><div>33dff9b mpv:=
 Update to version 0.26.0.</div><div>cc37aef python3-blivet: add recipe 2.2=
.0</div><div>ad94afe python3-blivetgui: add recipe 2.1.5</div><div>47fb79b =
librcf: Add -latomic to LDFLAGS</div><div>6599b98 upower: update 0.99.4 -&g=
t; 0.99.5</div><div>b720216 geany: update 1.30.1 -&gt; 1.31</div><div>29805=
cb geany-plugins: update 1.30 -&gt; 1.31</div><div>c94d8e7 python-wrapt: up=
date to version 1.10.11</div><div>69a7670 python-cmd2: update to version 0.=
7.6</div><div>353a2ab python-sqlalchemy: update to version 1.1.13</div><div=
>363c33c python-pytest: update to version 3.2.1</div><div>38c6ecb python-py=
ro4: update to version 4.61</div><div>07c7d83 php: move to version 7.1.8 fr=
om 7.1.7</div><div>03eaf98 gsoap: Upgrade to 2.8.51</div><div>16a43c3 caps:=
 Mark ARCH empty</div><div>5d25280 mailcap: upgrade to 2.1.48</div><div>17d=
bbb3 mailx: Force mailx to build with openssl10</div><div>ac85ad1 php: disa=
ble this version by default</div><div>7b9dfb7 freeradius: Upgrade to 3.0.15=
</div><div>4978e89 tcpdump: update to 4.9.1 to fix CVE-2017-11108</div><div=
>a99294b vlock: add new recipe</div><div>1e2f4b9 fontforge: update to 20170=
731 to fix CVEs</div><div>5567b2a wireshark: 2.2.7 -&gt; 2.2.8</div><div>63=
2f250 start-stop-daemon: Only create a link in ${base_sbindir} if necessary=
</div><div>d8811b9 python-chardet: Extend to native and nativesdk</div><div=
>ebd41b0 openobex: disable building documentation</div><div>ac15d80 openwsm=
an: rename to 2.6.3</div><div>da135d6 iproute2: add bbappend for supporting=
 tipc tool</div><div>cebccb3 tipcutils: add runtime dependency for iproute2=
-tipc</div><div>f920d63 mariadb: 5.5.55 -&gt; 5.5.57</div><div>64ee547 rsys=
log: fix CVE-2017-12588</div><div>cc02e10 rsyslog: install logrotate config=
uration file into correct location</div><div>56d6e0a libvpx: upgrade to 1.6=
.1</div><div>a4ee06b quagga: update to 1.2.1</div><div>961abc1 gd: update t=
o 2.2.4</div><div>cb686c3 efivar: Upgrade to 0.31</div><div>3706ca2 openvpn=
: 2.4.2 -&gt; 2.4.3</div><div>de9860c python*-ptyprocess: add v0.5.2</div><=
div>fab2dd5 python*-pexpect: add v4.2.1</div><div>543455e ipsec-tools: fix =
CVE-2016-10396</div><div>6c775f9 multipath-tools: add bash to RDEPENDS</div=
><div>5141a9b python3-pykickstart: tweak shebang to python3</div><div>52f0e=
b1 xmlrpc-c: add perl to RDEPENDS</div><div>92d6a0f phpmyadmin: upgrade to =
4.7.3</div><div>3716024 pcsc-lite: Update to 1.8.22</div><div>d3af646 pytho=
n-requests: Update to version 2.18.4</div><div>e3057cc sthttpd: update to 2=
.27.1</div><div>c9f10ab glibmm: fix perl path</div><div>3a8e526 postgresql:=
 update to 9.4.13</div><div>4c2ea5a Dhrystone: add recipe 2.1</div><div>c2a=
4bdf makedumpfile: update to 1.6.2</div><div>6ce999e mozjs: customize HOST_=
CFLAGS</div><div>f3e09bd adduser: use get_perl_version instead of PERLVERSI=
ON</div><div>a17cffb iperf3: 3.1.3 -&gt; 3.2</div><div>40916b0 webmin: add =
systemd service file</div><div>598c29c python-markupsafe: Extend to build n=
ative version too</div><div>a7f2d3a vim: update to 8.0.0983</div><div>97569=
37 python-m2crypto: Upgrade to 0.26.0</div><div>87f7ea5 gnulib: upgrade to =
2017-08-20.18</div><div>0c7c8fb collectd: 5.7.1 -&gt; 5.7.2</div><div>54b07=
1b netcf: upgrade to latest 0.2.8</div><div>0c0ef1d tftp-hpa: add systemd u=
nit files</div><div>d1f41a0 gperftools: fixup HOMEPAGE</div><div>8f5ed1d op=
enconnect: fix parallel compilation failure</div><div>5d15b1c gnome-keyring=
: Fix compatibility with gcr 3 in oe-core</div><div>863d51e openconnect: up=
grade to 7.08</div><div>4dd9884 gflags: add runtime dependency on bash</div=
><div>f3fc0cc logcheck: update to 1.3.18 and move to meta-perl</div><div>38=
15615 python-pycrypto: Security fix CVE-2013-7459</div><div>3d85015 logwarn=
: set correct paths and add missing dependency</div><div>c2dbb9b openldap: =
fix native LDFLAGS build error</div><div>166bf62 xorg-fonts-100dpi: unblack=
list recipe</div><div>a60ac1c recipes: remove blacklisted recipes</div><div=
>69529c6 meta-ruby: remove this now pretty empty layer</div><div>61e8314 me=
ta-efl: remove this now pretty empty layer</div><div>07ed328 meta-systemd: =
remove this now pretty empty layer</div><div>7b0f2ca meta-gpe: remove this =
now pretty empty layer</div><div>73eccec imagemagick: 7.0.5 -&gt; 7.0.6_9</=
div><div>524e123 libmodule-build-perl: upgrade to v0.4224 and fix qa error<=
/div><div>05db9b0 enscript ndisc6: specify target location of perl</div><di=
v>51c6073 python*-pylint: upgrade to v1.7.2 and fix qa error</div><div>75ba=
188 python*-astroid: use SPDX compatible license identifier</div><div>5332d=
4f mpich: Define PERL variable and pass to configure</div><div>5c2bbb5 wire=
guard-tools: Add bash to rdeps</div><div>3b00593 enscript: Define PERL vari=
able</div><div>9773412 udevil: Add missing rdep on bash</div><div>ac8a952 l=
ibbonobo: Pass PERL_PATH to do_configure</div><div>bbcaa21 openl2tp: Add ba=
sh to rdeps</div><div>2e5566d python-paho-mqtt: licensing improvements</div=
><div>535065f python-paho-mqtt: fix downloading during do_compile</div><div=
>cd3949d libhugetlbfs: Define HUGETLB_LDSCRIPT_PATH</div><div>1a7fdc6 efibo=
otmgr: Upgrade to 0.15</div><div>c814630 efivar: Fix build with clang</div>=
<div>155a8a1 evolution-data-server: Fix build with clang</div><div>aeabfe1 =
wvstreams: Fix parallel build</div><div>f7c8d6b squid: Disable format-trunc=
ation warning only with gcc</div><div>95ba434 squid: Fix QA errors about wr=
ong perl interpreter</div><div>4fb1f38 libreport: fix typo of SRC_URI</div>=
<div>652998f python-html5lib: add Python3 support</div><div>a6fbb22 python-=
webencodings: add Python3 support</div><div>da14eb2 python-beautifulsoup4: =
add new recipe for both python2 and python3</div><div>c01288b multipath-too=
ls: RDEPEND on bash</div><div>ca1e184 wireguard: Upgrade to 20170810 snapsh=
ot</div><div><br></div><div>=3D=3D Tested changes (not included in master y=
et) - meta-qt5 =3D=3D</div><div>latest upstream commit:=C2=A0</div><div>896=
0831 qwt-qt5.inc: fix QA warning</div><div>not included in master yet:=C2=
=A0</div><div>6e9892a qtbase: add ptest</div><div>d53382f qt5-ptest: fix bu=
ild with yocto &lt; 2.3 (pyro)</div><div>9042969 qtbase: Fix ptests with cl=
ang</div><div>0b41b62 qtbase: Use sched_yield instead of pthread_yield</div=
><div>17d94b7 quazip: update to 0.7.3 and add missing metadata</div><div>39=
63daa qtwebkit: Backport a patch to fix build with icu-59</div><div>7efcea9=
 qt3d: Fix build with clang</div><div>c74e5b8 qtbase: remove qtbase-native =
from DEPENDS</div><div>1619723 gstreamer1.0-plugins-bad: add qt5 packagecon=
fig</div><div>d82317c qtbase: refresh the patches</div><div>246ec7b qtweben=
gine: refresh patches</div><div>142f888 qt3d: refresh patches</div><div>352=
2d3d qtbase: fix Krogoth build regression from efa8aaf</div><div>d9f4b6e me=
ta-toolchain-qt5: don&#39;t rely on COREBASE/LICENSE</div><div>209e7e6 qtwe=
bengine: disable SECURITY_STRINGFORMAT to fix the build</div><div>648f7b0 q=
tbase, qtgraphicaleffect, qtmultimedia, qtscript, qtlocation, qtwayland: di=
sable gold to work around binutils bug</div><div>969f1f8 Upgrade to Qt 5.9.=
0</div><div>a0b2220 qtwebengine: add a fix for building demobrowser without=
 printing support</div><div>2d14d99 qt: refresh remaining patches and add l=
inks to meta-qt5 repos</div><div>9c7507e qt: upgrade to latest revision in =
5.9 branch</div><div>b7ae79a qtwebengine: fix build with glibc-2.26</div><d=
iv>c4c70e7 qtwebengine: update 0004-Force-host-toolchain-configuration.patc=
h</div><div>2684299 qtwebengine: add patch for long paths</div><div><br></d=
iv><div>=3D=3D Tested changes (not included in master yet) - meta-browser =
=3D=3D</div><div>latest upstream commit:=C2=A0</div><div>08576b0 Merge pull=
 request #58 from kraj/kraj/master</div><div>not included in master yet:=C2=
=A0</div><div>f9c357c gnome-settings-daemon: remove the bbappend for remove=
d recipe</div></div></div>

--001a114e56a227ea9c0557cc43bf--
