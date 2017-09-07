Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f52.google.com (mail-vk0-f52.google.com
	[209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id 841CE60017;
	Thu,  7 Sep 2017 08:44:56 +0000 (UTC)
Received: by mail-vk0-f52.google.com with SMTP id c82so8294274vkd.4;
	Thu, 07 Sep 2017 01:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=lS2x6tx1lecXQqvxz3zkSwpxfdpZwPPwfZspHMudSNg=;
	b=Llf4BTx0rogQw3UV7c/N06UBWE6srTSTPavgI2dfnmFcKO70lrjm+oIYqnBy4KDuQf
	dTpY9rT4vdSw49cXByvz3m0m9A3nLMCpH0TQzphJ+Dtp82wP7Pk8FYdWUW4mYyoq3aEb
	rdMNcv9nSwvkDghT1u1Gehm09czVYP8nrW0pfX9Iql/Nlyk0g8ZzDzTjFOtTujLTRXIi
	J/zbw1NFCOxCRC1vrdlnFQnYGPlbhxWdtrzTDA5JPpZaoicR6p5E0IlY99CPCfn0Szg4
	/2sO+isWea6PcOrYkylNkY/6M1MfJ6JCqdiQjPpmxl5vyDF4u4H1XCL0mWdBEKzZFnuQ
	6z0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=lS2x6tx1lecXQqvxz3zkSwpxfdpZwPPwfZspHMudSNg=;
	b=UZFd9rmO6L7AYHlEs5UWs4rBLSfN94GqnkX3TgxjPM+4oH55Jp8ODBpj0od5Ea6+Gd
	NcbSNWL+vSoxwJhuj87TS3BlOkDWnmyIKFEbIXJyAypzIT+yOLVCHpp3u0GKsn1QpU8b
	HCmDvsESYxWT1h3lrlAKwy7/h0vcAxY8KiSmYnZ6rQVOgOiy+3bHvpcEQwuG5QeEnD7Y
	OZyUfrll8PDZEH21RX2g6XMJGKXvhYFcMDqnCd16yYdE1Doge3tLyK3AgG73GGqeTFiy
	Anbqg/c9SRvChLAG8Mc9s47hve0+fYeZS9TWc6Fs3+HYhg2xHo9GqBmT+/R/FyP2qR3n
	A42Q==
X-Gm-Message-State: AHPjjUi27f2ABiXoK/8y3xUK72mcodrGV20Ei/wckrkD1HAJSVTVKj36
	IkwkA5eUJul9kWcTlaB8yuYRVXo3pO9B
X-Google-Smtp-Source: ADKCNb7RaZEiHJKMJRjggRIFQ7zz7l6u6iTz0OHMR3fJqGRtuYgQMccBTyjMk4y7jHywIxyapvMKCF2ePq7jy8ZKdqw=
X-Received: by 10.31.84.5 with SMTP id i5mr1015875vkb.177.1504773897758; Thu,
	07 Sep 2017 01:44:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.15.69 with HTTP; Thu, 7 Sep 2017 01:44:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 7 Sep 2017 10:44:57 +0200
Message-ID: <CA+chaQckFMsPUNfd=+Sch=iVyCVhyPiajQDtYyncXbPnZn_5yQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: State of bitbake world, Failed tasks 2017-09-05
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
X-List-Received-Date: Thu, 07 Sep 2017 08:44:58 -0000
Content-Type: multipart/alternative; boundary="001a114e5f08a4b1470558957966"

--001a114e5f08a4b1470558957966
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
||2017-09-05	||4	||4	||4	||0	||0		||0		||3		||0		||0		||18		||0		||0		||0		||0		||0		||0		||0		||0		||
|}

== Failed tasks 2017-09-05 ==

INFO: jenkins-job.sh-1.8.28 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170906_130000.log

=== common (3) ===
    * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_compile
    * meta-openembedded/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.12.0.bb:do_compile
    * meta-openembedded/meta-networking/recipes-support/ndisc6/ndisc6_git.bb:do_compile

=== common-x86 (1) ===
    * meta-openembedded/meta-oe/recipes-extended/leveldb/leveldb_git.bb:do_compile

=== qemuarm (1) ===
    * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile

=== qemux86 (0) ===

=== qemux86_64 (0) ===

=== Number of failed tasks (12) ===
{| class=wikitable
|-
|| qemuarm 	|| 4	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.20170905_045419.log/
||
|-
|| qemux86 	|| 4	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.20170905_045419.log/
|| http://errors.yoctoproject.org/Errors/Build/46257/
|-
|| qemux86_64 	|| 4	 ||
http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20170905_211032.log/
|| http://errors.yoctoproject.org/Errors/Build/46296/
|}

=== PNBLACKLISTs (4) ===

=== QA issues (21) ===
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
||0	||libdir
|-
||0	||pkgname
|-
||0	||symlink-to-sysroot
|-
||0	||unknown-configure-option
|-
||18	||version-going-backwards
|-
||3	||textrel
|}



=== Incorrect PACKAGE_ARCH or sstate signatures (0) ===

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.signatures.20170905_171408.log/

No issues detected


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb:PNBLACKLIST[smbnetfs]
?= "Fails to build with RSS
http://errors.yoctoproject.org/Errors/Details/132827/ - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb:PNBLACKLIST[gnome-keyring]
?= "This version conflicts with gcr from oe-core - the recipe will be
removed on 2017-09-01 unless the issue is fixed"
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACKLIST[lksctp-tools]
?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "BROKEN:
fails to link against sctp_connectx symbol", '', d)}"
meta-oe/recipes-support/system-setup-keyboard/system-setup-keyboard_0.8.8.bb:PNBLACKLIST[system-setup-keyboard]
?= "Depends on blacklisted system-config-keyboard-native - the recipe
will be removed on 2017-09-01 unless the issue is fixed"
meta-qt5:
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


count: 3	issue: textrel
chromium-54.0.2810.2: ELF binary
'/tmp/work/i586-oe-linux/chromium/54.0.2810.2-r0/packages-split/chromium/usr/bin/chromium/chrome'
has relocations in .text [textrel]
chromium-wayland-53.0.2785.143: ELF binary
'/tmp/work/i586-oe-linux/chromium-wayland/53.0.2785.143-r0/packages-split/chromium-wayland/usr/bin/chromium/chrome'
has relocations in .text [textrel]
corosync-2.4.2: ELF binary
'/tmp/work/core2-64-oe-linux/corosync/2.4.2-r0/packages-split/corosync/usr/sbin/corosync'
has relocations in .text [textrel]


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 18	issue: version-going-backwards
psqlodbc-09.05.0300: Package version for package psqlodbc-dbg went
backwards which would break package feeds from (0:09.05.0300-r0.32 to
0:09.05.0300-r0.0) [version-going-backwards]
psqlodbc-09.05.0300: Package version for package psqlodbc-dbg went
backwards which would break package feeds from (0:09.05.0300-r0.38 to
0:09.05.0300-r0.0) [version-going-backwards]
psqlodbc-09.05.0300: Package version for package psqlodbc-dbg went
backwards which would break package feeds from (0:09.05.0300-r0.39 to
0:09.05.0300-r0.0) [version-going-backwards]
psqlodbc-09.05.0300: Package version for package psqlodbc-dev went
backwards which would break package feeds from (0:09.05.0300-r0.32 to
0:09.05.0300-r0.0) [version-going-backwards]
psqlodbc-09.05.0300: Package version for package psqlodbc-dev went
backwards which would break package feeds from (0:09.05.0300-r0.38 to
0:09.05.0300-r0.0) [version-going-backwards]
psqlodbc-09.05.0300: Package version for package psqlodbc-dev went
backwards which would break package feeds from (0:09.05.0300-r0.39 to
0:09.05.0300-r0.0) [version-going-backwards]
psqlodbc-09.05.0300: Package version for package psqlodbc-doc went
backwards which would break package feeds from (0:09.05.0300-r0.32 to
0:09.05.0300-r0.0) [version-going-backwards]
psqlodbc-09.05.0300: Package version for package psqlodbc-doc went
backwards which would break package feeds from (0:09.05.0300-r0.38 to
0:09.05.0300-r0.0) [version-going-backwards]
psqlodbc-09.05.0300: Package version for package psqlodbc-doc went
backwards which would break package feeds from (0:09.05.0300-r0.39 to
0:09.05.0300-r0.0) [version-going-backwards]
psqlodbc-09.05.0300: Package version for package psqlodbc-locale went
backwards which would break package feeds from (0:09.05.0300-r0.32 to
0:09.05.0300-r0.0) [version-going-backwards]
psqlodbc-09.05.0300: Package version for package psqlodbc-locale went
backwards which would break package feeds from (0:09.05.0300-r0.38 to
0:09.05.0300-r0.0) [version-going-backwards]
psqlodbc-09.05.0300: Package version for package psqlodbc-locale went
backwards which would break package feeds from (0:09.05.0300-r0.39 to
0:09.05.0300-r0.0) [version-going-backwards]
psqlodbc-09.05.0300: Package version for package psqlodbc-staticdev
went backwards which would break package feeds from
(0:09.05.0300-r0.32 to 0:09.05.0300-r0.0) [version-going-backwards]
psqlodbc-09.05.0300: Package version for package psqlodbc-staticdev
went backwards which would break package feeds from
(0:09.05.0300-r0.38 to 0:09.05.0300-r0.0) [version-going-backwards]
psqlodbc-09.05.0300: Package version for package psqlodbc-staticdev
went backwards which would break package feeds from
(0:09.05.0300-r0.39 to 0:09.05.0300-r0.0) [version-going-backwards]
psqlodbc-09.05.0300: Package version for package psqlodbc went
backwards which would break package feeds from (0:09.05.0300-r0.32 to
0:09.05.0300-r0.0) [version-going-backwards]
psqlodbc-09.05.0300: Package version for package psqlodbc went
backwards which would break package feeds from (0:09.05.0300-r0.38 to
0:09.05.0300-r0.0) [version-going-backwards]
psqlodbc-09.05.0300: Package version for package psqlodbc went
backwards which would break package feeds from (0:09.05.0300-r0.39 to
0:09.05.0300-r0.0) [version-going-backwards]


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
1ca2eec cooker: clear extra config settings and remote datastores on
client disconnect
not included in master yet:
fbcc4d6 world-image: add extra target
3e32f80 fetch2: Allow Fetch.download() to warn instead of error

== Tested changes (not included in master yet) - openembedded-core ==
latest upstream commit:
cc319b6 mesa-gl: Fix build after recent mesa PACKAGECONFIG changes
not included in master yet:
ae7fe8a report-error: Allow to upload reports automatically
bba20cb buildhistory.bbclass: metadata-revs show repo parent
2ab075c metadata-revs: provide more information
d8bffe1 qemux86: Add identical qemux86copy variant for tests
e1d5fbf reproducible_build.bbclass: initial support for binary reproducibility
41bef84 cpio: provide cpio-replacement-native
9afb603 image_types.bbclass: improve cpio image reproducibility
847937b rootfs-postcommands.bbclass: support binary reproducibility
6b26861 insane.bbclass: write QA issues to log file only when they are
in ERROR_QA or WARN_QA
0749360 sstate.bbclass: Do not cause build failures due to setscene errors

== Tested changes (not included in master yet) - meta-openembedded ==
latest upstream commit:
e5681e1 layer.conf: remove FREESMARTPHONE_GIT variable
not included in master yet:
10bace9 dnsmasq: disable the service by default
4f93985 rdate: Fix build with hardening
e5c886b strongswan: Include stdint.h for uintptr_t
4677c6a netkit-rpc: Fix build with hardening flags
c8efb3c netkit-telnet: Fix build with hardening
76662d3 ncftp: Upgrade to 3.2.6
53c064f autofs: Add build dependency on libnsl2
8e943f5 openhpi: Fix build on 64bit platforms e.g. aarch64
da43327 security_flags.inc: Delete
2194ffc pptp-linux: Upgrade to 1.9.0
3426784 ebtables: replace ebtables-save perl script with bash rewrite
a9a8724 pimd: Upgrade to 2.3.2
f131a95 igmpproxy: Include missing sys/tupes.h and define _GNU_SOURCE
e7c14f4 rdate: Define logwtmp if libc != glibc
ec9e308 netkit-ftp: Include sys/types.h for u_long definition
066a9c7 postfix: Disable nis support on musl
8da3ce9 zeroconf: Fix build with musl
9c2d01f ippool: Fix build errors found with hardening flags
fff054d openflow: Fix build with musl
25d61ba xl2tpd: Update to 1.3.9
51b1378 c-ares: update 1.12.0 -> 1.13.0
f636b27 radvd: 2.14 -> 2.17
82bf544 libesmtp: Fix config.h define for snprintf detection
4cb7315 drbd: Add recipe
6aa8077 net-snmp: fix engineBoots value on SIGHUP
b270230 openl2tp: add LGPL-2.1 license
fb9b74b openl2tp: add init script and systemd support
4d7fd49 ntop: add new recipe
650c226 libtdb: update 1.3.12 -> 1.3.14
bc2ecf9 ndisc6: Upgrade to 1.0.3
60b2801 memcached: Update to 1.5.0
ab22cc4 tcpdump: remove unnecessary patch
424e6e6 squid: Add missing dependencies on openssl expat and libxml2
07e09c6 postfix: Upgrade to 3.2.2
8ef3e24 freeradius: Upgrade to 3.0.15
37e3ccd tcpdump: update to 4.9.1 to fix CVE-2017-11108
ebff0aa wireshark: 2.2.7 -> 2.2.8
d95f6b1 krb5: fix CVE-2017-11368
4b71e13 quagga: update to 1.2.1
346ae75 openvpn: 2.4.2 -> 2.4.3
d1cf702 ipsec-tools: fix CVE-2016-10396
1b793a9 netcf: upgrade to latest 0.2.8
87377c8 tftp-hpa: add systemd unit files
b04d96c openconnect: fix parallel compilation failure
20c367e openconnect: upgrade to 7.08
6b1cd36 ndisc6: specify target location of perl
053e2cd wireguard-tools: Add bash to rdeps
e4a15f9 openl2tp: Add bash to rdeps
42116f6 squid: Disable format-truncation warning only with gcc
2cb8fcb squid: Fix QA errors about wrong perl interpreter
08f0852 wireguard: Upgrade to 20170810 snapshot
ba3a771 ippool: Fix build errors found by clang
ba00b39 iscsitarget: Fix kernel with new 4.12+ kernel
3267d6d postfix: Fix build with security flags and clang
e8f4c41 openhpi: Fix build with clang+c++11
64030b1 openhpi: Fix ptest compile failures due to narrowing warnings with clang
96f8322 tcpreplay: upgrade to 4.2.6
78433db tftp-hpa: Fix PIE build with clang
d2e0096 samba: 4.6.5 -> 4.6.7
1fc6436 wolfssl: upgrade to 3.12.0
c6bf516 netperf: upgrade to 2.7.0+ with git version
2624ca3 json-spirit: link to libatomic
907da25 librcf: link to libatomic
33f5af8 ntop: Fix build with musl
02ac394 corosync: Fix build with musl
88d3bbf netkit-rwho: Fix build with musl
ec4305b netkit-tftp: Fix build with musl
6d3a59a serial-forward: Fix build with hardening+musl
f71212d gsoap: Fix build with musl
7b54903 libpwquality: fix do_qa_configure issue
5171cff drbd-utils: only rmmod if DRBD is a module
b022240 libgphoto2: Copy Makefile.in.in from gettext-native
ef87d81 lxdm: Copy Makefile.in.in from gettext-native
85fb730 mosquitto: add from meta-intel-iot-middleware and update
d2eabf8 paho-mqtt-c: add recipe from meta-intel-iot-middleware and update
63fb151 iptraf-ng: Add new recipe
62bff08 sblim-sfcb: Fix build with musl
eeeec50 libmtp: fix build issue
5602afe libexecinfo: fix complie issue
336297c pmtools: use update-alternatives for acpixtract
4f94470 openjpeg: upgrade to 2.2.0
7f47d47 vpnc: Reduce lifetime value to widely-compatible value
6bd0135 pam-ssh-agent-auth: Get newer version of config.sub and
config.guess scripts
23cd1a5 python-matplotlib: Upgrade to 2.0.2
6f1ee9c wireshark: update to 2.2.9
7704781 gperftools: Fix build with musl
7b92849 mongodb: Disable for armv7 and fix build on musl
ede7768 open-vm-tools: Add -Wno-address-of-packed-member for with clang
392aa0d xfsprogs: Upgrade to 4.12.0
bde0fe7 tftp-hpa: Add HOMEPAGE info into recipe file.
c22dea3 cyrus-sasl: Add HOMEPAGE info into recipe file.
0ed9cde pps-tools: Add HOMEPAGE info into recipe file.
fed5f72 libjs-jquery: Add HOMEPAGE info into recipe file.
f2eada8 netkit-rpc: Link libtirpc on musl
e668879 ndisc6: Fix build with clang and update to latest on git
5110b4d psqlodbc: add recipe
baf375f python-networkx: add python-2to3 to RDEPENDS
01abeb9 protobuf-c: use git fetcher instead of github archives
1cb2de1 leveldb: Fix build with clang
41c1962 rsyslog: fix segfault after configuration errors
eac05cb logcheck: Add HOMEPAGE info into recipe file

== Tested changes (not included in master yet) - meta-qt5 ==
latest upstream commit:
2684299 qtwebengine: add patch for long paths
not included in master yet:
90d4a41 qtbase: Add OE clang specific mkspecs
ec80b09 qtbase: Fix build with musl/clang
be3c2d3 qtbase-native: set path to mkspec for cmake properly again

== Tested changes (not included in master yet) - meta-browser ==
latest upstream commit:
972cab7 gnome-settings-daemon: remove the bbappend for removed recipe
not included in master yet:

--001a114e5f08a4b1470558957966
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><pre class=3D"gmail-console-output" style=3D"box-sizing:bo=
rder-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bo=
ttom:0px;color:rgb(51,51,51);font-size:14px"><a href=3D"http://www.openembe=
dded.org/wiki/Bitbake_World_Status" style=3D"box-sizing:border-box;word-wra=
p:break-word;color:rgb(92,53,102)">http://www.openembedded.org/wiki/Bitbake=
_World_Status</a>

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
||2017-09-05	||4	||4	||4	||0	||0		||0		||3		||0		||0		||18		||0		||0		||0		=
||0		||0		||0		||0		||0		||=09
|}

=3D=3D Failed tasks 2017-09-05 =3D=3D

INFO: jenkins-job.sh-1.8.28 Complete log available at <a href=3D"http://log=
s.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170906_130000.log" =
style=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">h=
ttp://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170906_130=
000.log</a>

=3D=3D=3D common (3) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_compile
    * meta-openembedded/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.=
12.0.bb:do_compile
    * meta-openembedded/meta-networking/recipes-support/ndisc6/ndisc6_git.b=
b:do_compile

=3D=3D=3D common-x86 (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-extended/leveldb/leveldb_git.bb:do_=
compile

=3D=3D=3D qemuarm (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tool=
s_5.1.1.r37.bb:do_compile

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (12) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 4	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld/rocko/log.world.qemuarm.20170905_045419.log/" style=3D"box-sizing:borde=
r-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.or=
g/buildlogs/oe/world/rocko/log.world.qemuarm.20170905_045419.log/</a> ||=20
|-
|| qemux86 	|| 4	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/wo=
rld/rocko/log.world.qemux86.20170905_045419.log/" style=3D"box-sizing:borde=
r-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.or=
g/buildlogs/oe/world/rocko/log.world.qemux86.20170905_045419.log/</a> || <a=
 href=3D"http://errors.yoctoproject.org/Errors/Build/46257/" style=3D"box-s=
izing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://errors.y=
octoproject.org/Errors/Build/46257/</a>
|-
|| qemux86_64 	|| 4	 || <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe=
/world/rocko/log.world.qemux86-64.20170905_211032.log/" style=3D"box-sizing=
:border-box;word-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-li=
nux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20170905_211032.log/<=
/a> || <a href=3D"http://errors.yoctoproject.org/Errors/Build/46296/" style=
=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http:/=
/errors.yoctoproject.org/Errors/Build/46296/</a>
|}

=3D=3D=3D PNBLACKLISTs (4) =3D=3D=3D

=3D=3D=3D QA issues (21) =3D=3D=3D
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
||0	||unknown-configure-option
|-
||18	||version-going-backwards
|-
||3	||textrel
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/roc=
ko/log.signatures.20170905_171408.log/" style=3D"box-sizing:border-box;word=
-wrap:break-word;color:rgb(92,53,102)">http://logs.nslu2-linux.org/buildlog=
s/oe/world/rocko/log.signatures.20170905_171408.log/</a>

No issues detected


PNBLACKLISTs:
openembedded-core/:
meta-browser:
meta-openembedded:
meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb:PNBLACKLIST[s=
mbnetfs] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctop=
roject.org/Errors/Details/132827/" style=3D"box-sizing:border-box;word-wrap=
:break-word;color:rgb(92,53,102)">http://errors.yoctoproject.org/Errors/Det=
ails/132827/</a> - the recipe will be removed on 2017-09-01 unless the issu=
e is fixed&quot;
meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb:PNBLACKLIST[=
gnome-keyring] ?=3D &quot;This version conflicts with gcr from oe-core - th=
e recipe will be removed on 2017-09-01 unless the issue is fixed&quot;
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACK=
LIST[lksctp-tools] ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39=
;, &#39;ld-is-gold&#39;, &quot;BROKEN: fails to link against sctp_connectx =
symbol&quot;, &#39;&#39;, d)}&quot;
meta-oe/recipes-support/system-setup-keyboard/system-setup-keyboard_0.8.8.b=
b:PNBLACKLIST[system-setup-keyboard] ?=3D &quot;Depends on blacklisted syst=
em-config-keyboard-native - the recipe will be removed on 2017-09-01 unless=
 the issue is fixed&quot;
meta-qt5:
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


count: 3	issue: textrel
chromium-54.0.2810.2: ELF binary &#39;/tmp/work/i586-oe-linux/chromium/54.0=
.2810.2-r0/packages-split/chromium/usr/bin/chromium/chrome&#39; has relocat=
ions in .text [textrel]
chromium-wayland-53.0.2785.143: ELF binary &#39;/tmp/work/i586-oe-linux/chr=
omium-wayland/53.0.2785.143-r0/packages-split/chromium-wayland/usr/bin/chro=
mium/chrome&#39; has relocations in .text [textrel]
corosync-2.4.2: ELF binary &#39;/tmp/work/core2-64-oe-linux/corosync/2.4.2-=
r0/packages-split/corosync/usr/sbin/corosync&#39; has relocations in .text =
[textrel]


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 18	issue: version-going-backwards
psqlodbc-09.05.0300: Package version for package psqlodbc-dbg went backward=
s which would break package feeds from (0:09.05.0300-r0.32 to 0:09.05.0300-=
r0.0) [version-going-backwards]
psqlodbc-09.05.0300: Package version for package psqlodbc-dbg went backward=
s which would break package feeds from (0:09.05.0300-r0.38 to 0:09.05.0300-=
r0.0) [version-going-backwards]
psqlodbc-09.05.0300: Package version for package psqlodbc-dbg went backward=
s which would break package feeds from (0:09.05.0300-r0.39 to 0:09.05.0300-=
r0.0) [version-going-backwards]
psqlodbc-09.05.0300: Package version for package psqlodbc-dev went backward=
s which would break package feeds from (0:09.05.0300-r0.32 to 0:09.05.0300-=
r0.0) [version-going-backwards]
psqlodbc-09.05.0300: Package version for package psqlodbc-dev went backward=
s which would break package feeds from (0:09.05.0300-r0.38 to 0:09.05.0300-=
r0.0) [version-going-backwards]
psqlodbc-09.05.0300: Package version for package psqlodbc-dev went backward=
s which would break package feeds from (0:09.05.0300-r0.39 to 0:09.05.0300-=
r0.0) [version-going-backwards]
psqlodbc-09.05.0300: Package version for package psqlodbc-doc went backward=
s which would break package feeds from (0:09.05.0300-r0.32 to 0:09.05.0300-=
r0.0) [version-going-backwards]
psqlodbc-09.05.0300: Package version for package psqlodbc-doc went backward=
s which would break package feeds from (0:09.05.0300-r0.38 to 0:09.05.0300-=
r0.0) [version-going-backwards]
psqlodbc-09.05.0300: Package version for package psqlodbc-doc went backward=
s which would break package feeds from (0:09.05.0300-r0.39 to 0:09.05.0300-=
r0.0) [version-going-backwards]
psqlodbc-09.05.0300: Package version for package psqlodbc-locale went backw=
ards which would break package feeds from (0:09.05.0300-r0.32 to 0:09.05.03=
00-r0.0) [version-going-backwards]
psqlodbc-09.05.0300: Package version for package psqlodbc-locale went backw=
ards which would break package feeds from (0:09.05.0300-r0.38 to 0:09.05.03=
00-r0.0) [version-going-backwards]
psqlodbc-09.05.0300: Package version for package psqlodbc-locale went backw=
ards which would break package feeds from (0:09.05.0300-r0.39 to 0:09.05.03=
00-r0.0) [version-going-backwards]
psqlodbc-09.05.0300: Package version for package psqlodbc-staticdev went ba=
ckwards which would break package feeds from (0:09.05.0300-r0.32 to 0:09.05=
.0300-r0.0) [version-going-backwards]
psqlodbc-09.05.0300: Package version for package psqlodbc-staticdev went ba=
ckwards which would break package feeds from (0:09.05.0300-r0.38 to 0:09.05=
.0300-r0.0) [version-going-backwards]
psqlodbc-09.05.0300: Package version for package psqlodbc-staticdev went ba=
ckwards which would break package feeds from (0:09.05.0300-r0.39 to 0:09.05=
.0300-r0.0) [version-going-backwards]
psqlodbc-09.05.0300: Package version for package psqlodbc went backwards wh=
ich would break package feeds from (0:09.05.0300-r0.32 to 0:09.05.0300-r0.0=
) [version-going-backwards]
psqlodbc-09.05.0300: Package version for package psqlodbc went backwards wh=
ich would break package feeds from (0:09.05.0300-r0.38 to 0:09.05.0300-r0.0=
) [version-going-backwards]
psqlodbc-09.05.0300: Package version for package psqlodbc went backwards wh=
ich would break package feeds from (0:09.05.0300-r0.39 to 0:09.05.0300-r0.0=
) [version-going-backwards]


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
1ca2eec cooker: clear extra config settings and remote datastores on client=
 disconnect
not included in master yet:=20
fbcc4d6 world-image: add extra target
3e32f80 fetch2: Allow Fetch.download() to warn instead of error

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
cc319b6 mesa-gl: Fix build after recent mesa PACKAGECONFIG changes
not included in master yet:=20
ae7fe8a report-error: Allow to upload reports automatically
bba20cb buildhistory.bbclass: metadata-revs show repo parent
2ab075c metadata-revs: provide more information
d8bffe1 qemux86: Add identical qemux86copy variant for tests
e1d5fbf reproducible_build.bbclass: initial support for binary reproducibil=
ity
41bef84 cpio: provide cpio-replacement-native
9afb603 image_types.bbclass: improve cpio image reproducibility
847937b rootfs-postcommands.bbclass: support binary reproducibility
6b26861 insane.bbclass: write QA issues to log file only when they are in E=
RROR_QA or WARN_QA
0749360 sstate.bbclass: Do not cause build failures due to setscene errors

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
e5681e1 layer.conf: remove FREESMARTPHONE_GIT variable
not included in master yet:=20
10bace9 dnsmasq: disable the service by default
4f93985 rdate: Fix build with hardening
e5c886b strongswan: Include stdint.h for uintptr_t
4677c6a netkit-rpc: Fix build with hardening flags
c8efb3c netkit-telnet: Fix build with hardening
76662d3 ncftp: Upgrade to 3.2.6
53c064f autofs: Add build dependency on libnsl2
8e943f5 openhpi: Fix build on 64bit platforms e.g. aarch64
da43327 security_flags.inc: Delete
2194ffc pptp-linux: Upgrade to 1.9.0
3426784 ebtables: replace ebtables-save perl script with bash rewrite
a9a8724 pimd: Upgrade to 2.3.2
f131a95 igmpproxy: Include missing sys/tupes.h and define _GNU_SOURCE
e7c14f4 rdate: Define logwtmp if libc !=3D glibc
ec9e308 netkit-ftp: Include sys/types.h for u_long definition
066a9c7 postfix: Disable nis support on musl
8da3ce9 zeroconf: Fix build with musl
9c2d01f ippool: Fix build errors found with hardening flags
fff054d openflow: Fix build with musl
25d61ba xl2tpd: Update to 1.3.9
51b1378 c-ares: update 1.12.0 -&gt; 1.13.0
f636b27 radvd: 2.14 -&gt; 2.17
82bf544 libesmtp: Fix config.h define for snprintf detection
4cb7315 drbd: Add recipe
6aa8077 net-snmp: fix engineBoots value on SIGHUP
b270230 openl2tp: add LGPL-2.1 license
fb9b74b openl2tp: add init script and systemd support
4d7fd49 ntop: add new recipe
650c226 libtdb: update 1.3.12 -&gt; 1.3.14
bc2ecf9 ndisc6: Upgrade to 1.0.3
60b2801 memcached: Update to 1.5.0
ab22cc4 tcpdump: remove unnecessary patch
424e6e6 squid: Add missing dependencies on openssl expat and libxml2
07e09c6 postfix: Upgrade to 3.2.2
8ef3e24 freeradius: Upgrade to 3.0.15
37e3ccd tcpdump: update to 4.9.1 to fix CVE-2017-11108
ebff0aa wireshark: 2.2.7 -&gt; 2.2.8
d95f6b1 krb5: fix CVE-2017-11368
4b71e13 quagga: update to 1.2.1
346ae75 openvpn: 2.4.2 -&gt; 2.4.3
d1cf702 ipsec-tools: fix CVE-2016-10396
1b793a9 netcf: upgrade to latest 0.2.8
87377c8 tftp-hpa: add systemd unit files
b04d96c openconnect: fix parallel compilation failure
20c367e openconnect: upgrade to 7.08
6b1cd36 ndisc6: specify target location of perl
053e2cd wireguard-tools: Add bash to rdeps
e4a15f9 openl2tp: Add bash to rdeps
42116f6 squid: Disable format-truncation warning only with gcc
2cb8fcb squid: Fix QA errors about wrong perl interpreter
08f0852 wireguard: Upgrade to 20170810 snapshot
ba3a771 ippool: Fix build errors found by clang
ba00b39 iscsitarget: Fix kernel with new 4.12+ kernel
3267d6d postfix: Fix build with security flags and clang
e8f4c41 openhpi: Fix build with clang+c++11
64030b1 openhpi: Fix ptest compile failures due to narrowing warnings with =
clang
96f8322 tcpreplay: upgrade to 4.2.6
78433db tftp-hpa: Fix PIE build with clang
d2e0096 samba: 4.6.5 -&gt; 4.6.7
1fc6436 wolfssl: upgrade to 3.12.0
c6bf516 netperf: upgrade to 2.7.0+ with git version
2624ca3 json-spirit: link to libatomic
907da25 librcf: link to libatomic
33f5af8 ntop: Fix build with musl
02ac394 corosync: Fix build with musl
88d3bbf netkit-rwho: Fix build with musl
ec4305b netkit-tftp: Fix build with musl
6d3a59a serial-forward: Fix build with hardening+musl
f71212d gsoap: Fix build with musl
7b54903 libpwquality: fix do_qa_configure issue
5171cff drbd-utils: only rmmod if DRBD is a module
b022240 libgphoto2: Copy <a href=3D"http://Makefile.in.in">Makefile.in.in</=
a> from gettext-native
ef87d81 lxdm: Copy <a href=3D"http://Makefile.in.in">Makefile.in.in</a> fro=
m gettext-native
85fb730 mosquitto: add from meta-intel-iot-middleware and update
d2eabf8 paho-mqtt-c: add recipe from meta-intel-iot-middleware and update
63fb151 iptraf-ng: Add new recipe
62bff08 sblim-sfcb: Fix build with musl
eeeec50 libmtp: fix build issue
5602afe libexecinfo: fix complie issue
336297c pmtools: use update-alternatives for acpixtract
4f94470 openjpeg: upgrade to 2.2.0
7f47d47 vpnc: Reduce lifetime value to widely-compatible value
6bd0135 pam-ssh-agent-auth: Get newer version of config.sub and config.gues=
s scripts
23cd1a5 python-matplotlib: Upgrade to 2.0.2
6f1ee9c wireshark: update to 2.2.9
7704781 gperftools: Fix build with musl
7b92849 mongodb: Disable for armv7 and fix build on musl
ede7768 open-vm-tools: Add -Wno-address-of-packed-member for with clang
392aa0d xfsprogs: Upgrade to 4.12.0
bde0fe7 tftp-hpa: Add HOMEPAGE info into recipe file.
c22dea3 cyrus-sasl: Add HOMEPAGE info into recipe file.
0ed9cde pps-tools: Add HOMEPAGE info into recipe file.
fed5f72 libjs-jquery: Add HOMEPAGE info into recipe file.
f2eada8 netkit-rpc: Link libtirpc on musl
e668879 ndisc6: Fix build with clang and update to latest on git
5110b4d psqlodbc: add recipe
baf375f python-networkx: add python-2to3 to RDEPENDS
01abeb9 protobuf-c: use git fetcher instead of github archives
1cb2de1 leveldb: Fix build with clang
41c1962 rsyslog: fix segfault after configuration errors
eac05cb logcheck: Add HOMEPAGE info into recipe file

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
2684299 qtwebengine: add patch for long paths
not included in master yet:=20
90d4a41 qtbase: Add OE clang specific mkspecs
ec80b09 qtbase: Fix build with musl/clang
be3c2d3 qtbase-native: set path to mkspec for cmake properly again

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
972cab7 gnome-settings-daemon: remove the bbappend for removed recipe
not included in master yet: <br></pre></div>

--001a114e5f08a4b1470558957966--
